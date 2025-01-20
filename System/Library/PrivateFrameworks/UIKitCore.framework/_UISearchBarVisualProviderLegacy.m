@interface _UISearchBarVisualProviderLegacy
- (BOOL)_getNavigationTitleLeadingInset:(double *)a3 trailingInset:(double *)a4 isRTL:(BOOL)a5;
- (BOOL)allowsInlineScopeBar;
- (BOOL)alwaysUsesLayoutMarginsForHorizontalContentInset;
- (BOOL)autoDisableCancelButton;
- (BOOL)backgroundLayoutNeedsUpdate;
- (BOOL)centerPlaceholder;
- (BOOL)containsScopeBar;
- (BOOL)drawsBackground;
- (BOOL)drawsBackgroundInPalette;
- (BOOL)hasDarkUIAppearance;
- (BOOL)isAtTop;
- (BOOL)isEnabled;
- (BOOL)isFrozenForDismissalCrossfade;
- (BOOL)isHostedByNavigationBar;
- (BOOL)isInBarButNotHosted;
- (BOOL)isInNavigationPalette;
- (BOOL)isPlacedInNavigationBar;
- (BOOL)isPlacedInToolbar;
- (BOOL)isSearchResultsButtonSelected;
- (BOOL)isTranslucent;
- (BOOL)reliesOnNavigationBarBackdrop;
- (BOOL)scopeBarIsVisible;
- (BOOL)searchFieldWidthShouldBeFlexible;
- (BOOL)shouldCombineLandscapeBarsForOrientation:(int64_t)a3;
- (BOOL)shouldDisplayShadow;
- (BOOL)showsBookmarkButton;
- (BOOL)showsCancelButton;
- (BOOL)showsScopeBar;
- (BOOL)showsSearchResultsButton;
- (BOOL)useRelaxedScopeLayout;
- (BOOL)usesEmbeddedAppearance;
- (BOOL)wantsDictationButton;
- (BOOL)wouldCombineLandscapeBarsForSize:(CGSize)a3;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (UIEdgeInsets)effectiveContentInset;
- (UIEdgeInsets)minimumContentInset;
- (UIEdgeInsets)scopeBarInsets;
- (UIOffset)searchFieldBackgroundPositionAdjustment;
- (double)_defaultWidth;
- (double)availableBoundsWidth;
- (double)availableBoundsWidthForSize:(CGSize)a3;
- (double)barHeightForBarMetrics:(int64_t)a3;
- (double)barHeightForBarMetrics:(int64_t)a3 barPosition:(int64_t)a4;
- (double)barHeightForBarMetrics:(int64_t)a3 withEffectiveInsets:(UIEdgeInsets)a4;
- (double)defaultHeight;
- (double)defaultHeightForOrientation:(int64_t)a3;
- (double)landscapeScopeBarWidth;
- (double)landscapeSearchFieldWidth;
- (double)navigationBarContentHeight;
- (double)scopeBarHeight;
- (double)searchFieldHeight;
- (double)tableViewIndexWidth;
- (id)animatedAppearanceBarButtonItem;
- (id)backdrop;
- (id)backdropVisualEffectView;
- (id)backgroundImageForBarPosition:(int64_t)a3 barMetrics:(int64_t)a4;
- (id)barTintColor;
- (id)cancelBarButtonItem;
- (id)cancelButton;
- (id)cancelButtonText;
- (id)colorForComponent:(unint64_t)a3 disabled:(BOOL)a4;
- (id)currentSeparatorImage;
- (id)effectiveBarTintColor;
- (id)imageForSearchBarIcon:(int64_t)a3 state:(unint64_t)a4;
- (id)internalImageForSearchBarIcon:(int64_t)a3 state:(unint64_t)a4;
- (id)internalImageForSearchBarIcon:(int64_t)a3 state:(unint64_t)a4 customImage:(BOOL *)a5;
- (id)leftButton;
- (id)makeShadowView;
- (id)navBarTitleViewDataSource;
- (id)navBarTitleViewOverlayRects;
- (id)navigationBarForShadow;
- (id)prompt;
- (id)promptLabel;
- (id)runtimeOnlyViews;
- (id)scopeBar;
- (id)scopeBarBackgroundImage;
- (id)scopeBarBackgroundView;
- (id)scopeBarContainerView;
- (id)scopeTitles;
- (id)searchBarBackground;
- (id)searchBarClippingView;
- (id)searchDisplayController;
- (id)searchField;
- (id)searchFieldBackgroundImageForState:(unint64_t)a3;
- (id)searchFieldIfExists;
- (id)searchNavigationItem;
- (id)separator;
- (id)separatorImage;
- (id)shadowView;
- (id)textColor;
- (int)visualProviderType;
- (int64_t)backdropStyle;
- (int64_t)barMetricsForOrientation:(int64_t)a3;
- (int64_t)barPosition;
- (int64_t)barStyle;
- (int64_t)barTranslucence;
- (int64_t)navBarTitleViewLocation;
- (int64_t)searchFieldLeftViewMode;
- (int64_t)selectedScope;
- (unint64_t)scopeBarPosition;
- (unint64_t)searchBarStyle;
- (void)_removeBackdropVisualEffectView;
- (void)_removeLegacyBackdropView;
- (void)_setAutoDisableCancelButton:(BOOL)a3;
- (void)_setBarStyle:(int64_t)a3;
- (void)_setBarTintColor:(id)a3;
- (void)_setBarTranslucence:(int64_t)a3;
- (void)_setHideBackground:(BOOL)a3;
- (void)_setSearchResultsButtonSelected:(BOOL)a3;
- (void)_setShowsBookmarkButton:(BOOL)a3;
- (void)_setShowsCancelButton:(BOOL)a3;
- (void)_setShowsScopeBar:(BOOL)a3;
- (void)_setShowsSearchResultsButton:(BOOL)a3;
- (void)allowCursorToAppear:(BOOL)a3;
- (void)applySearchBarStyle;
- (void)destroyCancelButton;
- (void)destroyPromptLabel;
- (void)displayNavBarCancelButton:(BOOL)a3 animated:(BOOL)a4;
- (void)effectiveBarTintColorDidChange:(BOOL)a3;
- (void)getOverrideContentInsets:(UIEdgeInsets *)a3 overriddenEdges:(unint64_t *)a4;
- (void)getScopeBarHeight:(double *)a3 containerHeight:(double *)a4;
- (void)getTopInset:(double *)a3 bottomInset:(double *)a4 forBarMetrics:(int64_t)a5 barPosition:(int64_t)a6;
- (void)layoutBackgroundViewConsideringTopBarStatusAndChangedHeight:(BOOL)a3;
- (void)layoutSubviews;
- (void)layoutSubviewsInBounds:(CGRect)a3;
- (void)navigationBarTransitionCompleted:(int64_t)a3 willBeDisplayed:(BOOL)a4;
- (void)navigationBarTransitionWillBegin:(int64_t)a3 willBeDisplayed:(BOOL)a4;
- (void)prepare;
- (void)prepareFromAbandonedVisualProvider:(id)a3;
- (void)setAllowsInlineScopeBar:(BOOL)a3;
- (void)setAutoDisableCancelButton:(BOOL)a3;
- (void)setBackdrop:(id)a3;
- (void)setBackdropStyle:(int64_t)a3;
- (void)setBackdropVisualEffectView:(id)a3;
- (void)setBackgroundImage:(id)a3 forBarPosition:(int64_t)a4 barMetrics:(int64_t)a5;
- (void)setBackgroundLayoutNeedsUpdate;
- (void)setBarPosition:(int64_t)a3;
- (void)setBarStyle:(int64_t)a3;
- (void)setBarTintColor:(id)a3;
- (void)setBarTintColor:(id)a3 forceUpdate:(BOOL)a4;
- (void)setBarTranslucence:(int64_t)a3;
- (void)setCancelButton:(id)a3;
- (void)setCancelButtonText:(id)a3;
- (void)setCenterPlaceholder:(BOOL)a3;
- (void)setClippingViewActive:(BOOL)a3;
- (void)setClippingViewBounds:(CGRect)a3;
- (void)setDrawsBackground:(BOOL)a3;
- (void)setDrawsBackgroundInPalette:(BOOL)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setEnabled:(BOOL)a3 animated:(BOOL)a4;
- (void)setHostedByNavigationBar:(BOOL)a3;
- (void)setImage:(id)a3 forSearchBarIcon:(int64_t)a4 state:(unint64_t)a5;
- (void)setInNavigationPalette:(BOOL)a3;
- (void)setMinimumContentInset:(UIEdgeInsets)a3;
- (void)setNavBarTitleViewDataSource:(id)a3;
- (void)setNavBarTitleViewLocation:(int64_t)a3;
- (void)setNavBarTitleViewOverlayRects:(id)a3;
- (void)setOverrideContentInsets:(UIEdgeInsets)a3 forRectEdges:(unint64_t)a4;
- (void)setPlacedInNavigationBar:(BOOL)a3;
- (void)setPlacedInToolbar:(BOOL)a3;
- (void)setPrompt:(id)a3;
- (void)setPromptLabel:(id)a3;
- (void)setReliesOnNavigationBarBackdrop:(BOOL)a3;
- (void)setScopeBar:(id)a3;
- (void)setScopeBarBackgroundImage:(id)a3;
- (void)setScopeBarBackgroundView:(id)a3;
- (void)setScopeBarPosition:(unint64_t)a3;
- (void)setScopeTitles:(id)a3;
- (void)setSearchBarBackground:(id)a3;
- (void)setSearchBarStyle:(unint64_t)a3;
- (void)setSearchDisplayController:(id)a3;
- (void)setSearchDisplayControllerShowsCancelButton:(BOOL)a3;
- (void)setSearchField:(id)a3;
- (void)setSearchFieldBackgroundImage:(id)a3 forState:(unint64_t)a4;
- (void)setSearchFieldBackgroundPositionAdjustment:(UIOffset)a3;
- (void)setSearchFieldLeftViewMode:(int64_t)a3;
- (void)setSearchResultsButtonSelected:(BOOL)a3;
- (void)setSelectedScope:(int64_t)a3;
- (void)setSeparator:(id)a3;
- (void)setSeparatorImage:(id)a3;
- (void)setShadowVisibleIfNecessary:(BOOL)a3;
- (void)setShowsBookmarkButton:(BOOL)a3;
- (void)setShowsCancelButton:(BOOL)a3;
- (void)setShowsCancelButton:(BOOL)a3 animated:(BOOL)a4;
- (void)setShowsDeleteButton:(BOOL)a3;
- (void)setShowsScopeBar:(BOOL)a3;
- (void)setShowsScopeBar:(BOOL)a3 animateOpacity:(BOOL)a4;
- (void)setShowsSearchResultsButton:(BOOL)a3;
- (void)setShowsSeparator:(BOOL)a3;
- (void)setTableViewIndexWidth:(double)a3;
- (void)setUpCancelButton;
- (void)setUpCancelButtonWithAppearance:(id)a3;
- (void)setUpLeftButton;
- (void)setUpPromptLabel;
- (void)setUpScopeBar;
- (void)setUpSearchField;
- (void)setUpSearchNavigationItemWithSizingOption:(unint64_t)a3;
- (void)setUsesEmbeddedAppearance:(BOOL)a3;
- (void)teardown;
- (void)updateBackgroundToBackdropStyle:(int64_t)a3;
- (void)updateEffectiveContentInset;
- (void)updateForDrawsBackgroundInPalette;
- (void)updateIfNecessaryForOldSize:(CGSize)a3;
- (void)updateMagnifyingGlassView;
- (void)updateNavigationBarLayoutInsertDataForSearchBar:(id)a3 collapsibleScopeBar:(id)a4 forLayoutState:(int64_t)a5;
- (void)updateNeedForBackdrop;
- (void)updatePlaceholderColor;
- (void)updateRightView;
- (void)updateScopeBarBackground;
- (void)updateScopeBarForSelectedScope;
- (void)updateScopeBarFrame;
- (void)updateSearchBarOpacity;
- (void)updateSearchFieldArt;
@end

@implementation _UISearchBarVisualProviderLegacy

- (int)visualProviderType
{
  return 1;
}

- (void)setBarStyle:(int64_t)a3
{
  uint64_t v5 = [(_UISearchBarVisualProviderBase *)self searchBar];
  v6 = (void *)v5;
  if (v5)
  {
    $B0CEE0411BC9260FB4C6BC24420153D9 searchBarVisualProviderFlags = self->_searchBarVisualProviderFlags;
    if ((*(unsigned char *)&searchBarVisualProviderFlags & 7) != a3)
    {
      v15 = (void *)v5;
      if (a3) {
        BOOL v8 = (*(_DWORD *)&self->_searchBarVisualProviderFlags & 7) == 0;
      }
      else {
        BOOL v8 = 1;
      }
      self->_$B0CEE0411BC9260FB4C6BC24420153D9 searchBarVisualProviderFlags = ($B0CEE0411BC9260FB4C6BC24420153D9)(*(_DWORD *)&searchBarVisualProviderFlags & 0xFFFFFFF8 | a3 & 7);
      int v9 = v8;
      [(UISearchBarBackground *)self->_searchBarBackground setBarStyle:a3];
      if (!self->_barTintColor)
      {
        if (self->_cancelButton)
        {
          [(_UISearchBarVisualProviderLegacy *)self setUpCancelButtonWithAppearance:0];
          [v15 setNeedsLayout];
        }
        if (self->_promptLabel)
        {
          [(_UISearchBarVisualProviderLegacy *)self setUpPromptLabel];
          [v15 setNeedsLayout];
        }
        if (v9) {
          [(_UISearchBarVisualProviderLegacy *)self updateSearchFieldArt];
        }
        separator = self->_separator;
        if (separator)
        {
          v11 = [(_UISearchBarVisualProviderLegacy *)self currentSeparatorImage];
          [(UIImageView *)separator setImage:v11];
        }
        [(UISegmentedControl *)self->_scopeBar setBarStyle:a3];
        [(_UISearchBarVisualProviderLegacy *)self updateScopeBarBackground];
        [(_UISearchBarVisualProviderLegacy *)self updateSearchBarOpacity];
      }
      v6 = v15;
      if (v9)
      {
        [(_UISearchBarVisualProviderLegacy *)self updatePlaceholderColor];
        [(_UISearchBarVisualProviderLegacy *)self updateRightView];
        [(_UISearchBarVisualProviderLegacy *)self updateMagnifyingGlassView];
        BOOL v12 = [(UISearchBarBackground *)self->_searchBarBackground _hasCustomBackgroundImage];
        v6 = v15;
        if (!v12 && !self->_backdropStyle)
        {
          v13 = [v15 _searchBarTextField];
          v14 = [(_UISearchBarVisualProviderLegacy *)self textColor];
          [v13 setTextColor:v14];

          v6 = v15;
        }
      }
    }
  }
}

- (void)_setBarStyle:(int64_t)a3
{
  self->_$B0CEE0411BC9260FB4C6BC24420153D9 searchBarVisualProviderFlags = ($B0CEE0411BC9260FB4C6BC24420153D9)(*(_DWORD *)&self->_searchBarVisualProviderFlags & 0xFFFFFFF8 | a3 & 7);
}

- (int64_t)barStyle
{
  return *(_DWORD *)&self->_searchBarVisualProviderFlags & 7;
}

- (void)setSearchBarStyle:(unint64_t)a3
{
  if (!self->_backdropStyle)
  {
    unint64_t searchBarVisualProviderFlags = self->_searchBarVisualProviderFlags;
    uint64_t v4 = (searchBarVisualProviderFlags >> 3) & 7;
    if (v4 != a3)
    {
      if (a3 != 2 || v4 == 2)
      {
        self->_unint64_t searchBarVisualProviderFlags = ($B0CEE0411BC9260FB4C6BC24420153D9)(searchBarVisualProviderFlags & 0xFFFFFFC7 | (8 * (a3 & 7)));
        if (a3 == 2 || v4 != 2) {
          return;
        }
      }
      else
      {
        self->_unint64_t searchBarVisualProviderFlags = ($B0CEE0411BC9260FB4C6BC24420153D9)(searchBarVisualProviderFlags & 0xFFFFFFC7 | 0x10);
      }
      if (self->_searchField) {
        [(_UISearchBarVisualProviderLegacy *)self applySearchBarStyle];
      }
    }
  }
}

- (unint64_t)searchBarStyle
{
  return ((unint64_t)self->_searchBarVisualProviderFlags >> 3) & 7;
}

- (BOOL)isTranslucent
{
  return (*(_DWORD *)&self->_searchBarVisualProviderFlags & 0x1C0) == 64;
}

- (void)setBarTranslucence:(int64_t)a3
{
  unint64_t searchBarVisualProviderFlags = self->_searchBarVisualProviderFlags;
  if (((searchBarVisualProviderFlags >> 6) & 7) != a3)
  {
    self->_unint64_t searchBarVisualProviderFlags = ($B0CEE0411BC9260FB4C6BC24420153D9)(searchBarVisualProviderFlags & 0xFFFFFE3F | ((a3 & 7) << 6));
    [(UISearchBarBackground *)self->_searchBarBackground setTranslucent:[(_UISearchBarVisualProviderLegacy *)self isTranslucent]];
    [(_UISearchBarVisualProviderLegacy *)self updateSearchBarOpacity];
  }
}

- (void)_setBarTranslucence:(int64_t)a3
{
  self->_unint64_t searchBarVisualProviderFlags = ($B0CEE0411BC9260FB4C6BC24420153D9)(*(_DWORD *)&self->_searchBarVisualProviderFlags & 0xFFFFFE3F | ((a3 & 7) << 6));
}

- (int64_t)barTranslucence
{
  return ((unint64_t)self->_searchBarVisualProviderFlags >> 6) & 7;
}

- (void)setSearchFieldLeftViewMode:(int64_t)a3
{
  self->_unint64_t searchBarVisualProviderFlags = ($B0CEE0411BC9260FB4C6BC24420153D9)(*(_DWORD *)&self->_searchBarVisualProviderFlags & 0xFFFFF9FF | ((a3 & 3) << 9));
  searchField = self->_searchField;
  if (searchField) {
    [(UITextField *)searchField setLeftViewMode:a3 & 3];
  }
}

- (int64_t)searchFieldLeftViewMode
{
  return ((unint64_t)self->_searchBarVisualProviderFlags >> 9) & 3;
}

- (void)setCenterPlaceholder:(BOOL)a3
{
  BOOL v3 = a3;
  WeakRetained = self;
  uint64_t v5 = [(_UISearchBarVisualProviderBase *)self searchBar];
  if (v5 && ((((*((_DWORD *)WeakRetained + 26) & 0x800) == 0) ^ v3) & 1) == 0)
  {
    int v6 = v3 ? 2048 : 0;
    *((_DWORD *)WeakRetained + 26) = *((_DWORD *)WeakRetained + 26) & 0xFFFFF7FF | v6;
    id v9 = v5;
    if (v3)
    {
      WeakRetained = objc_loadWeakRetained((id *)WeakRetained + 12);
      BOOL v7 = WeakRetained == 0;
    }
    else
    {
      BOOL v7 = 0;
    }
    BOOL v8 = [v9 textInputTraits];
    [v8 setDeferBecomingResponder:v7];

    uint64_t v5 = v9;
    if (v3)
    {

      uint64_t v5 = v9;
    }
  }
}

- (BOOL)centerPlaceholder
{
  return (*((unsigned __int8 *)&self->_searchBarVisualProviderFlags + 1) >> 3) & 1;
}

- (void)setEnabled:(BOOL)a3
{
}

- (BOOL)isEnabled
{
  return (*((unsigned char *)&self->_searchBarVisualProviderFlags + 1) & 0x10) == 0;
}

- (void)setEnabled:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  BOOL v7 = [(_UISearchBarVisualProviderBase *)self searchBar];
  BOOL v8 = v7;
  if (v7 && v5 == (*(_DWORD *)&self->_searchBarVisualProviderFlags & 0x1000u) >> 12)
  {
    if (v5) {
      int v9 = 0;
    }
    else {
      int v9 = 4096;
    }
    self->_unint64_t searchBarVisualProviderFlags = ($B0CEE0411BC9260FB4C6BC24420153D9)(*(_DWORD *)&self->_searchBarVisualProviderFlags & 0xFFFFEFFF | v9);
    [v7 setUserInteractionEnabled:v5];
    v10 = [v8 _searchBarTextField];
    [v10 _setEnabled:v5 animated:v4];

    [(UIButton *)self->_cancelButton setEnabled:v5];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __56___UISearchBarVisualProviderLegacy_setEnabled_animated___block_invoke;
    v13[3] = &unk_1E52D9FC0;
    v13[4] = self;
    BOOL v14 = v5;
    v11 = _Block_copy(v13);
    BOOL v12 = v11;
    if (v4) {
      +[UIView animateWithDuration:v11 animations:0.35];
    }
    else {
      (*((void (**)(void *))v11 + 2))(v11);
    }
  }
}

- (void)setReliesOnNavigationBarBackdrop:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000;
  }
  else {
    int v3 = 0;
  }
  self->_unint64_t searchBarVisualProviderFlags = ($B0CEE0411BC9260FB4C6BC24420153D9)(*(_DWORD *)&self->_searchBarVisualProviderFlags & 0xFFFFDFFF | v3);
}

- (BOOL)reliesOnNavigationBarBackdrop
{
  return (*((unsigned __int8 *)&self->_searchBarVisualProviderFlags + 1) >> 5) & 1;
}

- (void)setDrawsBackgroundInPalette:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000;
  }
  else {
    int v3 = 0;
  }
  self->_unint64_t searchBarVisualProviderFlags = ($B0CEE0411BC9260FB4C6BC24420153D9)(*(_DWORD *)&self->_searchBarVisualProviderFlags & 0xFFFFBFFF | v3);
  [(_UISearchBarVisualProviderLegacy *)self updateForDrawsBackgroundInPalette];
}

- (BOOL)drawsBackgroundInPalette
{
  return (*((unsigned __int8 *)&self->_searchBarVisualProviderFlags + 1) >> 6) & 1;
}

- (void)setDrawsBackground:(BOOL)a3
{
  $B0CEE0411BC9260FB4C6BC24420153D9 searchBarVisualProviderFlags = self->_searchBarVisualProviderFlags;
  if ((((*(unsigned int *)&searchBarVisualProviderFlags >> 15) & 1) == 0) != a3)
  {
    if (a3) {
      int v4 = 0;
    }
    else {
      int v4 = 0x8000;
    }
    self->_$B0CEE0411BC9260FB4C6BC24420153D9 searchBarVisualProviderFlags = ($B0CEE0411BC9260FB4C6BC24420153D9)(*(_DWORD *)&searchBarVisualProviderFlags & 0xFFFF7FFF | v4);
    [(UIImageView *)self->_searchBarBackground setHidden:!a3];
  }
}

- (void)_setHideBackground:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000;
  }
  else {
    int v3 = 0;
  }
  self->_$B0CEE0411BC9260FB4C6BC24420153D9 searchBarVisualProviderFlags = ($B0CEE0411BC9260FB4C6BC24420153D9)(*(_DWORD *)&self->_searchBarVisualProviderFlags & 0xFFFF7FFF | v3);
}

- (BOOL)drawsBackground
{
  if ((*((unsigned char *)&self->_searchBarVisualProviderFlags + 1) & 0x80) != 0)
  {
    BOOL v2 = [(_UISearchBarVisualProviderLegacy *)self isInNavigationPalette];
    if (v2)
    {
      LOBYTE(v2) = [(_UISearchBarVisualProviderLegacy *)self drawsBackgroundInPalette];
    }
  }
  else
  {
    LOBYTE(v2) = 1;
  }
  return v2;
}

- (void)setUsesEmbeddedAppearance:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(_UISearchBarVisualProviderBase *)self searchBar];
  if (v5)
  {
    $B0CEE0411BC9260FB4C6BC24420153D9 searchBarVisualProviderFlags = self->_searchBarVisualProviderFlags;
    if (((*(_DWORD *)&searchBarVisualProviderFlags & 0x20000) == 0) == v3)
    {
      id v9 = v5;
      if (v3) {
        int v7 = 0x20000;
      }
      else {
        int v7 = 0;
      }
      self->_$B0CEE0411BC9260FB4C6BC24420153D9 searchBarVisualProviderFlags = ($B0CEE0411BC9260FB4C6BC24420153D9)(*(_DWORD *)&searchBarVisualProviderFlags & 0xFFFDFFFF | v7);
      [(UISearchBarBackground *)self->_searchBarBackground setUsesEmbeddedAppearance:v3];
      barTintColor = self->_barTintColor;
      if (barTintColor) {
        [(_UISearchBarVisualProviderLegacy *)self setBarTintColor:barTintColor forceUpdate:1];
      }
      [v9 setNeedsLayout];
      BOOL v5 = v9;
    }
  }
}

- (BOOL)usesEmbeddedAppearance
{
  return (*((unsigned __int8 *)&self->_searchBarVisualProviderFlags + 2) >> 1) & 1;
}

- (void)setShowsCancelButton:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  int v7 = [(_UISearchBarVisualProviderBase *)self searchBar];
  BOOL v8 = v7;
  if (v7 && ((((*((unsigned char *)&self->_searchBarVisualProviderFlags + 2) & 4) == 0) ^ v5) & 1) == 0)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __66___UISearchBarVisualProviderLegacy_setShowsCancelButton_animated___block_invoke;
    aBlock[3] = &unk_1E52DD128;
    BOOL v26 = v5;
    aBlock[4] = self;
    BOOL v27 = v4;
    id v9 = v7;
    id v25 = v9;
    v10 = (void (**)(void))_Block_copy(aBlock);
    v11 = [v9 _searchController];
    BOOL v12 = [v11 _managedPalette];

    if (v12) {
      v10[2](v10);
    }
    else {
      +[UIView performWithoutAnimation:v10];
    }
    if (v5) {
      int v13 = 0x40000;
    }
    else {
      int v13 = 0;
    }
    self->_$B0CEE0411BC9260FB4C6BC24420153D9 searchBarVisualProviderFlags = ($B0CEE0411BC9260FB4C6BC24420153D9)(*(_DWORD *)&self->_searchBarVisualProviderFlags & 0xFFFBFFFF | v13);
    [v9 setNeedsLayout];
    if ([(_UISearchBarVisualProviderLegacy *)self centerPlaceholder])
    {
      id WeakRetained = objc_loadWeakRetained(&self->_searchDisplayController);

      if (!WeakRetained && v4 && (*((unsigned char *)&self->_searchBarVisualProviderFlags + 2) & 4) != 0)
      {
        [(_UISearchBarVisualProviderLegacy *)self allowCursorToAppear:0];
        v15 = [v9 textInputTraits];
        [v15 setDeferBecomingResponder:0];
      }
    }
    if (v4)
    {
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __66___UISearchBarVisualProviderLegacy_setShowsCancelButton_animated___block_invoke_2;
      v22[3] = &unk_1E52D9F70;
      id v23 = v9;
      uint64_t v16 = MEMORY[0x1E4F143A8];
      uint64_t v17 = 3221225472;
      v18 = __66___UISearchBarVisualProviderLegacy_setShowsCancelButton_animated___block_invoke_3;
      v19 = &unk_1E52DA660;
      v20 = self;
      id v21 = v23;
      +[UIView animateWithDuration:4 delay:v22 options:&v16 animations:0.25 completion:0.0];
    }
    else if ((*((unsigned char *)&self->_searchBarVisualProviderFlags + 2) & 4) == 0)
    {
      [(_UISearchBarVisualProviderLegacy *)self destroyCancelButton];
    }
    if ([(_UISearchBarVisualProviderLegacy *)self isInBarButNotHosted]) {
      [(_UISearchBarVisualProviderLegacy *)self displayNavBarCancelButton:(*(_DWORD *)&self->_searchBarVisualProviderFlags >> 18) & 1 animated:v4];
    }
  }
}

- (void)setShowsCancelButton:(BOOL)a3
{
}

- (void)_setShowsCancelButton:(BOOL)a3
{
  if (a3) {
    int v3 = 0x40000;
  }
  else {
    int v3 = 0;
  }
  self->_$B0CEE0411BC9260FB4C6BC24420153D9 searchBarVisualProviderFlags = ($B0CEE0411BC9260FB4C6BC24420153D9)(*(_DWORD *)&self->_searchBarVisualProviderFlags & 0xFFFBFFFF | v3);
}

- (BOOL)showsCancelButton
{
  return (*((unsigned __int8 *)&self->_searchBarVisualProviderFlags + 2) >> 2) & 1;
}

- (void)setAutoDisableCancelButton:(BOOL)a3
{
  if (a3) {
    int v3 = 0x80000;
  }
  else {
    int v3 = 0;
  }
  self->_$B0CEE0411BC9260FB4C6BC24420153D9 searchBarVisualProviderFlags = ($B0CEE0411BC9260FB4C6BC24420153D9)(*(_DWORD *)&self->_searchBarVisualProviderFlags & 0xFFF7FFFF | v3);
  if (!a3) {
    [(UIButton *)self->_cancelButton setEnabled:1];
  }
}

- (void)_setAutoDisableCancelButton:(BOOL)a3
{
  if (a3) {
    int v3 = 0x80000;
  }
  else {
    int v3 = 0;
  }
  self->_$B0CEE0411BC9260FB4C6BC24420153D9 searchBarVisualProviderFlags = ($B0CEE0411BC9260FB4C6BC24420153D9)(*(_DWORD *)&self->_searchBarVisualProviderFlags & 0xFFF7FFFF | v3);
}

- (BOOL)autoDisableCancelButton
{
  return (*((unsigned __int8 *)&self->_searchBarVisualProviderFlags + 2) >> 3) & 1;
}

- (void)setShowsSearchResultsButton:(BOOL)a3
{
  $B0CEE0411BC9260FB4C6BC24420153D9 searchBarVisualProviderFlags = self->_searchBarVisualProviderFlags;
  if (((((*(_DWORD *)&searchBarVisualProviderFlags & 0x200000) == 0) ^ a3) & 1) == 0)
  {
    if (a3) {
      int v4 = 0x200000;
    }
    else {
      int v4 = 0;
    }
    self->_$B0CEE0411BC9260FB4C6BC24420153D9 searchBarVisualProviderFlags = ($B0CEE0411BC9260FB4C6BC24420153D9)(*(_DWORD *)&searchBarVisualProviderFlags & 0xFFDFFFFF | v4);
    [(_UISearchBarVisualProviderLegacy *)self updateRightView];
  }
}

- (void)_setShowsSearchResultsButton:(BOOL)a3
{
  if (a3) {
    int v3 = 0x200000;
  }
  else {
    int v3 = 0;
  }
  self->_$B0CEE0411BC9260FB4C6BC24420153D9 searchBarVisualProviderFlags = ($B0CEE0411BC9260FB4C6BC24420153D9)(*(_DWORD *)&self->_searchBarVisualProviderFlags & 0xFFDFFFFF | v3);
}

- (BOOL)showsSearchResultsButton
{
  return (*((unsigned __int8 *)&self->_searchBarVisualProviderFlags + 2) >> 5) & 1;
}

- (void)setSearchResultsButtonSelected:(BOOL)a3
{
  $B0CEE0411BC9260FB4C6BC24420153D9 searchBarVisualProviderFlags = self->_searchBarVisualProviderFlags;
  if (((((*(_DWORD *)&searchBarVisualProviderFlags & 0x400000) == 0) ^ a3) & 1) == 0)
  {
    if (a3) {
      int v4 = 0x400000;
    }
    else {
      int v4 = 0;
    }
    self->_$B0CEE0411BC9260FB4C6BC24420153D9 searchBarVisualProviderFlags = ($B0CEE0411BC9260FB4C6BC24420153D9)(*(_DWORD *)&searchBarVisualProviderFlags & 0xFFBFFFFF | v4);
    [(_UISearchBarVisualProviderLegacy *)self updateRightView];
  }
}

- (void)_setSearchResultsButtonSelected:(BOOL)a3
{
  if (a3) {
    int v3 = 0x400000;
  }
  else {
    int v3 = 0;
  }
  self->_$B0CEE0411BC9260FB4C6BC24420153D9 searchBarVisualProviderFlags = ($B0CEE0411BC9260FB4C6BC24420153D9)(*(_DWORD *)&self->_searchBarVisualProviderFlags & 0xFFBFFFFF | v3);
}

- (BOOL)isSearchResultsButtonSelected
{
  return (*((unsigned __int8 *)&self->_searchBarVisualProviderFlags + 2) >> 6) & 1;
}

- (void)setShowsBookmarkButton:(BOOL)a3
{
  $B0CEE0411BC9260FB4C6BC24420153D9 searchBarVisualProviderFlags = self->_searchBarVisualProviderFlags;
  if (((((*(_DWORD *)&searchBarVisualProviderFlags & 0x800000) == 0) ^ a3) & 1) == 0)
  {
    if (a3) {
      int v4 = 0x800000;
    }
    else {
      int v4 = 0;
    }
    self->_$B0CEE0411BC9260FB4C6BC24420153D9 searchBarVisualProviderFlags = ($B0CEE0411BC9260FB4C6BC24420153D9)(*(_DWORD *)&searchBarVisualProviderFlags & 0xFF7FFFFF | v4);
    [(_UISearchBarVisualProviderLegacy *)self updateRightView];
  }
}

- (void)_setShowsBookmarkButton:(BOOL)a3
{
  if (a3) {
    int v3 = 0x800000;
  }
  else {
    int v3 = 0;
  }
  self->_$B0CEE0411BC9260FB4C6BC24420153D9 searchBarVisualProviderFlags = ($B0CEE0411BC9260FB4C6BC24420153D9)(*(_DWORD *)&self->_searchBarVisualProviderFlags & 0xFF7FFFFF | v3);
}

- (BOOL)showsBookmarkButton
{
  return *((unsigned __int8 *)&self->_searchBarVisualProviderFlags + 2) >> 7;
}

- (void)setShowsScopeBar:(BOOL)a3 animateOpacity:(BOOL)a4
{
  BOOL v4 = a4;
  unsigned int v5 = a3;
  int v7 = [(_UISearchBarVisualProviderBase *)self searchBar];
  BOOL v8 = v7;
  if (v7)
  {
    $B0CEE0411BC9260FB4C6BC24420153D9 searchBarVisualProviderFlags = self->_searchBarVisualProviderFlags;
    if (((((*(_DWORD *)&searchBarVisualProviderFlags & 0x10000000) == 0) ^ v5) & 1) == 0)
    {
      if ((v5 & v4) != 0) {
        int v10 = 0x40000000;
      }
      else {
        int v10 = 0;
      }
      int v11 = *(_DWORD *)&searchBarVisualProviderFlags & 0x2FFFFFFF;
      if ((v4 & ~v5) != 0) {
        unsigned int v12 = 0x80000000;
      }
      else {
        unsigned int v12 = 0;
      }
      if (v5) {
        int v13 = 0x10000000;
      }
      else {
        int v13 = 0;
      }
      self->_$B0CEE0411BC9260FB4C6BC24420153D9 searchBarVisualProviderFlags = ($B0CEE0411BC9260FB4C6BC24420153D9)(v10 | v13 | v12 | v11);
      [v7 invalidateIntrinsicContentSize];
      [v8 setNeedsLayout];
      if (v4)
      {
        double v14 = 1.0;
        if (v5) {
          double v14 = 0.0;
        }
        [(UIView *)self->_scopeBarContainerView setAlpha:v14];
        v16[4] = self;
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = __68___UISearchBarVisualProviderLegacy_setShowsScopeBar_animateOpacity___block_invoke;
        v17[3] = &unk_1E52D9FC0;
        char v18 = v5;
        v17[4] = self;
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __68___UISearchBarVisualProviderLegacy_setShowsScopeBar_animateOpacity___block_invoke_4;
        v16[3] = &unk_1E52DC3A0;
        +[UIView animateKeyframesWithDuration:0 delay:v17 options:v16 animations:0.0 completion:0.0];
      }
      if (self->_scopeBarContainerView) {
        uint64_t v15 = v5;
      }
      else {
        uint64_t v15 = 0;
      }
      [(UISearchBarBackground *)self->_searchBarBackground setUsesContiguousBarBackground:v15];
    }
  }
}

- (void)setShowsScopeBar:(BOOL)a3
{
}

- (void)_setShowsScopeBar:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000000;
  }
  else {
    int v3 = 0;
  }
  self->_$B0CEE0411BC9260FB4C6BC24420153D9 searchBarVisualProviderFlags = ($B0CEE0411BC9260FB4C6BC24420153D9)(*(_DWORD *)&self->_searchBarVisualProviderFlags & 0xEFFFFFFF | v3);
}

- (BOOL)showsScopeBar
{
  return (*((unsigned __int8 *)&self->_searchBarVisualProviderFlags + 3) >> 4) & 1;
}

- (void)setAllowsInlineScopeBar:(BOOL)a3
{
  if (a3) {
    int v3 = 0x20000000;
  }
  else {
    int v3 = 0;
  }
  self->_$B0CEE0411BC9260FB4C6BC24420153D9 searchBarVisualProviderFlags = ($B0CEE0411BC9260FB4C6BC24420153D9)(*(_DWORD *)&self->_searchBarVisualProviderFlags & 0xDFFFFFFF | v3);
}

- (BOOL)allowsInlineScopeBar
{
  return (*((unsigned __int8 *)&self->_searchBarVisualProviderFlags + 3) >> 5) & 1;
}

- (BOOL)backgroundLayoutNeedsUpdate
{
  return *((unsigned char *)&self->_searchBarVisualProviderFlags + 2) & 1;
}

- (void)setPlacedInNavigationBar:(BOOL)a3
{
  if (a3) {
    int v3 = 0x1000000;
  }
  else {
    int v3 = 0;
  }
  self->_$B0CEE0411BC9260FB4C6BC24420153D9 searchBarVisualProviderFlags = ($B0CEE0411BC9260FB4C6BC24420153D9)(*(_DWORD *)&self->_searchBarVisualProviderFlags & 0xFEFFFFFF | v3);
}

- (BOOL)isPlacedInNavigationBar
{
  return *((unsigned char *)&self->_searchBarVisualProviderFlags + 3) & 1;
}

- (void)setPlacedInToolbar:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000000;
  }
  else {
    int v3 = 0;
  }
  self->_$B0CEE0411BC9260FB4C6BC24420153D9 searchBarVisualProviderFlags = ($B0CEE0411BC9260FB4C6BC24420153D9)(*(_DWORD *)&self->_searchBarVisualProviderFlags & 0xFDFFFFFF | v3);
}

- (BOOL)isPlacedInToolbar
{
  return (*((unsigned __int8 *)&self->_searchBarVisualProviderFlags + 3) >> 1) & 1;
}

- (void)setInNavigationPalette:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000000;
  }
  else {
    int v3 = 0;
  }
  self->_$B0CEE0411BC9260FB4C6BC24420153D9 searchBarVisualProviderFlags = ($B0CEE0411BC9260FB4C6BC24420153D9)(*(_DWORD *)&self->_searchBarVisualProviderFlags & 0xFBFFFFFF | v3);
}

- (BOOL)isInNavigationPalette
{
  return (*((unsigned __int8 *)&self->_searchBarVisualProviderFlags + 3) >> 2) & 1;
}

- (void)setHostedByNavigationBar:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000000;
  }
  else {
    int v3 = 0;
  }
  self->_$B0CEE0411BC9260FB4C6BC24420153D9 searchBarVisualProviderFlags = ($B0CEE0411BC9260FB4C6BC24420153D9)(*(_DWORD *)&self->_searchBarVisualProviderFlags & 0xF7FFFFFF | v3);
}

- (BOOL)isHostedByNavigationBar
{
  return (*((unsigned __int8 *)&self->_searchBarVisualProviderFlags + 3) >> 3) & 1;
}

- (void)setCancelButton:(id)a3
{
  unsigned int v5 = (UIButton *)a3;
  p_cancelButton = &self->_cancelButton;
  if (*p_cancelButton != v5)
  {
    int v7 = v5;
    [(UIView *)*p_cancelButton removeFromSuperview];
    objc_storeStrong((id *)p_cancelButton, a3);
    unsigned int v5 = v7;
  }
}

- (void)setScopeTitles:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![(NSArray *)self->_scopeTitles isEqualToArray:v4] || v4 && !self->_scopeTitles)
  {
    unsigned int v5 = (NSArray *)[v4 copy];
    scopeTitles = self->_scopeTitles;
    self->_scopeTitles = v5;

    [(_UISearchBarVisualProviderLegacy *)self setUpScopeBar];
    scopeBar = self->_scopeBar;
    if (scopeBar)
    {
      [(UISegmentedControl *)scopeBar removeAllSegments];
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      id v8 = v4;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = 0;
        uint64_t v12 = *(void *)v17;
        do
        {
          uint64_t v13 = 0;
          do
          {
            if (*(void *)v17 != v12) {
              objc_enumerationMutation(v8);
            }
            -[UISegmentedControl insertSegmentWithTitle:atIndex:animated:](self->_scopeBar, "insertSegmentWithTitle:atIndex:animated:", *(void *)(*((void *)&v16 + 1) + 8 * v13), v11 + v13, 0, (void)v16);
            ++v13;
          }
          while (v10 != v13);
          uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
          v11 += v13;
        }
        while (v10);
      }

      unint64_t selectedScope = self->_selectedScope;
      if (selectedScope >= [v8 count])
      {
        uint64_t v15 = [v8 count] - 1;
        self->_unint64_t selectedScope = v15;
      }
      else
      {
        uint64_t v15 = self->_selectedScope;
      }
      -[UISegmentedControl setSelectedSegmentIndex:](self->_scopeBar, "setSelectedSegmentIndex:", v15, (void)v16);
    }
  }
}

- (void)setMinimumContentInset:(UIEdgeInsets)a3
{
  if (self->_minimumContentInsetPrivate.left != a3.left
    || self->_minimumContentInsetPrivate.top != a3.top
    || self->_minimumContentInsetPrivate.right != a3.right
    || self->_minimumContentInsetPrivate.bottom != a3.bottom)
  {
    self->_minimumContentInsetPrivate = a3;
    [(_UISearchBarVisualProviderLegacy *)self updateEffectiveContentInset];
  }
}

- (void)setBackdropStyle:(int64_t)a3
{
  unsigned int v5 = [(_UISearchBarVisualProviderBase *)self searchBar];
  if (v5 && self->_backdropStyle != a3)
  {
    self->_backdropStyle = a3;
    self->_$B0CEE0411BC9260FB4C6BC24420153D9 searchBarVisualProviderFlags = ($B0CEE0411BC9260FB4C6BC24420153D9)(*(_DWORD *)&self->_searchBarVisualProviderFlags & 0xFFFFFFC7 | 0x10);
    id v12 = v5;
    [(_UISearchBarVisualProviderLegacy *)self updateNeedForBackdrop];
    [(UISearchBarBackground *)self->_searchBarBackground setSearchBarStyle:((unint64_t)self->_searchBarVisualProviderFlags >> 3) & 7];
    int v6 = [v12 _searchBarTextField];
    int v7 = [v6 _systemBackgroundView];
    id v8 = [v12 layer];
    [v8 setAllowsGroupBlending:0];

    uint64_t v9 = [v12 layer];
    [v9 setAllowsGroupOpacity:0];

    uint64_t v10 = [v7 layer];
    [v10 setAllowsGroupBlending:0];

    [v7 setBackgroundContainer:1];
    [v6 updateForBackdropStyle:self->_backdropStyle];
    uint64_t v11 = [(_UISearchBarVisualProviderLegacy *)self colorForComponent:4 disabled:0];
    [v6 setTextColor:v11];

    [(_UISearchBarVisualProviderLegacy *)self updatePlaceholderColor];
    [(_UISearchBarVisualProviderLegacy *)self updateMagnifyingGlassView];
    [(_UISearchBarVisualProviderLegacy *)self updateRightView];
    [v12 setNeedsLayout];

    unsigned int v5 = v12;
  }
}

- (void)setBarPosition:(int64_t)a3
{
  unsigned int v5 = [(_UISearchBarVisualProviderBase *)self searchBar];
  if (v5 && self->_barPosition != a3)
  {
    id v9 = v5;
    if (!a3) {
      a3 = 2;
    }
    [(UISearchBarBackground *)self->_searchBarBackground _setBarPosition:a3];
    self->_int64_t barPosition = a3;
    *(_DWORD *)&self->_searchBarVisualProviderFlags |= 0x10000u;
    id WeakRetained = objc_loadWeakRetained(&self->_searchDisplayController);
    if (!WeakRetained
      && ([v9 _searchController], (id WeakRetained = objc_claimAutoreleasedReturnValue()) == 0)
      || (int64_t barPosition = self->_barPosition, WeakRetained, barPosition == 3))
    {
      BOOL v8 = self->_barPosition != 3 && (*((unsigned char *)&self->_searchBarVisualProviderFlags + 3) & 0xC) == 0;
      [(_UISearchBarVisualProviderLegacy *)self setClippingViewActive:v8];
    }
    [(_UISearchBarVisualProviderLegacy *)self updateEffectiveContentInset];
    [v9 setNeedsLayout];
    unsigned int v5 = v9;
  }
}

- (int64_t)barPosition
{
  if (self->_searchBarBackground) {
    return [(UISearchBarBackground *)self->_searchBarBackground _barPosition];
  }
  else {
    return self->_barPosition;
  }
}

- (void)setPrompt:(id)a3
{
  id v8 = a3;
  id v4 = [(_UISearchBarVisualProviderBase *)self searchBar];
  if (v4)
  {
    unsigned int v5 = self->_promptLabel;
    int v6 = v5;
    if (v8)
    {
      if (!v5)
      {
        [(_UISearchBarVisualProviderLegacy *)self setUpPromptLabel];
        int v6 = self->_promptLabel;
        [v4 invalidateIntrinsicContentSize];
      }
      -[UILabel setText:](v6, "setText:");
    }
    else
    {
      if (!v5) {
        goto LABEL_9;
      }
      [(UIView *)self->_promptLabel removeFromSuperview];
      promptLabel = self->_promptLabel;
      self->_promptLabel = 0;

      [v4 invalidateIntrinsicContentSize];
    }
  }
LABEL_9:
}

- (id)prompt
{
  return [(UILabel *)self->_promptLabel text];
}

- (id)searchField
{
  searchField = self->_searchField;
  if (!searchField)
  {
    [(_UISearchBarVisualProviderLegacy *)self setUpSearchField];
    searchField = self->_searchField;
  }
  return searchField;
}

- (id)searchFieldIfExists
{
  return self->_searchField;
}

- (id)leftButton
{
  [(_UISearchBarVisualProviderLegacy *)self setUpLeftButton];
  leftButton = self->_leftButton;
  return leftButton;
}

- (id)cancelBarButtonItem
{
  int v3 = [(_UISearchBarVisualProviderBase *)self searchBar];
  if (v3)
  {
    if (!self->_cancelBarButtonItem)
    {
      id v4 = [UIBarButtonItem alloc];
      cancelButtonText = self->_cancelButtonText;
      int v6 = cancelButtonText;
      if (!cancelButtonText)
      {
        int v6 = _UINSLocalizedStringWithDefaultValue(@"Cancel", @"Cancel");
      }
      int v7 = [(UIBarButtonItem *)v4 initWithTitle:v6 style:2 target:v3 action:sel__cancelButtonPressed];
      cancelBarButtonItem = self->_cancelBarButtonItem;
      self->_cancelBarButtonItem = v7;

      if (!cancelButtonText) {
    }
      }
    id v9 = self->_cancelBarButtonItem;
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (void)prepare
{
  v12.receiver = self;
  v12.super_class = (Class)_UISearchBarVisualProviderLegacy;
  [(_UISearchBarVisualProviderBase *)&v12 prepare];
  id v4 = [(_UISearchBarVisualProviderBase *)self searchBar];
  if (!v4)
  {
    uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"_UISearchBarVisualProviderLegacy.m" lineNumber:789 description:@"visual provider can not prepare without delegate"];
  }
  self->_tableViewIndexWidth = 0.0;
  *(_OWORD *)&self->_minimumContentInsetPrivate.top = 0u;
  *(_OWORD *)&self->_minimumContentInsetPrivate.bottom = 0u;
  *(_DWORD *)&self->_searchBarVisualProviderFlags |= 0x80000u;
  [(_UISearchBarVisualProviderLegacy *)self updateEffectiveContentInset];
  unsigned int v5 = [UIView alloc];
  [v4 bounds];
  int v6 = -[UIView initWithFrame:](v5, "initWithFrame:");
  searchBarClippingView = self->_searchBarClippingView;
  self->_searchBarClippingView = v6;

  [(UIView *)self->_searchBarClippingView setAutoresizingMask:18];
  [(UIView *)self->_searchBarClippingView setClipsToBounds:1];
  [v4 addSubview:self->_searchBarClippingView];
  *(_DWORD *)&self->_searchBarVisualProviderFlags |= 0x14E00u;
  id v8 = [UISearchBarBackground alloc];
  [v4 bounds];
  id v9 = -[UISearchBarBackground initWithFrame:](v8, "initWithFrame:");
  searchBarBackground = self->_searchBarBackground;
  self->_searchBarBackground = v9;

  [v4 insertSubview:self->_searchBarBackground atIndex:0];
}

- (id)runtimeOnlyViews
{
  int v3 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:7];
  id v4 = v3;
  if (self->_searchBarClippingView) {
    objc_msgSend(v3, "addObject:");
  }
  if (self->_promptLabel) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_cancelButton) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_searchField) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_separator) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_searchBarBackground) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_scopeBarContainerView) {
    objc_msgSend(v4, "addObject:");
  }
  unsigned int v5 = (void *)[v4 copy];

  return v5;
}

- (void)teardown
{
  id v4 = [(_UISearchBarVisualProviderBase *)self searchBar];
  if (!v4)
  {
    unsigned int v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2 object:self file:@"_UISearchBarVisualProviderLegacy.m" lineNumber:834 description:@"visual provider can not clean up without delegate"];
  }
  [(UIControl *)self->_scopeBar removeTarget:v4 action:0 forControlEvents:0xFFFFFFFFLL];
  [(UIControl *)self->_searchField removeTarget:v4 action:0 forControlEvents:0xFFFFFFFFLL];
  [(UISearchTextField *)self->_searchField setDelegate:0];
  [(UITextField *)self->_searchField removeFromSuperview];
  [(UIView *)self->_promptLabel removeFromSuperview];
  [(UIView *)self->_cancelButton removeFromSuperview];
  [(UIView *)self->_separator removeFromSuperview];
  [(UIView *)self->_searchBarBackground removeFromSuperview];
  [(UIView *)self->_scopeBarContainerView removeFromSuperview];
  [(UIView *)self->_scopeBarBackgroundView removeFromSuperview];
  v6.receiver = self;
  v6.super_class = (Class)_UISearchBarVisualProviderLegacy;
  [(_UISearchBarVisualProviderBase *)&v6 teardown];
}

- (void)destroyCancelButton
{
  [(UIView *)self->_cancelButton removeFromSuperview];
  cancelButton = self->_cancelButton;
  self->_cancelButton = 0;
}

- (void)destroyPromptLabel
{
  [(UIView *)self->_promptLabel removeFromSuperview];
  promptLabel = self->_promptLabel;
  self->_promptLabel = 0;
}

- (id)currentSeparatorImage
{
  int v3 = [(_UISearchBarAppearanceStorage *)self->_appearanceStorage separatorImage];

  if (v3)
  {
    id v4 = [(_UISearchBarAppearanceStorage *)self->_appearanceStorage separatorImage];
  }
  else
  {
    if ((*(unsigned char *)&self->_searchBarVisualProviderFlags & 7) != 0
      || ([(_UISearchBarVisualProviderLegacy *)self effectiveBarTintColor],
          unsigned int v5 = objc_claimAutoreleasedReturnValue(),
          v5,
          v5))
    {
      objc_super v6 = [(_UISearchBarVisualProviderLegacy *)self effectiveBarTintColor];
      if ((v6 || (*(_DWORD *)&self->_searchBarVisualProviderFlags & 7) == 1)
        && (int v7 = *(_DWORD *)&self->_searchBarVisualProviderFlags & 0x1C0, v6, v7 != 64))
      {
        id v8 = @"UISearchBarBlackSeparator.png";
      }
      else
      {
        id v8 = @"UISearchBarBlackTranslucentSeparator.png";
      }
    }
    else
    {
      id v8 = @"UISearchBarDefaultSeparator.png";
    }
    id v4 = _UIImageWithName(v8);
  }
  return v4;
}

- (id)separatorImage
{
  return [(_UISearchBarAppearanceStorage *)self->_appearanceStorage separatorImage];
}

- (void)setSeparatorImage:(id)a3
{
  id v4 = a3;
  appearanceStorage = self->_appearanceStorage;
  id v11 = v4;
  if (v4)
  {
    if (!appearanceStorage)
    {
      objc_super v6 = objc_alloc_init(_UISearchBarAppearanceStorage);
      int v7 = self->_appearanceStorage;
      self->_appearanceStorage = v6;

      appearanceStorage = self->_appearanceStorage;
    }
  }
  else if (!appearanceStorage)
  {
    goto LABEL_7;
  }
  id v8 = [(_UISearchBarAppearanceStorage *)appearanceStorage separatorImage];

  id v4 = v11;
  if (v8 != v11)
  {
    [(_UISearchBarAppearanceStorage *)self->_appearanceStorage setSeparatorImage:v11];
    separator = self->_separator;
    uint64_t v10 = [(_UISearchBarVisualProviderLegacy *)self currentSeparatorImage];
    [(UIImageView *)separator setImage:v10];

    id v4 = v11;
  }
LABEL_7:
}

- (void)setSearchFieldBackgroundImage:(id)a3 forState:(unint64_t)a4
{
  id v6 = a3;
  appearanceStorage = self->_appearanceStorage;
  id v11 = v6;
  if (v6)
  {
    if (!appearanceStorage)
    {
      id v8 = objc_alloc_init(_UISearchBarAppearanceStorage);
      id v9 = self->_appearanceStorage;
      self->_appearanceStorage = v8;

      appearanceStorage = self->_appearanceStorage;
    }
  }
  else if (!appearanceStorage)
  {
    goto LABEL_7;
  }
  id v10 = [(_UISearchBarAppearanceStorage *)appearanceStorage searchFieldBackgroundImageForState:a4];

  id v6 = v11;
  if (v10 != v11)
  {
    [(_UISearchBarAppearanceStorage *)self->_appearanceStorage setSearchFieldBackgroundImage:v11 forState:2 * (a4 != 0)];
    [(_UISearchBarVisualProviderLegacy *)self updateSearchFieldArt];
    id v6 = v11;
  }
LABEL_7:
}

- (id)searchFieldBackgroundImageForState:(unint64_t)a3
{
  return [(_UISearchBarAppearanceStorage *)self->_appearanceStorage searchFieldBackgroundImageForState:2 * (a3 != 0)];
}

- (id)internalImageForSearchBarIcon:(int64_t)a3 state:(unint64_t)a4
{
  return [(_UISearchBarVisualProviderLegacy *)self internalImageForSearchBarIcon:a3 state:a4 customImage:0];
}

- (id)internalImageForSearchBarIcon:(int64_t)a3 state:(unint64_t)a4 customImage:(BOOL *)a5
{
  id v9 = [(_UISearchBarVisualProviderBase *)self searchBar];
  if (!v9)
  {
    objc_super v12 = objc_alloc_init(UIImage);
    goto LABEL_6;
  }
  uint64_t v10 = [(_UISearchBarAppearanceStorage *)self->_appearanceStorage imageForIcon:a3 state:a4];
  if (!v10)
  {
    if (a5) {
      *a5 = 0;
    }
    if (a3 == 3)
    {
      if (!internalImageForSearchBarIcon_state_customImage__searchBarIcons)
      {
        uint64_t v14 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:4];
        uint64_t v15 = (void *)internalImageForSearchBarIcon_state_customImage__searchBarIcons;
        internalImageForSearchBarIcon_state_customImage__searchBarIcons = v14;
      }
      long long v16 = [v9 _searchBarTextField];
      unsigned int v17 = [v16 _partsShouldBeMini];

      long long v18 = objc_msgSend(NSString, "stringWithFormat:", @"SearchBarResults_state:%lu_mini:%d_barStyle:%d_searchBarStyle:%lu_backdropStyle:%lu", a4, v17, *(_DWORD *)&self->_searchBarVisualProviderFlags & 7, ((unint64_t)self->_searchBarVisualProviderFlags >> 3) & 7, self->_backdropStyle);
      id v11 = [(id)internalImageForSearchBarIcon_state_customImage__searchBarIcons objectForKey:v18];
      if (v11) {
        goto LABEL_32;
      }
      long long v19 = @"UITextFieldSearchResultsListButtonMini.png";
      v20 = @"UITextFieldSearchResultsListButton.png";
    }
    else
    {
      if (a3 != 2)
      {
        if (a3)
        {
          id v11 = 0;
          goto LABEL_33;
        }
        if (UISearchBarUsesModernAppearance()) {
          uint64_t v13 = @"UISearchFieldIconLarger.png";
        }
        else {
          uint64_t v13 = @"UISearchFieldIcon.png";
        }
        _UIImageWithName(v13);
        objc_super v12 = (UIImage *)objc_claimAutoreleasedReturnValue();
LABEL_6:
        id v11 = v12;
        goto LABEL_33;
      }
      if (!internalImageForSearchBarIcon_state_customImage__searchBarIcons)
      {
        uint64_t v21 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:4];
        v22 = (void *)internalImageForSearchBarIcon_state_customImage__searchBarIcons;
        internalImageForSearchBarIcon_state_customImage__searchBarIcons = v21;
      }
      id v23 = [v9 _searchBarTextField];
      unsigned int v17 = [v23 _partsShouldBeMini];

      long long v18 = objc_msgSend(NSString, "stringWithFormat:", @"SearchBarBookmark_state:%lu_mini:%d_barStyle:%d_searchBarStyle:%lu_backdropStyle:%lu", a4, v17, *(_DWORD *)&self->_searchBarVisualProviderFlags & 7, ((unint64_t)self->_searchBarVisualProviderFlags >> 3) & 7, self->_backdropStyle);
      id v11 = [(id)internalImageForSearchBarIcon_state_customImage__searchBarIcons objectForKey:v18];
      if (v11)
      {
LABEL_32:

        goto LABEL_33;
      }
      long long v19 = @"UISearchBarBookmarksMini.png";
      v20 = @"UISearchBarBookmarks.png";
    }
    if (v17) {
      v24 = v20;
    }
    else {
      v24 = v19;
    }
    id v25 = _UIImageWithName(v24);
    if (a4 == 1) {
      +[UIColor colorWithRed:0.047 green:0.455 blue:0.867 alpha:1.0];
    }
    else {
    BOOL v26 = [(_UISearchBarVisualProviderLegacy *)self colorForComponent:0 disabled:a4 == 2];
    }
    [v25 size];
    id v11 = +[UIImage _tintedImageForSize:withTint:effectsImage:maskImage:style:](UIImage, "_tintedImageForSize:withTint:effectsImage:maskImage:style:", v26, 0, v25, 0);
    [(id)internalImageForSearchBarIcon_state_customImage__searchBarIcons setObject:v11 forKey:v18];

    goto LABEL_32;
  }
  id v11 = (void *)v10;
  if (a5) {
    *a5 = 1;
  }
LABEL_33:

  return v11;
}

- (void)setImage:(id)a3 forSearchBarIcon:(int64_t)a4 state:(unint64_t)a5
{
  id v14 = a3;
  id v8 = [(_UISearchBarVisualProviderBase *)self searchBar];
  if (v8)
  {
    appearanceStorage = self->_appearanceStorage;
    if (v14)
    {
      if (!appearanceStorage)
      {
        uint64_t v10 = objc_alloc_init(_UISearchBarAppearanceStorage);
        id v11 = self->_appearanceStorage;
        self->_appearanceStorage = v10;

        appearanceStorage = self->_appearanceStorage;
      }
    }
    else if (!appearanceStorage)
    {
      goto LABEL_14;
    }
    if (a5 >= 3) {
      a5 = 1;
    }
    id v12 = [(_UISearchBarAppearanceStorage *)appearanceStorage imageForIcon:a4 state:a5];

    if (v12 != v14)
    {
      [(_UISearchBarAppearanceStorage *)self->_appearanceStorage setImage:v14 forIcon:a4 state:a5];
      if ((a4 & 0xFFFFFFFFFFFFFFFELL) == 2)
      {
        [(_UISearchBarVisualProviderLegacy *)self updateRightView];
      }
      else if (a4)
      {
        uint64_t v13 = [v8 _searchBarTextField];
        [v13 _setClearButtonImage:v14 forState:a5];
      }
      else
      {
        [(_UISearchBarVisualProviderLegacy *)self updateMagnifyingGlassView];
      }
    }
  }
LABEL_14:
}

- (id)imageForSearchBarIcon:(int64_t)a3 state:(unint64_t)a4
{
  appearanceStorage = self->_appearanceStorage;
  if (a4 >= 3) {
    a4 = 1;
  }
  return [(_UISearchBarAppearanceStorage *)appearanceStorage imageForIcon:a3 state:a4];
}

- (void)setScopeBarBackgroundImage:(id)a3
{
  id v4 = a3;
  if (v4 || self->_scopeBar)
  {
    id v9 = v4;
    appearanceStorage = self->_appearanceStorage;
    if (!appearanceStorage)
    {
      id v6 = objc_alloc_init(_UISearchBarAppearanceStorage);
      int v7 = self->_appearanceStorage;
      self->_appearanceStorage = v6;

      appearanceStorage = self->_appearanceStorage;
    }
    id v8 = [(_UISearchBarAppearanceStorage *)appearanceStorage scopeBarBackgroundImage];

    if (v8 != v9) {
      [(_UISearchBarAppearanceStorage *)self->_appearanceStorage setScopeBarBackgroundImage:v9];
    }
    [(_UISearchBarVisualProviderLegacy *)self setUpScopeBar];
    id v4 = v9;
  }
}

- (id)scopeBarBackgroundImage
{
  return [(_UISearchBarAppearanceStorage *)self->_appearanceStorage scopeBarBackgroundImage];
}

- (void)setSearchFieldBackgroundPositionAdjustment:(UIOffset)a3
{
  double vertical = a3.vertical;
  double horizontal = a3.horizontal;
  id v6 = [(_UISearchBarVisualProviderBase *)self searchBar];
  if (v6)
  {
    appearanceStorage = self->_appearanceStorage;
    if (!appearanceStorage)
    {
      if (horizontal == 0.0 && vertical == 0.0) {
        goto LABEL_15;
      }
      id v8 = objc_alloc_init(_UISearchBarAppearanceStorage);
      id v9 = self->_appearanceStorage;
      self->_appearanceStorage = v8;

      appearanceStorage = self->_appearanceStorage;
    }
    uint64_t v10 = [(_UISearchBarAppearanceStorage *)appearanceStorage searchFieldPositionAdjustment];
    id v11 = v10;
    if (v10)
    {
      [v10 UIOffsetValue];
    }
    else
    {
      double v12 = 0.0;
      double v13 = 0.0;
    }
    if (horizontal != v12 || vertical != v13)
    {
      uint64_t v15 = self->_appearanceStorage;
      *(double *)unsigned int v17 = horizontal;
      *(double *)&v17[1] = vertical;
      long long v16 = [MEMORY[0x1E4F29238] valueWithBytes:v17 objCType:"{UIOffset=dd}"];
      [(_UISearchBarAppearanceStorage *)v15 setSearchFieldPositionAdjustment:v16];

      [v6 setNeedsLayout];
    }
  }
LABEL_15:
}

- (UIOffset)searchFieldBackgroundPositionAdjustment
{
  BOOL v2 = [(_UISearchBarAppearanceStorage *)self->_appearanceStorage searchFieldPositionAdjustment];
  int v3 = v2;
  if (v2)
  {
    [v2 UIOffsetValue];
    double v5 = v4;
    double v7 = v6;
  }
  else
  {
    double v5 = 0.0;
    double v7 = 0.0;
  }

  double v8 = v5;
  double v9 = v7;
  result.double vertical = v9;
  result.double horizontal = v8;
  return result;
}

- (void)setBackgroundImage:(id)a3 forBarPosition:(int64_t)a4 barMetrics:(int64_t)a5
{
  [(UISearchBarBackground *)self->_searchBarBackground _setBackgroundImage:a3 forBarPosition:a4 barMetrics:a5];
  [(_UISearchBarVisualProviderLegacy *)self updateNeedForBackdrop];
}

- (id)backgroundImageForBarPosition:(int64_t)a3 barMetrics:(int64_t)a4
{
  return [(UISearchBarBackground *)self->_searchBarBackground _backgroundImageForBarPosition:a3 barMetrics:a4];
}

- (BOOL)hasDarkUIAppearance
{
  BOOL v2 = [(_UISearchBarVisualProviderBase *)self searchBar];
  int v3 = v2;
  if (v2)
  {
    double v4 = [v2 traitCollection];
    uint64_t v5 = [v4 userInterfaceStyle];

    uint64_t v6 = [v3 keyboardAppearance];
    BOOL v7 = 0;
    if (v6 <= 8)
    {
      if (v6)
      {
        if (v6 != 1) {
          goto LABEL_11;
        }
        goto LABEL_9;
      }
LABEL_10:
      BOOL v7 = v5 == 2;
      goto LABEL_11;
    }
    if (v6 == 10) {
      goto LABEL_10;
    }
    if (v6 == 9) {
LABEL_9:
    }
      BOOL v7 = 1;
  }
  else
  {
    BOOL v7 = 0;
  }
LABEL_11:

  return v7;
}

- (id)colorForComponent:(unint64_t)a3 disabled:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v7 = [(_UISearchBarVisualProviderBase *)self searchBar];
  if (!v7)
  {
    uint64_t v9 = +[UIColor labelColor];
LABEL_24:
    uint64_t v15 = (void *)v9;
    goto LABEL_25;
  }
  int64_t backdropStyle = self->_backdropStyle;
  if (backdropStyle == 2030)
  {
    if (v4)
    {
LABEL_8:
      double v10 = 0.35;
      double v11 = 1.0;
LABEL_23:
      uint64_t v9 = +[UIColor colorWithWhite:v11 alpha:v10];
      goto LABEL_24;
    }
    double v11 = 1.0;
    if (a3 != 4)
    {
      double v10 = 0.5;
      goto LABEL_23;
    }
LABEL_22:
    double v10 = 1.0;
    goto LABEL_23;
  }
  if (backdropStyle == 2020)
  {
    if (!v4) {
      goto LABEL_20;
    }
    goto LABEL_8;
  }
  if ([(_UISearchBarVisualProviderLegacy *)self barStyle])
  {
    if (v4)
    {
      double v11 = 0.47;
      double v10 = 0.35;
      goto LABEL_23;
    }
    if (a3 == 4)
    {
LABEL_20:
      uint64_t v9 = +[UIColor whiteColor];
      goto LABEL_24;
    }
    double v11 = 0.47;
    goto LABEL_22;
  }
  int64_t v12 = self->_backdropStyle;
  if ((v12 == 2010 || v12 == 2005) && ((BOOL v13 = UISearchBarUsesModernAppearance(), a3 == 4) || !v13))
  {
    id v14 = +[UIColor labelColor];
  }
  else
  {
    id v14 = +[UIColor systemGrayColor];
  }
  uint64_t v15 = v14;
  if (v4)
  {
    uint64_t v17 = [v14 colorWithAlphaComponent:0.35];

    uint64_t v15 = (void *)v17;
  }
LABEL_25:

  return v15;
}

- (id)textColor
{
  int v3 = [(_UISearchBarVisualProviderBase *)self searchBar];
  if (!v3)
  {
    uint64_t v4 = +[UIColor labelColor];
    goto LABEL_7;
  }
  if (self->_backdropStyle)
  {
    uint64_t v4 = [(_UISearchBarVisualProviderLegacy *)self colorForComponent:4 disabled:0];
LABEL_7:
    uint64_t v5 = (void *)v4;
    goto LABEL_8;
  }
  if ([(_UISearchBarVisualProviderLegacy *)self barStyle])
  {
    uint64_t v4 = +[UIColor colorWithWhite:0.47 alpha:1.0];
    goto LABEL_7;
  }
  BOOL v7 = [v3 _searchBarTextField];
  double v8 = [v7 visualStyle];
  uint64_t v5 = [v8 defaultTextColor];

LABEL_8:
  return v5;
}

- (void)_setBarTintColor:(id)a3
{
  id obj = a3;
  int v4 = dyld_program_sdk_at_least();
  uint64_t v5 = obj;
  if (v4)
  {
    uint64_t v5 = [obj colorWithAlphaComponent:1.0];
  }
  objc_storeStrong((id *)&self->_barTintColor, v5);
  if (v4) {
}
  }

- (void)setBarTintColor:(id)a3 forceUpdate:(BOOL)a4
{
  if (self->_barTintColor != a3 || a4)
  {
    -[_UISearchBarVisualProviderLegacy _setBarTintColor:](self, "_setBarTintColor:");
    [(_UISearchBarVisualProviderLegacy *)self effectiveBarTintColorDidChange:1];
  }
}

- (void)effectiveBarTintColorDidChange:(BOOL)a3
{
  BOOL v3 = a3;
  id v11 = [(_UISearchBarVisualProviderBase *)self searchBar];
  if (v11)
  {
    $B0CEE0411BC9260FB4C6BC24420153D9 searchBarVisualProviderFlags = self->_searchBarVisualProviderFlags;
    uint64_t v6 = [(_UISearchBarVisualProviderLegacy *)self effectiveBarTintColor];
    BOOL v7 = v6;
    if ((*(_DWORD *)&searchBarVisualProviderFlags & 0x20000) != 0)
    {
      double v8 = _GetLightenedTintColor(v6);
      [(UISearchBarBackground *)self->_searchBarBackground setBarTintColor:v8];
    }
    else
    {
      [(UISearchBarBackground *)self->_searchBarBackground setBarTintColor:v6];
    }

    if (self->_cancelButton)
    {
      [(_UISearchBarVisualProviderLegacy *)self setUpCancelButtonWithAppearance:0];
      [v11 setNeedsLayout];
    }
    if (self->_promptLabel)
    {
      [(_UISearchBarVisualProviderLegacy *)self setUpPromptLabel];
      [v11 setNeedsLayout];
    }
    if (v3)
    {
      [(_UISearchBarVisualProviderLegacy *)self updateSearchFieldArt];
      [(_UISearchBarVisualProviderLegacy *)self updateMagnifyingGlassView];
      separator = self->_separator;
      if (separator)
      {
        double v10 = [(_UISearchBarVisualProviderLegacy *)self currentSeparatorImage];
        [(UIImageView *)separator setImage:v10];
      }
    }
    [(_UISearchBarVisualProviderLegacy *)self updateScopeBarBackground];
  }
}

- (id)effectiveBarTintColor
{
  return self->_barTintColor;
}

- (void)applySearchBarStyle
{
  BOOL v3 = [(_UISearchBarVisualProviderBase *)self searchBar];
  if (v3)
  {
    id v15 = v3;
    int v4 = [v3 _searchBarTextField];
    uint64_t v5 = [v4 _systemBackgroundView];
    int v6 = *(_DWORD *)&self->_searchBarVisualProviderFlags & 0x38;
    BOOL v7 = [v15 layer];
    double v8 = v7;
    if (v6 == 16)
    {
      [v7 setAllowsGroupBlending:0];

      uint64_t v9 = [v15 layer];
      [v9 setAllowsGroupOpacity:0];

      double v10 = [v5 layer];
      [v10 setAllowsGroupBlending:0];

      [v5 setBackgroundContainer:1];
      if (dyld_program_sdk_at_least()) {
        int64_t backdropStyle = self->_backdropStyle;
      }
      else {
        int64_t backdropStyle = 2;
      }
      [v4 updateForBackdropStyle:backdropStyle];
    }
    else
    {
      [v7 setAllowsGroupBlending:1];

      int64_t v12 = [v15 layer];
      [v12 setAllowsGroupOpacity:1];

      BOOL v13 = [v5 layer];
      [v13 setAllowsGroupBlending:1];

      [v5 setBackgroundContainer:0];
      [v4 _removeEffectsBackgroundViews];
      [v5 updateView];
    }
    [(_UISearchBarVisualProviderLegacy *)self updateNeedForBackdrop];
    if (self->_backdropStyle) {
      unint64_t v14 = 2;
    }
    else {
      unint64_t v14 = ((unint64_t)self->_searchBarVisualProviderFlags >> 3) & 7;
    }
    [(UISearchBarBackground *)self->_searchBarBackground setSearchBarStyle:v14];
    [(_UISearchBarVisualProviderLegacy *)self updatePlaceholderColor];
    [(_UISearchBarVisualProviderLegacy *)self updateMagnifyingGlassView];
    [(_UISearchBarVisualProviderLegacy *)self updateRightView];
    [v15 setNeedsLayout];

    BOOL v3 = v15;
  }
}

- (void)updateForDrawsBackgroundInPalette
{
  id v7 = [(_UISearchBarVisualProviderBase *)self searchBar];
  if (v7 && [(_UISearchBarVisualProviderLegacy *)self isInNavigationPalette])
  {
    [(_UISearchBarVisualProviderLegacy *)self setDrawsBackground:(*(_DWORD *)&self->_searchBarVisualProviderFlags >> 14) & 1];
    BOOL v3 = [v7 _containingNavigationPalette];
    uint64_t v4 = (*(_DWORD *)&self->_searchBarVisualProviderFlags >> 14) & 1;
    uint64_t v5 = [v3 _backgroundView];
    [v5 setHidden:v4];

    int v6 = [v3 _backgroundView];
    LODWORD(v5) = [v6 isHidden];

    if (v5) {
      [(UISearchBarBackground *)self->_searchBarBackground _updateBackgroundImage];
    }
  }
}

- (void)updateIfNecessaryForOldSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  int v6 = [(_UISearchBarVisualProviderBase *)self searchBar];
  if (v6)
  {
    id v10 = v6;
    [v6 bounds];
    int v6 = v10;
    if (width != v8 || height != v7)
    {
      [(_UISearchBarVisualProviderLegacy *)self layoutBackgroundViewConsideringTopBarStatusAndChangedHeight:v7 != height];
      int v6 = v10;
    }
  }
}

- (void)updateMagnifyingGlassView
{
  BOOL v3 = [(_UISearchBarVisualProviderBase *)self searchBar];
  if (v3)
  {
    if ((dyld_program_sdk_at_least() & 1) == 0)
    {
      uint64_t v4 = [v3 _searchBarTextField];
      uint64_t v5 = [v4 leftView];
      if (v5)
      {
        int v6 = (void *)v5;
        double v7 = [v4 leftView];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) == 0) {
          goto LABEL_14;
        }
      }
      else
      {
      }
    }
    unint64_t searchBarVisualProviderFlags = self->_searchBarVisualProviderFlags;
    if ((searchBarVisualProviderFlags & 0x600) != 0)
    {
      char v17 = 0;
      id v10 = [(_UISearchBarVisualProviderLegacy *)self internalImageForSearchBarIcon:0 state:(searchBarVisualProviderFlags >> 11) & 2 customImage:&v17];
      if (!v17)
      {
        id v11 = [(_UISearchBarVisualProviderLegacy *)self colorForComponent:2 disabled:(*(_DWORD *)&self->_searchBarVisualProviderFlags >> 12) & 1];
        [v10 size];
        uint64_t v12 = +[UIImage _tintedImageForSize:withTint:effectsImage:maskImage:style:](UIImage, "_tintedImageForSize:withTint:effectsImage:maskImage:style:", v11, 0, v10, 0);

        id v10 = (void *)v12;
      }
      BOOL v13 = [v3 _searchBarTextField];
      unint64_t v14 = [v13 leftView];

      if (v14)
      {
        id v15 = [v13 leftView];
        [v15 setImage:v10];

        long long v16 = [v13 leftView];
        [(UIView *)v16 sizeToFit];
      }
      else
      {
        long long v16 = [[UIImageView alloc] initWithImage:v10];
        [v13 setLeftView:v16];
      }

      [v3 setNeedsLayout];
    }
  }
LABEL_14:
}

- (void)_removeLegacyBackdropView
{
  [(UIView *)self->_backdrop removeFromSuperview];
  backdrop = self->_backdrop;
  self->_backdrop = 0;
}

- (void)_removeBackdropVisualEffectView
{
  [(UIView *)self->_backdropVisualEffectView removeFromSuperview];
  backdropVisualEffectView = self->_backdropVisualEffectView;
  self->_backdropVisualEffectView = 0;
}

- (void)updateNeedForBackdrop
{
  id v12 = [(UISearchBarBackground *)self->_searchBarBackground backgroundImage];
  if (v12 || (*(_DWORD *)&self->_searchBarVisualProviderFlags & 0x2038) != 0x10)
  {
    [(_UISearchBarVisualProviderLegacy *)self _removeLegacyBackdropView];
    [(_UISearchBarVisualProviderLegacy *)self _removeBackdropVisualEffectView];
  }
  else if (self->_backdropStyle == 2005)
  {
    [(_UISearchBarVisualProviderLegacy *)self _removeLegacyBackdropView];
    if (!self->_backdropVisualEffectView)
    {
      BOOL v3 = [UIVisualEffectView alloc];
      uint64_t v4 = +[UIBlurEffect effectWithStyle:10];
      uint64_t v5 = [(UIVisualEffectView *)v3 initWithEffect:v4];
      backdropVisualEffectView = self->_backdropVisualEffectView;
      self->_backdropVisualEffectView = v5;

      [(UIView *)self->_searchBarBackground addSubview:self->_backdropVisualEffectView];
      [(UIView *)self->_backdropVisualEffectView setUserInteractionEnabled:1];
    }
  }
  else
  {
    [(_UISearchBarVisualProviderLegacy *)self _removeBackdropVisualEffectView];
    backdrop = self->_backdrop;
    int64_t backdropStyle = self->_backdropStyle;
    if (backdrop)
    {
      [(_UIBackdropView *)backdrop transitionToPrivateStyle:backdropStyle];
    }
    else
    {
      if (backdropStyle) {
        int64_t v9 = self->_backdropStyle;
      }
      else {
        int64_t v9 = -2;
      }
      id v10 = [[_UIBackdropView alloc] initWithPrivateStyle:v9];
      id v11 = self->_backdrop;
      self->_backdrop = v10;

      [(UIView *)self->_searchBarBackground addSubview:self->_backdrop];
      [(UIView *)self->_backdrop setUserInteractionEnabled:1];
    }
    [(UIView *)self->_backdrop setHidden:self->_backdropStyle == 0];
  }
}

- (void)updatePlaceholderColor
{
  id v6 = [(_UISearchBarVisualProviderBase *)self searchBar];
  if (v6)
  {
    BOOL v3 = [(_UISearchBarVisualProviderLegacy *)self colorForComponent:3 disabled:0];
    uint64_t v4 = [v6 _searchBarTextField];
    uint64_t v5 = [v4 _placeholderLabel];
    [v5 setTextColor:v3];
  }
}

- (void)updateRightView
{
  BOOL v3 = [(_UISearchBarVisualProviderBase *)self searchBar];
  uint64_t v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 _searchBarTextField];
    id v6 = v5;
    $B0CEE0411BC9260FB4C6BC24420153D9 searchBarVisualProviderFlags = self->_searchBarVisualProviderFlags;
    if ((*(_DWORD *)&searchBarVisualProviderFlags & 0x200000) != 0) {
      uint64_t v8 = 2;
    }
    else {
      uint64_t v8 = (*(unsigned int *)&searchBarVisualProviderFlags >> 22) & 2;
    }
    [v5 setRightViewMode:v8];
    $B0CEE0411BC9260FB4C6BC24420153D9 v9 = self->_searchBarVisualProviderFlags;
    if ((*(_DWORD *)&v9 & 0x200000) != 0)
    {
      uint64_t v22 = [(_UISearchBarVisualProviderLegacy *)self internalImageForSearchBarIcon:3 state:0];
      id v11 = [(_UISearchBarVisualProviderLegacy *)self internalImageForSearchBarIcon:3 state:1];
      id v12 = [(_UISearchBarVisualProviderLegacy *)self internalImageForSearchBarIcon:3 state:2];
      long long v18 = objc_alloc_init(UIButton);
      [(UIControl *)v18 addTarget:v4 action:sel__resultsListButtonPressed forControlEvents:64];
      [(UIButton *)v18 setImage:v22 forStates:0];
      [(UIButton *)v18 setImage:v11 forStates:1];
      [(UIButton *)v18 setImage:v11 forStates:4];
      [(UIButton *)v18 setImage:v12 forStates:2];
      [(UIButton *)v18 setSelected:(*(_DWORD *)&self->_searchBarVisualProviderFlags >> 22) & 1];
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __51___UISearchBarVisualProviderLegacy_updateRightView__block_invoke;
      v26[3] = &unk_1E52D9F98;
      unint64_t v14 = (id *)&v27;
      BOOL v27 = v18;
      id v15 = &v28;
      id v19 = v6;
      id v28 = v19;
      char v17 = v18;
      +[UIView performWithoutAnimation:v26];
      LODWORD(v20) = -0.5;
      [(UIView *)v17 setCharge:v20];
      [v19 setRightView:v17];
      uint64_t v21 = v19;
      id v10 = (void *)v22;
      objc_msgSend(v21, "_setRightViewOffset:", -1.0, -1.0);
    }
    else
    {
      if ((*(_DWORD *)&v9 & 0x800000) == 0)
      {
LABEL_10:

        goto LABEL_11;
      }
      id v10 = [(_UISearchBarVisualProviderLegacy *)self internalImageForSearchBarIcon:2 state:0];
      id v11 = [(_UISearchBarVisualProviderLegacy *)self internalImageForSearchBarIcon:2 state:1];
      id v12 = [(_UISearchBarVisualProviderLegacy *)self internalImageForSearchBarIcon:2 state:2];
      BOOL v13 = objc_alloc_init(UIButton);
      [(UIControl *)v13 addTarget:v4 action:sel__bookmarkButtonPressed forControlEvents:64];
      [(UIButton *)v13 setImage:v10 forStates:0];
      [(UIButton *)v13 setImage:v11 forStates:1];
      [(UIButton *)v13 setImage:v12 forStates:2];
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __51___UISearchBarVisualProviderLegacy_updateRightView__block_invoke_2;
      v23[3] = &unk_1E52D9F98;
      unint64_t v14 = (id *)&v24;
      v24 = v13;
      id v15 = &v25;
      id v16 = v6;
      id v25 = v16;
      char v17 = v13;
      +[UIView performWithoutAnimation:v23];
      [v16 setRightView:v17];
    }

    goto LABEL_10;
  }
LABEL_11:
}

- (void)updateScopeBarBackground
{
  BOOL v3 = [(_UISearchBarVisualProviderBase *)self searchBar];
  if (v3 && self->_scopeBarContainerView)
  {
    id v14 = v3;
    uint64_t v4 = [(_UISearchBarVisualProviderLegacy *)self scopeBarBackgroundImage];

    if (v4)
    {
      scopeBarBackgroundView = self->_scopeBarBackgroundView;
      id v6 = [(_UISearchBarVisualProviderLegacy *)self scopeBarBackgroundImage];
      [(UIImageView *)scopeBarBackgroundView setImage:v6];

      [(UIImageView *)self->_scopeBarBackgroundView setBackgroundColor:0];
    }
    else if ([(_UISearchBarVisualProviderLegacy *)self isInNavigationPalette] {
           && (*((unsigned char *)&self->_searchBarVisualProviderFlags + 1) & 0x40) == 0
    }
           || [(_UISearchBarVisualProviderLegacy *)self isHostedByNavigationBar])
    {
      [(UIImageView *)self->_scopeBarBackgroundView setHidden:1];
    }
    else
    {
      [(UIImageView *)self->_scopeBarBackgroundView setHidden:0];
      $B0CEE0411BC9260FB4C6BC24420153D9 searchBarVisualProviderFlags = self->_searchBarVisualProviderFlags;
      uint64_t v8 = [(_UISearchBarVisualProviderLegacy *)self effectiveBarTintColor];
      $B0CEE0411BC9260FB4C6BC24420153D9 v9 = v8;
      id v10 = v8;
      if ((*(_DWORD *)&searchBarVisualProviderFlags & 0x20000) != 0)
      {
        id v10 = _GetLightenedTintColor(v8);
      }
      id v11 = _UISearchBarBackgroundFillColor(*(unsigned char *)&searchBarVisualProviderFlags & 7, v10);
      [(UIImageView *)self->_scopeBarBackgroundView setBackgroundColor:v11];

      if ((*(_DWORD *)&searchBarVisualProviderFlags & 0x20000) != 0) {
      [(UIImageView *)self->_scopeBarBackgroundView setImage:0];
      }
    }
    BOOL v12 = [(_UISearchBarVisualProviderLegacy *)self isTranslucent];
    double v13 = 0.96;
    if (!v12) {
      double v13 = 1.0;
    }
    [(UIView *)self->_scopeBarBackgroundView setAlpha:v13];
    BOOL v3 = v14;
  }
}

- (void)updateScopeBarForSelectedScope
{
}

- (void)updateSearchBarOpacity
{
  id v3 = [(_UISearchBarVisualProviderBase *)self searchBar];
  if (v3) {
    objc_msgSend(v3, "setOpaque:", -[_UISearchBarVisualProviderLegacy isTranslucent](self, "isTranslucent") ^ 1);
  }
}

- (void)updateScopeBarFrame
{
  uint64_t v3 = [(_UISearchBarVisualProviderBase *)self searchBar];
  uint64_t v4 = (_DWORD *)v3;
  if (self->_scopeBar) {
    BOOL v5 = v3 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5)
  {
    double v40 = 0.0;
    double v41 = 0.0;
    [(_UISearchBarVisualProviderLegacy *)self getScopeBarHeight:&v41 containerHeight:&v40];
    [v4 bounds];
    -[UIView setFrame:](self->_scopeBarContainerView, "setFrame:", 0.0, v6 - v40);
    [(_UISearchBarVisualProviderLegacy *)self scopeBarInsets];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    [(UIView *)self->_scopeBarContainerView bounds];
    double v14 = v13 - v10 - v12;
    double v15 = v41;
    if ([(_UISearchBarVisualProviderLegacy *)self useRelaxedScopeLayout]
      && [(NSArray *)self->_scopeTitles count])
    {
      double v38 = v8;
      scopeBar = self->_scopeBar;
      [(UIView *)self->_scopeBarContainerView bounds];
      -[UISegmentedControl sizeThatFits:](scopeBar, "sizeThatFits:", v17, v18);
      CGFloat v20 = v19 + (double)[(NSArray *)self->_scopeTitles count] * 78.0;
      [(UIView *)self->_searchField frame];
      CGFloat x = v42.origin.x;
      CGFloat y = v42.origin.y;
      CGFloat width = v42.size.width;
      CGFloat height = v42.size.height;
      double v37 = v20;
      if (v20 >= CGRectGetWidth(v42))
      {
        double v8 = v38;
      }
      else
      {
        [v4 bounds];
        double v8 = v38;
        double v25 = round(CGRectGetMidX(v43) + v37 * -0.5);
        double v36 = v25;
        double v26 = v38;
        double v27 = v37;
        double v28 = v15;
        if ((v4[28] & 0x80000) != 0)
        {
          double MinX = CGRectGetMinX(*(CGRect *)&v25);
          v45.origin.CGFloat x = x;
          v45.origin.CGFloat y = y;
          v45.size.CGFloat width = width;
          v45.size.CGFloat height = height;
          BOOL v29 = MinX >= CGRectGetMinX(v45) + 20.0;
        }
        else
        {
          double MinX = CGRectGetMaxX(*(CGRect *)&v25);
          v44.origin.CGFloat x = x;
          v44.origin.CGFloat y = y;
          v44.size.CGFloat width = width;
          v44.size.CGFloat height = height;
          BOOL v29 = MinX <= CGRectGetMaxX(v44) + -20.0;
        }
        if (v29)
        {
          double v14 = v37;
          double v10 = v36;
        }
      }
    }
    [(UISegmentedControl *)self->_scopeBar frame];
    v47.origin.CGFloat x = v30;
    v47.origin.CGFloat y = v31;
    v47.size.CGFloat width = v32;
    v47.size.CGFloat height = v33;
    v46.origin.CGFloat x = v10;
    v46.origin.CGFloat y = v8;
    v46.size.CGFloat width = v14;
    v46.size.CGFloat height = v15;
    if (!CGRectEqualToRect(v46, v47))
    {
      $B0CEE0411BC9260FB4C6BC24420153D9 searchBarVisualProviderFlags = self->_searchBarVisualProviderFlags;
      if ((*(_DWORD *)&searchBarVisualProviderFlags & 0x40000000) != 0)
      {
        v39[0] = MEMORY[0x1E4F143A8];
        v39[1] = 3221225472;
        v39[2] = __55___UISearchBarVisualProviderLegacy_updateScopeBarFrame__block_invoke;
        v39[3] = &unk_1E52DA520;
        v39[4] = self;
        *(double *)&v39[5] = v10;
        *(double *)&v39[6] = v8;
        *(double *)&v39[7] = v14;
        *(double *)&v39[8] = v15;
        +[UIView performWithoutAnimation:v39];
      }
      else if ((*(_DWORD *)&searchBarVisualProviderFlags & 0x80000000) == 0)
      {
        -[UISegmentedControl setFrame:](self->_scopeBar, "setFrame:", v10, v8, v14, v15);
      }
    }
  }
}

- (void)updateSearchFieldArt
{
  uint64_t v3 = [(_UISearchBarVisualProviderBase *)self searchBar];
  if (v3)
  {
    id v19 = v3;
    uint64_t v4 = [v3 _searchBarTextField];
    BOOL v5 = [(_UISearchBarAppearanceStorage *)self->_appearanceStorage searchFieldBackgroundImageForState:0];
    if (!v5)
    {
      [v4 setBorderStyle:3];
      id v9 = [v4 _systemBackgroundView];
      objc_msgSend(v9, "setBarStyle:", -[_UISearchBarVisualProviderLegacy barStyle](self, "barStyle"));
LABEL_16:

      uint64_t v3 = v19;
      goto LABEL_17;
    }
    uint64_t v6 = [(_UISearchBarAppearanceStorage *)self->_appearanceStorage searchFieldBackgroundImageForState:2];
    double v7 = (void *)v6;
    if (v6) {
      double v8 = (void *)v6;
    }
    else {
      double v8 = v5;
    }
    id v9 = v8;

    if ([v5 _isResizable])
    {
      [v4 setBackground:v5];
      if (![v9 _isResizable])
      {
        uint64_t v10 = [v5 leftCapWidth];
        uint64_t v11 = [v5 topCapHeight];
        double v12 = v9;
        uint64_t v13 = v10;
LABEL_13:
        double v17 = [v12 stretchableImageWithLeftCapWidth:v13 topCapHeight:v11];
        [v4 setDisabledBackground:v17];

LABEL_14:
        [v4 setBorderStyle:0];
        [v5 size];
        if (v18 != 28.0) {
          [v19 setNeedsLayout];
        }
        goto LABEL_16;
      }
    }
    else
    {
      [v5 size];
      uint64_t v15 = (uint64_t)((v14 + -1.0) * 0.5);
      id v16 = [v5 stretchableImageWithLeftCapWidth:v15 topCapHeight:0];
      [v4 setBackground:v16];

      if (![v9 _isResizable])
      {
        double v12 = v9;
        uint64_t v13 = v15;
        uint64_t v11 = 0;
        goto LABEL_13;
      }
    }
    [v4 setDisabledBackground:v9];
    goto LABEL_14;
  }
LABEL_17:
}

- (void)setUpCancelButton
{
}

- (void)setUpCancelButtonWithAppearance:(id)a3
{
  id v12 = a3;
  uint64_t v4 = [(_UISearchBarVisualProviderBase *)self searchBar];
  if (v4)
  {
    cancelButton = self->_cancelButton;
    if (cancelButton)
    {
      [(UIButton *)cancelButton setBarStyle:*(_DWORD *)&self->_searchBarVisualProviderFlags & 7];
      uint64_t v6 = [(_UISearchBarVisualProviderLegacy *)self effectiveBarTintColor];
      [(UIButton *)self->_cancelButton _setTintColor:v6];
    }
    else
    {
      uint64_t v6 = self->_cancelButtonText;
      if (!v6)
      {
        _UINSLocalizedStringWithDefaultValue(@"Cancel", @"Cancel");
        uint64_t v6 = (NSString *)objc_claimAutoreleasedReturnValue();
      }
      double v7 = [UINavigationButton alloc];
      double v8 = [(_UISearchBarVisualProviderLegacy *)self effectiveBarTintColor];
      id v9 = [(UINavigationButton *)v7 initWithValue:v6 width:3 style:0 barStyle:0 possibleTitles:v8 tintColor:0.0];
      uint64_t v10 = self->_cancelButton;
      self->_cancelButton = v9;

      [(UIButton *)self->_cancelButton _setAppearanceGuideClass:objc_opt_class()];
      [(UIControl *)self->_cancelButton addTarget:v4 action:sel__cancelButtonPressed forControlEvents:64];
      [v4 addSubview:self->_cancelButton];
      BOOL v11 = ([v4 isFirstResponder] & 1) != 0
         || (*((unsigned char *)&self->_searchBarVisualProviderFlags + 2) & 8) == 0;
      [(UIButton *)self->_cancelButton setEnabled:v11];
      [v4 setNeedsLayout];
    }

    if (v12) {
      [(UIButton *)self->_cancelButton _applyBarButtonAppearanceStorage:v12 withTaggedSelectors:0];
    }
  }
}

- (void)setUpLeftButton
{
  uint64_t v3 = [(_UISearchBarVisualProviderBase *)self searchBar];
  if (v3)
  {
    id v9 = v3;
    if (self->_leftButton)
    {
      uint64_t v4 = [(_UISearchBarVisualProviderLegacy *)self effectiveBarTintColor];
      [(UINavigationButton *)self->_leftButton _setTintColor:v4];
    }
    else
    {
      BOOL v5 = [UINavigationButton alloc];
      uint64_t v6 = [(_UISearchBarVisualProviderLegacy *)self effectiveBarTintColor];
      double v7 = [(UINavigationButton *)v5 initWithValue:@"<configure>" width:3 style:0 barStyle:0 possibleTitles:v6 tintColor:0.0];
      leftButton = self->_leftButton;
      self->_leftButton = v7;

      [(UINavigationButton *)self->_leftButton _setAppearanceGuideClass:objc_opt_class()];
      [v9 addSubview:self->_leftButton];
      [v9 setNeedsLayout];
    }
    uint64_t v3 = v9;
  }
}

- (void)setUpPromptLabel
{
  uint64_t v3 = [(_UISearchBarVisualProviderBase *)self searchBar];
  if (v3)
  {
    id v24 = v3;
    if (!_MergedGlobals_33)
    {
      uint64_t v4 = [[UIColor alloc] initWithRed:0.168 green:0.243 blue:0.353 alpha:1.0];
      BOOL v5 = (void *)_MergedGlobals_33;
      _MergedGlobals_33 = (uint64_t)v4;
    }
    if (!qword_1EB25A950)
    {
      uint64_t v6 = [[UIColor alloc] initWithWhite:1.0 alpha:0.44];
      double v7 = (void *)qword_1EB25A950;
      qword_1EB25A950 = (uint64_t)v6;
    }
    if (!qword_1EB25A958)
    {
      double v8 = [[UIColor alloc] initWithWhite:1.0 alpha:0.6];
      id v9 = (void *)qword_1EB25A958;
      qword_1EB25A958 = (uint64_t)v8;
    }
    if (!qword_1EB25A960)
    {
      uint64_t v10 = [[UIColor alloc] initWithWhite:0.0 alpha:1.0];
      BOOL v11 = (void *)qword_1EB25A960;
      qword_1EB25A960 = (uint64_t)v10;
    }
    if (!self->_promptLabel)
    {
      id v12 = objc_alloc_init(UILabel);
      promptLabel = self->_promptLabel;
      self->_promptLabel = v12;

      double v14 = [off_1E52D39B8 systemFontOfSize:14.0];
      [(UILabel *)self->_promptLabel setFont:v14];

      [(UILabel *)self->_promptLabel setNumberOfLines:1];
      [(UILabel *)self->_promptLabel setTextAlignment:1];
      [(UIView *)self->_promptLabel setBackgroundColor:0];
      [(UIView *)self->_promptLabel setOpaque:0];
      [v24 addSubview:self->_promptLabel];
    }
    id v15 = (id)_MergedGlobals_33;
    id v16 = (id)qword_1EB25A950;
    double v17 = [(_UISearchBarVisualProviderLegacy *)self effectiveBarTintColor];

    if (v17)
    {
      double v18 = [(_UISearchBarVisualProviderLegacy *)self effectiveBarTintColor];
      id v19 = _GetLightenedTintColor(v18);
      GetTintedPromptTextColor(v19);
      id v20 = (id)objc_claimAutoreleasedReturnValue();

      double v21 = 1.0;
    }
    else
    {
      if ((*(unsigned char *)&self->_searchBarVisualProviderFlags & 7) == 0)
      {
        uint64_t v22 = [v24 traitCollection];
        uint64_t v23 = [v22 userInterfaceStyle];

        if (v23 != 2)
        {
          double v21 = 1.0;
          goto LABEL_18;
        }
      }
      id v20 = (id)qword_1EB25A958;

      double v18 = v16;
      double v21 = -1.0;
      id v16 = (id)qword_1EB25A960;
    }

    id v15 = v20;
LABEL_18:
    [(UILabel *)self->_promptLabel setTextColor:v15];
    [(UILabel *)self->_promptLabel setShadowColor:v16];
    -[UILabel setShadowOffset:](self->_promptLabel, "setShadowOffset:", 0.0, v21);

    uint64_t v3 = v24;
  }
}

- (void)setUpScopeBar
{
  uint64_t v3 = [(_UISearchBarVisualProviderBase *)self searchBar];
  uint64_t v4 = v3;
  if (v3)
  {
    if (!self->_scopeBar)
    {
      [v3 sizeToFit];
      [v4 bounds];
      double v6 = v5;
      double v8 = v7;
      +[UISegmentedControl defaultHeightForStyle:7 size:0];
      float v10 = v9;
      BOOL v11 = -[UISegmentedControl initWithFrame:withStyle:withItems:]([UISegmentedControl alloc], "initWithFrame:withStyle:withItems:", 7, self->_scopeTitles, 0.0, v8 - v10, v6);
      objc_storeStrong((id *)&self->_scopeBar, v11);
      [(UISegmentedControl *)v11 setSelectedSegmentIndex:self->_selectedScope];
      [(UIControl *)v11 addTarget:v4 action:sel__scopeChanged_ forControlEvents:4096];
      [(UISegmentedControl *)v11 setBarStyle:*(_DWORD *)&self->_searchBarVisualProviderFlags & 7];
      [(_UISearchBarVisualProviderLegacy *)self scopeBarHeight];
      uint64_t v13 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", 0.0, v8 - v12, v6, v12);
      scopeBarContainerView = self->_scopeBarContainerView;
      self->_scopeBarContainerView = v13;

      id v15 = [_UISearchBarScopeBarBackground alloc];
      [(UIView *)self->_scopeBarContainerView bounds];
      id v16 = -[UIImageView initWithFrame:](v15, "initWithFrame:");
      scopeBarBackgroundView = self->_scopeBarBackgroundView;
      self->_scopeBarBackgroundView = v16;

      [(UIView *)self->_scopeBarBackgroundView setAutoresizingMask:18];
      [(UIView *)self->_scopeBarContainerView addSubview:self->_scopeBarBackgroundView];
      [(_UISearchBarVisualProviderLegacy *)self updateScopeBarBackground];
      [(_UISearchBarVisualProviderLegacy *)self updateScopeBarFrame];
      if (UISearchBarUsesModernAppearance()) {
        uint64_t v18 = 34;
      }
      else {
        uint64_t v18 = 18;
      }
      [(UIView *)v11 setAutoresizingMask:v18];
      [(UIView *)self->_scopeBarContainerView addSubview:v11];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __49___UISearchBarVisualProviderLegacy_setUpScopeBar__block_invoke;
      v19[3] = &unk_1E52D9F70;
      v19[4] = self;
      +[UIView performWithoutAnimation:v19];
      [v4 insertSubview:self->_scopeBarContainerView atIndex:0];
    }
    [(_UISearchBarVisualProviderLegacy *)self updateScopeBarBackground];
  }
}

- (void)setUpSearchField
{
  uint64_t v3 = [(_UISearchBarVisualProviderBase *)self searchBar];
  if (v3)
  {
    uint64_t v4 = [(UISearchTextField *)[UISearchBarTextField alloc] _initWithDeferredSearchIconImageConfiguration];
    searchField = self->_searchField;
    self->_searchField = v4;

    [(UISearchTextField *)self->_searchField _setSearchBar:v3];
    [(UIView *)self->_searchField setOpaque:0];
    -[UITextField setSemanticContentAttribute:](self->_searchField, "setSemanticContentAttribute:", [v3 semanticContentAttribute]);
    BOOL v6 = UISearchBarUsesModernAppearance();
    double v7 = 14.0;
    if (v6) {
      objc_msgSend(off_1E52D39B8, "defaultFontSize", 14.0);
    }
    double v8 = [off_1E52D39B8 systemFontOfSize:v7];
    [(UITextField *)self->_searchField setFont:v8];

    [(_UISearchBarVisualProviderLegacy *)self updateMagnifyingGlassView];
    [(UITextField *)self->_searchField setLeftViewMode:((unint64_t)self->_searchBarVisualProviderFlags >> 9) & 3];
    [(_UISearchBarVisualProviderLegacy *)self updateRightView];
    [(UITextField *)self->_searchField setClearButtonMode:3];
    [(UITextField *)self->_searchField setBorderStyle:3];
    [(UISearchTextField *)self->_searchField _setIgnoresDynamicType:1];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __52___UISearchBarVisualProviderLegacy_setUpSearchField__block_invoke;
    v15[3] = &unk_1E52D9F70;
    v15[4] = self;
    +[UIView _performSystemAppearanceModifications:v15];
    if ([(_UISearchBarVisualProviderLegacy *)self centerPlaceholder])
    {
      double v9 = [v3 textInputTraits];
      [v9 setDeferBecomingResponder:1];
    }
    char v14 = 0;
    float v10 = [(_UISearchBarVisualProviderLegacy *)self internalImageForSearchBarIcon:1 state:0 customImage:&v14];
    if (v10 && v14) {
      [(UISearchTextField *)self->_searchField _setClearButtonImage:v10 forState:0];
    }
    BOOL v11 = [(_UISearchBarVisualProviderLegacy *)self internalImageForSearchBarIcon:1 state:1 customImage:&v14];

    if (v11 && v14) {
      [(UISearchTextField *)self->_searchField _setClearButtonImage:v11 forState:1];
    }
    double v12 = [(_UISearchBarVisualProviderLegacy *)self internalImageForSearchBarIcon:1 state:2 customImage:&v14];

    if (v12 && v14) {
      [(UISearchTextField *)self->_searchField _setClearButtonImage:v12 forState:2];
    }
    [(_UISearchBarVisualProviderLegacy *)self updateSearchFieldArt];
    [(UIControl *)self->_searchField addTarget:v3 action:sel__searchFieldBeginEditing forControlEvents:0x10000];
    [(UIControl *)self->_searchField addTarget:v3 action:sel__searchFieldEditingChanged forControlEvents:0x20000];
    [(UIControl *)self->_searchField addTarget:v3 action:sel__searchFieldEndEditing forControlEvents:0x40000];
    [(UIControl *)self->_searchField addTarget:v3 action:sel__searchFieldReturnPressed forControlEvents:0x80000];
    [v3 addSubview:self->_searchField];
    if (UISearchBarUsesModernAppearance())
    {
      [(UITextField *)self->_searchField _setRoundedRectBackgroundCornerRadius:10.0];
      uint64_t v13 = [(UIView *)self->_searchField layer];
      [v13 setAllowsGroupOpacity:0];
    }
    if ((*(_DWORD *)&self->_searchBarVisualProviderFlags & 0x38) == 0x10) {
      [(_UISearchBarVisualProviderLegacy *)self applySearchBarStyle];
    }
  }
}

- (BOOL)isFrozenForDismissalCrossfade
{
  return 0;
}

- (void)setShowsSeparator:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(_UISearchBarVisualProviderBase *)self searchBar];
  if (v5)
  {
    separator = self->_separator;
    if (v3)
    {
      if (separator) {
        goto LABEL_8;
      }
      double v12 = v5;
      double v7 = [UIImageView alloc];
      double v8 = [(_UISearchBarVisualProviderLegacy *)self currentSeparatorImage];
      double v9 = [(UIImageView *)v7 initWithImage:v8];
      float v10 = self->_separator;
      self->_separator = v9;

      [v12 addSubview:self->_separator];
      [v12 setNeedsLayout];
    }
    else
    {
      if (!separator) {
        goto LABEL_8;
      }
      double v12 = v5;
      [(UIView *)separator removeFromSuperview];
      BOOL v11 = self->_separator;
      self->_separator = 0;
    }
    double v5 = v12;
  }
LABEL_8:
}

- (void)setShowsDeleteButton:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(_UISearchBarVisualProviderBase *)self searchBar];
  if (v5)
  {
    if (v3) {
      int v6 = 0x100000;
    }
    else {
      int v6 = 0;
    }
    self->_$B0CEE0411BC9260FB4C6BC24420153D9 searchBarVisualProviderFlags = ($B0CEE0411BC9260FB4C6BC24420153D9)(*(_DWORD *)&self->_searchBarVisualProviderFlags & 0xFFEFFFFF | v6);
    id v13 = v5;
    if (v3)
    {
      [(_UISearchBarVisualProviderLegacy *)self destroyCancelButton];
      double v7 = [UINavigationButton alloc];
      double v8 = [v13 traitCollection];
      double v9 = _UIImageWithNameAndTraitCollection(@"delete-on", v8);
      float v10 = [(UINavigationButton *)v7 initWithImage:v9 style:3];
      cancelButton = self->_cancelButton;
      self->_cancelButton = v10;

      [(UIButton *)self->_cancelButton _setAppearanceGuideClass:objc_opt_class()];
      [(UIControl *)self->_cancelButton addTarget:v13 action:sel__deleteButtonPressed forControlEvents:64];
      [v13 addSubview:self->_cancelButton];
      BOOL v12 = ([v13 isFirstResponder] & 1) != 0
         || (*((unsigned char *)&self->_searchBarVisualProviderFlags + 2) & 8) == 0;
      [(UIButton *)self->_cancelButton setEnabled:v12];
      [v13 setNeedsLayout];
    }
    else
    {
      [(_UISearchBarVisualProviderLegacy *)self setUpCancelButton];
    }
    double v5 = v13;
  }
}

- (void)setClippingViewActive:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(_UISearchBarVisualProviderBase *)self searchBar];
  if (v5)
  {
    id v6 = v5;
    [(UIView *)self->_searchBarClippingView setClipsToBounds:v3];
    double v5 = v6;
    if (!v3)
    {
      [v6 bounds];
      -[_UISearchBarVisualProviderLegacy setClippingViewBounds:](self, "setClippingViewBounds:");
      double v5 = v6;
    }
  }
}

- (void)setClippingViewBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v8 = [(_UISearchBarVisualProviderBase *)self searchBar];
  if (v8)
  {
    searchBarClippingView = self->_searchBarClippingView;
    if (searchBarClippingView)
    {
      BOOL v11 = v8;
      [(UIView *)searchBarClippingView frame];
      v14.origin.double x = x;
      v14.origin.double y = y;
      v14.size.double width = width;
      v14.size.double height = height;
      BOOL v10 = CGRectEqualToRect(v13, v14);
      double v8 = v11;
      if (!v10)
      {
        [v11 frame];
        -[UIView setBounds:](self->_searchBarClippingView, "setBounds:", x, y);
        -[UIView setFrame:](self->_searchBarClippingView, "setFrame:", x, y, width, height);
        double v8 = v11;
      }
    }
  }
}

- (BOOL)isInBarButNotHosted
{
  if ([(_UISearchBarVisualProviderLegacy *)self isHostedByNavigationBar])
  {
    LOBYTE(v3) = 0;
  }
  else if (self->_navBarTitleViewLocation {
         || ($B0CEE0411BC9260FB4C6BC24420153D9 searchBarVisualProviderFlags = self->_searchBarVisualProviderFlags,
  }
             (*(_DWORD *)&searchBarVisualProviderFlags & 0x1000000) != 0))
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    return (*(unsigned int *)&searchBarVisualProviderFlags >> 25) & 1;
  }
  return v3;
}

- (void)navigationBarTransitionWillBegin:(int64_t)a3 willBeDisplayed:(BOOL)a4
{
  BOOL v4 = a4;
  double v7 = [(_UISearchBarVisualProviderBase *)self searchBar];
  if (v7)
  {
    double v8 = 1.0;
    if (v4) {
      double v8 = 0.0;
    }
    id v21 = v7;
    [v7 setAlpha:v8];
    double v7 = v21;
    if (a3 == 2)
    {
      double v9 = self->_searchBarClippingView;
      [v21 bounds];
      double v11 = v10;
      if (_UIBarsUseNewPadHeights()) {
        double v12 = 50.0;
      }
      else {
        double v12 = 56.0;
      }
      -[UIView setFrame:](v9, "setFrame:", 0.0, 0.0, v11, v12);
      [(UIView *)v9 setAutoresizingMask:0];
      [(UIView *)v9 bounds];
      double v14 = v13;
      double v16 = v15;
      double v18 = v17;
      double v20 = v19;

      -[_UISearchBarVisualProviderLegacy layoutSubviewsInBounds:](self, "layoutSubviewsInBounds:", v14, v16, v18, v20);
      double v7 = v21;
    }
  }
}

- (void)navigationBarTransitionCompleted:(int64_t)a3 willBeDisplayed:(BOOL)a4
{
  id v6 = [(_UISearchBarVisualProviderBase *)self searchBar];
  if (v6)
  {
    id v7 = v6;
    [v6 setAlpha:1.0];
    id v6 = v7;
    if (a3 == 2)
    {
      [v7 bounds];
      -[UIView setFrame:](self->_searchBarClippingView, "setFrame:");
      [(UIView *)self->_searchBarClippingView setAutoresizingMask:18];
      [v7 layoutSubviews];
      id v6 = v7;
    }
  }
}

- (BOOL)_getNavigationTitleLeadingInset:(double *)a3 trailingInset:(double *)a4 isRTL:(BOOL)a5
{
  BOOL v5 = a5;
  double v9 = [(_UISearchBarVisualProviderBase *)self searchBar];
  double v10 = v9;
  if (v9 && self->_navBarTitleViewLocation && self->_navBarTitleViewOverlayRects)
  {
    [v9 bounds];
    uint64_t v12 = v11;
    uint64_t v14 = v13;
    uint64_t v16 = v15;
    uint64_t v18 = v17;
    [v10 _contentMargin];
    double v52 = v19;
    [v10 safeAreaInsets];
    double v50 = v21;
    double v51 = v20;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __88___UISearchBarVisualProviderLegacy__getNavigationTitleLeadingInset_trailingInset_isRTL___block_invoke;
    aBlock[3] = &__block_descriptor_65_e39_d40__0_CGRect__CGPoint_dd__CGSize_dd__8l;
    BOOL v56 = v5;
    aBlock[4] = v12;
    void aBlock[5] = v14;
    aBlock[6] = v16;
    aBlock[7] = v18;
    uint64_t v22 = (double (**)(void, double, double, double, double))_Block_copy(aBlock);
    v53[0] = MEMORY[0x1E4F143A8];
    v53[1] = 3221225472;
    v53[2] = __88___UISearchBarVisualProviderLegacy__getNavigationTitleLeadingInset_trailingInset_isRTL___block_invoke_2;
    v53[3] = &__block_descriptor_65_e39_d40__0_CGRect__CGPoint_dd__CGSize_dd__8l;
    BOOL v54 = v5;
    v53[4] = v12;
    v53[5] = v14;
    v53[6] = v16;
    v53[7] = v18;
    uint64_t v23 = (double (**)(void, double, double, double, double))_Block_copy(v53);
    [(_UINavigationBarTitleViewOverlayRects *)self->_navBarTitleViewOverlayRects backButtonRect];
    double x = v24;
    double y = v26;
    double width = v28;
    double height = v30;
    [(_UINavigationBarTitleViewOverlayRects *)self->_navBarTitleViewOverlayRects leadingItemsRect];
    CGFloat v33 = v32;
    CGFloat v35 = v34;
    CGFloat v37 = v36;
    CGFloat v39 = v38;
    v57.origin.double x = x;
    v57.origin.double y = y;
    v57.size.double width = width;
    v57.size.double height = height;
    if (CGRectIsNull(v57)
      && (v58.origin.x = v33, v58.origin.y = v35, v58.size.width = v37, v58.size.double height = v39, CGRectIsNull(v58)))
    {
      double v40 = v51;
      if (v5) {
        double v40 = v50;
      }
      double v41 = v52 + v40;
    }
    else
    {
      v59.origin.double x = v33;
      v59.origin.double y = v35;
      v59.size.double width = v37;
      v59.size.double height = v39;
      if (!CGRectIsNull(v59))
      {
        v60.origin.double x = x;
        v60.origin.double y = y;
        v60.size.double width = width;
        v60.size.double height = height;
        if (CGRectIsNull(v60))
        {
          double x = v33;
          double y = v35;
          double width = v37;
          double height = v39;
        }
        else
        {
          v61.origin.double x = v33;
          v61.origin.double y = v35;
          v61.size.double width = v37;
          v61.size.double height = v39;
          v64.origin.double x = x;
          v64.origin.double y = y;
          v64.size.double width = width;
          v64.size.double height = height;
          CGRect v62 = CGRectUnion(v61, v64);
          double x = v62.origin.x;
          double y = v62.origin.y;
          double width = v62.size.width;
          double height = v62.size.height;
        }
      }
      double v41 = v22[2](v22, x, y, width, height) + 8.0;
    }
    *a3 = v41;
    [(_UINavigationBarTitleViewOverlayRects *)self->_navBarTitleViewOverlayRects trailingItemsRect];
    double v43 = v63.origin.x;
    double v44 = v63.origin.y;
    double v45 = v63.size.width;
    double v46 = v63.size.height;
    if (CGRectIsNull(v63))
    {
      double v47 = v51;
      if (!v5) {
        double v47 = v50;
      }
      double v48 = v52 + v47;
    }
    else
    {
      double v48 = v23[2](v23, v43, v44, v45, v46) + 8.0;
    }
    *a4 = v48;

    BOOL v42 = 1;
  }
  else
  {
    BOOL v42 = 0;
  }

  return v42;
}

- (void)getTopInset:(double *)a3 bottomInset:(double *)a4 forBarMetrics:(int64_t)a5 barPosition:(int64_t)a6
{
  uint64_t v11 = [(_UISearchBarVisualProviderBase *)self searchBar];
  if (v11)
  {
    id v16 = v11;
    if (!UISearchBarUsesModernAppearance())
    {
      *a3 = 0.0;
      *a4 = 0.0;
LABEL_16:
      uint64_t v11 = v16;
      goto LABEL_17;
    }
    if (a6 == 3)
    {
      if (a5 != 102 && a5 != 1 && !_UIBarsUseNewPadHeights())
      {
        *a3 = 4.0;
        uint64_t v13 = [v16 _screen];
        if (![v13 _isEmbeddedScreen]
          || ([v13 _peripheryInsets], double v14 = 15.0, v15 <= 0.0))
        {
          double v14 = 10.0;
        }
        *a4 = v14;

        goto LABEL_16;
      }
      uint64_t v12 = 0x401C000000000000;
    }
    else
    {
      if ((*((unsigned char *)&self->_searchBarVisualProviderFlags + 3) & 0xC) != 0)
      {
        if (a5 == 102 || a5 == 1)
        {
          *a3 = 0.0;
          uint64_t v12 = 0x4020000000000000;
        }
        else
        {
          _UIBarsUseNewPadHeights();
          *a3 = 1.0;
          uint64_t v12 = 0x402E000000000000;
        }
        goto LABEL_15;
      }
      uint64_t v12 = 0x4024000000000000;
    }
    *(void *)a3 = v12;
LABEL_15:
    *(void *)a4 = v12;
    goto LABEL_16;
  }
LABEL_17:
}

- (BOOL)alwaysUsesLayoutMarginsForHorizontalContentInset
{
  return 0;
}

- (void)setOverrideContentInsets:(UIEdgeInsets)a3 forRectEdges:(unint64_t)a4
{
  if (os_variant_has_internal_diagnostics())
  {
    BOOL v5 = __UIFaultDebugAssertLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1853B0000, v5, OS_LOG_TYPE_FAULT, "overrideContentInsets SPI is not supported in the legacy visual provider", buf, 2u);
    }
  }
  else
  {
    BOOL v4 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &setOverrideContentInsets_forRectEdges____s_category) + 8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_1853B0000, v4, OS_LOG_TYPE_ERROR, "overrideContentInsets SPI is not supported in the legacy visual provider", v6, 2u);
    }
  }
}

- (void)getOverrideContentInsets:(UIEdgeInsets *)a3 overriddenEdges:(unint64_t *)a4
{
  if (os_variant_has_internal_diagnostics())
  {
    id v7 = __UIFaultDebugAssertLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1853B0000, v7, OS_LOG_TYPE_FAULT, "overrideContentInsets SPI is not supported in the legacy visual provider", buf, 2u);
    }

    if (a3) {
      goto LABEL_5;
    }
  }
  else
  {
    id v6 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &getOverrideContentInsets_overriddenEdges____s_category)
                      + 8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)double v8 = 0;
      _os_log_impl(&dword_1853B0000, v6, OS_LOG_TYPE_ERROR, "overrideContentInsets SPI is not supported in the legacy visual provider", v8, 2u);
    }
    if (a3)
    {
LABEL_5:
      *(_OWORD *)&a3->top = 0u;
      *(_OWORD *)&a3->bottom = 0u;
    }
  }
  if (a4) {
    *a4 = 0;
  }
}

- (void)updateEffectiveContentInset
{
  BOOL v3 = [(_UISearchBarVisualProviderBase *)self searchBar];
  BOOL v4 = v3;
  if (v3)
  {
    double v28 = 0.0;
    double v29 = 0.0;
    uint64_t v5 = [v3 effectiveUserInterfaceLayoutDirection];
    if (![(_UISearchBarVisualProviderLegacy *)self _getNavigationTitleLeadingInset:&v29 trailingInset:&v28 isRTL:v5 == 1])
    {
      $B0CEE0411BC9260FB4C6BC24420153D9 searchBarVisualProviderFlags = self->_searchBarVisualProviderFlags;
      if ((*(_DWORD *)&searchBarVisualProviderFlags & 0x3000000) == 0)
      {
        if ((*(_DWORD *)&searchBarVisualProviderFlags & 0x4000000) != 0)
        {
          [v4 directionalLayoutMargins];
          double v29 = v9;
        }
        else if ((*(_DWORD *)&searchBarVisualProviderFlags & 0x8000000) != 0)
        {
          double v10 = [v4 superview];
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && v10) {
            [v10 _resolvedLayoutMargins];
          }
          else {
            [v4 directionalLayoutMargins];
          }
          double v28 = v12;
          double v29 = v11;

          double v8 = v28;
        }
        else
        {
          double tableViewIndexWidth = self->_tableViewIndexWidth;
          if (tableViewIndexWidth <= 0.0)
          {
            [v4 safeAreaInsets];
            if (v5 == 1) {
              double v14 = v8;
            }
            else {
              double v14 = v13;
            }
            double v29 = v14;
            if (v5 == 1) {
              double v8 = v13;
            }
          }
          else
          {
            double v8 = tableViewIndexWidth + 8.0;
          }
        }
        if (v29 >= 8.0) {
          double v15 = v29;
        }
        else {
          double v15 = 8.0;
        }
        if (v8 >= 8.0) {
          double v16 = v8;
        }
        else {
          double v16 = 8.0;
        }
        double v28 = v16;
        double v29 = v15;
      }
    }
    -[_UISearchBarVisualProviderLegacy getTopInset:bottomInset:forBarMetrics:barPosition:](self, "getTopInset:bottomInset:forBarMetrics:barPosition:", &v27, &v26, -[_UISearchBarVisualProviderLegacy barMetricsForOrientation:](self, "barMetricsForOrientation:", objc_msgSend(v4, "_expectedInterfaceOrientation", 0, 0)), self->_barPosition);
    if (v5 == 1) {
      double v17 = v28;
    }
    else {
      double v17 = v29;
    }
    if (v5 == 1) {
      double v18 = v29;
    }
    else {
      double v18 = v28;
    }
    double v19 = fmax(v27, self->_minimumContentInsetPrivate.top);
    double v20 = fmax(v17, self->_minimumContentInsetPrivate.left);
    double v21 = fmax(v26, self->_minimumContentInsetPrivate.bottom);
    double v22 = fmax(v18, self->_minimumContentInsetPrivate.right);
    if (v20 != self->_effectiveContentInset.left
      || v19 != self->_effectiveContentInset.top
      || v22 != self->_effectiveContentInset.right
      || v21 != self->_effectiveContentInset.bottom)
    {
      self->_effectiveContentInset.top = v19;
      self->_effectiveContentInset.left = v20;
      self->_effectiveContentInset.bottom = v21;
      self->_effectiveContentInset.right = v22;
      [v4 setNeedsLayout];
    }
  }
}

- (UIEdgeInsets)scopeBarInsets
{
  double v3 = 7.0;
  CGFloat bottom = 8.0;
  if (UISearchBarUsesModernAppearance())
  {
    CGFloat left = self->_effectiveContentInset.left;
    CGFloat right = self->_effectiveContentInset.right;
    if ((*((unsigned char *)&self->_searchBarVisualProviderFlags + 3) & 4) != 0)
    {
      CGFloat bottom = self->_effectiveContentInset.bottom;
      id v7 = [(_UISearchBarVisualProviderBase *)self searchBar];
      -[_UISearchBarVisualProviderLegacy barMetricsForOrientation:](self, "barMetricsForOrientation:", [v7 _expectedInterfaceOrientation]);

      double v3 = 2.0;
    }
  }
  else
  {
    CGFloat right = 8.0;
    CGFloat left = 8.0;
  }
  double v8 = v3;
  double v9 = left;
  double v10 = bottom;
  double v11 = right;
  result.CGFloat right = v11;
  result.CGFloat bottom = v10;
  result.CGFloat left = v9;
  result.top = v8;
  return result;
}

- (double)scopeBarHeight
{
  double v3 = 0.0;
  [(_UISearchBarVisualProviderLegacy *)self getScopeBarHeight:0 containerHeight:&v3];
  return v3;
}

- (void)getScopeBarHeight:(double *)a3 containerHeight:(double *)a4
{
  if (UISearchBarUsesModernAppearance()
    && ([(_UISearchBarVisualProviderLegacy *)self isInNavigationPalette]
     || [(_UISearchBarVisualProviderLegacy *)self isHostedByNavigationBar]))
  {
    id v16 = [(_UISearchBarVisualProviderBase *)self searchBar];
    int64_t v7 = -[_UISearchBarVisualProviderLegacy barMetricsForOrientation:](self, "barMetricsForOrientation:", [v16 _expectedInterfaceOrientation]);
    if (v7 == 102 || v7 == 1)
    {
      if (a3)
      {
        +[UISegmentedControl defaultHeightForStyle:7 size:1];
        *(void *)a3 = v8;
      }
      double v9 = v16;
      if (!a4) {
        goto LABEL_20;
      }
      uint64_t v10 = 0x4040000000000000;
    }
    else
    {
      if (a3)
      {
        +[UISegmentedControl defaultHeightForStyle:7 size:0];
        *(void *)a3 = v15;
      }
      double v9 = v16;
      if (!a4) {
        goto LABEL_20;
      }
      uint64_t v10 = 0x4046000000000000;
    }
    *(void *)a4 = v10;
LABEL_20:

    return;
  }
  +[UISegmentedControl defaultHeightForStyle:7 size:0];
  double v12 = v11;
  [(_UISearchBarVisualProviderLegacy *)self scopeBarInsets];
  if (a4) {
    *a4 = v14 + v12 + v13;
  }
  if (a3) {
    *a3 = v12;
  }
}

- (BOOL)useRelaxedScopeLayout
{
  double v3 = [(_UISearchBarVisualProviderBase *)self searchBar];
  if (v3
    && UISearchBarUsesModernAppearance()
    && (self->_scopeBarPosition == 1
     || ([v3 bounds],
         -[_UISearchBarVisualProviderLegacy wouldCombineLandscapeBarsForSize:](self, "wouldCombineLandscapeBarsForSize:", v4, v5))))
  {
    id v6 = [v3 _searchController];
    if (v6)
    {
      int64_t v7 = [v3 _searchController];
      uint64_t v8 = [v7 traitCollection];
    }
    else
    {
      uint64_t v8 = [v3 traitCollection];
    }

    BOOL v9 = [v8 verticalSizeClass] == 2;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)containsScopeBar
{
  double v3 = [(_UISearchBarVisualProviderBase *)self searchBar];
  if (v3) {
    BOOL v4 = [(UIView *)self->_scopeBarContainerView isDescendantOfView:v3];
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (BOOL)scopeBarIsVisible
{
  if (!self->_scopeBar) {
    return 0;
  }
  if ((*((unsigned char *)&self->_searchBarVisualProviderFlags + 3) & 0x10) == 0) {
    return 0;
  }
  if ([(NSArray *)self->_scopeTitles count] < 2) {
    return 0;
  }
  if ([(_UISearchBarVisualProviderLegacy *)self isInBarButNotHosted])
  {
    double v3 = +[UIDevice currentDevice];
    uint64_t v4 = [v3 userInterfaceIdiom];

    if ((v4 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
      return 0;
    }
  }
  return [(_UISearchBarVisualProviderLegacy *)self containsScopeBar];
}

- (double)barHeightForBarMetrics:(int64_t)a3 withEffectiveInsets:(UIEdgeInsets)a4
{
  double bottom = a4.bottom;
  double top = a4.top;
  if (UISearchBarUsesModernAppearance())
  {
    int v7 = _UIBarsUseNewPadHeights();
    BOOL v8 = a3 == 102 || a3 == 1;
    double v9 = 36.0;
    double v10 = 30.0;
    if (!v8) {
      double v10 = 36.0;
    }
    if (!v7) {
      double v9 = v10;
    }
    double result = top + bottom + v9;
    if (a3 == 102)
    {
      return result + 22.0;
    }
    else if (a3 == 101)
    {
      return result + 34.0;
    }
  }
  else
  {
    double result = 44.0;
    if (a3 == 101) {
      double result = 75.0;
    }
    if (a3 == 1) {
      double result = 32.0;
    }
    if (a3 == 102) {
      return 54.0;
    }
  }
  return result;
}

- (double)searchFieldHeight
{
  double v3 = [(_UISearchBarAppearanceStorage *)self->_appearanceStorage searchFieldBackgroundImageForState:0];
  uint64_t v4 = v3;
  if (v3)
  {
    [v3 size];
    double v6 = v5;
  }
  else
  {
    int v7 = [(_UISearchBarVisualProviderBase *)self searchBar];
    if (dyld_program_sdk_at_least())
    {
      int64_t v8 = -[_UISearchBarVisualProviderLegacy barMetricsForOrientation:](self, "barMetricsForOrientation:", [v7 _expectedInterfaceOrientation]);
      if (v8 == 102 || v8 == 1)
      {
        if (UISearchBarUsesModernAppearance()) {
          double v6 = 30.0;
        }
        else {
          double v6 = 24.0;
        }
      }
      else if (_UIBarsUseNewPadHeights())
      {
        double v6 = 36.0;
      }
      else if (UISearchBarUsesModernAppearance())
      {
        double v6 = 36.0;
      }
      else
      {
        double v6 = 28.0;
      }
    }
    else
    {
      double v9 = +[UIDevice currentDevice];
      double v6 = 28.0;
      if (![v9 userInterfaceIdiom]
        && (unint64_t)([v7 _expectedInterfaceOrientation] - 3) <= 1)
      {
        double v6 = 24.0;
        if (!self->_searchNavigationItem)
        {
          $B0CEE0411BC9260FB4C6BC24420153D9 searchBarVisualProviderFlags = self->_searchBarVisualProviderFlags;
          if ((*(_DWORD *)&searchBarVisualProviderFlags & 0x4000000) == 0)
          {
            if ((*(_DWORD *)&searchBarVisualProviderFlags & 0x8000000) != 0) {
              int v11 = 24;
            }
            else {
              int v11 = 28;
            }
            double v6 = (double)v11;
          }
        }
      }
    }
  }

  return v6;
}

- (double)barHeightForBarMetrics:(int64_t)a3 barPosition:(int64_t)a4
{
  CGFloat top = self->_effectiveContentInset.top;
  double left = self->_effectiveContentInset.left;
  double right = self->_effectiveContentInset.right;
  double bottom = self->_effectiveContentInset.bottom;
  double v11 = top;
  [(_UISearchBarVisualProviderLegacy *)self getTopInset:&v11 bottomInset:&bottom forBarMetrics:a3 barPosition:a4];
  -[_UISearchBarVisualProviderLegacy barHeightForBarMetrics:withEffectiveInsets:](self, "barHeightForBarMetrics:withEffectiveInsets:", a3, v11, left, bottom, right);
  return result;
}

- (double)barHeightForBarMetrics:(int64_t)a3
{
  -[_UISearchBarVisualProviderLegacy barHeightForBarMetrics:withEffectiveInsets:](self, "barHeightForBarMetrics:withEffectiveInsets:", a3, self->_effectiveContentInset.top, self->_effectiveContentInset.left, self->_effectiveContentInset.bottom, self->_effectiveContentInset.right);
  return result;
}

- (double)defaultHeight
{
  double v3 = [(_UISearchBarVisualProviderBase *)self searchBar];
  -[_UISearchBarVisualProviderLegacy defaultHeightForOrientation:](self, "defaultHeightForOrientation:", [v3 _expectedInterfaceOrientation]);
  double v5 = v4;

  return v5;
}

- (double)_defaultWidth
{
  BOOL v2 = [(_UISearchBarVisualProviderBase *)self searchBar];
  double v3 = v2;
  if (v2)
  {
    double v4 = [v2 traitCollection];
    uint64_t v5 = [v4 userInterfaceIdiom];

    if (v5 == 2) {
      double v6 = 600.0;
    }
    else {
      double v6 = 0.0;
    }
  }
  else
  {
    double v6 = 0.0;
  }

  return v6;
}

- (double)defaultHeightForOrientation:(int64_t)a3
{
  uint64_t v5 = [(_UISearchBarVisualProviderBase *)self searchBar];
  double v6 = v5;
  if (!v5)
  {
    double v10 = 0.0;
    goto LABEL_18;
  }
  int v7 = [v5 traitCollection];
  uint64_t v8 = [v7 userInterfaceIdiom];

  if (v8 == 2)
  {
    *(double *)&uint64_t v9 = 60.0;
LABEL_4:
    double v10 = *(double *)&v9;
    goto LABEL_18;
  }
  if (dyld_program_sdk_at_least())
  {
    [(_UISearchBarVisualProviderLegacy *)self barHeightForBarMetrics:[(_UISearchBarVisualProviderLegacy *)self barMetricsForOrientation:a3]];
    double v10 = v11;
  }
  else
  {
    if ([(_UISearchBarVisualProviderLegacy *)self isInBarButNotHosted])
    {
      double v12 = +[UIDevice currentDevice];
      uint64_t v13 = [v12 userInterfaceIdiom];

      if ((v13 & 0xFFFFFFFFFFFFFFFBLL) == 1)
      {
        *(double *)&uint64_t v9 = 44.0;
        goto LABEL_4;
      }
    }
    double v14 = [(UILabel *)self->_promptLabel text];
    uint64_t v15 = [v14 length];

    if (v15) {
      double v10 = 75.0;
    }
    else {
      double v10 = 44.0;
    }
  }
  if ((*((unsigned char *)&self->_searchBarVisualProviderFlags + 3) & 0x10) != 0
    && [(NSArray *)self->_scopeTitles count] >= 2
    && ![(_UISearchBarVisualProviderLegacy *)self shouldCombineLandscapeBarsForOrientation:a3])
  {
    [(_UISearchBarVisualProviderLegacy *)self scopeBarHeight];
    double v10 = v10 + v16;
  }
LABEL_18:

  return v10;
}

- (double)navigationBarContentHeight
{
  int v2 = _UIBarsUseNewPadHeights();
  double result = 50.0;
  if (!v2) {
    return 0.0;
  }
  return result;
}

- (void)updateNavigationBarLayoutInsertDataForSearchBar:(id)a3 collapsibleScopeBar:(id)a4 forLayoutState:(int64_t)a5
{
  int v7 = (double *)a4;
  uint64_t v8 = (double *)a3;
  id v13 = [(_UISearchBarVisualProviderBase *)self searchBar];
  -[_UISearchBarVisualProviderLegacy barHeightForBarMetrics:](self, "barHeightForBarMetrics:", -[_UISearchBarVisualProviderLegacy barMetricsForOrientation:](self, "barMetricsForOrientation:", [v13 _expectedInterfaceOrientation]));
  double v10 = v9;
  [(_UISearchBarVisualProviderLegacy *)self defaultHeight];
  double v12 = v11;
  if (v8)
  {
    v8[4] = v10;
    v8[5] = v10;
  }

  if (v7)
  {
    v7[4] = v12 - v10;
    v7[5] = v12 - v10;
    *((unsigned char *)v7 + 8) &= ~1u;
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  double v6 = [(_UISearchBarVisualProviderBase *)self searchBar];
  if (v6)
  {
    [(_UISearchBarVisualProviderLegacy *)self defaultHeight];
    CGFloat v8 = v7;
    int v9 = dyld_program_sdk_at_least();
    double v10 = fabs(width);
    if (v9)
    {
      if (v10 >= INFINITY && v10 <= INFINITY)
      {
        double v11 = [MEMORY[0x1E4F28B00] currentHandler];
        v24.double width = width;
        v24.double height = v8;
        double v12 = NSStringFromCGSize(v24);
        [v11 handleFailureInMethod:a2, self, @"_UISearchBarVisualProviderLegacy.m", 2370, @"-[UISearchBar sizeThatFits:] does not support passing non-finite values (%@)", v12 object file lineNumber description];
      }
    }
    else
    {
      if (v10 == INFINITY) {
        double v13 = 0.0;
      }
      else {
        double v13 = width;
      }
      double width = v13;
    }
    if (![(_UISearchBarVisualProviderLegacy *)self isInBarButNotHosted]
      || (+[UIDevice currentDevice],
          double v14 = objc_claimAutoreleasedReturnValue(),
          uint64_t v15 = [v14 userInterfaceIdiom],
          v14,
          (v15 & 0xFFFFFFFFFFFFFFFBLL) != 1))
    {
      if (width == 0.0)
      {
        double v16 = [v6 superview];
        double v17 = v16;
        if (v16)
        {
          [v16 bounds];
          double width = v18;
        }
        else if (fabs(width) < 2.22044605e-16)
        {
          double v19 = [v6 _screen];
          [v19 bounds];
          double width = v20;
        }
      }
    }
    [(_UISearchBarVisualProviderLegacy *)self _defaultWidth];
    if (v21 > 0.0) {
      double width = v21;
    }
  }
  else
  {
    double width = *MEMORY[0x1E4F1DB30];
    CGFloat v8 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }

  double v22 = width;
  double v23 = v8;
  result.double height = v23;
  result.double width = v22;
  return result;
}

- (CGSize)intrinsicContentSize
{
  double v3 = [(_UISearchBarVisualProviderBase *)self searchBar];
  if (v3)
  {
    [(_UISearchBarVisualProviderLegacy *)self _defaultWidth];
    double v5 = v4;
    [(_UISearchBarVisualProviderLegacy *)self defaultHeight];
    if (v5 == 0.0) {
      double v7 = -1.0;
    }
    else {
      double v7 = v5;
    }
    if (v6 == 0.0) {
      double v8 = -1.0;
    }
    else {
      double v8 = v6;
    }
  }
  else
  {
    double v8 = -1.0;
    double v7 = -1.0;
  }

  double v9 = v7;
  double v10 = v8;
  result.double height = v10;
  result.double width = v9;
  return result;
}

- (void)displayNavBarCancelButton:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id v13 = [(_UISearchBarVisualProviderLegacy *)self searchNavigationItem];
  if (v5)
  {
    double v7 = [(_UISearchBarVisualProviderLegacy *)self cancelBarButtonItem];
    double v8 = (void *)MEMORY[0x1E4F1CA48];
    double v9 = [v13 rightBarButtonItems];
    cancelBarButtonItem = [v8 arrayWithArray:v9];

    [cancelBarButtonItem addObject:v7];
    [v13 setRightBarButtonItems:cancelBarButtonItem animated:v4];
  }
  else
  {
    double v11 = (void *)MEMORY[0x1E4F1CA48];
    double v12 = [v13 rightBarButtonItems];
    double v7 = [v11 arrayWithArray:v12];

    [v7 removeObjectIdenticalTo:self->_cancelBarButtonItem];
    [v13 setRightBarButtonItems:v7 animated:v4];
    cancelBarButtonItem = self->_cancelBarButtonItem;
    self->_cancelBarButtonItem = 0;
  }
}

- (BOOL)searchFieldWidthShouldBeFlexible
{
  p_searchDisplayController = &self->_searchDisplayController;
  id WeakRetained = objc_loadWeakRetained(&self->_searchDisplayController);
  if (WeakRetained)
  {
    id v4 = objc_loadWeakRetained(p_searchDisplayController);
    if ([v4 displaysSearchBarInNavigationBar])
    {
      id v5 = objc_loadWeakRetained(p_searchDisplayController);
      if ([v5 displaysSearchBarInNavigationBar])
      {
        id v6 = objc_loadWeakRetained(p_searchDisplayController);
        BOOL v7 = [v6 navigationBarSearchFieldSizing] == 0;
      }
      else
      {
        BOOL v7 = 0;
      }
    }
    else
    {
      BOOL v7 = 1;
    }
  }
  else
  {
    BOOL v7 = 1;
  }

  return v7;
}

- (double)availableBoundsWidth
{
  double v3 = [(_UISearchBarVisualProviderBase *)self searchBar];
  id v4 = v3;
  if (v3)
  {
    [v3 bounds];
    -[_UISearchBarVisualProviderLegacy availableBoundsWidthForSize:](self, "availableBoundsWidthForSize:", v5, v6);
    double v8 = v7;
  }
  else
  {
    double v8 = 0.0;
  }

  return v8;
}

- (double)landscapeSearchFieldWidth
{
  if ([(_UISearchBarVisualProviderLegacy *)self searchFieldWidthShouldBeFlexible])
  {
    [(_UISearchBarVisualProviderLegacy *)self availableBoundsWidth];
    return round(v3 * 0.4);
  }
  else
  {
    [(UIView *)self->_searchField frame];
    return CGRectGetWidth(*(CGRect *)&v5);
  }
}

- (double)landscapeScopeBarWidth
{
  [(_UISearchBarVisualProviderLegacy *)self scopeBarInsets];
  double v4 = v3;
  double v6 = v5;
  [(_UISearchBarVisualProviderLegacy *)self availableBoundsWidth];
  double v8 = v7;
  [(_UISearchBarVisualProviderLegacy *)self landscapeSearchFieldWidth];
  return v8 - v9 + -13.0 - v4 - v6;
}

- (double)availableBoundsWidthForSize:(CGSize)a3
{
  double width = a3.width;
  if ([(_UISearchBarVisualProviderLegacy *)self searchFieldWidthShouldBeFlexible])
  {
    double v5 = width - self->_effectiveContentInset.left - self->_effectiveContentInset.right;
    leftButton = self->_leftButton;
    if (leftButton)
    {
      [(UINavigationButton *)leftButton _pathTitleEdgeInsets];
      double v9 = v7 + v8;
      [(UIView *)self->_leftButton frame];
      double v5 = v5 - (CGRectGetWidth(v27) + 11.0 - v9);
    }
    if (self->_cancelButton)
    {
      if ((*((unsigned char *)&self->_searchBarVisualProviderFlags + 2) & 4) != 0)
      {
        if (![(_UISearchBarVisualProviderLegacy *)self isInBarButNotHosted]
          || (+[UIDevice currentDevice],
              double v10 = objc_claimAutoreleasedReturnValue(),
              uint64_t v11 = [v10 userInterfaceIdiom],
              v10,
              (v11 & 0xFFFFFFFFFFFFFFFBLL) != 1))
        {
          [(UIButton *)self->_cancelButton _pathTitleEdgeInsets];
          double v13 = v12;
          double v15 = v14;
          [(UIView *)self->_cancelButton frame];
          double v16 = v5 - (CGRectGetWidth(v28) + 11.0 - v15 - v13);
          double right = self->_effectiveContentInset.right;
          double v18 = 8.0 - right;
          BOOL v19 = right < 8.0;
          double v20 = 0.0;
          if (v19) {
            double v20 = v18;
          }
          return v16 - v20;
        }
      }
    }
    return v5;
  }
  else
  {
    [(UIView *)self->_searchField frame];
    return CGRectGetWidth(*(CGRect *)&v22);
  }
}

- (BOOL)shouldCombineLandscapeBarsForOrientation:(int64_t)a3
{
  if ([(_UISearchBarVisualProviderLegacy *)self useRelaxedScopeLayout]) {
    return 0;
  }
  unint64_t scopeBarPosition = self->_scopeBarPosition;
  if (scopeBarPosition) {
    return scopeBarPosition == 1;
  }
  BOOL result = 0;
  if ((unint64_t)(a3 - 1) >= 2 && (*(_DWORD *)&self->_searchBarVisualProviderFlags & 0x20000000) != 0)
  {
    double v7 = +[UIDevice currentDevice];
    uint64_t v8 = [v7 userInterfaceIdiom];

    if (v8)
    {
      if (self->_scopeBarContainerView)
      {
        -[UISegmentedControl sizeThatFits:](self->_scopeBar, "sizeThatFits:", 10000.0, 10000.0);
        double v10 = v9;
      }
      else
      {
        double v10 = 0.0;
      }
      [(_UISearchBarVisualProviderLegacy *)self landscapeScopeBarWidth];
      return v10 <= v11;
    }
    else
    {
      return 1;
    }
  }
  return result;
}

- (BOOL)wouldCombineLandscapeBarsForSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v6 = [(_UISearchBarVisualProviderBase *)self searchBar];
  if (v6)
  {
    if (self->_scopeBarContainerView)
    {
      -[UISegmentedControl sizeThatFits:](self->_scopeBar, "sizeThatFits:", 10000.0, 10000.0);
      double v8 = v7;
    }
    else
    {
      double v8 = 0.0;
    }
    [(_UISearchBarVisualProviderLegacy *)self scopeBarInsets];
    double v11 = v10;
    double v13 = v12;
    -[_UISearchBarVisualProviderLegacy availableBoundsWidthForSize:](self, "availableBoundsWidthForSize:", width, height);
    double v15 = v14;
    if ([(_UISearchBarVisualProviderLegacy *)self searchFieldWidthShouldBeFlexible])
    {
      double v16 = round(v15 * 0.4);
    }
    else
    {
      [(UIView *)self->_searchField frame];
      double v16 = CGRectGetWidth(v18);
    }
    BOOL v9 = v8 <= v15 - v16 + -13.0 - v11 - v13;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (void)layoutSubviews
{
  double v3 = [(_UISearchBarVisualProviderBase *)self searchBar];
  if (v3)
  {
    id v4 = v3;
    [v3 bounds];
    [(_UISearchBarVisualProviderLegacy *)self layoutSubviewsInBounds:"layoutSubviewsInBounds:"];
    double v3 = v4;
  }
}

- (void)layoutSubviewsInBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v8 = [(_UISearchBarVisualProviderBase *)self searchBar];
  BOOL v9 = v8;
  if (!v8) {
    goto LABEL_150;
  }
  if (!self->_searchField)
  {
    double v10 = [v8 _searchBarTextField];
    searchField = self->_searchField;
    self->_searchField = v10;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navBarTitleViewDataSource);
  id v169 = WeakRetained;
  if (WeakRetained)
  {
    double v13 = WeakRetained;
    navBarTitleViewOverlayRects = self->_navBarTitleViewOverlayRects;
    if (navBarTitleViewOverlayRects)
    {
      [(_UINavigationBarTitleViewOverlayRects *)navBarTitleViewOverlayRects reset];
    }
    else
    {
      double v16 = objc_alloc_init(_UINavigationBarTitleViewOverlayRects);
      double v17 = self->_navBarTitleViewOverlayRects;
      self->_navBarTitleViewOverlayRects = v16;
    }
    [v13 titleView:v9 needsUpdatedContentOverlayRects:self->_navBarTitleViewOverlayRects];
    [(_UISearchBarVisualProviderLegacy *)self updateEffectiveContentInset];
    BOOL v15 = 1;
  }
  else
  {
    BOOL v15 = [(_UISearchBarVisualProviderLegacy *)self isInBarButNotHosted];
  }
  CGRect v18 = [v9 window];
  BOOL v19 = [v18 windowScene];
  uint64_t v20 = [v19 interfaceOrientation];

  BOOL v21 = [(_UISearchBarVisualProviderLegacy *)self shouldCombineLandscapeBarsForOrientation:v20];
  if (v21 && v15)
  {
    uint64_t v22 = +[UIDevice currentDevice];
    uint64_t v23 = [v22 userInterfaceIdiom];

    BOOL v21 = (v23 & 0xFFFFFFFFFFFFFFFBLL) != 1;
  }
  BOOL v170 = [(_UISearchBarVisualProviderLegacy *)self useRelaxedScopeLayout];
  BOOL v24 = [(_UISearchBarVisualProviderLegacy *)self scopeBarIsVisible];
  BOOL v25 = [(_UISearchBarVisualProviderLegacy *)self containsScopeBar];
  [(_UISearchBarVisualProviderLegacy *)self scopeBarHeight];
  double v27 = v26;
  int v175 = v9[28];
  BOOL v174 = v15;
  if (v15)
  {
    CGRect v28 = [v9 superview];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v29 = [v28 topItem];
      double v30 = [v29 titleView];
      if (v30 == v9)
      {
      }
      else
      {
        $B0CEE0411BC9260FB4C6BC24420153D9 searchBarVisualProviderFlags = self->_searchBarVisualProviderFlags;

        if ((*(_DWORD *)&searchBarVisualProviderFlags & 0x8000000) == 0)
        {
          [v28 frame];
          double height = v32;
          objc_msgSend(v9, "setBounds:", x, y, width);
        }
      }
    }
    int v34 = 1;
    [(UIImageView *)self->_searchBarBackground setHidden:1];
    [(_UISearchBarVisualProviderLegacy *)self updateSearchBarOpacity];

    if (!v25) {
      goto LABEL_25;
    }
    CGFloat v35 = +[UIDevice currentDevice];
    uint64_t v36 = [v35 userInterfaceIdiom];

    if ((v36 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    {
      [(UIView *)self->_scopeBarContainerView removeFromSuperview];
      int v34 = 0;
LABEL_25:
      uint64_t v33 = 0;
      goto LABEL_44;
    }
  }
  else
  {
    [(UIImageView *)self->_searchBarBackground setHidden:[(_UISearchBarVisualProviderLegacy *)self drawsBackground] ^ 1];
    [(_UISearchBarVisualProviderLegacy *)self updateSearchBarOpacity];
    if (!v25)
    {
      uint64_t v33 = 0;
      int v34 = 1;
      goto LABEL_44;
    }
  }
  CGFloat v37 = self->_scopeBarContainerView;
  double v38 = v37;
  if (v24)
  {
    if (v21)
    {
      [v9 bringSubviewToFront:v37];
      [(UIView *)self->_scopeBarBackgroundView setAlpha:0.0];
    }
    else
    {
      [v9 sendSubviewToBack:v37];
      [(UIView *)self->_scopeBarBackgroundView setAlpha:1.0];
      [(UIView *)v38 frame];
      double v40 = v39;
      [v9 bounds];
      if (v40 >= CGRectGetMaxX(v199))
      {
        [(UIView *)v38 frame];
        uint64_t v42 = v41;
        v192[0] = MEMORY[0x1E4F143A8];
        v192[1] = 3221225472;
        v192[2] = __59___UISearchBarVisualProviderLegacy_layoutSubviewsInBounds___block_invoke;
        v192[3] = &unk_1E52DA520;
        v193 = v38;
        uint64_t v194 = 0;
        uint64_t v195 = v42;
        double v196 = width;
        double v197 = v27;
        +[UIView performWithoutAnimation:v192];
      }
      [(_UISearchBarVisualProviderLegacy *)self updateScopeBarFrame];
    }
    if (UISearchBarUsesModernAppearance())
    {
      [(_UISearchBarVisualProviderLegacy *)self barHeightForBarMetrics:[(_UISearchBarVisualProviderLegacy *)self barMetricsForOrientation:v20]];
      double v44 = v43;
    }
    else
    {
      double v44 = 44.0;
    }
    [(UIView *)v38 frame];
    if (v44 < height - v45) {
      double v44 = height - v45;
    }
    if (v44 == height)
    {
      uint64_t v33 = 0;
    }
    else
    {
      *(_DWORD *)&self->_searchBarVisualProviderFlags |= 0x10000u;
      uint64_t v33 = 1;
    }
  }
  else
  {
    if (![(UIView *)v37 isHidden] && !v21)
    {
      v198.origin.double x = x;
      v198.origin.double y = y;
      v198.size.double width = width;
      v198.size.double height = height;
      -[UIView setFrame:](v38, "setFrame:", 0.0, CGRectGetMaxY(v198), width, v27);
    }
    uint64_t v33 = 0;
  }
  [(UISearchBarBackground *)self->_searchBarBackground setUsesContiguousBarBackground:v24 && !v21];

  int v34 = 0;
LABEL_44:
  int v171 = v34;
  if (*((unsigned char *)&self->_searchBarVisualProviderFlags + 2)) {
    [(_UISearchBarVisualProviderLegacy *)self layoutBackgroundViewConsideringTopBarStatusAndChangedHeight:v33];
  }
  UIRoundToViewScale(v9);
  double top = self->_effectiveContentInset.top;
  double left = self->_effectiveContentInset.left;
  double v48 = x + left;
  double v49 = y + top;
  double v172 = width - (left + self->_effectiveContentInset.right);
  double v51 = v50 - (top + self->_effectiveContentInset.bottom);
  [(UIView *)self->_cancelButton bounds];
  double v53 = v52;
  double v55 = v54;
  -[UIButton sizeThatFits:](self->_cancelButton, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  -[UIButton setBounds:](self->_cancelButton, "setBounds:", v53, v55, v56, v57);
  CGRect v58 = [(UILabel *)self->_promptLabel text];
  if ([v58 length]) {
    char v59 = v174;
  }
  else {
    char v59 = 1;
  }

  double v167 = v27;
  if (v59)
  {
    [(UIView *)self->_promptLabel removeFromSuperview];
  }
  else
  {
    int64_t v60 = [(_UISearchBarVisualProviderLegacy *)self barMetricsForOrientation:v20];
    [v9 addSubview:self->_promptLabel];
    [(UIView *)self->_promptLabel sizeToFit];
    [(UIView *)self->_promptLabel frame];
    CGFloat v62 = v61;
    CGFloat v64 = v63;
    double v66 = v65;
    if (UISearchBarUsesModernAppearance())
    {
      double v67 = 34.0;
      if (v60 == 102) {
        double v67 = 22.0;
      }
      double v68 = v48 + 0.0;
      double v49 = v49 + v67;
      double v51 = v51 - v67;
      if (v60 == 102) {
        double v69 = 3.0;
      }
      else {
        double v69 = 12.0;
      }
      v200.origin.double x = v48 + 0.0;
      v200.origin.double y = v49;
      v200.size.double width = v172;
      v200.size.double height = v51;
      CGFloat v70 = CGRectGetMinY(v200) - v69;
      v201.origin.double x = v48;
      v201.origin.double y = v62;
      v201.size.double width = v64;
      v201.size.double height = v66;
      double v71 = CGRectGetHeight(v201);
      [(UILabel *)self->_promptLabel _baselineOffsetFromBottom];
      double v72 = v172;
      double v74 = v70 - (v71 + v73);
    }
    else
    {
      double v68 = v48 + 0.0;
      double v49 = v49 + v51 + -44.0;
      double v51 = v51 - (v51 + -44.0);
      double v74 = 7.0;
      double v72 = v172;
    }
    double v75 = v68;
    double v76 = v49;
    double v77 = v51;
    -[UILabel setFrame:](self->_promptLabel, "setFrame:", v48, v74, CGRectGetWidth(*(CGRect *)(&v72 - 2)), v66);
    double v48 = v68;
  }
  double rect = v51;
  if (self->_leftButton)
  {
    objc_msgSend(v9, "addSubview:");
    [(UIView *)self->_leftButton sizeToFit];
    [(UIView *)self->_leftButton frame];
    double v81 = v80;
    double v83 = v82;
    if ((v175 & 0x80000) != 0)
    {
      CGFloat v84 = v78;
      CGFloat v85 = v79;
      v202.origin.double x = v48;
      v202.origin.double y = v49;
      v202.size.double width = v172;
      v202.size.double height = v51;
      double MaxX = CGRectGetMaxX(v202);
      v203.origin.double x = v84;
      v203.origin.double y = v85;
      v203.size.double width = v81;
      v203.size.double height = v83;
      double v48 = MaxX - CGRectGetWidth(v203);
    }
    double v87 = round(v49 + v51 * 0.5 - v83 * 0.5) + -1.0;
    double v88 = 11.0;
    if ((v175 & 0x80000) == 0)
    {
      v204.origin.double x = v48;
      v204.origin.double y = v87;
      v204.size.double width = v81;
      v204.size.double height = v83;
      double v88 = CGRectGetMaxX(v204) + 11.0;
    }
    -[UIButton setFrame:](self->_leftButton, "setFrame:", v48, v87, v81, v83, *(void *)&v167);
    double v48 = v88;
  }
  [(_UISearchBarVisualProviderLegacy *)self searchFieldHeight];
  double v90 = v89;
  if ((*((unsigned char *)&self->_searchBarVisualProviderFlags + 3) & 0xC) != 0)
  {
    [(_UISearchBarVisualProviderLegacy *)self barHeightForBarMetrics:[(_UISearchBarVisualProviderLegacy *)self barMetricsForOrientation:v20]];
    double v92 = v91;
    [v9 bounds];
    double v94 = fmax(v92 - v93, 0.0);
    if (v90 <= v94) {
      double v94 = v90;
    }
    double v95 = v94 / v90;
    double v90 = v90 - v94;
    v188[0] = MEMORY[0x1E4F143A8];
    v188[1] = 3221225472;
    v189 = __59___UISearchBarVisualProviderLegacy_layoutSubviewsInBounds___block_invoke_2;
    v190 = &__block_descriptor_40_e11_d24__0d8d16l;
    double v191 = v95;
    double v96 = fmax(v95 / 0.2, 0.0);
    if (v96 >= 1.0) {
      double v97 = 0.0;
    }
    else {
      double v97 = 1.0 - v96;
    }
    v98 = [v9 _searchBarTextField];
    [v98 _setForegroundViewsAlpha:v97];

    double v99 = v189((uint64_t)v188, 0.8, 0.95);
    v100 = [v9 _searchBarTextField];
    [v100 _setBackgroundViewsAlpha:v99];
  }
  double v101 = v48;
  if ((v175 & 0x80000) != 0)
  {
    double v101 = v48;
    if (self->_cancelButton)
    {
      double v101 = v48;
      if ((*((unsigned char *)&self->_searchBarVisualProviderFlags + 2) & 4) != 0)
      {
        if (![(_UISearchBarVisualProviderLegacy *)self isInBarButNotHosted]
          || (+[UIDevice currentDevice],
              v102 = objc_claimAutoreleasedReturnValue(),
              uint64_t v103 = [v102 userInterfaceIdiom],
              v102,
              double v101 = v48,
              (v103 & 0xFFFFFFFFFFFFFFFBLL) != 1))
        {
          [(UIView *)self->_cancelButton frame];
          double v101 = v48 + v104 + 11.0;
        }
      }
    }
  }
  if (!UISearchBarUsesModernAppearance()
    || (double v105 = v49, (*((unsigned char *)&self->_searchBarVisualProviderFlags + 3) & 0xC) == 0))
  {
    double v106 = v49 + (rect - v90) * 0.5;
    v107 = +[UIDevice currentDevice];
    uint64_t v108 = [v107 userInterfaceIdiom];
    double v109 = ceil(v106);
    double v110 = floor(v106);
    if (v108 == 1) {
      double v105 = v109;
    }
    else {
      double v105 = v110;
    }
  }
  if (v24 && v21) {
    [(_UISearchBarVisualProviderLegacy *)self landscapeSearchFieldWidth];
  }
  else {
    [(_UISearchBarVisualProviderLegacy *)self availableBoundsWidth];
  }
  double v112 = v111;
  v113 = [(_UISearchBarAppearanceStorage *)self->_appearanceStorage searchFieldPositionAdjustment];
  v114 = v113;
  if (v113)
  {
    int v115 = v9[28];
    [v113 UIOffsetValue];
    if ((*(void *)&v115 & 0x80000) != 0) {
      double v116 = -v116;
    }
    double v101 = v101 + v116;
    double v105 = v105 + v117;
  }

  v205.origin.double x = v101;
  v205.origin.double y = v105;
  v205.size.double width = v112;
  v205.size.double height = v90;
  double v118 = CGRectGetHeight(v205);
  [(UIView *)self->_searchField frame];
  if (v118 != CGRectGetHeight(v206)) {
    [(_UISearchBarVisualProviderLegacy *)self updateRightView];
  }
  if (v24 && v170)
  {
    double v119 = _UIViewReadableWidthForView(v9);
    v207.origin.double x = v101;
    v207.origin.double y = v105;
    v207.size.double width = v112;
    v207.size.double height = v90;
    if (v119 < CGRectGetWidth(v207))
    {
      v208.origin.double x = v48;
      v208.origin.double y = v49;
      v208.size.double width = v172;
      v208.size.double height = rect;
      double v120 = round(CGRectGetMidX(v208) + v119 * -0.5);
      if ((v175 & 0x80000) != 0)
      {
        v211.origin.double x = v101;
        v211.origin.double y = v105;
        v211.size.double width = v112;
        v211.size.double height = v90;
        double MinX = CGRectGetMinX(v211);
        v212.origin.double x = v120;
        v212.origin.double y = v105;
        v212.size.double width = v119;
        v212.size.double height = v90;
        double v122 = fmax(MinX - CGRectGetMinX(v212), 0.0);
      }
      else
      {
        v209.origin.double x = v101;
        v209.origin.double y = v105;
        v209.size.double width = v112;
        v209.size.double height = v90;
        double v121 = CGRectGetMaxX(v209);
        v210.origin.double x = v120;
        v210.origin.double y = v105;
        v210.size.double width = v119;
        v210.size.double height = v90;
        double v122 = v121 - CGRectGetMaxX(v210);
        if (v122 > 0.0) {
          double v122 = 0.0;
        }
      }
      double v101 = v120 + v122;
      double v112 = v119;
    }
  }
  v124 = [v9 delegate];
  if (v124 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v124, "_searchBar:proposedSearchFieldFrame:", v9, v101, v105, v112, v90);
    double v126 = v125;
    double v105 = v127;
    double v129 = v128;
    double v90 = v130;
  }
  else
  {
    double v129 = v112;
    double v126 = v101;
  }
  -[UITextField setFrame:](self->_searchField, "setFrame:", v126, v105, v129, v90);
  if ((v171 | !v21))
  {
    double v131 = rect;
    if (v24 && v170) {
      [(_UISearchBarVisualProviderLegacy *)self updateScopeBarFrame];
    }
    goto LABEL_111;
  }
  if (v24)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __59___UISearchBarVisualProviderLegacy_layoutSubviewsInBounds___block_invoke_3;
    aBlock[3] = &unk_1E52DF378;
    aBlock[4] = self;
    double v179 = v126;
    double v180 = v105;
    double v181 = v129;
    double v182 = v90;
    double v183 = v48;
    double v184 = v49;
    double v131 = rect;
    double v185 = v172;
    double v186 = rect;
    double v187 = v168;
    v178 = v9;
    v132 = (void (**)(void))_Block_copy(aBlock);
    v132[2]();

LABEL_111:
    char v133 = !v24;
    if ((*(_DWORD *)&self->_searchBarVisualProviderFlags & 0xC0000000) != 0) {
      char v133 = 1;
    }
    if ((v133 & 1) == 0) {
      [(UIView *)self->_scopeBarContainerView setAlpha:1.0];
    }
    goto LABEL_116;
  }
  [v9 bounds];
  double v134 = CGRectGetMaxX(v213);
  double v131 = rect;
  UIRoundToViewScale(v9);
  double v136 = v135 + 1.0;
  [(_UISearchBarVisualProviderLegacy *)self landscapeScopeBarWidth];
  -[UIView setFrame:](self->_scopeBarContainerView, "setFrame:", v134, v136, v137, v168);
LABEL_116:
  if (v174
    && (+[UIDevice currentDevice],
        v138 = objc_claimAutoreleasedReturnValue(),
        uint64_t v139 = [v138 userInterfaceIdiom],
        v138,
        (v139 & 0xFFFFFFFFFFFFFFFBLL) == 1))
  {
    [(UIView *)self->_cancelButton removeFromSuperview];
    v140 = v169;
  }
  else
  {
    cancelButton = self->_cancelButton;
    if (cancelButton)
    {
      v142 = [(UIView *)cancelButton superview];
      v143 = [v9 _viewForChildViews];

      v144 = self->_cancelButton;
      if (v142 != v143)
      {
        [v9 addSubview:v144];
        v144 = self->_cancelButton;
      }
    }
    else
    {
      v144 = 0;
    }
    [(UIView *)v144 frame];
    double v146 = v145;
    double v148 = v147;
    if ((v175 & 0x80000) != 0)
    {
      if (v24)
      {
        scopeBarContainerView = self->_scopeBarContainerView;
        if (scopeBarContainerView) {
          BOOL v154 = v21;
        }
        else {
          BOOL v154 = 0;
        }
        v140 = v169;
        if (v154)
        {
          [(UIView *)scopeBarContainerView frame];
          double v101 = v155;
        }
      }
      else
      {
        v140 = v169;
      }
      [(UIButton *)self->_cancelButton _pathTitleEdgeInsets];
      double v157 = v101 + -11.0 + v158 - v146;
    }
    else
    {
      if (v24)
      {
        v149 = self->_scopeBarContainerView;
        if (v149) {
          BOOL v150 = v21;
        }
        else {
          BOOL v150 = 0;
        }
        v140 = v169;
        if (v150)
        {
          [(UIView *)v149 frame];
          double v101 = v151;
          double v112 = v152;
        }
      }
      else
      {
        v140 = v169;
      }
      [(UIButton *)self->_cancelButton _pathTitleEdgeInsets];
      double v157 = v112 + v101 + 11.0 - v156;
    }
    double v159 = round(v49 + v131 * 0.5 - v148 * 0.5) + -1.0;
    v160 = self->_cancelButton;
    if (v160
      && ([(UIView *)v160 subviews],
          v161 = objc_claimAutoreleasedReturnValue(),
          uint64_t v162 = [v161 count],
          v161,
          !v162)
      && +[UIView _isInAnimationBlockWithAnimationsEnabled])
    {
      v176[0] = MEMORY[0x1E4F143A8];
      v176[1] = 3221225472;
      v176[2] = __59___UISearchBarVisualProviderLegacy_layoutSubviewsInBounds___block_invoke_4;
      v176[3] = &unk_1E52DA520;
      v176[4] = self;
      *(double *)&v176[5] = v157;
      *(double *)&v176[6] = v159;
      *(double *)&v176[7] = v146;
      *(double *)&v176[8] = v148;
      +[UIView performWithoutAnimation:v176];
    }
    else
    {
      -[UIButton setFrame:](self->_cancelButton, "setFrame:", v157, v159, v146, v148);
      double v163 = 1.0;
      if ((*(_DWORD *)&self->_searchBarVisualProviderFlags & 0x40000) == 0) {
        double v163 = 0.0;
      }
      [(UIView *)self->_cancelButton setAlpha:v163];
    }
  }
  separator = self->_separator;
  if (separator)
  {
    [(UIView *)separator frame];
    double v166 = -v165;
    [v9 bounds];
    -[UIImageView setFrame:](self->_separator, "setFrame:", 0.0, v166);
  }

LABEL_150:
}

- (BOOL)isAtTop
{
  int v2 = [(_UISearchBarVisualProviderBase *)self searchBar];
  double v3 = v2;
  if (v2)
  {
    id v4 = [v2 window];
    if (v4
      && ([v3 _containingScrollView],
          double v5 = objc_claimAutoreleasedReturnValue(),
          v5,
          !v5))
    {
      if ([(id)UIApp _appAdoptsUISceneLifecycle])
      {
        uint64_t v7 = [(id)UIApp _sceneInterfaceOrientationFromWindow:v4];
        double v8 = __UIStatusBarManagerForWindow(v4);
        char v9 = [v8 isStatusBarHidden];

        if (v9)
        {
          BOOL v10 = 1;
        }
        else
        {
          uint64_t v20 = __UIStatusBarManagerForWindow(v4);
          [v20 defaultStatusBarHeightInOrientation:v7];
          double v22 = v21;

          BOOL v10 = v22 == 0.0;
        }
        [v4 _referenceFrameFromSceneUsingScreenBounds:v10];
        double v13 = v23;
        double v15 = v24;
        double v17 = v25;
        double v19 = v26;
      }
      else
      {
        double v11 = [v3 _screen];
        [v11 _applicationFrame];
        double v13 = v12;
        double v15 = v14;
        double v17 = v16;
        double v19 = v18;
      }
      objc_msgSend(v4, "convertRect:fromWindow:", 0, v13, v15, v17, v19);
      double v28 = v27;
      double v30 = v29;
      double v32 = v31;
      double v34 = v33;
      CGFloat v35 = [v3 superview];
      objc_msgSend(v35, "convertRect:fromView:", 0, v28, v30, v32, v34);
      double v37 = v36;

      [v3 frame];
      BOOL v6 = v37 == v38;
    }
    else
    {
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)layoutBackgroundViewConsideringTopBarStatusAndChangedHeight:(BOOL)a3
{
  double v5 = [(_UISearchBarVisualProviderBase *)self searchBar];
  if (v5)
  {
    *(_DWORD *)&self->_searchBarVisualProviderFlags &= ~0x10000u;
    id v23 = v5;
    [v5 bounds];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v14 = [v23 window];
    if (v14)
    {
      if (self->_barPosition == 3 || [(_UISearchBarVisualProviderLegacy *)self isAtTop])
      {
        double v15 = __UIStatusBarManagerForWindow(v14);
        [v15 statusBarHeight];
        double v17 = v16;

        double v9 = v9 - v17;
        double v13 = v13 + v17;
      }
    }
    else
    {
      *(_DWORD *)&self->_searchBarVisualProviderFlags |= 0x10000u;
    }
    [(UIView *)self->_searchBarBackground frame];
    if (a3
      || (v25.origin.double x = v7,
          v25.origin.double y = v9,
          v25.size.double width = v11,
          v25.size.double height = v13,
          !CGRectEqualToRect(*(CGRect *)&v18, v25)))
    {
      if ([(_UISearchBarVisualProviderLegacy *)self scopeBarIsVisible]
        && !-[_UISearchBarVisualProviderLegacy shouldCombineLandscapeBarsForOrientation:](self, "shouldCombineLandscapeBarsForOrientation:", [v23 _expectedInterfaceOrientation]))
      {
        [(_UISearchBarVisualProviderLegacy *)self scopeBarHeight];
        double v13 = v13 - v22;
      }
      -[UISearchBarBackground setFrame:](self->_searchBarBackground, "setFrame:", v7, v9, v11, v13);
    }

    double v5 = v23;
  }
}

- (void)updateBackgroundToBackdropStyle:(int64_t)a3
{
  double v5 = [(_UISearchBarVisualProviderBase *)self searchBar];
  double v6 = v5;
  if (v5)
  {
    if (a3)
    {
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __68___UISearchBarVisualProviderLegacy_updateBackgroundToBackdropStyle___block_invoke;
      v11[3] = &unk_1E52DA070;
      v11[4] = self;
      int64_t v13 = a3;
      id v12 = v5;
      +[UIView performWithoutAnimation:v11];
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __68___UISearchBarVisualProviderLegacy_updateBackgroundToBackdropStyle___block_invoke_2;
      v10[3] = &unk_1E52D9F70;
      v10[4] = self;
      +[UIView animateWithDuration:v10 animations:0.1];
    }
    else
    {
      if (!self->_backdropStyle && (*(_DWORD *)&self->_searchBarVisualProviderFlags & 0x38) == 0x10)
      {
        double v7 = [v5 _searchBarTextField];
        [v7 _setBottomEffectBackgroundVisible:0];
      }
      if (![(UIView *)self->_backdrop isHidden])
      {
        v8[4] = self;
        v9[0] = MEMORY[0x1E4F143A8];
        v9[1] = 3221225472;
        v9[2] = __68___UISearchBarVisualProviderLegacy_updateBackgroundToBackdropStyle___block_invoke_3;
        v9[3] = &unk_1E52D9F70;
        v9[4] = self;
        v8[0] = MEMORY[0x1E4F143A8];
        v8[1] = 3221225472;
        v8[2] = __68___UISearchBarVisualProviderLegacy_updateBackgroundToBackdropStyle___block_invoke_4;
        v8[3] = &unk_1E52DC3A0;
        +[UIView animateWithDuration:32 delay:v9 options:v8 animations:0.1 completion:0.15];
      }
    }
  }
}

- (void)setBackgroundLayoutNeedsUpdate
{
  *(_DWORD *)&self->_searchBarVisualProviderFlags |= 0x10000u;
}

- (id)navigationBarForShadow
{
  int v2 = [(_UISearchBarVisualProviderBase *)self searchBar];
  double v3 = v2;
  if (!v2)
  {
    id v6 = 0;
    goto LABEL_11;
  }
  id v4 = [v2 _viewControllerForAncestor];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v5 = [v4 navigationBar];
    if (!v5) {
      goto LABEL_9;
    }
  }
  else
  {
    double v7 = [v4 navigationController];
    double v5 = [v7 navigationBar];

    if (!v5) {
      goto LABEL_9;
    }
  }
  if (([v5 isHidden] & 1) == 0 && (objc_msgSend(v5, "containsView:", v3) & 1) == 0)
  {
    id v6 = v5;
    goto LABEL_10;
  }
LABEL_9:
  id v6 = 0;
LABEL_10:

LABEL_11:
  return v6;
}

- (BOOL)shouldDisplayShadow
{
  double v3 = [(_UISearchBarVisualProviderBase *)self searchBar];
  if (v3)
  {
    id v4 = [(_UISearchBarVisualProviderLegacy *)self navigationBarForShadow];
    double v5 = v4;
    if (!v4
      || ([v4 _hidesShadow] & 1) != 0
      || (id WeakRetained = objc_loadWeakRetained(&self->_searchDisplayController),
          char v7 = [WeakRetained isActive],
          WeakRetained,
          (v7 & 1) != 0))
    {
      BOOL v8 = 0;
    }
    else
    {
      id v10 = v3;
      do
      {
        double v11 = v10;
        id v10 = [v10 superview];

        BOOL v8 = v10 == 0;
        if (!v10) {
          break;
        }
        objc_opt_class();
      }
      while ((objc_opt_isKindOfClass() & 1) == 0);
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)makeShadowView
{
  double v3 = [(_UISearchBarVisualProviderBase *)self searchBar];
  id v4 = v3;
  if (v3)
  {
    [v3 bounds];
    CGFloat x = v19.origin.x;
    CGFloat y = v19.origin.y;
    CGFloat width = v19.size.width;
    CGFloat height = v19.size.height;
    double MinX = CGRectGetMinX(v19);
    v20.origin.CGFloat x = x;
    v20.origin.CGFloat y = y;
    v20.size.CGFloat width = width;
    v20.size.CGFloat height = height;
    double MaxY = CGRectGetMaxY(v20);
    v21.origin.CGFloat x = x;
    v21.origin.CGFloat y = y;
    v21.size.CGFloat width = width;
    v21.size.CGFloat height = height;
    double v11 = CGRectGetWidth(v21);
    id v12 = [v4 _screen];
    [v12 scale];
    double v14 = 1.0 / v13;

    double v15 = -[UIImageView initWithFrame:]([_UISearchBarShadowView alloc], "initWithFrame:", MinX, MaxY, v11, v14);
    double v16 = _UIBarHairlineShadowColorForBarStyle(*(_DWORD *)&self->_searchBarVisualProviderFlags & 7);
    [(UIImageView *)v15 setBackgroundColor:v16];

    [(UIView *)v15 setAutoresizingMask:10];
    [(UIView *)v15 setUserInteractionEnabled:0];
  }
  else
  {
    double v15 = objc_alloc_init(UIImageView);
  }

  return v15;
}

- (void)setShadowVisibleIfNecessary:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(_UISearchBarVisualProviderBase *)self searchBar];
  if (v5)
  {
    id v20 = v5;
    id v6 = [(_UISearchBarVisualProviderLegacy *)self navigationBarForShadow];
    [v6 _setDeferShadowToSearchBar:v3];
    BOOL v7 = [(_UISearchBarVisualProviderLegacy *)self shouldDisplayShadow];
    shadowView = self->_shadowView;
    if (v7 && v3)
    {
      if (!shadowView)
      {
        double v9 = [(_UISearchBarVisualProviderLegacy *)self makeShadowView];
        id v10 = self->_shadowView;
        self->_shadowView = v9;

        [v20 addSubview:self->_shadowView];
      }
      [v20 bounds];
      CGFloat x = v22.origin.x;
      CGFloat y = v22.origin.y;
      CGFloat width = v22.size.width;
      CGFloat height = v22.size.height;
      double v15 = self->_shadowView;
      double MinX = CGRectGetMinX(v22);
      v23.origin.CGFloat x = x;
      v23.origin.CGFloat y = y;
      v23.size.CGFloat width = width;
      v23.size.CGFloat height = height;
      double MaxY = CGRectGetMaxY(v23);
      v24.origin.CGFloat x = x;
      v24.origin.CGFloat y = y;
      v24.size.CGFloat width = width;
      v24.size.CGFloat height = height;
      double v18 = CGRectGetWidth(v24);
      [(UIView *)self->_shadowView bounds];
      -[UIImageView setFrame:](v15, "setFrame:", MinX, MaxY, v18, CGRectGetHeight(v25));
    }
    else
    {
      [(UIView *)shadowView removeFromSuperview];
      CGRect v19 = self->_shadowView;
      self->_shadowView = 0;
    }
    double v5 = v20;
  }
}

- (void)setSearchDisplayControllerShowsCancelButton:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(_UISearchBarVisualProviderBase *)self searchBar];
  if (v5)
  {
    $B0CEE0411BC9260FB4C6BC24420153D9 searchBarVisualProviderFlags = self->_searchBarVisualProviderFlags;
    if (((((*(_DWORD *)&searchBarVisualProviderFlags & 0x40000) == 0) ^ v3) & 1) == 0)
    {
      int v7 = v3 ? 0x40000 : 0;
      self->_$B0CEE0411BC9260FB4C6BC24420153D9 searchBarVisualProviderFlags = ($B0CEE0411BC9260FB4C6BC24420153D9)(*(_DWORD *)&searchBarVisualProviderFlags & 0xFFFBFFFF | v7);
      double v8 = v3 ? 0.0 : 1.0;
      double v9 = v3 ? 1.0 : 0.0;
      id v12 = v5;
      BOOL v10 = +[UIView areAnimationsEnabled];
      +[UIView setAnimationsEnabled:0];
      [(UIView *)self->_cancelButton setAlpha:v8];
      +[UIView setAnimationsEnabled:v10];
      [v12 setNeedsLayout];
      [v12 layoutBelowIfNeeded];
      [(UIView *)self->_cancelButton setAlpha:v9];
      BOOL v11 = [(_UISearchBarVisualProviderLegacy *)self isInBarButNotHosted];
      double v5 = v12;
      if (v11)
      {
        [(_UISearchBarVisualProviderLegacy *)self displayNavBarCancelButton:(*(_DWORD *)&self->_searchBarVisualProviderFlags >> 18) & 1 animated:1];
        double v5 = v12;
      }
    }
  }
}

- (void)allowCursorToAppear:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(_UISearchBarVisualProviderBase *)self searchBar];
  if (v5)
  {
    double v9 = v5;
    BOOL v6 = [(_UISearchBarVisualProviderLegacy *)self centerPlaceholder];
    double v5 = v9;
    if (v6)
    {
      int v7 = [v9 _searchBarTextField];
      double v8 = v7;
      if (v3)
      {
        [v7 _setPreventSelectionViewActivation:0];
        if ([v8 isFirstResponder])
        {
          objc_msgSend(v8, "__resumeBecomeFirstResponder");
          [v8 _activateSelectionView];
        }
      }
      else
      {
        [v7 _setPreventSelectionViewActivation:1];
      }

      double v5 = v9;
    }
  }
}

- (int64_t)barMetricsForOrientation:(int64_t)a3
{
  double v5 = [(_UISearchBarVisualProviderBase *)self searchBar];
  if (!v5)
  {
    int64_t v9 = 0;
    goto LABEL_21;
  }
  BOOL v6 = [(UILabel *)self->_promptLabel text];
  uint64_t v7 = [v6 length];

  if ((unint64_t)(a3 - 1) <= 1) {
    goto LABEL_18;
  }
  $B0CEE0411BC9260FB4C6BC24420153D9 searchBarVisualProviderFlags = self->_searchBarVisualProviderFlags;
  if ((*(_DWORD *)&searchBarVisualProviderFlags & 0x4000000) != 0)
  {
    a3 = [v5 _searchController];
    if (([(id)a3 isActive] & 1) == 0 && (*((unsigned char *)&self->_searchBarVisualProviderFlags + 3) & 1) == 0)
    {
LABEL_11:

      goto LABEL_18;
    }
  }
  else if ((*(_DWORD *)&searchBarVisualProviderFlags & 0x1000000) == 0)
  {
LABEL_18:
    if (v7) {
      int64_t v9 = 101;
    }
    else {
      int64_t v9 = 0;
    }
    goto LABEL_21;
  }
  BOOL v10 = [v5 traitCollection];
  if ([v10 userInterfaceIdiom] == 1)
  {

    if ((*(_DWORD *)&searchBarVisualProviderFlags & 0x4000000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_11;
  }
  BOOL v11 = [v5 traitCollection];
  uint64_t v12 = [v11 horizontalSizeClass];

  if ((*(_DWORD *)&searchBarVisualProviderFlags & 0x4000000) != 0) {
  if (v12 != 1)
  }
    goto LABEL_18;
  if (v7) {
    int64_t v9 = 102;
  }
  else {
    int64_t v9 = 1;
  }
LABEL_21:

  return v9;
}

- (BOOL)wantsDictationButton
{
  return 0;
}

- (void)setSearchDisplayController:(id)a3
{
  id obj = a3;
  id v4 = [(_UISearchBarVisualProviderBase *)self searchBar];
  if (v4)
  {
    objc_storeWeak(&self->_searchDisplayController, obj);
    if ([(_UISearchBarVisualProviderLegacy *)self centerPlaceholder])
    {
      double v5 = [v4 textInputTraits];
      [v5 setDeferBecomingResponder:obj == 0];
    }
  }
}

- (id)searchDisplayController
{
  id WeakRetained = objc_loadWeakRetained(&self->_searchDisplayController);
  return WeakRetained;
}

- (id)searchNavigationItem
{
  if (!self->_searchNavigationItem)
  {
    BOOL v3 = [(_UISearchBarVisualProviderBase *)self searchBar];

    if (v3)
    {
      id WeakRetained = objc_loadWeakRetained(&self->_searchDisplayController);
      uint64_t v5 = [WeakRetained navigationBarSearchFieldSizing];
      BOOL v6 = [_UISearchBarNavigationItem alloc];
      if (v5 == 3)
      {
        uint64_t v7 = &stru_1ED0E84C0;
      }
      else
      {
        _UINSLocalizedStringWithDefaultValue(@"Search", @"Search");
        uint64_t v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      double v8 = [(UINavigationItem *)v6 initWithTitle:v7];
      searchNavigationItem = self->_searchNavigationItem;
      self->_searchNavigationItem = v8;

      if (v5 != 3) {
      [(_UISearchBarVisualProviderLegacy *)self setUpSearchNavigationItemWithSizingOption:v5];
      }
    }
  }
  BOOL v10 = self->_searchNavigationItem;
  return v10;
}

- (void)setUpSearchNavigationItemWithSizingOption:(unint64_t)a3
{
  uint64_t v5 = [(_UISearchBarVisualProviderBase *)self searchBar];
  if (v5)
  {
    id v37 = v5;
    id WeakRetained = objc_loadWeakRetained(&self->_searchDisplayController);
    uint64_t v7 = self->_searchNavigationItem;
    double v8 = [v37 _searchBarTextField];
    int64_t v9 = v8;
    if (a3)
    {
      if (a3 > 2)
      {
        if (a3 == 3)
        {
          double v16 = [v37 window];
          double v17 = [UIView alloc];
          [(_UISearchBarVisualProviderLegacy *)self searchFieldHeight];
          UIRoundToViewScale(v16);
          CGRect v19 = -[UIView initWithFrame:](v17, "initWithFrame:", 0.0, 0.0, 36.0, v18);
          [(_UISearchBarVisualProviderLegacy *)self updateMagnifyingGlassView];
          id v20 = +[UIButton buttonWithType:1];
          UIRoundToViewScale(v16);
          double v22 = v21;
          [(_UISearchBarVisualProviderLegacy *)self searchFieldHeight];
          objc_msgSend(v20, "setFrame:", 0.0, v22, 36.0, v23);
          [v20 setAutoresizingMask:4];
          CGRect v24 = [v9 leftView];
          CGRect v25 = [v24 image];
          [v20 setImage:v25 forState:0];

          [v20 addTarget:WeakRetained action:sel__animateNavigationBarSearchBarAppearance_ forControlEvents:64];
          [v20 sizeToFit];
          [v9 bounds];
          objc_msgSend(v9, "leftViewRectForBounds:");
          double v27 = v26;
          [v20 _pathImageEdgeInsets];
          double v29 = v28 - v27;
          [v37 bounds];
          double Width = CGRectGetWidth(v42);
          [(_UISearchBarVisualProviderLegacy *)self searchFieldHeight];
          double v32 = v31;
          [v9 setAutoresizingMask:2];
          objc_msgSend(v9, "setFrame:", v29, 0.0, Width, v32);
          [v9 setHidden:1];
          [(UIView *)v19 addSubview:v9];
          [(UIView *)v19 addSubview:v20];
          double v33 = [[UIBarButtonItem alloc] initWithCustomView:v19];
          animatedAppearanceBarButtonItem = self->_animatedAppearanceBarButtonItem;
          self->_animatedAppearanceBarButtonItem = v33;

          [(UIBarButtonItem *)self->_animatedAppearanceBarButtonItem setWidth:36.0];
          [(UINavigationItem *)v7 setRightBarButtonItem:self->_animatedAppearanceBarButtonItem];

LABEL_17:
          [(UIView *)self->_searchBarBackground removeFromSuperview];
          searchBarBackground = self->_searchBarBackground;
          self->_searchBarBackground = 0;

          uint64_t v5 = v37;
          goto LABEL_18;
        }
LABEL_14:
        [(UINavigationItem *)v7 setTitleView:v9];
        if ((*((unsigned char *)&self->_searchBarVisualProviderFlags + 2) & 4) != 0) {
          [(_UISearchBarVisualProviderLegacy *)self displayNavBarCancelButton:1 animated:0];
        }
        double v16 = [(_UISearchBarVisualProviderLegacy *)self prompt];
        [(UINavigationItem *)v7 setPrompt:v16];
        goto LABEL_17;
      }
      [v8 frame];
      if (CGRectGetWidth(v39) >= 1.0)
      {
        [v9 frame];
        if (CGRectGetHeight(v40) >= 1.0) {
          goto LABEL_14;
        }
      }
      if (WeakRetained)
      {
        BOOL v10 = [WeakRetained searchContentsController];
        BOOL v11 = [v10 navigationController];
        uint64_t v12 = [v11 navigationBar];
        [v12 frame];
        double v13 = CGRectGetWidth(v41) * 0.5;
      }
      else
      {
        double v13 = 100.0;
      }
      [(_UISearchBarVisualProviderLegacy *)self searchFieldHeight];
      double v15 = v35;
    }
    else
    {
      [(_UISearchBarVisualProviderLegacy *)self searchFieldHeight];
      double v15 = v14;
      double v13 = 14433663.0;
    }
    objc_msgSend(v9, "setFrame:", 0.0, 0.0, v13, v15);
    goto LABEL_14;
  }
LABEL_18:
}

- (void)prepareFromAbandonedVisualProvider:(id)a3
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(_UISearchBarVisualProviderLegacy *)self prepare];
  if (v4)
  {
    uint64_t v5 = [v4 barTintColor];
    [(_UISearchBarVisualProviderLegacy *)self _setBarTintColor:v5];

    -[_UISearchBarVisualProviderLegacy _setBarStyle:](self, "_setBarStyle:", [v4 barStyle]);
    -[_UISearchBarVisualProviderLegacy _setShowsScopeBar:](self, "_setShowsScopeBar:", [v4 showsScopeBar]);
    -[_UISearchBarVisualProviderLegacy _setAutoDisableCancelButton:](self, "_setAutoDisableCancelButton:", [v4 autoDisableCancelButton]);
    -[_UISearchBarVisualProviderLegacy _setShowsCancelButton:](self, "_setShowsCancelButton:", [v4 showsCancelButton]);
    -[_UISearchBarVisualProviderLegacy _setShowsBookmarkButton:](self, "_setShowsBookmarkButton:", [v4 showsBookmarkButton]);
    -[_UISearchBarVisualProviderLegacy _setShowsSearchResultsButton:](self, "_setShowsSearchResultsButton:", [v4 showsSearchResultsButton]);
    -[_UISearchBarVisualProviderLegacy _setSearchResultsButtonSelected:](self, "_setSearchResultsButtonSelected:", [v4 isSearchResultsButtonSelected]);
    -[_UISearchBarVisualProviderLegacy setAllowsInlineScopeBar:](self, "setAllowsInlineScopeBar:", [v4 allowsInlineScopeBar]);
    -[_UISearchBarVisualProviderLegacy _setBarTranslucence:](self, "_setBarTranslucence:", [v4 barTranslucence]);
    -[_UISearchBarVisualProviderLegacy _setHideBackground:](self, "_setHideBackground:", [v4 drawsBackground] ^ 1);
    BOOL v6 = [v4 searchBar];
    [(_UISearchBarVisualProviderBase *)self setSearchBar:v6];

    uint64_t v7 = [v4 searchFieldIfExists];
    searchField = self->_searchField;
    self->_searchField = v7;

    [(UIView *)self->_searchBarBackground removeFromSuperview];
    int64_t v9 = [v4 searchBarBackground];
    searchBarBackground = self->_searchBarBackground;
    self->_searchBarBackground = v9;

    BOOL v11 = [v4 backdrop];
    backdrop = self->_backdrop;
    self->_backdrop = v11;

    double v13 = [v4 backdropVisualEffectView];
    backdropVisualEffectView = self->_backdropVisualEffectView;
    self->_backdropVisualEffectView = v13;

    double v15 = [v4 searchBarClippingView];
    searchBarClippingView = self->_searchBarClippingView;
    self->_searchBarClippingView = v15;

    double v17 = [v4 cancelButton];
    cancelButton = self->_cancelButton;
    self->_cancelButton = v17;

    CGRect v19 = [v4 cancelBarButtonItemIfExists];
    cancelBarButtonItem = self->_cancelBarButtonItem;
    self->_cancelBarButtonItem = v19;

    double v21 = [v4 cancelButtonText];
    cancelButtonText = self->_cancelButtonText;
    self->_cancelButtonText = v21;

    double v23 = [v4 leftButtonIfExists];
    leftButton = self->_leftButton;
    self->_leftButton = v23;

    CGRect v25 = [v4 promptLabel];
    promptLabel = self->_promptLabel;
    self->_promptLabel = v25;

    double v27 = [v4 separator];
    separator = self->_separator;
    self->_separator = v27;

    double v29 = [v4 scopeBar];
    scopeBar = self->_scopeBar;
    self->_scopeBar = v29;

    double v31 = [v4 scopeBarContainerView];
    double v32 = [UIView alloc];
    [v31 frame];
    double v33 = -[UIView initWithFrame:](v32, "initWithFrame:");
    scopeBarContainerView = self->_scopeBarContainerView;
    self->_scopeBarContainerView = v33;

    double v35 = [v31 superview];
    [v35 addSubview:self->_scopeBarContainerView];

    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    double v36 = objc_msgSend(v31, "subviews", 0);
    uint64_t v37 = [v36 countByEnumeratingWithState:&v59 objects:v63 count:16];
    if (v37)
    {
      uint64_t v38 = v37;
      uint64_t v39 = *(void *)v60;
      do
      {
        for (uint64_t i = 0; i != v38; ++i)
        {
          if (*(void *)v60 != v39) {
            objc_enumerationMutation(v36);
          }
          [(UIView *)self->_scopeBarContainerView addSubview:*(void *)(*((void *)&v59 + 1) + 8 * i)];
        }
        uint64_t v38 = [v36 countByEnumeratingWithState:&v59 objects:v63 count:16];
      }
      while (v38);
    }

    [v31 removeFromSuperview];
    CGRect v41 = [v4 scopeBarBackgroundView];
    scopeBarBackgroundView = self->_scopeBarBackgroundView;
    self->_scopeBarBackgroundView = v41;

    double v43 = [v4 scopeTitles];
    scopeTitles = self->_scopeTitles;
    self->_scopeTitles = v43;

    self->_unint64_t selectedScope = [v4 selectedScope];
    self->_int64_t backdropStyle = [v4 backdropStyle];
    self->_int64_t barPosition = [v4 barPosition];
    self->_unint64_t scopeBarPosition = [v4 scopeBarPosition];
    [v4 effectiveContentInset];
    self->_effectiveContentInset.double top = v45;
    self->_effectiveContentInset.double left = v46;
    self->_effectiveContentInset.double bottom = v47;
    self->_effectiveContentInset.double right = v48;
    [v4 minimumContentInset];
    self->_minimumContentInsetPrivate.double top = v49;
    self->_minimumContentInsetPrivate.double left = v50;
    self->_minimumContentInsetPrivate.double bottom = v51;
    self->_minimumContentInsetPrivate.double right = v52;
    [v4 tableViewIndexWidth];
    self->_double tableViewIndexWidth = v53;
    self->_navBarTitleViewLocation = [v4 navBarTitleViewLocation];
    double v54 = [v4 navBarTitleViewOverlayRects];
    navBarTitleViewOverlayRects = self->_navBarTitleViewOverlayRects;
    self->_navBarTitleViewOverlayRects = v54;

    double v56 = [v4 navBarTitleViewDataSource];
    objc_storeWeak((id *)&self->_navBarTitleViewDataSource, v56);

    double v57 = [v4 animatedAppearanceBarButtonItem];
    animatedAppearanceBarButtonItem = self->_animatedAppearanceBarButtonItem;
    self->_animatedAppearanceBarButtonItem = v57;

    [v4 revertViewHierarchyIfNecessary];
  }
  [(_UISearchBarVisualProviderLegacy *)self updateSearchBarOpacity];
}

- (void)setSearchField:(id)a3
{
}

- (id)searchBarBackground
{
  return self->_searchBarBackground;
}

- (void)setSearchBarBackground:(id)a3
{
}

- (id)backdrop
{
  return self->_backdrop;
}

- (void)setBackdrop:(id)a3
{
}

- (id)backdropVisualEffectView
{
  return self->_backdropVisualEffectView;
}

- (void)setBackdropVisualEffectView:(id)a3
{
}

- (id)searchBarClippingView
{
  return self->_searchBarClippingView;
}

- (id)cancelButton
{
  return self->_cancelButton;
}

- (id)cancelButtonText
{
  return self->_cancelButtonText;
}

- (void)setCancelButtonText:(id)a3
{
}

- (id)promptLabel
{
  return self->_promptLabel;
}

- (void)setPromptLabel:(id)a3
{
}

- (id)separator
{
  return self->_separator;
}

- (void)setSeparator:(id)a3
{
}

- (id)scopeBar
{
  return self->_scopeBar;
}

- (void)setScopeBar:(id)a3
{
}

- (id)scopeBarContainerView
{
  return self->_scopeBarContainerView;
}

- (id)scopeBarBackgroundView
{
  return self->_scopeBarBackgroundView;
}

- (void)setScopeBarBackgroundView:(id)a3
{
}

- (id)scopeTitles
{
  return self->_scopeTitles;
}

- (int64_t)selectedScope
{
  return self->_selectedScope;
}

- (void)setSelectedScope:(int64_t)a3
{
  self->_unint64_t selectedScope = a3;
}

- (int64_t)backdropStyle
{
  return self->_backdropStyle;
}

- (id)barTintColor
{
  return self->_barTintColor;
}

- (void)setBarTintColor:(id)a3
{
}

- (unint64_t)scopeBarPosition
{
  return self->_scopeBarPosition;
}

- (void)setScopeBarPosition:(unint64_t)a3
{
  self->_unint64_t scopeBarPosition = a3;
}

- (UIEdgeInsets)effectiveContentInset
{
  double top = self->_effectiveContentInset.top;
  double left = self->_effectiveContentInset.left;
  double bottom = self->_effectiveContentInset.bottom;
  double right = self->_effectiveContentInset.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (UIEdgeInsets)minimumContentInset
{
  double top = self->_minimumContentInsetPrivate.top;
  double left = self->_minimumContentInsetPrivate.left;
  double bottom = self->_minimumContentInsetPrivate.bottom;
  double right = self->_minimumContentInsetPrivate.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (double)tableViewIndexWidth
{
  return self->_tableViewIndexWidth;
}

- (void)setTableViewIndexWidth:(double)a3
{
  self->_double tableViewIndexWidth = a3;
}

- (int64_t)navBarTitleViewLocation
{
  return self->_navBarTitleViewLocation;
}

- (void)setNavBarTitleViewLocation:(int64_t)a3
{
  self->_navBarTitleViewLocation = a3;
}

- (id)navBarTitleViewOverlayRects
{
  return self->_navBarTitleViewOverlayRects;
}

- (void)setNavBarTitleViewOverlayRects:(id)a3
{
}

- (id)navBarTitleViewDataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navBarTitleViewDataSource);
  return WeakRetained;
}

- (void)setNavBarTitleViewDataSource:(id)a3
{
}

- (id)animatedAppearanceBarButtonItem
{
  return self->_animatedAppearanceBarButtonItem;
}

- (id)shadowView
{
  return self->_shadowView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shadowView, 0);
  objc_destroyWeak((id *)&self->_navBarTitleViewDataSource);
  objc_storeStrong((id *)&self->_navBarTitleViewOverlayRects, 0);
  objc_storeStrong((id *)&self->_barTintColor, 0);
  objc_storeStrong((id *)&self->_scopeTitles, 0);
  objc_storeStrong((id *)&self->_scopeBarBackgroundView, 0);
  objc_storeStrong((id *)&self->_scopeBarContainerView, 0);
  objc_storeStrong((id *)&self->_scopeBar, 0);
  objc_storeStrong((id *)&self->_separator, 0);
  objc_storeStrong((id *)&self->_promptLabel, 0);
  objc_storeStrong((id *)&self->_leftButton, 0);
  objc_storeStrong((id *)&self->_cancelButtonText, 0);
  objc_storeStrong((id *)&self->_cancelBarButtonItem, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_searchBarClippingView, 0);
  objc_storeStrong((id *)&self->_backdropVisualEffectView, 0);
  objc_storeStrong((id *)&self->_backdrop, 0);
  objc_storeStrong((id *)&self->_searchBarBackground, 0);
  objc_storeStrong((id *)&self->_searchField, 0);
  objc_destroyWeak(&self->_searchDisplayController);
  objc_storeStrong((id *)&self->_searchNavigationItem, 0);
  objc_storeStrong((id *)&self->_animatedAppearanceBarButtonItem, 0);
  objc_storeStrong((id *)&self->_appearanceStorage, 0);
}

@end