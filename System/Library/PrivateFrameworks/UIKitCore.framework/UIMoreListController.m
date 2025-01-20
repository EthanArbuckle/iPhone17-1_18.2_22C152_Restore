@interface UIMoreListController
- (BOOL)_isSupportedInterfaceOrientation:(int64_t)a3;
- (BOOL)_viewControllerWasSelected;
- (BOOL)allowsCustomizing;
- (BOOL)moreViewControllersChanged;
- (NSArray)moreViewControllers;
- (UIMoreListController)init;
- (id)_targetNavigationController;
- (id)tabBarItem;
- (id)table;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_layoutCells;
- (void)_updateEditButton;
- (void)_willChangeToIdiom:(int64_t)a3 onScreen:(id)a4;
- (void)decodeRestorableStateWithCoder:(id)a3;
- (void)encodeRestorableStateWithCoder:(id)a3;
- (void)loadView;
- (void)setAllowsCustomizing:(BOOL)a3;
- (void)setMoreViewControllers:(id)a3;
- (void)setMoreViewControllersChanged:(BOOL)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation UIMoreListController

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return [(NSArray *)self->_moreViewControllers count];
}

- (id)tabBarItem
{
  tabBarItem = self->super._tabBarItem;
  if (!tabBarItem)
  {
    v4 = [[UITabBarItem alloc] initWithTabBarSystemItem:0 tag:0];
    v5 = self->super._tabBarItem;
    self->super._tabBarItem = v4;

    tabBarItem = self->super._tabBarItem;
  }
  return tabBarItem;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (void)_updateEditButton
{
  v19 = self->_moreEditButtonItem;
  if (![(UIMoreListController *)self allowsCustomizing] || self->_disableCustomizing)
  {
    moreEditButtonItem = self->_moreEditButtonItem;
    self->_moreEditButtonItem = 0;
LABEL_4:

    goto LABEL_5;
  }
  if (!self->_moreEditButtonItem)
  {
    v15 = [UIBarButtonItem alloc];
    moreEditButtonItem = _UINSLocalizedStringWithDefaultValue(@"Edit", @"Edit");
    v16 = [(UIViewController *)self tabBarController];
    v17 = [(UIBarButtonItem *)v15 initWithTitle:moreEditButtonItem style:1 target:v16 action:sel_beginCustomizingTabBar_];
    v18 = self->_moreEditButtonItem;
    self->_moreEditButtonItem = v17;

    goto LABEL_4;
  }
LABEL_5:
  v4 = [(UIViewController *)self tabBarController];
  int v5 = [v4 showsEditButtonOnLeft];

  v6 = [(UIViewController *)self navigationItem];
  v7 = v6;
  if (v5)
  {
    v8 = [v6 rightBarButtonItem];

    if (v8 == v19)
    {
      v9 = [(UIViewController *)self navigationItem];
      [v9 setRightBarButtonItem:0];
    }
    v10 = self->_moreEditButtonItem;
    v11 = [(UIViewController *)self navigationItem];
    [v11 setLeftBarButtonItem:v10];
  }
  else
  {
    v12 = [v6 leftBarButtonItem];

    if (v12 == v19)
    {
      v13 = [(UIViewController *)self navigationItem];
      [v13 setLeftBarButtonItem:0];
    }
    v14 = self->_moreEditButtonItem;
    v11 = [(UIViewController *)self navigationItem];
    [v11 setRightBarButtonItem:v14];
  }
}

- (BOOL)allowsCustomizing
{
  return self->_allowsCustomizing;
}

- (NSArray)moreViewControllers
{
  return self->_moreViewControllers;
}

- (void)setAllowsCustomizing:(BOOL)a3
{
  if (self->_allowsCustomizing != a3)
  {
    self->_allowsCustomizing = a3;
    [(UIMoreListController *)self _updateEditButton];
  }
}

- (UIMoreListController)init
{
  v3.receiver = self;
  v3.super_class = (Class)UIMoreListController;
  result = [(UIViewController *)&v3 init];
  if (result) {
    result->_allowsCustomizing = 1;
  }
  return result;
}

- (void)loadView
{
  v8[1] = *MEMORY[0x1E4F143B8];
  objc_super v3 = [_UIMoreListTableView alloc];
  v4 = -[UITableView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  table = self->_table;
  self->_table = v4;

  [(UITableView *)self->_table setDelegate:self];
  [(UITableView *)self->_table setDataSource:self];
  [(UITableView *)self->_table setSeparatorStyle:1];
  [(UITableView *)self->_table set_listController:self];
  [(UIViewController *)self setView:self->_table];
  [(UIMoreListController *)self _layoutCells];
  [(UIMoreListController *)self _updateEditButton];
  v8[0] = 0x1ED3F5AD8;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  id v7 = [(UIViewController *)self _registerForTraitTokenChanges:v6 withTarget:self action:sel__layoutCells];
}

- (void)_willChangeToIdiom:(int64_t)a3 onScreen:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)UIMoreListController;
  [(UIViewController *)&v6 _willChangeToIdiom:a3 onScreen:a4];
  self->_disableCustomizing = a3 == 3;
  self->_hideNavigationBar = a3 == 3;
  [(UIMoreListController *)self _updateEditButton];
}

- (void)setMoreViewControllers:(id)a3
{
  int v5 = (NSArray *)a3;
  if (self->_moreViewControllers != v5)
  {
    objc_storeStrong((id *)&self->_moreViewControllers, a3);
    if ([(UIViewController *)self isViewLoaded]) {
      [(UIMoreListController *)self _layoutCells];
    }
  }
  if (self->_moreViewControllersChanged) {
    [(UIMoreListController *)self _layoutCells];
  }
}

- (void)_layoutCells
{
  if (!self->_layoutManager)
  {
    objc_super v3 = objc_alloc_init(UIMoreListCellLayoutManager);
    layoutManager = self->_layoutManager;
    self->_layoutManager = v3;
  }
  int v5 = [(UIView *)self->_table window];

  if (v5)
  {
    [(UIMoreListCellLayoutManager *)self->_layoutManager setWidestImageWidthFromViewControllers:self->_moreViewControllers];
    double v7 = v6;
    v8 = [(UIViewController *)self traitCollection];
    v9 = [v8 preferredContentSizeCategory];
    BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v9);

    double v11 = -1.0;
    if (!IsAccessibilityCategory) {
      double v11 = v7 + 15.0 + 15.0;
    }
    -[UITableView setSeparatorInset:](self->_table, "setSeparatorInset:", -1.0, v11, -1.0, -1.0);
  }
  v12 = [(UIMoreListController *)self table];
  [v12 reloadData];

  self->_moreViewControllersChanged = 0;
}

- (id)table
{
  return self->_table;
}

- (BOOL)moreViewControllersChanged
{
  return self->_moreViewControllersChanged;
}

- (void)setMoreViewControllersChanged:(BOOL)a3
{
  self->_moreViewControllersChanged = a3;
}

- (BOOL)_isSupportedInterfaceOrientation:(int64_t)a3
{
  return a3 != 2;
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)UIMoreListController;
  -[UIViewController viewWillAppear:](&v8, sel_viewWillAppear_);
  if (self->_hideNavigationBar)
  {
    int v5 = [(UIMoreListController *)self _targetNavigationController];
    [v5 setNavigationBarHidden:1 animated:v3];
  }
  table = self->_table;
  double v7 = [MEMORY[0x1E4F28D58] indexPathForRow:0x7FFFFFFFFFFFFFFFLL inSection:0];
  [(UITableView *)table selectRowAtIndexPath:v7 animated:v3 scrollPosition:0];
}

- (BOOL)_viewControllerWasSelected
{
  return [(UITableView *)self->_table _highlightFirstVisibleRowIfAppropriate];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  double v7 = -[NSArray objectAtIndex:](self->_moreViewControllers, "objectAtIndex:", [a4 row]);
  objc_super v8 = [v7 moreListTableCell];
  if (!v8)
  {
    v9 = NSString;
    v10 = [(UIViewController *)self _screen];
    double v11 = [v9 stringWithFormat:@"%@%d", @"MORE_CELL_IDENTIFIER", objc_msgSend(v10, "_userInterfaceIdiom")];

    objc_super v8 = [v6 dequeueReusableCellWithIdentifier:v11];
    if (!v8)
    {
      objc_super v8 = [[UITableViewCell alloc] initWithStyle:0 reuseIdentifier:v11];
      [(UIView *)v8 setAutoresizingMask:2];
      [(UITableViewCell *)v8 setLayoutManager:self->_layoutManager];
    }
    v12 = [v7 tabBarItem];
    v13 = [v7 _moreListTitle];
    if (!v13)
    {
      v13 = [v12 _internalTitle];
      if (!v13)
      {
        v13 = [v7 title];
      }
    }
    v14 = [(UITableViewCell *)v8 textLabel];
    [v14 setText:v13];

    if ([(UIView *)v8 _shouldReverseLayoutDirection]) {
      uint64_t v15 = 2;
    }
    else {
      uint64_t v15 = 0;
    }
    v16 = [(UITableViewCell *)v8 textLabel];
    [v16 setTextAlignment:v15];

    v17 = __UIMoreListImageForViewController(self, v7, 0);
    v18 = [(UITableViewCell *)v8 imageView];
    [v18 setImage:v17];

    v19 = [(UITableViewCell *)v8 imageView];
    [v19 setAlpha:0.8];

    v20 = [(UITableViewCell *)v8 imageView];
    [v20 _setDefaultRenderingMode:2];

    [(UITableViewCell *)v8 setAccessoryType:1];
    v21 = [v12 badgeValue];
    [(UITableViewCell *)v8 _setBadgeText:v21];

    v22 = [(UIViewController *)self _screen];
    uint64_t v23 = [v22 _userInterfaceIdiom];

    v24 = [(UITableViewCell *)v8 imageView];
    if (v23 == 3) {
      +[UIColor whiteColor];
    }
    else {
    v25 = +[UITabBar _unselectedTabTintColorForView:v6];
    }
    [v24 setTintColor:v25];
  }
  return v8;
}

- (id)_targetNavigationController
{
  BOOL v3 = [(UIViewController *)self navigationController];
  v4 = v3;
  if (self->_hideNavigationBar)
  {
    int v5 = [v3 navigationController];

    if (v5)
    {
      uint64_t v6 = [v4 navigationController];

      v4 = (void *)v6;
    }
  }
  return v4;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v5 = objc_msgSend(a4, "row", a3);
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v6 = v5;
    id v8 = [(UIMoreListController *)self _targetNavigationController];
    double v7 = [(NSArray *)self->_moreViewControllers objectAtIndex:v6];
    [v8 pushViewController:v7 animated:1];

    if (self->_hideNavigationBar) {
      [v8 setNavigationBarHidden:0 animated:1];
    }
  }
}

- (void)encodeRestorableStateWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)UIMoreListController;
  [(UIViewController *)&v7 encodeRestorableStateWithCoder:v4];
  uint64_t v5 = [(UITableView *)self->_table indexPathForSelectedRow];
  uint64_t v6 = v5;
  if (v5) {
    objc_msgSend(v4, "encodeInteger:forKey:", objc_msgSend(v5, "row"), @"kSelectedTableViewCellIndexKey");
  }
}

- (void)decodeRestorableStateWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)UIMoreListController;
  [(UIResponder *)&v7 decodeRestorableStateWithCoder:v4];
  if ([v4 containsValueForKey:@"kSelectedTableViewCellIndexKey"])
  {
    uint64_t v5 = [v4 decodeIntegerForKey:@"kSelectedTableViewCellIndexKey"];
    uint64_t v6 = [MEMORY[0x1E4F28D58] indexPathForRow:v5 inSection:0];
    [(UITableView *)self->_table selectRowAtIndexPath:v6 animated:0 scrollPosition:0];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_moreEditButtonItem, 0);
  objc_storeStrong((id *)&self->_layoutManager, 0);
  objc_storeStrong((id *)&self->_moreViewControllers, 0);
  objc_storeStrong((id *)&self->_table, 0);
}

@end