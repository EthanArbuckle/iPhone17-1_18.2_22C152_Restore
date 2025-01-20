@interface MTBasePodcastListViewController
+ (id)defaultsKey;
- (BOOL)indexPathIsCurrentlySelectedRow:(id)a3;
- (BOOL)isRefreshing;
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4;
- (MTRefreshControlDelegate)refreshDelegate;
- (MTSourceListDelegate)delegate;
- (NSAttributedString)attributedTitleForRefreshControl;
- (NSString)selectedUuid;
- (SEL)selectorForRefreshControl;
- (id)_selectItemWithUuid:(id)a3;
- (id)firstValidIndexPath;
- (id)newCellInstanceWithReuseIdentifier:(id)a3;
- (id)reuseIdentifierForRow:(id)a3;
- (id)storedUuid;
- (id)tableView;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 targetIndexPathForMoveFromRowAtIndexPath:(id)a4 toProposedIndexPath:(id)a5;
- (id)targetForRefreshControl;
- (int64_t)flattenedCellIndexForIndexPath:(id)a3;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)configureCell:(id)a3 withObject:(id)a4 atIndexPath:(id)a5;
- (void)configureRowHeight;
- (void)contentSizeCategoryDidChange:(id)a3;
- (void)controller:(id)a3 didChangeObject:(id)a4 atIndexPath:(id)a5 forChangeType:(unint64_t)a6 newIndexPath:(id)a7;
- (void)controllerDidChangeContent:(id)a3;
- (void)dealloc;
- (void)didEndDraggingScrollView;
- (void)didReceiveMemoryWarning;
- (void)endRefreshingWhenDraggingCompletes;
- (void)loadView;
- (void)restoreSelection;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)selectItemWithUuid:(id)a3 forceScroll:(BOOL)a4;
- (void)setAttributedTitleForRefreshControl:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setRefreshDelegate:(id)a3;
- (void)setRefreshing:(BOOL)a3;
- (void)setSelectedUuid:(id)a3;
- (void)setSelectorForRefreshControl:(SEL)a3;
- (void)setTargetForRefreshControl:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)updatedDefaults:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation MTBasePodcastListViewController

+ (id)defaultsKey
{
  return 0;
}

- (id)storedUuid
{
  v2 = [(id)objc_opt_class() defaultsKey];

  if (v2)
  {
    v3 = +[NSUserDefaults standardUserDefaults];
    v4 = [(id)objc_opt_class() defaultsKey];
    v5 = [v3 stringForKey:v4];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)reuseIdentifierForRow:(id)a3
{
  return +[MTGenericCell reuseIdentifier];
}

- (id)newCellInstanceWithReuseIdentifier:(id)a3
{
  id v3 = a3;
  v4 = [[MTPodcastCell alloc] initWithStyle:0 reuseIdentifier:v3];

  return v4;
}

- (void)configureCell:(id)a3 withObject:(id)a4 atIndexPath:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = +[NSException exceptionWithName:@"MTAbstractMethod" reason:@"Handle this method in the subclass" userInfo:0];
  objc_exception_throw(v10);
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  return [(MTBasePodcastListViewController *)self isEditing];
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  return 1;
}

- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4
{
  return 1;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v13 = a4;
  v5 = [(MTFetchedTableViewController *)self frc];
  v6 = [v5 objectAtIndexPath:v13];

  if (objc_opt_respondsToSelector())
  {
    id v7 = [v6 uuid];
    id v8 = [(MTBasePodcastListViewController *)self delegate];
    [v8 sourceList:self didSelectItemUuid:v7 atIndexPath:v13];

    id v9 = [(id)objc_opt_class() defaultsKey];

    if (v9)
    {
      id v10 = +[NSUserDefaults standardUserDefaults];
      v11 = [(id)objc_opt_class() defaultsKey];
      [v10 setObject:v7 forKey:v11];

      id v12 = [(MTBasePodcastListViewController *)self _selectItemWithUuid:v7];
    }
  }
}

- (void)restoreSelection
{
  id v3 = [(MTBasePodcastListViewController *)self storedUuid];
  [(MTBasePodcastListViewController *)self setSelectedUuid:v3];

  id v4 = [(MTBasePodcastListViewController *)self selectedUuid];
  [(MTBasePodcastListViewController *)self selectItemWithUuid:v4 forceScroll:0];
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if (!a4) {
    [(MTBasePodcastListViewController *)self didEndDraggingScrollView];
  }
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
}

- (void)didEndDraggingScrollView
{
  if (self->_endRefreshWhenDraggingEnds)
  {
    [(MTBasePodcastListViewController *)self setRefreshing:0];
    self->_endRefreshWhenDraggingEnds = 0;
  }
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MTBasePodcastListViewController;
  return [(MTFetchedTableViewController *)&v4 numberOfSectionsInTableView:a3];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  v5.receiver = self;
  v5.super_class = (Class)MTBasePodcastListViewController;
  return [(MTFetchedTableViewController *)&v5 tableView:a3 numberOfRowsInSection:a4];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)MTBasePodcastListViewController;
  objc_super v4 = [(MTFetchedTableViewController *)&v6 tableView:a3 cellForRowAtIndexPath:a4];

  return v4;
}

- (id)tableView:(id)a3 targetIndexPathForMoveFromRowAtIndexPath:(id)a4 toProposedIndexPath:(id)a5
{
  id v5 = a5;

  return v5;
}

- (void)controller:(id)a3 didChangeObject:(id)a4 atIndexPath:(id)a5 forChangeType:(unint64_t)a6 newIndexPath:(id)a7
{
  id v12 = a4;
  v16.receiver = self;
  v16.super_class = (Class)MTBasePodcastListViewController;
  [(MTFetchedTableViewController *)&v16 controller:a3 didChangeObject:v12 atIndexPath:a5 forChangeType:a6 newIndexPath:a7];
  if (objc_opt_respondsToSelector())
  {
    id v13 = [v12 uuid];
  }
  else
  {
    id v13 = 0;
  }
  if ([v13 isEqual:self->_selectedUuid])
  {
    if (a6 == 2)
    {
      v14 = [(MTBasePodcastListViewController *)self navigationController];
      id v15 = [v14 popToRootViewControllerAnimated:1];
    }
    else
    {
      v14 = [(MTBasePodcastListViewController *)self delegate];
      [v14 sourceList:self didUpdateSelectedItemUuid:v13];
    }
  }
}

- (void)controllerDidChangeContent:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MTBasePodcastListViewController;
  [(MTFetchedTableViewController *)&v6 controllerDidChangeContent:a3];
  objc_super v4 = [(MTBasePodcastListViewController *)self tableView];
  if (![(MTFetchedTableViewController *)self changeIsUserDriven]
    && ([(MTBasePodcastListViewController *)self isHorizontallyCompact] & 1) == 0)
  {
    id v5 = [v4 indexPathForSelectedRow];
    if (v5)
    {
    }
    else if ((uint64_t)[v4 numberOfRowsInSection:0] >= 1)
    {
      [(MTBasePodcastListViewController *)self restoreSelection];
    }
  }
}

- (id)tableView
{
  v4.receiver = self;
  v4.super_class = (Class)MTBasePodcastListViewController;
  v2 = [(MTBasePodcastListViewController *)&v4 tableView];

  return v2;
}

- (void)viewWillDisappear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)MTBasePodcastListViewController;
  [(MTFetchedTableViewController *)&v8 viewWillDisappear:a3];
  objc_super v4 = [(MTBasePodcastListViewController *)self refreshControl];
  unsigned int v5 = [v4 isRefreshing];

  if (v5)
  {
    objc_super v6 = [(MTBasePodcastListViewController *)self refreshControl];
    [v6 endRefreshing];
  }
  id v7 = +[NSNotificationCenter defaultCenter];
  [v7 removeObserver:self name:NSUserDefaultsDidChangeNotification object:0];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = [(MTBasePodcastListViewController *)self tableView];
  objc_super v6 = [v5 indexPathForSelectedRow];

  v32.receiver = self;
  v32.super_class = (Class)MTBasePodcastListViewController;
  [(MTFetchedTableViewController *)&v32 viewWillAppear:v3];
  BOOL v7 = +[UIView areAnimationsEnabled];
  +[UIView setAnimationsEnabled:0];
  objc_super v8 = [(MTBasePodcastListViewController *)self tableView];
  [v8 reloadData];

  id v9 = [(MTBasePodcastListViewController *)self splitViewController];
  unsigned __int8 v10 = [v9 isHorizontallyCompact];

  if ((v10 & 1) == 0)
  {
    v11 = +[NSNotificationCenter defaultCenter];
    [v11 addObserver:self selector:"updatedDefaults:" name:NSUserDefaultsDidChangeNotification object:0];

    id v12 = [(MTBasePodcastListViewController *)self tableView];
    [v12 selectRowAtIndexPath:v6 animated:0 scrollPosition:0];

    [(MTBasePodcastListViewController *)self restoreSelection];
  }
  +[UIView setAnimationsEnabled:v7];
  id v13 = [(MTBasePodcastListViewController *)self refreshControl];

  if (v13)
  {
    v14 = [(MTBasePodcastListViewController *)self refreshControl];
    unsigned __int8 v15 = [v14 isRefreshing];

    if ((v15 & 1) == 0)
    {
      objc_super v16 = [(MTBasePodcastListViewController *)self refreshControl];
      [v16 beginRefreshing];

      v17 = [(MTBasePodcastListViewController *)self refreshControl];
      [v17 endRefreshing];
    }
    v18 = [(MTBasePodcastListViewController *)self refreshControl];
    v19 = [(MTBasePodcastListViewController *)self attributedTitleForRefreshControl];
    [v18 setAttributedTitle:v19];

    if ([(MTBasePodcastListViewController *)self isRefreshing])
    {
      v20 = [(MTBasePodcastListViewController *)self refreshControl];
      unsigned __int8 v21 = [v20 isRefreshing];

      if ((v21 & 1) == 0)
      {
        v22 = [(MTBasePodcastListViewController *)self tableView];
        [v22 setAdjustContentOffsetForRefreshControlAsNeeded:1];

        v23 = [(MTBasePodcastListViewController *)self refreshControl];
        [v23 beginRefreshing];

        dispatch_time_t v24 = dispatch_time(0, 100000000);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10014B2B0;
        block[3] = &unk_10054D570;
        block[4] = self;
        dispatch_after(v24, (dispatch_queue_t)&_dispatch_main_q, block);
      }
    }
  }
  else
  {
    v25 = [(MTBasePodcastListViewController *)self targetForRefreshControl];
    [(MTBasePodcastListViewController *)self selectorForRefreshControl];
    char v26 = objc_opt_respondsToSelector();

    if (v26)
    {
      id v27 = objc_alloc_init((Class)UIRefreshControl);
      v28 = [(MTBasePodcastListViewController *)self targetForRefreshControl];
      [v27 addTarget:v28 action:[self selectorForRefreshControl] forControlEvents:4096];

      v29 = [(MTBasePodcastListViewController *)self attributedTitleForRefreshControl];
      [v27 setAttributedTitle:v29];

      [(MTFetchedTableViewController *)self setRefreshControl:v27];
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_10014B2F8;
      v30[3] = &unk_10054D570;
      v30[4] = self;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v30);
    }
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MTBasePodcastListViewController;
  [(MTBasePodcastListViewController *)&v7 viewDidAppear:a3];
  if ([(MTBasePodcastListViewController *)self isHorizontallyCompact])
  {
    objc_super v4 = [(MTBasePodcastListViewController *)self tableView];
    unsigned int v5 = [(MTBasePodcastListViewController *)self tableView];
    objc_super v6 = [v5 indexPathForSelectedRow];
    [v4 deselectRowAtIndexPath:v6 animated:1];
  }
  [(MTBasePodcastListViewController *)self simulateMemoryWarning];
}

- (void)didReceiveMemoryWarning
{
  v2.receiver = self;
  v2.super_class = (Class)MTBasePodcastListViewController;
  [(MTFetchedTableViewController *)&v2 didReceiveMemoryWarning];
}

- (void)loadView
{
  BOOL v3 = [MTTableView alloc];
  objc_super v4 = +[UIScreen mainScreen];
  [v4 bounds];
  unsigned int v5 = -[MTTableView initWithFrame:style:](v3, "initWithFrame:style:", 2);

  [(MTTableView *)v5 setAutoresizingMask:18];
  [(MTTableView *)v5 setDataSource:self];
  [(MTTableView *)v5 setDelegate:self];
  [(MTTableView *)v5 setSeparatorStyle:1];
  -[MTTableView setSeparatorInset:](v5, "setSeparatorInset:", 0.0, 70.0, 0.0, 0.0);
  [(MTBasePodcastListViewController *)self setView:v5];
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)MTBasePodcastListViewController;
  [(MTFetchedTableViewController *)&v7 viewDidLoad];
  id v3 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  objc_super v4 = [(MTBasePodcastListViewController *)self tableView];
  [v4 setTableFooterView:v3];

  unsigned int v5 = [(MTBasePodcastListViewController *)self storedUuid];
  [(MTBasePodcastListViewController *)self setSelectedUuid:v5];

  [(MTBasePodcastListViewController *)self configureRowHeight];
  objc_super v6 = +[NSNotificationCenter defaultCenter];
  [v6 addObserver:self selector:"contentSizeCategoryDidChange:" name:UIContentSizeCategoryDidChangeNotification object:0];
}

- (void)configureRowHeight
{
  id v3 = [(MTBasePodcastListViewController *)self tableView];
  +[MTGenericCell heightForWidth:1.79769313e308];
  [v3 setEstimatedRowHeight:];

  id v4 = [(MTBasePodcastListViewController *)self tableView];
  [v4 setRowHeight:UITableViewAutomaticDimension];
}

- (void)dealloc
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)MTBasePodcastListViewController;
  [(MTFetchedTableViewController *)&v4 dealloc];
}

- (void)contentSizeCategoryDidChange:(id)a3
{
  objc_super v4 = [(MTBasePodcastListViewController *)self view];
  [v4 setNeedsLayout];

  unsigned int v5 = [(MTBasePodcastListViewController *)self tableView];
  id v6 = [v5 tableHeaderView];

  [v6 setNeedsLayout];
}

- (void)setRefreshing:(BOOL)a3
{
  if (self->_refreshing == a3) {
    return;
  }
  BOOL v3 = a3;
  if (a3)
  {
    self->_refreshing = a3;
    goto LABEL_9;
  }
  unsigned int v5 = [(MTBasePodcastListViewController *)self tableView];
  unsigned int v6 = [v5 isDragging];

  if (!v6)
  {
    self->_refreshing = v3;
    objc_super v7 = [(MTBasePodcastListViewController *)self tableView];
    [v7 reloadData];

LABEL_9:
    [(MTFetchedTableViewController *)self setChangeIsUserDriven:v3];
    if (self->_refreshing)
    {
      objc_super v8 = [(MTBasePodcastListViewController *)self refreshControl];
      unsigned __int8 v9 = [v8 isRefreshing];

      if ((v9 & 1) == 0)
      {
        id v12 = [(MTBasePodcastListViewController *)self refreshControl];
        [v12 beginRefreshing];
        goto LABEL_15;
      }
      if (self->_refreshing) {
        return;
      }
    }
    unsigned __int8 v10 = [(MTBasePodcastListViewController *)self refreshControl];
    unsigned int v11 = [v10 isRefreshing];

    if (!v11) {
      goto LABEL_16;
    }
    id v12 = [(MTBasePodcastListViewController *)self refreshControl];
    [v12 endRefreshing];
LABEL_15:

LABEL_16:
    if (!self->_refreshing)
    {
      id v13 = [(MTBasePodcastListViewController *)self refreshDelegate];
      [v13 didEndRefreshing];
    }
    return;
  }

  [(MTBasePodcastListViewController *)self endRefreshingWhenDraggingCompletes];
}

- (void)endRefreshingWhenDraggingCompletes
{
  BOOL v3 = [(MTBasePodcastListViewController *)self tableView];
  unsigned int v4 = [v3 isDragging];

  if (v4)
  {
    self->_endRefreshWhenDraggingEnds = 1;
  }
  else
  {
    [(MTBasePodcastListViewController *)self setRefreshing:0];
  }
}

- (void)setAttributedTitleForRefreshControl:(id)a3
{
  id v6 = a3;
  if (!-[NSAttributedString isEqualToAttributedString:](self->_attributedTitleForRefreshControl, "isEqualToAttributedString:"))
  {
    objc_storeStrong((id *)&self->_attributedTitleForRefreshControl, a3);
    unsigned int v5 = [(MTBasePodcastListViewController *)self refreshControl];
    [v5 setAttributedTitle:v6];
  }
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v5 = a4;
  id v6 = [v5 textLabel];
  objc_super v7 = +[UIColor clearColor];
  [v6 setBackgroundColor:v7];

  id v9 = [v5 backgroundView];

  objc_super v8 = +[UIColor backgroundColor];
  [v9 setBackgroundColor:v8];
}

- (int64_t)flattenedCellIndexForIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [v4 section];
  id v6 = [(MTBasePodcastListViewController *)self tableView];
  int64_t v7 = [(MTBasePodcastListViewController *)self numberOfSectionsInTableView:v6];

  if ((uint64_t)v5 >= v7) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = (uint64_t)v5;
  }
  if (v8 < 1)
  {
    uint64_t v10 = 0;
  }
  else
  {
    uint64_t v9 = 0;
    uint64_t v10 = 0;
    do
    {
      unsigned int v11 = [(MTBasePodcastListViewController *)self tableView];
      v10 += [(MTBasePodcastListViewController *)self tableView:v11 numberOfRowsInSection:v9];

      ++v9;
      id v12 = [v4 section];
      id v13 = [(MTBasePodcastListViewController *)self tableView];
      int64_t v14 = [(MTBasePodcastListViewController *)self numberOfSectionsInTableView:v13];

      if ((uint64_t)v12 >= v14) {
        int64_t v15 = v14;
      }
      else {
        int64_t v15 = (int64_t)v12;
      }
    }
    while (v15 > v9);
  }
  objc_super v16 = (char *)[v4 row] + v10;

  return (int64_t)v16;
}

- (void)updatedDefaults:(id)a3
{
  id v4 = [(id)objc_opt_class() defaultsKey];

  if (v4)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10014BCA4;
    block[3] = &unk_10054D570;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (id)firstValidIndexPath
{
  objc_super v2 = [(MTBasePodcastListViewController *)self tableView];
  BOOL v3 = [v2 dataSource];
  if ([v3 tableView:v2 numberOfRowsInSection:0])
  {
    id v4 = +[NSIndexPath indexPathForRow:0 inSection:0];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)_selectItemWithUuid:(id)a3
{
  id v4 = a3;
  id v5 = [(MTFetchedTableViewController *)self frc];
  id v6 = [v5 fetchedObjects];
  id v7 = [v6 count];

  if (v7)
  {
    id v12 = 0;
    id v13 = 0;
    [(MTBasePodcastListViewController *)self getObjectId:&v13 andIndexPath:&v12 forItemWithUuid:v4];
    id v8 = v13;
    id v9 = v12;
    if (v9) {
      id v10 = v4;
    }
    else {
      id v10 = 0;
    }
    [(MTBasePodcastListViewController *)self setSelectedUuid:v10];
  }
  else
  {
    id v9 = 0;
    id v8 = 0;
  }

  return v9;
}

- (void)selectItemWithUuid:(id)a3 forceScroll:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v6 = [(MTBasePodcastListViewController *)self _selectItemWithUuid:a3];
  if (v6
    || ([(MTBasePodcastListViewController *)self firstValidIndexPath],
        id v7 = objc_claimAutoreleasedReturnValue(),
        (uint64_t v6 = (uint64_t)v7) != 0))
  {
    id v10 = (id)v6;
    if (![(MTBasePodcastListViewController *)self indexPathIsCurrentlySelectedRow:v6]|| v4)
    {
      id v8 = [(MTBasePodcastListViewController *)self tableView];
      [v8 selectRowAtIndexPath:v10 animated:0 scrollPosition:2];

      id v9 = [(MTBasePodcastListViewController *)self tableView];
      [(MTBasePodcastListViewController *)self tableView:v9 didSelectRowAtIndexPath:v10];
    }
    id v7 = v10;
  }
}

- (BOOL)indexPathIsCurrentlySelectedRow:(id)a3
{
  id v4 = a3;
  id v5 = [(MTBasePodcastListViewController *)self tableView];
  uint64_t v6 = [v5 indexPathForSelectedRow];
  unsigned __int8 v7 = [v4 isEqual:v6];

  return v7;
}

- (MTSourceListDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MTSourceListDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (MTRefreshControlDelegate)refreshDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_refreshDelegate);

  return (MTRefreshControlDelegate *)WeakRetained;
}

- (void)setRefreshDelegate:(id)a3
{
}

- (NSString)selectedUuid
{
  return self->_selectedUuid;
}

- (void)setSelectedUuid:(id)a3
{
}

- (BOOL)isRefreshing
{
  return self->_refreshing;
}

- (NSAttributedString)attributedTitleForRefreshControl
{
  return self->_attributedTitleForRefreshControl;
}

- (SEL)selectorForRefreshControl
{
  if (self->_selectorForRefreshControl) {
    return self->_selectorForRefreshControl;
  }
  else {
    return 0;
  }
}

- (void)setSelectorForRefreshControl:(SEL)a3
{
  if (a3) {
    BOOL v3 = a3;
  }
  else {
    BOOL v3 = 0;
  }
  self->_selectorForRefreshControl = v3;
}

- (id)targetForRefreshControl
{
  id WeakRetained = objc_loadWeakRetained(&self->_targetForRefreshControl);

  return WeakRetained;
}

- (void)setTargetForRefreshControl:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_targetForRefreshControl);
  objc_storeStrong((id *)&self->_attributedTitleForRefreshControl, 0);
  objc_storeStrong((id *)&self->_selectedUuid, 0);
  objc_destroyWeak((id *)&self->_refreshDelegate);

  objc_destroyWeak((id *)&self->_delegate);
}

@end