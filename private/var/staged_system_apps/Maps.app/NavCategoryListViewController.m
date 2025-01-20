@interface NavCategoryListViewController
- (BOOL)_canShowWhileLocked;
- (NSArray)categories;
- (NavCategoryListViewController)initWithDelegate:(id)a3 categories:(id)a4;
- (NavCategoryListViewController)initWithDelegate:(id)a3 usingSearchHome:(id)a4;
- (NavCategoryListViewControllerDelegate)categoryListDelegate;
- (NavSARAPIController)apiController;
- (SearchViewController)searchHomeViewController;
- (UITableView)tableView;
- (double)heightForLayout:(unint64_t)a3;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)didBecomeCurrent;
- (void)didDismissByGesture;
- (void)didResignCurrent;
- (void)headerViewButtonTapped:(id)a3 buttonType:(unint64_t)a4;
- (void)headerViewTapped:(id)a3;
- (void)setApiController:(id)a3;
- (void)setCategories:(id)a3;
- (void)setSearchHomeViewController:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)willBecomeCurrent:(BOOL)a3;
- (void)willBecomeCurrentByGesture;
- (void)willResignCurrent:(BOOL)a3;
@end

@implementation NavCategoryListViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (NavCategoryListViewController)initWithDelegate:(id)a3 categories:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)NavCategoryListViewController;
  v8 = [(NavCategoryListViewController *)&v14 initWithNibName:0 bundle:0];
  v9 = v8;
  if (v8)
  {
    v10 = [(ContaineeViewController *)v8 cardPresentationController];
    [v10 setBlurInCardView:0];

    v11 = +[UIColor colorNamed:@"NavigationMaterialColor"];
    v12 = [(ContaineeViewController *)v9 cardPresentationController];
    [v12 setCardColor:v11];

    [(NavCategoryListViewController *)v9 setCategories:v7];
    objc_storeWeak((id *)&v9->_categoryListDelegate, v6);
  }

  return v9;
}

- (NavCategoryListViewController)initWithDelegate:(id)a3 usingSearchHome:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)NavCategoryListViewController;
  v8 = [(NavCategoryListViewController *)&v16 initWithNibName:0 bundle:0];
  v9 = v8;
  if (v8)
  {
    v10 = [(ContaineeViewController *)v8 cardPresentationController];
    [v10 setBlurInCardView:0];

    v11 = +[UIColor colorNamed:@"NavigationMaterialColor"];
    v12 = [(ContaineeViewController *)v9 cardPresentationController];
    [v12 setCardColor:v11];

    v13 = [(ContaineeViewController *)v9 cardPresentationController];
    [v13 setTakesAvailableHeight:1];

    objc_super v14 = [(ContaineeViewController *)v9 cardPresentationController];
    [v14 setPresentedModally:1];

    objc_storeWeak((id *)&v9->_categoryListDelegate, v6);
    [(NavCategoryListViewController *)v9 setSearchHomeViewController:v7];
  }

  return v9;
}

- (void)viewDidLoad
{
  v94.receiver = self;
  v94.super_class = (Class)NavCategoryListViewController;
  [(ContaineeViewController *)&v94 viewDidLoad];
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  [(NavCategoryListViewController *)self setAccessibilityIdentifier:v4];

  v5 = [(ContaineeViewController *)self contentView];
  [v5 setAccessibilityIdentifier:@"NavCategoryListViewContent"];

  id v6 = [(ContaineeViewController *)self cardPresentationController];
  [v6 setEdgeAttachedRegularHeightDimmingBehavior:2];

  id v93 = objc_alloc_init((Class)NSMutableArray);
  id v7 = objc_opt_new();
  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v7 setAccessibilityIdentifier:@"TitleView"];
  v8 = objc_opt_new();
  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v8 setNumberOfLines:2];
  v9 = +[UIFont _maps_boldSystemFontWithSize:27.0];
  [v8 setFont:v9];

  v10 = +[NSBundle mainBundle];
  v11 = [v10 localizedStringForKey:@"[NavSAR] Add Stop" value:@"localized string not found" table:0];
  [v8 setText:v11];

  [v8 setAccessibilityIdentifier:@"HeaderLabel"];
  [v7 addSubview:v8];
  v91 = [v8 leadingAnchor];
  v88 = [v7 leadingAnchor];
  v85 = [v91 constraintEqualToAnchor:v88 constant:16.0];
  v98[0] = v85;
  v82 = [v8 trailingAnchor];
  v79 = [v7 trailingAnchor];
  v12 = [v82 constraintEqualToAnchor:v79];
  v98[1] = v12;
  v13 = [v8 topAnchor];
  objc_super v14 = [v7 topAnchor];
  v15 = [v13 constraintEqualToAnchor:v14 constant:16.0];
  v98[2] = v15;
  v90 = v8;
  objc_super v16 = [v8 bottomAnchor];
  v17 = [v7 bottomAnchor];
  v18 = [v16 constraintEqualToAnchor:v17 constant:-16.0];
  v98[3] = v18;
  v19 = +[NSArray arrayWithObjects:v98 count:4];
  [v93 addObjectsFromArray:v19];

  v20 = objc_opt_new();
  [v20 setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v21) = 1148846080;
  [v20 setContentCompressionResistancePriority:1 forAxis:v21];
  v92 = v7;
  [v20 setTitleView:v7];
  [v20 setDelegate:self];
  [v20 setHairLineAlpha:0.0];
  [v20 setAccessibilityIdentifier:@"NavCategoryListHeader"];
  v22 = [(ContaineeViewController *)self headerView];
  [v22 addSubview:v20];

  v83 = [v20 topAnchor];
  v86 = [(ContaineeViewController *)self headerView];
  v80 = [v86 topAnchor];
  v77 = [v83 constraintEqualToAnchor:v80];
  v97[0] = v77;
  v73 = [v20 leadingAnchor];
  v75 = [(ContaineeViewController *)self headerView];
  v71 = [v75 leadingAnchor];
  v69 = [v73 constraintEqualToAnchor:v71];
  v97[1] = v69;
  v23 = [v20 trailingAnchor];
  v24 = [(ContaineeViewController *)self headerView];
  v25 = [v24 trailingAnchor];
  v26 = [v23 constraintEqualToAnchor:v25];
  v97[2] = v26;
  v89 = v20;
  v27 = [v20 bottomAnchor];
  v28 = [(ContaineeViewController *)self headerView];
  v29 = [v28 bottomAnchor];
  v30 = [v27 constraintEqualToAnchor:v29];
  v97[3] = v30;
  v31 = +[NSArray arrayWithObjects:v97 count:4];
  [v93 addObjectsFromArray:v31];

  v32 = [(NavCategoryListViewController *)self searchHomeViewController];

  if (v32)
  {
    v33 = [(NavCategoryListViewController *)self searchHomeViewController];
    [(NavCategoryListViewController *)self addChildViewController:v33];

    v34 = [(NavCategoryListViewController *)self searchHomeViewController];
    v35 = [v34 view];

    [v35 setTranslatesAutoresizingMaskIntoConstraints:0];
    v36 = [(ContaineeViewController *)self contentView];
    [v36 addSubview:v35];

    v37 = [(NavCategoryListViewController *)self searchHomeViewController];
    [v37 didMoveToParentViewController:self];

    v38 = [v35 leadingAnchor];
    v39 = [(ContaineeViewController *)self contentView];
    v87 = [v39 leadingAnchor];
    v84 = [v38 constraintEqualToAnchor:];
    v96[0] = v84;
    v40 = [v35 trailingAnchor];
    v78 = [(ContaineeViewController *)self contentView];
    [v78 trailingAnchor];
    v76 = v81 = v40;
    v74 = [v40 constraintEqualToAnchor:];
    v96[1] = v74;
    v41 = [v35 topAnchor];
    v70 = [(ContaineeViewController *)self contentView];
    [v70 topAnchor];
    v68 = v72 = v41;
    v67 = [v41 constraintEqualToAnchor:];
    v96[2] = v67;
    v42 = [v35 bottomAnchor];
    v43 = [(ContaineeViewController *)self contentView];
    v44 = [v43 bottomAnchor];
    v45 = [v42 constraintEqualToAnchor:v44];
    v96[3] = v45;
    v46 = +[NSArray arrayWithObjects:v96 count:4];
    v47 = v93;
    [v93 addObjectsFromArray:v46];
  }
  else
  {
    v48 = [objc_alloc((Class)UITableView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    tableView = self->_tableView;
    self->_tableView = v48;

    [(UITableView *)self->_tableView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UITableView *)self->_tableView setDelegate:self];
    [(UITableView *)self->_tableView setDataSource:self];
    -[UITableView setSeparatorInset:](self->_tableView, "setSeparatorInset:", 0.0, 76.0, 0.0, 16.0);
    [(UITableView *)self->_tableView _setTopPadding:0.0];
    [(UITableView *)self->_tableView _setBottomPadding:0.0];
    [(UITableView *)self->_tableView setSectionHeaderHeight:0.0];
    [(UITableView *)self->_tableView setSectionFooterHeight:16.0];
    [(UITableView *)self->_tableView setAlwaysBounceVertical:0];
    v50 = +[UIColor clearColor];
    [(UITableView *)self->_tableView setBackgroundColor:v50];

    -[UITableView setLayoutMargins:](self->_tableView, "setLayoutMargins:", 0.0, 16.0, 0.0, 16.0);
    v51 = self->_tableView;
    uint64_t v52 = objc_opt_class();
    v53 = (objc_class *)objc_opt_class();
    v54 = NSStringFromClass(v53);
    [(UITableView *)v51 registerClass:v52 forCellReuseIdentifier:v54];

    v55 = +[UIColor colorNamed:@"NavTraySeparatorColor"];
    [(UITableView *)self->_tableView setSeparatorColor:v55];

    [(UITableView *)self->_tableView setAccessibilityIdentifier:@"NavCategoryListTableView"];
    v56 = [(ContaineeViewController *)self contentView];
    [v56 addSubview:self->_tableView];

    v66 = [(NavCategoryListViewController *)self tableView];
    v64 = [v66 leadingAnchor];
    v65 = [(ContaineeViewController *)self contentView];
    v87 = [v65 leadingAnchor];
    v84 = [v64 constraintEqualToAnchor:];
    v95[0] = v84;
    v81 = [(NavCategoryListViewController *)self tableView];
    v57 = [v81 trailingAnchor];
    v76 = [(ContaineeViewController *)self contentView];
    [v76 trailingAnchor];
    v74 = v78 = v57;
    v72 = [v57 constraintEqualToAnchor:];
    v95[1] = v72;
    v70 = [(NavCategoryListViewController *)self tableView];
    v58 = [v70 topAnchor];
    v67 = [(ContaineeViewController *)self contentView];
    v42 = [v67 topAnchor];
    v68 = v58;
    v43 = [v58 constraintEqualToAnchor:v42];
    v95[2] = v43;
    v44 = [(NavCategoryListViewController *)self tableView];
    v45 = [v44 bottomAnchor];
    v46 = [(ContaineeViewController *)self contentView];
    v59 = [v46 bottomAnchor];
    v60 = [v45 constraintEqualToAnchor:v59];
    v95[3] = v60;
    v61 = +[NSArray arrayWithObjects:v95 count:4];
    v47 = v93;
    [v93 addObjectsFromArray:v61];

    v35 = v66;
    v38 = v64;

    v39 = v65;
  }

  v62 = [(NavCategoryListViewController *)self view];
  v63 = [(ContaineeViewController *)self contentView];
  [v62 bringSubviewToFront:v63];

  +[NSLayoutConstraint activateConstraints:v47];
}

- (void)traitCollectionDidChange:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)NavCategoryListViewController;
  id v4 = a3;
  [(MapsThemeViewController *)&v10 traitCollectionDidChange:v4];
  v5 = [(NavCategoryListViewController *)self traitCollection];
  id v6 = [v5 preferredContentSizeCategory];
  id v7 = [v4 preferredContentSizeCategory];

  if (v6 != v7)
  {
    v8 = [(NavCategoryListViewController *)self tableView];
    [v8 reloadData];

    v9 = [(ContaineeViewController *)self cardPresentationController];
    [v9 updateHeightForCurrentLayoutAnimated:1];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)NavCategoryListViewController;
  [(ContaineeViewController *)&v7 viewWillAppear:a3];
  id v4 = [(ContaineeViewController *)self cardPresentationController];
  [v4 setHideGrabber:1];

  v5 = [(NavCategoryListViewController *)self searchHomeViewController];

  if (!v5)
  {
    id v6 = [(NavCategoryListViewController *)self tableView];
    [v6 reloadData];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NavCategoryListViewController;
  [(ContaineeViewController *)&v5 viewWillDisappear:a3];
  id v4 = [(NavCategoryListViewController *)self searchHomeViewController];

  if (!v4) {
    [(NavSARAPIController *)self->_apiController cancelFetchingSARCategories];
  }
}

- (void)willBecomeCurrent:(BOOL)a3
{
  BOOL v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NavCategoryListViewController;
  -[ContaineeViewController willBecomeCurrent:](&v9, "willBecomeCurrent:");
  objc_super v5 = [(NavCategoryListViewController *)self searchHomeViewController];

  if (v5)
  {
    id v6 = [(NavCategoryListViewController *)self searchHomeViewController];
    [v6 cleanSearch];

    objc_super v7 = [(NavCategoryListViewController *)self searchHomeViewController];
    [v7 willBecomeCurrent:v3];

    v8 = [(NavCategoryListViewController *)self searchHomeViewController];
    [v8 searchBarBecomeFirstResponder];
  }
}

- (void)willBecomeCurrentByGesture
{
  v5.receiver = self;
  v5.super_class = (Class)NavCategoryListViewController;
  [(ContaineeViewController *)&v5 willBecomeCurrentByGesture];
  BOOL v3 = [(NavCategoryListViewController *)self searchHomeViewController];

  if (v3)
  {
    id v4 = [(NavCategoryListViewController *)self searchHomeViewController];
    [v4 willBecomeCurrentByGesture];
  }
}

- (void)didBecomeCurrent
{
  v5.receiver = self;
  v5.super_class = (Class)NavCategoryListViewController;
  [(ContaineeViewController *)&v5 didBecomeCurrent];
  BOOL v3 = [(NavCategoryListViewController *)self searchHomeViewController];

  if (v3)
  {
    id v4 = [(NavCategoryListViewController *)self searchHomeViewController];
    [v4 didBecomeCurrent];
  }
}

- (void)willResignCurrent:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)NavCategoryListViewController;
  -[ContaineeViewController willResignCurrent:](&v7, "willResignCurrent:");
  objc_super v5 = [(NavCategoryListViewController *)self searchHomeViewController];

  if (v5)
  {
    id v6 = [(NavCategoryListViewController *)self searchHomeViewController];
    [v6 willResignCurrent:v3];
  }
}

- (void)didResignCurrent
{
  BOOL v3 = [(NavCategoryListViewController *)self searchHomeViewController];

  if (v3)
  {
    id v4 = [(NavCategoryListViewController *)self searchHomeViewController];
    [v4 cleanSearch];

    objc_super v5 = [(NavCategoryListViewController *)self searchHomeViewController];
    [v5 didResignCurrent];

    id v6 = [(NavCategoryListViewController *)self searchHomeViewController];
    [v6 endEditing];
  }
  v7.receiver = self;
  v7.super_class = (Class)NavCategoryListViewController;
  [(ContaineeViewController *)&v7 didResignCurrent];
}

- (double)heightForLayout:(unint64_t)a3
{
  objc_super v5 = [(NavCategoryListViewController *)self searchHomeViewController];

  if (!v5)
  {
    if (a3 == 1)
    {
      [(ContaineeViewController *)self headerHeight];
      double v19 = v18;
    }
    else
    {
      double v7 = -1.0;
      if (a3 != 2) {
        return v7;
      }
      objc_super v9 = [(NavCategoryListViewController *)self tableView];
      uint64_t v10 = (uint64_t)[v9 numberOfRowsInSection:0];

      if (v10 < 1)
      {
        double v12 = 0.0;
      }
      else
      {
        uint64_t v11 = 0;
        double v12 = 0.0;
        do
        {
          v13 = [(NavCategoryListViewController *)self tableView];
          objc_super v14 = +[NSIndexPath indexPathForRow:v11 inSection:0];
          [(NavCategoryListViewController *)self tableView:v13 heightForRowAtIndexPath:v14];
          double v12 = v12 + v15;

          ++v11;
          objc_super v16 = [(NavCategoryListViewController *)self tableView];
          id v17 = [v16 numberOfRowsInSection:0];
        }
        while (v11 < (uint64_t)v17);
      }
      [(ContaineeViewController *)self headerHeight];
      double v19 = v12 + v20 + 16.0;
    }
    double v21 = [(ContaineeViewController *)self cardPresentationController];
    [v21 bottomSafeOffset];
    double v7 = v19 + v22;

    return v7;
  }
  uint64_t v6 = sub_1000BBB44(self);
  if (a3 != 1 || (double v7 = -1.0, v6 != 5))
  {
    v24.receiver = self;
    v24.super_class = (Class)NavCategoryListViewController;
    [(ContaineeViewController *)&v24 heightForLayout:a3];
    return v8;
  }
  return v7;
}

- (void)didDismissByGesture
{
  id v2 = +[MKMapService sharedService];
  [v2 captureUserAction:4 onTarget:59 eventValue:0];
}

- (void)headerViewButtonTapped:(id)a3 buttonType:(unint64_t)a4
{
  objc_super v5 = [(NavCategoryListViewController *)self categoryListDelegate];
  [v5 dismissCategoryList:self];

  id v6 = +[MKMapService sharedService];
  [v6 captureUserAction:4 onTarget:59 eventValue:0];
}

- (void)headerViewTapped:(id)a3
{
  id v4 = [(ContaineeViewController *)self cardPresentationController];
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
  id v4 = [(NavCategoryListViewController *)self categories];
  id v5 = [v4 count];

  return (int64_t)v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (objc_class *)objc_opt_class();
  objc_super v9 = NSStringFromClass(v8);
  uint64_t v10 = [v7 dequeueReusableCellWithIdentifier:v9];

  uint64_t v11 = [(NavCategoryListViewController *)self categories];
  id v12 = [v6 row];

  v13 = [v11 objectAtIndexedSubscript:v12];

  [v10 setCategory:v13];

  return v10;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(NavCategoryListViewController *)self categories];
  id v9 = [v6 row];

  uint64_t v10 = [v8 objectAtIndexedSubscript:v9];

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
  double v20 = [(NavCategoryListViewController *)self tableView];
  [v20 layoutMargins];
  double v22 = Width - v21;
  v23 = [(NavCategoryListViewController *)self tableView];
  [v23 layoutMargins];
  double v25 = v22 - v24;

  +[NavCategoryCell heightForCellWithCategory:v10 width:v25];
  double v27 = v26;

  return v27;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  [a3 deselectRowAtIndexPath:v6 animated:1];
  id v7 = [(NavCategoryListViewController *)self categories];
  id v8 = [v6 row];

  id v11 = [v7 objectAtIndexedSubscript:v8];

  id v9 = [(NavCategoryListViewController *)self categories];
  +[SARAnalytics captureSelectCategory:v11 fromDisplayedCategories:v9 isAddStopTray:1];

  uint64_t v10 = [(NavCategoryListViewController *)self categoryListDelegate];
  [v10 categoryList:self selectedSearchCategory:v11];
}

- (NavCategoryListViewControllerDelegate)categoryListDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_categoryListDelegate);

  return (NavCategoryListViewControllerDelegate *)WeakRetained;
}

- (NavSARAPIController)apiController
{
  return self->_apiController;
}

- (void)setApiController:(id)a3
{
}

- (NSArray)categories
{
  return self->_categories;
}

- (void)setCategories:(id)a3
{
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (SearchViewController)searchHomeViewController
{
  return self->_searchHomeViewController;
}

- (void)setSearchHomeViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchHomeViewController, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_categories, 0);
  objc_storeStrong((id *)&self->_apiController, 0);

  objc_destroyWeak((id *)&self->_categoryListDelegate);
}

@end