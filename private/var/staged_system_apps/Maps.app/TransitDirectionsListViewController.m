@interface TransitDirectionsListViewController
+ (Class)dataSourceClass;
- (BOOL)_canShowWhileLocked;
- (BOOL)_shouldReloadForReferenceDateUpdates;
- (BOOL)becomeFirstResponder;
- (BOOL)showsHairline;
- (GEOComposedRoute)route;
- (NSDirectionalEdgeInsets)_separatorInsetsForIndexPath:(id)a3;
- (TransitDirectionsListViewController)init;
- (TransitDirectionsListViewController)initWithRoute:(id)a3;
- (TransitDirectionsListViewController)initWithRoute:(id)a3 forNavigation:(BOOL)a4;
- (TransitDirectionsStepsListDataSource)dataSource;
- (UICollectionView)collectionView;
- (UIScrollView)scrollView;
- (UIScrollViewDelegate)scrollViewDelegate;
- (UITableView)tableView;
- (double)_heightOfFinalRow;
- (void)_overrideListBackgroundAlpha:(double)a3;
- (void)_willBecomeCurrent;
- (void)loadView;
- (void)setRoute:(id)a3;
- (void)setScrollViewDelegate:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation TransitDirectionsListViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

+ (Class)dataSourceClass
{
  return (Class)objc_opt_class();
}

- (TransitDirectionsListViewController)init
{
  v6.receiver = self;
  v6.super_class = (Class)TransitDirectionsListViewController;
  v2 = [(TransitDirectionsListViewController *)&v6 init];
  if (v2)
  {
    v3 = (TransitDirectionsStepsListDataSource *)objc_alloc_init((Class)[(id)objc_opt_class() dataSourceClass]);
    dataSource = v2->_dataSource;
    v2->_dataSource = v3;
  }
  return v2;
}

- (TransitDirectionsListViewController)initWithRoute:(id)a3
{
  return [(TransitDirectionsListViewController *)self initWithRoute:a3 forNavigation:0];
}

- (TransitDirectionsListViewController)initWithRoute:(id)a3 forNavigation:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [(TransitDirectionsListViewController *)self init];
  v8 = v7;
  if (v7)
  {
    dataSource = v7->_dataSource;
    if (v4)
    {
      [(TransitDirectionsStepsListDataSource *)dataSource setEnableNavigationUpdates:1];
      [(TransitDirectionsStepsListDataSource *)v8->_dataSource setAllowStepSelection:1];
    }
    else
    {
      [(TransitDirectionsStepsListDataSource *)dataSource setRoute:v6];
    }
  }

  return v8;
}

- (GEOComposedRoute)route
{
  v2 = [(TransitDirectionsListViewController *)self dataSource];
  v3 = [v2 route];

  return (GEOComposedRoute *)v3;
}

- (void)setRoute:(id)a3
{
  id v6 = a3;
  id v4 = [(TransitDirectionsListViewController *)self route];

  v5 = v6;
  if (v4 != v6)
  {
    [(TransitDirectionsStepsListDataSource *)self->_dataSource setRoute:v6];
    v5 = v6;
  }
}

- (UIScrollViewDelegate)scrollViewDelegate
{
  v2 = [(TransitDirectionsListViewController *)self dataSource];
  v3 = [v2 scrollViewDelegate];

  return (UIScrollViewDelegate *)v3;
}

- (void)setScrollViewDelegate:(id)a3
{
  id v4 = a3;
  id v5 = [(TransitDirectionsListViewController *)self dataSource];
  [v5 setScrollViewDelegate:v4];
}

- (BOOL)showsHairline
{
  return 0;
}

- (UIScrollView)scrollView
{
  [(TransitDirectionsListViewController *)self loadViewIfNeeded];
  listView = self->_listView;

  return (UIScrollView *)listView;
}

- (void)loadView
{
  v3 = [TransitDirectionsListView alloc];
  id v4 = +[UIScreen mainScreen];
  [v4 bounds];
  id v5 = -[TransitDirectionsListView initWithFrame:](v3, "initWithFrame:");

  id v6 = +[UIColor clearColor];
  [(TransitDirectionsListView *)v5 setBackgroundColor:v6];

  [(TransitDirectionsListView *)v5 setOpaque:0];
  [(TransitDirectionsListView *)v5 setAutoresizingMask:18];
  -[TransitDirectionsListView setLayoutMargins:](v5, "setLayoutMargins:", UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
  [(TransitDirectionsListView *)v5 setPreservesSuperviewLayoutMargins:1];
  [(TransitDirectionsListView *)v5 setClipsToBounds:1];
  listView = self->_listView;
  self->_listView = v5;
  v8 = v5;

  [(TransitDirectionsListViewController *)self setView:self->_listView];
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)TransitDirectionsListViewController;
  [(TransitDirectionsListViewController *)&v7 viewDidLoad];
  [(TransitDirectionsListViewController *)self setViewRespectsSystemMinimumLayoutMargins:0];
  listView = self->_listView;
  id v4 = [(TransitDirectionsListViewController *)self dataSource];
  [v4 setListView:listView];

  id v5 = [(TransitDirectionsListViewController *)self dataSource];
  [(TransitDirectionsListView *)self->_listView setListDelegate:v5];

  id v6 = [(TransitDirectionsListViewController *)self dataSource];
  [(TransitDirectionsListView *)self->_listView setDataSource:v6];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TransitDirectionsListViewController;
  [(TransitDirectionsListViewController *)&v4 viewDidAppear:a3];
  [(TransitDirectionsListView *)self->_listView becomeFirstResponder];
}

- (BOOL)becomeFirstResponder
{
  return [(TransitDirectionsListView *)self->_listView becomeFirstResponder];
}

- (NSDirectionalEdgeInsets)_separatorInsetsForIndexPath:(id)a3
{
  *(void *)&long long v12 = _UICollectionViewListLayoutSectionAutomaticDimension;
  *((void *)&v12 + 1) = _UICollectionViewListLayoutSectionAutomaticDimension;
  *(void *)&long long v13 = _UICollectionViewListLayoutSectionAutomaticDimension;
  *((void *)&v13 + 1) = _UICollectionViewListLayoutSectionAutomaticDimension;
  id v4 = a3;
  id v5 = [(TransitDirectionsListViewController *)self dataSource];
  unsigned __int8 v6 = [v5 shouldShowSeparatorForItemAtIndexPath:v4 insets:&v12];

  if ((v6 & 1) == 0)
  {
    long long v7 = _UICollectionViewListSectionSeparatorInsetHidden[1];
    long long v12 = _UICollectionViewListSectionSeparatorInsetHidden[0];
    long long v13 = v7;
  }

  double v9 = *((double *)&v12 + 1);
  double v8 = *(double *)&v12;
  double v11 = *((double *)&v13 + 1);
  double v10 = *(double *)&v13;
  result.trailing = v11;
  result.bottom = v10;
  result.leading = v9;
  result.top = v8;
  return result;
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TransitDirectionsListViewController;
  [(TransitDirectionsListViewController *)&v6 viewWillAppear:a3];
  BOOL v4 = [(TransitDirectionsListViewController *)self _shouldReloadForReferenceDateUpdates];
  id v5 = [(TransitDirectionsListViewController *)self dataSource];
  [v5 setActive:v4];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TransitDirectionsListViewController;
  [(TransitDirectionsListViewController *)&v5 viewDidDisappear:a3];
  BOOL v4 = [(TransitDirectionsListViewController *)self dataSource];
  [v4 setActive:0];
}

- (BOOL)_shouldReloadForReferenceDateUpdates
{
  return 1;
}

- (void)_willBecomeCurrent
{
  id v2 = [(TransitDirectionsListViewController *)self dataSource];
  [v2 collapseAllItems];
}

- (void)_overrideListBackgroundAlpha:(double)a3
{
}

- (double)_heightOfFinalRow
{
  id v2 = [(TransitDirectionsListView *)self->_listView allStepViews];
  v3 = [v2 lastObject];

  [v3 bounds];
  double Height = 0.0;
  if (CGRectGetHeight(v6) >= 0.0)
  {
    [v3 bounds];
    double Height = CGRectGetHeight(v7);
  }

  return Height;
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (TransitDirectionsStepsListDataSource)dataSource
{
  return self->_dataSource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);

  objc_storeStrong((id *)&self->_listView, 0);
}

@end