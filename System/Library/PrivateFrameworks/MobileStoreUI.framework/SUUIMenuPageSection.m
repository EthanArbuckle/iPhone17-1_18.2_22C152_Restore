@interface SUUIMenuPageSection
- (CGSize)cellSizeForIndexPath:(id)a3;
- (SUUIMenuPageSection)initWithPageComponent:(id)a3;
- (UIEdgeInsets)sectionContentInset;
- (id)_contentChildView;
- (id)_newMenuViewController;
- (id)_pillsControl;
- (id)_popupHeaderView;
- (id)backgroundColorForIndexPath:(id)a3;
- (id)cellForIndexPath:(id)a3;
- (int64_t)numberOfCells;
- (void)_cancelMenuAction:(id)a3;
- (void)_dismissMenuViewController;
- (void)_loadSortDataIfNecessaryForMenuIndex:(int64_t)a3 reason:(int64_t)a4;
- (void)_pillAction:(id)a3;
- (void)_restorePreviousSelection;
- (void)_setSelectedIndex:(int64_t)a3;
- (void)_showMenuViewController;
- (void)_showMoreList;
- (void)_showPopoverController;
- (void)dealloc;
- (void)menuViewController:(id)a3 didSelectItemAtIndex:(int64_t)a4;
- (void)popoverControllerDidDismissPopover:(id)a3;
- (void)popupMenuHeader:(id)a3 didSelectMenuItemAtIndex:(int64_t)a4;
- (void)sortDataRequest:(id)a3 didFinishWithLockups:(id)a4;
- (void)willAppearInContext:(id)a3;
@end

@implementation SUUIMenuPageSection

- (SUUIMenuPageSection)initWithPageComponent:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SUUIMenuPageSection;
  v5 = [(SUUIStorePageSection *)&v7 initWithPageComponent:v4];
  if (v5) {
    v5->_selectedIndex = [v4 defaultSelectedIndex];
  }

  return v5;
}

- (void)dealloc
{
  [(SUUIMenuViewController *)self->_moreListMenuViewController setDelegate:0];
  [(UIPopoverController *)self->_moreListPopoverController setDelegate:0];
  [(SUUIPopupMenuHeaderView *)self->_popupHeaderView setDelegate:0];
  [(UIBarButtonItem *)self->_cancelMenuItem setTarget:0];
  [(SUUIPillsControl *)self->_pillsControl removeTarget:self action:0 forControlEvents:0xFFFFFFFFLL];
  v3.receiver = self;
  v3.super_class = (Class)SUUIMenuPageSection;
  [(SUUIStorePageSection *)&v3 dealloc];
}

- (id)backgroundColorForIndexPath:(id)a3
{
  id v4 = a3;
  v5 = [(SUUIStorePageSection *)self pageComponent];
  v6 = [v5 viewElement];

  objc_super v7 = [v6 style];
  v8 = [v7 ikBackgroundColor];
  v9 = [v8 color];

  if (v9)
  {
    id v10 = v9;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)SUUIMenuPageSection;
    id v10 = [(SUUIStorePageSection *)&v13 backgroundColorForIndexPath:v4];
  }
  v11 = v10;

  return v11;
}

- (id)cellForIndexPath:(id)a3
{
  id v4 = a3;
  v5 = [(SUUIStorePageSection *)self context];
  v6 = [v5 collectionView];
  objc_super v7 = [v6 dequeueReusableCellWithReuseIdentifier:@"SUUIMenuPageSectionReuseIdentifier" forIndexPath:v4];

  objc_msgSend(v7, "setContentInsets:", *MEMORY[0x263F834E8], *(double *)(MEMORY[0x263F834E8] + 8), *(double *)(MEMORY[0x263F834E8] + 16), *(double *)(MEMORY[0x263F834E8] + 24));
  v8 = [(SUUIMenuPageSection *)self _contentChildView];
  [v7 setContentChildView:v8];

  return v7;
}

- (CGSize)cellSizeForIndexPath:(id)a3
{
  id v4 = [(SUUIMenuPageSection *)self _contentChildView];
  [v4 bounds];
  double v6 = v5;

  objc_super v7 = [(SUUIStorePageSection *)self context];
  [v7 activePageWidth];
  double v9 = v8;

  double v10 = v9;
  double v11 = v6;
  result.height = v11;
  result.width = v10;
  return result;
}

- (int64_t)numberOfCells
{
  return 1;
}

- (UIEdgeInsets)sectionContentInset
{
  BOOL v2 = [(SUUIStorePageSection *)self isTopSection];
  double v3 = 15.0;
  if (v2) {
    double v3 = 7.0;
  }
  double v4 = 0.0;
  double v5 = 8.0;
  double v6 = 0.0;
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (void)willAppearInContext:(id)a3
{
  id v4 = a3;
  double v5 = [v4 collectionView];
  [v5 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"SUUIMenuPageSectionReuseIdentifier"];
  v6.receiver = self;
  v6.super_class = (Class)SUUIMenuPageSection;
  [(SUUIStorePageSection *)&v6 willAppearInContext:v4];
}

- (void)menuViewController:(id)a3 didSelectItemAtIndex:(int64_t)a4
{
  [a3 setIndexOfCheckedTitle:a4];
  objc_super v6 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v7 = [v6 userInterfaceIdiom];

  uint64_t v8 = 2;
  if ((v7 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    uint64_t v8 = 4;
  }
  [(SUUIMenuPageSection *)self _setSelectedIndex:v8 + a4];
  [(SUUIMenuPageSection *)self _dismissMenuViewController];
}

- (void)popupMenuHeader:(id)a3 didSelectMenuItemAtIndex:(int64_t)a4
{
}

- (void)sortDataRequest:(id)a3 didFinishWithLockups:(id)a4
{
  v18[1] = *MEMORY[0x263EF8340];
  id v6 = a4;
  uint64_t v7 = [a3 sortURL];
  uint64_t v8 = [(SUUIStorePageSection *)self pageComponent];
  uint64_t v9 = [v8 numberOfItems];
  if (v9 >= 1)
  {
    uint64_t v10 = v9;
    uint64_t v11 = 0;
    while (1)
    {
      v12 = [v8 sortURLForIndex:v11];
      char v13 = [v7 isEqual:v12];

      if (v13) {
        break;
      }
      if (v10 == ++v11) {
        goto LABEL_8;
      }
    }
    if (v11 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v14 = [[SUUIGridComponent alloc] initWithLockups:v6];
      v18[0] = v14;
      v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:1];
      [v8 _setChildComponents:v15 forIndex:v11];

      [(NSMutableIndexSet *)self->_sortRequestIndexSet removeIndex:v11];
      v16 = [(SUUIStorePageSection *)self context];
      v17 = [v16 parentViewController];
      [v17 _updateSectionsForIndex:v11 menuSection:self];
    }
  }
LABEL_8:
}

- (void)popoverControllerDidDismissPopover:(id)a3
{
  [(SUUIMenuPageSection *)self _restorePreviousSelection];
  [(SUUIMenuViewController *)self->_moreListMenuViewController setDelegate:0];
  moreListMenuViewController = self->_moreListMenuViewController;
  self->_moreListMenuViewController = 0;

  [(UIPopoverController *)self->_moreListPopoverController setDelegate:0];
  moreListPopoverController = self->_moreListPopoverController;
  self->_moreListPopoverController = 0;
}

- (void)_cancelMenuAction:(id)a3
{
  [(SUUIMenuPageSection *)self _restorePreviousSelection];
  [(SUUIMenuPageSection *)self _dismissMenuViewController];
}

- (void)_pillAction:(id)a3
{
  id v4 = [(SUUIStorePageSection *)self pageComponent];
  uint64_t v5 = [v4 numberOfItems];

  int64_t v6 = [(SUUIPillsControl *)self->_pillsControl selectedIndex];
  uint64_t v7 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v8 = [v7 userInterfaceIdiom];

  uint64_t v9 = 3;
  if ((v8 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    uint64_t v9 = 5;
  }
  if (v5 <= v9) {
    goto LABEL_10;
  }
  uint64_t v10 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v11 = [v10 userInterfaceIdiom];

  uint64_t v12 = 2;
  if ((v11 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    uint64_t v12 = 4;
  }
  if (v6 == v12)
  {
    [(SUUIMenuPageSection *)self _showMoreList];
  }
  else
  {
LABEL_10:
    [(SUUIMenuPageSection *)self _setSelectedIndex:v6];
  }
}

- (id)_contentChildView
{
  double v3 = [(SUUIStorePageSection *)self pageComponent];
  uint64_t v4 = [v3 menuStyle];

  if (v4
    && ([MEMORY[0x263F82670] currentDevice],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v5 userInterfaceIdiom],
        v5,
        v6))
  {
    uint64_t v7 = [(SUUIMenuPageSection *)self _popupHeaderView];
  }
  else
  {
    uint64_t v7 = [(SUUIMenuPageSection *)self _pillsControl];
  }
  return v7;
}

- (void)_dismissMenuViewController
{
  uint64_t v10 = self->_moreListMenuViewController;
  cancelMenuItem = self->_cancelMenuItem;
  uint64_t v4 = self->_moreListPopoverController;
  [(UIBarButtonItem *)cancelMenuItem setTarget:0];
  uint64_t v5 = self->_cancelMenuItem;
  self->_cancelMenuItem = 0;

  [(SUUIMenuViewController *)self->_moreListMenuViewController setDelegate:0];
  moreListMenuViewController = self->_moreListMenuViewController;
  self->_moreListMenuViewController = 0;

  [(UIPopoverController *)self->_moreListPopoverController setDelegate:0];
  moreListPopoverController = self->_moreListPopoverController;
  self->_moreListPopoverController = 0;

  if (v4) {
    [(UIPopoverController *)v4 dismissPopoverAnimated:1];
  }
  else {
    [(SUUIMenuViewController *)v10 dismissViewControllerAnimated:1 completion:0];
  }

  uint64_t v8 = [(SUUIStorePageSection *)self context];
  uint64_t v9 = [v8 parentViewController];
  [v9 _endIgnoringSectionChanges];
}

- (void)_loadSortDataIfNecessaryForMenuIndex:(int64_t)a3 reason:(int64_t)a4
{
  if ((-[NSMutableIndexSet containsIndex:](self->_sortRequestIndexSet, "containsIndex:") & 1) == 0)
  {
    id v16 = [(SUUIStorePageSection *)self pageComponent];
    uint64_t v7 = [v16 childComponentsForIndex:a3];

    uint64_t v8 = v16;
    if (!v7)
    {
      uint64_t v9 = [v16 sortURLForIndex:a3];
      if (v9)
      {
        uint64_t v10 = [[SUUISortDataRequest alloc] initWithSortURL:v9];
        [(SUUISortDataRequest *)v10 setDelegate:self];
        sortRequestIndexSet = self->_sortRequestIndexSet;
        if (!sortRequestIndexSet)
        {
          uint64_t v12 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x263F089C8]);
          char v13 = self->_sortRequestIndexSet;
          self->_sortRequestIndexSet = v12;

          sortRequestIndexSet = self->_sortRequestIndexSet;
        }
        [(NSMutableIndexSet *)sortRequestIndexSet addIndex:a3];
        v14 = [(SUUIStorePageSection *)self context];
        v15 = [v14 resourceLoader];
        [v15 loadResourceWithRequest:v10 reason:a4];
      }
      uint64_t v8 = v16;
    }
  }
}

- (id)_newMenuViewController
{
  double v3 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    uint64_t v5 = 4;
  }
  else {
    uint64_t v5 = 2;
  }
  uint64_t v6 = [(SUUIPillsControl *)self->_pillsControl titles];
  uint64_t v7 = objc_msgSend(v6, "subarrayWithRange:", v5, objc_msgSend(v6, "count") - v5);

  uint64_t v8 = [[SUUIMenuViewController alloc] initWithMenuTitles:v7];
  [(SUUIMenuViewController *)v8 setDelegate:self];
  int64_t selectedIndex = self->_selectedIndex;
  if (selectedIndex >= v5) {
    [(SUUIMenuViewController *)v8 setIndexOfCheckedTitle:selectedIndex - v5];
  }

  return v8;
}

- (id)_pillsControl
{
  pillsControl = self->_pillsControl;
  if (!pillsControl)
  {
    uint64_t v4 = objc_alloc_init(SUUIPillsControl);
    uint64_t v5 = self->_pillsControl;
    self->_pillsControl = v4;

    [(SUUIPillsControl *)self->_pillsControl addTarget:self action:sel__pillAction_ forControlEvents:4096];
    uint64_t v6 = self->_pillsControl;
    uint64_t v7 = [(SUUIStorePageSection *)self context];
    uint64_t v8 = [v7 colorScheme];
    [(SUUIPillsControl *)v6 setColorScheme:v8];

    uint64_t v9 = self->_pillsControl;
    uint64_t v10 = [MEMORY[0x263F82670] currentDevice];
    uint64_t v11 = [v10 userInterfaceIdiom];

    if ((v11 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
      uint64_t v12 = 5;
    }
    else {
      uint64_t v12 = 3;
    }
    [(SUUIPillsControl *)v9 setMaximumNumberOfVisiblePills:v12];
    char v13 = [(SUUIStorePageSection *)self pageComponent];
    v14 = self->_pillsControl;
    v15 = [v13 allTitles];
    [(SUUIPillsControl *)v14 setTitles:v15];

    id v16 = [v13 viewElement];
    v17 = [v16 style];
    v18 = SUUIViewElementPlainColorWithStyle(v17, 0);

    [(SUUIPillsControl *)self->_pillsControl setTintColor:v18];
    v19 = [(SUUIStorePageSection *)self context];
    v20 = [v19 parentViewController];
    v21 = [v20 clientContext];

    v22 = [v13 titleForMoreItem];
    v23 = self->_pillsControl;
    if (v22)
    {
      [(SUUIPillsControl *)self->_pillsControl setMoreListTitle:v22];
    }
    else
    {
      if (v21) {
        [v21 localizedStringForKey:@"TABS_MORE_LIST_TITLE"];
      }
      else {
      v24 = +[SUUIClientContext localizedStringForKey:@"TABS_MORE_LIST_TITLE" inBundles:0];
      }
      [(SUUIPillsControl *)v23 setMoreListTitle:v24];
    }
    -[SUUIPillsControl setContentInset:](self->_pillsControl, "setContentInset:", 0.0, 15.0, 0.0, 15.0);
    [(SUUIPillsControl *)self->_pillsControl reloadPills];
    v25 = self->_pillsControl;
    int64_t selectedIndex = self->_selectedIndex;
    v27 = [MEMORY[0x263F82670] currentDevice];
    uint64_t v28 = [v27 userInterfaceIdiom];

    uint64_t v29 = 2;
    if ((v28 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
      uint64_t v29 = 4;
    }
    if (selectedIndex >= v29) {
      uint64_t v30 = v29;
    }
    else {
      uint64_t v30 = selectedIndex;
    }
    [(SUUIPillsControl *)v25 setSelectedIndex:v30];
    [(SUUIPillsControl *)self->_pillsControl sizeToFit];

    pillsControl = self->_pillsControl;
  }
  return pillsControl;
}

- (id)_popupHeaderView
{
  popupHeaderView = self->_popupHeaderView;
  if (!popupHeaderView)
  {
    uint64_t v4 = objc_alloc_init(SUUIPopupMenuHeaderView);
    uint64_t v5 = self->_popupHeaderView;
    self->_popupHeaderView = v4;

    [(SUUIPopupMenuHeaderView *)self->_popupHeaderView setDelegate:self];
    uint64_t v6 = [(SUUIStorePageSection *)self pageComponent];
    uint64_t v7 = [v6 menuTitle];
    if (v7) {
      [(SUUIPopupMenuHeaderView *)self->_popupHeaderView setTitle:v7];
    }
    uint64_t v8 = [(SUUIStorePageSection *)self context];
    uint64_t v9 = [v8 parentViewController];
    uint64_t v10 = [v9 clientContext];

    uint64_t v11 = self->_popupHeaderView;
    if (v10) {
      [v10 localizedStringForKey:@"POPUP_SORT_BY"];
    }
    else {
    uint64_t v12 = +[SUUIClientContext localizedStringForKey:@"POPUP_SORT_BY" inBundles:0];
    }
    [(SUUIPopupMenuHeaderView *)v11 setMenuLabelTitle:v12];

    char v13 = self->_popupHeaderView;
    v14 = [v6 allTitles];
    [(SUUIPopupMenuHeaderView *)v13 setMenuItemTitles:v14];

    v15 = self->_popupHeaderView;
    id v16 = [(SUUIStorePageSection *)self context];
    v17 = [v16 colorScheme];
    [(SUUIPopupMenuHeaderView *)v15 setColoringWithColorScheme:v17];

    [(SUUIPopupMenuHeaderView *)self->_popupHeaderView setSelectedMenuItemIndex:self->_selectedIndex];
    [(SUUIPopupMenuHeaderView *)self->_popupHeaderView sizeToFit];

    popupHeaderView = self->_popupHeaderView;
  }
  return popupHeaderView;
}

- (void)_restorePreviousSelection
{
  int64_t selectedIndex = self->_selectedIndex;
  uint64_t v4 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v5 = [v4 userInterfaceIdiom];

  uint64_t v6 = 2;
  if ((v5 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    uint64_t v6 = 4;
  }
  if (selectedIndex >= v6) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = selectedIndex;
  }
  [(SUUIPillsControl *)self->_pillsControl reloadPills];
  pillsControl = self->_pillsControl;
  [(SUUIPillsControl *)pillsControl setSelectedIndex:v7];
}

- (void)_setSelectedIndex:(int64_t)a3
{
  if (self->_selectedIndex != a3)
  {
    self->_int64_t selectedIndex = a3;
    uint64_t v4 = [(SUUIStorePageSection *)self pageComponent];
    id v8 = [v4 viewElement];

    int64_t selectedIndex = self->_selectedIndex;
    if (v8)
    {
      [v8 dispatchEventOfType:2 forItemAtIndex:selectedIndex];
    }
    else
    {
      [(SUUIMenuPageSection *)self _loadSortDataIfNecessaryForMenuIndex:selectedIndex reason:1];
      uint64_t v6 = [(SUUIStorePageSection *)self context];
      uint64_t v7 = [v6 parentViewController];
      [v7 _setSelectedIndex:self->_selectedIndex forMenuSection:self];
    }
  }
}

- (void)_showMenuViewController
{
  if (!self->_moreListMenuViewController)
  {
    id v16 = [(SUUIStorePageSection *)self context];
    double v3 = [v16 parentViewController];
    uint64_t v4 = [(SUUIMenuPageSection *)self _newMenuViewController];
    moreListMenuViewController = self->_moreListMenuViewController;
    self->_moreListMenuViewController = v4;

    uint64_t v6 = self->_moreListMenuViewController;
    uint64_t v7 = [(SUUIPillsControl *)self->_pillsControl moreListTitle];
    [(SUUIMenuViewController *)v6 setTitle:v7];

    id v8 = (UIBarButtonItem *)objc_alloc_init(MEMORY[0x263F824A8]);
    cancelMenuItem = self->_cancelMenuItem;
    self->_cancelMenuItem = v8;

    [(UIBarButtonItem *)self->_cancelMenuItem setAction:sel__cancelMenuAction_];
    [(UIBarButtonItem *)self->_cancelMenuItem setStyle:2];
    [(UIBarButtonItem *)self->_cancelMenuItem setTarget:self];
    uint64_t v10 = self->_cancelMenuItem;
    uint64_t v11 = [v16 clientContext];
    uint64_t v12 = v11;
    if (v11) {
      [v11 localizedStringForKey:@"CANCEL"];
    }
    else {
    char v13 = +[SUUIClientContext localizedStringForKey:@"CANCEL" inBundles:0];
    }
    [(UIBarButtonItem *)v10 setTitle:v13];

    v14 = [(SUUIMenuViewController *)self->_moreListMenuViewController navigationItem];
    [v14 setLeftBarButtonItem:self->_cancelMenuItem];

    v15 = (void *)[objc_alloc(MEMORY[0x263F829B8]) initWithRootViewController:self->_moreListMenuViewController];
    [v3 presentViewController:v15 animated:1 completion:0];
    [v3 _beginIgnoringSectionChanges];
  }
}

- (void)_showMoreList
{
  double v3 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if (v4)
  {
    [(SUUIMenuPageSection *)self _showPopoverController];
  }
  else
  {
    [(SUUIMenuPageSection *)self _showMenuViewController];
  }
}

- (void)_showPopoverController
{
  if (!self->_moreListPopoverController)
  {
    double v3 = [(SUUIMenuPageSection *)self _newMenuViewController];
    moreListMenuViewController = self->_moreListMenuViewController;
    self->_moreListMenuViewController = v3;

    [(SUUIMenuViewController *)self->_moreListMenuViewController setDelegate:self];
    uint64_t v5 = [(SUUIMenuViewController *)self->_moreListMenuViewController menuTitles];
    double v6 = (float)((float)(unint64_t)[v5 count] * 45.0);

    -[SUUIMenuViewController setPreferredContentSize:](self->_moreListMenuViewController, "setPreferredContentSize:", 320.0, v6);
    uint64_t v7 = (UIPopoverController *)[objc_alloc(MEMORY[0x263F82AA0]) initWithContentViewController:self->_moreListMenuViewController];
    moreListPopoverController = self->_moreListPopoverController;
    self->_moreListPopoverController = v7;

    [(UIPopoverController *)self->_moreListPopoverController setDelegate:self];
    -[UIPopoverController setPopoverContentSize:](self->_moreListPopoverController, "setPopoverContentSize:", 320.0, v6);
    uint64_t v9 = self->_moreListPopoverController;
    [(SUUIPillsControl *)self->_pillsControl selectedPillFrame];
    -[UIPopoverController presentPopoverFromRect:inView:permittedArrowDirections:animated:](v9, "presentPopoverFromRect:inView:permittedArrowDirections:animated:", self->_pillsControl, 1, 1);
    id v11 = [(SUUIStorePageSection *)self context];
    uint64_t v10 = [v11 parentViewController];
    [v10 _beginIgnoringSectionChanges];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortRequestIndexSet, 0);
  objc_storeStrong((id *)&self->_popupHeaderView, 0);
  objc_storeStrong((id *)&self->_moreListPopoverController, 0);
  objc_storeStrong((id *)&self->_moreListMenuViewController, 0);
  objc_storeStrong((id *)&self->_pillsControl, 0);
  objc_storeStrong((id *)&self->_cancelMenuItem, 0);
}

@end