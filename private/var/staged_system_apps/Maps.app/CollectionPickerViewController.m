@interface CollectionPickerViewController
- (CGSize)contentSize;
- (CollectionPickerViewController)initWithCollectionEditSession:(id)a3;
- (CollectionPickerViewControllerDelegate)delegate;
- (void)dataSource:(id)a3 itemTapped:(id)a4;
- (void)dataSourceUpdated:(id)a3;
- (void)loadDataSource;
- (void)setDelegate:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation CollectionPickerViewController

- (CollectionPickerViewController)initWithCollectionEditSession:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CollectionPickerViewController;
  v6 = [(CollectionPickerViewController *)&v9 initWithNibName:0 bundle:0];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_collectionSession, a3);
  }

  return v7;
}

- (void)viewDidLoad
{
  v25.receiver = self;
  v25.super_class = (Class)CollectionPickerViewController;
  [(CollectionPickerViewController *)&v25 viewDidLoad];
  v3 = [(CollectionPickerViewController *)self view];
  [v3 setAccessibilityIdentifier:@"CollectionPicker"];

  v4 = -[MapsThemeTableView initWithFrame:style:]([MapsThemeTableView alloc], "initWithFrame:style:", 0, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  tableView = self->_tableView;
  self->_tableView = &v4->super;

  [(UITableView *)self->_tableView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UITableView *)self->_tableView setSectionHeaderTopPadding:0.0];
  v6 = +[UIColor clearColor];
  [(UITableView *)self->_tableView setBackgroundColor:v6];

  [(UITableView *)self->_tableView setAccessibilityIdentifier:@"CollectionPickerTable"];
  v7 = [(CollectionPickerViewController *)self view];
  [v7 addSubview:self->_tableView];

  v23 = [(UITableView *)self->_tableView topAnchor];
  v24 = [(CollectionPickerViewController *)self view];
  v22 = [v24 topAnchor];
  v21 = [v23 constraintEqualToAnchor:v22];
  v26[0] = v21;
  v19 = [(UITableView *)self->_tableView leadingAnchor];
  v20 = [(CollectionPickerViewController *)self view];
  v18 = [v20 leadingAnchor];
  v17 = [v19 constraintEqualToAnchor:v18];
  v26[1] = v17;
  v8 = [(UITableView *)self->_tableView bottomAnchor];
  objc_super v9 = [(CollectionPickerViewController *)self view];
  v10 = [v9 bottomAnchor];
  v11 = [v8 constraintEqualToAnchor:v10];
  v26[2] = v11;
  v12 = [(UITableView *)self->_tableView trailingAnchor];
  v13 = [(CollectionPickerViewController *)self view];
  v14 = [v13 trailingAnchor];
  v15 = [v12 constraintEqualToAnchor:v14];
  v26[3] = v15;
  v16 = +[NSArray arrayWithObjects:v26 count:4];
  +[NSLayoutConstraint activateConstraints:v16];

  [(CollectionPickerViewController *)self loadDataSource];
}

- (CGSize)contentSize
{
  +[CollectionTableViewCell estimatedCellHeight];
  double v4 = v3;
  id v5 = [(UITableView *)self->_tableView visibleCells];
  v6 = [v5 firstObject];

  if (v6)
  {
    [v6 frame];
    if (v7 > v4)
    {
      [v6 frame];
      double v4 = v8;
    }
  }
  v14.receiver = self;
  v14.super_class = (Class)CollectionPickerViewController;
  [(CollectionPickerViewController *)&v14 preferredContentSize];
  double v10 = v9;
  double v11 = (double)[(CollectionListDataSource *)self->_collectionListDataSource entriesCount] * v4 + 1.0;

  double v12 = v10;
  double v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

- (void)viewDidLayoutSubviews
{
  v11.receiver = self;
  v11.super_class = (Class)CollectionPickerViewController;
  [(CollectionPickerViewController *)&v11 viewDidLayoutSubviews];
  [(CollectionPickerViewController *)self contentSize];
  double v4 = v3;
  double v6 = v5;
  [(CollectionPickerViewController *)self preferredContentSize];
  if (v4 != v8 || v6 != v7) {
    -[CollectionPickerViewController setPreferredContentSize:](self, "setPreferredContentSize:", v4, v6);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1004273E0;
  block[3] = &unk_1012E8160;
  block[4] = self;
  *(double *)&block[5] = v4;
  *(double *)&block[6] = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CollectionPickerViewController;
  [(CollectionPickerViewController *)&v4 viewDidAppear:a3];
  [(CollectionPickerViewController *)self contentSize];
  -[CollectionPickerViewController setPreferredContentSize:](self, "setPreferredContentSize:");
}

- (void)loadDataSource
{
  double v3 = [[CollectionListDataSource alloc] initWithTableView:self->_tableView editSession:self->_collectionSession showsAddCollection:1];
  collectionListDataSource = self->_collectionListDataSource;
  self->_collectionListDataSource = v3;

  [(CollectionListDataSource *)self->_collectionListDataSource setCellsSize:1];
  [self->_collectionListDataSource setDelegate:self];
  [(UITableView *)self->_tableView setDelegate:self->_collectionListDataSource];
  [(UITableView *)self->_tableView setDataSource:self->_collectionListDataSource];
  [self->_collectionListDataSource setActive:1];
  [(CollectionPickerViewController *)self contentSize];

  -[CollectionPickerViewController setPreferredContentSize:](self, "setPreferredContentSize:");
}

- (void)dataSourceUpdated:(id)a3
{
  if (self->_collectionListDataSource == a3)
  {
    [(UITableView *)self->_tableView reloadData];
    [(CollectionPickerViewController *)self contentSize];
    -[CollectionPickerViewController setPreferredContentSize:](self, "setPreferredContentSize:");
  }
}

- (void)dataSource:(id)a3 itemTapped:(id)a4
{
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained collectionPickerViewController:self selectCollection:v6];
  }
}

- (CollectionPickerViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CollectionPickerViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_collectionListDataSource, 0);
  objc_storeStrong((id *)&self->_tableView, 0);

  objc_storeStrong((id *)&self->_collectionSession, 0);
}

@end