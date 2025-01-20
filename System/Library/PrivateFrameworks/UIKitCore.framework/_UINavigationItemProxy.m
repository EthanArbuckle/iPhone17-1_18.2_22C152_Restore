@interface _UINavigationItemProxy
- (BOOL)navigationItemIsBackItem:(id)a3;
- (BOOL)navigationItemIsTopItem:(id)a3;
- (BOOL)shouldSearchControllerDeferPresentationTransitionForNavigationItem:(id)a3;
- (_UINavigationItemProxy)initWithDestinationNavigationItem:(id)a3 sourceNavigationItem:(id)a4;
- (id)presentationSourceForContent:(int64_t)a3 navigationItem:(id)a4;
- (void)navigationItem:(id)a3 appearance:(id)a4 categoriesChanged:(int64_t)a5;
- (void)navigationItem:(id)a3 updatedPalettePart:(int64_t)a4 oldPalette:(id)a5;
- (void)navigationItemSearchControllerReadyForDeferredAutomaticShowsScopeBar:(id)a3;
- (void)navigationItemUpdatedAdditionalOverflowItems:(id)a3;
- (void)navigationItemUpdatedBackButtonContent:(id)a3 animated:(BOOL)a4;
- (void)navigationItemUpdatedBackgroundAppearance:(id)a3;
- (void)navigationItemUpdatedBottomPalette:(id)a3 oldPalette:(id)a4;
- (void)navigationItemUpdatedCenterBarButtonItems:(id)a3 animated:(BOOL)a4;
- (void)navigationItemUpdatedContentLayout:(id)a3 animated:(BOOL)a4;
- (void)navigationItemUpdatedLargeTitleContent:(id)a3;
- (void)navigationItemUpdatedLargeTitleDisplayMode:(id)a3;
- (void)navigationItemUpdatedLeftBarButtonItems:(id)a3 animated:(BOOL)a4;
- (void)navigationItemUpdatedNavigationBarVisibility:(id)a3;
- (void)navigationItemUpdatedPromptContent:(id)a3;
- (void)navigationItemUpdatedRightBarButtonItems:(id)a3 animated:(BOOL)a4;
- (void)navigationItemUpdatedScrollEdgeProgress:(id)a3;
- (void)navigationItemUpdatedSearchController:(id)a3 oldSearchController:(id)a4;
- (void)navigationItemUpdatedTitleContent:(id)a3 animated:(BOOL)a4;
- (void)reloadDestinationItemFromSource;
@end

@implementation _UINavigationItemProxy

- (_UINavigationItemProxy)initWithDestinationNavigationItem:(id)a3 sourceNavigationItem:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)_UINavigationItemProxy;
  v9 = [(_UINavigationItemProxy *)&v16 init];
  v10 = v9;
  if (v9)
  {
    if (v7 == v8)
    {
      if (os_variant_has_internal_diagnostics())
      {
        v14 = __UIFaultDebugAssertLog();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)v15 = 0;
          _os_log_fault_impl(&dword_1853B0000, v14, OS_LOG_TYPE_FAULT, "destinationNavigationItem == sourceNavigationItem. This will cause infinite recursion and is not a valid configuration.", v15, 2u);
        }
      }
      else
      {
        v13 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &initWithDestinationNavigationItem_sourceNavigationItem____s_category)+ 8);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v15 = 0;
          _os_log_impl(&dword_1853B0000, v13, OS_LOG_TYPE_ERROR, "destinationNavigationItem == sourceNavigationItem. This will cause infinite recursion and is not a valid configuration.", v15, 2u);
        }
      }
    }
    else
    {
      objc_storeStrong((id *)&v9->_destinationNavigationItem, a3);
      id v11 = objc_storeWeak((id *)&v10->_sourceNavigationItem, v8);
      [v8 _setChangeObserver:v10];

      [(_UINavigationItemProxy *)v10 reloadDestinationItemFromSource];
    }
  }

  return v10;
}

- (void)reloadDestinationItemFromSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sourceNavigationItem);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __57___UINavigationItemProxy_reloadDestinationItemFromSource__block_invoke;
  v5[3] = &unk_1E52D9F98;
  v5[4] = self;
  id v6 = WeakRetained;
  id v4 = WeakRetained;
  +[UIView performWithoutAnimation:v5];
}

- (BOOL)navigationItemIsTopItem:(id)a3
{
  id v4 = [(UINavigationItem *)self->_destinationNavigationItem _changeObserver];

  if (!v4) {
    return 1;
  }
  v5 = [(UINavigationItem *)self->_destinationNavigationItem _changeObserver];
  char v6 = [v5 navigationItemIsTopItem:self->_destinationNavigationItem];

  return v6;
}

- (BOOL)navigationItemIsBackItem:(id)a3
{
  id v4 = [(UINavigationItem *)self->_destinationNavigationItem _changeObserver];

  if (!v4) {
    return 0;
  }
  v5 = [(UINavigationItem *)self->_destinationNavigationItem _changeObserver];
  char v6 = [v5 navigationItemIsBackItem:self->_destinationNavigationItem];

  return v6;
}

- (void)navigationItemUpdatedTitleContent:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  destinationNavigationItem = self->_destinationNavigationItem;
  id v7 = a3;
  id v8 = [v7 title];
  [(UINavigationItem *)destinationNavigationItem _setTitle:v8 animated:v4];

  v9 = [v7 titleView];
  [(UINavigationItem *)self->_destinationNavigationItem setTitleView:v9];

  id v10 = [v7 _weeTitle];

  [(UINavigationItem *)self->_destinationNavigationItem _setWeeTitle:v10];
}

- (void)navigationItemUpdatedLeftBarButtonItems:(id)a3 animated:(BOOL)a4
{
  id v5 = a3;
  id v14 = 0;
  id v15 = 0;
  [v5 _getLeadingItems:&v15 groups:&v14];
  if (v15)
  {
    destinationNavigationItem = self->_destinationNavigationItem;
LABEL_3:
    -[UINavigationItem setLeftBarButtonItems:](destinationNavigationItem, "setLeftBarButtonItems:");
    goto LABEL_6;
  }
  id v7 = self->_destinationNavigationItem;
  if (v14)
  {
LABEL_5:
    -[UINavigationItem setLeadingItemGroups:](v7, "setLeadingItemGroups:");
    goto LABEL_6;
  }
  uint64_t v8 = [(UINavigationItem *)v7 leftBarButtonItems];
  if (v8)
  {
    v9 = (void *)v8;
    id v10 = [v5 leftBarButtonItems];

    if (!v10)
    {
      destinationNavigationItem = self->_destinationNavigationItem;
      goto LABEL_3;
    }
  }
  id v11 = [(UINavigationItem *)self->_destinationNavigationItem leadingItemGroups];
  if (![v11 count])
  {

    goto LABEL_6;
  }
  v12 = [v5 leadingItemGroups];
  uint64_t v13 = [v12 count];

  if (!v13)
  {
    id v7 = self->_destinationNavigationItem;
    goto LABEL_5;
  }
LABEL_6:
}

- (void)navigationItemUpdatedRightBarButtonItems:(id)a3 animated:(BOOL)a4
{
  id v5 = a3;
  id v14 = 0;
  id v15 = 0;
  [v5 _getTrailingItems:&v15 groups:&v14];
  if (v15)
  {
    destinationNavigationItem = self->_destinationNavigationItem;
LABEL_3:
    -[UINavigationItem setRightBarButtonItems:](destinationNavigationItem, "setRightBarButtonItems:");
    goto LABEL_6;
  }
  id v7 = self->_destinationNavigationItem;
  if (v14)
  {
LABEL_5:
    -[UINavigationItem setTrailingItemGroups:](v7, "setTrailingItemGroups:");
    goto LABEL_6;
  }
  uint64_t v8 = [(UINavigationItem *)v7 rightBarButtonItems];
  if (v8)
  {
    v9 = (void *)v8;
    id v10 = [v5 rightBarButtonItems];

    if (!v10)
    {
      destinationNavigationItem = self->_destinationNavigationItem;
      goto LABEL_3;
    }
  }
  id v11 = [(UINavigationItem *)self->_destinationNavigationItem trailingItemGroups];
  if (![v11 count])
  {

    goto LABEL_6;
  }
  v12 = [v5 trailingItemGroups];
  uint64_t v13 = [v12 count];

  if (!v13)
  {
    id v7 = self->_destinationNavigationItem;
    goto LABEL_5;
  }
LABEL_6:
}

- (void)navigationItemUpdatedContentLayout:(id)a3 animated:(BOOL)a4
{
  id v5 = a3;
  -[UINavigationItem setHidesBackButton:](self->_destinationNavigationItem, "setHidesBackButton:", [v5 hidesBackButton]);
  uint64_t v6 = [v5 leftItemsSupplementBackButton];

  destinationNavigationItem = self->_destinationNavigationItem;
  [(UINavigationItem *)destinationNavigationItem setLeftItemsSupplementBackButton:v6];
}

- (void)navigationItemUpdatedBackButtonContent:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v8 = a3;
  if (-[_UINavigationItemProxy navigationItemIsBackItem:](self, "navigationItemIsBackItem:"))
  {
    [(_UINavigationItemProxy *)self navigationItemUpdatedTitleContent:v8 animated:v4];
  }
  else
  {
    uint64_t v6 = [v8 backButtonTitle];
    [(UINavigationItem *)self->_destinationNavigationItem setBackButtonTitle:v6];

    id v7 = [v8 backBarButtonItem];
    [(UINavigationItem *)self->_destinationNavigationItem setBackBarButtonItem:v7];
  }
}

- (void)navigationItemUpdatedLargeTitleDisplayMode:(id)a3
{
  uint64_t v4 = [a3 largeTitleDisplayMode];
  destinationNavigationItem = self->_destinationNavigationItem;
  [(UINavigationItem *)destinationNavigationItem setLargeTitleDisplayMode:v4];
}

- (void)navigationItemUpdatedLargeTitleContent:(id)a3
{
  id v4 = a3;
  id v5 = [v4 _largeTitleAccessoryView];
  [(UINavigationItem *)self->_destinationNavigationItem _setLargeTitleAccessoryView:v5];

  uint64_t v6 = [v4 _largeTitleTwoLineMode];
  destinationNavigationItem = self->_destinationNavigationItem;
  [(UINavigationItem *)destinationNavigationItem _setLargeTitleTwoLineMode:v6];
}

- (void)navigationItem:(id)a3 appearance:(id)a4 categoriesChanged:(int64_t)a5
{
  id v6 = a3;
  id v7 = [v6 compactAppearance];
  [(UINavigationItem *)self->_destinationNavigationItem setCompactAppearance:v7];

  id v8 = [v6 standardAppearance];
  [(UINavigationItem *)self->_destinationNavigationItem setStandardAppearance:v8];

  id v9 = [v6 scrollEdgeAppearance];

  [(UINavigationItem *)self->_destinationNavigationItem setScrollEdgeAppearance:v9];
}

- (void)navigationItemSearchControllerReadyForDeferredAutomaticShowsScopeBar:(id)a3
{
}

- (void)navigationItemUpdatedBackgroundAppearance:(id)a3
{
  uint64_t v4 = [a3 _backgroundHidden];
  destinationNavigationItem = self->_destinationNavigationItem;
  [(UINavigationItem *)destinationNavigationItem _setBackgroundHidden:v4];
}

- (void)navigationItemUpdatedScrollEdgeProgress:(id)a3
{
  id v4 = a3;
  -[UINavigationItem _setManualScrollEdgeAppearanceEnabled:](self->_destinationNavigationItem, "_setManualScrollEdgeAppearanceEnabled:", [v4 _isManualScrollEdgeAppearanceEnabled]);
  [v4 _manualScrollEdgeAppearanceProgress];
  double v6 = v5;

  destinationNavigationItem = self->_destinationNavigationItem;
  [(UINavigationItem *)destinationNavigationItem _setManualScrollEdgeAppearanceProgress:v6];
}

- (void)navigationItemUpdatedPromptContent:(id)a3
{
  id v4 = [a3 prompt];
  [(UINavigationItem *)self->_destinationNavigationItem setPrompt:v4];
}

- (void)navigationItemUpdatedSearchController:(id)a3 oldSearchController:(id)a4
{
  id v5 = a3;
  double v6 = [v5 searchController];
  [(UINavigationItem *)self->_destinationNavigationItem setSearchController:v6];

  -[UINavigationItem setHidesSearchBarWhenScrolling:](self->_destinationNavigationItem, "setHidesSearchBarWhenScrolling:", [v5 hidesSearchBarWhenScrolling]);
  uint64_t v7 = [v5 preferredSearchBarPlacement];

  destinationNavigationItem = self->_destinationNavigationItem;
  [(UINavigationItem *)destinationNavigationItem setPreferredSearchBarPlacement:v7];
}

- (void)navigationItemUpdatedBottomPalette:(id)a3 oldPalette:(id)a4
{
  id v5 = [a3 _bottomPalette];
  [(UINavigationItem *)self->_destinationNavigationItem _setBottomPalette:v5];
}

- (void)navigationItemUpdatedCenterBarButtonItems:(id)a3 animated:(BOOL)a4
{
  id v5 = [a3 centerItemGroups];
  [(UINavigationItem *)self->_destinationNavigationItem setCenterItemGroups:v5];
}

- (void)navigationItemUpdatedAdditionalOverflowItems:(id)a3
{
  id v4 = [a3 additionalOverflowItems];
  [(UINavigationItem *)self->_destinationNavigationItem setAdditionalOverflowItems:v4];
}

- (void)navigationItemUpdatedNavigationBarVisibility:(id)a3
{
  id v4 = a3;
  -[UINavigationItem _setPreferredNavigationBarVisibility:](self->_destinationNavigationItem, "_setPreferredNavigationBarVisibility:", [v4 _navigationBarVisibility]);
  uint64_t v5 = [v4 _isNavigationBarHidden];

  destinationNavigationItem = self->_destinationNavigationItem;
  [(UINavigationItem *)destinationNavigationItem _setNavigationBarHidden:v5];
}

- (void)navigationItem:(id)a3 updatedPalettePart:(int64_t)a4 oldPalette:(id)a5
{
  id v6 = a3;
  uint64_t v7 = [v6 _topPalette];
  [(UINavigationItem *)self->_destinationNavigationItem _setTopPalette:v7];

  id v8 = [v6 _bottomPalette];

  [(UINavigationItem *)self->_destinationNavigationItem _setBottomPalette:v8];
}

- (BOOL)shouldSearchControllerDeferPresentationTransitionForNavigationItem:(id)a3
{
  destinationNavigationItem = self->_destinationNavigationItem;
  id v4 = [a3 searchController];
  LOBYTE(destinationNavigationItem) = [(UINavigationItem *)destinationNavigationItem _shouldSearchControllerDeferPresentationTransition:v4];

  return (char)destinationNavigationItem;
}

- (id)presentationSourceForContent:(int64_t)a3 navigationItem:(id)a4
{
  return [(UINavigationItem *)self->_destinationNavigationItem overflowPresentationSource];
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_sourceNavigationItem);
  objc_storeStrong((id *)&self->_destinationNavigationItem, 0);
}

@end