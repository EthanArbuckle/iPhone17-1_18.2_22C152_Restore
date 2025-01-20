@interface EVOnboardingVehicleSelectionViewController
- (EVOnboardingVehicleSelectionViewController)initWithVehicles:(id)a3 delegate:(id)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)_selectedVehicles;
- (id)obViewController;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_donePressed;
- (void)_updateNextButton;
- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation EVOnboardingVehicleSelectionViewController

- (EVOnboardingVehicleSelectionViewController)initWithVehicles:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v24.receiver = self;
  v24.super_class = (Class)EVOnboardingVehicleSelectionViewController;
  v9 = [(EVOnboardingBaseViewController *)&v24 initWithDelegate:v8];
  v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_delegate, v8);
    objc_storeStrong((id *)&v10->_vehicles, a3);
    uint64_t v11 = +[NSMutableSet set];
    selectedIndexPaths = v10->_selectedIndexPaths;
    v10->_selectedIndexPaths = (NSMutableSet *)v11;

    if ([(NSArray *)v10->_vehicles count])
    {
      unint64_t v13 = 0;
      do
      {
        v14 = v10->_selectedIndexPaths;
        v15 = +[NSIndexPath indexPathForRow:v13 inSection:0];
        [(NSMutableSet *)v14 addObject:v15];

        ++v13;
      }
      while (v13 < [(NSArray *)v10->_vehicles count]);
    }
    char IsEnabled_EVRoutingEnhancements = MapsFeature_IsEnabled_EVRoutingEnhancements();
    id v17 = objc_alloc((Class)UIBarButtonItem);
    v18 = v17;
    if (IsEnabled_EVRoutingEnhancements)
    {
      id v19 = +[NSBundle mainBundle];
      v20 = [v19 localizedStringForKey:@"[EV Onboarding] Next" value:@"localized string not found" table:0];
      id v21 = [v18 initWithTitle:v20 style:2 target:v10 action:"_donePressed"];
      v22 = [(EVOnboardingVehicleSelectionViewController *)v10 navigationItem];
      [v22 setRightBarButtonItem:v21];
    }
    else
    {
      id v19 = [v17 initWithBarButtonSystemItem:0 target:v10 action:"_donePressed"];
      v20 = [(EVOnboardingVehicleSelectionViewController *)v10 navigationItem];
      [v20 setRightBarButtonItem:v19];
    }
  }
  return v10;
}

- (void)viewDidAppear:(BOOL)a3
{
  v13.receiver = self;
  v13.super_class = (Class)EVOnboardingVehicleSelectionViewController;
  [(EVOnboardingVehicleSelectionViewController *)&v13 viewDidAppear:a3];
  [(UITableView *)self->_tableView setDelegate:self];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v4 = self->_selectedIndexPaths;
  id v5 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v9 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        -[UITableView selectRowAtIndexPath:animated:scrollPosition:](self->_tableView, "selectRowAtIndexPath:animated:scrollPosition:", *(void *)(*((void *)&v9 + 1) + 8 * (void)v8), 0, 0, (void)v9);
        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v9 objects:v14 count:16];
    }
    while (v6);
  }
}

- (id)obViewController
{
  v3 = +[NSBundle mainBundle];
  v4 = [v3 localizedStringForKey:@"[VirtualGarage] Choose Vehicles" value:@"localized string not found" table:0];

  id v5 = +[NSBundle mainBundle];
  id v6 = [v5 localizedStringForKey:@"[EV Onboarding] Choose vehicles to plan your trips with." value:@"localized string not found" table:0];

  uint64_t v7 = +[UIImage imageNamed:@"multipleEV"];
  id v8 = [objc_alloc((Class)OBTableWelcomeController) initWithTitle:v4 detailText:v6 icon:v7 adoptTableViewScrollView:1];
  long long v9 = [v8 view];
  [v9 setAccessibilityIdentifier:@"EVOnboardingVehicleSelectionView"];

  [v8 setModalPresentationStyle:2];
  long long v10 = [v8 headerView];
  [v10 setAllowFullWidthIcon:1];

  id v11 = [objc_alloc((Class)UITableView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  [v8 setTableView:v11];

  long long v12 = [v8 tableView];
  [v12 setAccessibilityIdentifier:@"EVOnboardingVehicleSelectionTableView"];

  objc_super v13 = [v8 tableView];
  [v13 setAllowsMultipleSelection:1];

  v14 = [v8 tableView];
  [v14 setTranslatesAutoresizingMaskIntoConstraints:0];

  v15 = [v8 tableView];
  LODWORD(v16) = 1148846080;
  [v15 setContentCompressionResistancePriority:1 forAxis:v16];

  id v17 = [v8 tableView];
  [v17 setDataSource:self];

  v18 = [v8 tableView];
  [v18 setDelegate:self];

  id v19 = +[UIColor clearColor];
  v20 = [v8 tableView];
  [v20 setBackgroundColor:v19];

  id v21 = [v8 tableView];
  uint64_t v22 = objc_opt_class();
  v23 = +[VehicleCell reuseIdentifier];
  [v21 registerClass:v22 forCellReuseIdentifier:v23];

  objc_super v24 = +[UIColor systemBackgroundColor];
  v25 = [v8 view];
  [v25 setBackgroundColor:v24];

  v26 = [v8 tableView];
  tableView = self->_tableView;
  self->_tableView = v26;

  return v8;
}

- (id)_selectedVehicles
{
  v3 = [(NSMutableSet *)self->_selectedIndexPaths allObjects];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100C521EC;
  v6[3] = &unk_1012EBC90;
  v6[4] = self;
  v4 = sub_100099700(v3, v6);

  return v4;
}

- (void)_updateNextButton
{
  if (MapsFeature_IsEnabled_EVRoutingEnhancements())
  {
    BOOL v3 = [(NSMutableSet *)self->_selectedIndexPaths count] != 0;
    id v5 = [(EVOnboardingVehicleSelectionViewController *)self navigationItem];
    v4 = [v5 rightBarButtonItem];
    [v4 setEnabled:v3];
  }
}

- (void)_donePressed
{
  BOOL v3 = +[MKMapService sharedService];
  [v3 captureUserAction:41 onTarget:660 eventValue:0];

  v4 = [(EVOnboardingVehicleSelectionViewController *)self _selectedVehicles];
  id v5 = sub_1005761B4();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = v4;
    uint64_t v7 = v6;
    if (v6)
    {
      if ([v6 count])
      {
        id v8 = [v7 componentsJoinedByString:@", "];
        long long v9 = +[NSString stringWithFormat:@"<%p> [%@]", v7, v8];
      }
      else
      {
        long long v9 = +[NSString stringWithFormat:@"<%p> (empty)", v7];
      }
    }
    else
    {
      long long v9 = @"<nil>";
    }

    *(_DWORD *)buf = 138412290;
    long long v12 = v9;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "User pressed done with vehicles: %@.", buf, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained vehicleSelectionViewController:self didSelectContinueWithVehicles:v4];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[MKMapService sharedService];
  [v8 captureUserAction:2113 onTarget:660 eventValue:0];

  [(NSMutableSet *)self->_selectedIndexPaths addObject:v6];
  long long v9 = [v7 cellForRowAtIndexPath:v6];

  [v9 setAccessoryType:3];

  [(EVOnboardingVehicleSelectionViewController *)self _updateNextButton];
}

- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[MKMapService sharedService];
  [v8 captureUserAction:447 onTarget:660 eventValue:0];

  [(NSMutableSet *)self->_selectedIndexPaths removeObject:v6];
  long long v9 = [v7 cellForRowAtIndexPath:v6];

  [v9 setAccessoryType:0];

  [(EVOnboardingVehicleSelectionViewController *)self _updateNextButton];
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return UITableViewAutomaticDimension;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return [(NSArray *)self->_vehicles count];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[VehicleCell reuseIdentifier];
  long long v9 = [v7 dequeueReusableCellWithIdentifier:v8 forIndexPath:v6];

  id v10 = [(NSMutableSet *)self->_selectedIndexPaths containsObject:v6];
  vehicles = self->_vehicles;
  id v12 = [v6 row];

  objc_super v13 = [(NSArray *)vehicles objectAtIndexedSubscript:v12];
  [v9 setupWithVehicle:v13 cellStyle:0 isSelected:v10];

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_selectedIndexPaths, 0);
  objc_storeStrong((id *)&self->_vehicles, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end