@interface NavTrafficIncidentReportingContaineeViewController
- (BOOL)_canShowWhileLocked;
- (GCDTimer)timer;
- (GEOLocation)incidentLocation;
- (NSArray)trafficIncidentLayoutItems;
- (NavTrafficIncidentReportingContaineeViewController)initWithDelegate:(id)a3;
- (NavTrafficIncidentReportingContaineeViewControllerDelegate)incidentReportingDelegate;
- (UITableView)tableView;
- (double)heightForLayout:(unint64_t)a3;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_dismissAfterDelay;
- (void)headerViewButtonTapped:(id)a3 buttonType:(unint64_t)a4;
- (void)headerViewTapped:(id)a3;
- (void)setIncidentLocation:(id)a3;
- (void)setTimer:(id)a3;
- (void)setTrafficIncidentLayoutItems:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation NavTrafficIncidentReportingContaineeViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (NavTrafficIncidentReportingContaineeViewController)initWithDelegate:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NavTrafficIncidentReportingContaineeViewController;
  v5 = [(NavTrafficIncidentReportingContaineeViewController *)&v11 initWithNibName:0 bundle:0];
  v6 = v5;
  if (v5)
  {
    v7 = [(ContaineeViewController *)v5 cardPresentationController];
    [v7 setBlurInCardView:0];

    v8 = +[UIColor colorNamed:@"NavigationMaterialColor"];
    v9 = [(ContaineeViewController *)v6 cardPresentationController];
    [v9 setCardColor:v8];

    objc_storeWeak((id *)&v6->_incidentReportingDelegate, v4);
  }

  return v6;
}

- (void)viewDidLoad
{
  v78.receiver = self;
  v78.super_class = (Class)NavTrafficIncidentReportingContaineeViewController;
  [(ContaineeViewController *)&v78 viewDidLoad];
  v3 = [(ContaineeViewController *)self cardPresentationController];
  [v3 setEdgeAttachedRegularHeightDimmingBehavior:2];

  id v4 = objc_opt_new();
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  v5 = v4;
  [v4 setAccessibilityIdentifier:@"TitleView"];
  v6 = objc_opt_new();
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v6 setNumberOfLines:2];
  v7 = +[UIFont _maps_boldSystemFontWithSize:27.0];
  [v6 setFont:v7];

  v8 = +[NSBundle mainBundle];
  v9 = [v8 localizedStringForKey:@"Report Incident [Nav, Tray]", @"localized string not found", 0 value table];
  [v6 setText:v9];

  [v6 setAccessibilityIdentifier:@"HeaderLabel"];
  [v5 addSubview:v6];
  v74 = [v6 leadingAnchor];
  v72 = [v5 leadingAnchor];
  v70 = [v74 constraintEqualToAnchor:v72 constant:16.0];
  v80[0] = v70;
  v68 = [v6 trailingAnchor];
  v10 = [v5 trailingAnchor];
  objc_super v11 = [v68 constraintEqualToAnchor:v10];
  v80[1] = v11;
  v76 = v6;
  v12 = [v6 topAnchor];
  v77 = v5;
  v13 = [v5 topAnchor];
  v14 = [v12 constraintEqualToAnchor:v13 constant:16.0];
  v80[2] = v14;
  v15 = [v6 bottomAnchor];
  v16 = [v5 bottomAnchor];
  v17 = [v15 constraintEqualToAnchor:v16 constant:-16.0];
  v80[3] = v17;
  v18 = +[NSArray arrayWithObjects:v80 count:4];
  +[NSLayoutConstraint activateConstraints:v18];

  v19 = objc_opt_new();
  [v19 setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v20) = 1148846080;
  [v19 setContentCompressionResistancePriority:1 forAxis:v20];
  [v19 setTitleView:v77];
  [v19 setDelegate:self];
  [v19 setHairLineAlpha:0.0];
  [v19 setAccessibilityIdentifier:@"NavIncidentReportingHeaderView"];
  v21 = [(ContaineeViewController *)self headerView];
  v22 = v19;
  [v21 addSubview:v19];

  v23 = [objc_alloc((Class)UITableView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  tableView = self->_tableView;
  self->_tableView = v23;

  [(UITableView *)self->_tableView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UITableView *)self->_tableView setDelegate:self];
  [(UITableView *)self->_tableView setDataSource:self];
  -[UITableView setSeparatorInset:](self->_tableView, "setSeparatorInset:", 0.0, 76.0, 0.0, 16.0);
  [(UITableView *)self->_tableView _setTopPadding:0.0];
  [(UITableView *)self->_tableView _setBottomPadding:0.0];
  [(UITableView *)self->_tableView setSectionHeaderHeight:0.0];
  [(UITableView *)self->_tableView setSectionFooterHeight:16.0];
  [(UITableView *)self->_tableView setAlwaysBounceVertical:0];
  v25 = +[UIColor clearColor];
  [(UITableView *)self->_tableView setBackgroundColor:v25];

  -[UITableView setLayoutMargins:](self->_tableView, "setLayoutMargins:", 0.0, 16.0, 0.0, 16.0);
  v26 = self->_tableView;
  uint64_t v27 = objc_opt_class();
  v28 = (objc_class *)objc_opt_class();
  v29 = NSStringFromClass(v28);
  [(UITableView *)v26 registerClass:v27 forCellReuseIdentifier:v29];

  v30 = +[UIColor colorNamed:@"NavTraySeparatorColor"];
  [(UITableView *)self->_tableView setSeparatorColor:v30];

  [(UITableView *)self->_tableView setAccessibilityIdentifier:@"NavIncidentReportingTableView"];
  v31 = [(ContaineeViewController *)self contentView];
  [v31 addSubview:self->_tableView];

  v73 = [v22 topAnchor];
  v75 = [(ContaineeViewController *)self headerView];
  v71 = [v75 topAnchor];
  v69 = [v73 constraintEqualToAnchor:v71];
  v79[0] = v69;
  v65 = [v22 leadingAnchor];
  v66 = [(ContaineeViewController *)self headerView];
  v64 = [v66 leadingAnchor];
  v63 = [v65 constraintEqualToAnchor:v64];
  v79[1] = v63;
  v67 = v22;
  v61 = [v22 trailingAnchor];
  v62 = [(ContaineeViewController *)self headerView];
  v60 = [v62 trailingAnchor];
  v59 = [v61 constraintEqualToAnchor:v60];
  v79[2] = v59;
  v57 = [v22 bottomAnchor];
  v58 = [(ContaineeViewController *)self headerView];
  v56 = [v58 bottomAnchor];
  v55 = [v57 constraintEqualToAnchor:v56];
  v79[3] = v55;
  v54 = [(NavTrafficIncidentReportingContaineeViewController *)self tableView];
  v52 = [v54 leadingAnchor];
  v53 = [(ContaineeViewController *)self contentView];
  v51 = [v53 leadingAnchor];
  v50 = [v52 constraintEqualToAnchor:v51];
  v79[4] = v50;
  v49 = [(NavTrafficIncidentReportingContaineeViewController *)self tableView];
  v47 = [v49 trailingAnchor];
  v48 = [(ContaineeViewController *)self contentView];
  v46 = [v48 trailingAnchor];
  v45 = [v47 constraintEqualToAnchor:v46];
  v79[5] = v45;
  v44 = [(NavTrafficIncidentReportingContaineeViewController *)self tableView];
  v43 = [v44 topAnchor];
  v32 = [(ContaineeViewController *)self contentView];
  v33 = [v32 topAnchor];
  v34 = [v43 constraintEqualToAnchor:v33];
  v79[6] = v34;
  v35 = [(NavTrafficIncidentReportingContaineeViewController *)self tableView];
  v36 = [v35 bottomAnchor];
  v37 = [(ContaineeViewController *)self contentView];
  v38 = [v37 bottomAnchor];
  v39 = [v36 constraintEqualToAnchor:v38];
  v79[7] = v39;
  v40 = +[NSArray arrayWithObjects:v79 count:8];
  +[NSLayoutConstraint activateConstraints:v40];

  v41 = +[TrafficIncidentLayoutManager sharedInstance];
  v42 = [v41 currentIncidentsLayout];
  [(NavTrafficIncidentReportingContaineeViewController *)self setTrafficIncidentLayoutItems:v42];
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NavTrafficIncidentReportingContaineeViewController;
  [(ContaineeViewController *)&v5 viewWillAppear:a3];
  id v4 = [(ContaineeViewController *)self cardPresentationController];
  [v4 setHideGrabber:1];
}

- (void)viewDidAppear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)NavTrafficIncidentReportingContaineeViewController;
  [(NavTrafficIncidentReportingContaineeViewController *)&v9 viewDidAppear:a3];
  [(NavTrafficIncidentReportingContaineeViewController *)self _dismissAfterDelay];
  id v4 = +[MKLocationManager sharedLocationManager];
  objc_super v5 = [v4 currentLocation];
  incidentLocation = self->_incidentLocation;
  self->_incidentLocation = v5;

  v7 = +[MKMapService sharedService];
  [v7 captureUserAction:113 onTarget:0 eventValue:0];

  v8 = [(ContaineeViewController *)self cardPresentationController];
  [v8 updateHeightForCurrentLayout];
}

- (void)_dismissAfterDelay
{
  objc_initWeak(&location, self);
  GEOConfigGetDouble();
  double v4 = v3;
  id v5 = &_dispatch_main_q;
  v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472;
  objc_super v9 = sub_100DACDF4;
  v10 = &unk_1012E7638;
  objc_copyWeak(&v11, &location);
  v6 = +[GCDTimer scheduledTimerWithTimeInterval:&_dispatch_main_q queue:&v7 block:v4];
  -[NavTrafficIncidentReportingContaineeViewController setTimer:](self, "setTimer:", v6, v7, v8, v9, v10);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)setTrafficIncidentLayoutItems:(id)a3
{
  id v5 = a3;
  unint64_t v6 = self->_trafficIncidentLayoutItems;
  unint64_t v7 = (unint64_t)v5;
  if (v7 | v6)
  {
    id v12 = (id)v7;
    unsigned __int8 v8 = [v6 isEqual:];

    unint64_t v7 = (unint64_t)v12;
    if ((v8 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_trafficIncidentLayoutItems, a3);
      objc_super v9 = [(NavTrafficIncidentReportingContaineeViewController *)self tableView];
      [v9 reloadData];

      if (![v12 count])
      {
        v10 = [(NavTrafficIncidentReportingContaineeViewController *)self incidentReportingDelegate];
        [v10 dismissIncidentReportingViewController:self];
      }
      id v11 = [(ContaineeViewController *)self cardPresentationController];
      [v11 updateHeightForCurrentLayout];

      unint64_t v7 = (unint64_t)v12;
    }
  }
}

- (double)heightForLayout:(unint64_t)a3
{
  if (a3 == 1)
  {
    [(ContaineeViewController *)self headerHeight];
    double v15 = v14;
LABEL_10:
    v17 = [(ContaineeViewController *)self cardPresentationController];
    [v17 bottomSafeOffset];
    double v4 = v15 + v18;

    return v4;
  }
  double v4 = -1.0;
  if (a3 == 2)
  {
    id v5 = [(NavTrafficIncidentReportingContaineeViewController *)self tableView];
    uint64_t v6 = (uint64_t)[v5 numberOfRowsInSection:0];

    if (v6 < 1)
    {
      double v8 = 0.0;
    }
    else
    {
      uint64_t v7 = 0;
      double v8 = 0.0;
      do
      {
        objc_super v9 = [(NavTrafficIncidentReportingContaineeViewController *)self tableView];
        v10 = +[NSIndexPath indexPathForRow:v7 inSection:0];
        [(NavTrafficIncidentReportingContaineeViewController *)self tableView:v9 heightForRowAtIndexPath:v10];
        double v8 = v8 + v11;

        ++v7;
        id v12 = [(NavTrafficIncidentReportingContaineeViewController *)self tableView];
        id v13 = [v12 numberOfRowsInSection:0];
      }
      while (v7 < (uint64_t)v13);
    }
    [(ContaineeViewController *)self headerHeight];
    double v15 = v8 + v16 + 16.0;
    goto LABEL_10;
  }
  return v4;
}

- (void)headerViewButtonTapped:(id)a3 buttonType:(unint64_t)a4
{
  id v5 = [(NavTrafficIncidentReportingContaineeViewController *)self incidentReportingDelegate];
  [v5 dismissIncidentReportingViewController:self];

  id v6 = +[MKMapService sharedService];
  [v6 captureUserAction:4 onTarget:667 eventValue:0];
}

- (void)headerViewTapped:(id)a3
{
  double v4 = [(ContaineeViewController *)self cardPresentationController];
  id v5 = [v4 containeeLayout];

  id v6 = [(ContaineeViewController *)self cardPresentationController];
  id v8 = v6;
  if (v5 == (id)1) {
    uint64_t v7 = 2;
  }
  else {
    uint64_t v7 = 1;
  }
  [v6 wantsLayout:v7];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  double v4 = [(NavTrafficIncidentReportingContaineeViewController *)self trafficIncidentLayoutItems];
  id v5 = [v4 count];

  return (int64_t)v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (objc_class *)objc_opt_class();
  objc_super v9 = NSStringFromClass(v8);
  v10 = [v7 dequeueReusableCellWithIdentifier:v9];

  double v11 = [(NavTrafficIncidentReportingContaineeViewController *)self trafficIncidentLayoutItems];
  id v12 = [v6 row];

  id v13 = [v11 objectAtIndexedSubscript:v12];

  [v10 setItem:v13];

  return v10;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(NavTrafficIncidentReportingContaineeViewController *)self trafficIncidentLayoutItems];
  id v9 = [v6 row];

  v10 = [v8 objectAtIndexedSubscript:v9];

  [v7 frame];
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;

  v29.origin.x = v12;
  v29.origin.y = v14;
  v29.size.width = v16;
  v29.size.height = v18;
  double Width = CGRectGetWidth(v29);
  double v20 = [(NavTrafficIncidentReportingContaineeViewController *)self tableView];
  [v20 layoutMargins];
  double v22 = Width - v21;
  v23 = [(NavTrafficIncidentReportingContaineeViewController *)self tableView];
  [v23 layoutMargins];
  double v25 = v22 - v24;

  +[NavIncidentReportingCell heightForCellWithItem:v10 width:v25];
  double v27 = v26;

  return v27;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  [a3 deselectRowAtIndexPath:v6 animated:1];
  id v7 = [(NavTrafficIncidentReportingContaineeViewController *)self trafficIncidentLayoutItems];
  id v8 = [v6 row];

  id v13 = [v7 objectAtIndexedSubscript:v8];

  id v9 = +[MKMapService sharedService];
  v10 = [v13 incidentTypeAsString];
  [v9 captureUserAction:2152 onTarget:667 eventValue:v10];

  [(NavTrafficIncidentReportingContaineeViewController *)self setTimer:0];
  double v11 = [(NavTrafficIncidentReportingContaineeViewController *)self incidentReportingDelegate];
  CGFloat v12 = [(NavTrafficIncidentReportingContaineeViewController *)self incidentLocation];
  [v11 incidentReportingViewController:self selectedTrafficIncidentItem:v13 atLocation:v12];
}

- (NavTrafficIncidentReportingContaineeViewControllerDelegate)incidentReportingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_incidentReportingDelegate);

  return (NavTrafficIncidentReportingContaineeViewControllerDelegate *)WeakRetained;
}

- (GEOLocation)incidentLocation
{
  return self->_incidentLocation;
}

- (void)setIncidentLocation:(id)a3
{
}

- (GCDTimer)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
}

- (NSArray)trafficIncidentLayoutItems
{
  return self->_trafficIncidentLayoutItems;
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_trafficIncidentLayoutItems, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_incidentLocation, 0);

  objc_destroyWeak((id *)&self->_incidentReportingDelegate);
}

@end