@interface RAPRouteListViewController
- (RAPRouteListViewController)initWithReport:(id)a3 delegate:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_dismiss;
- (void)_displayEmptyState;
- (void)_setupViews;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation RAPRouteListViewController

- (RAPRouteListViewController)initWithReport:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)RAPRouteListViewController;
  v9 = [(RAPRouteListViewController *)&v16 init];
  v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_delegate, v8);
    objc_storeStrong((id *)&v10->_report, a3);
    v11 = [(RAPReport *)v10->_report _context];
    v12 = [v11 directionsHistory];
    uint64_t v13 = sub_1000AC254(v12, &stru_1012F4840);
    requests = v10->_requests;
    v10->_requests = (NSArray *)v13;
  }
  return v10;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)RAPRouteListViewController;
  [(RAPRouteListViewController *)&v3 viewDidLoad];
  [(RAPRouteListViewController *)self _setupViews];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RAPRouteListViewController;
  -[RAPRouteListViewController viewWillAppear:](&v9, "viewWillAppear:");
  v5 = [(RAPRouteListViewController *)self traitCollection];
  id v6 = [v5 userInterfaceIdiom];

  if (!v6)
  {
    id v7 = +[UIApplication sharedMapsDelegate];
    [v7 setLockedOrientations:2];

    id v8 = +[UIDevice currentDevice];
    [v8 setOrientation:1 animated:v3];
  }
  if (![(NSArray *)self->_requests count]) {
    [(RAPRouteListViewController *)self _displayEmptyState];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)RAPRouteListViewController;
  [(RAPRouteListViewController *)&v7 viewWillDisappear:a3];
  v4 = [(RAPRouteListViewController *)self traitCollection];
  id v5 = [v4 userInterfaceIdiom];

  if (!v5)
  {
    id v6 = +[UIApplication sharedMapsDelegate];
    [v6 setLockedOrientations:0];
  }
}

- (void)_setupViews
{
  id v17 = +[MapsTheme visualEffectViewAllowingBlur:1];
  BOOL v3 = [objc_alloc((Class)UITableView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  tableView = self->_tableView;
  self->_tableView = v3;

  [(UITableView *)self->_tableView setTranslatesAutoresizingMaskIntoConstraints:0];
  id v5 = +[UIColor clearColor];
  [(UITableView *)self->_tableView setBackgroundColor:v5];

  [(UITableView *)self->_tableView setBackgroundView:v17];
  LODWORD(v6) = 1148846080;
  [(UITableView *)self->_tableView setContentCompressionResistancePriority:0 forAxis:v6];
  LODWORD(v7) = 1148846080;
  [(UITableView *)self->_tableView setContentCompressionResistancePriority:1 forAxis:v7];
  [(UITableView *)self->_tableView setDataSource:self];
  [(UITableView *)self->_tableView setDelegate:self];
  [(UITableView *)self->_tableView registerClass:objc_opt_class() forCellReuseIdentifier:@"kRAPRouteCellReuseIdentifier"];
  id v8 = [(RAPRouteListViewController *)self view];
  [v8 addSubview:self->_tableView];

  id v9 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:1 target:self action:"_onCancelPressed:"];
  v10 = [(RAPRouteListViewController *)self navigationItem];
  [v10 setLeftBarButtonItem:v9];

  v11 = +[NSBundle mainBundle];
  v12 = [v11 localizedStringForKey:@"[RAP Web UI] Report an Issue" value:@"localized string not found" table:0];
  uint64_t v13 = [(RAPRouteListViewController *)self navigationItem];
  [v13 setTitle:v12];

  v14 = self->_tableView;
  v15 = [(RAPRouteListViewController *)self view];
  objc_super v16 = [(UITableView *)v14 _maps_constraintsForCenteringInView:v15];
  +[NSLayoutConstraint activateConstraints:v16];
}

- (void)_displayEmptyState
{
  BOOL v3 = objc_alloc_init(ErrorModeView);
  errorModeView = self->_errorModeView;
  self->_errorModeView = v3;

  [(ErrorModeView *)self->_errorModeView setTranslatesAutoresizingMaskIntoConstraints:0];
  id v5 = self->_errorModeView;
  double v6 = +[NSBundle mainBundle];
  double v7 = [v6 localizedStringForKey:@"[RAP Web UI] No Recent Routes" value:@"localized string not found" table:0];
  id v8 = +[NSBundle mainBundle];
  id v9 = [v8 localizedStringForKey:@"[RAP Web UI] No Recent Routes Description" value:@"localized string not found" table:0];
  [(ErrorModeView *)v5 setTitle:v7 andMessage:v9];

  [(ErrorModeView *)self->_errorModeView setTitleLabelFontProvider:&stru_101321460];
  [(ErrorModeView *)self->_errorModeView setMessageLabelFontProvider:&stru_101321520];
  v10 = [(RAPRouteListViewController *)self view];
  [v10 insertSubview:self->_errorModeView aboveSubview:self->_tableView];

  v11 = self->_errorModeView;
  id v13 = [(RAPRouteListViewController *)self view];
  v12 = [(ErrorModeView *)v11 _maps_constraintsForCenteringInView:v13];
  +[NSLayoutConstraint activateConstraints:v12];
}

- (void)_dismiss
{
  BOOL v3 = +[MKMapService sharedService];
  [v3 captureUserAction:10109 onTarget:69 eventValue:0];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained rapRouteListViewControllerDidDismiss:self];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return [(NSArray *)self->_requests count];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  double v7 = [a3 dequeueReusableCellWithIdentifier:@"kRAPRouteCellReuseIdentifier" forIndexPath:v6];
  requests = self->_requests;
  id v9 = [v6 row];

  v10 = [(NSArray *)requests objectAtIndexedSubscript:v9];
  [v7 configureWithRequest:v10];

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  tableView = self->_tableView;
  id v6 = a4;
  [(UITableView *)tableView deselectRowAtIndexPath:v6 animated:1];
  requests = self->_requests;
  id v8 = [v6 row];

  id v10 = [(NSArray *)requests objectAtIndexedSubscript:v8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained rapRouteListViewController:self didSelectRequest:v10];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorModeView, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_requests, 0);
  objc_storeStrong((id *)&self->_report, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end