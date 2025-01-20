@interface MapsRouteListViewController
+ (BOOL)wantsDefaultHeaderContentViews;
- (BOOL)_isForDisplayingUnavailableRoutes;
- (MapsRouteListViewController)initWithAvailableRoutes:(id)a3 unavailableRoutes:(id)a4 isAllSavedRoutes:(BOOL)a5;
- (double)heightForLayout:(unint64_t)a3;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)_routeDataForSection:(int64_t)a3;
- (id)routeData;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_deleteRouteData:(id)a3 completion:(id)a4;
- (void)_enterRouteCreation;
- (void)_presentUnavailableRoutesList;
- (void)_pressedCreate;
- (void)_pushSaveContaineeWithKeyboard:(BOOL)a3;
- (void)_showDeleteConfirmationAlertForRouteDate:(id)a3 withCompletion:(id)a4;
- (void)_updateContent;
- (void)_updateCreationButtons;
- (void)_updateEmptyState;
- (void)_updatedSavedRoutes:(id)a3;
- (void)_userInterfaceStyleDidChange;
- (void)cell:(id)a3 didSelectDeleteRouteData:(id)a4;
- (void)cell:(id)a3 didSelectDirectionsRouteData:(id)a4;
- (void)cell:(id)a3 didSelectDownloadRouteData:(id)a4;
- (void)cell:(id)a3 didSelectEditRouteData:(id)a4;
- (void)cell:(id)a3 didSelectViewMoreNotesForRouteData:(id)a4;
- (void)dealloc;
- (void)didBecomeCurrent;
- (void)emptyStateCreateButtonTapped:(id)a3;
- (void)popContainee;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)valueChangedForGEOConfigKey:(id)a3;
- (void)viewDidLoad;
@end

@implementation MapsRouteListViewController

- (MapsRouteListViewController)initWithAvailableRoutes:(id)a3 unavailableRoutes:(id)a4 isAllSavedRoutes:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v20.receiver = self;
  v20.super_class = (Class)MapsRouteListViewController;
  v10 = [(MapsRouteListViewController *)&v20 initWithNibName:0 bundle:0];
  v11 = v10;
  if (v10)
  {
    v12 = [(ContaineeViewController *)v10 cardPresentationController];
    [v12 setPresentedModally:1];

    v13 = [(ContaineeViewController *)v11 cardPresentationController];
    [v13 setTakesAvailableHeight:1];

    v14 = [(ContaineeViewController *)v11 cardPresentationController];
    [v14 setHideGrabber:1];

    v15 = (NSMutableArray *)[v8 mutableCopy];
    routesData = v11->_routesData;
    v11->_routesData = v15;

    v17 = (NSMutableArray *)[v9 mutableCopy];
    unavailableRoutes = v11->_unavailableRoutes;
    v11->_unavailableRoutes = v17;

    v11->_isAllSavedRoutes = a5;
  }

  return v11;
}

- (void)dealloc
{
  GEOConfigRemoveDelegateListenerForAllKeys();
  v3.receiver = self;
  v3.super_class = (Class)MapsRouteListViewController;
  [(MapsRouteListViewController *)&v3 dealloc];
}

+ (BOOL)wantsDefaultHeaderContentViews
{
  return 1;
}

- (void)viewDidLoad
{
  v74.receiver = self;
  v74.super_class = (Class)MapsRouteListViewController;
  [(ContaineeViewController *)&v74 viewDidLoad];
  objc_super v3 = [(MapsRouteListViewController *)self view];
  [v3 setAccessibilityIdentifier:@"RouteLibraryView"];

  v4 = +[UIColor clearColor];
  v5 = [(MapsRouteListViewController *)self view];
  [v5 setBackgroundColor:v4];

  v6 = [(ContaineeViewController *)self headerView];
  [v6 setAccessibilityIdentifier:@"RouteLibraryHeader"];
  LODWORD(v4) = [(MapsRouteListViewController *)self _isForDisplayingUnavailableRoutes];
  v7 = +[NSBundle mainBundle];
  id v8 = v7;
  if (v4) {
    CFStringRef v9 = @"[RouteCreation] Unavailable Route Library Title";
  }
  else {
    CFStringRef v9 = @"[RouteCreation] Route Library Title";
  }
  uint64_t v10 = [v7 localizedStringForKey:v9 value:@"localized string not found" table:0];

  v73 = (void *)v10;
  uint64_t v11 = +[LibraryUIUtilities iOSNavbarTitleButtonItemWithTitle:v10];
  v12 = +[LibraryUIUtilities closeButtonItemWithTarget:self action:"handleDismissAction:"];
  objc_storeStrong((id *)&self->_closeItem, v12);
  v13 = [MapsAddButton alloc];
  v14 = +[NSBundle mainBundle];
  v15 = [v14 localizedStringForKey:@"[RouteCreation] Route Library Create" value:@"localized string not found" table:0];
  v16 = [(MapsAddButton *)v13 initWithTitle:v15];

  [(MapsAddButton *)v16 addTarget:self action:"_pressedCreate" forControlEvents:64];
  v71 = v16;
  id v17 = [objc_alloc((Class)UIBarButtonItem) initWithCustomView:v16];
  objc_storeStrong((id *)&self->_createItem, v17);
  v72 = v12;
  v70 = v17;
  if ([(MapsRouteListViewController *)self _isForDisplayingUnavailableRoutes])
  {
    v79 = v12;
    v18 = &v79;
    uint64_t v19 = 1;
  }
  else
  {
    v78[0] = v12;
    v78[1] = v17;
    v18 = (void **)v78;
    uint64_t v19 = 2;
  }
  v68 = +[NSArray arrayWithObjects:v18 count:v19];
  objc_super v20 = (UINavigationItem *)[objc_alloc((Class)UINavigationItem) initWithTitle:&stru_101324E70];
  uint64_t v77 = v11;
  v21 = +[NSArray arrayWithObjects:&v77 count:1];
  [(UINavigationItem *)v20 setLeftBarButtonItems:v21];

  [(UINavigationItem *)v20 setRightBarButtonItems:v68];
  navItem = self->_navItem;
  self->_navItem = v20;
  v69 = v20;

  v23 = (UINavigationBar *)objc_opt_new();
  [(UINavigationBar *)v23 setTranslatesAutoresizingMaskIntoConstraints:0];
  v24 = [(UINavigationBar *)v23 standardAppearance];
  [v24 configureWithTransparentBackground];

  [(UINavigationBar *)v23 pushNavigationItem:v69 animated:0];
  navBar = self->_navBar;
  self->_navBar = v23;
  v26 = v23;

  [v6 addSubview:v26];
  v27 = (_TtC4Maps14EmptyStateView *)objc_opt_new();
  emptyState = self->_emptyState;
  self->_emptyState = v27;

  [(EmptyStateView *)self->_emptyState setAccessibilityIdentifier:@"EmptyStateView"];
  [(EmptyStateView *)self->_emptyState setTranslatesAutoresizingMaskIntoConstraints:0];
  v29 = +[UIImage _systemImageNamed:@"location.bottomleft.forward.to.point.topright.scurvepath"];
  [(EmptyStateView *)self->_emptyState setImage:v29];

  v30 = [objc_alloc((Class)UITableView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  tableView = self->_tableView;
  self->_tableView = v30;

  [(UITableView *)self->_tableView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UITableView *)self->_tableView setDataSource:self];
  [(UITableView *)self->_tableView setDelegate:self];
  v32 = self->_tableView;
  uint64_t v33 = objc_opt_class();
  v34 = (objc_class *)objc_opt_class();
  v35 = NSStringFromClass(v34);
  [(UITableView *)v32 registerClass:v33 forCellReuseIdentifier:v35];

  v36 = self->_tableView;
  uint64_t v37 = objc_opt_class();
  v38 = (objc_class *)objc_opt_class();
  v39 = NSStringFromClass(v38);
  [(UITableView *)v36 registerClass:v37 forCellReuseIdentifier:v39];

  id v40 = [objc_alloc((Class)UIView) initWithFrame:0.0, 0.0, 0.0, 2.22507386e-308];
  [(UITableView *)self->_tableView setTableHeaderView:v40];

  v41 = +[UIColor clearColor];
  [(UITableView *)self->_tableView setBackgroundColor:v41];

  -[UITableView setSeparatorInset:](self->_tableView, "setSeparatorInset:", 0.0, 96.0, 0.0, 0.0);
  v42 = [(ContaineeViewController *)self contentView];
  [v42 setAccessibilityIdentifier:@"RouteLibraryContentView"];

  [(UITableView *)self->_tableView setAccessibilityIdentifier:@"RouteLibraryTableView"];
  v64 = [(UINavigationBar *)v26 topAnchor];
  v63 = [v6 topAnchor];
  +[LibraryUIUtilities NavBarChromeHeaderTopYOffset];
  v62 = [v64 constraintEqualToAnchor:v63];
  v76[0] = v62;
  v43 = v26;
  v61 = [(UINavigationBar *)v26 leadingAnchor];
  v44 = [v6 leadingAnchor];
  v45 = [v61 constraintEqualToAnchor:v44];
  v76[1] = v45;
  v46 = v43;
  v65 = v43;
  v47 = [(UINavigationBar *)v43 trailingAnchor];
  v48 = [v6 trailingAnchor];
  [v47 constraintEqualToAnchor:v48];
  v49 = v67 = (void *)v11;
  v76[2] = v49;
  v50 = [(UINavigationBar *)v46 bottomAnchor];
  v51 = [v6 bottomAnchor];
  [v50 constraintEqualToAnchor:v51];
  v52 = v66 = v6;
  v76[3] = v52;
  v53 = +[NSArray arrayWithObjects:v76 count:4];
  +[NSLayoutConstraint activateConstraints:v53];

  uint64_t v75 = objc_opt_class();
  v54 = +[NSArray arrayWithObjects:&v75 count:1];
  id v55 = [(MapsRouteListViewController *)self registerForTraitChanges:v54 withTarget:self action:"_userInterfaceStyleDidChange"];

  [(MapsRouteListViewController *)self _updateContent];
  [(MapsRouteListViewController *)self _updateCreationButtons];
  v56 = +[NSNotificationCenter defaultCenter];
  [v56 addObserver:self selector:"_updatedSavedRoutes:" name:@"MapsSavedRoutesDidUpdateNotification" object:0];

  v57 = +[NSNotificationCenter defaultCenter];
  [v57 addObserver:self selector:"_updateCreationButtons" name:@"UsingOfflineMapsStateChangedNotification" object:0];

  v58 = +[NSNotificationCenter defaultCenter];
  [v58 addObserver:self selector:"_updatedSavedRoutes:" name:MURouteSnapshotManagerDidPurgeNotification object:0];

  _GEOConfigAddDelegateListenerForKey();
  v59 = +[MKMapService sharedService];
  v60 = +[NSString stringWithFormat:@"%ld", [(NSMutableArray *)self->_routesData count]];

  [v59 captureUserAction:21 onTarget:135 eventValue:v60];
}

- (void)didBecomeCurrent
{
  v3.receiver = self;
  v3.super_class = (Class)MapsRouteListViewController;
  [(ContaineeViewController *)&v3 didBecomeCurrent];
  [(UITableView *)self->_tableView reloadData];
}

- (void)_updatedSavedRoutes:(id)a3
{
  id v4 = a3;
  if (self->_isAllSavedRoutes)
  {
    objc_initWeak(&location, self);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100CE3110;
    v5[3] = &unk_101321568;
    objc_copyWeak(&v6, &location);
    +[MapsSavedRoutesManager fetchSavedRoutesWithType:3 completion:v5];
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

- (void)_updateContent
{
  if (self->_isAllSavedRoutes && ![(NSMutableArray *)self->_routesData count])
  {
    [(MapsRouteListViewController *)self _updateCreationButtons];
    [(MapsRouteListViewController *)self _updateEmptyState];
    [(UITableView *)self->_tableView removeFromSuperview];
    v15 = [(ContaineeViewController *)self contentView];
    [v15 addSubview:self->_emptyState];

    v18 = [(EmptyStateView *)self->_emptyState centerXAnchor];
    v25 = [(ContaineeViewController *)self contentView];
    v24 = [v25 centerXAnchor];
    v23 = [v18 constraintEqualToAnchor:];
    v27[0] = v23;
    v16 = [(EmptyStateView *)self->_emptyState centerYAnchor];
    v21 = [(ContaineeViewController *)self contentView];
    objc_super v20 = [v21 safeAreaLayoutGuide];
    [v20 centerYAnchor];
    uint64_t v19 = v22 = v16;
    id v6 = [v16 constraintEqualToAnchor:];
    v27[1] = v6;
    v7 = [(EmptyStateView *)self->_emptyState leadingAnchor];
    id v8 = [(ContaineeViewController *)self contentView];
    CFStringRef v9 = [v8 leadingAnchor];
    uint64_t v10 = [v7 constraintGreaterThanOrEqualToAnchor:v9 constant:16.0];
    v27[2] = v10;
    uint64_t v11 = [(EmptyStateView *)self->_emptyState trailingAnchor];
    v12 = [(ContaineeViewController *)self contentView];
    v13 = [v12 trailingAnchor];
    v14 = [v11 constraintLessThanOrEqualToAnchor:v13 constant:16.0];
    v27[3] = v14;
    id v17 = +[NSArray arrayWithObjects:v27 count:4];
    +[NSLayoutConstraint activateConstraints:v17];

    id v4 = v18;
  }
  else
  {
    [(MapsRouteListViewController *)self _updateCreationButtons];
    [(EmptyStateView *)self->_emptyState removeFromSuperview];
    objc_super v3 = [(ContaineeViewController *)self contentView];
    [v3 addSubview:self->_tableView];

    id v4 = [(UITableView *)self->_tableView topAnchor];
    v25 = [(ContaineeViewController *)self contentView];
    v24 = [v25 topAnchor];
    v23 = [v4 constraintEqualToAnchor:];
    v26[0] = v23;
    v5 = [(UITableView *)self->_tableView leadingAnchor];
    v21 = [(ContaineeViewController *)self contentView];
    [v21 leadingAnchor];
    objc_super v20 = v22 = v5;
    uint64_t v19 = [v5 constraintEqualToAnchor:];
    v26[1] = v19;
    id v6 = [(UITableView *)self->_tableView trailingAnchor];
    v7 = [(ContaineeViewController *)self contentView];
    id v8 = [v7 trailingAnchor];
    CFStringRef v9 = [v6 constraintEqualToAnchor:v8];
    v26[2] = v9;
    uint64_t v10 = [(UITableView *)self->_tableView bottomAnchor];
    uint64_t v11 = [(ContaineeViewController *)self contentView];
    v12 = [v11 bottomAnchor];
    v13 = [v10 constraintEqualToAnchor:v12];
    v26[3] = v13;
    v14 = +[NSArray arrayWithObjects:v26 count:4];
    +[NSLayoutConstraint activateConstraints:v14];
  }
}

- (void)_updateCreationButtons
{
  int BOOL = GEOConfigGetBOOL();
  id v4 = +[MapsOfflineUIHelper sharedHelper];
  unsigned int v5 = [v4 isUsingOfflineMaps];

  int v6 = v5 | BOOL ^ 1;
  if ([(NSMutableArray *)self->_routesData count])
  {
    if (v6)
    {
      closeItem = self->_closeItem;
      v7 = +[NSArray arrayWithObjects:&closeItem count:1];
    }
    else
    {
      createItem = self->_createItem;
      v16[0] = self->_closeItem;
      v16[1] = createItem;
      v7 = +[NSArray arrayWithObjects:v16 count:2];
    }
    [(UINavigationItem *)self->_navItem setRightBarButtonItems:v7];
    goto LABEL_8;
  }
  v15 = self->_closeItem;
  id v8 = +[NSArray arrayWithObjects:&v15 count:1];
  [(UINavigationItem *)self->_navItem setRightBarButtonItems:v8];

  emptyState = self->_emptyState;
  if (v6)
  {
    [(EmptyStateView *)emptyState setButton:0];
    return;
  }
  uint64_t v11 = [(EmptyStateView *)emptyState button];

  if (!v11)
  {
    v12 = [MapsAddButton alloc];
    v13 = +[NSBundle mainBundle];
    v14 = [v13 localizedStringForKey:@"[RouteCreation] Route Library Create Route" value:@"localized string not found" table:0];
    v7 = [(MapsAddButton *)v12 initWithTitle:v14];

    [(MapsAddButton *)v7 addTarget:self action:"emptyStateCreateButtonTapped:" forControlEvents:64];
    [(MapsAddButton *)v7 setAccessibilityIdentifier:@"CardButtonActionButton"];
    [(EmptyStateView *)self->_emptyState setButton:v7];
LABEL_8:
  }
}

- (void)_enterRouteCreation
{
  objc_super v3 = +[MKMapService sharedService];
  [v3 captureUserAction:465 onTarget:135 eventValue:0];

  id v4 = [(MapsRouteListViewController *)self view];
  unsigned int v5 = [v4 window];
  int v6 = [v5 windowScene];
  v7 = [v6 delegate];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;

  id v10 = [v9 appCoordinator];

  [v10 enterRouteCreationWithRoute:0 originMapItem:0 destinationMapItem:0 userInfo:0 completion:0];
}

- (void)_userInterfaceStyleDidChange
{
}

- (void)_pressedCreate
{
  objc_super v3 = sub_10057683C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    unsigned int v5 = "-[MapsRouteListViewController _pressedCreate]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v4, 0xCu);
  }

  [(MapsRouteListViewController *)self _enterRouteCreation];
}

- (void)emptyStateCreateButtonTapped:(id)a3
{
  int v4 = sub_10057683C();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315138;
    int v6 = "-[MapsRouteListViewController emptyStateCreateButtonTapped:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v5, 0xCu);
  }

  [(MapsRouteListViewController *)self _enterRouteCreation];
}

- (void)_updateEmptyState
{
  if ([(NSMutableArray *)self->_unavailableRoutes count])
  {
    objc_super v3 = +[NSBundle mainBundle];
    int v4 = [v3 localizedStringForKey:@"[RouteCreation] Route Library Unavailable Routes" value:@"localized string not found" table:0];
    [(EmptyStateView *)self->_emptyState setDisclosureTitle:v4];

    int v5 = +[NSString localizedStringWithFormat:@"%lu", [(NSMutableArray *)self->_unavailableRoutes count]];
    [(EmptyStateView *)self->_emptyState setDisclosureSubtitle:v5];

    objc_initWeak(&location, self);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100CE3D44;
    v15[3] = &unk_1012E6708;
    objc_copyWeak(&v16, &location);
    [(EmptyStateView *)self->_emptyState setDisclosureAction:v15];
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  else
  {
    [(EmptyStateView *)self->_emptyState setDisclosureTitle:0];
    [(EmptyStateView *)self->_emptyState setDisclosureSubtitle:0];
    [(EmptyStateView *)self->_emptyState setDisclosureAction:0];
  }
  int BOOL = GEOConfigGetBOOL();
  v7 = +[NSBundle mainBundle];
  id v8 = v7;
  if (BOOL)
  {
    id v9 = [v7 localizedStringForKey:@"[RouteCreation] Route Library Empty Title" value:@"localized string not found" table:0];
    [(EmptyStateView *)self->_emptyState setTitle:v9];

    id v10 = +[NSBundle mainBundle];
    uint64_t v11 = v10;
    CFStringRef v12 = @"[RouteCreation] Route Library Empty Detail";
  }
  else
  {
    v13 = [v7 localizedStringForKey:@"[RouteCreation] Route Library Empty Unavailable Title" value:@"localized string not found" table:0];
    [(EmptyStateView *)self->_emptyState setTitle:v13];

    id v10 = +[NSBundle mainBundle];
    uint64_t v11 = v10;
    CFStringRef v12 = @"[RouteCreation] Route Library Empty Unavailable Detail";
  }
  v14 = [v10 localizedStringForKey:v12 value:@"localized string not found" table:0];
  [(EmptyStateView *)self->_emptyState setSubtitle:v14];
}

- (void)_presentUnavailableRoutesList
{
  int v5 = [[MapsRouteListViewController alloc] initWithAvailableRoutes:0 unavailableRoutes:self->_unavailableRoutes isAllSavedRoutes:0];
  objc_super v3 = [(ContaineeViewController *)self containeeDelegate];
  [(ContaineeViewController *)v5 setContaineeDelegate:v3];

  int v4 = [(ContaineeViewController *)self cardPresentationController];
  [v4 presentViewController:v5 animated:1 completion:0];
}

- (BOOL)_isForDisplayingUnavailableRoutes
{
  return !self->_routesData && [(NSMutableArray *)self->_unavailableRoutes count] != 0;
}

- (id)_routeDataForSection:(int64_t)a3
{
  BOOL v4 = a3 != 0;
  unsigned int v5 = [(MapsRouteListViewController *)self _isForDisplayingUnavailableRoutes];
  uint64_t v6 = v4;
  if (v5) {
    uint64_t v6 = 1;
  }
  v7 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR___MapsRouteListViewController__routesData[v6]);

  return v7;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  if (!self->_routesData) {
    return 1;
  }
  if ([(NSMutableArray *)self->_unavailableRoutes count]) {
    return 2;
  }
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6 = a3;
  if (a4 != 1)
  {
    if (a4)
    {
      id v8 = sub_1005762E4();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        int v12 = 136315650;
        v13 = "-[MapsRouteListViewController tableView:numberOfRowsInSection:]";
        __int16 v14 = 2080;
        v15 = "MapsRouteListViewController.m";
        __int16 v16 = 1024;
        int v17 = 401;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", (uint8_t *)&v12, 0x1Cu);
      }

      if (sub_100BB36BC())
      {
        id v9 = sub_1005762E4();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          id v10 = +[NSThread callStackSymbols];
          int v12 = 138412290;
          v13 = v10;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v12, 0xCu);
        }
      }
      a4 = 0;
    }
    else
    {
      v7 = [(MapsRouteListViewController *)self _routeDataForSection:0];
      a4 = (int64_t)[v7 count];
    }
  }

  return a4;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = -[MapsRouteListViewController _routeDataForSection:](self, "_routeDataForSection:", [v7 section]);
  id v9 = [v7 section];
  if (v9 == (id)1)
  {
    v23 = (objc_class *)objc_opt_class();
    v24 = NSStringFromClass(v23);
    int v12 = [v6 dequeueReusableCellWithIdentifier:v24];

    [v12 setAccessoryType:1];
    v13 = +[UIListContentConfiguration valueCellConfiguration];
    v25 = +[UIColor secondaryLabelColor];
    v26 = [v13 secondaryTextProperties];
    [v26 setColor:v25];

    v27 = +[NSBundle mainBundle];
    v28 = [v27 localizedStringForKey:@"[RouteCreation] Route Library Unavailable Routes" value:@"localized string not found" table:0];
    [v13 setText:v28];

    v29 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", @"%lu", [v8 count]);
    [v13 setSecondaryText:v29];

    [v12 setContentConfiguration:v13];
    v30 = +[UIBackgroundConfiguration listCellConfiguration];
    [v30 setCornerRadius:10.0];
    [v12 setBackgroundConfiguration:v30];
  }
  else if (v9)
  {
    v31 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v31);
    int v12 = [v6 dequeueReusableCellWithIdentifier:v13];
  }
  else
  {
    id v10 = (objc_class *)objc_opt_class();
    uint64_t v11 = NSStringFromClass(v10);
    int v12 = [v6 dequeueReusableCellWithIdentifier:v11];

    v13 = [v8 objectAtIndexedSubscript:[v7 row]];
    __int16 v14 = [v6 traitCollection];
    id v15 = [v14 userInterfaceStyle];
    [v6 frame];
    [v12 setRouteData:v13 delegate:self userInterfaceStyle:v15 inWidth:v16];

    int v17 = [v6 window];
    v18 = [v17 screen];
    [v18 scale];
    double v20 = v19;
    v21 = [v6 traitCollection];
    [v12 setSnapshotWithRouteData:v13 userInterfaceStyle:[v21 userInterfaceStyle] scale:v20];

    if ([(MapsRouteListViewController *)self _isForDisplayingUnavailableRoutes]) {
      uint64_t v22 = 0;
    }
    else {
      uint64_t v22 = 3;
    }
    [v12 setSelectionStyle:v22];
  }

  return v12;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  if (a4
    || ![(MapsRouteListViewController *)self _isForDisplayingUnavailableRoutes])
  {
    unsigned int v5 = 0;
  }
  else
  {
    BOOL v4 = +[NSBundle mainBundle];
    unsigned int v5 = [v4 localizedStringForKey:@"[RouteCreation] Route Library Unavailable Message" value:@"localized string not found" table:0];
  }

  return v5;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return UITableViewAutomaticDimension;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v6 deselectRowAtIndexPath:v7 animated:1];
  if (![(MapsRouteListViewController *)self _isForDisplayingUnavailableRoutes])
  {
    id v8 = [v7 section];
    if (v8 == (id)1)
    {
      [(MapsRouteListViewController *)self _presentUnavailableRoutesList];
    }
    else if (!v8)
    {
      id v9 = -[NSMutableArray objectAtIndexedSubscript:](self->_routesData, "objectAtIndexedSubscript:", [v7 row]);
      id v10 = sub_10057683C();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v33 = "-[MapsRouteListViewController tableView:didSelectRowAtIndexPath:]";
        __int16 v34 = 2112;
        v35 = v9;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
      }

      id v11 = [objc_alloc((Class)GEORouteBuilder_PersistentData) initWithPersistentData:v9];
      int v12 = [v11 buildRoute];
      v13 = [(MapsRouteListViewController *)self _maps_platformController];
      __int16 v14 = [v13 chromeViewController];
      id v15 = [v14 currentTraits];
      double v16 = v15;
      if (v15) {
        id v17 = v15;
      }
      else {
        id v17 = (id)objc_opt_new();
      }
      v18 = v17;

      objc_initWeak((id *)buf, self);
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_100CE47EC;
      v28[3] = &unk_1013215E0;
      objc_copyWeak(&v31, (id *)buf);
      id v19 = v12;
      id v29 = v19;
      id v20 = v9;
      id v30 = v20;
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_100CE48B4;
      v24[3] = &unk_101321590;
      objc_copyWeak(&v27, (id *)buf);
      id v25 = v6;
      id v26 = v7;
      id v21 = [v19 _maps_convertToNavigableRouteWithTraits:v18 errorHandler:v28 completionHandler:v24];
      uint64_t v22 = +[MKMapService sharedService];
      v23 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%llu", [v20 mapItemMuid]);
      [v22 captureUserAction:480 onTarget:135 eventValue:v23];

      objc_destroyWeak(&v27);
      objc_destroyWeak(&v31);
      objc_destroyWeak((id *)buf);
    }
  }
}

- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 section] == (id)1)
  {
    id v8 = 0;
  }
  else
  {
    objc_initWeak(&location, self);
    id v9 = +[NSBundle mainBundle];
    id v10 = [v9 localizedStringForKey:@"RowSwipe_Delete" value:@"localized string not found" table:0];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100CE4BC4;
    v14[3] = &unk_1012F53A0;
    objc_copyWeak(&v16, &location);
    id v15 = v7;
    id v11 = +[UIContextualAction contextualActionWithStyle:1 title:v10 handler:v14];
    v18 = v11;
    int v12 = +[NSArray arrayWithObjects:&v18 count:1];
    id v8 = +[UISwipeActionsConfiguration configurationWithActions:v12];

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }

  return v8;
}

- (void)cell:(id)a3 didSelectDeleteRouteData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_10057683C();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v16 = "-[MapsRouteListViewController cell:didSelectDeleteRouteData:]";
    __int16 v17 = 2112;
    id v18 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }

  id v9 = +[MKMapService sharedService];
  id v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%llu", [v7 mapItemMuid]);
  [v9 captureUserAction:479 onTarget:135 eventValue:v10];

  objc_initWeak((id *)buf, self);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100CE51D8;
  v12[3] = &unk_1012E6690;
  objc_copyWeak(&v14, (id *)buf);
  id v11 = v7;
  id v13 = v11;
  [(MapsRouteListViewController *)self _showDeleteConfirmationAlertForRouteDate:v11 withCompletion:v12];

  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)buf);
}

- (void)_showDeleteConfirmationAlertForRouteDate:(id)a3 withCompletion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [v6 userProvidedName];
  if ([v7 length]) {
    [v6 userProvidedName];
  }
  else {
  id v8 = [v6 routeName];
  }

  id v9 = +[NSBundle mainBundle];
  if (v8)
  {
    id v10 = [v9 localizedStringForKey:@"[Route Library] Delete Alert Message" value:@"localized string not found" table:0];
    id v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v10, v8);
  }
  else
  {
    id v11 = [v9 localizedStringForKey:@"[Route Library] Delete Alert Message No Name" value:@"localized string not found" table:0];
  }

  int v12 = +[UIAlertController alertControllerWithTitle:0 message:v11 preferredStyle:0];
  id v13 = [v12 view];
  [v13 setAccessibilityIdentifier:@"DeleteAlert"];

  id v14 = +[NSBundle mainBundle];
  id v15 = [v14 localizedStringForKey:@"[Route Library] Delete Option" value:@"localized string not found" table:0];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100CE5504;
  v22[3] = &unk_1012E6E08;
  id v23 = v5;
  id v16 = v5;
  __int16 v17 = +[UIAlertAction actionWithTitle:v15 style:2 handler:v22];

  [v17 setAccessibilityIdentifier:@"DeleteAction"];
  [v12 addAction:v17];
  id v18 = +[NSBundle mainBundle];
  id v19 = [v18 localizedStringForKey:@"[Route Library] Cancel Option" value:@"localized string not found" table:0];
  id v20 = +[UIAlertAction actionWithTitle:v19 style:1 handler:0];

  [v20 setAccessibilityIdentifier:@"CancelAction"];
  [v12 addAction:v20];
  [(MapsRouteListViewController *)self _maps_topMostPresentViewController:v12 animated:1 completion:0];
}

- (void)_deleteRouteData:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100CE5634;
  v10[3] = &unk_1012F4230;
  objc_copyWeak(&v13, &location);
  id v8 = v6;
  id v11 = v8;
  id v9 = v7;
  id v12 = v9;
  +[MapsSavedRoutesManager deleteRoute:v8 completion:v10];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (void)cell:(id)a3 didSelectViewMoreNotesForRouteData:(id)a4
{
  id v5 = (GEOComposedGeometryRoutePersistentData *)a4;
  id v6 = sub_10057683C();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315394;
    id v9 = "-[MapsRouteListViewController cell:didSelectViewMoreNotesForRouteData:]";
    __int16 v10 = 2112;
    id v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v8, 0x16u);
  }

  selectedRouteData = self->_selectedRouteData;
  self->_selectedRouteData = v5;

  [(MapsRouteListViewController *)self _pushSaveContaineeWithKeyboard:0];
}

- (void)cell:(id)a3 didSelectEditRouteData:(id)a4
{
  id v5 = (GEOComposedGeometryRoutePersistentData *)a4;
  id v6 = sub_10057683C();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315394;
    id v9 = "-[MapsRouteListViewController cell:didSelectEditRouteData:]";
    __int16 v10 = 2112;
    id v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v8, 0x16u);
  }

  selectedRouteData = self->_selectedRouteData;
  self->_selectedRouteData = v5;

  [(MapsRouteListViewController *)self _pushSaveContaineeWithKeyboard:1];
}

- (void)_pushSaveContaineeWithKeyboard:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(ContaineeViewController *)self containeeDelegate];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  id v9 = [[MapsSaveRouteContainee alloc] initWithDelegate:self isEditing:1 showInitialKeyboard:v3];
  int v8 = [v7 containerViewController];

  [v8 presentController:v9 animated:1];
}

- (void)cell:(id)a3 didSelectDirectionsRouteData:(id)a4
{
  id v6 = a3;
  id v7 = (char *)a4;
  int v8 = sub_10057683C();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v17 = "-[MapsRouteListViewController cell:didSelectDirectionsRouteData:]";
    __int16 v18 = 2112;
    id v19 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }

  if (self->_activeConversionRouteData)
  {
    id v9 = sub_10057683C();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      __int16 v17 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Ignoring menu option as there's already an active route conversion: %@", buf, 0xCu);
    }
  }
  else
  {
    objc_storeStrong((id *)&self->_activeConversionRouteData, a4);
    objc_initWeak((id *)buf, self);
    __int16 v10 = +[MKLocationManager sharedLocationManager];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100CE5CC8;
    v12[3] = &unk_1013121F0;
    objc_copyWeak(&v15, (id *)buf);
    id v13 = v7;
    id v14 = self;
    id v11 = [v10 singleLocationUpdateWithHandler:v12];

    [v11 start];
    objc_destroyWeak(&v15);
    objc_destroyWeak((id *)buf);
  }
}

- (void)cell:(id)a3 didSelectDownloadRouteData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = sub_10057683C();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[MapsRouteListViewController cell:didSelectDownloadRouteData:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }

  id v9 = [v7 boundingMapRegion];
  __int16 v10 = +[GEOMapRegion _maps_offlineDownloadRegionForRouteBounds:v9];

  id v11 = [v7 boundingMapRegion];
  id v12 = +[GEOMapRegion _maps_offlineCoverageRegionForRouteBounds:v11];

  if (v10 && v12)
  {
    id v13 = [(ContaineeViewController *)self containeeDelegate];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v14 = v13;
    }
    else {
      id v14 = 0;
    }
    id v15 = v14;

    id v16 = +[MapsOfflineUIHelper sharedHelper];
    __int16 v17 = [v16 subscriptionInfoForRegion:v12];

    if (v17)
    {
      [v15 viewControllerShowOfflineMaps:self];
    }
    else
    {
      id v30 = [objc_alloc((Class)GEORouteBuilder_PersistentData) initWithPersistentData:v7];
      id v29 = [v30 buildRoute];
      __int16 v18 = [v7 userProvidedName];
      if ([v18 length]) {
        [v7 userProvidedName];
      }
      else {
      v28 = [v7 routeName];
      }

      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      v36 = sub_100104510;
      uint64_t v37 = sub_100104AF8;
      id v19 = [(MapsRouteListViewController *)self iosBasedChromeViewController];
      id v38 = [v19 acquireHikingMapToken];

      id v20 = [(MapsRouteListViewController *)self iosChromeViewController];
      id v21 = [v20 mapView];
      uint64_t v22 = [v21 _mapLayer];
      unsigned __int8 v27 = [v22 applicationSubState];

      id v23 = [(MapsRouteListViewController *)self iosChromeViewController];
      v24 = [v23 mapView];
      id v25 = [v24 _mapLayer];
      [v25 setApplicationSubState:1];

      objc_initWeak(&location, self);
      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472;
      v31[2] = sub_100CE65F4;
      v31[3] = &unk_1012F5D60;
      v31[4] = buf;
      objc_copyWeak(&v32, &location);
      unsigned __int8 v33 = v27;
      LOBYTE(v26) = 1;
      [v15 viewController:self showOfflineMapRegionSelectorForRegion:v10 name:v28 route:v29 shouldUseSessionlessAnalytics:0 shouldShowDataManagementAfterDownload:0 shouldShowDataManagementAfterDownloadIfRegionDiffers:v26 dismissalBlock:v31];
      objc_destroyWeak(&v32);
      objc_destroyWeak(&location);
      _Block_object_dispose(buf, 8);
    }
  }
}

- (double)heightForLayout:(unint64_t)a3
{
  if (a3 - 3 > 2) {
    return -1.0;
  }
  BOOL v3 = [(ContaineeViewController *)self cardPresentationController];
  [v3 availableHeight];
  double v5 = v4;

  return v5;
}

- (id)routeData
{
  return self->_selectedRouteData;
}

- (void)popContainee
{
  v2 = [(ContaineeViewController *)self containeeDelegate];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    BOOL v3 = v2;
  }
  else {
    BOOL v3 = 0;
  }
  id v4 = v3;

  id v5 = [v4 containerViewController];

  [v5 popLastViewControllerAnimated:1];
}

- (void)valueChangedForGEOConfigKey:(id)a3
{
  if (a3.var0 == MapsConfig_RouteCreationAvailable && a3.var1 == off_1015F1498)
  {
    [(MapsRouteListViewController *)self _updateCreationButtons];
    [(MapsRouteListViewController *)self _updateEmptyState];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_emptyState, 0);
  objc_storeStrong((id *)&self->_navBar, 0);
  objc_storeStrong((id *)&self->_navItem, 0);
  objc_storeStrong((id *)&self->_closeItem, 0);
  objc_storeStrong((id *)&self->_createItem, 0);
  objc_storeStrong((id *)&self->_unavailableRoutes, 0);
  objc_storeStrong((id *)&self->_routesData, 0);
  objc_storeStrong((id *)&self->_activeConversionRouteData, 0);

  objc_storeStrong((id *)&self->_selectedRouteData, 0);
}

@end