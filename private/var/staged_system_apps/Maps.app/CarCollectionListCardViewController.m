@interface CarCollectionListCardViewController
- (CarCollectionListCardViewController)initWithCollections:(id)a3 delegate:(id)a4;
- (CarCollectionListCardViewControllerDelegate)delegate;
- (CarTableView)tableView;
- (NSArray)collections;
- (NSArray)focusOrderSubItems;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)setCollections:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setTableView:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation CarCollectionListCardViewController

- (CarCollectionListCardViewController)initWithCollections:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CarCollectionListCardViewController;
  v9 = [(CarCollectionListCardViewController *)&v12 initWithNibName:0 bundle:0];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_collections, a3);
    objc_storeWeak((id *)&v10->_delegate, v8);
  }

  return v10;
}

- (void)viewDidLoad
{
  v16.receiver = self;
  v16.super_class = (Class)CarCollectionListCardViewController;
  [(CarCollectionListCardViewController *)&v16 viewDidLoad];
  v3 = [(CarCollectionListCardViewController *)self view];
  [v3 setAccessibilityIdentifier:@"CarCollectionListCard"];

  v4 = objc_alloc_init(CarTableView);
  tableView = self->_tableView;
  self->_tableView = v4;

  [(CarTableView *)self->_tableView setAccessibilityIdentifier:@"CarCollectionListCardTableView"];
  [(CarTableView *)self->_tableView setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v6) = 1148846080;
  [(CarTableView *)self->_tableView setContentCompressionResistancePriority:0 forAxis:v6];
  LODWORD(v7) = 1148846080;
  [(CarTableView *)self->_tableView setContentCompressionResistancePriority:1 forAxis:v7];
  [(CarTableView *)self->_tableView setDataSource:self];
  [(CarTableView *)self->_tableView setDelegate:self];
  id v8 = +[UIColor clearColor];
  [(CarTableView *)self->_tableView setBackgroundColor:v8];

  [(CarTableView *)self->_tableView setRowHeight:UITableViewAutomaticDimension];
  v9 = self->_tableView;
  uint64_t v10 = objc_opt_class();
  v11 = +[CarCollectionCell reuseIdentifier];
  [(CarTableView *)v9 registerClass:v10 forCellReuseIdentifier:v11];

  objc_super v12 = [(CarCollectionListCardViewController *)self view];
  [v12 addSubview:self->_tableView];

  v13 = self->_tableView;
  v14 = [(CarCollectionListCardViewController *)self view];
  v15 = [(CarTableView *)v13 _maps_constraintsForCenteringInView:v14];
  +[NSLayoutConstraint activateConstraints:v15];
}

- (void)setCollections:(id)a3
{
  v5 = (NSArray *)a3;
  if (self->_collections != v5)
  {
    double v6 = sub_100015DB4();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
LABEL_9:

      objc_storeStrong((id *)&self->_collections, a3);
      [(CarTableView *)self->_tableView reloadData];
      goto LABEL_10;
    }
    double v7 = self;
    id v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    if (objc_opt_respondsToSelector())
    {
      uint64_t v10 = [(CarCollectionListCardViewController *)v7 performSelector:"accessibilityIdentifier"];
      v11 = v10;
      if (v10 && ![v10 isEqualToString:v9])
      {
        objc_super v12 = +[NSString stringWithFormat:@"%@<%p, %@>", v9, v7, v11];

        goto LABEL_8;
      }
    }
    objc_super v12 = +[NSString stringWithFormat:@"%@<%p>", v9, v7];
LABEL_8:

    NSUInteger v13 = [(NSArray *)self->_collections count];
    *(_DWORD *)buf = 138543874;
    v15 = v12;
    __int16 v16 = 2048;
    NSUInteger v17 = v13;
    __int16 v18 = 2048;
    NSUInteger v19 = [(NSArray *)v5 count];
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}@] CarSearchCategoriesCardVC didUpdate collections, previously: %ld, now: %ld", buf, 0x20u);

    goto LABEL_9;
  }
LABEL_10:
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return [(NSArray *)self->_collections count];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[CarCollectionCell reuseIdentifier];
  v9 = [v7 dequeueReusableCellWithIdentifier:v8 forIndexPath:v6];

  uint64_t v10 = [(CarCollectionListCardViewController *)self collections];
  id v11 = [v6 row];

  objc_super v12 = [v10 objectAtIndexedSubscript:v11];

  [v9 setupWithCollectionHandler:v12];

  return v9;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  [a3 deselectRowAtIndexPath:v6 animated:1];
  id v10 = [(CarCollectionListCardViewController *)self delegate];
  id v7 = [(CarCollectionListCardViewController *)self collections];
  id v8 = [v6 row];

  v9 = [v7 objectAtIndexedSubscript:v8];
  [v10 collectionListCard:self didSelectCollection:v9];
}

- (NSArray)focusOrderSubItems
{
  if ([(CarCollectionListCardViewController *)self isViewLoaded])
  {
    v3 = [(CarTableView *)self->_tableView _car_visibleCells];
  }
  else
  {
    v3 = &__NSArray0__struct;
  }

  return (NSArray *)v3;
}

- (CarCollectionListCardViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CarCollectionListCardViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)collections
{
  return self->_collections;
}

- (CarTableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_collections, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end