@interface UINavigationItem
+ (id)defaultFont;
- (BOOL)_accumulateViewsFromItems:(id)a3 isLeft:(BOOL)a4 refreshViews:(BOOL)a5;
- (BOOL)_alignLargeTitleAccessoryViewToBaseline;
- (BOOL)_allowsInteractivePop;
- (BOOL)_allowsInteractivePopWhenNavigationBarHidden;
- (BOOL)_alwaysUseManualScrollEdgeAppearance;
- (BOOL)_backgroundHidden;
- (BOOL)_canRename;
- (BOOL)_hasDefaultTitleView;
- (BOOL)_hasInlineSearchBar;
- (BOOL)_hasInlineSearchBarForTraits:(id)a3;
- (BOOL)_isManualScrollEdgeAppearanceEnabled;
- (BOOL)_isNavigationBarHidden;
- (BOOL)_leftItemsWantBackButton;
- (BOOL)_preserveSearchBarAcrossTransitions;
- (BOOL)_shouldDismissPresentedViewControllerWhenPopped;
- (BOOL)_shouldSearchControllerDeferPresentationTransition:(id)a3;
- (BOOL)_supportsTwoLineLargeTitles;
- (BOOL)_wantsBackButtonIndicator;
- (BOOL)hidesBackButton;
- (BOOL)hidesSearchBarWhenScrolling;
- (BOOL)leftItemsSupplementBackButton;
- (BOOL)useRelativeLargeTitleInsets;
- (NSArray)_abbreviatedBackButtonTitles;
- (NSArray)_alternateLargeTitles;
- (NSArray)_dci_centerItemGroups;
- (NSArray)_dci_centerItems;
- (NSArray)_leftItemSpaceList;
- (NSArray)_rightItemSpaceList;
- (NSArray)centerItemGroups;
- (NSArray)leadingItemGroups;
- (NSArray)leftBarButtonItems;
- (NSArray)rightBarButtonItems;
- (NSArray)trailingItemGroups;
- (NSDirectionalEdgeInsets)largeTitleInsets;
- (NSString)_pendingTitle;
- (NSString)_weeTitle;
- (NSString)backButtonTitle;
- (NSString)customizationIdentifier;
- (NSString)description;
- (NSString)prompt;
- (NSString)title;
- (UIAction)backAction;
- (UIBarButtonItem)backBarButtonItem;
- (UIBarButtonItem)customLeftItem;
- (UIBarButtonItem)customRightItem;
- (UIBarButtonItem)leftBarButtonItem;
- (UIBarButtonItem)rightBarButtonItem;
- (UIBarButtonItemGroup)pinnedTrailingGroup;
- (UIDeferredMenuElement)additionalOverflowItems;
- (UIDocumentProperties)documentProperties;
- (UIMenu)_dci_documentMenu;
- (UINavigationBar)_navigationBar;
- (UINavigationBar)navigationBar;
- (UINavigationBarAppearance)compactAppearance;
- (UINavigationBarAppearance)compactScrollEdgeAppearance;
- (UINavigationBarAppearance)scrollEdgeAppearance;
- (UINavigationBarAppearance)standardAppearance;
- (UINavigationItem)init;
- (UINavigationItem)initWithCoder:(NSCoder *)coder;
- (UINavigationItem)initWithTitle:(NSString *)title;
- (UINavigationItemBackButtonDisplayMode)backButtonDisplayMode;
- (UINavigationItemLargeTitleDisplayMode)largeTitleDisplayMode;
- (UINavigationItemSearchBarPlacement)preferredSearchBarPlacement;
- (UINavigationItemSearchBarPlacement)searchBarPlacement;
- (UINavigationItemStyle)style;
- (UISearchController)_searchControllerIfAllowed;
- (UISearchController)searchController;
- (UIView)_canvasView;
- (UIView)_largeTitleAccessoryView;
- (UIView)customLeftView;
- (UIView)customRightView;
- (UIView)titleView;
- (_UIBarButtonItemSearchBarGroup)_existingInlineSearchBarItemGroup;
- (_UIBarButtonItemSearchBarGroup)_inlineSearchBarItemGroup;
- (_UIDocumentMenuHeader)_dci_documentMenuHeader;
- (_UINavigationBarItemStackEntry)_stackEntry;
- (_UINavigationBarPalette)_bottomPalette;
- (_UINavigationBarPalette)_topPalette;
- (_UINavigationItemChangeObserver)_changeObserver;
- (_UINavigationItemRenameHandler)_dci_renameHandler;
- (double)_autoScrollEdgeTransitionDistance;
- (double)_desiredHeightForBarMetrics:(int64_t)a3 defaultHeightBlock:(id)a4;
- (double)_fontScaleAdjustment;
- (double)_idealCustomTitleWidth;
- (double)_manualScrollEdgeAppearanceProgress;
- (double)_minimumDesiredHeightForBarMetrics:(int64_t)a3;
- (double)_titleViewWidthForAnimations;
- (id)_addDefaultTitleViewToNavigationBarIfNecessary:(id)a3;
- (id)_backButtonTitleAllowingGenericTitles:(BOOL)a3;
- (id)_barButtonForBackButtonIndicator;
- (id)_barButtonItemsToAddWhenAttemptingToAddBarButtonItems:(int)a3 forRight:;
- (id)_buttonForBackButtonIndicator;
- (id)_customLeftViews;
- (id)_customRightViews;
- (id)_dci_documentMenuProvider;
- (id)_defaultTitleView;
- (id)_effectiveBackBarButtonItem;
- (id)_effectiveTitleForTitle:(id)a3;
- (id)_firstNonSpaceItemInList:(id)a3;
- (id)_firstNonSpaceLeftItem;
- (id)_firstNonSpaceRightItem;
- (id)_independentBackgroundImageForBarMetrics:(int64_t)a3;
- (id)_independentShadowImage;
- (id)_minimumDesiredHeights;
- (id)_titleView;
- (id)backButtonView;
- (id)context;
- (id)currentBackButtonTitle;
- (id)existingBackButtonView;
- (id)overflowPresentationSource;
- (id)renameDelegate;
- (int64_t)_dci_preferredSearchBarPlacement;
- (int64_t)_independentBarStyle;
- (int64_t)tag;
- (unint64_t)_largeTitleAccessoryViewHorizontalAlignment;
- (unint64_t)_largeTitleTwoLineMode;
- (unint64_t)_leftFlexibleSpaceCount;
- (unint64_t)_navigationBarVisibility;
- (unint64_t)_preferredNavigationBarVisibility;
- (unint64_t)_rightFlexibleSpaceCount;
- (void)_cleanupFrozenTitleView;
- (void)_dci_setDocumentMenu:(id)a3;
- (void)_dci_setRenameHandler:(id)a3;
- (void)_freezeCurrentTitleView;
- (void)_getLeadingItems:(id *)a3 groups:(id *)a4;
- (void)_getTrailingItems:(id *)a3 groups:(id *)a4;
- (void)_messageChangeObserver:(id)a3 forTransitionFromSearchController:(id)a4;
- (void)_movedFromTopOfStack:(BOOL)a3;
- (void)_movedToTopOfStack:(BOOL)a3;
- (void)_movingFromTopOfStack;
- (void)_movingToTopOfStack;
- (void)_removeBackButtonView;
- (void)_removeBarButtonItemViews;
- (void)_removeContentInView:(id)a3;
- (void)_removeTitleAndButtonViews;
- (void)_replaceCustomLeftRightViewAtIndex:(unint64_t)a3 withView:(id)a4 left:(BOOL)a5;
- (void)_searchControllerReadyForDeferredAutomaticShowsScopeBar;
- (void)_sendSearchBarPlacementChangeCallbackIfNecessaryWillChange:(id *)a1;
- (void)_setAbbreviatedBackButtonTitles:(id)a3;
- (void)_setAllowsInteractivePop:(BOOL)a3;
- (void)_setAllowsInteractivePopWhenNavigationBarHidden:(BOOL)a3;
- (void)_setAlwaysUseManualScrollEdgeAppearance:(BOOL)a3;
- (void)_setAutoScrollEdgeTransitionDistance:(double)a3;
- (void)_setBackButtonPressed:(BOOL)a3;
- (void)_setBackButtonTitle:(id)a3 lineBreakMode:(int64_t)a4;
- (void)_setBackgroundHidden:(BOOL)a3;
- (void)_setBottomPalette:(id)a3;
- (void)_setBottomPaletteNeedsUpdate;
- (void)_setBottomPaletteNeedsUpdate:(id)a3;
- (void)_setCanvasView:(id)a3;
- (void)_setChangeObserver:(id)a3;
- (void)_setCustomLeftViews:(id)a3;
- (void)_setCustomRightViews:(id)a3;
- (void)_setFontScaleAdjustment:(double)a3;
- (void)_setIdealCustomTitleWidth:(double)a3;
- (void)_setLargeTitleAccessoryView:(id)a3;
- (void)_setLargeTitleAccessoryView:(id)a3 alignToBaseline:(BOOL)a4;
- (void)_setLargeTitleAccessoryView:(id)a3 alignToBaseline:(BOOL)a4 horizontalAlignment:(unint64_t)a5;
- (void)_setLargeTitleTwoLineMode:(unint64_t)a3;
- (void)_setLeftFlexibleSpaceCount:(unint64_t)a3;
- (void)_setLeftItemSpaceList:(id)a3;
- (void)_setManualScrollEdgeAppearanceEnabled:(BOOL)a3;
- (void)_setManualScrollEdgeAppearanceProgress:(double)a3;
- (void)_setMinimumDesiredHeight:(double)a3 forBarMetrics:(int64_t)a4;
- (void)_setNavigationBar:(id)a3;
- (void)_setNavigationBarHidden:(BOOL)a3;
- (void)_setPendingTitle:(id)a3;
- (void)_setPreferredNavigationBarVisibility:(unint64_t)a3;
- (void)_setPreserveSearchBarAcrossTransitions:(BOOL)a3;
- (void)_setRightFlexibleSpaceCount:(unint64_t)a3;
- (void)_setRightItemSpaceList:(id)a3;
- (void)_setShouldDismissPresentedViewControllerWhenPopped:(BOOL)a3;
- (void)_setStackEntry:(id)a3;
- (void)_setSupportsTwoLineLargeTitles:(BOOL)a3;
- (void)_setTitle:(id)a3 animated:(BOOL)a4;
- (void)_setTitle:(id)a3 animated:(BOOL)a4 matchBarButtonItemAnimationDuration:(BOOL)a5;
- (void)_setTitleViewDataSource:(id)a3;
- (void)_setTopPalette:(id)a3;
- (void)_setWeeTitle:(id)a3;
- (void)_updatePalette:(id)a3;
- (void)_updateSearchBarItemGroup;
- (void)_updateViewsForBarSizeChangeAndApply:(BOOL)a3;
- (void)appearance:(id)a3 categoriesChanged:(int64_t)a4;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setAdditionalOverflowItems:(UIDeferredMenuElement *)additionalOverflowItems;
- (void)setBackAction:(UIAction *)backAction;
- (void)setBackBarButtonItem:(UIBarButtonItem *)backBarButtonItem;
- (void)setBackButtonDisplayMode:(UINavigationItemBackButtonDisplayMode)backButtonDisplayMode;
- (void)setBackButtonTitle:(NSString *)backButtonTitle;
- (void)setCenterItemGroups:(NSArray *)centerItemGroups;
- (void)setCompactAppearance:(UINavigationBarAppearance *)compactAppearance;
- (void)setCompactScrollEdgeAppearance:(UINavigationBarAppearance *)compactScrollEdgeAppearance;
- (void)setContext:(id)a3;
- (void)setCustomizationIdentifier:(NSString *)customizationIdentifier;
- (void)setDocumentProperties:(UIDocumentProperties *)documentProperties;
- (void)setHidesBackButton:(BOOL)hidesBackButton;
- (void)setHidesBackButton:(BOOL)hidesBackButton animated:(BOOL)animated;
- (void)setHidesSearchBarWhenScrolling:(BOOL)hidesSearchBarWhenScrolling;
- (void)setLargeTitleDisplayMode:(UINavigationItemLargeTitleDisplayMode)largeTitleDisplayMode;
- (void)setLargeTitleInsets:(NSDirectionalEdgeInsets)a3;
- (void)setLeadingItemGroups:(NSArray *)leadingItemGroups;
- (void)setLeftBarButtonItem:(UIBarButtonItem *)item animated:(BOOL)animated;
- (void)setLeftBarButtonItem:(UIBarButtonItem *)leftBarButtonItem;
- (void)setLeftBarButtonItems:(NSArray *)items animated:(BOOL)animated;
- (void)setLeftBarButtonItems:(NSArray *)leftBarButtonItems;
- (void)setLeftItemsSupplementBackButton:(BOOL)leftItemsSupplementBackButton;
- (void)setNavigationBar:(id)a3;
- (void)setPinnedTrailingGroup:(UIBarButtonItemGroup *)pinnedTrailingGroup;
- (void)setPreferredSearchBarPlacement:(UINavigationItemSearchBarPlacement)preferredSearchBarPlacement;
- (void)setPrompt:(NSString *)prompt;
- (void)setRenameDelegate:(id)renameDelegate;
- (void)setRightBarButtonItem:(UIBarButtonItem *)item animated:(BOOL)animated;
- (void)setRightBarButtonItem:(UIBarButtonItem *)rightBarButtonItem;
- (void)setRightBarButtonItems:(NSArray *)items animated:(BOOL)animated;
- (void)setRightBarButtonItems:(NSArray *)rightBarButtonItems;
- (void)setScrollEdgeAppearance:(UINavigationBarAppearance *)scrollEdgeAppearance;
- (void)setSearchController:(UISearchController *)searchController;
- (void)setStandardAppearance:(UINavigationBarAppearance *)standardAppearance;
- (void)setStyle:(UINavigationItemStyle)style;
- (void)setTag:(int64_t)a3;
- (void)setTitle:(NSString *)title;
- (void)setTitleMenuProvider:(void *)titleMenuProvider;
- (void)setTitleView:(UIView *)titleView;
- (void)setTrailingItemGroups:(NSArray *)trailingItemGroups;
- (void)setUseRelativeLargeTitleInsets:(BOOL)a3;
- (void)set_alternateLargeTitles:(id)a3;
- (void)set_alwaysUseManualScrollEdgeAppearance:(BOOL)a3;
- (void)set_titleViewWidthForAnimations:(double)a3;
- (void)titleMenuProvider;
- (void)updateNavigationBarButtonsAnimated:(BOOL)a3;
@end

@implementation UINavigationItem

- (void)_setManualScrollEdgeAppearanceProgress:(double)a3
{
  self->_manualScrollEdgeAppearanceProgress = fmin(fmax(a3, 0.0), 1.0);
  id WeakRetained = objc_loadWeakRetained((id *)&self->__changeObserver);
  [WeakRetained navigationItemUpdatedScrollEdgeProgress:self];
}

- (UINavigationBar)_navigationBar
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationBar);
  return (UINavigationBar *)WeakRetained;
}

- (BOOL)hidesSearchBarWhenScrolling
{
  return (*(_WORD *)&self->_navigationItemFlags & 4) == 0;
}

- (_UINavigationBarItemStackEntry)_stackEntry
{
  return self->__stackEntry;
}

- (UINavigationItemLargeTitleDisplayMode)largeTitleDisplayMode
{
  return self->_largeTitleDisplayMode;
}

- (double)_manualScrollEdgeAppearanceProgress
{
  return self->_manualScrollEdgeAppearanceProgress;
}

- (UISearchController)_searchControllerIfAllowed
{
  return self->_searchController;
}

- (BOOL)_alwaysUseManualScrollEdgeAppearance
{
  return self->_alwaysUseManualScrollEdgeAppearance;
}

- (BOOL)_backgroundHidden
{
  return self->__backgroundHidden;
}

- (BOOL)_preserveSearchBarAcrossTransitions
{
  return self->__preserveSearchBarAcrossTransitions;
}

- (BOOL)_isManualScrollEdgeAppearanceEnabled
{
  return self->_manualScrollEdgeAppearanceEnabled;
}

- (NSString)prompt
{
  return self->_prompt;
}

- (_UINavigationBarPalette)_bottomPalette
{
  return self->_bottomPalette;
}

- (_UINavigationBarPalette)_topPalette
{
  return self->_topPalette;
}

- (BOOL)_hasInlineSearchBarForTraits:(id)a3
{
  return self->_searchController && _UINavigationItemUseInlineSearchLayoutForTraits(self, a3);
}

- (BOOL)_hasInlineSearchBar
{
  if (!self->_searchController) {
    return 0;
  }
  v2 = self;
  v3 = [(UINavigationItem *)v2 _navigationBar];
  v4 = [v3 traitCollection];
  BOOL v5 = _UINavigationItemUseInlineSearchLayoutForTraits(v2, v4);

  return v5;
}

- (UINavigationItemSearchBarPlacement)preferredSearchBarPlacement
{
  return self->_preferredSearchBarPlacement;
}

- (NSDirectionalEdgeInsets)largeTitleInsets
{
  double top = self->_largeTitleInsets.top;
  double leading = self->_largeTitleInsets.leading;
  double bottom = self->_largeTitleInsets.bottom;
  double trailing = self->_largeTitleInsets.trailing;
  result.double trailing = trailing;
  result.double bottom = bottom;
  result.double leading = leading;
  result.double top = top;
  return result;
}

- (BOOL)useRelativeLargeTitleInsets
{
  return self->_useRelativeLargeTitleInsets;
}

- (_UIBarButtonItemSearchBarGroup)_inlineSearchBarItemGroup
{
  if (!self->_inlineSearchBarItemGroup)
  {
    v3 = objc_alloc_init(_UIBarButtonItemSearchBarGroup);
    inlineSearchBarItemGroup = self->_inlineSearchBarItemGroup;
    self->_inlineSearchBarItemGroup = v3;
  }
  [(UINavigationItem *)self _updateSearchBarItemGroup];
  BOOL v5 = self->_inlineSearchBarItemGroup;
  return v5;
}

- (void)_updateSearchBarItemGroup
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v3 = [(UISearchController *)self->_searchController searchBar];
  if (self->_inlineSearchBarItemGroup
    && ([(UINavigationItem *)self _hasInlineSearchBar]
     || [v3 _isHostedInlineByNavigationBar]))
  {
    -[_UIBarButtonItemSearchBarGroup searchItem]((id *)&self->_inlineSearchBarItemGroup->super.super.isa);
    v4 = (UIBarButtonItem *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      BOOL v5 = v4;
      [(UIBarButtonItem *)v4 setCustomView:v3];
    }
    else
    {
      BOOL v5 = [[UIBarButtonItem alloc] initWithCustomView:v3];
      v10[0] = v5;
      v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
      [(_UIBarButtonItemSearchBarGroup *)self->_inlineSearchBarItemGroup setBarButtonItems:v6];
    }
    [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(_UIBarButtonItemSearchBarGroup *)self->_inlineSearchBarItemGroup setHidden:v3 == 0];
    [(UIBarButtonItemGroup *)self->_inlineSearchBarItemGroup _setShouldAlwaysCollapse:self->_preferredSearchBarPlacement == 4];
    int v7 = [v3 _requiresSearchTextField];
    inlineSearchBarItemGroup = self->_inlineSearchBarItemGroup;
    if (v7)
    {
      [(_UIBarButtonItemSearchBarGroup *)inlineSearchBarItemGroup setRepresentativeItem:0];
      objc_msgSend(v3, "_idealInlineWidthForLayoutState:", objc_msgSend(v3, "_layoutState"));
      -[UIBarButtonItem setWidth:](v5, "setWidth:");
    }
    else
    {
      v9 = [(UIBarButtonItemGroup *)inlineSearchBarItemGroup representativeItem];
      if (!v9)
      {
        v9 = [v3 _searchIconBarButtonItem];
        [(_UIBarButtonItemSearchBarGroup *)self->_inlineSearchBarItemGroup setRepresentativeItem:v9];
      }
      [v3 _idealInlineWidthForLayoutState:1];
      objc_msgSend(v9, "setWidth:");
      [v3 _idealInlineWidthForLayoutState:2];
      -[UIBarButtonItem setWidth:](v5, "setWidth:");
    }
  }
  else
  {
    [v3 setTranslatesAutoresizingMaskIntoConstraints:1];
    [(_UIBarButtonItemSearchBarGroup *)self->_inlineSearchBarItemGroup setHidden:1];
  }
}

- (NSString)title
{
  return self->_title;
}

- (_UINavigationItemRenameHandler)_dci_renameHandler
{
  return self->_renameHandler;
}

- (UINavigationItemStyle)style
{
  return self->_style;
}

- (NSString)customizationIdentifier
{
  return self->_customizationIdentifier;
}

- (UIView)titleView
{
  return self->_titleView;
}

- (NSString)_weeTitle
{
  return self->__weeTitle;
}

- (BOOL)hidesBackButton
{
  return *(_WORD *)&self->_navigationItemFlags & 1;
}

- (UIAction)backAction
{
  return self->_backAction;
}

- (NSArray)centerItemGroups
{
  if (self->_centerItemGroups) {
    return self->_centerItemGroups;
  }
  else {
    return (NSArray *)MEMORY[0x1E4F1CBF0];
  }
}

- (UIView)_largeTitleAccessoryView
{
  return self->__largeTitleAccessoryView;
}

- (void)titleMenuProvider
{
  return self->_titleMenuProvider;
}

- (UIDocumentProperties)documentProperties
{
  return self->_documentProperties;
}

- (BOOL)leftItemsSupplementBackButton
{
  return (*(_WORD *)&self->_navigationItemFlags >> 1) & 1;
}

- (unint64_t)_largeTitleTwoLineMode
{
  return self->__largeTitleTwoLineMode;
}

- (UIBarButtonItemGroup)pinnedTrailingGroup
{
  return self->_pinnedTrailingGroup;
}

- (double)_minimumDesiredHeightForBarMetrics:(int64_t)a3
{
  minimumDesiredHeights = self->_minimumDesiredHeights;
  if (!minimumDesiredHeights) {
    return 0.0;
  }
  v4 = [NSNumber numberWithInteger:a3];
  BOOL v5 = [(NSMutableDictionary *)minimumDesiredHeights objectForKeyedSubscript:v4];

  if (!v5) {
    return 0.0;
  }
  [v5 doubleValue];
  double v7 = v6;

  return v7;
}

- (unint64_t)_largeTitleAccessoryViewHorizontalAlignment
{
  return self->__largeTitleAccessoryViewHorizontalAlignment;
}

- (void)_getTrailingItems:(id *)a3 groups:(id *)a4
{
  if ([(NSArray *)self->_trailingItemGroups count])
  {
    id v7 = *a3;
    *a3 = 0;

    v8 = self->_trailingItemGroups;
  }
  else
  {
    if ([(NSArray *)self->_rightBarButtonItems count])
    {
      objc_storeStrong(a3, self->_rightBarButtonItems);
    }
    else
    {
      id v9 = *a3;
      *a3 = 0;
    }
    v8 = 0;
  }
  id v10 = *a4;
  *a4 = v8;
}

- (void)_getLeadingItems:(id *)a3 groups:(id *)a4
{
  if ([(NSArray *)self->_leadingItemGroups count])
  {
    id v7 = *a3;
    *a3 = 0;

    v8 = self->_leadingItemGroups;
  }
  else
  {
    if ([(NSArray *)self->_leftBarButtonItems count])
    {
      objc_storeStrong(a3, self->_leftBarButtonItems);
    }
    else
    {
      id v9 = *a3;
      *a3 = 0;
    }
    v8 = 0;
  }
  id v10 = *a4;
  *a4 = v8;
}

- (UIMenu)_dci_documentMenu
{
  return self->_documentMenu;
}

- (NSArray)_alternateLargeTitles
{
  return self->__alternateLargeTitles;
}

- (BOOL)_alignLargeTitleAccessoryViewToBaseline
{
  return self->__alignLargeTitleAccessoryViewToBaseline;
}

- (unint64_t)_navigationBarVisibility
{
  unint64_t preferredNavigationBarVisibility = self->__preferredNavigationBarVisibility;
  if (preferredNavigationBarVisibility == 2) {
    return 2;
  }
  if (preferredNavigationBarVisibility) {
    return 1;
  }
  return self->__navigationBarHidden;
}

- (void)_setTitleViewDataSource:(id)a3
{
  id v9 = a3;
  v4 = _UINavigationBarCastToAugmentedTitleView(self->_titleView);
  BOOL v5 = v4;
  if (v4)
  {
    if (v9)
    {
      id v6 = v9;
      id v7 = self;
      uint64_t v8 = 1;
    }
    else
    {
      id v6 = 0;
      id v7 = 0;
      uint64_t v8 = 0;
    }
    [v4 _setDataSource:v6 navigationItem:v7 titleLocation:v8];
  }
}

- (void)setHidesBackButton:(BOOL)hidesBackButton
{
}

- (void)setRightBarButtonItems:(NSArray *)rightBarButtonItems
{
}

- (void)_setLargeTitleAccessoryView:(id)a3 alignToBaseline:(BOOL)a4
{
}

- (NSArray)trailingItemGroups
{
  if (self->_trailingItemGroups) {
    return self->_trailingItemGroups;
  }
  else {
    return (NSArray *)MEMORY[0x1E4F1CBF0];
  }
}

- (NSArray)leadingItemGroups
{
  if (self->_leadingItemGroups) {
    return self->_leadingItemGroups;
  }
  else {
    return (NSArray *)MEMORY[0x1E4F1CBF0];
  }
}

- (id)_effectiveBackBarButtonItem
{
  backBarButtonItem = self->_backBarButtonItem;
  if (backBarButtonItem)
  {
    v3 = backBarButtonItem;
  }
  else
  {
    if (!self->_synthesizedBackBarButtonItem)
    {
      BOOL v5 = objc_alloc_init(UIBarButtonItem);
      synthesizedBackBarButtonItem = self->_synthesizedBackBarButtonItem;
      self->_synthesizedBackBarButtonItem = v5;
    }
    id v7 = [(UINavigationItem *)self _backButtonTitleAllowingGenericTitles:1];
    if (self->_backButtonDisplayMode == 2)
    {
      uint64_t v8 = (void *)MEMORY[0x1E4F1CBF0];
    }
    else
    {
      uint64_t v8 = [(UINavigationItem *)self _abbreviatedBackButtonTitles];
    }
    if (v7) {
      id v9 = v7;
    }
    else {
      id v9 = &stru_1ED0E84C0;
    }
    [(UIBarButtonItem *)self->_synthesizedBackBarButtonItem setTitle:v9];
    [(UIBarButtonItem *)self->_synthesizedBackBarButtonItem _setBackButtonAlternateTitles:v8];
    v3 = self->_synthesizedBackBarButtonItem;
  }
  return v3;
}

- (NSArray)_abbreviatedBackButtonTitles
{
  v8[2] = *MEMORY[0x1E4F143B8];
  abbreviatedBackButtonTitles = self->_abbreviatedBackButtonTitles;
  if (!abbreviatedBackButtonTitles)
  {
    v4 = _UINSLocalizedStringWithDefaultValue(@"Back", @"Back");
    v8[0] = v4;
    v8[1] = &stru_1ED0E84C0;
    BOOL v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:2];
    id v6 = self->_abbreviatedBackButtonTitles;
    self->_abbreviatedBackButtonTitles = v5;

    abbreviatedBackButtonTitles = self->_abbreviatedBackButtonTitles;
  }
  return abbreviatedBackButtonTitles;
}

- (id)_backButtonTitleAllowingGenericTitles:(BOOL)a3
{
  if (a3)
  {
    int64_t backButtonDisplayMode = self->_backButtonDisplayMode;
    if (backButtonDisplayMode == 1) {
      goto LABEL_9;
    }
    if (backButtonDisplayMode)
    {
LABEL_10:
      id v6 = &stru_1ED0E84C0;
      goto LABEL_11;
    }
  }
  backBarButtonItem = self->_backBarButtonItem;
  if (!backBarButtonItem
    || ([(UIBarButtonItem *)backBarButtonItem title],
        (id v6 = (__CFString *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    backButtonTitle = self->_backButtonTitle;
    if (backButtonTitle)
    {
      id v6 = backButtonTitle;
      goto LABEL_11;
    }
    id v6 = self->_title;
    if (!v6)
    {
LABEL_9:
      uint64_t v8 = [(UINavigationItem *)self _abbreviatedBackButtonTitles];
      id v6 = [v8 firstObject];

      if (v6) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
LABEL_11:
  return v6;
}

- (void)_setLargeTitleAccessoryView:(id)a3
{
}

- (void)setBackButtonTitle:(NSString *)backButtonTitle
{
}

- (id)_barButtonItemsToAddWhenAttemptingToAddBarButtonItems:(int)a3 forRight:
{
  id v6 = a2;
  id v7 = v6;
  if (a1)
  {
    id v8 = v6;
    id WeakRetained = objc_loadWeakRetained(a1 + 8);
    char v10 = [WeakRetained isLocked];
    if ((v10 & 1) == 0)
    {
      v3 = objc_loadWeakRetained(a1 + 8);
      if (([v3 _wasDecodedUnlockedWithNavigationControllerDelegate] & 1) == 0) {
        goto LABEL_25;
      }
    }
    id v11 = objc_loadWeakRetained(a1 + 8);
    char v12 = [v11 _lostNavigationControllerDelegate];

    if ((v10 & 1) == 0) {
    if ((v12 & 1) == 0)
    }
    {
      id v13 = objc_loadWeakRetained(a1 + 8);
      id WeakRetained = [v13 _effectiveDelegate];

      v3 = [WeakRetained disappearingViewController];
      if (!v3) {
        goto LABEL_25;
      }
      id v14 = objc_loadWeakRetained(a1 + 8);
      v15 = [v14 _stack];
      int v16 = [v15 state];

      if (v16) {
        goto LABEL_25;
      }
      v17 = [v3 _existingNavigationItem];
      v18 = [WeakRetained _nestedTopViewController];
      v19 = [v18 _existingNavigationItem];

      if (v17 == a1 && v19)
      {
        v38 = v17;
        v20 = [v19 rightBarButtonItems];
        id v43 = 0;
        v21 = _itemListExcludingOtherItemList(v8, v20, &v43);
        id v22 = v43;

        v39 = v19;
        v23 = [v19 leftBarButtonItems];
        id v42 = 0;
        _itemListExcludingOtherItemList(v21, v23, &v42);
        id v8 = (id)objc_claimAutoreleasedReturnValue();
        id v24 = v42;

        id v25 = v22;
        uint64_t v26 = [v24 count];
        if (!(v26 + [v22 count]))
        {
          v17 = v38;
          v19 = v39;
LABEL_23:

LABEL_24:
LABEL_25:

          goto LABEL_26;
        }
        v33 = NSString;
        uint64_t v34 = [v24 arrayByAddingObjectsFromArray:v22];
        v35 = @"left";
        BOOL v36 = a3 == 0;
        v28 = (void *)v34;
        if (!v36) {
          v35 = @"right";
        }
        v30 = [v33 stringWithFormat:@"%@ not added to %@BarButtonItems of %@", v34, v35, a1];
        UINavigationItemLogSettingUpSharedBarButtonItemsDuringTransition(v30);
        v17 = v38;
      }
      else
      {
        if (v19 != a1 || !v17) {
          goto LABEL_24;
        }
        v39 = v19;
        v27 = [v17 rightBarButtonItems];
        id v41 = 0;
        v28 = _itemListExcludingOtherItemList(v27, v8, &v41);
        id v25 = v41;

        v29 = [v17 leftBarButtonItems];
        id v40 = 0;
        v30 = _itemListExcludingOtherItemList(v29, v8, &v40);
        id v24 = v40;

        if ([v25 count])
        {
          v31 = [NSString stringWithFormat:@"%@ removed from rightBarButtonItems of %@", v25, v17];
          UINavigationItemLogSettingUpSharedBarButtonItemsDuringTransition(v31);

          [v17 setRightBarButtonItems:v28];
        }
        if ([v24 count])
        {
          v32 = [NSString stringWithFormat:@"%@ removed from leftBarButtonItems of %@", v24, v17];
          UINavigationItemLogSettingUpSharedBarButtonItemsDuringTransition(v32);

          [v17 setLeftBarButtonItems:v30];
        }
      }

      v19 = v39;
      goto LABEL_23;
    }
  }
  else
  {
    id v8 = 0;
  }
LABEL_26:

  return v8;
}

- (void)_setNavigationBar:(id)a3
{
}

- (void)_setChangeObserver:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->__changeObserver);

  BOOL v5 = obj;
  if (WeakRetained != obj)
  {
    id v6 = objc_loadWeakRetained((id *)&self->__changeObserver);

    objc_storeWeak((id *)&self->__changeObserver, obj);
    BOOL v5 = obj;
    if (!v6)
    {
      if (self->_searchController)
      {
        [(UINavigationItem *)self _messageChangeObserver:obj forTransitionFromSearchController:0];
        BOOL v5 = obj;
      }
    }
  }
}

- (void)_movingToTopOfStack
{
  if (self && (searchController = self->_searchController) != 0)
  {
    uint64_t v4 = [(UISearchController *)searchController searchBarPlacement];
    [(UINavigationItem *)self _hasInlineSearchBar];
    UINavigationItemSearchBarPlacement v5 = [(UINavigationItem *)self searchBarPlacement];
    p___int16 navigationItemFlags = &self->_navigationItemFlags;
    __int16 navigationItemFlags = (__int16)self->_navigationItemFlags;
    if (v4 != v5)
    {
      *(_WORD *)&self->___int16 navigationItemFlags = navigationItemFlags | 0x10;
      -[UINavigationItem _sendSearchBarPlacementChangeCallbackIfNecessaryWillChange:]((id *)&self->super.isa, 1);
      goto LABEL_7;
    }
  }
  else
  {
    p___int16 navigationItemFlags = &self->_navigationItemFlags;
    __int16 navigationItemFlags = (__int16)self->_navigationItemFlags;
  }
  *(_WORD *)p___int16 navigationItemFlags = navigationItemFlags & 0xFFEF;
LABEL_7:
  [(UISearchController *)self->_searchController _setNavigationItemCurrentlyDisplayingSearchController:self];
  id v8 = [(UISearchController *)self->_searchController searchBar];
  objc_msgSend(v8, "_setHostedInlineByNavigationBar:", -[UINavigationItem _hasInlineSearchBar](self, "_hasInlineSearchBar"));
}

- (UINavigationItemSearchBarPlacement)searchBarPlacement
{
  if (![(UINavigationItem *)self _hasInlineSearchBar]) {
    return 2;
  }
  int64_t preferredSearchBarPlacement = self->_preferredSearchBarPlacement;
  if (preferredSearchBarPlacement == 4) {
    UINavigationItemSearchBarPlacement v4 = 4;
  }
  else {
    UINavigationItemSearchBarPlacement v4 = UINavigationItemSearchBarPlacementInline;
  }
  if (preferredSearchBarPlacement == 3) {
    return 3;
  }
  else {
    return v4;
  }
}

- (void)_movedToTopOfStack:(BOOL)a3
{
  if (a3)
  {
    [(UISearchController *)self->_searchController _setNavigationItemCurrentlyDisplayingSearchController:self];
    UINavigationItemSearchBarPlacement v4 = [(UISearchController *)self->_searchController searchBar];
    [v4 _resetIfNecessaryForNavigationBarHosting:1];

    if ((*(_WORD *)&self->_navigationItemFlags & 0x10) != 0) {
      -[UINavigationItem _sendSearchBarPlacementChangeCallbackIfNecessaryWillChange:]((id *)&self->super.isa, 0);
    }
  }
  *(_WORD *)&self->_navigationItemFlags &= ~0x10u;
}

- (void)_setStackEntry:(id)a3
{
  self->__stackEntry = (_UINavigationBarItemStackEntry *)a3;
}

- (void)_movingFromTopOfStack
{
  if (!self || (searchController = self->_searchController) == 0)
  {
    __int16 navigationItemFlags = (__int16)self->_navigationItemFlags;
    p___int16 navigationItemFlags = &self->_navigationItemFlags;
    __int16 v6 = navigationItemFlags;
    goto LABEL_6;
  }
  uint64_t v4 = [(UISearchController *)searchController searchBarPlacement];
  [(UINavigationItem *)self _hasInlineSearchBar];
  UINavigationItemSearchBarPlacement v5 = [(UINavigationItem *)self searchBarPlacement];
  __int16 v6 = (__int16)self->_navigationItemFlags;
  if (v4 == v5)
  {
    p___int16 navigationItemFlags = &self->_navigationItemFlags;
LABEL_6:
    *(_WORD *)p___int16 navigationItemFlags = v6 & 0xFFDF;
    return;
  }
  *(_WORD *)&self->___int16 navigationItemFlags = v6 | 0x20;
  -[UINavigationItem _sendSearchBarPlacementChangeCallbackIfNecessaryWillChange:]((id *)&self->super.isa, 1);
}

- (void)_movedFromTopOfStack:(BOOL)a3
{
  if (a3)
  {
    if ((*(_WORD *)&self->_navigationItemFlags & 0x20) != 0) {
      -[UINavigationItem _sendSearchBarPlacementChangeCallbackIfNecessaryWillChange:]((id *)&self->super.isa, 0);
    }
  }
  else
  {
    [(UISearchController *)self->_searchController _setNavigationItemCurrentlyDisplayingSearchController:self];
  }
  *(_WORD *)&self->_navigationItemFlags &= ~0x20u;
}

- (UINavigationBarAppearance)scrollEdgeAppearance
{
  return self->_scrollEdgeAppearance;
}

- (UINavigationBarAppearance)standardAppearance
{
  return self->_standardAppearance;
}

- (UINavigationBarAppearance)compactAppearance
{
  return self->_compactAppearance;
}

- (void)setLeftBarButtonItems:(NSArray *)leftBarButtonItems
{
}

- (void)_setSupportsTwoLineLargeTitles:(BOOL)a3
{
}

- (UINavigationBarAppearance)compactScrollEdgeAppearance
{
  return self->_compactScrollEdgeAppearance;
}

- (UIBarButtonItem)backBarButtonItem
{
  return self->_backBarButtonItem;
}

- (void)setLargeTitleDisplayMode:(UINavigationItemLargeTitleDisplayMode)largeTitleDisplayMode
{
  if (self->_largeTitleDisplayMode != largeTitleDisplayMode)
  {
    self->_largeTitleDisplayMode = largeTitleDisplayMode;
    id WeakRetained = objc_loadWeakRetained((id *)&self->__changeObserver);
    [WeakRetained navigationItemUpdatedLargeTitleDisplayMode:self];
  }
}

- (id)_barButtonForBackButtonIndicator
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = self->_leftBarButtonItems;
  id v3 = (id)[(NSArray *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        __int16 v6 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if ((objc_msgSend(v6, "isHidden", (void)v8) & 1) == 0
          && (([v6 _showsBackButtonIndicator] & 1) != 0
           || [v6 _actsAsFakeBackButton]))
        {
          id v3 = v6;
          goto LABEL_13;
        }
      }
      id v3 = (id)[(NSArray *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  return v3;
}

- (void)setScrollEdgeAppearance:(UINavigationBarAppearance *)scrollEdgeAppearance
{
  uint64_t v4 = scrollEdgeAppearance;
  UINavigationItemSearchBarPlacement v5 = self->_scrollEdgeAppearance;
  __int16 v6 = v4;
  uint64_t v13 = v6;
  if (v5 == v6)
  {

    goto LABEL_12;
  }
  if (v6 && v5)
  {
    BOOL v7 = [(UIBarAppearance *)v5 isEqual:v6];

    if (v7) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  long long v8 = self->_scrollEdgeAppearance;
  if (v8) {
    objc_storeWeak((id *)&v8->super._changeObserver, 0);
  }
  long long v9 = [(UIBarAppearance *)v13 copy];
  long long v10 = self->_scrollEdgeAppearance;
  self->_scrollEdgeAppearance = v9;

  id WeakRetained = objc_loadWeakRetained((id *)&self->__changeObserver);
  [WeakRetained navigationItem:self appearance:self->_scrollEdgeAppearance categoriesChanged:-1];

  char v12 = self->_scrollEdgeAppearance;
  if (v12) {
    objc_storeWeak((id *)&v12->super._changeObserver, self);
  }
LABEL_12:
}

- (void)appearance:(id)a3 categoriesChanged:(int64_t)a4
{
  p_changeObserver = &self->__changeObserver;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_changeObserver);
  [WeakRetained navigationItem:self appearance:v7 categoriesChanged:a4];
}

- (void)setCustomizationIdentifier:(NSString *)customizationIdentifier
{
  uint64_t v4 = customizationIdentifier;
  UINavigationItemSearchBarPlacement v5 = self->_customizationIdentifier;
  __int16 v6 = v4;
  id v14 = v6;
  if (v5 == v6)
  {

    id v9 = v14;
LABEL_10:

    long long v8 = v14;
    goto LABEL_11;
  }
  if (!v6 || !v5)
  {

    goto LABEL_8;
  }
  char v7 = [(NSString *)v5 isEqual:v6];

  long long v8 = v14;
  if ((v7 & 1) == 0)
  {
LABEL_8:
    long long v10 = (NSString *)[(NSString *)v14 copy];
    long long v11 = self->_customizationIdentifier;
    self->_customizationIdentifier = v10;

    id WeakRetained = objc_loadWeakRetained((id *)&self->__changeObserver);
    char v13 = objc_opt_respondsToSelector();

    long long v8 = v14;
    if ((v13 & 1) == 0) {
      goto LABEL_11;
    }
    id v9 = objc_loadWeakRetained((id *)&self->__changeObserver);
    [v9 navigationItemUpdatedCenterBarButtonItems:self animated:0];
    goto LABEL_10;
  }
LABEL_11:
}

- (void)setLargeTitleInsets:(NSDirectionalEdgeInsets)a3
{
  self->_largeTitleInsets = a3;
}

- (void)setPreferredSearchBarPlacement:(UINavigationItemSearchBarPlacement)preferredSearchBarPlacement
{
  if (self->_preferredSearchBarPlacement != preferredSearchBarPlacement)
  {
    self->_int64_t preferredSearchBarPlacement = preferredSearchBarPlacement;
    [(UINavigationItem *)self _updateSearchBarItemGroup];
    uint64_t v4 = [(UINavigationItem *)self _searchControllerIfAllowed];
    UINavigationItemSearchBarPlacement v5 = [v4 searchBar];
    objc_msgSend(v5, "_setHostedInlineByNavigationBar:", -[UINavigationItem _hasInlineSearchBar](self, "_hasInlineSearchBar"));

    id WeakRetained = objc_loadWeakRetained((id *)&self->__changeObserver);
    [WeakRetained navigationItemUpdatedSearchController:self oldSearchController:self->_searchController];
  }
}

- (void)setSearchController:(UISearchController *)searchController
{
  UINavigationItemSearchBarPlacement v5 = searchController;
  if (self->_searchController != v5)
  {
    long long v11 = v5;
    __int16 v6 = [(UISearchController *)v5 searchBar];
    [v6 _resetIfNecessaryForNavigationBarHosting:1];

    char v7 = self->_searchController;
    objc_storeStrong((id *)&self->_searchController, searchController);
    long long v8 = [(UISearchController *)v11 searchBar];
    objc_msgSend(v8, "_setHostedInlineByNavigationBar:", -[UINavigationItem _hasInlineSearchBar](self, "_hasInlineSearchBar"));

    inlineSearchBarItemGroup = self->_inlineSearchBarItemGroup;
    self->_inlineSearchBarItemGroup = 0;

    id WeakRetained = objc_loadWeakRetained((id *)&self->__changeObserver);
    if (WeakRetained) {
      [(UINavigationItem *)self _messageChangeObserver:WeakRetained forTransitionFromSearchController:v7];
    }

    UINavigationItemSearchBarPlacement v5 = v11;
  }
}

- (void)set_alternateLargeTitles:(id)a3
{
}

- (void)setAdditionalOverflowItems:(UIDeferredMenuElement *)additionalOverflowItems
{
  UINavigationItemSearchBarPlacement v5 = additionalOverflowItems;
  if (self->_additionalOverflowItems != v5)
  {
    char v7 = v5;
    objc_storeStrong((id *)&self->_additionalOverflowItems, additionalOverflowItems);
    id WeakRetained = objc_loadWeakRetained((id *)&self->__changeObserver);
    if (objc_opt_respondsToSelector()) {
      [WeakRetained navigationItemUpdatedAdditionalOverflowItems:self];
    }
    else {
      [WeakRetained navigationItemUpdatedRightBarButtonItems:self animated:0];
    }

    UINavigationItemSearchBarPlacement v5 = v7;
  }
}

- (UIDeferredMenuElement)additionalOverflowItems
{
  return self->_additionalOverflowItems;
}

- (void)setPinnedTrailingGroup:(UIBarButtonItemGroup *)pinnedTrailingGroup
{
  UINavigationItemSearchBarPlacement v5 = pinnedTrailingGroup;
  if (self->_pinnedTrailingGroup != v5)
  {
    char v7 = v5;
    objc_storeStrong((id *)&self->_pinnedTrailingGroup, pinnedTrailingGroup);
    id WeakRetained = objc_loadWeakRetained((id *)&self->__changeObserver);
    [WeakRetained navigationItemUpdatedRightBarButtonItems:self animated:0];

    UINavigationItemSearchBarPlacement v5 = v7;
  }
}

- (void)_updateViewsForBarSizeChangeAndApply:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(NSArray *)self->_leftBarButtonItems count]) {
    int v5 = [(UINavigationItem *)self _accumulateViewsFromItems:self->_leftBarButtonItems isLeft:1 refreshViews:0];
  }
  else {
    int v5 = 0;
  }
  if ([(NSArray *)self->_rightBarButtonItems count]) {
    v5 |= [(UINavigationItem *)self _accumulateViewsFromItems:self->_rightBarButtonItems isLeft:0 refreshViews:0];
  }
  if (objc_opt_respondsToSelector())
  {
    titleView = self->_titleView;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationBar);
    -[UIView updateForMiniBarState:](titleView, "updateForMiniBarState:", [WeakRetained isMinibar]);
  }
  if ((v5 & v3) == 1)
  {
    [(UINavigationItem *)self updateNavigationBarButtonsAnimated:0];
  }
}

- (BOOL)_accumulateViewsFromItems:(id)a3 isLeft:(BOOL)a4 refreshViews:(BOOL)a5
{
  BOOL v54 = a5;
  BOOL v51 = a4;
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  location = (id *)&self->_navigationBar;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationBar);
  long long v8 = WeakRetained;
  if (!WeakRetained || ([WeakRetained _isAlwaysHidden] & 1) != 0)
  {
    LOBYTE(v9) = 0;
    goto LABEL_63;
  }
  v48 = self;
  uint64_t v10 = [v8 isMinibar];
  uint64_t v9 = [v6 count];
  if (!v9)
  {
    long long v11 = 0;
    char v12 = 0;
    uint64_t v41 = 0;
    goto LABEL_59;
  }
  long long v11 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v9];
  char v12 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v9];
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id v13 = v6;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v56 objects:v60 count:16];
  if (!v14)
  {

    char v42 = 0;
    uint64_t v41 = 0;
    goto LABEL_57;
  }
  uint64_t v15 = v14;
  id obj = v13;
  v53 = v12;
  v50 = v11;
  id v45 = v6;
  uint64_t v55 = 0;
  char v16 = 0;
  char v49 = 0;
  uint64_t v17 = *(void *)v57;
  v47 = v8;
  v18 = v48;
  do
  {
    for (uint64_t i = 0; i != v15; ++i)
    {
      if (*(void *)v57 != v17) {
        objc_enumerationMutation(obj);
      }
      v20 = *(void **)(*((void *)&v56 + 1) + 8 * i);
      if (![v20 isSystemItem]
        || [v20 systemItem] != 6 && objc_msgSend(v20, "systemItem") != 5)
      {
        int v24 = [v20 isCustomViewItem];
        uint64_t v25 = [v20 view];
        uint64_t v26 = (void *)v25;
        if (v54)
        {
          uint64_t v27 = [v20 createViewForNavigationItem:v18];

          if (v27)
          {
            [v20 setView:v27];
            char v49 = 1;
            uint64_t v26 = (void *)v27;
            goto LABEL_46;
          }
LABEL_30:
          [v20 setIsMinibarView:v10];
          uint64_t v26 = 0;
LABEL_50:

          continue;
        }
        if (v25)
        {
          if ([v20 isSystemItem])
          {
            if ((v24 & 1) == 0)
            {
              if (v10 == [v20 isMinibarView]) {
                goto LABEL_22;
              }
LABEL_41:
              id v35 = objc_loadWeakRetained(location);
              int v36 = [v35 _hasLegacyProvider];

              if (v36)
              {
                v37 = [v26 superview];
                if (v37) {
                  [v26 removeFromSuperview];
                }
                uint64_t v38 = [v26 isHidden];
                v39 = [v20 createViewForNavigationItem:v18];

                [v20 setView:v39];
                [v39 setHidden:v38];

                char v49 = 1;
                uint64_t v26 = v39;
                long long v8 = v47;
                v18 = v48;
                goto LABEL_38;
              }
LABEL_45:
              long long v8 = v47;
LABEL_46:
              [v20 setIsMinibarView:v10];
LABEL_47:
              objc_msgSend(v26, "setSemanticContentAttribute:", objc_msgSend(v8, "semanticContentAttribute"));
              objc_msgSend(v26, "_uinavigationbar_prepareToAppearInNavigationItem:onLeft:", v18, v51);
              [v50 addObject:v26];
              if ((v16 & 1) == 0)
              {
                id v40 = [MEMORY[0x1E4F1CA98] null];
                [v53 addObject:v40];

                v18 = v48;
              }
              char v16 = 0;
              goto LABEL_50;
            }
          }
          else
          {
            v31 = [v20 landscapeImagePhone];
            v32 = v31;
            if (v31) {
              char v33 = v24;
            }
            else {
              char v33 = 1;
            }
            if ((v33 & 1) == 0)
            {
              int v34 = [v20 isMinibarView];

              if (v10 != v34) {
                goto LABEL_41;
              }
LABEL_22:
              objc_opt_respondsToSelector();
              goto LABEL_45;
            }

            long long v8 = v47;
          }
          if ((objc_opt_respondsToSelector() & v24 & 1) == 0) {
            goto LABEL_46;
          }
        }
        else if ((objc_opt_respondsToSelector() & v24) != 1)
        {
          uint64_t v30 = [v20 createViewForNavigationItem:v18];
          if (!v30) {
            goto LABEL_30;
          }
          uint64_t v26 = (void *)v30;
          [v20 setView:v30];
          char v49 = 1;
          goto LABEL_46;
        }
        [v26 updateForMiniBarState:v10];
LABEL_38:
        [v20 setIsMinibarView:v10];
        if (!v26) {
          goto LABEL_50;
        }
        goto LABEL_47;
      }
      if (v16)
      {
        v21 = [v53 lastObject];
        id v22 = v21;
        v23 = v20;
      }
      else
      {
        id v22 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v20, 0);
        v21 = v53;
        v23 = v22;
      }
      [v21 addObject:v23];

      uint64_t v28 = [v20 systemItem];
      uint64_t v29 = v55;
      if (v28 == 5) {
        uint64_t v29 = v55 + 1;
      }
      uint64_t v55 = v29;
      char v16 = 1;
    }
    uint64_t v15 = [obj countByEnumeratingWithState:&v56 objects:v60 count:16];
  }
  while (v15);

  id v6 = v45;
  long long v11 = v50;
  char v12 = v53;
  uint64_t v41 = v55;
  char v42 = v49;
  if ((v16 & 1) == 0)
  {
LABEL_57:
    id v43 = [MEMORY[0x1E4F1CA98] null];
    [v12 addObject:v43];
  }
  LOBYTE(v9) = v42 & 1;
LABEL_59:
  if (v51)
  {
    [(UINavigationItem *)v48 _setCustomLeftViews:v11];
    [(UINavigationItem *)v48 _setLeftItemSpaceList:v12];
    [(UINavigationItem *)v48 _setLeftFlexibleSpaceCount:v41];
  }
  else
  {
    [(UINavigationItem *)v48 _setCustomRightViews:v11];
    [(UINavigationItem *)v48 _setRightItemSpaceList:v12];
    [(UINavigationItem *)v48 _setRightFlexibleSpaceCount:v41];
  }

LABEL_63:
  return v9;
}

- (UINavigationBar)navigationBar
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationBar);
  return (UINavigationBar *)WeakRetained;
}

- (void)_setRightItemSpaceList:(id)a3
{
}

- (void)_setRightFlexibleSpaceCount:(unint64_t)a3
{
  self->__rightFlexibleSpaceCount = a3;
}

- (void)_setCustomLeftViews:(id)a3
{
  uint64_t v4 = (NSArray *)[a3 copy];
  customLeftViews = self->_customLeftViews;
  self->_customLeftViews = v4;
}

- (void)_setLeftItemSpaceList:(id)a3
{
}

- (void)_setLeftFlexibleSpaceCount:(unint64_t)a3
{
  self->__leftFlexibleSpaceCount = a3;
}

- (void)setLeftBarButtonItems:(NSArray *)items animated:(BOOL)animated
{
  BOOL v4 = animated;
  -[UINavigationItem _barButtonItemsToAddWhenAttemptingToAddBarButtonItems:forRight:]((id *)&self->super.isa, items, 0);
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  if (!-[NSArray count](self->_leftBarButtonItems, "count") && ![v15 count])
  {
    uint64_t v14 = (NSArray *)v15;
    leftBarButtonItems = self->_leftBarButtonItems;
    self->_leftBarButtonItems = v14;
    goto LABEL_14;
  }
  id v6 = self->_leftBarButtonItems;
  char v7 = (NSArray *)v15;
  leftBarButtonItems = v7;
  if (v6 == v7)
  {

LABEL_14:
    goto LABEL_15;
  }
  if (!v7 || !v6)
  {

LABEL_10:
    _updateItemOwners(self->_leftBarButtonItems, 0);
    uint64_t v10 = (NSArray *)[(NSArray *)leftBarButtonItems copy];
    long long v11 = self->_leftBarButtonItems;
    self->_leftBarButtonItems = v10;

    leadingItemGroups = self->_leadingItemGroups;
    self->_leadingItemGroups = 0;

    _updateItemOwners(self->_leftBarButtonItems, self);
    id WeakRetained = (NSArray *)objc_loadWeakRetained((id *)&self->__changeObserver);
    leftBarButtonItems = WeakRetained;
    if (WeakRetained)
    {
      [(NSArray *)WeakRetained navigationItemUpdatedLeftBarButtonItems:self animated:v4];
    }
    else
    {
      [(UINavigationItem *)self _setCustomLeftViews:0];
      [(UINavigationItem *)self updateNavigationBarButtonsAnimated:v4];
    }
    goto LABEL_14;
  }
  char v9 = [(NSArray *)v6 isEqual:v7];

  if ((v9 & 1) == 0) {
    goto LABEL_10;
  }
LABEL_15:
}

- (void)setLeftBarButtonItem:(UIBarButtonItem *)item animated:(BOOL)animated
{
  BOOL v4 = animated;
  v16[1] = *MEMORY[0x1E4F143B8];
  id v6 = item;
  if ([(UIBarButtonItem *)v6 isSystemItem]
    && ([(UIBarButtonItem *)v6 systemItem] == 5 || [(UIBarButtonItem *)v6 systemItem] == 6))
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Fixed and flexible space items not allowed as individual navigation bar button item. Please use the leftBarButtonItems (that's plural) property."];
  }
  if (v6)
  {
    v16[0] = v6;
    char v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
    long long v8 = -[UINavigationItem _barButtonItemsToAddWhenAttemptingToAddBarButtonItems:forRight:]((id *)&self->super.isa, v7, 0);
    char v9 = [v8 firstObject];
  }
  else
  {
    char v9 = 0;
  }
  uint64_t v10 = [(UINavigationItem *)self leftBarButtonItem];

  if (v9 != v10)
  {
    _updateItemOwners(self->_leftBarButtonItems, 0);
    _itemListUpdatingFirstItem(self->_leftBarButtonItems, v9);
    long long v11 = (NSArray *)objc_claimAutoreleasedReturnValue();
    leftBarButtonItems = self->_leftBarButtonItems;
    self->_leftBarButtonItems = v11;

    leadingItemGroups = self->_leadingItemGroups;
    self->_leadingItemGroups = 0;

    _updateItemOwners(self->_leftBarButtonItems, self);
    id WeakRetained = objc_loadWeakRetained((id *)&self->__changeObserver);
    id v15 = WeakRetained;
    if (WeakRetained)
    {
      [WeakRetained navigationItemUpdatedLeftBarButtonItems:self animated:v4];
    }
    else
    {
      [(UINavigationItem *)self _setCustomLeftViews:0];
      [(UINavigationItem *)self updateNavigationBarButtonsAnimated:v4];
    }
  }
}

- (UIBarButtonItem)leftBarButtonItem
{
  v2 = [(UINavigationItem *)self leftBarButtonItems];
  BOOL v3 = [v2 firstObject];

  return (UIBarButtonItem *)v3;
}

- (NSArray)leftBarButtonItems
{
  return self->_leftBarButtonItems;
}

- (BOOL)_allowsInteractivePop
{
  return (*(_WORD *)&self->_navigationItemFlags & 0x100) == 0;
}

- (void)setLeftBarButtonItem:(UIBarButtonItem *)leftBarButtonItem
{
}

- (void)setRightBarButtonItem:(UIBarButtonItem *)rightBarButtonItem
{
}

- (void)setRightBarButtonItem:(UIBarButtonItem *)item animated:(BOOL)animated
{
  BOOL v4 = animated;
  v16[1] = *MEMORY[0x1E4F143B8];
  id v6 = item;
  if ([(UIBarButtonItem *)v6 isSystemItem]
    && ([(UIBarButtonItem *)v6 systemItem] == 5 || [(UIBarButtonItem *)v6 systemItem] == 6))
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Fixed and flexible space items not allowed as individual navigation bar button item. Please use the rightBarButtonItems (that's plural) property."];
  }
  if (v6)
  {
    v16[0] = v6;
    char v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
    long long v8 = -[UINavigationItem _barButtonItemsToAddWhenAttemptingToAddBarButtonItems:forRight:]((id *)&self->super.isa, v7, 1);
    char v9 = [v8 firstObject];
  }
  else
  {
    char v9 = 0;
  }
  uint64_t v10 = [(UINavigationItem *)self rightBarButtonItem];

  if (v9 != v10)
  {
    _updateItemOwners(self->_rightBarButtonItems, 0);
    _itemListUpdatingFirstItem(self->_rightBarButtonItems, v9);
    long long v11 = (NSArray *)objc_claimAutoreleasedReturnValue();
    rightBarButtonItems = self->_rightBarButtonItems;
    self->_rightBarButtonItems = v11;

    trailingItemGroups = self->_trailingItemGroups;
    self->_trailingItemGroups = 0;

    _updateItemOwners(self->_rightBarButtonItems, self);
    id WeakRetained = objc_loadWeakRetained((id *)&self->__changeObserver);
    id v15 = WeakRetained;
    if (WeakRetained)
    {
      [WeakRetained navigationItemUpdatedRightBarButtonItems:self animated:v4];
    }
    else
    {
      [(UINavigationItem *)self _setCustomRightViews:0];
      [(UINavigationItem *)self updateNavigationBarButtonsAnimated:v4];
    }
  }
}

- (void)setRightBarButtonItems:(NSArray *)items animated:(BOOL)animated
{
  BOOL v4 = animated;
  -[UINavigationItem _barButtonItemsToAddWhenAttemptingToAddBarButtonItems:forRight:]((id *)&self->super.isa, items, 1);
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  if (!-[NSArray count](self->_rightBarButtonItems, "count") && ![v15 count])
  {
    uint64_t v14 = (NSArray *)v15;
    rightBarButtonItems = self->_rightBarButtonItems;
    self->_rightBarButtonItems = v14;
    goto LABEL_14;
  }
  id v6 = self->_rightBarButtonItems;
  char v7 = (NSArray *)v15;
  rightBarButtonItems = v7;
  if (v6 == v7)
  {

LABEL_14:
    goto LABEL_15;
  }
  if (!v7 || !v6)
  {

LABEL_10:
    _updateItemOwners(self->_rightBarButtonItems, 0);
    uint64_t v10 = (NSArray *)[(NSArray *)rightBarButtonItems copy];
    long long v11 = self->_rightBarButtonItems;
    self->_rightBarButtonItems = v10;

    trailingItemGroups = self->_trailingItemGroups;
    self->_trailingItemGroups = 0;

    _updateItemOwners(self->_rightBarButtonItems, self);
    id WeakRetained = (NSArray *)objc_loadWeakRetained((id *)&self->__changeObserver);
    rightBarButtonItems = WeakRetained;
    if (WeakRetained)
    {
      [(NSArray *)WeakRetained navigationItemUpdatedRightBarButtonItems:self animated:v4];
    }
    else
    {
      [(UINavigationItem *)self _setCustomRightViews:0];
      [(UINavigationItem *)self updateNavigationBarButtonsAnimated:v4];
    }
    goto LABEL_14;
  }
  char v9 = [(NSArray *)v6 isEqual:v7];

  if ((v9 & 1) == 0) {
    goto LABEL_10;
  }
LABEL_15:
}

- (void)setCenterItemGroups:(NSArray *)centerItemGroups
{
  BOOL v4 = centerItemGroups;
  if (v4) {
    int v5 = v4;
  }
  else {
    int v5 = (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  id v6 = self->_centerItemGroups;
  char v7 = v5;
  uint64_t v14 = v7;
  if (v6 == v7)
  {

    id v9 = v14;
LABEL_12:

    goto LABEL_13;
  }
  if (!v6)
  {

    goto LABEL_10;
  }
  char v8 = [(NSArray *)v6 isEqual:v7];

  if ((v8 & 1) == 0)
  {
LABEL_10:
    _updateItemGroupOwners(self->_centerItemGroups, 0);
    uint64_t v10 = (NSArray *)[(NSArray *)v14 copy];
    long long v11 = self->_centerItemGroups;
    self->_centerItemGroups = v10;

    _updateItemGroupOwners(self->_centerItemGroups, self);
    id WeakRetained = objc_loadWeakRetained((id *)&self->__changeObserver);
    char v13 = objc_opt_respondsToSelector();

    if ((v13 & 1) == 0) {
      goto LABEL_13;
    }
    id v9 = objc_loadWeakRetained((id *)&self->__changeObserver);
    [v9 navigationItemUpdatedCenterBarButtonItems:self animated:0];
    goto LABEL_12;
  }
LABEL_13:
}

- (void)setLeadingItemGroups:(NSArray *)leadingItemGroups
{
  BOOL v4 = leadingItemGroups;
  if (v4) {
    int v5 = v4;
  }
  else {
    int v5 = (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  id v6 = self->_leadingItemGroups;
  char v7 = v5;
  uint64_t v14 = v7;
  if (v6 == v7)
  {

    id WeakRetained = v14;
LABEL_11:

    id v9 = v14;
    goto LABEL_12;
  }
  if (!v6)
  {

    goto LABEL_10;
  }
  char v8 = [(NSArray *)v6 isEqual:v7];

  id v9 = v14;
  if ((v8 & 1) == 0)
  {
LABEL_10:
    _updateItemGroupOwners(self->_leadingItemGroups, 0);
    long long v11 = (NSArray *)[(NSArray *)v14 copy];
    char v12 = self->_leadingItemGroups;
    self->_leadingItemGroups = v11;

    _updateItemGroupOwners(self->_leadingItemGroups, self);
    leftBarButtonItems = self->_leftBarButtonItems;
    self->_leftBarButtonItems = 0;

    id WeakRetained = objc_loadWeakRetained((id *)&self->__changeObserver);
    [WeakRetained navigationItemUpdatedLeftBarButtonItems:self animated:0];
    goto LABEL_11;
  }
LABEL_12:
}

- (void)setTrailingItemGroups:(NSArray *)trailingItemGroups
{
  BOOL v4 = trailingItemGroups;
  if (v4) {
    int v5 = v4;
  }
  else {
    int v5 = (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  id v6 = self->_trailingItemGroups;
  char v7 = v5;
  uint64_t v14 = v7;
  if (v6 == v7)
  {

    id WeakRetained = v14;
LABEL_11:

    id v9 = v14;
    goto LABEL_12;
  }
  if (!v6)
  {

    goto LABEL_10;
  }
  char v8 = [(NSArray *)v6 isEqual:v7];

  id v9 = v14;
  if ((v8 & 1) == 0)
  {
LABEL_10:
    _updateItemGroupOwners(self->_trailingItemGroups, 0);
    long long v11 = (NSArray *)[(NSArray *)v14 copy];
    char v12 = self->_trailingItemGroups;
    self->_trailingItemGroups = v11;

    _updateItemGroupOwners(self->_trailingItemGroups, self);
    rightBarButtonItems = self->_rightBarButtonItems;
    self->_rightBarButtonItems = 0;

    id WeakRetained = objc_loadWeakRetained((id *)&self->__changeObserver);
    [WeakRetained navigationItemUpdatedRightBarButtonItems:self animated:0];
    goto LABEL_11;
  }
LABEL_12:
}

- (UIBarButtonItem)rightBarButtonItem
{
  v2 = [(UINavigationItem *)self rightBarButtonItems];
  BOOL v3 = [v2 firstObject];

  return (UIBarButtonItem *)v3;
}

- (NSArray)rightBarButtonItems
{
  return self->_rightBarButtonItems;
}

- (BOOL)_allowsInteractivePopWhenNavigationBarHidden
{
  return (*(_WORD *)&self->_navigationItemFlags >> 9) & 1;
}

- (void)_setCustomRightViews:(id)a3
{
  BOOL v4 = (NSArray *)[a3 copy];
  customRightViews = self->_customRightViews;
  self->_customRightViews = v4;
}

- (void)_setPreserveSearchBarAcrossTransitions:(BOOL)a3
{
  self->__preserveSearchBarAcrossTransitions = a3;
}

- (void)setDocumentProperties:(UIDocumentProperties *)documentProperties
{
  int v5 = documentProperties;
  id v6 = self->_documentProperties;
  if (v6 != v5)
  {
    char v8 = v5;
    [(UIDocumentProperties *)v6 _setAssociatedNavigationItem:0];
    objc_storeStrong((id *)&self->_documentProperties, documentProperties);
    [(UIDocumentProperties *)self->_documentProperties _setAssociatedNavigationItem:self];
    id WeakRetained = objc_loadWeakRetained((id *)&self->__changeObserver);
    [WeakRetained navigationItemUpdatedTitleContent:self animated:0];

    int v5 = v8;
  }
}

- (UINavigationItem)init
{
  v3.receiver = self;
  v3.super_class = (Class)UINavigationItem;
  return [(UINavigationItem *)&v3 init];
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)UINavigationItem;
  [(UINavigationItem *)&v2 dealloc];
}

- (void)setBackAction:(UIAction *)backAction
{
  if (self->_backAction != backAction)
  {
    BOOL v4 = (UIAction *)[(UIAction *)backAction copy];
    int v5 = self->_backAction;
    self->_backAction = v4;

    id WeakRetained = objc_loadWeakRetained((id *)&self->__changeObserver);
    [WeakRetained navigationItemUpdatedTitleContent:self animated:0];
  }
}

- (void)_setWeeTitle:(id)a3
{
  id v7 = a3;
  if (!-[NSString isEqualToString:](self->__weeTitle, "isEqualToString:"))
  {
    BOOL v4 = (NSString *)[v7 copy];
    weeTitle = self->__weeTitle;
    self->__weeTitle = v4;

    id WeakRetained = objc_loadWeakRetained((id *)&self->__changeObserver);
    [WeakRetained navigationItemUpdatedTitleContent:self animated:0];
  }
}

- (void)setBackButtonDisplayMode:(UINavigationItemBackButtonDisplayMode)backButtonDisplayMode
{
  if (self->_backButtonDisplayMode != backButtonDisplayMode)
  {
    self->_int64_t backButtonDisplayMode = backButtonDisplayMode;
    id WeakRetained = objc_loadWeakRetained((id *)&self->__changeObserver);
    [WeakRetained navigationItemUpdatedBackButtonContent:self animated:0];
  }
}

- (void)_setBackButtonTitle:(id)a3 lineBreakMode:(int64_t)a4
{
  id v6 = (NSString *)a3;
  id v7 = v6;
  if (self->_backButtonTitle != v6)
  {
    v18 = v6;
    BOOL v8 = -[NSString isEqualToString:](v6, "isEqualToString:");
    id v7 = v18;
    if (!v8)
    {
      id v9 = (NSString *)[(NSString *)v18 copy];
      backButtonTitle = self->_backButtonTitle;
      self->_backButtonTitle = v9;

      id WeakRetained = objc_loadWeakRetained((id *)&self->__changeObserver);
      char v12 = WeakRetained;
      if (WeakRetained)
      {
        [WeakRetained navigationItemUpdatedBackButtonContent:self animated:0];
      }
      else
      {
        id v13 = objc_loadWeakRetained((id *)&self->_navigationBar);
        if (v13)
        {
          uint64_t v14 = self->_backButtonTitle;
          if (v14 && [(NSString *)v14 length])
          {
            id v15 = [(UINavigationItem *)self backButtonView];
            backButtonView = self->_backButtonView;
            self->_backButtonView = v15;
          }
          else
          {
            [(UINavigationItem *)self _removeBackButtonView];
          }
          [(UIView *)self->_backButtonView _setLineBreakMode:a4];
          [(UIView *)self->_backButtonView _resetTitleSize];
          [(UIView *)self->_backButtonView setNeedsDisplay];
          uint64_t v17 = [(UINavigationItem *)self _defaultTitleView];
          [v17 setNeedsDisplay];
          [v13 setNeedsLayout];
        }
      }

      id v7 = v18;
    }
  }
}

- (void)setTitleView:(UIView *)titleView
{
  int v5 = titleView;
  id v6 = self->_titleView;
  if (v6 != v5)
  {
    char v12 = v5;
    id v7 = _UINavigationBarCastToAugmentedTitleView(v6);
    [v7 _setDataSource:0 navigationItem:0 titleLocation:0];

    objc_storeStrong((id *)&self->_titleView, titleView);
    id WeakRetained = objc_loadWeakRetained((id *)&self->__changeObserver);
    id v9 = WeakRetained;
    if (WeakRetained)
    {
      if ([WeakRetained navigationItemIsTopItem:self]) {
        [v9 navigationItemUpdatedTitleContent:self animated:0];
      }
    }
    else
    {
      id v10 = objc_loadWeakRetained((id *)&self->_navigationBar);
      if (v10)
      {
        if (v12)
        {
          [(UIView *)v12 frame];
          double Width = CGRectGetWidth(v14);
        }
        else
        {
          double Width = 0.0;
        }
        [(UINavigationItem *)self _setIdealCustomTitleWidth:Width];
        if (!self->_titleView) {
          [(UIView *)self->_defaultTitleView removeFromSuperview];
        }
        [v10 _updateTitleViewIfTop:self];
        objc_msgSend(v10, "_accessibility_navigationBarContentsDidChange");
      }
    }
    int v5 = v12;
  }
}

- (void)_setLargeTitleTwoLineMode:(unint64_t)a3
{
  if (self->__largeTitleTwoLineMode != a3)
  {
    self->__largeTitleTwoLineMode = a3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->__changeObserver);
    [WeakRetained navigationItemUpdatedLargeTitleContent:self];
  }
}

- (void)setHidesSearchBarWhenScrolling:(BOOL)hidesSearchBarWhenScrolling
{
  $D86A7419EFA88717DA3782932A5A80ED navigationItemFlags = self->_navigationItemFlags;
  if (hidesSearchBarWhenScrolling) {
    __int16 v5 = 0;
  }
  else {
    __int16 v5 = 4;
  }
  *(_WORD *)&self->_$D86A7419EFA88717DA3782932A5A80ED navigationItemFlags = *(_WORD *)&navigationItemFlags & 0xFFFB | v5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->__changeObserver);
  if (WeakRetained && ((*(_WORD *)&self->_navigationItemFlags ^ *(unsigned int *)&navigationItemFlags) & 4) != 0)
  {
    id v7 = WeakRetained;
    [WeakRetained navigationItemUpdatedSearchController:self oldSearchController:self->_searchController];
    id WeakRetained = v7;
  }
}

- (void)_messageChangeObserver:(id)a3 forTransitionFromSearchController:(id)a4
{
  id v10 = a4;
  id v6 = a3;
  [v6 navigationItemUpdatedSearchController:self oldSearchController:v10];
  int v7 = [v6 navigationItemIsTopItem:self];

  BOOL v8 = v10;
  if (v7)
  {
    id v9 = [v10 _navigationItemCurrentlyDisplayingSearchController];

    if (v9 == self) {
      [v10 _setNavigationItemCurrentlyDisplayingSearchController:0];
    }
    [(UISearchController *)self->_searchController _setNavigationItemCurrentlyDisplayingSearchController:self];
    BOOL v8 = v10;
  }
}

- (UISearchController)searchController
{
  return self->_searchController;
}

- (void)setTitle:(NSString *)title
{
  id obj = [(UINavigationItem *)self _effectiveTitleForTitle:title];
  char v4 = [obj isEqualToString:self->_title];
  __int16 v5 = obj;
  if ((v4 & 1) == 0)
  {
    objc_storeStrong((id *)&self->_title, obj);
    id WeakRetained = objc_loadWeakRetained((id *)&self->__changeObserver);
    int v7 = WeakRetained;
    if (WeakRetained)
    {
      if ([WeakRetained navigationItemIsTopItem:self])
      {
        [v7 navigationItemUpdatedTitleContent:self animated:0];
        [v7 navigationItemUpdatedLargeTitleContent:self];
      }
      else if ([v7 navigationItemIsBackItem:self])
      {
        [v7 navigationItemUpdatedBackButtonContent:self animated:0];
      }
    }
    else
    {
      id v8 = objc_loadWeakRetained((id *)&self->_navigationBar);
      if (v8)
      {
        id v9 = [(UINavigationItem *)self _addDefaultTitleViewToNavigationBarIfNecessary:v8];
        [v9 _resetTitleSize];
        [(UINavigationItem *)self _setPendingTitle:0];
        [(UIView *)self->_backButtonView setNeedsDisplay];
        [v9 setNeedsDisplay];
        [v8 setNeedsLayout];
        if ([v8 state])
        {
          id v10 = [v8 topItem];

          if (v10 == self)
          {
            long long v11 = [v8 backItem];
            char v12 = [v11 backButtonView];
            [v12 _setAbbreviatedTitleIndex:0x7FFFFFFFFFFFFFFFLL];
          }
        }
        objc_msgSend(v8, "_accessibility_navigationBarContentsDidChange");
      }
    }

    __int16 v5 = obj;
  }
}

- (UINavigationItem)initWithTitle:(NSString *)title
{
  char v4 = title;
  v10.receiver = self;
  v10.super_class = (Class)UINavigationItem;
  __int16 v5 = [(UINavigationItem *)&v10 init];
  id v6 = v5;
  if (v5)
  {
    uint64_t v7 = [(UINavigationItem *)v5 _effectiveTitleForTitle:v4];
    id v8 = v6->_title;
    v6->_title = (NSString *)v7;
  }
  return v6;
}

- (id)_effectiveTitleForTitle:(id)a3
{
  id v3 = a3;
  char v4 = v3;
  if (v3 && [v3 length])
  {
    __int16 v5 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
    id v6 = [v4 stringByTrimmingCharactersInSet:v5];

    if ([v6 length])
    {
      id v12 = v6;
    }
    else
    {
      _UILocalizedFormat(@"NAVIGATION_TITLE_QUOTES", @"The title in quotes", @"“%@”", v7, v8, v9, v10, v11, (uint64_t)v4);
      id v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v13 = v12;
  }
  else
  {
    id v13 = (void *)[v4 copy];
  }

  return v13;
}

- (void)_setLargeTitleAccessoryView:(id)a3 alignToBaseline:(BOOL)a4 horizontalAlignment:(unint64_t)a5
{
  BOOL v6 = a4;
  uint64_t v9 = (UIView *)a3;
  if (self->__largeTitleAccessoryView != v9
    || self->__alignLargeTitleAccessoryViewToBaseline != v6
    || self->__largeTitleAccessoryViewHorizontalAlignment != a5)
  {
    uint64_t v11 = v9;
    objc_storeStrong((id *)&self->__largeTitleAccessoryView, a3);
    self->__alignLargeTitleAccessoryViewToBaseline = v6;
    self->__largeTitleAccessoryViewHorizontalAlignment = a5;
    id WeakRetained = objc_loadWeakRetained((id *)&self->__changeObserver);
    [WeakRetained navigationItemUpdatedLargeTitleContent:self];

    uint64_t v9 = v11;
  }
}

- (void)setTitleMenuProvider:(void *)titleMenuProvider
{
  if (self->_titleMenuProvider != titleMenuProvider)
  {
    char v4 = (void *)[titleMenuProvider copy];
    id v5 = self->_titleMenuProvider;
    self->_titleMenuProvider = v4;

    id WeakRetained = objc_loadWeakRetained((id *)&self->__changeObserver);
    [WeakRetained navigationItemUpdatedTitleContent:self animated:0];
  }
}

- (void)setHidesBackButton:(BOOL)hidesBackButton animated:(BOOL)animated
{
  __int16 navigationItemFlags = (__int16)self->_navigationItemFlags;
  if (((((navigationItemFlags & 1) == 0) ^ hidesBackButton) & 1) == 0)
  {
    BOOL v5 = animated;
    *(_WORD *)&self->___int16 navigationItemFlags = navigationItemFlags & 0xFFFE | hidesBackButton;
    id WeakRetained = objc_loadWeakRetained((id *)&self->__changeObserver);
    id v9 = WeakRetained;
    if (WeakRetained)
    {
      [WeakRetained navigationItemUpdatedContentLayout:self animated:v5];
    }
    else
    {
      id v8 = objc_loadWeakRetained((id *)&self->_navigationBar);
      [v8 _updateBackButtonVisibilityIfTop:self animated:v5];
      objc_msgSend(v8, "_accessibility_navigationBarContentsDidChange");
    }
  }
}

- (void)setLeftItemsSupplementBackButton:(BOOL)leftItemsSupplementBackButton
{
  __int16 navigationItemFlags = (__int16)self->_navigationItemFlags;
  if (((((navigationItemFlags & 2) == 0) ^ leftItemsSupplementBackButton) & 1) == 0)
  {
    if (leftItemsSupplementBackButton) {
      __int16 v5 = 2;
    }
    else {
      __int16 v5 = 0;
    }
    *(_WORD *)&self->___int16 navigationItemFlags = navigationItemFlags & 0xFFFD | v5;
    id WeakRetained = objc_loadWeakRetained((id *)&self->__changeObserver);
    id v7 = WeakRetained;
    if (WeakRetained) {
      [WeakRetained navigationItemUpdatedContentLayout:self animated:0];
    }
    else {
      [(UINavigationItem *)self updateNavigationBarButtonsAnimated:0];
    }
  }
}

- (void)updateNavigationBarButtonsAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationBar);
  [WeakRetained _updateContentIfTopItem:self animated:v3];
}

- (void)_dci_setRenameHandler:(id)a3
{
  __int16 v5 = (_UINavigationItemRenameHandler *)a3;
  renameHandler = self->_renameHandler;
  id v8 = v5;
  if (renameHandler != v5)
  {
    [(_UINavigationItemRenameHandler *)renameHandler setAssociatedItem:0];
    objc_storeStrong((id *)&self->_renameHandler, a3);
    [(_UINavigationItemRenameHandler *)v8 setAssociatedItem:self];
    id WeakRetained = objc_loadWeakRetained((id *)&self->__changeObserver);
    [WeakRetained navigationItemUpdatedTitleContent:self animated:0];
  }
}

- (void)setStyle:(UINavigationItemStyle)style
{
  if (self->_style != style)
  {
    self->_style = style;
    id WeakRetained = objc_loadWeakRetained((id *)&self->__changeObserver);
    [WeakRetained navigationItemUpdatedTitleContent:self animated:0];
  }
}

- (void)_setAllowsInteractivePop:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0;
  }
  else {
    __int16 v3 = 256;
  }
  *(_WORD *)&self->___int16 navigationItemFlags = *(_WORD *)&self->_navigationItemFlags & 0xFEFF | v3;
}

- (void)setStandardAppearance:(UINavigationBarAppearance *)standardAppearance
{
  char v4 = standardAppearance;
  __int16 v5 = self->_standardAppearance;
  BOOL v6 = v4;
  id v13 = v6;
  if (v5 == v6)
  {

    goto LABEL_12;
  }
  if (v6 && v5)
  {
    BOOL v7 = [(UIBarAppearance *)v5 isEqual:v6];

    if (v7) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  id v8 = self->_standardAppearance;
  if (v8) {
    objc_storeWeak((id *)&v8->super._changeObserver, 0);
  }
  id v9 = [(UIBarAppearance *)v13 copy];
  uint64_t v10 = self->_standardAppearance;
  self->_standardAppearance = v9;

  id WeakRetained = objc_loadWeakRetained((id *)&self->__changeObserver);
  [WeakRetained navigationItem:self appearance:self->_standardAppearance categoriesChanged:-1];

  id v12 = self->_standardAppearance;
  if (v12) {
    objc_storeWeak((id *)&v12->super._changeObserver, self);
  }
LABEL_12:
}

- (void)setCompactAppearance:(UINavigationBarAppearance *)compactAppearance
{
  char v4 = compactAppearance;
  __int16 v5 = self->_compactAppearance;
  BOOL v6 = v4;
  id v13 = v6;
  if (v5 == v6)
  {

    goto LABEL_12;
  }
  if (v6 && v5)
  {
    BOOL v7 = [(UIBarAppearance *)v5 isEqual:v6];

    if (v7) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  id v8 = self->_compactAppearance;
  if (v8) {
    objc_storeWeak((id *)&v8->super._changeObserver, 0);
  }
  id v9 = [(UIBarAppearance *)v13 copy];
  uint64_t v10 = self->_compactAppearance;
  self->_compactAppearance = v9;

  id WeakRetained = objc_loadWeakRetained((id *)&self->__changeObserver);
  [WeakRetained navigationItem:self appearance:self->_compactAppearance categoriesChanged:-1];

  id v12 = self->_compactAppearance;
  if (v12) {
    objc_storeWeak((id *)&v12->super._changeObserver, self);
  }
LABEL_12:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__alternateLargeTitles, 0);
  objc_storeStrong((id *)&self->__canvasView, 0);
  objc_storeStrong((id *)&self->__weeTitle, 0);
  objc_storeStrong((id *)&self->__largeTitleAccessoryView, 0);
  objc_storeStrong((id *)&self->__rightItemSpaceList, 0);
  objc_storeStrong((id *)&self->__leftItemSpaceList, 0);
  objc_destroyWeak((id *)&self->__changeObserver);
  objc_storeStrong((id *)&self->_compactScrollEdgeAppearance, 0);
  objc_storeStrong((id *)&self->_scrollEdgeAppearance, 0);
  objc_storeStrong((id *)&self->_compactAppearance, 0);
  objc_storeStrong((id *)&self->_standardAppearance, 0);
  objc_storeStrong((id *)&self->_additionalOverflowItems, 0);
  objc_storeStrong((id *)&self->_pinnedTrailingGroup, 0);
  objc_storeStrong((id *)&self->_customizationIdentifier, 0);
  objc_storeStrong((id *)&self->_documentProperties, 0);
  objc_destroyWeak((id *)&self->_renameDelegate);
  objc_storeStrong(&self->_titleMenuProvider, 0);
  objc_storeStrong((id *)&self->_backAction, 0);
  objc_storeStrong((id *)&self->_renameHandler, 0);
  objc_storeStrong((id *)&self->_documentMenu, 0);
  objc_storeStrong((id *)&self->_trailingItemGroups, 0);
  objc_storeStrong((id *)&self->_centerItemGroups, 0);
  objc_storeStrong((id *)&self->_leadingItemGroups, 0);
  objc_storeStrong((id *)&self->_inlineSearchBarItemGroup, 0);
  objc_storeStrong((id *)&self->_pendingTitle, 0);
  objc_storeStrong((id *)&self->_bottomPalette, 0);
  objc_storeStrong((id *)&self->_topPalette, 0);
  objc_storeStrong((id *)&self->_minimumDesiredHeights, 0);
  objc_storeStrong((id *)&self->_abbreviatedBackButtonTitles, 0);
  objc_storeStrong((id *)&self->_frozenTitleView, 0);
  objc_storeStrong((id *)&self->_searchController, 0);
  objc_storeStrong((id *)&self->_customRightViews, 0);
  objc_storeStrong((id *)&self->_customLeftViews, 0);
  objc_storeStrong((id *)&self->_rightBarButtonItems, 0);
  objc_storeStrong((id *)&self->_leftBarButtonItems, 0);
  objc_storeStrong((id *)&self->_backButtonView, 0);
  objc_storeStrong((id *)&self->_titleView, 0);
  objc_storeStrong((id *)&self->_defaultTitleView, 0);
  objc_destroyWeak((id *)&self->_navigationBar);
  objc_storeStrong(&self->_context, 0);
  objc_storeStrong((id *)&self->_prompt, 0);
  objc_storeStrong((id *)&self->_synthesizedBackBarButtonItem, 0);
  objc_storeStrong((id *)&self->_backBarButtonItem, 0);
  objc_storeStrong((id *)&self->_backButtonTitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (void)setCompactScrollEdgeAppearance:(UINavigationBarAppearance *)compactScrollEdgeAppearance
{
  char v4 = compactScrollEdgeAppearance;
  __int16 v5 = self->_compactScrollEdgeAppearance;
  BOOL v6 = v4;
  id v13 = v6;
  if (v5 == v6)
  {

    goto LABEL_12;
  }
  if (v6 && v5)
  {
    BOOL v7 = [(UIBarAppearance *)v5 isEqual:v6];

    if (v7) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  id v8 = self->_compactScrollEdgeAppearance;
  if (v8) {
    objc_storeWeak((id *)&v8->super._changeObserver, 0);
  }
  id v9 = [(UIBarAppearance *)v13 copy];
  uint64_t v10 = self->_compactScrollEdgeAppearance;
  self->_compactScrollEdgeAppearance = v9;

  id WeakRetained = objc_loadWeakRetained((id *)&self->__changeObserver);
  [WeakRetained navigationItem:self appearance:self->_compactScrollEdgeAppearance categoriesChanged:-1];

  id v12 = self->_compactScrollEdgeAppearance;
  if (v12) {
    objc_storeWeak((id *)&v12->super._changeObserver, self);
  }
LABEL_12:
}

- (void)_setBottomPalette:(id)a3
{
  __int16 v5 = (_UINavigationBarPalette *)a3;
  bottomPalette = self->_bottomPalette;
  if (bottomPalette != v5)
  {
    id v8 = v5;
    BOOL v7 = bottomPalette;
    [(_UINavigationBarPalette *)v7 setOwningNavigationItem:0];
    objc_storeStrong((id *)&self->_bottomPalette, a3);
    [(_UINavigationBarPalette *)self->_bottomPalette setOwningNavigationItem:self];
    [(UINavigationItem *)self _setBottomPaletteNeedsUpdate:v7];

    __int16 v5 = v8;
  }
}

- (void)_setTopPalette:(id)a3
{
  __int16 v5 = (_UINavigationBarPalette *)a3;
  topPalette = self->_topPalette;
  if (topPalette != v5)
  {
    id v9 = v5;
    BOOL v7 = topPalette;
    [(_UINavigationBarPalette *)v7 setOwningNavigationItem:0];
    objc_storeStrong((id *)&self->_topPalette, a3);
    [(_UINavigationBarPalette *)self->_topPalette setOwningNavigationItem:self];
    id WeakRetained = objc_loadWeakRetained((id *)&self->__changeObserver);
    [WeakRetained navigationItem:self updatedPalettePart:6 oldPalette:v7];

    __int16 v5 = v9;
  }
}

- (void)_updatePalette:(id)a3
{
  char v4 = (_UINavigationBarPalette *)a3;
  __int16 v5 = v4;
  if (self->_topPalette == v4)
  {
    BOOL v7 = v4;
    id WeakRetained = objc_loadWeakRetained((id *)&self->__changeObserver);
    [WeakRetained navigationItem:self updatedPalettePart:6 oldPalette:v7];
  }
  else
  {
    if (self->_bottomPalette != v4) {
      goto LABEL_6;
    }
    BOOL v7 = v4;
    -[UINavigationItem _setBottomPaletteNeedsUpdate:](self, "_setBottomPaletteNeedsUpdate:");
  }
  __int16 v5 = v7;
LABEL_6:
}

- (void)_setBottomPaletteNeedsUpdate:(id)a3
{
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->__changeObserver);
  if (WeakRetained)
  {
    if (objc_opt_respondsToSelector())
    {
      id v5 = objc_loadWeakRetained((id *)&self->__changeObserver);
      [v5 navigationItem:self updatedPalettePart:7 oldPalette:v6];
    }
    else
    {
      [WeakRetained navigationItemUpdatedBottomPalette:self oldPalette:v6];
    }
  }
}

- (void)_setManualScrollEdgeAppearanceEnabled:(BOOL)a3
{
  if (self->_manualScrollEdgeAppearanceEnabled != a3)
  {
    self->_manualScrollEdgeAppearanceEnabled = a3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->__changeObserver);
    [WeakRetained navigationItemUpdatedScrollEdgeProgress:self];

    if (self->_autoScrollEdgeTransitionDistance > 0.0)
    {
      id v5 = objc_loadWeakRetained((id *)&self->_navigationBar);
      id v7 = [v5 delegate];

      if (objc_opt_respondsToSelector())
      {
        id v6 = objc_loadWeakRetained((id *)&self->_navigationBar);
        [v7 _navigationBar:v6 itemEnabledAutoScrollTransition:self];
      }
    }
  }
}

- (UINavigationItem)initWithCoder:(NSCoder *)coder
{
  char v4 = coder;
  v45.receiver = self;
  v45.super_class = (Class)UINavigationItem;
  id v5 = [(UINavigationItem *)&v45 init];
  if (v5)
  {
    id v6 = [(NSCoder *)v4 decodeObjectForKey:@"UITitle"];
    uint64_t v7 = [v6 copy];
    title = v5->_title;
    v5->_title = (NSString *)v7;

    id v9 = [(NSCoder *)v4 decodeObjectForKey:@"UIPrompt"];
    uint64_t v10 = [v9 copy];
    prompt = v5->_prompt;
    v5->_prompt = (NSString *)v10;

    id v12 = [(NSCoder *)v4 decodeObjectForKey:@"UIBackButtonTitle"];
    uint64_t v13 = [v12 copy];
    backButtonTitle = v5->_backButtonTitle;
    v5->_backButtonTitle = (NSString *)v13;

    uint64_t v15 = [(NSCoder *)v4 decodeObjectForKey:@"UIBackBarButtonItem"];
    backBarButtonItem = v5->_backBarButtonItem;
    v5->_backBarButtonItem = (UIBarButtonItem *)v15;

    v5->_int64_t backButtonDisplayMode = [(NSCoder *)v4 decodeIntegerForKey:@"UIBackButtonDisplayMode"];
    if ([(NSCoder *)v4 decodeBoolForKey:@"UILeftItemsSupplementBackButton"]) {
      __int16 v17 = 2;
    }
    else {
      __int16 v17 = 0;
    }
    *(_WORD *)&v5->___int16 navigationItemFlags = *(_WORD *)&v5->_navigationItemFlags & 0xFFFD | v17;
    v18 = [(NSCoder *)v4 decodeObjectForKey:@"UILeftBarButtonItem"];
    uint64_t v19 = [(NSCoder *)v4 decodeObjectForKey:@"UILeftBarButtonItems"];
    leftBarButtonItems = v5->_leftBarButtonItems;
    v5->_leftBarButtonItems = (NSArray *)v19;

    if (v18 && !v5->_leftBarButtonItems)
    {
      uint64_t v21 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", v18, 0);
      id v22 = v5->_leftBarButtonItems;
      v5->_leftBarButtonItems = (NSArray *)v21;
    }
    uint64_t v23 = [(NSCoder *)v4 decodeObjectForKey:@"UITitleView"];
    titleView = v5->_titleView;
    v5->_titleView = (UIView *)v23;

    if ([(NSCoder *)v4 containsValueForKey:@"UICenterItemGroups"])
    {
      uint64_t v25 = [(NSCoder *)v4 decodeObjectForKey:@"UICenterItemGroups"];
      centerItemGroups = v5->_centerItemGroups;
      v5->_centerItemGroups = (NSArray *)v25;
    }
    if ([(NSCoder *)v4 containsValueForKey:@"UICustomizationIdentifier"])
    {
      uint64_t v27 = [(NSCoder *)v4 decodeObjectForKey:@"UICustomizationIdentifier"];
      customizationIdentifier = v5->_customizationIdentifier;
      v5->_customizationIdentifier = (NSString *)v27;
    }
    if ([(NSCoder *)v4 containsValueForKey:@"UIStyle"]) {
      v5->_style = [(NSCoder *)v4 decodeIntegerForKey:@"UIStyle"];
    }
    uint64_t v29 = [(NSCoder *)v4 decodeObjectForKey:@"UIRightBarButtonItem"];
    uint64_t v30 = [(NSCoder *)v4 decodeObjectForKey:@"UIRightBarButtonItems"];
    rightBarButtonItems = v5->_rightBarButtonItems;
    v5->_rightBarButtonItems = (NSArray *)v30;

    if (v29 && !v5->_rightBarButtonItems)
    {
      uint64_t v32 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", v29, 0);
      char v33 = v5->_rightBarButtonItems;
      v5->_rightBarButtonItems = (NSArray *)v32;
    }
    if (dyld_program_sdk_at_least()
      && [(NSCoder *)v4 containsValueForKey:@"UILargeTitleDisplayMode"])
    {
      v5->_largeTitleDisplayMode = [(NSCoder *)v4 decodeIntegerForKey:@"UILargeTitleDisplayMode"];
    }
    if ([(NSCoder *)v4 decodeBoolForKey:@"UIAlwaysShowsSearchBar"]) {
      __int16 v34 = 4;
    }
    else {
      __int16 v34 = 0;
    }
    *(_WORD *)&v5->___int16 navigationItemFlags = *(_WORD *)&v5->_navigationItemFlags & 0xFFFB | v34;
    id v35 = [(NSCoder *)v4 decodeObjectForKey:@"UINavigationBar"];
    objc_storeWeak((id *)&v5->_navigationBar, v35);

    uint64_t v36 = [(NSCoder *)v4 decodeObjectForKey:@"UINavigationBarStandardAppearance"];
    standardAppearance = v5->_standardAppearance;
    v5->_standardAppearance = (UINavigationBarAppearance *)v36;

    uint64_t v38 = [(NSCoder *)v4 decodeObjectForKey:@"UINavigationBarCompactAppearance"];
    compactAppearance = v5->_compactAppearance;
    v5->_compactAppearance = (UINavigationBarAppearance *)v38;

    uint64_t v40 = [(NSCoder *)v4 decodeObjectForKey:@"UINavigationBarScrollEdgeAppearance"];
    scrollEdgeAppearance = v5->_scrollEdgeAppearance;
    v5->_scrollEdgeAppearance = (UINavigationBarAppearance *)v40;

    uint64_t v42 = [(NSCoder *)v4 decodeObjectForKey:@"UINavigationBarCompactScrollEdgeAppearance"];
    compactScrollEdgeAppearance = v5->_compactScrollEdgeAppearance;
    v5->_compactScrollEdgeAppearance = (UINavigationBarAppearance *)v42;
  }
  return v5;
}

- (NSString)description
{
  v19.receiver = self;
  v19.super_class = (Class)UINavigationItem;
  __int16 v3 = [(UINavigationItem *)&v19 description];
  char v4 = (void *)[v3 mutableCopy];

  if (self->_title) {
    [v4 appendFormat:@" title='%@'", self->_title];
  }
  if (self->_titleView) {
    objc_msgSend(v4, "appendFormat:", @" titleView=%p", self->_titleView);
  }
  if (self->_prompt) {
    [v4 appendFormat:@" prompt='%@'", self->_prompt];
  }
  unint64_t v5 = self->_style + 1;
  if (v5 <= 3) {
    [v4 appendString:off_1E52DE170[v5]];
  }
  if (self->_backBarButtonItem)
  {
    objc_msgSend(v4, "appendFormat:", @" backBarButtonItem=%p", self->_backBarButtonItem);
    goto LABEL_18;
  }
  if (self->_backButtonTitle) {
    [v4 appendFormat:@" backButtonTitle='%@'", self->_backButtonTitle];
  }
  int64_t backButtonDisplayMode = self->_backButtonDisplayMode;
  if (backButtonDisplayMode == 2)
  {
    uint64_t v7 = @" backButtonDisplayMode=minimal";
  }
  else
  {
    if (backButtonDisplayMode != 1) {
      goto LABEL_18;
    }
    uint64_t v7 = @" backButtonDisplayMode=generic";
  }
  [v4 appendString:v7];
LABEL_18:
  if (self->_backAction) {
    objc_msgSend(v4, "appendFormat:", @" backAction=%p", self->_backAction);
  }
  if (*(_WORD *)&self->_navigationItemFlags) {
    [v4 appendString:@" hidesBackButton"];
  }
  id titleMenuProvider = self->_titleMenuProvider;
  if (titleMenuProvider)
  {
    id v9 = _Block_copy(titleMenuProvider);
    objc_msgSend(v4, "appendFormat:", @" titleMenuProvider=%p", v9);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_renameDelegate);

  if (WeakRetained)
  {
    id v11 = objc_loadWeakRetained((id *)&self->_renameDelegate);
    objc_msgSend(v4, "appendFormat:", @" renameDelegate=%p", v11);
  }
  if (self->_documentProperties) {
    objc_msgSend(v4, "appendFormat:", @" documentProperties=%p", self->_documentProperties);
  }
  if (self->_customizationIdentifier) {
    [v4 appendFormat:@" customizationIdentifier='%@'", self->_customizationIdentifier];
  }
  p_leadingItemGroups = &self->_leadingItemGroups;
  if ([(NSArray *)self->_leadingItemGroups count])
  {
    uint64_t v13 = @" leadingItemGroups=%p";
  }
  else
  {
    p_leadingItemGroups = &self->_leftBarButtonItems;
    if (![(NSArray *)self->_leftBarButtonItems count]) {
      goto LABEL_35;
    }
    uint64_t v13 = @" leftBarButtonItems=%p";
  }
  objc_msgSend(v4, "appendFormat:", v13, *p_leadingItemGroups);
LABEL_35:
  if ((*(_WORD *)&self->_navigationItemFlags & 2) != 0) {
    [v4 appendString:@" leftItemsSupplementBackButton"];
  }
  if ([(NSArray *)self->_centerItemGroups count]) {
    objc_msgSend(v4, "appendFormat:", @" centerItemGroups=%p", self->_centerItemGroups);
  }
  p_trailingItemGroups = &self->_trailingItemGroups;
  if ([(NSArray *)self->_trailingItemGroups count])
  {
    uint64_t v15 = @" trailingItemGroups=%p";
  }
  else
  {
    p_trailingItemGroups = &self->_rightBarButtonItems;
    if (![(NSArray *)self->_rightBarButtonItems count]) {
      goto LABEL_44;
    }
    uint64_t v15 = @" rightBarButtonItems=%p";
  }
  objc_msgSend(v4, "appendFormat:", v15, *p_trailingItemGroups);
LABEL_44:
  if (self->_additionalOverflowItems) {
    objc_msgSend(v4, "appendFormat:", @" additionalOverflowItems=%p", self->_additionalOverflowItems);
  }
  unint64_t v16 = self->_largeTitleDisplayMode - 1;
  if (v16 <= 2) {
    [v4 appendString:off_1E52DE190[v16]];
  }
  if (self->_searchController)
  {
    objc_msgSend(v4, "appendFormat:", @" searchController=%p", self->_searchController);
    if ((*(_WORD *)&self->_navigationItemFlags & 4) == 0) {
      [v4 appendString:@" hidesSearchBarWhenScrolling"];
    }
    unint64_t v17 = self->_preferredSearchBarPlacement - 1;
    if (v17 <= 3) {
      [v4 appendString:off_1E52DE1A8[v17]];
    }
  }
  if (self->_standardAppearance) {
    objc_msgSend(v4, "appendFormat:", @" standardAppearance=%p", self->_standardAppearance);
  }
  if (self->_scrollEdgeAppearance) {
    objc_msgSend(v4, "appendFormat:", @" scrollEdgeAppearance=%p", self->_scrollEdgeAppearance);
  }
  if (self->_compactAppearance) {
    objc_msgSend(v4, "appendFormat:", @" compactAppearance=%p", self->_compactAppearance);
  }
  if (self->_compactScrollEdgeAppearance) {
    objc_msgSend(v4, "appendFormat:", @" compactScrollEdgeAppearance=%p", self->_compactScrollEdgeAppearance);
  }
  return (NSString *)v4;
}

- (void)_setFontScaleAdjustment:(double)a3
{
  if (self->_fontScaleAdjustment != a3)
  {
    self->_fontScaleAdjustment = a3;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __44__UINavigationItem__setFontScaleAdjustment___block_invoke;
    aBlock[3] = &__block_descriptor_40_e17_v16__0__NSArray_8l;
    *(double *)&aBlock[4] = a3;
    char v4 = (void (**)(void *, NSArray *))_Block_copy(aBlock);
    v4[2](v4, self->_leftBarButtonItems);
    v4[2](v4, self->_rightBarButtonItems);
  }
}

void __44__UINavigationItem__setFontScaleAdjustment___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (([v8 isCustomViewItem] & 1) == 0)
        {
          id v9 = [v8 view];
          uint64_t v10 = [v9 titleForState:0];
          uint64_t v11 = [v10 length];

          if (v11)
          {
            [v9 _setFontScaleAdjustment:*(double *)(a1 + 32)];
            [v9 _updateStyle];
            [v9 sizeToFit];
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
}

- (void)_setAbbreviatedBackButtonTitles:(id)a3
{
  id v4 = a3;
  abbreviatedBackButtonTitles = self->_abbreviatedBackButtonTitles;
  id v13 = v4;
  if (v4 && !abbreviatedBackButtonTitles
    || abbreviatedBackButtonTitles && ![(NSArray *)abbreviatedBackButtonTitles isEqualToArray:v4])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationBar);
    uint64_t v7 = (NSArray *)[v13 copy];
    id v8 = self->_abbreviatedBackButtonTitles;
    self->_abbreviatedBackButtonTitles = v7;

    backButtonView = self->_backButtonView;
    if (backButtonView)
    {
      if ([(UIView *)backButtonView _abbreviatedTitleIndex] != 0x7FFFFFFFFFFFFFFFLL
        && ![WeakRetained state])
      {
        [(UIView *)self->_backButtonView _setAbbreviatedTitleIndex:0x7FFFFFFFFFFFFFFFLL];
        if (WeakRetained)
        {
          id v10 = [(UIView *)self->_backButtonView superview];
          if (v10 == WeakRetained && ![(UIView *)self->_backButtonView isHidden])
          {
            [(UIView *)self->_backButtonView alpha];
            double v12 = v11;

            if (v12 != 0.0) {
              [WeakRetained setNeedsLayout];
            }
          }
          else
          {
          }
        }
      }
    }
  }
}

- (void)_setBackButtonPressed:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(UINavigationItem *)self existingBackButtonView];
  [v4 setPressed:v3];
}

+ (id)defaultFont
{
  objc_super v2 = +[UINavigationBar _defaultVisualStyleForOrientation:1];
  [v2 headingFontSize];
  BOOL v3 = objc_msgSend(off_1E52D39B8, "boldSystemFontOfSize:");

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v21 = a3;
  if ([(NSString *)self->_title length]) {
    [v21 encodeObject:self->_title forKey:@"UITitle"];
  }
  prompt = self->_prompt;
  if (prompt) {
    [v21 encodeObject:prompt forKey:@"UIPrompt"];
  }
  backButtonTitle = self->_backButtonTitle;
  if (backButtonTitle) {
    [v21 encodeObject:backButtonTitle forKey:@"UIBackButtonTitle"];
  }
  backBarButtonItem = self->_backBarButtonItem;
  if (backBarButtonItem) {
    [v21 encodeObject:backBarButtonItem forKey:@"UIBackBarButtonItem"];
  }
  int64_t backButtonDisplayMode = self->_backButtonDisplayMode;
  if (backButtonDisplayMode) {
    [v21 encodeInteger:backButtonDisplayMode forKey:@"UIBackButtonDisplayMode"];
  }
  if ((*(_WORD *)&self->_navigationItemFlags & 2) != 0) {
    [v21 encodeBool:1 forKey:@"UILeftItemsSupplementBackButton"];
  }
  id v8 = [(NSArray *)self->_leftBarButtonItems firstObject];
  if (v8) {
    [v21 encodeObject:v8 forKey:@"UILeftBarButtonItem"];
  }
  id v9 = [(NSArray *)self->_rightBarButtonItems firstObject];
  if (v9) {
    [v21 encodeObject:v9 forKey:@"UIRightBarButtonItem"];
  }
  leftBarButtonItems = self->_leftBarButtonItems;
  if (leftBarButtonItems) {
    [v21 encodeObject:leftBarButtonItems forKey:@"UILeftBarButtonItems"];
  }
  titleView = self->_titleView;
  if (titleView) {
    [v21 encodeObject:titleView forKey:@"UITitleView"];
  }
  centerItemGroups = self->_centerItemGroups;
  if (centerItemGroups) {
    [v21 encodeObject:centerItemGroups forKey:@"UICenterItemGroups"];
  }
  customizationIdentifier = self->_customizationIdentifier;
  if (customizationIdentifier) {
    [v21 encodeObject:customizationIdentifier forKey:@"UICustomizationIdentifier"];
  }
  int64_t style = self->_style;
  if (style) {
    [v21 encodeInteger:style forKey:@"UIStyle"];
  }
  rightBarButtonItems = self->_rightBarButtonItems;
  if (rightBarButtonItems) {
    [v21 encodeObject:rightBarButtonItems forKey:@"UIRightBarButtonItems"];
  }
  if (dyld_program_sdk_at_least()) {
    [v21 encodeInteger:self->_largeTitleDisplayMode forKey:@"UILargeTitleDisplayMode"];
  }
  if ((*(_WORD *)&self->_navigationItemFlags & 4) != 0) {
    [v21 encodeBool:1 forKey:@"UIAlwaysShowsSearchBar"];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationBar);
  if (WeakRetained) {
    [v21 encodeConditionalObject:WeakRetained forKey:@"UINavigationBar"];
  }
  standardAppearance = self->_standardAppearance;
  if (standardAppearance) {
    [v21 encodeObject:standardAppearance forKey:@"UINavigationBarStandardAppearance"];
  }
  compactAppearance = self->_compactAppearance;
  if (compactAppearance) {
    [v21 encodeObject:compactAppearance forKey:@"UINavigationBarCompactAppearance"];
  }
  scrollEdgeAppearance = self->_scrollEdgeAppearance;
  if (scrollEdgeAppearance) {
    [v21 encodeObject:scrollEdgeAppearance forKey:@"UINavigationBarScrollEdgeAppearance"];
  }
  compactScrollEdgeAppearance = self->_compactScrollEdgeAppearance;
  if (compactScrollEdgeAppearance) {
    [v21 encodeObject:compactScrollEdgeAppearance forKey:@"UINavigationBarCompactScrollEdgeAppearance"];
  }
}

- (void)_freezeCurrentTitleView
{
  id v12 = [(UINavigationItem *)self _defaultTitleView];
  [v12 bounds];
  if (v3 > 0.0 && v4 > 0.0)
  {
    _UIGraphicsBeginImageContextWithOptions(0, 0, v3, v4, 0.0);
    uint64_t v5 = [v12 layer];
    ContextStack = GetContextStack(0);
    if (*(int *)ContextStack < 1) {
      uint64_t v7 = 0;
    }
    else {
      uint64_t v7 = ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
    }
    [v5 renderInContext:v7];

    id v8 = _UIGraphicsGetImageFromCurrentImageContext(0);
    UIGraphicsEndImageContext();
    if (v8)
    {
      if (self->_frozenTitleView) {
        [(UINavigationItem *)self _cleanupFrozenTitleView];
      }
      id v9 = [[UIImageView alloc] initWithImage:v8];
      frozenTitleView = self->_frozenTitleView;
      self->_frozenTitleView = v9;

      [(UIView *)self->_frozenTitleView setAlpha:1.0];
      [v12 frame];
      -[UIImageView setFrame:](self->_frozenTitleView, "setFrame:");
      double v11 = [v12 superview];
      [v11 addSubview:self->_frozenTitleView];

      [v12 setAlpha:0.0];
    }
  }
}

- (void)_cleanupFrozenTitleView
{
  [(UIView *)self->_frozenTitleView removeFromSuperview];
  frozenTitleView = self->_frozenTitleView;
  self->_frozenTitleView = 0;
}

- (id)_addDefaultTitleViewToNavigationBarIfNecessary:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  uint64_t v6 = 0;
  if (v4 && !self->_titleView)
  {
    if ([v4 _isAlwaysHidden])
    {
      uint64_t v6 = 0;
      goto LABEL_9;
    }
    uint64_t v7 = [(UINavigationItem *)self _defaultTitleView];
    uint64_t v6 = v7;
    if (v7)
    {
      id v8 = [v7 superview];
      if (v8)
      {
LABEL_7:

        goto LABEL_9;
      }
      id v9 = [v5 topItem];

      if (v9 == self)
      {
        id v8 = [v5 _contentView];
        [v8 addSubview:v6];
        goto LABEL_7;
      }
    }
  }
LABEL_9:

  return v6;
}

- (void)_setTitle:(id)a3 animated:(BOOL)a4 matchBarButtonItemAnimationDuration:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = (NSString *)a3;
  id v9 = v8;
  if (a4)
  {
    if (self->_title != v8 && !-[NSString isEqualToString:](v8, "isEqualToString:"))
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->__changeObserver);
      if (WeakRetained)
      {
        double v11 = (NSString *)[(NSString *)v9 copy];
        title = self->_title;
        self->_title = v11;

        if ([WeakRetained navigationItemIsTopItem:self])
        {
          [WeakRetained navigationItemUpdatedTitleContent:self animated:1];
        }
        else if ([WeakRetained navigationItemIsBackItem:self])
        {
          [WeakRetained navigationItemUpdatedBackButtonContent:self animated:0];
        }
      }
      else
      {
        id v13 = objc_loadWeakRetained((id *)&self->_navigationBar);
        long long v14 = v13;
        if (v13)
        {
          if ([v13 state])
          {
            [(UINavigationItem *)self _setPendingTitle:v9];
          }
          else
          {
            [(UINavigationItem *)self _freezeCurrentTitleView];
            long long v15 = (NSString *)[(NSString *)v9 copy];
            unint64_t v16 = self->_title;
            self->_title = v15;

            [(UINavigationItem *)self _setPendingTitle:0];
            uint64_t v17 = [(UINavigationItem *)self _addDefaultTitleViewToNavigationBarIfNecessary:v14];
            [v17 _resetTitleSize];
            [(UIView *)self->_backButtonView setNeedsDisplay];
            [v17 setNeedsDisplay];
            [v14 setNeedsLayout];
            if (v5) {
              double v18 = 0.35;
            }
            else {
              double v18 = 0.175;
            }
            objc_super v19 = [v14 animationFactory];
            v21[4] = self;
            v22[0] = MEMORY[0x1E4F143A8];
            v22[1] = 3221225472;
            v22[2] = __75__UINavigationItem__setTitle_animated_matchBarButtonItemAnimationDuration___block_invoke;
            v22[3] = &unk_1E52D9F98;
            v22[4] = self;
            id v23 = v17;
            v21[0] = MEMORY[0x1E4F143A8];
            v21[1] = 3221225472;
            v21[2] = __75__UINavigationItem__setTitle_animated_matchBarButtonItemAnimationDuration___block_invoke_2;
            v21[3] = &unk_1E52DC3A0;
            id v20 = v17;
            +[UIView _animateWithDuration:393216 delay:v19 options:v22 factory:v21 animations:v18 completion:0.0];
          }
        }
      }
    }
  }
  else
  {
    [(UINavigationItem *)self setTitle:v8];
  }
}

uint64_t __75__UINavigationItem__setTitle_animated_matchBarButtonItemAnimationDuration___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 136) setAlpha:0.0];
  objc_super v2 = *(void **)(a1 + 40);
  return [v2 setAlpha:1.0];
}

uint64_t __75__UINavigationItem__setTitle_animated_matchBarButtonItemAnimationDuration___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cleanupFrozenTitleView];
}

- (void)_setTitle:(id)a3 animated:(BOOL)a4
{
}

- (BOOL)_supportsTwoLineLargeTitles
{
  return self->__largeTitleTwoLineMode != 0;
}

- (void)_setBackgroundHidden:(BOOL)a3
{
  if (self->__backgroundHidden != a3)
  {
    self->__backgroundHidden = a3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->__changeObserver);
    [WeakRetained navigationItemUpdatedBackgroundAppearance:self];
  }
}

- (void)_setPreferredNavigationBarVisibility:(unint64_t)a3
{
  if (self->__preferredNavigationBarVisibility != a3)
  {
    unint64_t v5 = [(UINavigationItem *)self _navigationBarVisibility];
    self->__unint64_t preferredNavigationBarVisibility = a3;
    if ([(UINavigationItem *)self _navigationBarVisibility] != v5)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->__changeObserver);
      [WeakRetained navigationItemUpdatedNavigationBarVisibility:self];
    }
  }
}

- (void)_setNavigationBarHidden:(BOOL)a3
{
  if (self->__navigationBarHidden != a3)
  {
    self->__navigationBarHidden = a3;
    if (!self->__preferredNavigationBarVisibility)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->__changeObserver);
      [WeakRetained navigationItemUpdatedNavigationBarVisibility:self];
    }
  }
}

- (void)_setAllowsInteractivePopWhenNavigationBarHidden:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 navigationItemFlags = *(_WORD *)&self->_navigationItemFlags & 0xFDFF | v3;
}

- (void)_searchControllerReadyForDeferredAutomaticShowsScopeBar
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__changeObserver);
  [WeakRetained navigationItemSearchControllerReadyForDeferredAutomaticShowsScopeBar:self];
}

- (BOOL)_shouldSearchControllerDeferPresentationTransition:(id)a3
{
  __int16 v3 = self;
  id WeakRetained = objc_loadWeakRetained((id *)&self->__changeObserver);
  LOBYTE(v3) = [WeakRetained shouldSearchControllerDeferPresentationTransitionForNavigationItem:v3];

  return (char)v3;
}

- (void)setBackBarButtonItem:(UIBarButtonItem *)backBarButtonItem
{
  unint64_t v5 = backBarButtonItem;
  if (self->_backBarButtonItem != v5)
  {
    object = v5;
    if (objc_opt_respondsToSelector())
    {
      uint64_t v6 = [(UIView *)self->_backButtonView _appearanceStorage];
      BOOL v7 = v6 != 0;
    }
    else
    {
      BOOL v7 = 0;
    }
    objc_storeStrong((id *)&self->_backBarButtonItem, backBarButtonItem);
    id WeakRetained = objc_loadWeakRetained((id *)&self->__changeObserver);
    id v9 = WeakRetained;
    if (WeakRetained)
    {
      [WeakRetained navigationItemUpdatedBackButtonContent:self animated:0];
    }
    else
    {
      id v10 = objc_loadWeakRetained((id *)&self->_navigationBar);
      double v11 = v10;
      if (v10)
      {
        if (self->_backBarButtonItem)
        {
          backButtonView = self->_backButtonView;
          if (backButtonView) {
            char v13 = v7;
          }
          else {
            char v13 = 1;
          }
          if (v13)
          {
            if (v7) {
              [(UINavigationItem *)self _removeBackButtonView];
            }
            long long v14 = [(UINavigationItem *)self backButtonView];
            long long v15 = self->_backButtonView;
            self->_backButtonView = v14;
          }
          else
          {
            unint64_t v16 = [v10 _appearanceStorage];
            uint64_t v17 = [v16 _barButtonAppearanceStorage];
            [(UIView *)backButtonView _applyBarButtonAppearanceStorage:v17 withTaggedSelectors:0];

            double v18 = self->_backButtonView;
            objc_super v19 = [(UIBarButtonItem *)object _appearanceStorage];
            id v20 = objc_getAssociatedObject(object, &_UIAppearanceCustomizedSelectorsAssociationKey);
            [(UIView *)v18 _applyBarButtonAppearanceStorage:v19 withTaggedSelectors:v20];
          }
        }
        else
        {
          [(UINavigationItem *)self _removeBackButtonView];
        }
        [(UIView *)self->_backButtonView setNeedsDisplay];
        id v21 = [(UINavigationItem *)self _defaultTitleView];
        [v21 setNeedsDisplay];
        [v11 setNeedsLayout];
        objc_msgSend(v11, "_accessibility_navigationBarContentsDidChange");
      }
    }

    unint64_t v5 = object;
  }
}

- (NSString)backButtonTitle
{
  return self->_backButtonTitle;
}

- (id)currentBackButtonTitle
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    __int16 v3 = [(UIView *)self->_backButtonView title];
    id v4 = (void *)[v3 copy];
  }
  else
  {
    id v4 = [(UINavigationItem *)self backButtonTitle];
  }
  return v4;
}

- (void)_removeBarButtonItemViews
{
  __int16 v3 = [(UINavigationItem *)self leftBarButtonItems];
  __45__UINavigationItem__removeBarButtonItemViews__block_invoke(v3);

  id v4 = [(UINavigationItem *)self rightBarButtonItems];
  __45__UINavigationItem__removeBarButtonItemViews__block_invoke(v4);
}

void __45__UINavigationItem__removeBarButtonItemViews__block_invoke(void *a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v2 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v8;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v1);
        }
        uint64_t v6 = [*(id *)(*((void *)&v7 + 1) + 8 * v5) view];
        [v6 removeFromSuperview];

        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v3);
  }
}

- (void)_removeTitleAndButtonViews
{
  [(UINavigationItem *)self _removeBackButtonView];
  uint64_t v3 = [(UINavigationItem *)self titleView];
  [v3 removeFromSuperview];

  [(UIView *)self->_defaultTitleView removeFromSuperview];
  defaultTitleView = self->_defaultTitleView;
  self->_defaultTitleView = 0;
}

- (void)_removeBackButtonView
{
  [(UIView *)self->_backButtonView removeFromSuperview];
  backButtonView = self->_backButtonView;
  self->_backButtonView = 0;
}

- (void)_replaceCustomLeftRightViewAtIndex:(unint64_t)a3 withView:(id)a4 left:(BOOL)a5
{
  BOOL v5 = a5;
  id v12 = a4;
  objc_msgSend(v12, "_uinavigationbar_prepareToAppearInNavigationItem:onLeft:", self, v5);
  uint64_t v8 = 120;
  if (v5) {
    uint64_t v8 = 112;
  }
  id v9 = *(id *)((char *)&self->super.isa + v8);
  id v10 = [v9 objectAtIndex:a3];
  if (v10 != v12)
  {
    double v11 = (void *)[v9 mutableCopy];
    [v11 replaceObjectAtIndex:a3 withObject:v12];
    if (v5) {
      [(UINavigationItem *)self _setCustomLeftViews:v11];
    }
    else {
      [(UINavigationItem *)self _setCustomRightViews:v11];
    }
  }
}

- (id)existingBackButtonView
{
  return self->_backButtonView;
}

- (id)backButtonView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationBar);
  uint64_t v4 = [WeakRetained _screen];
  int v5 = [WeakRetained _shouldShowBackButtonForScreen:v4];

  if (v5)
  {
    backButtonView = self->_backButtonView;
    if (!backButtonView)
    {
      long long v7 = [[_UINavigationItemButtonView alloc] initWithNavigationItem:self];
      uint64_t v8 = self->_backButtonView;
      self->_backButtonView = &v7->super.super;

      id v9 = self->_backButtonView;
      id v10 = [WeakRetained _appearanceStorage];
      double v11 = [v10 _barButtonAppearanceStorage];
      [(UIView *)v9 _applyBarButtonAppearanceStorage:v11 withTaggedSelectors:0];

      id v12 = self->_backButtonView;
      char v13 = [(UIBarButtonItem *)self->_backBarButtonItem _appearanceStorage];
      long long v14 = objc_getAssociatedObject(self->_backBarButtonItem, &_UIAppearanceCustomizedSelectorsAssociationKey);
      [(UIView *)v12 _applyBarButtonAppearanceStorage:v13 withTaggedSelectors:v14];

      -[UIView setSemanticContentAttribute:](self->_backButtonView, "setSemanticContentAttribute:", [WeakRetained semanticContentAttribute]);
      BOOL v15 = +[_UIAppearance _hasCustomizationsForClass:objc_opt_class() guideClass:[(UIView *)self->_backButtonView _appearanceGuideClass]];
      backButtonView = self->_backButtonView;
      if (v15)
      {
        [(UIView *)backButtonView _setAppearanceIsInvalid:1];
        backButtonView = self->_backButtonView;
      }
    }
    unint64_t v16 = backButtonView;
  }
  else
  {
    unint64_t v16 = 0;
  }

  return v16;
}

- (void)setPrompt:(NSString *)prompt
{
  if (self->_prompt != prompt)
  {
    uint64_t v4 = (NSString *)[(NSString *)prompt copy];
    int v5 = self->_prompt;
    self->_prompt = v4;

    id WeakRetained = objc_loadWeakRetained((id *)&self->__changeObserver);
    id v8 = WeakRetained;
    if (WeakRetained)
    {
      [WeakRetained navigationItemUpdatedPromptContent:self];
    }
    else
    {
      id v7 = objc_loadWeakRetained((id *)&self->_navigationBar);
      [v7 updatePrompt];
      objc_msgSend(v7, "_accessibility_navigationBarContentsDidChange");
    }
  }
}

- (BOOL)_leftItemsWantBackButton
{
  if ([(NSArray *)self->_leftBarButtonItems count]) {
    BOOL v3 = [(NSArray *)self->_leadingItemGroups count] != 0;
  }
  else {
    BOOL v3 = 1;
  }
  return v3 | ((*(_WORD *)&self->_navigationItemFlags & 2) >> 1);
}

- (BOOL)_wantsBackButtonIndicator
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v2 = self->_leftBarButtonItems;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if ((objc_msgSend(v6, "isHidden", (void)v8) & 1) == 0)
        {
          LOBYTE(v3) = [v6 _showsBackButtonIndicator];
          goto LABEL_11;
        }
      }
      uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (id)_buttonForBackButtonIndicator
{
  uint64_t v2 = [(UINavigationItem *)self _barButtonForBackButtonIndicator];
  uint64_t v3 = [v2 view];

  return v3;
}

- (int64_t)_dci_preferredSearchBarPlacement
{
  return self->_preferredSearchBarPlacement;
}

- (_UIBarButtonItemSearchBarGroup)_existingInlineSearchBarItemGroup
{
  return self->_inlineSearchBarItemGroup;
}

- (void)_setAlwaysUseManualScrollEdgeAppearance:(BOOL)a3
{
  BOOL v3 = a3;
  if (qword_1EB25F1D8 != -1) {
    dispatch_once(&qword_1EB25F1D8, &__block_literal_global_215);
  }
  if (!_MergedGlobals_963)
  {
    if (os_variant_has_internal_diagnostics())
    {
      id v7 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1853B0000, v7, OS_LOG_TYPE_FAULT, "Application that is not Messages using an SPI designated only for Messages. Disabling", buf, 2u);
      }
    }
    else
    {
      int v5 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB25F1E0) + 8);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long v8 = 0;
        _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_ERROR, "Application that is not Messages using an SPI designated only for Messages. Disabling", v8, 2u);
      }
    }
    BOOL v3 = 0;
  }
  if (self->_alwaysUseManualScrollEdgeAppearance != v3)
  {
    self->_alwaysUseManualScrollEdgeAppearance = v3;
    if (self->_manualScrollEdgeAppearanceEnabled)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->__changeObserver);
      [WeakRetained navigationItemUpdatedScrollEdgeProgress:self];
    }
  }
}

void __60__UINavigationItem__setAlwaysUseManualScrollEdgeAppearance___block_invoke()
{
  id v1 = [MEMORY[0x1E4F28B50] mainBundle];
  v0 = [v1 bundleIdentifier];
  _MergedGlobals_963 = [@"com.apple.MobileSMS" isEqualToString:v0];
}

- (void)set_alwaysUseManualScrollEdgeAppearance:(BOOL)a3
{
}

- (void)_setAutoScrollEdgeTransitionDistance:(double)a3
{
  if (self->_manualScrollEdgeAppearanceEnabled)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"UINavigationItem.m" lineNumber:1555 description:@"_autoScrollEdgeTransitionDistance may only be changed while _manualScrollEdgeAppearanceEnabled==NO"];
  }
  double v5 = fmax(a3, 0.0);
  if (self->_autoScrollEdgeTransitionDistance != v5) {
    self->_autoScrollEdgeTransitionDistance = v5;
  }
}

- (BOOL)_shouldDismissPresentedViewControllerWhenPopped
{
  return (*(_WORD *)&self->_navigationItemFlags & 8) == 0;
}

- (void)_setShouldDismissPresentedViewControllerWhenPopped:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0;
  }
  else {
    __int16 v3 = 8;
  }
  *(_WORD *)&self->___int16 navigationItemFlags = *(_WORD *)&self->_navigationItemFlags & 0xFFF7 | v3;
}

- (void)_sendSearchBarPlacementChangeCallbackIfNecessaryWillChange:(id *)a1
{
  if (!a1) {
    return;
  }
  uint64_t v4 = [a1[16] delegate];
  double v5 = (void *)v4;
  if (v4)
  {
    long long v11 = (void *)v4;
    if (a2)
    {
      char v6 = objc_opt_respondsToSelector();
      double v5 = v11;
      if (v6)
      {
        uint64_t v7 = objc_msgSend(a1, "searchBarPlacement", v11);
        long long v8 = [a1[16] delegate];
        [v8 searchController:a1[16] willChangeToSearchBarPlacement:v7];
LABEL_8:

        double v5 = v11;
      }
    }
    else
    {
      char v9 = objc_opt_respondsToSelector();
      double v5 = v11;
      if (v9)
      {
        uint64_t v10 = objc_msgSend(a1, "searchBarPlacement", v11);
        long long v8 = [a1[16] delegate];
        [v8 searchController:a1[16] didChangeFromSearchBarPlacement:v10];
        goto LABEL_8;
      }
    }
  }
}

- (UIView)customLeftView
{
  return 0;
}

- (UIView)customRightView
{
  return 0;
}

- (UIBarButtonItem)customLeftItem
{
  return 0;
}

- (UIBarButtonItem)customRightItem
{
  return 0;
}

- (void)_setBottomPaletteNeedsUpdate
{
}

- (void)_dci_setDocumentMenu:(id)a3
{
  if (self->_documentMenu != a3)
  {
    uint64_t v4 = (UIMenu *)[a3 copy];
    documentMenu = self->_documentMenu;
    self->_documentMenu = v4;

    id WeakRetained = objc_loadWeakRetained((id *)&self->__changeObserver);
    [WeakRetained navigationItemUpdatedTitleContent:self animated:0];
  }
}

- (id)_dci_documentMenuProvider
{
  uint64_t v2 = _Block_copy(self->_titleMenuProvider);
  return v2;
}

- (_UIDocumentMenuHeader)_dci_documentMenuHeader
{
  uint64_t v2 = [(UINavigationItem *)self documentProperties];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    __int16 v3 = v2;
  }
  else {
    __int16 v3 = 0;
  }
  uint64_t v4 = v3;

  return v4;
}

- (NSArray)_dci_centerItemGroups
{
  uint64_t v2 = [(UINavigationItem *)self centerItemGroups];
  __int16 v3 = v2;
  if (!v2) {
    uint64_t v2 = (void *)MEMORY[0x1E4F1CBF0];
  }
  uint64_t v4 = v2;

  return v4;
}

- (NSArray)_dci_centerItems
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

- (id)overflowPresentationSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__changeObserver);
  if (objc_opt_respondsToSelector())
  {
    uint64_t v4 = [WeakRetained presentationSourceForContent:0 navigationItem:self];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (void)setRenameDelegate:(id)renameDelegate
{
  id v4 = renameDelegate;
  objc_storeWeak((id *)&self->_renameDelegate, v4);
  if (v4)
  {
    objc_initWeak(location, self);
    objc_initWeak(&from, v4);
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __38__UINavigationItem_setRenameDelegate___block_invoke;
    v24[3] = &unk_1E52DE060;
    objc_copyWeak(&v25, location);
    objc_copyWeak(&v26, &from);
    double v5 = +[_UINavigationItemRenameHandler handlerWithDidEndRenamingHandler:v24];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __38__UINavigationItem_setRenameDelegate___block_invoke_2;
    v21[3] = &unk_1E52DE088;
    objc_copyWeak(&v22, location);
    objc_copyWeak(&v23, &from);
    [v5 setShouldBeginRenamingHandler:v21];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __38__UINavigationItem_setRenameDelegate___block_invoke_3;
    v18[3] = &unk_1E52DE0B0;
    objc_copyWeak(&v19, location);
    objc_copyWeak(&v20, &from);
    [v5 setWillBeginRenamingWithRangeHandler:v18];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __38__UINavigationItem_setRenameDelegate___block_invoke_4;
    v15[3] = &unk_1E52DE0D8;
    objc_copyWeak(&v16, location);
    objc_copyWeak(&v17, &from);
    [v5 setShouldEndRenamingHandler:v15];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __38__UINavigationItem_setRenameDelegate___block_invoke_5;
    v12[3] = &unk_1E52DE100;
    objc_copyWeak(&v13, location);
    objc_copyWeak(&v14, &from);
    [v5 setFileURLForRenaming:v12];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __38__UINavigationItem_setRenameDelegate___block_invoke_6;
    v9[3] = &unk_1E52DE128;
    objc_copyWeak(&v10, location);
    objc_copyWeak(&v11, &from);
    [v5 setFileRenameDidFail:v9];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __38__UINavigationItem_setRenameDelegate___block_invoke_7;
    v6[3] = &unk_1E52DE150;
    objc_copyWeak(&v7, location);
    objc_copyWeak(&v8, &from);
    [v5 setFileRenameDidEnd:v6];
    [(UINavigationItem *)self _dci_setRenameHandler:v5];
    objc_destroyWeak(&v8);
    objc_destroyWeak(&v7);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&v23);
    objc_destroyWeak(&v22);

    objc_destroyWeak(&v26);
    objc_destroyWeak(&v25);
    objc_destroyWeak(&from);
    objc_destroyWeak(location);
  }
  else
  {
    [(UINavigationItem *)self _dci_setRenameHandler:0];
  }
}

void __38__UINavigationItem_setRenameDelegate___block_invoke(uint64_t a1, void *a2)
{
  __int16 v3 = (id *)(a1 + 32);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  id v5 = objc_loadWeakRetained((id *)(a1 + 40));
  char v6 = v5;
  if (WeakRetained && v5) {
    [v5 navigationItem:WeakRetained didEndRenamingWithTitle:v4];
  }
  else {
    +[_UINavigationItemRenameHandler defaultNavigationItem:WeakRetained didEndRenamingWithTitle:v4];
  }
}

uint64_t __38__UINavigationItem_setRenameDelegate___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = v3;
  if (WeakRetained && v3 && (objc_opt_respondsToSelector() & 1) != 0) {
    uint64_t v5 = [v4 navigationItemShouldBeginRenaming:WeakRetained];
  }
  else {
    uint64_t v5 = +[_UINavigationItemRenameHandler defaultNavigationItemShouldBeginRenaming:WeakRetained forValidDelegate:v4 != 0];
  }
  uint64_t v6 = v5;

  return v6;
}

id __38__UINavigationItem_setRenameDelegate___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v7 = objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = v7;
  if (WeakRetained && v7 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    uint64_t v9 = [v8 navigationItem:WeakRetained willBeginRenamingWithSuggestedTitle:v5 selectedRange:a3];
  }
  else
  {
    uint64_t v9 = +[_UINavigationItemRenameHandler defaultNavigationItem:WeakRetained willBeginRenamingWithSuggestedTitle:v5 selectedRange:a3];
  }
  id v10 = (void *)v9;

  return v10;
}

uint64_t __38__UINavigationItem_setRenameDelegate___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v6 = v5;
  if (WeakRetained && v5 && (objc_opt_respondsToSelector() & 1) != 0) {
    uint64_t v7 = [v6 navigationItem:WeakRetained shouldEndRenamingWithTitle:v3];
  }
  else {
    uint64_t v7 = +[_UINavigationItemRenameHandler defaultNavigationItem:WeakRetained shouldEndRenamingWithTitle:v3];
  }
  uint64_t v8 = v7;

  return v8;
}

id __38__UINavigationItem_setRenameDelegate___block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = v3;
  id v5 = 0;
  if (WeakRetained && v3)
  {
    if (objc_opt_respondsToSelector())
    {
      id v5 = [v4 _navigationItemFileURLForRenaming:WeakRetained];
    }
    else
    {
      id v5 = 0;
    }
  }

  return v5;
}

void __38__UINavigationItem_setRenameDelegate___block_invoke_6(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = v4;
  if (WeakRetained && v4 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v5 _navigationItem:WeakRetained fileRenameDidFailWithError:v6];
  }
}

void __38__UINavigationItem_setRenameDelegate___block_invoke_7(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = v4;
  if (WeakRetained && v4 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v5 _navigationItem:WeakRetained fileRenameDidEndWithFinalURL:v6];
  }
}

- (BOOL)_canRename
{
  uint64_t v2 = [(UINavigationItem *)self _dci_renameHandler];
  char v3 = [v2 _canRename];

  return v3;
}

- (id)_customLeftViews
{
  if (!self->_customLeftViews && [(NSArray *)self->_leftBarButtonItems count]) {
    [(UINavigationItem *)self _accumulateViewsFromItems:self->_leftBarButtonItems isLeft:1 refreshViews:1];
  }
  customLeftViews = self->_customLeftViews;
  return customLeftViews;
}

- (id)_customRightViews
{
  if (!self->_customRightViews && [(NSArray *)self->_rightBarButtonItems count]) {
    [(UINavigationItem *)self _accumulateViewsFromItems:self->_rightBarButtonItems isLeft:0 refreshViews:1];
  }
  customRightViews = self->_customRightViews;
  return customRightViews;
}

- (void)_removeContentInView:(id)a3
{
  id v8 = a3;
  id v4 = [(UIView *)self->_defaultTitleView superview];

  if (v4 == v8) {
    [(UIView *)self->_defaultTitleView removeFromSuperview];
  }
  id v5 = [(UIView *)self->_titleView superview];

  if (v5 == v8) {
    [(UIView *)self->_titleView removeFromSuperview];
  }
  id v6 = [(UIView *)self->_backButtonView superview];

  uint64_t v7 = v8;
  if (v6 == v8)
  {
    [(UIView *)self->_backButtonView removeFromSuperview];
    uint64_t v7 = v8;
  }
}

- (BOOL)_hasDefaultTitleView
{
  titleView = self->_titleView;
  if (!titleView) {
    return 1;
  }
  uint64_t v3 = objc_opt_class();
  return [(UIView *)titleView isMemberOfClass:v3];
}

- (id)_defaultTitleView
{
  if (!self->_defaultTitleView)
  {
    uint64_t v3 = [(UINavigationItem *)self title];
    uint64_t v4 = [v3 length];

    if (v4)
    {
      id v5 = [[_UINavigationItemView alloc] initWithNavigationItem:self];
      defaultTitleView = self->_defaultTitleView;
      self->_defaultTitleView = &v5->super;
    }
  }
  uint64_t v7 = self->_defaultTitleView;
  return v7;
}

- (id)_titleView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationBar);
  char v4 = [WeakRetained _isAlwaysHidden];

  if (v4)
  {
    id v5 = 0;
  }
  else
  {
    id v6 = [(UINavigationItem *)self titleView];
    uint64_t v7 = v6;
    if (v6)
    {
      id v8 = v6;
    }
    else
    {
      id v8 = [(UINavigationItem *)self _defaultTitleView];
    }
    id v5 = v8;
  }
  return v5;
}

- (id)_firstNonSpaceItemInList:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = a3;
  id v4 = (id)[v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v4; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if ((!objc_msgSend(v7, "isSystemItem", (void)v9)
           || (unint64_t)([v7 systemItem] - 5) >= 2)
          && ([v7 isHidden] & 1) == 0)
        {
          id v4 = v7;
          goto LABEL_13;
        }
      }
      id v4 = (id)[v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  return v4;
}

- (id)_firstNonSpaceLeftItem
{
  return [(UINavigationItem *)self _firstNonSpaceItemInList:self->_leftBarButtonItems];
}

- (id)_firstNonSpaceRightItem
{
  return [(UINavigationItem *)self _firstNonSpaceItemInList:self->_rightBarButtonItems];
}

- (void)_setMinimumDesiredHeight:(double)a3 forBarMetrics:(int64_t)a4
{
  minimumDesiredHeights = self->_minimumDesiredHeights;
  id v8 = objc_msgSend(NSNumber, "numberWithInteger:");
  id v19 = [(NSMutableDictionary *)minimumDesiredHeights objectForKeyedSubscript:v8];

  double v9 = fmax(a3, 0.0);
  long long v10 = self->_minimumDesiredHeights;
  if (v9 != 0.0)
  {
    if (!v10)
    {
      uint64_t v14 = [MEMORY[0x1E4F1CA60] dictionary];
      BOOL v15 = self->_minimumDesiredHeights;
      self->_minimumDesiredHeights = v14;
    }
    id v13 = [NSNumber numberWithDouble:v9];
    id v16 = self->_minimumDesiredHeights;
    id v17 = [NSNumber numberWithInteger:a4];
    [(NSMutableDictionary *)v16 setObject:v13 forKeyedSubscript:v17];

    if (!v19 || ([v19 isEqual:v13] & 1) == 0)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->__changeObserver);
      [WeakRetained navigationItemUpdatedCanvasView:self];
    }
    goto LABEL_10;
  }
  long long v11 = v19;
  if (v10 && v19)
  {
    long long v12 = [NSNumber numberWithInteger:a4];
    [(NSMutableDictionary *)v10 removeObjectForKey:v12];

    id v13 = objc_loadWeakRetained((id *)&self->__changeObserver);
    [v13 navigationItemUpdatedCanvasView:self];
LABEL_10:

    long long v11 = v19;
  }
}

- (double)_desiredHeightForBarMetrics:(int64_t)a3 defaultHeightBlock:(id)a4
{
  double v6 = (*((double (**)(id, int64_t))a4 + 2))(a4, a3);
  minimumDesiredHeights = self->_minimumDesiredHeights;
  if (minimumDesiredHeights)
  {
    id v8 = [NSNumber numberWithInteger:a3];
    double v9 = [(NSMutableDictionary *)minimumDesiredHeights objectForKeyedSubscript:v8];

    if (v9)
    {
      [v9 doubleValue];
      if (v6 < v10) {
        double v6 = v10;
      }
    }
  }
  return v6;
}

- (id)_minimumDesiredHeights
{
  return self->_minimumDesiredHeights;
}

- (int64_t)_independentBarStyle
{
  return 0;
}

- (id)_independentBackgroundImageForBarMetrics:(int64_t)a3
{
  return 0;
}

- (id)_independentShadowImage
{
  return 0;
}

- (double)_fontScaleAdjustment
{
  return self->_fontScaleAdjustment;
}

- (NSString)_pendingTitle
{
  return self->_pendingTitle;
}

- (void)_setPendingTitle:(id)a3
{
}

- (double)_autoScrollEdgeTransitionDistance
{
  return self->_autoScrollEdgeTransitionDistance;
}

- (UINavigationItemBackButtonDisplayMode)backButtonDisplayMode
{
  return self->_backButtonDisplayMode;
}

- (id)renameDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_renameDelegate);
  return WeakRetained;
}

- (_UINavigationItemChangeObserver)_changeObserver
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__changeObserver);
  return (_UINavigationItemChangeObserver *)WeakRetained;
}

- (double)_titleViewWidthForAnimations
{
  return self->__titleViewWidthForAnimations;
}

- (void)set_titleViewWidthForAnimations:(double)a3
{
  self->__titleViewWidthForAnimations = a3;
}

- (double)_idealCustomTitleWidth
{
  return self->__idealCustomTitleWidth;
}

- (void)_setIdealCustomTitleWidth:(double)a3
{
  self->__idealCustomTitledouble Width = a3;
}

- (unint64_t)_preferredNavigationBarVisibility
{
  return self->__preferredNavigationBarVisibility;
}

- (unint64_t)_leftFlexibleSpaceCount
{
  return self->__leftFlexibleSpaceCount;
}

- (unint64_t)_rightFlexibleSpaceCount
{
  return self->__rightFlexibleSpaceCount;
}

- (NSArray)_leftItemSpaceList
{
  return self->__leftItemSpaceList;
}

- (NSArray)_rightItemSpaceList
{
  return self->__rightItemSpaceList;
}

- (id)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (int64_t)tag
{
  return self->_tag;
}

- (void)setTag:(int64_t)a3
{
  self->_tag = a3;
}

- (BOOL)_isNavigationBarHidden
{
  return self->__navigationBarHidden;
}

- (void)setNavigationBar:(id)a3
{
}

- (UIView)_canvasView
{
  return self->__canvasView;
}

- (void)_setCanvasView:(id)a3
{
}

- (void)setUseRelativeLargeTitleInsets:(BOOL)a3
{
  self->_useRelativeLargeTitleInsets = a3;
}

@end