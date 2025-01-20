@interface SKUIMenuPageSection
- (CGSize)cellSizeForIndexPath:(id)a3;
- (SKUIMenuPageSection)initWithPageComponent:(id)a3;
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

@implementation SKUIMenuPageSection

- (SKUIMenuPageSection)initWithPageComponent:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIMenuPageSection initWithPageComponent:]();
  }
  v7.receiver = self;
  v7.super_class = (Class)SKUIMenuPageSection;
  v5 = [(SKUIStorePageSection *)&v7 initWithPageComponent:v4];
  if (v5) {
    v5->_selectedIndex = [v4 defaultSelectedIndex];
  }

  return v5;
}

- (void)dealloc
{
  [(SKUIMenuViewController *)self->_moreListMenuViewController setDelegate:0];
  [(UIPopoverController *)self->_moreListPopoverController setDelegate:0];
  [(SKUIPopupMenuHeaderView *)self->_popupHeaderView setDelegate:0];
  [(UIBarButtonItem *)self->_cancelMenuItem setTarget:0];
  [(SKUIPillsControl *)self->_pillsControl removeTarget:self action:0 forControlEvents:0xFFFFFFFFLL];
  v3.receiver = self;
  v3.super_class = (Class)SKUIMenuPageSection;
  [(SKUIStorePageSection *)&v3 dealloc];
}

- (id)backgroundColorForIndexPath:(id)a3
{
  id v4 = a3;
  v5 = [(SKUIStorePageSection *)self pageComponent];
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
    v13.super_class = (Class)SKUIMenuPageSection;
    id v10 = [(SKUIStorePageSection *)&v13 backgroundColorForIndexPath:v4];
  }
  v11 = v10;

  return v11;
}

- (id)cellForIndexPath:(id)a3
{
  id v4 = a3;
  v5 = [(SKUIStorePageSection *)self context];
  v6 = [v5 collectionView];
  objc_super v7 = [v6 dequeueReusableCellWithReuseIdentifier:@"SKUIMenuPageSectionReuseIdentifier" forIndexPath:v4];

  objc_msgSend(v7, "setContentInsets:", *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
  v8 = [(SKUIMenuPageSection *)self _contentChildView];
  [v7 setContentChildView:v8];

  return v7;
}

- (CGSize)cellSizeForIndexPath:(id)a3
{
  id v4 = [(SKUIMenuPageSection *)self _contentChildView];
  [v4 bounds];
  double v6 = v5;

  objc_super v7 = [(SKUIStorePageSection *)self context];
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
  BOOL v2 = [(SKUIStorePageSection *)self isTopSection];
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
  [v5 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"SKUIMenuPageSectionReuseIdentifier"];
  v6.receiver = self;
  v6.super_class = (Class)SKUIMenuPageSection;
  [(SKUIStorePageSection *)&v6 willAppearInContext:v4];
}

- (void)menuViewController:(id)a3 didSelectItemAtIndex:(int64_t)a4
{
  [a3 setIndexOfCheckedTitle:a4];
  objc_super v6 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v7 = [v6 userInterfaceIdiom];

  uint64_t v8 = 2;
  if ((v7 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    uint64_t v8 = 4;
  }
  [(SKUIMenuPageSection *)self _setSelectedIndex:v8 + a4];

  [(SKUIMenuPageSection *)self _dismissMenuViewController];
}

- (void)popupMenuHeader:(id)a3 didSelectMenuItemAtIndex:(int64_t)a4
{
}

- (void)sortDataRequest:(id)a3 didFinishWithLockups:(id)a4
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = [a3 sortURL];
  uint64_t v8 = [(SKUIStorePageSection *)self pageComponent];
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
      v14 = [[SKUIGridComponent alloc] initWithLockups:v6];
      v18[0] = v14;
      v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
      [v8 _setChildComponents:v15 forIndex:v11];

      [(NSMutableIndexSet *)self->_sortRequestIndexSet removeIndex:v11];
      v16 = [(SKUIStorePageSection *)self context];
      v17 = [v16 parentViewController];
      [v17 _updateSectionsForIndex:v11 menuSection:self];
    }
  }
LABEL_8:
}

- (void)popoverControllerDidDismissPopover:(id)a3
{
  [(SKUIMenuPageSection *)self _restorePreviousSelection];
  [(SKUIMenuViewController *)self->_moreListMenuViewController setDelegate:0];
  moreListMenuViewController = self->_moreListMenuViewController;
  self->_moreListMenuViewController = 0;

  [(UIPopoverController *)self->_moreListPopoverController setDelegate:0];
  moreListPopoverController = self->_moreListPopoverController;
  self->_moreListPopoverController = 0;
}

- (void)_cancelMenuAction:(id)a3
{
  [(SKUIMenuPageSection *)self _restorePreviousSelection];

  [(SKUIMenuPageSection *)self _dismissMenuViewController];
}

- (void)_pillAction:(id)a3
{
  id v4 = [(SKUIStorePageSection *)self pageComponent];
  uint64_t v5 = [v4 numberOfItems];

  int64_t v6 = [(SKUIPillsControl *)self->_pillsControl selectedIndex];
  uint64_t v7 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v8 = [v7 userInterfaceIdiom];

  uint64_t v9 = 3;
  if ((v8 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    uint64_t v9 = 5;
  }
  if (v5 <= v9) {
    goto LABEL_10;
  }
  uint64_t v10 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v11 = [v10 userInterfaceIdiom];

  uint64_t v12 = 2;
  if ((v11 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    uint64_t v12 = 4;
  }
  if (v6 == v12)
  {
    [(SKUIMenuPageSection *)self _showMoreList];
  }
  else
  {
LABEL_10:
    [(SKUIMenuPageSection *)self _setSelectedIndex:v6];
  }
}

- (id)_contentChildView
{
  double v3 = [(SKUIStorePageSection *)self pageComponent];
  uint64_t v4 = [v3 menuStyle];

  if (v4
    && ([MEMORY[0x1E4FB16C8] currentDevice],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v5 userInterfaceIdiom],
        v5,
        v6))
  {
    uint64_t v7 = [(SKUIMenuPageSection *)self _popupHeaderView];
  }
  else
  {
    uint64_t v7 = [(SKUIMenuPageSection *)self _pillsControl];
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

  [(SKUIMenuViewController *)self->_moreListMenuViewController setDelegate:0];
  moreListMenuViewController = self->_moreListMenuViewController;
  self->_moreListMenuViewController = 0;

  [(UIPopoverController *)self->_moreListPopoverController setDelegate:0];
  moreListPopoverController = self->_moreListPopoverController;
  self->_moreListPopoverController = 0;

  if (v4) {
    [(UIPopoverController *)v4 dismissPopoverAnimated:1];
  }
  else {
    [(SKUIMenuViewController *)v10 dismissViewControllerAnimated:1 completion:0];
  }

  uint64_t v8 = [(SKUIStorePageSection *)self context];
  uint64_t v9 = [v8 parentViewController];
  [v9 _endIgnoringSectionChanges];
}

- (void)_loadSortDataIfNecessaryForMenuIndex:(int64_t)a3 reason:(int64_t)a4
{
  if ((-[NSMutableIndexSet containsIndex:](self->_sortRequestIndexSet, "containsIndex:") & 1) == 0)
  {
    id v16 = [(SKUIStorePageSection *)self pageComponent];
    uint64_t v7 = [v16 childComponentsForIndex:a3];

    uint64_t v8 = v16;
    if (!v7)
    {
      uint64_t v9 = [v16 sortURLForIndex:a3];
      if (v9)
      {
        uint64_t v10 = [[SKUISortDataRequest alloc] initWithSortURL:v9];
        [(SKUISortDataRequest *)v10 setDelegate:self];
        sortRequestIndexSet = self->_sortRequestIndexSet;
        if (!sortRequestIndexSet)
        {
          uint64_t v12 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x1E4F28E60]);
          char v13 = self->_sortRequestIndexSet;
          self->_sortRequestIndexSet = v12;

          sortRequestIndexSet = self->_sortRequestIndexSet;
        }
        [(NSMutableIndexSet *)sortRequestIndexSet addIndex:a3];
        v14 = [(SKUIStorePageSection *)self context];
        v15 = [v14 resourceLoader];
        [v15 loadResourceWithRequest:v10 reason:a4];
      }
      uint64_t v8 = v16;
    }
  }
}

- (id)_newMenuViewController
{
  double v3 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    uint64_t v5 = 4;
  }
  else {
    uint64_t v5 = 2;
  }
  uint64_t v6 = [(SKUIPillsControl *)self->_pillsControl titles];
  uint64_t v7 = objc_msgSend(v6, "subarrayWithRange:", v5, objc_msgSend(v6, "count") - v5);

  uint64_t v8 = [[SKUIMenuViewController alloc] initWithMenuTitles:v7];
  [(SKUIMenuViewController *)v8 setDelegate:self];
  int64_t selectedIndex = self->_selectedIndex;
  if (selectedIndex >= v5) {
    [(SKUIMenuViewController *)v8 setIndexOfCheckedTitle:selectedIndex - v5];
  }

  return v8;
}

- (id)_pillsControl
{
  pillsControl = self->_pillsControl;
  if (!pillsControl)
  {
    uint64_t v4 = objc_alloc_init(SKUIPillsControl);
    uint64_t v5 = self->_pillsControl;
    self->_pillsControl = v4;

    [(SKUIPillsControl *)self->_pillsControl addTarget:self action:sel__pillAction_ forControlEvents:4096];
    uint64_t v6 = self->_pillsControl;
    uint64_t v7 = [(SKUIStorePageSection *)self context];
    uint64_t v8 = [v7 colorScheme];
    [(SKUIPillsControl *)v6 setColorScheme:v8];

    uint64_t v9 = self->_pillsControl;
    uint64_t v10 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v11 = [v10 userInterfaceIdiom];

    if ((v11 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
      uint64_t v12 = 5;
    }
    else {
      uint64_t v12 = 3;
    }
    [(SKUIPillsControl *)v9 setMaximumNumberOfVisiblePills:v12];
    char v13 = [(SKUIStorePageSection *)self pageComponent];
    v14 = self->_pillsControl;
    v15 = [v13 allTitles];
    [(SKUIPillsControl *)v14 setTitles:v15];

    id v16 = [v13 viewElement];
    v17 = [v16 style];
    v18 = SKUIViewElementPlainColorWithStyle(v17, 0);

    [(SKUIPillsControl *)self->_pillsControl setTintColor:v18];
    v19 = [(SKUIStorePageSection *)self context];
    v20 = [v19 parentViewController];
    v21 = [v20 clientContext];

    v22 = [v13 titleForMoreItem];
    v23 = self->_pillsControl;
    if (v22)
    {
      [(SKUIPillsControl *)self->_pillsControl setMoreListTitle:v22];
    }
    else
    {
      if (v21) {
        [v21 localizedStringForKey:@"TABS_MORE_LIST_TITLE"];
      }
      else {
      v24 = +[SKUIClientContext localizedStringForKey:@"TABS_MORE_LIST_TITLE" inBundles:0];
      }
      [(SKUIPillsControl *)v23 setMoreListTitle:v24];
    }
    -[SKUIPillsControl setContentInset:](self->_pillsControl, "setContentInset:", 0.0, 15.0, 0.0, 15.0);
    [(SKUIPillsControl *)self->_pillsControl reloadPills];
    v25 = self->_pillsControl;
    int64_t selectedIndex = self->_selectedIndex;
    v27 = [MEMORY[0x1E4FB16C8] currentDevice];
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
    [(SKUIPillsControl *)v25 setSelectedIndex:v30];
    [(SKUIPillsControl *)self->_pillsControl sizeToFit];

    pillsControl = self->_pillsControl;
  }

  return pillsControl;
}

- (id)_popupHeaderView
{
  popupHeaderView = self->_popupHeaderView;
  if (!popupHeaderView)
  {
    uint64_t v4 = objc_alloc_init(SKUIPopupMenuHeaderView);
    uint64_t v5 = self->_popupHeaderView;
    self->_popupHeaderView = v4;

    [(SKUIPopupMenuHeaderView *)self->_popupHeaderView setDelegate:self];
    uint64_t v6 = [(SKUIStorePageSection *)self pageComponent];
    uint64_t v7 = [v6 menuTitle];
    if (v7) {
      [(SKUIPopupMenuHeaderView *)self->_popupHeaderView setTitle:v7];
    }
    uint64_t v8 = [(SKUIStorePageSection *)self context];
    uint64_t v9 = [v8 parentViewController];
    uint64_t v10 = [v9 clientContext];

    uint64_t v11 = self->_popupHeaderView;
    if (v10) {
      [v10 localizedStringForKey:@"POPUP_SORT_BY"];
    }
    else {
    uint64_t v12 = +[SKUIClientContext localizedStringForKey:@"POPUP_SORT_BY" inBundles:0];
    }
    [(SKUIPopupMenuHeaderView *)v11 setMenuLabelTitle:v12];

    char v13 = self->_popupHeaderView;
    v14 = [v6 allTitles];
    [(SKUIPopupMenuHeaderView *)v13 setMenuItemTitles:v14];

    v15 = self->_popupHeaderView;
    id v16 = [(SKUIStorePageSection *)self context];
    v17 = [v16 colorScheme];
    [(SKUIPopupMenuHeaderView *)v15 setColoringWithColorScheme:v17];

    [(SKUIPopupMenuHeaderView *)self->_popupHeaderView setSelectedMenuItemIndex:self->_selectedIndex];
    [(SKUIPopupMenuHeaderView *)self->_popupHeaderView sizeToFit];

    popupHeaderView = self->_popupHeaderView;
  }

  return popupHeaderView;
}

- (void)_restorePreviousSelection
{
  int64_t selectedIndex = self->_selectedIndex;
  uint64_t v4 = [MEMORY[0x1E4FB16C8] currentDevice];
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
  [(SKUIPillsControl *)self->_pillsControl reloadPills];
  pillsControl = self->_pillsControl;

  [(SKUIPillsControl *)pillsControl setSelectedIndex:v7];
}

- (void)_setSelectedIndex:(int64_t)a3
{
  if (self->_selectedIndex != a3)
  {
    self->_int64_t selectedIndex = a3;
    uint64_t v4 = [(SKUIStorePageSection *)self pageComponent];
    id v8 = [v4 viewElement];

    int64_t selectedIndex = self->_selectedIndex;
    if (v8)
    {
      [v8 dispatchEventOfType:2 forItemAtIndex:selectedIndex];
    }
    else
    {
      [(SKUIMenuPageSection *)self _loadSortDataIfNecessaryForMenuIndex:selectedIndex reason:1];
      uint64_t v6 = [(SKUIStorePageSection *)self context];
      uint64_t v7 = [v6 parentViewController];
      [v7 _setSelectedIndex:self->_selectedIndex forMenuSection:self];
    }
  }
}

- (void)_showMenuViewController
{
  if (!self->_moreListMenuViewController)
  {
    id v16 = [(SKUIStorePageSection *)self context];
    double v3 = [v16 parentViewController];
    uint64_t v4 = [(SKUIMenuPageSection *)self _newMenuViewController];
    moreListMenuViewController = self->_moreListMenuViewController;
    self->_moreListMenuViewController = v4;

    uint64_t v6 = self->_moreListMenuViewController;
    uint64_t v7 = [(SKUIPillsControl *)self->_pillsControl moreListTitle];
    [(SKUIMenuViewController *)v6 setTitle:v7];

    id v8 = (UIBarButtonItem *)objc_alloc_init(MEMORY[0x1E4FB14A8]);
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
    char v13 = +[SKUIClientContext localizedStringForKey:@"CANCEL" inBundles:0];
    }
    [(UIBarButtonItem *)v10 setTitle:v13];

    v14 = [(SKUIMenuViewController *)self->_moreListMenuViewController navigationItem];
    [v14 setLeftBarButtonItem:self->_cancelMenuItem];

    v15 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:self->_moreListMenuViewController];
    [v3 presentViewController:v15 animated:1 completion:0];
    [v3 _beginIgnoringSectionChanges];
  }
}

- (void)_showMoreList
{
  double v3 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if (v4)
  {
    [(SKUIMenuPageSection *)self _showPopoverController];
  }
  else
  {
    [(SKUIMenuPageSection *)self _showMenuViewController];
  }
}

- (void)_showPopoverController
{
  if (!self->_moreListPopoverController)
  {
    double v3 = [(SKUIMenuPageSection *)self _newMenuViewController];
    moreListMenuViewController = self->_moreListMenuViewController;
    self->_moreListMenuViewController = v3;

    [(SKUIMenuViewController *)self->_moreListMenuViewController setDelegate:self];
    uint64_t v5 = [(SKUIMenuViewController *)self->_moreListMenuViewController menuTitles];
    double v6 = (float)((float)(unint64_t)[v5 count] * 45.0);

    -[SKUIMenuViewController setPreferredContentSize:](self->_moreListMenuViewController, "setPreferredContentSize:", 320.0, v6);
    uint64_t v7 = (UIPopoverController *)[objc_alloc(MEMORY[0x1E4FB1AF8]) initWithContentViewController:self->_moreListMenuViewController];
    moreListPopoverController = self->_moreListPopoverController;
    self->_moreListPopoverController = v7;

    [(UIPopoverController *)self->_moreListPopoverController setDelegate:self];
    -[UIPopoverController setPopoverContentSize:](self->_moreListPopoverController, "setPopoverContentSize:", 320.0, v6);
    uint64_t v9 = self->_moreListPopoverController;
    [(SKUIPillsControl *)self->_pillsControl selectedPillFrame];
    -[UIPopoverController presentPopoverFromRect:inView:permittedArrowDirections:animated:](v9, "presentPopoverFromRect:inView:permittedArrowDirections:animated:", self->_pillsControl, 1, 1);
    id v11 = [(SKUIStorePageSection *)self context];
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

- (void)initWithPageComponent:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIMenuPageSection initWithPageComponent:]";
}

@end