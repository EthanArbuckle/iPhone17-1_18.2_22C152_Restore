@interface CarAdvisoryListCardViewController
- (CarAdvisoryListCardViewController)initWithRoute:(id)a3 delegate:(id)a4;
- (CarAdvisoryListCardViewControllerDelegate)delegate;
- (GEOComposedRoute)route;
- (NSArray)advisoryItems;
- (NSArray)focusOrderSubItems;
- (NSArray)preferredFocusEnvironments;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)itemAtIndexPath:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)uniqueName;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)numberOfItems;
- (void)setAdvisoryItems:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setRoute:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation CarAdvisoryListCardViewController

- (CarAdvisoryListCardViewController)initWithRoute:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CarAdvisoryListCardViewController;
  v8 = [(CarBaseSearchViewController *)&v12 initWithDisabledETAUpdates:1];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v7);
    [(CarAdvisoryListCardViewController *)v9 setRoute:v6];
    v10 = [(CarBaseSearchViewController *)v9 tableView];
    [v10 reloadData];
  }
  return v9;
}

- (void)setRoute:(id)a3
{
  if (self->_route != a3)
  {
    id v6 = [a3 clickableAdvisory];
    v4 = [v6 advisoryItems];
    advisoryItems = self->_advisoryItems;
    self->_advisoryItems = v4;
  }
}

- (void)viewDidLoad
{
  v25.receiver = self;
  v25.super_class = (Class)CarAdvisoryListCardViewController;
  [(CarAdvisoryListCardViewController *)&v25 viewDidLoad];
  v3 = [(CarAdvisoryListCardViewController *)self view];
  [v3 setAccessibilityIdentifier:@"CarAdvisoryListCard"];

  v4 = -[CarTableView initWithFrame:]([CarTableView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  [(CarBaseSearchViewController *)self setTableView:v4];

  v5 = [(CarBaseSearchViewController *)self tableView];
  [v5 setAccessibilityIdentifier:@"CarAdvisoryListCardTableView"];

  id v6 = [(CarBaseSearchViewController *)self tableView];
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v7 = [(CarBaseSearchViewController *)self tableView];
  LODWORD(v8) = 1148846080;
  [v7 setContentCompressionResistancePriority:0 forAxis:v8];

  v9 = [(CarBaseSearchViewController *)self tableView];
  LODWORD(v10) = 1148846080;
  [v9 setContentCompressionResistancePriority:1 forAxis:v10];

  v11 = [(CarBaseSearchViewController *)self tableView];
  [v11 setDataSource:self];

  objc_super v12 = [(CarBaseSearchViewController *)self tableView];
  [v12 setDelegate:self];

  v13 = +[UIColor clearColor];
  v14 = [(CarBaseSearchViewController *)self tableView];
  [v14 setBackgroundColor:v13];

  v15 = [(CarBaseSearchViewController *)self tableView];
  [v15 _setHeaderAndFooterViewsFloat:0];

  v16 = [(CarBaseSearchViewController *)self tableView];
  [v16 setRowHeight:44.0];

  v17 = [(CarBaseSearchViewController *)self tableView];
  uint64_t v18 = objc_opt_class();
  v19 = +[CarSearchItemCell reuseIdentifier];
  [v17 registerClass:v18 forCellReuseIdentifier:v19];

  v20 = [(CarAdvisoryListCardViewController *)self view];
  v21 = [(CarBaseSearchViewController *)self tableView];
  [v20 addSubview:v21];

  v22 = [(CarBaseSearchViewController *)self tableView];
  v23 = [(CarAdvisoryListCardViewController *)self view];
  v24 = [v22 _maps_constraintsForCenteringInView:v23];
  +[NSLayoutConstraint activateConstraints:v24];
}

- (id)uniqueName
{
  v2 = objc_opt_class();

  return [v2 description];
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return 44.0;
}

- (id)itemAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [v4 row];
  if (v5 >= (id)[(NSArray *)self->_advisoryItems count])
  {
    id v6 = 0;
  }
  else
  {
    id v6 = -[NSArray objectAtIndex:](self->_advisoryItems, "objectAtIndex:", [v4 row]);
  }

  return v6;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  double v8 = [(CarAdvisoryListCardViewController *)self itemAtIndexPath:v6];
  v9 = +[CarSearchItemCell reuseIdentifier];
  double v10 = [v7 dequeueReusableCellWithIdentifier:v9 forIndexPath:v6];

  [v10 setAccessibilityIdentifier:@"CarAdvisoryCell"];
  v11 = [(CarBaseSearchViewController *)self modelForItemAtIndexPath:v6];

  if (!v11)
  {
    v11 = +[CarSearchItemCellModel modelWithUpdateBlock:0];
    [v8 updateModel:v11];
  }
  [v10 setupWithModel:v11 cellStyle:[self cellStyle]];

  return v10;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return [(NSArray *)self->_advisoryItems count];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  advisoryItems = self->_advisoryItems;
  id v7 = a4;
  id v8 = a3;
  v9 = -[NSArray objectAtIndex:](advisoryItems, "objectAtIndex:", [v7 row]);
  double v10 = [(CarAdvisoryListCardViewController *)self delegate];
  [v10 advisoryListCardDidSelectAdvisoryItem:v9];

  v11.receiver = self;
  v11.super_class = (Class)CarAdvisoryListCardViewController;
  [(CarBaseSearchViewController *)&v11 tableView:v8 didSelectRowAtIndexPath:v7];
}

- (unint64_t)numberOfItems
{
  return [(NSArray *)self->_advisoryItems count];
}

- (NSArray)focusOrderSubItems
{
  if ([(CarAdvisoryListCardViewController *)self isViewLoaded])
  {
    v3 = [(CarBaseSearchViewController *)self tableView];
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
  if ([(CarAdvisoryListCardViewController *)self isViewLoaded])
  {
    v3 = [(CarBaseSearchViewController *)self tableView];
    id v4 = [v3 preferredFocusEnvironments];
  }
  else
  {
    id v4 = &__NSArray0__struct;
  }

  return (NSArray *)v4;
}

- (GEOComposedRoute)route
{
  return self->_route;
}

- (NSArray)advisoryItems
{
  return self->_advisoryItems;
}

- (void)setAdvisoryItems:(id)a3
{
}

- (CarAdvisoryListCardViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CarAdvisoryListCardViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_advisoryItems, 0);

  objc_storeStrong((id *)&self->_route, 0);
}

@end