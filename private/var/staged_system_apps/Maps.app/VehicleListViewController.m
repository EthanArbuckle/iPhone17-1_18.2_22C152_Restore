@interface VehicleListViewController
- (BOOL)_isIndexPathOfAddNewCarCell:(id)a3;
- (BOOL)_shouldShowManualAddCell;
- (BOOL)_shouldShowUnpairedVehicles;
- (NSArray)savedVehicles;
- (NSArray)unpairedVehicles;
- (VehicleListViewController)init;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)actionCoordinator;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_consumeUpdatedUnpairedVehicles:(id)a3;
- (void)_consumeUpdatedVirtualGarage:(id)a3;
- (void)_refreshSavedVehiclesStates;
- (void)_setupConstraints;
- (void)_updateVehicle:(id)a3 atIndex:(unint64_t)a4;
- (void)dealloc;
- (void)headerViewButtonTapped:(id)a3 buttonType:(unint64_t)a4;
- (void)setSavedVehicles:(id)a3;
- (void)setUnpairedVehicles:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)vehicleDetailViewController:(id)a3 deleteVehicle:(id)a4;
- (void)vehicleDetailViewController:(id)a3 saveVehicleEdit:(id)a4;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)virtualGarage:(id)a3 didUpdateUnpairedVehicles:(id)a4;
@end

@implementation VehicleListViewController

- (VehicleListViewController)init
{
  v15.receiver = self;
  v15.super_class = (Class)VehicleListViewController;
  v2 = [(VehicleListViewController *)&v15 initWithNibName:0 bundle:0];
  v3 = v2;
  if (v2)
  {
    v4 = [(ContaineeViewController *)v2 cardPresentationController];
    [v4 setPresentedModally:1];

    v5 = [(ContaineeViewController *)v3 cardPresentationController];
    [v5 setTakesAvailableHeight:1];

    v6 = +[VGVirtualGarageService sharedService];
    [v6 registerObserver:v3];

    objc_initWeak(&location, v3);
    v7 = +[VGVirtualGarageService sharedService];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1008B7548;
    v12[3] = &unk_1012E65A8;
    objc_copyWeak(&v13, &location);
    [v7 virtualGarageGetGarageWithReply:v12];

    v8 = +[VGVirtualGarageService sharedService];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1008B763C;
    v10[3] = &unk_1012E6E78;
    objc_copyWeak(&v11, &location);
    [v8 virtualGarageGetListOfUnpairedVehiclesWithReply:v10];

    objc_destroyWeak(&v11);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  return v3;
}

- (void)dealloc
{
  v3 = +[VGVirtualGarageService sharedService];
  [v3 unregisterObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)VehicleListViewController;
  [(VehicleListViewController *)&v4 dealloc];
}

- (void)viewDidLoad
{
  v29.receiver = self;
  v29.super_class = (Class)VehicleListViewController;
  [(ContaineeViewController *)&v29 viewDidLoad];
  v3 = [(VehicleListViewController *)self view];
  [v3 setAccessibilityIdentifier:@"VehicleListView"];

  objc_super v4 = +[UIColor clearColor];
  v5 = [(VehicleListViewController *)self view];
  [v5 setBackgroundColor:v4];

  v6 = [(ContaineeViewController *)self headerView];
  uint64_t v7 = sub_1000BBB44(self);
  v8 = [ContainerHeaderView alloc];
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v12 = -[ContainerHeaderView initWithFrame:](v8, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  [(ContainerHeaderView *)v12 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(ContainerHeaderView *)v12 setDelegate:self];
  if (v7 == 5) {
    uint64_t v13 = 1;
  }
  else {
    uint64_t v13 = 2;
  }
  [(ContainerHeaderView *)v12 setHeaderSize:v13];
  v14 = +[NSBundle mainBundle];
  objc_super v15 = [v14 localizedStringForKey:@"[VirtualGarage] Vehicles" value:@"localized string not found" table:0];
  [(ContainerHeaderView *)v12 setTitle:v15];

  [(ContainerHeaderView *)v12 setHairLineAlpha:0.0];
  v16 = +[UIColor clearColor];
  [(ContainerHeaderView *)v12 setBackgroundColor:v16];

  [v6 addSubview:v12];
  titleHeaderView = self->_titleHeaderView;
  self->_titleHeaderView = v12;
  v18 = v12;

  v19 = [objc_alloc((Class)UITableView) initWithFrame:CGRectZero.origin.x, y, width, height];
  tableView = self->_tableView;
  self->_tableView = v19;

  [(UITableView *)self->_tableView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UITableView *)self->_tableView setAccessibilityIdentifier:@"VehicleListTableView"];
  LODWORD(v21) = 1148846080;
  [(UITableView *)self->_tableView setContentCompressionResistancePriority:0 forAxis:v21];
  LODWORD(v22) = 1148846080;
  [(UITableView *)self->_tableView setContentCompressionResistancePriority:1 forAxis:v22];
  id v23 = [objc_alloc((Class)UIView) initWithFrame:0.0, 0.0, 0.0, 2.22507386e-308];
  [(UITableView *)self->_tableView setTableHeaderView:v23];

  [(UITableView *)self->_tableView setDataSource:self];
  [(UITableView *)self->_tableView setDelegate:self];
  v24 = +[UIColor clearColor];
  [(UITableView *)self->_tableView setBackgroundColor:v24];

  v25 = self->_tableView;
  uint64_t v26 = objc_opt_class();
  v27 = +[VehicleCell reuseIdentifier];
  [(UITableView *)v25 registerClass:v26 forCellReuseIdentifier:v27];

  [(UITableView *)self->_tableView registerClass:objc_opt_class() forCellReuseIdentifier:@"kAddNewCarCellIdentifier"];
  [(UITableView *)self->_tableView registerClass:objc_opt_class() forCellReuseIdentifier:@"kOnboardingCellIdentifier"];
  v28 = [(ContaineeViewController *)self contentView];
  [v28 addSubview:self->_tableView];

  [(VehicleListViewController *)self _setupConstraints];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VehicleListViewController;
  -[ContaineeViewController viewWillAppear:](&v9, "viewWillAppear:");
  v5 = [(VehicleListViewController *)self traitCollection];
  id v6 = [v5 userInterfaceIdiom];

  if (!v6)
  {
    uint64_t v7 = +[UIApplication sharedMapsDelegate];
    [v7 setLockedOrientations:2];

    v8 = +[UIDevice currentDevice];
    [v8 setOrientation:1 animated:v3];
  }
  [(VehicleListViewController *)self _refreshSavedVehiclesStates];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)VehicleListViewController;
  [(ContaineeViewController *)&v7 viewWillDisappear:a3];
  objc_super v4 = [(VehicleListViewController *)self traitCollection];
  id v5 = [v4 userInterfaceIdiom];

  if (!v5)
  {
    id v6 = +[UIApplication sharedMapsDelegate];
    [v6 setLockedOrientations:0];
  }
}

- (void)_setupConstraints
{
  v34 = [(ContainerHeaderView *)self->_titleHeaderView topAnchor];
  v35 = [(ContaineeViewController *)self headerView];
  v33 = [v35 topAnchor];
  v32 = [v34 constraintEqualToAnchor:v33];
  v36[0] = v32;
  v30 = [(ContainerHeaderView *)self->_titleHeaderView leadingAnchor];
  v31 = [(ContaineeViewController *)self headerView];
  objc_super v29 = [v31 leadingAnchor];
  v28 = [v30 constraintEqualToAnchor:v29];
  v36[1] = v28;
  uint64_t v26 = [(ContainerHeaderView *)self->_titleHeaderView trailingAnchor];
  v27 = [(ContaineeViewController *)self headerView];
  v25 = [v27 trailingAnchor];
  v24 = [v26 constraintEqualToAnchor:v25];
  v36[2] = v24;
  double v22 = [(ContainerHeaderView *)self->_titleHeaderView bottomAnchor];
  id v23 = [(ContaineeViewController *)self headerView];
  double v21 = [v23 bottomAnchor];
  v20 = [v22 constraintEqualToAnchor:v21];
  v36[3] = v20;
  v18 = [(UITableView *)self->_tableView topAnchor];
  v19 = [(ContaineeViewController *)self contentView];
  v17 = [v19 topAnchor];
  v16 = [v18 constraintEqualToAnchor:v17];
  v36[4] = v16;
  v14 = [(UITableView *)self->_tableView leadingAnchor];
  objc_super v15 = [(ContaineeViewController *)self contentView];
  uint64_t v13 = [v15 leadingAnchor];
  BOOL v3 = [v14 constraintEqualToAnchor:v13];
  v36[5] = v3;
  objc_super v4 = [(UITableView *)self->_tableView trailingAnchor];
  id v5 = [(ContaineeViewController *)self contentView];
  id v6 = [v5 trailingAnchor];
  objc_super v7 = [v4 constraintEqualToAnchor:v6];
  v36[6] = v7;
  v8 = [(UITableView *)self->_tableView bottomAnchor];
  objc_super v9 = [(ContaineeViewController *)self contentView];
  v10 = [v9 bottomAnchor];
  id v11 = [v8 constraintEqualToAnchor:v10];
  v36[7] = v11;
  v12 = +[NSArray arrayWithObjects:v36 count:8];
  +[NSLayoutConstraint activateConstraints:v12];
}

- (void)setSavedVehicles:(id)a3
{
  id v5 = a3;
  p_savedVehicles = &self->_savedVehicles;
  id v7 = *p_savedVehicles;
  unint64_t v8 = (unint64_t)v5;
  if (v8 | (unint64_t)v7)
  {
    unsigned __int8 v9 = [v7 isEqual:v8];

    if ((v9 & 1) == 0)
    {
      v10 = sub_1000519B4();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        NSUInteger v11 = [(NSArray *)*p_savedVehicles count];
        id v12 = [(id)v8 count];
        id v13 = (id)v8;
        v14 = v13;
        if (v8)
        {
          if ([v13 count])
          {
            objc_super v15 = [v14 componentsJoinedByString:@", "];
            v16 = +[NSString stringWithFormat:@"<%p> [%@]", v14, v15];
          }
          else
          {
            v16 = +[NSString stringWithFormat:@"<%p> (empty)", v14];
          }
        }
        else
        {
          v16 = @"<nil>";
        }

        *(_DWORD *)buf = 134218498;
        NSUInteger v18 = v11;
        __int16 v19 = 2048;
        id v20 = v12;
        __int16 v21 = 2112;
        double v22 = v16;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "VehicleListVC - vehicles updated. count from: %lu to: %lu, detail: %@", buf, 0x20u);
      }
      objc_storeStrong((id *)p_savedVehicles, a3);
    }
  }
}

- (void)setUnpairedVehicles:(id)a3
{
  id v5 = a3;
  p_unpairedVehicles = &self->_unpairedVehicles;
  id v7 = *p_unpairedVehicles;
  unint64_t v8 = (unint64_t)v5;
  if (v8 | (unint64_t)v7)
  {
    unsigned __int8 v9 = [v7 isEqual:v8];

    if ((v9 & 1) == 0)
    {
      v10 = sub_1000519B4();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        NSUInteger v11 = [(NSArray *)*p_unpairedVehicles count];
        id v12 = [(id)v8 count];
        id v13 = (id)v8;
        v14 = v13;
        if (v8)
        {
          if ([v13 count])
          {
            objc_super v15 = [v14 componentsJoinedByString:@", "];
            v16 = +[NSString stringWithFormat:@"<%p> [%@]", v14, v15];
          }
          else
          {
            v16 = +[NSString stringWithFormat:@"<%p> (empty)", v14];
          }
        }
        else
        {
          v16 = @"<nil>";
        }

        *(_DWORD *)buf = 134218498;
        NSUInteger v18 = v11;
        __int16 v19 = 2048;
        id v20 = v12;
        __int16 v21 = 2112;
        double v22 = v16;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "VehicleListVC - unpaired vehicles updated. count from: %lu to: %lu, detail: %@", buf, 0x20u);
      }
      objc_storeStrong((id *)p_unpairedVehicles, a3);
    }
  }
}

- (id)actionCoordinator
{
  v2 = [(VehicleListViewController *)self _maps_mapsSceneDelegate];
  BOOL v3 = [v2 appCoordinator];
  objc_super v4 = [v3 baseActionCoordinator];

  return v4;
}

- (void)_consumeUpdatedVirtualGarage:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1008B84C8;
  v4[3] = &unk_1012E5D58;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
}

- (void)_consumeUpdatedUnpairedVehicles:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1008B87E8;
  v4[3] = &unk_1012E5D58;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
}

- (BOOL)_isIndexPathOfAddNewCarCell:(id)a3
{
  id v4 = a3;
  if ([v4 section])
  {
    BOOL v5 = 0;
  }
  else
  {
    id v6 = [v4 row];
    BOOL v5 = v6 == (id)[(NSArray *)self->_savedVehicles count];
  }

  return v5;
}

- (void)_refreshSavedVehiclesStates
{
  objc_initWeak(&location, self);
  savedVehicles = self->_savedVehicles;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1008B8A8C;
  v4[3] = &unk_1012FF508;
  objc_copyWeak(&v5, &location);
  [(NSArray *)savedVehicles enumerateObjectsUsingBlock:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_updateVehicle:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(VehicleListViewController *)self savedVehicles];
  id v8 = [v7 count];

  if ((unint64_t)v8 <= a4)
  {
    unsigned __int8 v9 = sub_1000519B4();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v18 = a4;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Tried to update a vehicle at index out of bounds: %ld", buf, 0xCu);
    }
  }
  else if (v6)
  {
    unsigned __int8 v9 = [(NSArray *)self->_savedVehicles mutableCopy];
    [v9 replaceObjectAtIndex:a4 withObject:v6];
    id v10 = [v9 copy];
    [(VehicleListViewController *)self setSavedVehicles:v10];

    NSUInteger v11 = +[NSIndexPath indexPathForRow:a4 inSection:0];
    tableView = self->_tableView;
    v16 = v11;
    id v13 = +[NSArray arrayWithObjects:&v16 count:1];
    [(UITableView *)tableView reloadRowsAtIndexPaths:v13 withRowAnimation:100];
  }
  else
  {
    unsigned __int8 v9 = sub_1000519B4();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v14 = [(VehicleListViewController *)self savedVehicles];
      objc_super v15 = [v14 objectAtIndexedSubscript:a4];
      *(_DWORD *)buf = 138412290;
      unint64_t v18 = (unint64_t)v15;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Tried to update a vehicle with a nil vehicle.: %@", buf, 0xCu);
    }
  }
}

- (BOOL)_shouldShowUnpairedVehicles
{
  if (!MapsFeature_IsEnabled_EVRouting() || ![(NSArray *)self->_unpairedVehicles count]) {
    return 0;
  }

  return IsEVRoutingSupported();
}

- (BOOL)_shouldShowManualAddCell
{
  int IsEnabled_Alberta = MapsFeature_IsEnabled_Alberta();
  if (IsEnabled_Alberta) {
    LOBYTE(IsEnabled_Alberta) = sub_1000BBB44(self) != 5;
  }
  return IsEnabled_Alberta;
}

- (void)headerViewButtonTapped:(id)a3 buttonType:(unint64_t)a4
{
  id v6 = a3;
  id v5 = +[MKMapService sharedService];
  [v5 captureUserAction:34 onTarget:660 eventValue:0];

  [(ContaineeViewController *)self handleDismissAction:v6];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 2;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return UITableViewAutomaticDimension;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6 = a3;
  if (a4 == 1)
  {
    int64_t v8 = [(VehicleListViewController *)self _shouldShowUnpairedVehicles];
  }
  else if (a4)
  {
    unsigned __int8 v9 = sub_1000519B4();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)NSUInteger v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_FAULT, "Invalid section count in VehicleListVC", v11, 2u);
    }

    int64_t v8 = 0;
  }
  else
  {
    NSUInteger v7 = [(NSArray *)self->_savedVehicles count];
    int64_t v8 = v7 + [(VehicleListViewController *)self _shouldShowManualAddCell];
  }

  return v8;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 section];
  if (v8 == (id)1)
  {
    unsigned __int8 v9 = [v6 dequeueReusableCellWithIdentifier:@"kOnboardingCellIdentifier" forIndexPath:v7];
    [v9 setAccessibilityIdentifier:@"OnboardVehicleCell"];
    objc_super v15 = self->_unpairedVehicles;
    if ([(NSArray *)v15 count])
    {
      if ((id)[(NSArray *)v15 count] == (id)1 || sub_100CDB9C4(v15))
      {
        v16 = +[NSBundle mainBundle];
        v17 = [v16 localizedStringForKey:@"Onboard vehicles from VG [Title, VG, Onboarding, Single]", @"localized string not found", 0 value table];

        unint64_t v18 = [(NSArray *)v15 firstObject];
        uint64_t v19 = [v18 manufacturer];
        id v20 = (void *)v19;
        if (v19)
        {
          __int16 v21 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v17, v19);
        }
        else
        {
          v24 = [(NSArray *)v15 firstObject];
          v25 = [v24 displayName];
          __int16 v21 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v17, v25);
        }
      }
      else
      {
        v17 = +[NSBundle mainBundle];
        __int16 v21 = [v17 localizedStringForKey:@"Onboard vehicles from VG [Title, VG, Onboarding, Multiple]", @"localized string not found", 0 value table];
      }
    }
    else
    {
      __int16 v21 = 0;
    }

    uint64_t v26 = [v9 textLabel];
    [v26 setText:v21];

    v27 = +[UIColor systemBlueColor];
    v28 = [v9 textLabel];
    [v28 setTextColor:v27];

    id v13 = [v9 textLabel];
    [v13 setAccessibilityIdentifier:@"OnboardVehicleCellTitle"];
    goto LABEL_21;
  }
  if (!v8)
  {
    if ([(VehicleListViewController *)self _isIndexPathOfAddNewCarCell:v7]
      && [(VehicleListViewController *)self _shouldShowManualAddCell])
    {
      unsigned __int8 v9 = [v6 dequeueReusableCellWithIdentifier:@"kAddNewCarCellIdentifier" forIndexPath:v7];
      id v10 = +[NSBundle mainBundle];
      NSUInteger v11 = [v10 localizedStringForKey:@"[LPR] Add License Plate car" value:@"localized string not found" table:0];
      id v12 = [v9 textLabel];
      [v12 setText:v11];

      [v9 setAccessibilityIdentifier:@"AddLicensePlateCell"];
      id v13 = +[UIColor systemBlueColor];
      v14 = [v9 textLabel];
      [v14 setTextColor:v13];
    }
    else
    {
      id v23 = +[VehicleCell reuseIdentifier];
      unsigned __int8 v9 = [v6 dequeueReusableCellWithIdentifier:v23 forIndexPath:v7];

      id v13 = -[NSArray objectAtIndexedSubscript:](self->_savedVehicles, "objectAtIndexedSubscript:", [v7 row]);
      [v9 setupWithVehicle:v13 cellStyle:1 isSelected:0];
    }
LABEL_21:

    goto LABEL_22;
  }
  double v22 = sub_1000519B4();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_FAULT, "Invalid section count in VehicleListVC", buf, 2u);
  }

  unsigned __int8 v9 = objc_opt_new();
LABEL_22:

  return v9;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  id v6 = a3;
  if (a4)
  {
    if (a4 == 1)
    {
      if ([(VehicleListViewController *)self _shouldShowUnpairedVehicles])
      {
        id v7 = +[NSBundle mainBundle];
        id v8 = [v7 localizedStringForKey:@"[EV Onboarding] Welcome screen privacy text" value:@"localized string not found" table:0];

        goto LABEL_9;
      }
    }
    else
    {
      unsigned __int8 v9 = sub_1000519B4();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)NSUInteger v11 = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_FAULT, "Invalid section count in VehicleListVC", v11, 2u);
      }
    }
  }
  id v8 = 0;
LABEL_9:

  return v8;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  [a3 deselectRowAtIndexPath:v6 animated:1];
  id v7 = [v6 section];
  if (v7 == (id)1)
  {
    NSUInteger v13 = [(NSArray *)self->_unpairedVehicles count];
    v14 = sub_1000519B4();
    unsigned __int8 v9 = v14;
    if (v13)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        objc_super v15 = self->_unpairedVehicles;
        v16 = v15;
        if (v15)
        {
          if ([(NSArray *)v15 count])
          {
            v17 = [(NSArray *)v16 componentsJoinedByString:@", "];
            unint64_t v18 = +[NSString stringWithFormat:@"<%p> [%@]", v16, v17];
          }
          else
          {
            unint64_t v18 = +[NSString stringWithFormat:@"<%p> (empty)", v16];
          }
        }
        else
        {
          unint64_t v18 = @"<nil>";
        }

        *(_DWORD *)buf = 138412290;
        double v22 = v18;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "User selected vehicle onboarding from VG with vehicles: %@", buf, 0xCu);
      }
      unsigned __int8 v9 = [(VehicleListViewController *)self actionCoordinator];
      [v9 presentVehicleOnboardingWithVehicles:self->_unpairedVehicles completion:0];
    }
    else if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_FAULT, "Tried to present onboarding from VG with empty vehicles.", buf, 2u);
    }
    goto LABEL_22;
  }
  if (v7)
  {
    uint64_t v19 = sub_1000519B4();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_FAULT, "Invalid section count in VehicleListVC", buf, 2u);
    }
  }
  else
  {
    if (![(VehicleListViewController *)self _isIndexPathOfAddNewCarCell:v6])
    {
      uint64_t v8 = -[NSArray objectAtIndexedSubscript:](self->_savedVehicles, "objectAtIndexedSubscript:", [v6 row]);
      if (v8)
      {
        unsigned __int8 v9 = v8;
        id v10 = +[MKMapService sharedService];
        [v10 captureUserAction:2126 onTarget:660 eventValue:0];

        NSUInteger v11 = [[VehicleDetailViewController alloc] initWithVehicle:v9 delegate:self];
        [(VehicleDetailViewController *)v11 setVehicleCount:[(NSArray *)self->_savedVehicles count]];
        id v12 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v11];
        [(VehicleListViewController *)self presentViewController:v12 animated:1 completion:0];

LABEL_22:
        goto LABEL_23;
      }
    }
    id v20 = +[MKMapService sharedService];
    [v20 captureUserAction:2115 onTarget:660 eventValue:0];

    if ([(VehicleListViewController *)self _shouldShowManualAddCell])
    {
      unsigned __int8 v9 = [(VehicleListViewController *)self actionCoordinator];
      [v9 presentLPRWithVehicle:0 scenario:0 presenter:self completionBlock:0];
      goto LABEL_22;
    }
  }
LABEL_23:
}

- (void)virtualGarage:(id)a3 didUpdateUnpairedVehicles:(id)a4
{
}

- (void)vehicleDetailViewController:(id)a3 saveVehicleEdit:(id)a4
{
  id v4 = a4;
  id v5 = +[VGVirtualGarageService sharedService];
  [v5 virtualGarageSaveVehicle:v4];
}

- (void)vehicleDetailViewController:(id)a3 deleteVehicle:(id)a4
{
  id v5 = a4;
  id v6 = +[VGVirtualGarageService sharedService];
  [v6 virtualGarageRemoveVehicle:v5];

  id v8 = [(VehicleListViewController *)self navigationController];
  id v7 = [v8 popToViewController:self animated:1];
}

- (NSArray)savedVehicles
{
  return self->_savedVehicles;
}

- (NSArray)unpairedVehicles
{
  return self->_unpairedVehicles;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unpairedVehicles, 0);
  objc_storeStrong((id *)&self->_savedVehicles, 0);
  objc_storeStrong((id *)&self->_tableView, 0);

  objc_storeStrong((id *)&self->_titleHeaderView, 0);
}

@end