@interface UIDebuggingInformationHierarchyViewController
- (BOOL)shouldCollapseAtIndexPath:(id)a3;
- (BOOL)shouldHighlightSelectedCells;
- (CGColor)originalBorderColor;
- (NSArray)data;
- (NSMutableArray)keys;
- (NSMutableDictionary)controlsForKeys;
- (NSMutableDictionary)managedValues;
- (NSMutableDictionary)observersForKeys;
- (UICollectionView)collectionView;
- (UIDebuggingInformationHierarchyViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (UIDebuggingInformationInspectorDetailViewController)detail;
- (UIRefreshControl)refreshControl;
- (UIView)highlightedView;
- (UIView)rootViewForInspection;
- (double)originalBorderWidth;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (id)colorForIndentationLevel:(unint64_t)a3;
- (id)getViewsRecursiveWithLevel:(unint64_t)a3 forView:(id)a4;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (unint64_t)indentationLevelForIndexPath:(id)a3;
- (void)_showWindowChange;
- (void)chooseNewTarget:(id)a3;
- (void)collapseBeneathCell:(id)a3;
- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)didReceiveNewView:(id)a3;
- (void)displayDetailsForCell:(id)a3;
- (void)expandBeneathCell:(id)a3;
- (void)highlightView:(id)a3;
- (void)refresh:(id)a3;
- (void)setCollectionView:(id)a3;
- (void)setControlsForKeys:(id)a3;
- (void)setData:(id)a3;
- (void)setDetail:(id)a3;
- (void)setHighlightedView:(id)a3;
- (void)setKeys:(id)a3;
- (void)setManagedValues:(id)a3;
- (void)setObserversForKeys:(id)a3;
- (void)setOriginalBorderColor:(CGColor *)a3;
- (void)setOriginalBorderWidth:(double)a3;
- (void)setRefreshControl:(id)a3;
- (void)setRootViewForInspection:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation UIDebuggingInformationHierarchyViewController

- (UIDebuggingInformationHierarchyViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)UIDebuggingInformationHierarchyViewController;
  v4 = [(UIViewController *)&v10 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    v5 = +[UIDebuggingInformationOverlay overlay];
    v6 = [v5 inspectedWindow];
    [(UIDebuggingInformationHierarchyViewController *)v4 setRootViewForInspection:v6];

    registerTouchObserver(v4);
    v7 = objc_alloc_init(UIDebuggingInformationInspectorDetailViewController);
    detail = v4->_detail;
    v4->_detail = v7;
  }
  return v4;
}

- (void)_showWindowChange
{
  id v4 = (id)objc_opt_new();
  v3 = [(UIViewController *)self navigationController];
  [v3 pushViewController:v4 animated:1];
}

- (void)viewDidLoad
{
  v36[3] = *MEMORY[0x1E4F143B8];
  v34.receiver = self;
  v34.super_class = (Class)UIDebuggingInformationHierarchyViewController;
  [(UIViewController *)&v34 viewDidLoad];
  v3 = [(UIViewController *)self navigationController];
  id v4 = [v3 navigationBar];
  [v4 setTranslucent:1];

  v33 = [[UIBarButtonItem alloc] initWithTitle:@"Window" style:0 target:self action:sel__showWindowChange];
  v5 = [[UIBarButtonItem alloc] initWithTitle:@"Inspect" style:0 target:self action:sel_chooseNewTarget_];
  v36[0] = v33;
  v6 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:5 target:0 action:0];
  v36[1] = v6;
  v36[2] = v5;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:3];
  normalItems = self->_normalItems;
  self->_normalItems = v7;

  [(UIViewController *)self setToolbarItems:self->_normalItems];
  v9 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", 0.0, 0.0, 200.0, 44.0);
  objc_super v10 = [UILabel alloc];
  [(UIView *)v9 bounds];
  v11 = -[UILabel initWithFrame:](v10, "initWithFrame:");
  [(UILabel *)v11 setText:@"Tap a view to inspect it."];
  v12 = [off_1E52D39B8 systemFontOfSize:12.0];
  [(UILabel *)v11 setFont:v12];

  [(UILabel *)v11 setTextAlignment:1];
  [(UIView *)v9 addSubview:v11];
  v13 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:5 target:0 action:0];
  v35[0] = v13;
  v14 = [[UIBarButtonItem alloc] initWithCustomView:v9];
  v35[1] = v14;
  v15 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:5 target:0 action:0];
  v35[2] = v15;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:3];
  showingOverlayItems = self->_showingOverlayItems;
  self->_showingOverlayItems = v16;

  v18 = objc_alloc_init(UIDebuggingInformationHierarchyLayout);
  [(UIDebuggingInformationHierarchyLayout *)v18 setDelegate:self];
  v19 = [UICollectionView alloc];
  v20 = [(UIViewController *)self view];
  [v20 bounds];
  v21 = -[UICollectionView initWithFrame:collectionViewLayout:](v19, "initWithFrame:collectionViewLayout:", v18);

  v22 = +[UIColor whiteColor];
  [(UICollectionView *)v21 setBackgroundColor:v22];

  [(UICollectionView *)v21 setDataSource:self];
  [(UICollectionView *)v21 setDelegate:self];
  [(UIView *)v21 setAutoresizingMask:18];
  [(UICollectionView *)v21 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"reuseIdentifier"];
  [(UICollectionView *)v21 registerClass:objc_opt_class() forSupplementaryViewOfKind:@"line" withReuseIdentifier:@"separator-line"];
  collectionView = self->_collectionView;
  self->_collectionView = v21;
  v24 = v21;

  v25 = [(UIViewController *)self view];
  [v25 addSubview:self->_collectionView];

  v26 = self->_collectionView;
  v27 = [(UIViewController *)self view];
  [v27 bounds];
  -[UICollectionView setFrame:](v26, "setFrame:");

  v28 = [(UIViewController *)self view];
  v29 = +[UIColor whiteColor];
  [v28 setBackgroundColor:v29];

  v30 = objc_alloc_init(UIRefreshControl);
  [(UIDebuggingInformationHierarchyViewController *)self setRefreshControl:v30];

  v31 = [(UIDebuggingInformationHierarchyViewController *)self refreshControl];
  [v31 addTarget:self action:sel_refresh_ forControlEvents:4096];

  v32 = [(UIDebuggingInformationHierarchyViewController *)self refreshControl];
  [(UIScrollView *)self->_collectionView setRefreshControl:v32];
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UIDebuggingInformationHierarchyViewController;
  [(UIViewController *)&v5 viewWillAppear:a3];
  [(UIDebuggingInformationHierarchyViewController *)self refresh:0];
  [(UIDebuggingInformationHierarchyViewController *)self highlightView:0];
  id v4 = [(UIViewController *)self navigationController];
  [v4 setToolbarHidden:0];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UIDebuggingInformationHierarchyViewController;
  [(UIViewController *)&v5 viewWillDisappear:a3];
  id v4 = [(UIViewController *)self navigationController];
  [v4 setToolbarHidden:1];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)UIDebuggingInformationHierarchyViewController;
  -[UIViewController viewWillTransitionToSize:withTransitionCoordinator:](&v7, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, a3.width, a3.height);
  objc_super v5 = [(UIViewController *)self->_detail view];
  v6 = [(UIViewController *)self view];
  [v6 frame];
  objc_msgSend(v5, "setFrame:");
}

- (void)chooseNewTarget:(id)a3
{
  [(UIViewController *)self setToolbarItems:self->_showingOverlayItems animated:1];
  id v3 = +[UIDebuggingInformationOverlay overlay];
  [v3 setCheckingTouches:1];
}

- (void)didReceiveNewView:(id)a3
{
  id v14 = a3;
  [(UIViewController *)self setToolbarItems:self->_normalItems animated:1];
  id v4 = [(UIDebuggingInformationHierarchyViewController *)self data];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    unint64_t v6 = 0;
    do
    {
      objc_super v7 = [(UIDebuggingInformationHierarchyViewController *)self data];
      v8 = [v7 objectAtIndexedSubscript:v6];
      id v9 = [v8 view];

      if (v9 == v14)
      {
        objc_super v10 = [MEMORY[0x1E4F28D58] indexPathForRow:v6 inSection:0];
        v11 = [(UIDebuggingInformationHierarchyViewController *)self collectionView];
        [v11 selectItemAtIndexPath:v10 animated:1 scrollPosition:1];

        [(UIDebuggingInformationHierarchyViewController *)self highlightView:v14];
      }
      ++v6;
      v12 = [(UIDebuggingInformationHierarchyViewController *)self data];
      unint64_t v13 = [v12 count];
    }
    while (v6 < v13);
  }
}

- (void)refresh:(id)a3
{
  id v4 = +[UIDebuggingInformationOverlay overlay];
  uint64_t v5 = [v4 inspectedWindow];
  [(UIDebuggingInformationHierarchyViewController *)self setRootViewForInspection:v5];

  unint64_t v6 = [(UIDebuggingInformationHierarchyViewController *)self refreshControl];

  if (v6)
  {
    objc_super v7 = [(UIDebuggingInformationHierarchyViewController *)self refreshControl];
    [v7 endRefreshing];
  }
  id v8 = [(UIDebuggingInformationHierarchyViewController *)self collectionView];
  [v8 reloadData];
}

- (void)setRootViewForInspection:(id)a3
{
  id v8 = a3;
  objc_storeStrong((id *)&self->_rootViewForInspection, a3);
  uint64_t v5 = v8;
  if (v8)
  {
    unint64_t v6 = [(UIDebuggingInformationHierarchyViewController *)self getViewsRecursiveWithLevel:0 forView:v8];
    [(UIDebuggingInformationHierarchyViewController *)self setData:v6];

    objc_super v7 = [(UIDebuggingInformationHierarchyViewController *)self collectionView];
    [v7 reloadData];

    uint64_t v5 = v8;
  }
}

- (id)getViewsRecursiveWithLevel:(unint64_t)a3 forView:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  objc_super v7 = [[UIDebuggingInformationHierarchyDataContainer alloc] initWithView:v6 atLevel:a3];
  id v8 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithObjects:", v7, 0);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v9 = [v6 subviews];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v19;
    unint64_t v13 = a3 + 1;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        v15 = [(UIDebuggingInformationHierarchyViewController *)self getViewsRecursiveWithLevel:v13 forView:*(void *)(*((void *)&v18 + 1) + 8 * i)];
        [v8 addObjectsFromArray:v15];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v11);
  }

  v16 = (void *)[v8 copy];
  return v16;
}

- (void)viewDidLayoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)UIDebuggingInformationHierarchyViewController;
  [(UIViewController *)&v5 viewDidLayoutSubviews];
  id v3 = [(NSArray *)self->_normalItems lastObject];
  id v4 = +[UIDebuggingInformationOverlay overlay];
  objc_msgSend(v3, "setEnabled:", objc_msgSend(v4, "isFullscreen") ^ 1);
}

- (void)displayDetailsForCell:(id)a3
{
  id v8 = [a3 indexPath];
  if (v8)
  {
    id v4 = [(UIDebuggingInformationHierarchyViewController *)self data];
    objc_super v5 = objc_msgSend(v4, "objectAtIndexedSubscript:", objc_msgSend(v8, "row"));
    id v6 = [v5 view];

    [(UIDebuggingInformationInspectorDetailViewController *)self->_detail inspectView:v6];
    objc_super v7 = [(UIViewController *)self navigationController];
    [v7 pushViewController:self->_detail animated:1];
  }
}

- (void)collapseBeneathCell:(id)a3
{
  id v4 = [a3 indexPath];
  if (v4)
  {
    unint64_t v5 = [(UIDebuggingInformationHierarchyViewController *)self indentationLevelForIndexPath:v4];
    id v6 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:", objc_msgSend(v4, "row") + 1, 0);
    objc_super v7 = objc_opt_new();
    if ([(UIDebuggingInformationHierarchyViewController *)self indentationLevelForIndexPath:v6] <= v5)
    {
      unint64_t v13 = v6;
    }
    else
    {
      do
      {
        unint64_t v8 = [v6 row];
        id v9 = [(UIDebuggingInformationHierarchyViewController *)self data];
        unint64_t v10 = [v9 count];

        if (v8 < v10)
        {
          uint64_t v11 = [(UIDebuggingInformationHierarchyViewController *)self data];
          uint64_t v12 = objc_msgSend(v11, "objectAtIndexedSubscript:", objc_msgSend(v6, "row"));
          [v12 setCollapsed:1];

          [v7 addObject:v6];
        }
        unint64_t v13 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:", objc_msgSend(v6, "row") + 1, 0);

        id v6 = v13;
      }
      while ([(UIDebuggingInformationHierarchyViewController *)self indentationLevelForIndexPath:v13] > v5);
    }
    collectionView = self->_collectionView;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __69__UIDebuggingInformationHierarchyViewController_collapseBeneathCell___block_invoke;
    v15[3] = &unk_1E52DA660;
    v15[4] = self;
    id v16 = v4;
    [(UICollectionView *)collectionView performBatchUpdates:0 completion:v15];
  }
}

void __69__UIDebuggingInformationHierarchyViewController_collapseBeneathCell___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) data];
  id v3 = objc_msgSend(v2, "objectAtIndexedSubscript:", objc_msgSend(*(id *)(a1 + 40), "row"));
  char v4 = [v3 collapsed];

  if ((v4 & 1) == 0)
  {
    uint64_t v5 = *(void *)(a1 + 40);
    id v6 = *(void **)(*(void *)(a1 + 32) + 1056);
    [v6 scrollToItemAtIndexPath:v5 atScrollPosition:1 animated:1];
  }
}

- (void)expandBeneathCell:(id)a3
{
  char v4 = [a3 indexPath];
  if (v4)
  {
    unint64_t v5 = [(UIDebuggingInformationHierarchyViewController *)self indentationLevelForIndexPath:v4];
    id v6 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:", objc_msgSend(v4, "row") + 1, 0);
    if ([(UIDebuggingInformationHierarchyViewController *)self indentationLevelForIndexPath:v6] <= v5)
    {
      uint64_t v12 = v6;
    }
    else
    {
      do
      {
        unint64_t v7 = [v6 row];
        unint64_t v8 = [(UIDebuggingInformationHierarchyViewController *)self data];
        unint64_t v9 = [v8 count];

        if (v7 < v9)
        {
          unint64_t v10 = [(UIDebuggingInformationHierarchyViewController *)self data];
          uint64_t v11 = objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v6, "row"));
          [v11 setCollapsed:0];
        }
        uint64_t v12 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:", objc_msgSend(v6, "row") + 1, 0);

        id v6 = v12;
      }
      while ([(UIDebuggingInformationHierarchyViewController *)self indentationLevelForIndexPath:v12] > v5);
    }
    collectionView = self->_collectionView;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __67__UIDebuggingInformationHierarchyViewController_expandBeneathCell___block_invoke;
    v14[3] = &unk_1E52DA660;
    v14[4] = self;
    id v15 = v4;
    [(UICollectionView *)collectionView performBatchUpdates:0 completion:v14];
  }
}

void __67__UIDebuggingInformationHierarchyViewController_expandBeneathCell___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) data];
  id v3 = objc_msgSend(v2, "objectAtIndexedSubscript:", objc_msgSend(*(id *)(a1 + 40), "row"));
  char v4 = [v3 collapsed];

  if ((v4 & 1) == 0)
  {
    uint64_t v5 = *(void *)(a1 + 40);
    id v6 = *(void **)(*(void *)(a1 + 32) + 1056);
    [v6 scrollToItemAtIndexPath:v5 atScrollPosition:1 animated:1];
  }
}

- (BOOL)shouldHighlightSelectedCells
{
  v2 = +[UIDebuggingInformationOverlay overlay];
  char v3 = [v2 isFullscreen] ^ 1;

  return v3;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  unint64_t v7 = +[UIDebuggingInformationOverlay overlay];
  int v8 = [v7 isFullscreen];

  if (v8)
  {
    [(UIDebuggingInformationHierarchyViewController *)self highlightView:0];
    unint64_t v9 = [v15 cellForItemAtIndexPath:v6];
    [v9 setNeedsLayout];
    [v9 deliverToggle];
  }
  else
  {
    unint64_t v9 = [v15 cellForItemAtIndexPath:v6];
    [v9 setNeedsLayout];
    unint64_t v10 = [(UIDebuggingInformationHierarchyViewController *)self data];
    uint64_t v11 = objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v6, "row"));
    uint64_t v12 = [v11 view];

    unint64_t v13 = [(UIDebuggingInformationHierarchyViewController *)self highlightedView];

    id v14 = v12;
    if (v12 == v13)
    {
      [(UICollectionView *)self->_collectionView deselectItemAtIndexPath:v6 animated:0];
      id v14 = 0;
    }
    [(UIDebuggingInformationHierarchyViewController *)self highlightView:v14];
  }
}

- (BOOL)shouldCollapseAtIndexPath:(id)a3
{
  unint64_t v4 = [a3 row];
  uint64_t v5 = [(UIDebuggingInformationHierarchyViewController *)self data];
  unint64_t v6 = [v5 count];

  if (v4 >= v6) {
    unint64_t v4 = v6;
  }
  unint64_t v7 = [(UIDebuggingInformationHierarchyViewController *)self data];
  int v8 = [v7 objectAtIndexedSubscript:v4];
  char v9 = [v8 collapsed];

  return v9;
}

- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
  id v4 = [a3 cellForItemAtIndexPath:a4];
  [v4 setNeedsLayout];
}

- (unint64_t)indentationLevelForIndexPath:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 row];
  unint64_t v6 = [(UIDebuggingInformationHierarchyViewController *)self data];
  unint64_t v7 = [v6 count];

  if (v5 >= v7) {
    goto LABEL_4;
  }
  int v8 = [(UIDebuggingInformationHierarchyViewController *)self data];
  char v9 = objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v4, "row"));
  unint64_t v10 = [v9 view];

  if (v10)
  {
    uint64_t v11 = [(UIDebuggingInformationHierarchyViewController *)self data];
    uint64_t v12 = objc_msgSend(v11, "objectAtIndexedSubscript:", objc_msgSend(v4, "row"));
    unint64_t v13 = [v12 level];
  }
  else
  {
LABEL_4:
    unint64_t v13 = 0;
  }

  return v13;
}

- (id)colorForIndentationLevel:(unint64_t)a3
{
  return +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", a3, 0.2, 1.0);
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v4 = [(UIDebuggingInformationHierarchyViewController *)self data];
  int64_t v5 = [v4 count];

  return v5;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  unint64_t v7 = [a3 dequeueReusableCellWithReuseIdentifier:@"reuseIdentifier" forIndexPath:v6];
  int v8 = [(UIDebuggingInformationHierarchyViewController *)self data];
  char v9 = objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v6, "row"));
  unint64_t v10 = [v9 view];

  if (v10)
  {
    uint64_t v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    uint64_t v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v12 = @"Deallocated";
  }
  [v7 setName:v12];
  [v7 setDelegate:self];
  [v7 bounds];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  long long v21 = [v7 contentView];
  objc_msgSend(v21, "setFrame:", v14, v16, v18, v20);

  v22 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:", objc_msgSend(v6, "row") + 1, objc_msgSend(v6, "section"));
  unint64_t v23 = [(UIDebuggingInformationHierarchyViewController *)self indentationLevelForIndexPath:v22];
  if (v23 <= -[UIDebuggingInformationHierarchyViewController indentationLevelForIndexPath:](self, "indentationLevelForIndexPath:", v6))[v7 setDisclosureIndicatorHidden:1]; {

  }
  return v7;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  return (id)[a3 dequeueReusableSupplementaryViewOfKind:a4 withReuseIdentifier:@"separator-line" forIndexPath:a5];
}

- (void)highlightView:(id)a3
{
  id v19 = a3;
  highlightedView = self->_highlightedView;
  if (highlightedView)
  {
    originalBorderColor = self->_originalBorderColor;
    id v6 = [(UIView *)highlightedView layer];
    [v6 setBorderColor:originalBorderColor];

    double originalBorderWidth = self->_originalBorderWidth;
    int v8 = [(UIView *)self->_highlightedView layer];
    [v8 setBorderWidth:originalBorderWidth];
  }
  [(UIDebuggingInformationHierarchyViewController *)self setHighlightedView:v19];
  char v9 = [v19 layer];
  self->_originalBorderColor = (CGColor *)[v9 borderColor];

  unint64_t v10 = [v19 layer];
  [v10 borderWidth];
  self->_double originalBorderWidth = v11;

  id v12 = +[UIColor redColor];
  uint64_t v13 = [v12 CGColor];
  double v14 = [(UIView *)self->_highlightedView layer];
  [v14 setBorderColor:v13];

  double v15 = +[UIScreen mainScreen];
  [v15 scale];
  double v17 = 1.0 / v16;
  double v18 = [(UIView *)self->_highlightedView layer];
  [v18 setBorderWidth:v17];
}

- (NSMutableArray)keys
{
  return self->_keys;
}

- (void)setKeys:(id)a3
{
}

- (NSMutableDictionary)managedValues
{
  return self->_managedValues;
}

- (void)setManagedValues:(id)a3
{
}

- (NSMutableDictionary)observersForKeys
{
  return self->_observersForKeys;
}

- (void)setObserversForKeys:(id)a3
{
}

- (NSMutableDictionary)controlsForKeys
{
  return self->_controlsForKeys;
}

- (void)setControlsForKeys:(id)a3
{
}

- (NSArray)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (UIView)rootViewForInspection
{
  return self->_rootViewForInspection;
}

- (UIRefreshControl)refreshControl
{
  return self->_refreshControl;
}

- (void)setRefreshControl:(id)a3
{
}

- (UIView)highlightedView
{
  return self->_highlightedView;
}

- (void)setHighlightedView:(id)a3
{
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
}

- (CGColor)originalBorderColor
{
  return self->_originalBorderColor;
}

- (void)setOriginalBorderColor:(CGColor *)a3
{
  self->_originalBorderColor = a3;
}

- (double)originalBorderWidth
{
  return self->_originalBorderWidth;
}

- (void)setOriginalBorderWidth:(double)a3
{
  self->_double originalBorderWidth = a3;
}

- (UIDebuggingInformationInspectorDetailViewController)detail
{
  return self->_detail;
}

- (void)setDetail:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detail, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_highlightedView, 0);
  objc_storeStrong((id *)&self->_refreshControl, 0);
  objc_storeStrong((id *)&self->_rootViewForInspection, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_controlsForKeys, 0);
  objc_storeStrong((id *)&self->_observersForKeys, 0);
  objc_storeStrong((id *)&self->_managedValues, 0);
  objc_storeStrong((id *)&self->_keys, 0);
  objc_storeStrong((id *)&self->_normalItems, 0);
  objc_storeStrong((id *)&self->_showingOverlayItems, 0);
}

@end