@interface SharedTripListContaineeViewController
- (GEOSharedNavState)selectedTrip;
- (SharedTripListContaineeViewController)init;
- (SharedTripsActionCoordination)delegate;
- (double)heightForLayout:(unint64_t)a3;
- (id)contentView;
- (id)headerView;
- (int)currentUITargetForAnalytics;
- (void)applyAlphaToContent:(double)a3;
- (void)dealloc;
- (void)headerViewButtonTapped:(id)a3 buttonType:(unint64_t)a4;
- (void)headerViewTapped:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSelectedTrip:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)viewDidLoad;
@end

@implementation SharedTripListContaineeViewController

- (SharedTripListContaineeViewController)init
{
  v5.receiver = self;
  v5.super_class = (Class)SharedTripListContaineeViewController;
  v2 = [(SharedTripListContaineeViewController *)&v5 init];
  if (v2)
  {
    v3 = sub_1004D4D88();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      v7 = v2;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}p] Initializing", buf, 0xCu);
    }
  }
  return v2;
}

- (void)dealloc
{
  v3 = sub_1004D4D88();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}p] Deallocating", buf, 0xCu);
  }

  v4.receiver = self;
  v4.super_class = (Class)SharedTripListContaineeViewController;
  [(SharedTripListContaineeViewController *)&v4 dealloc];
}

- (void)viewDidLoad
{
  v54.receiver = self;
  v54.super_class = (Class)SharedTripListContaineeViewController;
  [(ContaineeViewController *)&v54 viewDidLoad];
  v3 = -[ContainerHeaderView initWithFrame:]([ContainerHeaderView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  headerView = self->_headerView;
  self->_headerView = v3;

  [(ContainerHeaderView *)self->_headerView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(ContainerHeaderView *)self->_headerView setDelegate:self];
  objc_super v5 = +[NSBundle mainBundle];
  v6 = [v5 localizedStringForKey:@"Shared Trips [Tray, Header]", @"localized string not found", 0 value table];
  [(ContainerHeaderView *)self->_headerView setTitle:v6];

  v7 = [(SharedTripListContaineeViewController *)self view];
  [v7 addSubview:self->_headerView];

  id v8 = objc_alloc((Class)UITableView);
  v9 = [(SharedTripListContaineeViewController *)self view];
  [v9 bounds];
  v10 = [v8 initWithFrame:0 style:];
  tableView = self->_tableView;
  self->_tableView = v10;

  v12 = +[UIColor clearColor];
  [(UITableView *)self->_tableView setBackgroundColor:v12];

  [(UITableView *)self->_tableView setTranslatesAutoresizingMaskIntoConstraints:0];
  +[TwoLinesTableViewCell estimatedCellHeight];
  -[UITableView setEstimatedRowHeight:](self->_tableView, "setEstimatedRowHeight:");
  +[TwoLinesTableViewCell cellHeight];
  -[UITableView setRowHeight:](self->_tableView, "setRowHeight:");
  [(UITableView *)self->_tableView setDelegate:self];
  v13 = self->_tableView;
  uint64_t v14 = objc_opt_class();
  v15 = +[TwoLinesTableViewCell identifier];
  [(UITableView *)v13 registerClass:v14 forCellReuseIdentifier:v15];

  v16 = [(SharedTripListContaineeViewController *)self view];
  [v16 addSubview:self->_tableView];

  objc_initWeak(&location, self);
  v17 = [SharedTripsTableDataSource alloc];
  v18 = self->_tableView;
  v51[0] = _NSConcreteStackBlock;
  v51[1] = 3221225472;
  v51[2] = sub_1004D547C;
  v51[3] = &unk_1012ECBA8;
  objc_copyWeak(&v52, &location);
  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472;
  v49[2] = sub_1004D55F8;
  v49[3] = &unk_1012ECBD0;
  objc_copyWeak(&v50, &location);
  v19 = [(SharedTripsTableDataSource *)v17 initWithTableView:v18 cellProvider:v51 tableViewReloadEvent:v49];
  sharedTripsDataSource = self->_sharedTripsDataSource;
  self->_sharedTripsDataSource = v19;

  v21 = +[NSMutableArray array];
  v22 = [(ContainerHeaderView *)self->_headerView topAnchor];
  v23 = [(SharedTripListContaineeViewController *)self view];
  v24 = [v23 topAnchor];
  v25 = [v22 constraintEqualToAnchor:v24];
  [v21 addObject:v25];

  v26 = [(ContainerHeaderView *)self->_headerView leadingAnchor];
  v27 = [(SharedTripListContaineeViewController *)self view];
  v28 = [v27 leadingAnchor];
  v29 = [v26 constraintEqualToAnchor:v28];
  [v21 addObject:v29];

  v30 = [(SharedTripListContaineeViewController *)self view];
  v31 = [v30 trailingAnchor];
  v32 = [(ContainerHeaderView *)self->_headerView trailingAnchor];
  v33 = [v31 constraintEqualToAnchor:v32];
  [v21 addObject:v33];

  v34 = [(UITableView *)self->_tableView topAnchor];
  v35 = [(ContainerHeaderView *)self->_headerView bottomAnchor];
  v36 = [v34 constraintEqualToAnchor:v35];
  [v21 addObject:v36];

  v37 = [(UITableView *)self->_tableView leadingAnchor];
  v38 = [(SharedTripListContaineeViewController *)self view];
  v39 = [v38 leadingAnchor];
  v40 = [v37 constraintEqualToAnchor:v39];
  [v21 addObject:v40];

  v41 = [(UITableView *)self->_tableView trailingAnchor];
  v42 = [(SharedTripListContaineeViewController *)self view];
  v43 = [v42 trailingAnchor];
  v44 = [v41 constraintEqualToAnchor:v43];
  [v21 addObject:v44];

  v45 = [(UITableView *)self->_tableView bottomAnchor];
  v46 = [(SharedTripListContaineeViewController *)self view];
  v47 = [v46 bottomAnchor];
  v48 = [v45 constraintEqualToAnchor:v47];
  [v21 addObject:v48];

  +[NSLayoutConstraint activateConstraints:v21];
  objc_destroyWeak(&v50);
  objc_destroyWeak(&v52);
  objc_destroyWeak(&location);
}

- (void)headerViewTapped:(id)a3
{
  objc_super v4 = [(ContaineeViewController *)self cardPresentationController];
  objc_super v5 = (char *)[v4 containeeLayout];

  if ((unint64_t)(v5 - 2) >= 2)
  {
    if (v5 != (char *)1) {
      return;
    }
    id v6 = [(ContaineeViewController *)self cardPresentationController];
    [v6 wantsExpandLayout];
  }
  else
  {
    id v6 = [(ContaineeViewController *)self cardPresentationController];
    [v6 wantsMinimizeLayout];
  }
}

- (void)headerViewButtonTapped:(id)a3 buttonType:(unint64_t)a4
{
  objc_super v5 = +[MSPSharedTripService sharedInstance];
  id v6 = [v5 receivedTrips];
  sub_100099700(v6, &stru_1012ECC10);
  id v10 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v7 = [(SharedTripListContaineeViewController *)self currentUITargetForAnalytics];
  id v8 = [v10 componentsJoinedByString:@","];
  +[GEOAPPortal captureUserAction:4 target:v7 value:v8];

  v9 = [(SharedTripListContaineeViewController *)self delegate];
  [v9 closeSharedTrips];
}

- (int)currentUITargetForAnalytics
{
  return 267;
}

- (GEOSharedNavState)selectedTrip
{
  p_selectedTrip = &self->_selectedTrip;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_selectedTrip);

  if (!WeakRetained)
  {
    objc_super v5 = [(SharedTripsTableDataSource *)self->_sharedTripsDataSource selectedTrip];
    objc_storeWeak((id *)p_selectedTrip, v5);
  }
  id v6 = objc_loadWeakRetained((id *)p_selectedTrip);

  return (GEOSharedNavState *)v6;
}

- (void)setSelectedTrip:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_selectedTrip);

  if (WeakRetained != v4)
  {
    id v6 = sub_1004D4D88();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = [v4 groupIdentifier];
      int v9 = 134349314;
      id v10 = self;
      __int16 v11 = 2112;
      v12 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}p] Selecting trip: %@", (uint8_t *)&v9, 0x16u);
    }
    id subscriptionToken = self->_subscriptionToken;
    self->_id subscriptionToken = 0;

    objc_storeWeak((id *)&self->_selectedTrip, v4);
    [(SharedTripsTableDataSource *)self->_sharedTripsDataSource setSelectedTrip:v4];
  }
}

- (id)headerView
{
  return self->_headerView;
}

- (id)contentView
{
  return self->_tableView;
}

- (void)applyAlphaToContent:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SharedTripListContaineeViewController;
  -[ContaineeViewController applyAlphaToContent:](&v5, "applyAlphaToContent:");
  [(ContainerHeaderView *)self->_headerView setHairLineAlpha:a3];
}

- (double)heightForLayout:(unint64_t)a3
{
  objc_super v5 = [(ContaineeViewController *)self cardPresentationController];
  [v5 bottomSafeOffset];
  double v7 = v6;

  if (a3 == 1)
  {
LABEL_7:
    [(ContaineeViewController *)self headerHeight];
    return v7 + v11;
  }
  if (a3 == 2)
  {
    unint64_t v8 = [(SharedTripsTableDataSource *)self->_sharedTripsDataSource numberOfSharedTrips];
    if (v8 <= 3) {
      double v9 = (double)v8;
    }
    else {
      double v9 = 3.5;
    }
    +[TwoLinesTableViewCell estimatedCellHeight];
    double v7 = v7 + v10 * v9;
    goto LABEL_7;
  }
  v13 = [(ContaineeViewController *)self cardPresentationController];
  [v13 availableHeight];
  double v15 = v14;

  return v15;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  -[SharedTripsTableDataSource sharedTripAtIndexPath:](self->_sharedTripsDataSource, "sharedTripAtIndexPath:", a5, a4);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  if ([v7 hasTransportType])
  {
    id v5 = [v7 transportType];
    if (v5 >= 7)
    {
      double v6 = +[NSString stringWithFormat:@"(unknown: %i)", v5];
    }
    else
    {
      double v6 = off_1012ECC50[(int)v5];
    }
  }
  else
  {
    double v6 = @"UNKNOWN_TRANSPORT_TYPE";
  }
  +[GEOAPPortal captureUserAction:9002 target:267 value:v6];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = [a3 cellForRowAtIndexPath:v6];
  [v7 setSelected:0];

  id v11 = [(SharedTripsTableDataSource *)self->_sharedTripsDataSource sharedTripAtIndexPath:v6];

  [(SharedTripListContaineeViewController *)self setSelectedTrip:v11];
  if ([v11 hasTransportType])
  {
    id v8 = [v11 transportType];
    if (v8 >= 7)
    {
      double v9 = +[NSString stringWithFormat:@"(unknown: %i)", v8];
    }
    else
    {
      double v9 = off_1012ECC50[(int)v8];
    }
  }
  else
  {
    double v9 = @"UNKNOWN_TRANSPORT_TYPE";
  }
  +[GEOAPPortal captureUserAction:9003 target:267 value:v9];

  double v10 = [(SharedTripListContaineeViewController *)self delegate];
  [v10 didSelectSharedTrip:v11];
}

- (SharedTripsActionCoordination)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SharedTripsActionCoordination *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_selectedTrip);
  objc_storeStrong(&self->_subscriptionToken, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_tableView, 0);

  objc_storeStrong((id *)&self->_sharedTripsDataSource, 0);
}

@end