@interface MacChargingNetworksPickerViewController
- (MacChargingNetworksPickerViewController)initWithExcludedNetworks:(id)a3 delegate:(id)a4;
- (_TtC4Maps26ChargingNetworksDataSource)dataSource;
- (_TtP4Maps43ChargingNetworkPickerViewControllerDelegate_)delegate;
- (void)_setupConstraints;
- (void)_setupSubviews;
- (void)_updateAddButton;
- (void)_updateContent;
- (void)didDeselectNetwork:(id)a3 isSuggested:(BOOL)a4;
- (void)didSelectNetwork:(id)a3 isSuggested:(BOOL)a4;
- (void)macFooterViewBackButtonTapped:(id)a3;
- (void)macFooterViewLeftButtonTapped:(id)a3;
- (void)macFooterViewRightButtonTapped:(id)a3;
- (void)searchBar:(id)a3 textDidChange:(id)a4;
- (void)searchBarCancelButtonClicked:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation MacChargingNetworksPickerViewController

- (MacChargingNetworksPickerViewController)initWithExcludedNetworks:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)MacChargingNetworksPickerViewController;
  v8 = [(MacChargingNetworksPickerViewController *)&v13 initWithNibName:0 bundle:0];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v7);
    v10 = [[_TtC4Maps26ChargingNetworksDataSource alloc] initWithExcludedNetworks:v6 context:2 delegate:v9];
    dataSource = v9->_dataSource;
    v9->_dataSource = v10;
  }
  return v9;
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)MacChargingNetworksPickerViewController;
  [(MacChargingNetworksPickerViewController *)&v4 viewDidLoad];
  v3 = [(MacChargingNetworksPickerViewController *)self navigationController];
  [v3 setNavigationBarHidden:1];

  [(MacChargingNetworksPickerViewController *)self _setupSubviews];
  [(MacChargingNetworksPickerViewController *)self _setupConstraints];
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MacChargingNetworksPickerViewController;
  [(MacChargingNetworksPickerViewController *)&v6 viewWillAppear:a3];
  [(MacFooterView *)self->_footerView layoutIfNeeded];
  [(MacFooterView *)self->_footerView frame];
  -[MacChargingNetworksPickerViewController setAdditionalSafeAreaInsets:](self, "setAdditionalSafeAreaInsets:", 0.0, 0.0, v4, 0.0);
  v5 = [(MacChargingNetworksPickerViewController *)self view];
  [v5 bringSubviewToFront:self->_footerView];
}

- (void)_setupSubviews
{
  v3 = (UISearchBar *)objc_alloc_init((Class)UISearchBar);
  searchBar = self->_searchBar;
  self->_searchBar = v3;

  [(UISearchBar *)self->_searchBar setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UISearchBar *)self->_searchBar setDelegate:self];
  v5 = objc_opt_new();
  [(UISearchBar *)self->_searchBar setBackgroundImage:v5];

  objc_super v6 = +[UIColor clearColor];
  [(UISearchBar *)self->_searchBar setBackgroundColor:v6];

  id v7 = [(UISearchBar *)self->_searchBar layer];
  [v7 setCornerRadius:10.0];

  [(UISearchBar *)self->_searchBar setClipsToBounds:1];
  v8 = +[NSBundle mainBundle];
  v9 = [v8 localizedStringForKey:@"Networks picker" value:@"localized string not found" table:0];
  [(UISearchBar *)self->_searchBar setPlaceholder:v9];

  v10 = [(UISearchBar *)self->_searchBar searchTextField];
  [v10 setControlSize:2];

  [(UISearchBar *)self->_searchBar setReturnKeyType:9];
  -[UISearchBar setContentInset:](self->_searchBar, "setContentInset:", 16.0, 16.0, 10.0, 16.0);
  v11 = [(UISearchBar *)self->_searchBar searchTextField];
  [v11 setDelegate:self];

  v12 = [(MacChargingNetworksPickerViewController *)self view];
  [v12 addSubview:self->_searchBar];

  objc_super v13 = (UITableView *)[objc_alloc((Class)UITableView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  tableView = self->_tableView;
  self->_tableView = v13;

  [(UITableView *)self->_tableView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UITableView *)self->_tableView setAllowsMultipleSelection:1];
  LODWORD(v15) = 1148846080;
  [(UITableView *)self->_tableView setContentCompressionResistancePriority:1 forAxis:v15];
  [(UITableView *)self->_tableView setDataSource:self->_dataSource];
  [(UITableView *)self->_tableView setDelegate:self->_dataSource];
  -[UITableView setDirectionalLayoutMargins:](self->_tableView, "setDirectionalLayoutMargins:", 0.0, 16.0, 0.0, 16.0);
  v16 = +[UIColor clearColor];
  [(UITableView *)self->_tableView setBackgroundColor:v16];

  v17 = self->_tableView;
  uint64_t v18 = objc_opt_class();
  v19 = +[ChargingNetworkPickerViewController reuseIdentifier];
  [(UITableView *)v17 registerClass:v18 forCellReuseIdentifier:v19];

  id v20 = [objc_alloc((Class)UIView) initWithFrame:0.0, 0.0, 0.0, 2.22507386e-308];
  [(UITableView *)self->_tableView setTableHeaderView:v20];

  v21 = +[UIColor clearColor];
  [(UITableView *)self->_tableView setBackgroundColor:v21];

  v22 = [(MacChargingNetworksPickerViewController *)self view];
  [v22 addSubview:self->_tableView];

  v23 = [[MacFooterView alloc] initWithNoBlurRightSideButtonsOfType:1];
  footerView = self->_footerView;
  self->_footerView = v23;

  [(MacFooterView *)self->_footerView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(MacFooterView *)self->_footerView setDelegate:self];
  [(MacFooterView *)self->_footerView setRightButtonEnabled:0];
  id v25 = [(MacChargingNetworksPickerViewController *)self view];
  [v25 addSubview:self->_footerView];
}

- (void)_setupConstraints
{
  v44 = [(UISearchBar *)self->_searchBar topAnchor];
  v45 = [(MacChargingNetworksPickerViewController *)self view];
  v43 = [v45 topAnchor];
  v42 = [v44 constraintEqualToAnchor:v43];
  v46[0] = v42;
  v40 = [(UISearchBar *)self->_searchBar leadingAnchor];
  v41 = [(MacChargingNetworksPickerViewController *)self view];
  v39 = [v41 leadingAnchor];
  v38 = [v40 constraintEqualToAnchor:v39];
  v46[1] = v38;
  v36 = [(UISearchBar *)self->_searchBar trailingAnchor];
  v37 = [(MacChargingNetworksPickerViewController *)self view];
  v35 = [v37 trailingAnchor];
  v34 = [v36 constraintEqualToAnchor:v35];
  v46[2] = v34;
  v33 = [(UITableView *)self->_tableView topAnchor];
  v32 = [(UISearchBar *)self->_searchBar bottomAnchor];
  v31 = [v33 constraintEqualToAnchor:v32];
  v46[3] = v31;
  v29 = [(UITableView *)self->_tableView bottomAnchor];
  v30 = [(MacChargingNetworksPickerViewController *)self view];
  v28 = [v30 safeAreaLayoutGuide];
  v27 = [v28 bottomAnchor];
  v26 = [v29 constraintEqualToAnchor:v27];
  v46[4] = v26;
  v24 = [(UITableView *)self->_tableView leadingAnchor];
  id v25 = [(MacChargingNetworksPickerViewController *)self view];
  v23 = [v25 safeAreaLayoutGuide];
  v22 = [v23 leadingAnchor];
  v21 = [v24 constraintEqualToAnchor:v22];
  v46[5] = v21;
  v19 = [(UITableView *)self->_tableView trailingAnchor];
  id v20 = [(MacChargingNetworksPickerViewController *)self view];
  uint64_t v18 = [v20 safeAreaLayoutGuide];
  v17 = [v18 trailingAnchor];
  v16 = [v19 constraintEqualToAnchor:v17];
  v46[6] = v16;
  v14 = [(MacFooterView *)self->_footerView leadingAnchor];
  double v15 = [(MacChargingNetworksPickerViewController *)self view];
  objc_super v13 = [v15 leadingAnchor];
  v3 = [v14 constraintEqualToAnchor:v13];
  v46[7] = v3;
  double v4 = [(MacFooterView *)self->_footerView trailingAnchor];
  v5 = [(MacChargingNetworksPickerViewController *)self view];
  objc_super v6 = [v5 trailingAnchor];
  id v7 = [v4 constraintEqualToAnchor:v6];
  v46[8] = v7;
  v8 = [(MacFooterView *)self->_footerView bottomAnchor];
  v9 = [(MacChargingNetworksPickerViewController *)self view];
  v10 = [v9 bottomAnchor];
  v11 = [v8 constraintEqualToAnchor:v10];
  v46[9] = v11;
  v12 = +[NSArray arrayWithObjects:v46 count:10];
  +[NSLayoutConstraint activateConstraints:v12];
}

- (void)_updateContent
{
}

- (void)_updateAddButton
{
  v3 = [(ChargingNetworksDataSource *)self->_dataSource selectedNetworks];
  BOOL v4 = [v3 count] != 0;

  footerView = self->_footerView;

  [(MacFooterView *)footerView setRightButtonEnabled:v4];
}

- (void)didSelectNetwork:(id)a3 isSuggested:(BOOL)a4
{
  if (a4) {
    uint64_t v5 = 455;
  }
  else {
    uint64_t v5 = 443;
  }
  objc_super v6 = +[MKMapService sharedService];
  [v6 captureUserAction:v5 onTarget:122 eventValue:0];

  [(MacChargingNetworksPickerViewController *)self _updateAddButton];
}

- (void)didDeselectNetwork:(id)a3 isSuggested:(BOOL)a4
{
  if (a4) {
    uint64_t v5 = 439;
  }
  else {
    uint64_t v5 = 448;
  }
  objc_super v6 = +[MKMapService sharedService];
  [v6 captureUserAction:v5 onTarget:122 eventValue:0];

  [(MacChargingNetworksPickerViewController *)self _updateAddButton];
}

- (void)macFooterViewLeftButtonTapped:(id)a3
{
}

- (void)macFooterViewRightButtonTapped:(id)a3
{
  [(MacChargingNetworksPickerViewController *)self dismissViewControllerAnimated:1 completion:0];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  BOOL v4 = [(ChargingNetworksDataSource *)self->_dataSource selectedNetworks];
  uint64_t v5 = [v4 allObjects];
  [WeakRetained networkPickerControllerDidSelectNetworks:v5];
}

- (void)macFooterViewBackButtonTapped:(id)a3
{
  v3 = sub_1005762E4();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v6 = 136315650;
    id v7 = "-[MacChargingNetworksPickerViewController macFooterViewBackButtonTapped:]";
    __int16 v8 = 2080;
    v9 = "MacChargingNetworksPickerViewController.m";
    __int16 v10 = 1024;
    int v11 = 172;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", (uint8_t *)&v6, 0x1Cu);
  }

  if (sub_100BB36BC())
  {
    BOOL v4 = sub_1005762E4();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = +[NSThread callStackSymbols];
      int v6 = 138412290;
      id v7 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
}

- (void)searchBarCancelButtonClicked:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1004EF4D0;
  block[3] = &unk_1012E5D08;
  id v5 = a3;
  id v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (_TtP4Maps43ChargingNetworkPickerViewControllerDelegate_)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (_TtP4Maps43ChargingNetworkPickerViewControllerDelegate_ *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (_TtC4Maps26ChargingNetworksDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_tableView, 0);

  objc_storeStrong((id *)&self->_searchBar, 0);
}

@end