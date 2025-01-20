@interface CarIncidentsListCardViewController
- (CarIncidentsListCardViewController)initWithDelegate:(id)a3;
- (CarIncidentsListCardViewControllerDelegate)delegate;
- (NSArray)focusOrderSubItems;
- (NSArray)incidentLayoutItems;
- (NSArray)preferredFocusEnvironments;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)uniqueName;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_refreshDataSource;
- (void)setDelegate:(id)a3;
- (void)setIncidentLayoutItems:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation CarIncidentsListCardViewController

- (CarIncidentsListCardViewController)initWithDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CarIncidentsListCardViewController;
  v5 = [(CarBaseSearchViewController *)&v8 initWithDisabledETAUpdates:1];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_delegate, v4);
  }

  return v6;
}

- (void)viewDidLoad
{
  v23.receiver = self;
  v23.super_class = (Class)CarIncidentsListCardViewController;
  [(CarIncidentsListCardViewController *)&v23 viewDidLoad];
  v3 = [(CarIncidentsListCardViewController *)self view];
  [v3 setAccessibilityIdentifier:@"CarIncidentsListCard"];

  id v4 = -[CarTableView initWithFrame:]([CarTableView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  [(CarBaseSearchViewController *)self setTableView:v4];

  v5 = [(CarBaseSearchViewController *)self tableView];
  [v5 setAccessibilityIdentifier:@"CarIncidentsListCardTableView"];

  v6 = [(CarBaseSearchViewController *)self tableView];
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];

  v7 = [(CarBaseSearchViewController *)self tableView];
  LODWORD(v8) = 1148846080;
  [v7 setContentCompressionResistancePriority:0 forAxis:v8];

  v9 = [(CarBaseSearchViewController *)self tableView];
  LODWORD(v10) = 1148846080;
  [v9 setContentCompressionResistancePriority:1 forAxis:v10];

  v11 = [(CarBaseSearchViewController *)self tableView];
  [v11 setDataSource:self];

  v12 = [(CarBaseSearchViewController *)self tableView];
  [v12 setDelegate:self];

  v13 = +[UIColor clearColor];
  v14 = [(CarBaseSearchViewController *)self tableView];
  [v14 setBackgroundColor:v13];

  v15 = [(CarBaseSearchViewController *)self tableView];
  [v15 _setHeaderAndFooterViewsFloat:0];

  v16 = [(CarBaseSearchViewController *)self tableView];
  [v16 setRowHeight:44.0];

  v17 = [(CarBaseSearchViewController *)self tableView];
  [v17 registerClass:objc_opt_class() forCellReuseIdentifier:@"IncidentsCellReuseIdentifier"];

  v18 = [(CarIncidentsListCardViewController *)self view];
  v19 = [(CarBaseSearchViewController *)self tableView];
  [v18 addSubview:v19];

  v20 = [(CarBaseSearchViewController *)self tableView];
  v21 = [(CarIncidentsListCardViewController *)self view];
  v22 = [v20 _maps_constraintsForCenteringInView:v21];
  +[NSLayoutConstraint activateConstraints:v22];
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)CarIncidentsListCardViewController;
  [(CarIncidentsListCardViewController *)&v3 viewDidLayoutSubviews];
  [(CarIncidentsListCardViewController *)self _refreshDataSource];
}

- (void)_refreshDataSource
{
  id v4 = +[TrafficIncidentLayoutManager sharedInstance];
  objc_super v3 = [v4 currentIncidentsLayout];
  [(CarIncidentsListCardViewController *)self setIncidentLayoutItems:v3];
}

- (void)setIncidentLayoutItems:(id)a3
{
  id v5 = a3;
  if (![(NSArray *)self->_incidentLayoutItems isEqualToArray:v5])
  {
    objc_storeStrong((id *)&self->_incidentLayoutItems, a3);
    v6 = [(CarBaseSearchViewController *)self tableView];
    [v6 reloadData];

    v7 = [(CarBaseSearchViewController *)self tableView];
    [v7 contentSize];
    double v9 = v8 + 23.0;

    tableViewHeight = self->_tableViewHeight;
    if (tableViewHeight)
    {
      [(NSLayoutConstraint *)tableViewHeight setConstant:v9];
    }
    else
    {
      v11 = [(CarBaseSearchViewController *)self tableView];
      v12 = [v11 heightAnchor];
      LODWORD(v13) = 1148846080;
      v14 = [v12 constraintLessThanOrEqualToConstant:v9 priority:v13];
      v15 = self->_tableViewHeight;
      self->_tableViewHeight = v14;

      v17 = self->_tableViewHeight;
      v16 = +[NSArray arrayWithObjects:&v17 count:1];
      +[NSLayoutConstraint activateConstraints:v16];
    }
  }
}

- (id)uniqueName
{
  v2 = objc_opt_class();

  return [v2 description];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return [(NSArray *)self->_incidentLayoutItems count];
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return 44.0;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  v7 = [a3 dequeueReusableCellWithIdentifier:@"IncidentsCellReuseIdentifier" forIndexPath:v6];
  incidentLayoutItems = self->_incidentLayoutItems;
  id v9 = [v6 row];

  double v10 = [(NSArray *)incidentLayoutItems objectAtIndex:v9];
  [v7 setupWithIncidentLayoutItem:v10];

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  double v8 = [(CarIncidentsListCardViewController *)self delegate];
  id v9 = -[NSArray objectAtIndex:](self->_incidentLayoutItems, "objectAtIndex:", [v6 row]);
  [v8 incidentsListCard:self didSelectIncident:v9];

  v10.receiver = self;
  v10.super_class = (Class)CarIncidentsListCardViewController;
  [(CarBaseSearchViewController *)&v10 tableView:v7 didSelectRowAtIndexPath:v6];
}

- (NSArray)focusOrderSubItems
{
  if ([(CarIncidentsListCardViewController *)self isViewLoaded])
  {
    objc_super v3 = [(CarBaseSearchViewController *)self tableView];
    id v4 = [v3 _car_visibleCells];
  }
  else
  {
    id v4 = &__NSArray0__struct;
  }

  return (NSArray *)v4;
}

- (NSArray)preferredFocusEnvironments
{
  if ([(CarIncidentsListCardViewController *)self isViewLoaded])
  {
    objc_super v3 = [(CarBaseSearchViewController *)self tableView];
    id v4 = [v3 preferredFocusEnvironments];
  }
  else
  {
    id v4 = &__NSArray0__struct;
  }

  return (NSArray *)v4;
}

- (CarIncidentsListCardViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CarIncidentsListCardViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)incidentLayoutItems
{
  return self->_incidentLayoutItems;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_incidentLayoutItems, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_tableViewHeight, 0);
}

@end