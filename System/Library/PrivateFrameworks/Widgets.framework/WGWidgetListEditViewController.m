@interface WGWidgetListEditViewController
- (BOOL)_isDismissingDueToInterfaceAction;
- (BOOL)_isNewItem:(id)a3;
- (BOOL)areWidgetsPinned;
- (BOOL)showsFavorites;
- (BOOL)showsFavoritesSection;
- (BOOL)showsPinSection;
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4;
- (BOOL)wereWidgetsPinnedOriginally;
- (WGWidgetListEditViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (WGWidgetListEditViewControllerDataSource)dataSource;
- (WGWidgetListEditViewControllerDelegate)delegate;
- (id)_enabledItemIdentifiersForGroupID:(id)a3;
- (id)_groupKeyForSectionAtIndex:(unint64_t)a3;
- (id)_indexPathForItemWithIdentifier:(id)a3;
- (id)_itemIdentifierForIndexPath:(id)a3;
- (id)_itemIdentifiersInSection:(unint64_t)a3;
- (id)_statusBarColorAssertion;
- (id)_widgetListEditViewTableHeaderView;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 targetIndexPathForMoveFromRowAtIndexPath:(id)a4 toProposedIndexPath:(id)a5;
- (id)tableView:(id)a3 titleForDeleteConfirmationButtonForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)_compareItemWithIdentifier:(id)a3 andItemWithIdentifierConsideringIsNew:(id)a4;
- (int64_t)_indexOfFirstEnabledWidgetInSection:(unint64_t)a3;
- (int64_t)_indexOfLastEnabledWidgetInSection:(unint64_t)a3;
- (int64_t)_layoutMode;
- (int64_t)disabledWidgetsSection;
- (int64_t)favoritesSection;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)pinSection;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (int64_t)todaySection;
- (unint64_t)_indexForInsertingItemWithIdentifier:(id)a3 intoArray:(id)a4;
- (unint64_t)_sectionIndexForGroupKey:(id)a3;
- (void)_acknowledgeItemsAndResetNewWidgetsCount;
- (void)_acknowledgeItemsSavingItemState:(BOOL)a3;
- (void)_cancelWidgetListEditView;
- (void)_disableItemAtIndexPath:(id)a3 inTableView:(id)a4;
- (void)_dismissDueToInterfaceActionAndAcknowledgeItemsSavingItemState:(BOOL)a3;
- (void)_dismissWidgetListEditView;
- (void)_enableItemAtIndexPath:(id)a3 inTableView:(id)a4;
- (void)_loadItems;
- (void)_saveItemArrangement;
- (void)_saveItemState;
- (void)_setDismissingDueToInterfaceAction:(BOOL)a3;
- (void)_setStatusBarColorAssertion:(id)a3;
- (void)pinSwitchChanaged:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setShowsFavorites:(BOOL)a3;
- (void)setShowsPinSection:(BOOL)a3;
- (void)setWidgetsPinned:(BOOL)a3;
- (void)setWidgetsPinnedOriginally:(BOOL)a3;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 moveRowAtIndexPath:(id)a4 toIndexPath:(id)a5;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation WGWidgetListEditViewController

- (WGWidgetListEditViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v14.receiver = self;
  v14.super_class = (Class)WGWidgetListEditViewController;
  v4 = [(WGWidgetListEditViewController *)&v14 initWithNibName:0 bundle:0];
  if (v4)
  {
    v5 = (UINavigationController *)objc_alloc_init(MEMORY[0x263F1C7F8]);
    navigationController = v4->_navigationController;
    v4->_navigationController = v5;

    [(WGWidgetListEditViewController *)v4 addChildViewController:v4->_navigationController];
    [(UINavigationController *)v4->_navigationController didMoveToParentViewController:v4];
    uint64_t v7 = [objc_alloc(MEMORY[0x263F1CA58]) initWithStyle:2];
    tableViewController = v4->_tableViewController;
    v4->_tableViewController = (UITableViewController *)v7;

    v9 = (void *)[objc_alloc(MEMORY[0x263F1C468]) initWithBarButtonSystemItem:1 target:v4 action:sel__cancelWidgetListEditView];
    v10 = [(UITableViewController *)v4->_tableViewController navigationItem];
    [v10 setLeftBarButtonItem:v9];

    v11 = (void *)[objc_alloc(MEMORY[0x263F1C468]) initWithBarButtonSystemItem:0 target:v4 action:sel__dismissWidgetListEditView];
    v12 = [(UITableViewController *)v4->_tableViewController navigationItem];
    [v12 setRightBarButtonItem:v11];

    [(UITableViewController *)v4->_tableViewController setEditing:1 animated:0];
    [(UINavigationController *)v4->_navigationController pushViewController:v4->_tableViewController animated:0];
  }
  return v4;
}

- (void)setDataSource:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  id v6 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_dataSource, obj);
    if (objc_opt_respondsToSelector())
    {
      uint64_t v7 = [obj groupsForWidgetListEditViewController:self];
    }
    else
    {
      uint64_t v7 = objc_msgSend(objc_alloc(MEMORY[0x263EFF8C0]), "initWithObjects:", @"TodayGroup", 0);
    }
    v8 = v7;
    objc_storeStrong((id *)&self->_groupIDs, v7);

    self->_showsFavorites = [obj widgetListEditViewControllerShouldShowFavorites:self];
    if (objc_opt_respondsToSelector())
    {
      int v9 = [obj shouldShowWidgetsPinButtonForWidgetListEditViewController:self];
      self->_showsPinSection = v9;
      if (v9)
      {
        if (objc_opt_respondsToSelector())
        {
          char v10 = [obj areWidgetsPinnedForWidgetListEditViewController:self];
          self->_widgetsPinnedOriginally = v10;
          self->_widgetsPinned = v10;
        }
      }
    }
    uint64_t v5 = [(WGWidgetListEditViewController *)self _loadItems];
    id v6 = obj;
  }
  MEMORY[0x270F9A758](v5, v6);
}

- (void)viewDidLoad
{
  v17.receiver = self;
  v17.super_class = (Class)WGWidgetListEditViewController;
  [(WGWidgetListEditViewController *)&v17 viewDidLoad];
  v3 = [MEMORY[0x263F1C550] _systemGroupBackgroundColor];
  v4 = [(WGWidgetListEditViewController *)self view];
  [v4 setBackgroundColor:v3];

  int64_t v5 = [(WGWidgetListEditViewController *)self _layoutMode];
  id v6 = [(UITableViewController *)self->_tableViewController tableView];
  [v6 setDataSource:self];
  [v6 setDelegate:self];
  [v6 registerClass:objc_opt_class() forCellReuseIdentifier:@"WidgetCell"];
  [v6 registerClass:objc_opt_class() forCellReuseIdentifier:@"PinCell"];
  [v6 registerClass:objc_opt_class() forCellReuseIdentifier:@"EmptyFavoritesCell"];
  [v6 registerClass:objc_opt_class() forHeaderFooterViewReuseIdentifier:@"WidgetHeader"];
  [v6 setBackgroundView:0];
  [v6 setBackgroundColor:v3];
  [v6 setShowsHorizontalScrollIndicator:0];
  uint64_t v7 = 0;
  unint64_t v8 = v5 & 0xFFFFFFFFFFFFFFFELL;
  if ((v5 & 0xFFFFFFFFFFFFFFFELL) != 2) {
    uint64_t v7 = objc_msgSend(v6, "showsVerticalScrollIndicator", 0);
  }
  [v6 setShowsVerticalScrollIndicator:v7];
  [v6 _setDrawsSeparatorAtTopOfSections:1];
  [MEMORY[0x263F146D0] widgetRowHeight];
  objc_msgSend(v6, "setEstimatedRowHeight:");
  int v9 = [[WGWidgetListEditViewTableHeaderView alloc] initWithReuseIdentifier:@"WidgetTableHeader" forTodayView:self->_showsFavorites];
  [v6 setTableHeaderView:v9];
  char v10 = [(UINavigationController *)self->_navigationController view];
  [v10 setBackgroundColor:v3];

  if (v8 == 2)
  {
    v11 = [(UINavigationController *)self->_navigationController view];
    v12 = [v11 layer];
    [v12 setCornerRadius:8.0];
  }
  v13 = [(WGWidgetListEditViewController *)self view];
  objc_super v14 = [(UINavigationController *)self->_navigationController view];
  [v13 addSubview:v14];

  v15 = [(UINavigationController *)self->_navigationController navigationBar];
  v16 = [MEMORY[0x263F1C550] _systemGroupBackgroundColor];
  [v15 setBarTintColor:v16];

  [v15 setTranslucent:0];
  [v15 _setHidesShadow:1];
}

- (int64_t)_layoutMode
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  if (objc_opt_respondsToSelector()) {
    int64_t v4 = [WeakRetained layoutModeForWidgetListEditViewController:self];
  }
  else {
    int64_t v4 = 0;
  }

  return v4;
}

- (void)viewWillLayoutSubviews
{
  v65.receiver = self;
  v65.super_class = (Class)WGWidgetListEditViewController;
  [(WGWidgetListEditViewController *)&v65 viewWillLayoutSubviews];
  int64_t v3 = [(WGWidgetListEditViewController *)self _layoutMode];
  int64_t v4 = [(UINavigationController *)self->_navigationController navigationBar];
  [v4 frame];
  double x = v66.origin.x;
  double width = v66.size.width;
  double MaxY = CGRectGetMaxY(v66);
  unint64_t v8 = [(UINavigationController *)self->_navigationController navigationBar];
  int v9 = [v8 _backgroundView];

  char v10 = [v9 superview];
  v11 = [v4 superview];
  objc_msgSend(v10, "convertRect:fromView:", v11, x, 0.0, width, MaxY);
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;

  objc_msgSend(v9, "setFrame:", v13, v15, v17, v19);
  v20 = [(UITableViewController *)self->_tableViewController tableView];
  [v20 setRowHeight:*MEMORY[0x263F1D600]];
  v21 = [v20 tableHeaderView];
  [v20 setTableHeaderView:0];
  [v21 frame];
  if (CGRectEqualToRect(v67, *MEMORY[0x263F001A8]))
  {
    v22 = [(WGWidgetListEditViewController *)self view];
    [v22 bounds];
    objc_msgSend(v21, "setFrame:", 0.0, 0.0);
  }
  [v21 sizeToFit];
  [v20 setTableHeaderView:v21];
  if ((v3 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    v23 = [(WGWidgetListEditViewController *)self view];
    [v23 bounds];
    CGFloat v25 = v24;
    CGFloat v27 = v26;
    CGFloat v29 = v28;
    CGFloat v31 = v30;

    v32 = [MEMORY[0x263F1C920] mainScreen];
    [v32 _referenceBounds];
    CGRectGetHeight(v68);
    v33 = [MEMORY[0x263F1C920] mainScreen];
    UIRoundToScreenScale();
    CGFloat v35 = v34;

    v36 = [MEMORY[0x263F1C5C0] currentDevice];
    uint64_t v37 = [v36 userInterfaceIdiom];

    if ((v37 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
      double v38 = 16.0;
    }
    else {
      double v38 = 0.0;
    }
    v69.origin.double x = v25;
    v69.origin.y = v27;
    v69.size.double width = v29;
    v69.size.height = v31;
    CGRectGetHeight(v69);
    v70.origin.double x = v25;
    v70.origin.y = v38;
    v70.size.double width = v35;
    v70.size.height = v31;
    CGRectGetMinY(v70);
    v39 = [MEMORY[0x263F1C920] mainScreen];
    [v39 scale];
    uint64_t v64 = v40;
    UIRectCenteredXInRectScale();
    double v42 = v41;
    double v44 = v43;
    double v46 = v45;
    double v48 = v47;

    v49 = [(UINavigationController *)self->_navigationController view];
    objc_msgSend(v49, "setFrame:", v42, v44, v46, v48);

    v50 = [(UITableViewController *)self->_tableViewController tableView];
    [v50 contentInset];
    double v52 = v51;
    double v54 = v53;
    double v56 = v55;
    double v58 = v57;

    v59 = [MEMORY[0x263F1C5C0] currentDevice];
    uint64_t v60 = [v59 userInterfaceIdiom];

    double v61 = 30.0;
    if ((v60 & 0xFFFFFFFFFFFFFFFBLL) != 1) {
      double v61 = 8.0;
    }
    double v62 = v56 + v61;
    v63 = [(UITableViewController *)self->_tableViewController tableView];
    objc_msgSend(v63, "setContentInset:", v52, v54, v62, v58);
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)WGWidgetListEditViewController;
  [(WGWidgetListEditViewController *)&v4 viewWillAppear:a3];
  int64_t v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 postNotificationName:@"WGWidgetListEditViewControllerWillAppear" object:0];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)WGWidgetListEditViewController;
  [(WGWidgetListEditViewController *)&v4 viewDidAppear:a3];
  int64_t v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 postNotificationName:@"WGWidgetListEditViewControllerDidAppear" object:0];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)WGWidgetListEditViewController;
  [(WGWidgetListEditViewController *)&v4 viewWillDisappear:a3];
  int64_t v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 postNotificationName:@"WGWidgetListEditViewControllerWillDisappear" object:0];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)WGWidgetListEditViewController;
  [(WGWidgetListEditViewController *)&v5 viewDidDisappear:a3];
  if (!self->_dismissingDueToInterfaceAction) {
    [(WGWidgetListEditViewController *)self _acknowledgeItemsSavingItemState:0];
  }
  objc_super v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 postNotificationName:@"WGWidgetListEditViewControllerDidDisappear" object:0];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained widgetEditListViewController:self traitCollectionDidChange:v4];
  }
  v6.receiver = self;
  v6.super_class = (Class)WGWidgetListEditViewController;
  [(WGWidgetListEditViewController *)&v6 traitCollectionDidChange:v4];
}

- (BOOL)showsFavoritesSection
{
  BOOL v3 = [(WGWidgetListEditViewController *)self showsFavorites];
  if (v3)
  {
    LOBYTE(v3) = [(WGWidgetListEditViewController *)self areWidgetsPinned];
  }
  return v3;
}

- (int64_t)pinSection
{
  return [(WGWidgetListEditViewController *)self showsPinSection] - 1;
}

- (int64_t)todaySection
{
  NSUInteger v3 = [(NSArray *)self->_groupIDs indexOfObject:@"TodayGroup"];
  NSUInteger v4 = v3 + [(WGWidgetListEditViewController *)self showsPinSection];
  return v4 + [(WGWidgetListEditViewController *)self showsFavoritesSection];
}

- (int64_t)favoritesSection
{
  if ([(WGWidgetListEditViewController *)self showsFavoritesSection]) {
    return [(WGWidgetListEditViewController *)self showsPinSection];
  }
  else {
    return -1;
  }
}

- (int64_t)disabledWidgetsSection
{
  NSUInteger v3 = [(NSArray *)self->_groupIDs count];
  NSUInteger v4 = v3 + [(WGWidgetListEditViewController *)self showsPinSection];
  return v4 + [(WGWidgetListEditViewController *)self showsFavoritesSection];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  BOOL v4 = [(WGWidgetListEditViewController *)self showsPinSection];
  BOOL v5 = [(WGWidgetListEditViewController *)self showsFavoritesSection];
  NSUInteger v6 = [(NSArray *)self->_groupIDs count];
  uint64_t v7 = 1;
  if (v4) {
    uint64_t v7 = 2;
  }
  return v7 + v5 + v6;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if ([(WGWidgetListEditViewController *)self todaySection] == a4)
  {
    uint64_t v6 = 992;
LABEL_9:
    unint64_t v8 = *(Class *)((char *)&self->super.super.super.isa + v6);
    return [v8 count];
  }
  if ([(WGWidgetListEditViewController *)self favoritesSection] != a4)
  {
    if ([(WGWidgetListEditViewController *)self disabledWidgetsSection] != a4) {
      return [(WGWidgetListEditViewController *)self pinSection] == a4;
    }
    uint64_t v6 = 1008;
    goto LABEL_9;
  }
  int64_t result = [(NSMutableArray *)self->_favoriteItemIDs count];
  if (result <= 1) {
    return 1;
  }
  return result;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 section];
  if (v8 == [(WGWidgetListEditViewController *)self pinSection])
  {
    int v9 = [v6 dequeueReusableCellWithIdentifier:@"PinCell" forIndexPath:v7];
    char v10 = [v9 pinSwitch];
    objc_msgSend(v10, "setOn:", -[WGWidgetListEditViewController areWidgetsPinned](self, "areWidgetsPinned"));

    v11 = [v9 pinSwitch];
    [v11 addTarget:self action:sel_pinSwitchChanaged_ forControlEvents:4096];

    [v9 startAnimating];
  }
  else
  {
    uint64_t v12 = [v7 section];
    if (v12 == [(WGWidgetListEditViewController *)self favoritesSection]
      && ![(NSMutableArray *)self->_favoriteItemIDs count])
    {
      int v9 = [v6 dequeueReusableCellWithIdentifier:@"EmptyFavoritesCell" forIndexPath:v7];
    }
    else
    {
      int v9 = [v6 dequeueReusableCellWithIdentifier:@"WidgetCell" forIndexPath:v7];
      double v13 = [(WGWidgetListEditViewController *)self _itemIdentifierForIndexPath:v7];
      objc_msgSend(v9, "setEditing:", -[UITableViewController isEditing](self->_tableViewController, "isEditing"));
      id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
      if (objc_opt_respondsToSelector())
      {
        id v15 = [WeakRetained widgetListEditViewController:self displayNameForItemWithIdentifier:v13];
      }
      else
      {
        id v15 = v13;
      }
      double v16 = v15;
      double v17 = [v9 textLabel];
      [v17 setText:v16];

      double v18 = [v9 textLabel];
      LODWORD(v19) = 1057803469;
      [v18 _setHyphenationFactor:v19];

      if (objc_opt_respondsToSelector())
      {
        objc_initWeak(&location, self);
        uint64_t v22 = MEMORY[0x263EF8330];
        uint64_t v23 = 3221225472;
        double v24 = __66__WGWidgetListEditViewController_tableView_cellForRowAtIndexPath___block_invoke;
        CGFloat v25 = &unk_2646766D0;
        objc_copyWeak(&v28, &location);
        id v26 = v6;
        id v27 = v13;
        [WeakRetained widgetListEditViewController:self requestsIconForItemWithIdentifier:v27 withHandler:&v22];

        objc_destroyWeak(&v28);
        objc_destroyWeak(&location);
      }
      objc_msgSend(v9, "setWidgetEnabled:", objc_msgSend(v7, "section", v22, v23, v24, v25) != -[WGWidgetListEditViewController disabledWidgetsSection](self, "disabledWidgetsSection"));
      uint64_t v20 = [v7 section];
      if (v20 == [(WGWidgetListEditViewController *)self disabledWidgetsSection]) {
        objc_msgSend(v9, "setShowsDot:", -[WGWidgetListEditViewController _isNewItem:](self, "_isNewItem:", v13));
      }
    }
  }

  return v9;
}

void __66__WGWidgetListEditViewController_tableView_cellForRowAtIndexPath___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __66__WGWidgetListEditViewController_tableView_cellForRowAtIndexPath___block_invoke_2;
  v5[3] = &unk_2646766A8;
  objc_copyWeak(&v9, a1 + 6);
  id v6 = a1[4];
  id v7 = a1[5];
  id v8 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v5);

  objc_destroyWeak(&v9);
}

void __66__WGWidgetListEditViewController_tableView_cellForRowAtIndexPath___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v3 = *(void **)(a1 + 32);
  id v4 = [WeakRetained _indexPathForItemWithIdentifier:*(void *)(a1 + 40)];
  BOOL v5 = [v3 cellForRowAtIndexPath:v4];

  id v6 = (void *)MEMORY[0x263F1CB60];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __66__WGWidgetListEditViewController_tableView_cellForRowAtIndexPath___block_invoke_3;
  v13[3] = &unk_264676680;
  id v7 = v5;
  id v14 = v7;
  id v15 = *(id *)(a1 + 48);
  [v6 performWithoutAnimation:v13];
  if (objc_msgSend(WeakRetained, "wg_isAppearingOrAppeared"))
  {
    id v8 = [v7 imageView];
    id v9 = [v8 image];

    if (!v9)
    {
      char v10 = (void *)MEMORY[0x263F1CB60];
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __66__WGWidgetListEditViewController_tableView_cellForRowAtIndexPath___block_invoke_4;
      v11[3] = &unk_264676588;
      id v12 = v7;
      [v10 animateWithDuration:v11 animations:0.25];
    }
  }
}

uint64_t __66__WGWidgetListEditViewController_tableView_cellForRowAtIndexPath___block_invoke_3(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) imageView];
  [v2 setImage:*(void *)(a1 + 40)];

  [*(id *)(a1 + 32) setNeedsLayout];
  id v3 = *(void **)(a1 + 32);
  return [v3 layoutIfNeeded];
}

void __66__WGWidgetListEditViewController_tableView_cellForRowAtIndexPath___block_invoke_4(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) imageView];
  objc_msgSend(v1, "pl_performCrossFadeIfNecessary");
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  if ([(WGWidgetListEditViewController *)self disabledWidgetsSection] == a4)
  {
    char v6 = _os_feature_enabled_impl();
    id v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v8 = v7;
    if (v6) {
      id v9 = @"WIDGETS_EDIT_DISABLED_LEGACY";
    }
    else {
      id v9 = @"WIDGETS_EDIT_DISABLED";
    }
    goto LABEL_10;
  }
  if ([(WGWidgetListEditViewController *)self showsFavoritesSection])
  {
    if ([(WGWidgetListEditViewController *)self todaySection] == a4)
    {
      id v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v8 = v7;
      id v9 = @"WIDGETS_EDIT_FAVORITES";
LABEL_10:
      char v10 = [v7 localizedStringForKey:v9 value:&stru_26D5C79B8 table:@"Widgets"];

      goto LABEL_12;
    }
    if ([(WGWidgetListEditViewController *)self favoritesSection] == a4)
    {
      id v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v8 = v7;
      id v9 = @"WIDGETS_EDIT_PINNED_FAVORITES";
      goto LABEL_10;
    }
  }
  char v10 = 0;
LABEL_12:
  return v10;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v4 = objc_msgSend(a3, "dequeueReusableHeaderFooterViewWithIdentifier:", @"WidgetHeader", a4);
  BOOL v5 = [v4 textLabel];
  char v6 = [MEMORY[0x263F1C550] _secondaryLabelColor];
  [v5 setTextColor:v6];

  return v4;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  if ([(WGWidgetListEditViewController *)self favoritesSection] == a4)
  {
    id v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    BOOL v5 = [v4 localizedStringForKey:@"WIDGETS_EDIT_FAVORITES_DESCRIPTION" value:&stru_26D5C79B8 table:@"Widgets"];
  }
  else
  {
    BOOL v5 = 0;
  }
  return v5;
}

- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4
{
  uint64_t v5 = objc_msgSend(a4, "section", a3);
  return v5 != [(WGWidgetListEditViewController *)self disabledWidgetsSection]
      && v5 != [(WGWidgetListEditViewController *)self pinSection];
}

- (id)tableView:(id)a3 targetIndexPathForMoveFromRowAtIndexPath:(id)a4 toProposedIndexPath:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = [v8 section];
  if (v9 == [(WGWidgetListEditViewController *)self favoritesSection])
  {
    char v10 = v8;
    if ([(NSMutableArray *)self->_favoriteItemIDs count]) {
      goto LABEL_18;
    }
    v11 = (void *)MEMORY[0x263F088C8];
    uint64_t v12 = [(WGWidgetListEditViewController *)self favoritesSection];
    double v13 = v11;
    uint64_t v14 = 1;
    goto LABEL_15;
  }
  if (v9 != [(WGWidgetListEditViewController *)self disabledWidgetsSection])
  {
    if (v9 == [(WGWidgetListEditViewController *)self pinSection])
    {
      id v17 = v7;
LABEL_16:
      char v10 = v17;
      id v15 = v8;
      goto LABEL_17;
    }
    uint64_t v18 = -[WGWidgetListEditViewController _indexOfFirstEnabledWidgetInSection:](self, "_indexOfFirstEnabledWidgetInSection:", [v8 section]);
    if ([v8 row] >= v18)
    {
      int64_t v20 = -[WGWidgetListEditViewController _indexOfLastEnabledWidgetInSection:](self, "_indexOfLastEnabledWidgetInSection:", [v8 section]);
      uint64_t v21 = [v7 section];
      uint64_t v22 = v20 - (v21 == [v8 section]);
      char v10 = v8;
      if ([v8 row] <= v22) {
        goto LABEL_18;
      }
      if (v22 >= v18) {
        uint64_t v23 = v22 + 1;
      }
      else {
        uint64_t v23 = v18;
      }
      double v24 = (void *)MEMORY[0x263F088C8];
      uint64_t v12 = [v8 section];
      double v13 = v24;
      uint64_t v14 = v23;
    }
    else
    {
      double v19 = (void *)MEMORY[0x263F088C8];
      uint64_t v12 = [v8 section];
      double v13 = v19;
      uint64_t v14 = v18;
    }
LABEL_15:
    id v17 = [v13 indexPathForRow:v14 inSection:v12];
    goto LABEL_16;
  }
  id v15 = [(WGWidgetListEditViewController *)self _itemIdentifierForIndexPath:v7];
  unint64_t v16 = [(WGWidgetListEditViewController *)self _indexForInsertingItemWithIdentifier:v15 intoArray:self->_disabledItemIDs];
  char v10 = objc_msgSend(MEMORY[0x263F088C8], "indexPathForRow:inSection:", v16, -[WGWidgetListEditViewController disabledWidgetsSection](self, "disabledWidgetsSection"));

LABEL_17:
LABEL_18:

  return v10;
}

- (void)tableView:(id)a3 moveRowAtIndexPath:(id)a4 toIndexPath:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v16 = [(WGWidgetListEditViewController *)self _itemIdentifierForIndexPath:v9];
  uint64_t v11 = [v9 section];

  uint64_t v12 = [(WGWidgetListEditViewController *)self _itemIdentifiersInSection:v11];
  double v13 = -[WGWidgetListEditViewController _itemIdentifiersInSection:](self, "_itemIdentifiersInSection:", [v8 section]);
  [v12 removeObject:v16];
  uint64_t v14 = [v8 row];
  uint64_t v15 = [v8 section];

  if (v15 == [(WGWidgetListEditViewController *)self favoritesSection]
    && ![v13 count])
  {
    uint64_t v14 = 0;
  }
  [v13 insertObject:v16 atIndex:v14];
  [v10 reloadData];
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [v5 section];
  BOOL v7 = 0;
  if (v6 != [(WGWidgetListEditViewController *)self pinSection])
  {
    uint64_t v8 = [v5 section];
    if (v8 != [(WGWidgetListEditViewController *)self favoritesSection]
      || [(NSMutableArray *)self->_favoriteItemIDs count])
    {
      BOOL v7 = 1;
    }
  }

  return v7;
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [v5 section];
  if (v6 == [(WGWidgetListEditViewController *)self disabledWidgetsSection])
  {
    int64_t v7 = 2;
  }
  else
  {
    uint64_t v8 = [v5 section];
    int64_t v7 = 0;
    if (v8 != [(WGWidgetListEditViewController *)self pinSection])
    {
      uint64_t v9 = [v5 section];
      if (v9 != [(WGWidgetListEditViewController *)self favoritesSection]
        || [(NSMutableArray *)self->_favoriteItemIDs count])
      {
        int64_t v7 = 1;
      }
    }
  }

  return v7;
}

- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4
{
  return 0;
}

- (id)tableView:(id)a3 titleForDeleteConfirmationButtonForRowAtIndexPath:(id)a4
{
  id v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v5 = [v4 localizedStringForKey:@"WIDGETS_EDIT_REMOVE" value:&stru_26D5C79B8 table:@"Widgets"];

  return v5;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  id v9 = a3;
  id v8 = a5;
  if (v8)
  {
    if (a4 == 1)
    {
      [(WGWidgetListEditViewController *)self _disableItemAtIndexPath:v8 inTableView:v9];
    }
    else if (a4 == 2)
    {
      [(WGWidgetListEditViewController *)self _enableItemAtIndexPath:v8 inTableView:v9];
    }
  }
}

- (void)scrollViewDidScroll:(id)a3
{
  id v11 = a3;
  if (self->_contentMinY == 0.0)
  {
    id v4 = [(WGWidgetListEditViewController *)self _widgetListEditViewTableHeaderView];
    [v4 contentMinY];
    self->_double contentMinY = v5;
  }
  uint64_t v6 = [(UINavigationController *)self->_navigationController navigationBar];
  double contentMinY = self->_contentMinY;
  [v11 contentOffset];
  double v9 = v8;
  [v11 contentInset];
  [v6 _setHidesShadow:contentMinY > v9 + v10];
}

- (void)_acknowledgeItemsSavingItemState:(BOOL)a3
{
  if (a3)
  {
    [(WGWidgetListEditViewController *)self _saveItemState];
    [(WGWidgetListEditViewController *)self _saveItemArrangement];
  }
  else
  {
    [(WGWidgetListEditViewController *)self _acknowledgeItemsAndResetNewWidgetsCount];
  }
}

- (void)_dismissDueToInterfaceActionAndAcknowledgeItemsSavingItemState:(BOOL)a3
{
  self->_dismissingDueToInterfaceAction = 1;
  [(WGWidgetListEditViewController *)self _acknowledgeItemsSavingItemState:a3];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    objc_initWeak(&location, self);
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __97__WGWidgetListEditViewController__dismissDueToInterfaceActionAndAcknowledgeItemsSavingItemState___block_invoke;
    v5[3] = &unk_2646766F8;
    objc_copyWeak(&v6, &location);
    [WeakRetained dismissWidgetListEditViewController:self animated:1 withCompletion:v5];
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

void __97__WGWidgetListEditViewController__dismissDueToInterfaceActionAndAcknowledgeItemsSavingItemState___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _setDismissingDueToInterfaceAction:0];
}

- (void)_cancelWidgetListEditView
{
}

- (void)_dismissWidgetListEditView
{
}

- (id)_enabledItemIdentifiersForGroupID:(id)a3
{
  id v4 = a3;
  if ([v4 isEqual:@"TodayGroup"])
  {
    double v5 = &OBJC_IVAR___WGWidgetListEditViewController__enabledTodayItemIDs;
  }
  else
  {
    if (![v4 isEqual:@"FavoriteGroup"])
    {
      id v6 = 0;
      goto LABEL_7;
    }
    double v5 = &OBJC_IVAR___WGWidgetListEditViewController__favoriteItemIDs;
  }
  id v6 = *(Class *)((char *)&self->super.super.super.isa + *v5);
LABEL_7:
  id v7 = v6;

  return v7;
}

- (void)_loadItems
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  id v4 = [MEMORY[0x263EFF9A0] dictionary];
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  double v5 = self->_groupIDs;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v50 objects:v56 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v51;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v51 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v50 + 1) + 8 * i);
        id v11 = [WeakRetained widgetListEditViewController:self itemIdentifiersForGroup:v10];
        if (v11) {
          [v4 setObject:v11 forKey:v10];
        }
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v50 objects:v56 count:16];
    }
    while (v7);
  }

  uint64_t v12 = [WeakRetained disabledInterfaceItemIdentifiersForWidgetListEditViewController:self];
  [v4 setObject:v12 forKey:@"Disabled"];

  double v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  enabledTodayItemIDs = self->_enabledTodayItemIDs;
  self->_enabledTodayItemIDs = v13;

  uint64_t v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  favoriteItemIDs = self->_favoriteItemIDs;
  self->_favoriteItemIDs = v15;

  id v17 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  disabledItemIDs = self->_disabledItemIDs;
  self->_disabledItemIDs = v17;

  if (objc_opt_respondsToSelector()) {
    char v19 = [WeakRetained widgetListEditViewControllerShouldIncludeInternalWidgets:self];
  }
  else {
    char v19 = 0;
  }
  BOOL v39 = [(WGWidgetListEditViewController *)self showsFavorites];
  uint64_t v40 = WeakRetained;
  char v38 = [WeakRetained areWidgetsPinnedForWidgetListEditViewController:self];
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id obj = v4;
  uint64_t v35 = [obj countByEnumeratingWithState:&v46 objects:v55 count:16];
  if (v35)
  {
    uint64_t v34 = *(void *)v47;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v47 != v34) {
          objc_enumerationMutation(obj);
        }
        uint64_t v37 = v20;
        uint64_t v21 = *(void **)(*((void *)&v46 + 1) + 8 * v20);
        -[WGWidgetListEditViewController _enabledItemIdentifiersForGroupID:](self, "_enabledItemIdentifiersForGroupID:", v21, v34);
        uint64_t v22 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
        long long v42 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        uint64_t v23 = [obj objectForKey:v21];
        uint64_t v24 = [v23 countByEnumeratingWithState:&v42 objects:v54 count:16];
        if (v24)
        {
          uint64_t v25 = v24;
          uint64_t v26 = *(void *)v43;
          do
          {
            for (uint64_t j = 0; j != v25; ++j)
            {
              if (*(void *)v43 != v26) {
                objc_enumerationMutation(v23);
              }
              uint64_t v28 = *(void *)(*((void *)&v42 + 1) + 8 * j);
              if (([v21 isEqualToString:@"FavoriteGroup"] & 1) == 0
                && ((v19 & 1) != 0 || (WGIsWidgetWithBundleIdentifierInternal(v28) & 1) == 0))
              {
                if (!v39
                  || ![v40 widgetListEditViewController:self isItemWithIdentifierFavorited:v28]|| (-[NSMutableArray addObject:](self->_favoriteItemIDs, "addObject:", v28), (v38 & 1) == 0))
                {
                  char v29 = [v40 widgetListEditViewController:self isItemWithIdentifierEnabled:v28];
                  double v30 = v22;
                  if ((v29 & 1) == 0) {
                    double v30 = self->_disabledItemIDs;
                  }
                  [(NSMutableArray *)v30 addObject:v28];
                }
              }
            }
            uint64_t v25 = [v23 countByEnumeratingWithState:&v42 objects:v54 count:16];
          }
          while (v25);
        }

        uint64_t v20 = v37 + 1;
      }
      while (v37 + 1 != v35);
      uint64_t v35 = [obj countByEnumeratingWithState:&v46 objects:v55 count:16];
    }
    while (v35);
  }

  CGFloat v31 = self->_disabledItemIDs;
  v41[0] = MEMORY[0x263EF8330];
  v41[1] = 3221225472;
  v41[2] = __44__WGWidgetListEditViewController__loadItems__block_invoke;
  v41[3] = &unk_264676720;
  v41[4] = self;
  [(NSMutableArray *)v31 sortUsingComparator:v41];
  v32 = (NSArray *)[(NSMutableArray *)self->_favoriteItemIDs copy];
  originalFavoriteItemIDs = self->_originalFavoriteItemIDs;
  self->_originalFavoriteItemIDs = v32;
}

uint64_t __44__WGWidgetListEditViewController__loadItems__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _compareItemWithIdentifier:a2 andItemWithIdentifierConsideringIsNew:a3];
}

- (void)_saveItemArrangement
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v4 = self->_groupIDs;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v18;
    id v16 = v4;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v4);
        }
        double v9 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v10 = [(WGWidgetListEditViewController *)self _enabledItemIdentifiersForGroupID:v9];
        if ([(WGWidgetListEditViewController *)self showsFavorites]
          && [(WGWidgetListEditViewController *)self areWidgetsPinned]
          && [v9 isEqualToString:@"TodayGroup"])
        {
          id v11 = [(WGWidgetListEditViewController *)self _enabledItemIdentifiersForGroupID:@"FavoriteGroup"];
          uint64_t v12 = [v11 arrayByAddingObjectsFromArray:v10];
          id v13 = v3;
          uint64_t v14 = [v12 mutableCopy];

          uint64_t v10 = (void *)v14;
          id v3 = v13;
          id v4 = v16;
        }
        if (v10) {
          [v3 setObject:v10 forKey:v9];
        }
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v6);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  [WeakRetained widgetListEditViewController:self didReorderItemsWithIdentifiersInGroups:v3];
}

- (void)_acknowledgeItemsAndResetNewWidgetsCount
{
  v15[1] = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263EFF980] array];
  uint64_t v9 = MEMORY[0x263EF8330];
  uint64_t v10 = 3221225472;
  id v11 = __74__WGWidgetListEditViewController__acknowledgeItemsAndResetNewWidgetsCount__block_invoke;
  uint64_t v12 = &unk_264676748;
  id v13 = v3;
  id v4 = v3;
  uint64_t v5 = (void (**)(void, void))MEMORY[0x223CAA850](&v9);
  ((void (**)(void, NSMutableArray *))v5)[2](v5, self->_enabledTodayItemIDs);
  ((void (**)(void, NSMutableArray *))v5)[2](v5, self->_favoriteItemIDs);
  ((void (**)(void, NSMutableArray *))v5)[2](v5, self->_disabledItemIDs);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_msgSend(WeakRetained, "widgetListEditViewController:acknowledgeInterfaceItemsWithIdentifiers:", self, v4, v9, v10, v11, v12);

  uint64_t v14 = @"WGNewWidgetsCountKey";
  v15[0] = &unk_26D5D4EB8;
  uint64_t v7 = [NSDictionary dictionaryWithObjects:v15 forKeys:&v14 count:1];
  uint64_t v8 = [MEMORY[0x263F08A00] defaultCenter];
  [v8 postNotificationName:@"WGAvailableWidgetsUpdatedNotification" object:self userInfo:v7];
}

void __74__WGWidgetListEditViewController__acknowledgeItemsAndResetNewWidgetsCount__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(a1 + 32) addObject:*(void *)(*((void *)&v8 + 1) + 8 * v7++)];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)_saveItemState
{
  if ([(WGWidgetListEditViewController *)self showsFavorites]
    && [(WGWidgetListEditViewController *)self areWidgetsPinned])
  {
    id v3 = [(NSMutableArray *)self->_favoriteItemIDs arrayByAddingObjectsFromArray:self->_enabledTodayItemIDs];
  }
  else
  {
    id v3 = self->_enabledTodayItemIDs;
  }
  uint64_t v6 = v3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  [WeakRetained widgetListEditViewController:self setEnabled:1 forItemsWithIdentifiers:v6];
  [WeakRetained widgetListEditViewController:self setEnabled:0 forItemsWithIdentifiers:self->_disabledItemIDs];
  if ([(WGWidgetListEditViewController *)self showsFavorites]
    && ([(NSArray *)self->_originalFavoriteItemIDs isEqual:self->_favoriteItemIDs] & 1) == 0)
  {
    [WeakRetained widgetListEditViewController:self updateFavoritesToIdentifiers:self->_favoriteItemIDs];
  }
  if (objc_opt_respondsToSelector())
  {
    BOOL v5 = [(WGWidgetListEditViewController *)self areWidgetsPinned];
    if (v5 != [(WGWidgetListEditViewController *)self wereWidgetsPinnedOriginally]) {
      [WeakRetained widgetListEditViewController:self didChangeWidgetsPinning:v5];
    }
  }
  [(WGWidgetListEditViewController *)self _acknowledgeItemsAndResetNewWidgetsCount];
}

- (id)_groupKeyForSectionAtIndex:(unint64_t)a3
{
  if ([(WGWidgetListEditViewController *)self todaySection] == a3)
  {
    BOOL v5 = @"TodayGroup";
  }
  else if ([(WGWidgetListEditViewController *)self favoritesSection] == a3)
  {
    BOOL v5 = @"FavoriteGroup";
  }
  else
  {
    BOOL v5 = 0;
  }
  return v5;
}

- (unint64_t)_sectionIndexForGroupKey:(id)a3
{
  id v4 = a3;
  if (![v4 length]) {
    goto LABEL_7;
  }
  if (![v4 isEqual:@"TodayGroup"])
  {
    if ([v4 isEqual:@"FavoriteGroup"])
    {
      int64_t v5 = [(WGWidgetListEditViewController *)self favoritesSection];
      goto LABEL_6;
    }
LABEL_7:
    unint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_8;
  }
  int64_t v5 = [(WGWidgetListEditViewController *)self todaySection];
LABEL_6:
  unint64_t v6 = v5;
LABEL_8:

  return v6;
}

- (id)_itemIdentifiersInSection:(unint64_t)a3
{
  if ([(WGWidgetListEditViewController *)self todaySection] == a3)
  {
    int64_t v5 = &OBJC_IVAR___WGWidgetListEditViewController__enabledTodayItemIDs;
LABEL_7:
    id v6 = *(id *)((char *)&self->super.super.super.isa + *v5);
    goto LABEL_8;
  }
  if ([(WGWidgetListEditViewController *)self favoritesSection] == a3)
  {
    int64_t v5 = &OBJC_IVAR___WGWidgetListEditViewController__favoriteItemIDs;
    goto LABEL_7;
  }
  if ([(WGWidgetListEditViewController *)self disabledWidgetsSection] == a3)
  {
    int64_t v5 = &OBJC_IVAR___WGWidgetListEditViewController__disabledItemIDs;
    goto LABEL_7;
  }
  id v6 = 0;
LABEL_8:
  return v6;
}

- (id)_indexPathForItemWithIdentifier:(id)a3
{
  id v4 = a3;
  unint64_t v5 = 0;
  uint64_t v16 = 0;
  long long v17 = &v16;
  uint64_t v18 = 0x3032000000;
  long long v19 = __Block_byref_object_copy_;
  long long v20 = __Block_byref_object_dispose_;
  id v21 = 0;
  do
  {
    id v6 = [(UITableViewController *)self->_tableViewController tableView];
    unint64_t v7 = [(WGWidgetListEditViewController *)self numberOfSectionsInTableView:v6];

    if (v5 >= v7) {
      break;
    }
    long long v8 = [(WGWidgetListEditViewController *)self _itemIdentifiersInSection:v5];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __66__WGWidgetListEditViewController__indexPathForItemWithIdentifier___block_invoke;
    v12[3] = &unk_264676770;
    id v13 = v4;
    uint64_t v14 = &v16;
    unint64_t v15 = v5;
    [v8 enumerateObjectsUsingBlock:v12];

    uint64_t v9 = v17[5];
    ++v5;
  }
  while (!v9);
  id v10 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  return v10;
}

void __66__WGWidgetListEditViewController__indexPathForItemWithIdentifier___block_invoke(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  if ([a2 isEqual:a1[4]])
  {
    uint64_t v7 = [MEMORY[0x263F088C8] indexPathForRow:a3 inSection:a1[6]];
    uint64_t v8 = *(void *)(a1[5] + 8);
    uint64_t v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    *a4 = 1;
  }
}

- (void)_enableItemAtIndexPath:(id)a3 inTableView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(WGWidgetListEditViewController *)self _itemIdentifierForIndexPath:v6];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  id v10 = [WeakRetained widgetListEditViewController:self defaultGroupForItemWithIdentifier:v8];

  int64_t v11 = [(WGWidgetListEditViewController *)self _sectionIndexForGroupKey:v10];
  if (v11 == 0x7FFFFFFFFFFFFFFFLL) {
    int64_t v11 = [(WGWidgetListEditViewController *)self todaySection];
  }
  int64_t v12 = [(WGWidgetListEditViewController *)self _indexOfLastEnabledWidgetInSection:v11]+ 1;
  [(NSMutableArray *)self->_disabledItemIDs removeObject:v8];
  id v13 = [(WGWidgetListEditViewController *)self _itemIdentifiersInSection:v11];
  [v13 insertObject:v8 atIndex:v12];

  uint64_t v14 = [MEMORY[0x263F088C8] indexPathForRow:v12 inSection:v11];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __69__WGWidgetListEditViewController__enableItemAtIndexPath_inTableView___block_invoke;
  v18[3] = &unk_264676798;
  id v19 = v7;
  id v20 = v6;
  id v21 = v14;
  id v15 = v14;
  id v16 = v6;
  id v17 = v7;
  [v17 performBatchUpdates:v18 completion:0];
}

void __69__WGWidgetListEditViewController__enableItemAtIndexPath_inTableView___block_invoke(void *a1)
{
  v7[1] = *MEMORY[0x263EF8340];
  v2 = (void *)a1[4];
  v7[0] = a1[5];
  id v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
  [v2 deleteRowsAtIndexPaths:v3 withRowAnimation:100];

  id v4 = (void *)a1[4];
  uint64_t v6 = a1[6];
  unint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v6 count:1];
  [v4 insertRowsAtIndexPaths:v5 withRowAnimation:100];
}

- (void)_disableItemAtIndexPath:(id)a3 inTableView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(WGWidgetListEditViewController *)self _itemIdentifierForIndexPath:v6];
  unint64_t v9 = [(WGWidgetListEditViewController *)self _indexForInsertingItemWithIdentifier:v8 intoArray:self->_disabledItemIDs];
  [(NSMutableArray *)self->_enabledTodayItemIDs removeObject:v8];
  [(NSMutableArray *)self->_favoriteItemIDs removeObject:v8];
  [(NSMutableArray *)self->_disabledItemIDs insertObject:v8 atIndex:v9];
  id v10 = objc_msgSend(MEMORY[0x263F088C8], "indexPathForRow:inSection:", v9, -[WGWidgetListEditViewController disabledWidgetsSection](self, "disabledWidgetsSection"));
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __70__WGWidgetListEditViewController__disableItemAtIndexPath_inTableView___block_invoke;
  v14[3] = &unk_2646767C0;
  id v15 = v6;
  id v16 = self;
  id v17 = v7;
  id v18 = v10;
  id v11 = v10;
  id v12 = v7;
  id v13 = v6;
  [v12 performBatchUpdates:v14 completion:0];
}

void __70__WGWidgetListEditViewController__disableItemAtIndexPath_inTableView___block_invoke(uint64_t a1)
{
  v10[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) section];
  if (v2 == [*(id *)(a1 + 40) favoritesSection]
    && ![*(id *)(*(void *)(a1 + 40) + 1000) count])
  {
    id v7 = *(void **)(a1 + 48);
    v10[0] = *(void *)(a1 + 32);
    id v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];
    [v7 reloadRowsAtIndexPaths:v4 withRowAnimation:100];
  }
  else
  {
    id v3 = *(void **)(a1 + 48);
    uint64_t v9 = *(void *)(a1 + 32);
    id v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v9 count:1];
    [v3 deleteRowsAtIndexPaths:v4 withRowAnimation:100];
  }

  unint64_t v5 = *(void **)(a1 + 48);
  uint64_t v8 = *(void *)(a1 + 56);
  id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v8 count:1];
  [v5 insertRowsAtIndexPaths:v6 withRowAnimation:100];
}

- (id)_itemIdentifierForIndexPath:(id)a3
{
  id v4 = a3;
  unint64_t v5 = -[WGWidgetListEditViewController _itemIdentifiersInSection:](self, "_itemIdentifiersInSection:", [v4 section]);
  unint64_t v6 = [v4 row];
  if (v6 >= [v5 count])
  {
    id v7 = 0;
  }
  else
  {
    id v7 = objc_msgSend(v5, "objectAtIndexedSubscript:", objc_msgSend(v4, "row"));
  }

  return v7;
}

- (unint64_t)_indexForInsertingItemWithIdentifier:(id)a3 intoArray:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [v6 count];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __81__WGWidgetListEditViewController__indexForInsertingItemWithIdentifier_intoArray___block_invoke;
  v11[3] = &unk_2646767E8;
  void v11[4] = self;
  unint64_t v9 = objc_msgSend(v6, "indexOfObject:inSortedRange:options:usingComparator:", v7, 0, v8, 1024, v11);

  return v9;
}

uint64_t __81__WGWidgetListEditViewController__indexForInsertingItemWithIdentifier_intoArray___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _compareItemWithIdentifier:a2 andItemWithIdentifierConsideringIsNew:a3];
}

- (int64_t)_indexOfFirstEnabledWidgetInSection:(unint64_t)a3
{
  return 0;
}

- (int64_t)_indexOfLastEnabledWidgetInSection:(unint64_t)a3
{
  id v3 = [(WGWidgetListEditViewController *)self _itemIdentifiersInSection:a3];
  int64_t v4 = [v3 count] - 1;

  return v4;
}

- (BOOL)_isNewItem:(id)a3
{
  id v3 = self;
  p_dataSource = &self->_dataSource;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
  LOBYTE(v3) = [WeakRetained widgetListEditViewController:v3 isItemWithIdentifierNew:v5];

  return (char)v3;
}

- (int64_t)_compareItemWithIdentifier:(id)a3 andItemWithIdentifierConsideringIsNew:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(WGWidgetListEditViewController *)self _isNewItem:v6];
  if (v8 == [(WGWidgetListEditViewController *)self _isNewItem:v7])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    if (objc_opt_respondsToSelector())
    {
      id v11 = [WeakRetained widgetListEditViewController:self displayNameForItemWithIdentifier:v6];
      id v12 = [WeakRetained widgetListEditViewController:self displayNameForItemWithIdentifier:v7];
    }
    else
    {
      id v11 = v6;
      id v12 = v7;
    }
    id v13 = v12;
    int64_t v9 = [v11 localizedStandardCompare:v12];
  }
  else if ([(WGWidgetListEditViewController *)self _isNewItem:v6])
  {
    int64_t v9 = -1;
  }
  else
  {
    int64_t v9 = 1;
  }

  return v9;
}

- (id)_widgetListEditViewTableHeaderView
{
  uint64_t v2 = [(UITableViewController *)self->_tableViewController tableView];
  id v3 = [v2 tableHeaderView];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int64_t v4 = v3;
  }
  else {
    int64_t v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (void)pinSwitchChanaged:(id)a3
{
  uint64_t v4 = [a3 isOn];
  [(WGWidgetListEditViewController *)self setWidgetsPinned:v4];
}

- (void)setWidgetsPinned:(BOOL)a3
{
  if (self->_widgetsPinned != a3)
  {
    BOOL v3 = a3;
    int64_t v5 = [(WGWidgetListEditViewController *)self todaySection];
    self->_widgetsPinned = v3;
    int64_t v6 = [(WGWidgetListEditViewController *)self todaySection];
    if (v3) {
      int64_t v7 = v5;
    }
    else {
      int64_t v7 = v6;
    }
    id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v9 = [(NSMutableArray *)self->_favoriteItemIDs count];
    if (v9)
    {
      uint64_t v10 = v9;
      for (uint64_t i = 0; i != v10; ++i)
      {
        id v12 = [MEMORY[0x263F088C8] indexPathForRow:i inSection:v7];
        [v8 addObject:v12];
      }
    }
    enabledTodayItemIDs = self->_enabledTodayItemIDs;
    if (v3) {
      [(NSMutableArray *)enabledTodayItemIDs removeObjectsInArray:self->_favoriteItemIDs];
    }
    else {
      -[NSMutableArray replaceObjectsInRange:withObjectsFromArray:](enabledTodayItemIDs, "replaceObjectsInRange:withObjectsFromArray:", 0, 0, self->_favoriteItemIDs);
    }
    uint64_t v14 = [(UITableViewController *)self->_tableViewController tableView];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __51__WGWidgetListEditViewController_setWidgetsPinned___block_invoke;
    v17[3] = &unk_264676810;
    BOOL v20 = v3;
    id v18 = v14;
    id v19 = v8;
    id v15 = v8;
    id v16 = v14;
    [v16 performBatchUpdates:v17 completion:0];
  }
}

uint64_t __51__WGWidgetListEditViewController_setWidgetsPinned___block_invoke(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 48);
  BOOL v3 = *(void **)(a1 + 32);
  uint64_t v4 = [MEMORY[0x263F088D0] indexSetWithIndex:1];
  if (v2)
  {
    [v3 insertSections:v4 withRowAnimation:0];

    int64_t v5 = *(void **)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    return [v5 deleteRowsAtIndexPaths:v6 withRowAnimation:0];
  }
  else
  {
    [v3 deleteSections:v4 withRowAnimation:0];

    id v8 = *(void **)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 40);
    return [v8 insertRowsAtIndexPaths:v9 withRowAnimation:0];
  }
}

- (WGWidgetListEditViewControllerDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (WGWidgetListEditViewControllerDataSource *)WeakRetained;
}

- (WGWidgetListEditViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WGWidgetListEditViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)_isDismissingDueToInterfaceAction
{
  return self->_dismissingDueToInterfaceAction;
}

- (void)_setDismissingDueToInterfaceAction:(BOOL)a3
{
  self->_dismissingDueToInterfaceAction = a3;
}

- (id)_statusBarColorAssertion
{
  return self->_statusBarColorAssertion;
}

- (void)_setStatusBarColorAssertion:(id)a3
{
}

- (BOOL)showsPinSection
{
  return self->_showsPinSection;
}

- (void)setShowsPinSection:(BOOL)a3
{
  self->_showsPinSection = a3;
}

- (BOOL)showsFavorites
{
  return self->_showsFavorites;
}

- (void)setShowsFavorites:(BOOL)a3
{
  self->_showsFavorites = a3;
}

- (BOOL)wereWidgetsPinnedOriginally
{
  return self->_widgetsPinnedOriginally;
}

- (void)setWidgetsPinnedOriginally:(BOOL)a3
{
  self->_widgetsPinnedOriginally = a3;
}

- (BOOL)areWidgetsPinned
{
  return self->_widgetsPinned;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_statusBarColorAssertion, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_originalFavoriteItemIDs, 0);
  objc_storeStrong((id *)&self->_groupIDs, 0);
  objc_storeStrong((id *)&self->_disabledItemIDs, 0);
  objc_storeStrong((id *)&self->_favoriteItemIDs, 0);
  objc_storeStrong((id *)&self->_enabledTodayItemIDs, 0);
  objc_storeStrong((id *)&self->_tableViewController, 0);
  objc_storeStrong((id *)&self->_navigationController, 0);
}

@end