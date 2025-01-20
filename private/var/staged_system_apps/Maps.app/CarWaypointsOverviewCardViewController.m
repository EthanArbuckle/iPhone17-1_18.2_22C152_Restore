@interface CarWaypointsOverviewCardViewController
- (BOOL)_canAddWaypoints;
- (BOOL)_isWaypointRemovable:(id)a3;
- (CarWaypointsOverviewCardViewController)initWithDelegate:(id)a3;
- (NSArray)focusOrderSubItems;
- (NSArray)waypoints;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)navigationService:(id)a3 didUpdateDisplayETA:(id)a4 remainingDistance:(id)a5 batteryChargeInfo:(id)a6;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)setWaypoints:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation CarWaypointsOverviewCardViewController

- (CarWaypointsOverviewCardViewController)initWithDelegate:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CarWaypointsOverviewCardViewController;
  v5 = [(CarWaypointsOverviewCardViewController *)&v9 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v7 = +[MNNavigationService sharedService];
    [v7 registerObserver:v6];
  }
  return v6;
}

- (void)viewDidLoad
{
  v20.receiver = self;
  v20.super_class = (Class)CarWaypointsOverviewCardViewController;
  [(CarWaypointsOverviewCardViewController *)&v20 viewDidLoad];
  v3 = objc_alloc_init(CarTableView);
  tableView = self->_tableView;
  self->_tableView = v3;

  [(CarTableView *)self->_tableView setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v5) = 1148846080;
  [(CarTableView *)self->_tableView setContentCompressionResistancePriority:0 forAxis:v5];
  LODWORD(v6) = 1148846080;
  [(CarTableView *)self->_tableView setContentCompressionResistancePriority:1 forAxis:v6];
  [(CarTableView *)self->_tableView setDataSource:self];
  [(CarTableView *)self->_tableView setDelegate:self];
  v7 = +[UIColor clearColor];
  [(CarTableView *)self->_tableView setBackgroundColor:v7];

  v8 = self->_tableView;
  uint64_t v9 = objc_opt_class();
  v10 = (objc_class *)objc_opt_class();
  v11 = NSStringFromClass(v10);
  [(CarTableView *)v8 registerClass:v9 forCellReuseIdentifier:v11];

  v12 = self->_tableView;
  uint64_t v13 = objc_opt_class();
  v14 = (objc_class *)objc_opt_class();
  v15 = NSStringFromClass(v14);
  [(CarTableView *)v12 registerClass:v13 forCellReuseIdentifier:v15];

  v16 = [(CarWaypointsOverviewCardViewController *)self view];
  [v16 addSubview:self->_tableView];

  v17 = self->_tableView;
  v18 = [(CarWaypointsOverviewCardViewController *)self view];
  v19 = [(CarTableView *)v17 _maps_constraintsForCenteringInView:v18];
  +[NSLayoutConstraint activateConstraints:v19];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CarWaypointsOverviewCardViewController;
  [(CarWaypointsOverviewCardViewController *)&v4 viewWillAppear:a3];
  [(CarTableView *)self->_tableView reloadData];
}

- (void)setWaypoints:(id)a3
{
  id v5 = a3;
  p_waypoints = &self->_waypoints;
  if (([v5 isEqualToArray:self->_waypoints] & 1) == 0)
  {
    v7 = sub_100015DB4();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
LABEL_9:

      objc_storeStrong((id *)&self->_waypoints, a3);
      v15 = +[MNNavigationService sharedService];
      v16 = +[NavTrayWaypointRow waypointRowsFromNavigationService:v15 withWaypoints:*p_waypoints];
      waypointRows = self->_waypointRows;
      self->_waypointRows = v16;

      [(CarTableView *)self->_tableView reloadData];
      goto LABEL_10;
    }
    v8 = self;
    uint64_t v9 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v9);
    if (objc_opt_respondsToSelector())
    {
      v11 = [(CarWaypointsOverviewCardViewController *)v8 performSelector:"accessibilityIdentifier"];
      v12 = v11;
      if (v11 && ![v11 isEqualToString:v10])
      {
        uint64_t v13 = +[NSString stringWithFormat:@"%@<%p, %@>", v10, v8, v12];

        goto LABEL_8;
      }
    }
    uint64_t v13 = +[NSString stringWithFormat:@"%@<%p>", v10, v8];
LABEL_8:

    NSUInteger v14 = [(NSArray *)*p_waypoints count];
    *(_DWORD *)buf = 138543874;
    v19 = v13;
    __int16 v20 = 2048;
    NSUInteger v21 = v14;
    __int16 v22 = 2048;
    id v23 = [v5 count];
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}@] didUpdate waypoints, previously: %ld, now: %ld", buf, 0x20u);

    goto LABEL_9;
  }
LABEL_10:
}

- (BOOL)_canAddWaypoints
{
  uint64_t UInteger = GEOConfigGetUInteger();
  objc_super v4 = sub_1000AC254(self->_waypoints, &stru_1012E89F0);
  id v5 = v4;
  if (UInteger) {
    BOOL v6 = (unint64_t)[v4 count] < UInteger - 1;
  }
  else {
    BOOL v6 = 1;
  }

  return v6;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 2;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return 56.0;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6 = a3;
  if (a4 == 1)
  {
    int64_t v7 = [(NSArray *)self->_waypointRows count];
  }
  else if (a4)
  {
    int64_t v7 = 0;
  }
  else
  {
    int64_t v7 = [(CarWaypointsOverviewCardViewController *)self _canAddWaypoints];
  }

  return v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 section];
  if (v8 == (id)1)
  {
    v12 = (objc_class *)objc_opt_class();
    uint64_t v13 = NSStringFromClass(v12);
    v11 = [v6 dequeueReusableCellWithIdentifier:v13 forIndexPath:v7];

    NSUInteger v14 = -[NSArray objectAtIndexedSubscript:](self->_waypointRows, "objectAtIndexedSubscript:", [v7 row]);
    v15 = [v14 waypoint];
    v16 = [v14 etaInfo];
    v17 = [v14 waypoint];
    [v11 setupWithWaypoint:v15 etaInfo:v16 isRemovable:[self _isWaypointRemovable:v17]];

    goto LABEL_16;
  }
  if (!v8)
  {
    uint64_t v9 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v9);
    v11 = [v6 dequeueReusableCellWithIdentifier:v10 forIndexPath:v7];

    goto LABEL_16;
  }
  v18 = sub_100015DB4();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    v19 = self;
    if (!v19)
    {
      v24 = @"<nil>";
      goto LABEL_14;
    }
    __int16 v20 = (objc_class *)objc_opt_class();
    NSUInteger v21 = NSStringFromClass(v20);
    if (objc_opt_respondsToSelector())
    {
      __int16 v22 = [(CarWaypointsOverviewCardViewController *)v19 performSelector:"accessibilityIdentifier"];
      id v23 = v22;
      if (v22 && ![v22 isEqualToString:v21])
      {
        v24 = +[NSString stringWithFormat:@"%@<%p, %@>", v21, v19, v23];

        goto LABEL_12;
      }
    }
    v24 = +[NSString stringWithFormat:@"%@<%p>", v21, v19];
LABEL_12:

LABEL_14:
    *(_DWORD *)buf = 138543362;
    v27 = v24;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "[%{public}@] tried to dequeue a cell for invalid section.", buf, 0xCu);
  }
  v11 = objc_opt_new();
LABEL_16:

  return v11;
}

- (BOOL)_isWaypointRemovable:(id)a3
{
  if ([a3 isServerProvidedWaypoint]) {
    return 0;
  }
  id v5 = sub_1000AC254(self->_waypoints, &stru_1012E8A10);
  BOOL v4 = (unint64_t)[v5 count] > 1;

  return v4;
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v5 = a4;
  if ([v5 section] == (id)1)
  {
    id v7 = -[NSArray objectAtIndexedSubscript:](self->_waypointRows, "objectAtIndexedSubscript:", [v5 row]);
    id v8 = [v7 waypoint];

    if ([(CarWaypointsOverviewCardViewController *)self _isWaypointRemovable:v8]) {
      uint64_t v9 = v5;
    }
    else {
      uint64_t v9 = 0;
    }
    id v6 = v9;
  }
  else
  {
    id v6 = v5;
  }

  return v6;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v10 = a4;
  [a3 deselectRowAtIndexPath:v10 animated:1];
  id v6 = [v10 section];
  if (v6 == (id)1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    id v8 = -[NSArray objectAtIndexedSubscript:](self->_waypointRows, "objectAtIndexedSubscript:", [v10 row]);
    uint64_t v9 = [v8 waypoint];
    [WeakRetained waypointsOverviewController:self didSelectWaypoint:v9 atIndex:[v10 row]];
  }
  else
  {
    if (v6) {
      goto LABEL_6;
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained waypointsOverviewControllerDidSelectAddWaypoint:self];
  }

LABEL_6:
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  if (a4.y <= 0.0) {
    uint64_t v5 = 7;
  }
  else {
    uint64_t v5 = 8;
  }
  id v6 = +[MKMapService sharedService];
  [v6 captureUserAction:v5 onTarget:1025 eventValue:0];
}

- (void)navigationService:(id)a3 didUpdateDisplayETA:(id)a4 remainingDistance:(id)a5 batteryChargeInfo:(id)a6
{
  id v7 = a4;
  id v8 = [(CarTableView *)self->_tableView _car_indexPathsForVisibleRows];
  id v9 = objc_alloc((Class)NSMutableArray);
  id v10 = [v7 legInfos];
  id v11 = objc_msgSend(v9, "initWithCapacity:", objc_msgSend(v10, "count"));

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = [v7 legInfos];
  id v12 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v23;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v23 != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        waypointRows = self->_waypointRows;
        v19[0] = _NSConcreteStackBlock;
        v19[1] = 3221225472;
        v19[2] = sub_1003E2B88;
        v19[3] = &unk_1012E8A38;
        v19[4] = v16;
        id v20 = v8;
        id v21 = v11;
        [(NSArray *)waypointRows enumerateObjectsUsingBlock:v19];
      }
      id v13 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v13);
  }

  if ([v11 count]) {
    [(CarTableView *)self->_tableView reloadRowsAtIndexPaths:v11 withRowAnimation:5];
  }
}

- (NSArray)focusOrderSubItems
{
  if ([(CarWaypointsOverviewCardViewController *)self isViewLoaded])
  {
    v3 = [(CarTableView *)self->_tableView _car_visibleCells];
  }
  else
  {
    v3 = &__NSArray0__struct;
  }

  return (NSArray *)v3;
}

- (NSArray)waypoints
{
  return self->_waypoints;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waypoints, 0);
  objc_storeStrong((id *)&self->_waypointRows, 0);
  objc_storeStrong((id *)&self->_tableView, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end