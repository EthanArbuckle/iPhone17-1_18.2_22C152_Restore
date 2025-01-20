@interface _UISearchBarLayout
- ($F24F406B2B787EFB06265DBA3D28CBD5)heightRange;
- (BOOL)allowSearchFieldShrinkage;
- (BOOL)hasCancelButton;
- (BOOL)hasDeleteButton;
- (BOOL)hasFloatingSearchIconBackgroundView;
- (BOOL)hasLeftButton;
- (BOOL)hasPromptLabel;
- (BOOL)hasScopeBar;
- (BOOL)hasSearchBarBackdrop;
- (BOOL)hasSearchBarBackground;
- (BOOL)hasSeparator;
- (BOOL)isHostedInlineByNavigationBar;
- (BOOL)isHostingNavBarTransitionActive;
- (BOOL)isProspective;
- (BOOL)isTextFieldManagedInNSToolbar;
- (BOOL)searchFieldEffectivelySupportsDynamicType;
- (BOOL)searchFieldUsesCustomBackgroundImage;
- (CGRect)promptContainerLayoutFrame;
- (CGRect)scopeBarContainerLayoutFrame;
- (CGRect)searchBarBackgroundLayoutFrame;
- (CGRect)searchFieldContainerLayoutFrame;
- (CGRect)separatorLayoutFrame;
- (NSString)description;
- (UIBarButtonItem)searchIconBarButtonItem;
- (UIEdgeInsets)defaultScopeBarInsets;
- (UIEdgeInsets)scopeContainerSpecificInsets;
- (UIFont)searchFieldFont;
- (UIImageView)floatingSearchIconView;
- (UIOffset)searchFieldBackgroundPositionAdjustment;
- (UISearchBarTextField)searchField;
- (UIView)cancelButton;
- (UIView)deleteButton;
- (UIView)floatingSearchIconBackgroundView;
- (UIView)leftButton;
- (UIView)scopeBar;
- (UIView)searchBarBackdrop;
- (UIView)searchBarBackground;
- (UIView)separator;
- (_UISearchBarPromptContainerView)promptContainer;
- (_UISearchBarScopeContainerLayout)scopeContainerLayout;
- (_UISearchBarScopeContainerView)scopeBarContainer;
- (_UISearchBarSearchContainerLayout)searchContainerLayout;
- (_UISearchBarSearchContainerView)searchFieldContainer;
- (double)additionalPaddingForCancelButtonAtLeadingEdge;
- (double)additionalPaddingForSearchFieldAtLeadingEdge;
- (double)backgroundExtension;
- (double)defaultActiveWidth;
- (double)defaultInactiveWidth;
- (double)layout:(id)a3 fontScaledValueForValue:(double)a4;
- (double)leftContentInsetForInlineSearch;
- (double)minimumLayoutWidth;
- (double)naturalPromptContainerHeight;
- (double)naturalScopeContainerHeight;
- (double)naturalSearchFieldContainerHeight;
- (double)naturalSearchFieldHeight;
- (double)naturalTotalHeight;
- (double)overrideActiveWidth;
- (double)overrideInactiveWidth;
- (double)prescribedSearchContainerWidth;
- (double)rightContentInsetForInlineSearch;
- (double)searchBarReadableWidth;
- (id)copyWithZone:(_NSZone *)a3;
- (id)hostedScopeBarHeightForBarMetrics;
- (id)hostedScopeBarTopInsetForBarMetrics;
- (int64_t)representedLayoutState;
- (unint64_t)numberOfScopeTitles;
- (void)applyLayout;
- (void)applyScopeContainerSublayout;
- (void)cleanUpLayout;
- (void)containerLayoutWillUpdateLayout:(id)a3;
- (void)ensureCorrectContainerViewOrdering;
- (void)prepareBaseConfigurationForSublayout:(id)a3;
- (void)prepareScopeContainerLayout;
- (void)prepareSearchContainerLayout;
- (void)prepareSublayouts;
- (void)setAdditionalPaddingForCancelButtonAtLeadingEdge:(double)a3;
- (void)setAdditionalPaddingForSearchFieldAtLeadingEdge:(double)a3;
- (void)setAllowSearchFieldShrinkage:(BOOL)a3;
- (void)setBackgroundExtension:(double)a3;
- (void)setCancelButton:(id)a3;
- (void)setDefaultActiveWidth:(double)a3;
- (void)setDefaultInactiveWidth:(double)a3;
- (void)setDefaultScopeBarInsets:(UIEdgeInsets)a3;
- (void)setDelegateSearchFieldFrameManipulationBlock:(id)a3;
- (void)setDeleteButton:(id)a3;
- (void)setFloatingSearchIconBackgroundView:(id)a3;
- (void)setFloatingSearchIconView:(id)a3;
- (void)setHasCancelButton:(BOOL)a3;
- (void)setHasDeleteButton:(BOOL)a3;
- (void)setHasFloatingSearchIconBackgroundView:(BOOL)a3;
- (void)setHasLeftButton:(BOOL)a3;
- (void)setHasPromptLabel:(BOOL)a3;
- (void)setHasScopeBar:(BOOL)a3;
- (void)setHasSearchBarBackdrop:(BOOL)a3;
- (void)setHasSearchBarBackground:(BOOL)a3;
- (void)setHasSeparator:(BOOL)a3;
- (void)setHostedInlineByNavigationBar:(BOOL)a3;
- (void)setHostedScopeBarHeightForBarMetrics:(id)a3;
- (void)setHostedScopeBarTopInsetForBarMetrics:(id)a3;
- (void)setHostingNavBarTransitionActive:(BOOL)a3;
- (void)setLayoutCustomizationDelegateSearchFieldContainerWillLayoutSubviewsCallback:(id)a3;
- (void)setLeftButton:(id)a3;
- (void)setLeftContentInsetForInlineSearch:(double)a3;
- (void)setNumberOfScopeTitles:(unint64_t)a3;
- (void)setOverrideActiveWidth:(double)a3;
- (void)setOverrideInactiveWidth:(double)a3;
- (void)setPromptContainer:(id)a3;
- (void)setProspective:(BOOL)a3;
- (void)setRepresentedLayoutState:(int64_t)a3;
- (void)setRightContentInsetForInlineSearch:(double)a3;
- (void)setScopeBar:(id)a3;
- (void)setScopeBarContainer:(id)a3;
- (void)setScopeContainerLayout:(id)a3;
- (void)setSearchBarBackdrop:(id)a3;
- (void)setSearchBarBackground:(id)a3;
- (void)setSearchBarReadableWidth:(double)a3;
- (void)setSearchContainerLayout:(id)a3;
- (void)setSearchField:(id)a3;
- (void)setSearchFieldBackgroundPositionAdjustment:(UIOffset)a3;
- (void)setSearchFieldContainer:(id)a3;
- (void)setSearchFieldEffectivelySupportsDynamicType:(BOOL)a3;
- (void)setSearchFieldFont:(id)a3;
- (void)setSearchFieldUsesCustomBackgroundImage:(BOOL)a3;
- (void)setSearchIconBarButtonItem:(id)a3;
- (void)setSeparator:(id)a3;
- (void)setTextFieldManagedInNSToolbar:(BOOL)a3;
- (void)setUpScopeContainerLayout;
- (void)setUpSearchContainerLayout;
- (void)updateLayout;
@end

@implementation _UISearchBarLayout

- (void)prepareScopeContainerLayout
{
  [(_UISearchBarLayout *)self setUpScopeContainerLayout];
  [(_UISearchBarLayout *)self prepareBaseConfigurationForSublayout:self->_scopeContainerLayout];
  [(_UISearchBarLayoutBase *)self contentInset];
  -[_UISearchBarLayoutBase setContentInset:](self->_scopeContainerLayout, "setContentInset:", 0.0, v3 + 0.0, 0.0, v4 + 0.0);
  [(_UISearchBarScopeContainerLayout *)self->_scopeContainerLayout setHasScopeBar:(*(_WORD *)&self->_searchBarLayoutFlags >> 4) & 1];
  [(_UISearchBarScopeContainerLayout *)self->_scopeContainerLayout setNumberOfScopeTitles:self->_numberOfScopeTitles];
  -[_UISearchBarScopeContainerLayout setDefaultScopeBarInsets:](self->_scopeContainerLayout, "setDefaultScopeBarInsets:", self->_defaultScopeBarInsets.top, self->_defaultScopeBarInsets.left, self->_defaultScopeBarInsets.bottom, self->_defaultScopeBarInsets.right);
  [(_UISearchBarScopeContainerLayout *)self->_scopeContainerLayout setHostedScopeBarHeightForBarMetrics:self->_hostedScopeBarHeightForBarMetrics];
  [(_UISearchBarScopeContainerLayout *)self->_scopeContainerLayout setHostedScopeBarTopInsetForBarMetrics:self->_hostedScopeBarTopInsetForBarMetrics];
  if ((*(_WORD *)&self->_searchBarLayoutFlags & 0x200) != 0)
  {
    scopeContainerLayout = self->_scopeContainerLayout;
    [(_UISearchBarScopeContainerLayout *)scopeContainerLayout setNeighboringSearchLayout:0];
  }
  else
  {
    [(_UISearchBarScopeContainerLayout *)self->_scopeContainerLayout setNeighboringSearchLayout:self->_searchContainerLayout];
    double width = self->_scopeBarContainerLayoutFrame.size.width;
    double height = self->_scopeBarContainerLayoutFrame.size.height;
    v7 = self->_scopeContainerLayout;
    -[_UISearchBarLayoutBase setLayoutSize:](v7, "setLayoutSize:", width, height);
  }
}

- (void)prepareSearchContainerLayout
{
  [(_UISearchBarLayout *)self setUpSearchContainerLayout];
  [(_UISearchBarLayout *)self prepareBaseConfigurationForSublayout:self->_searchContainerLayout];
  [(_UISearchBarLayoutBase *)self contentInset];
  -[_UISearchBarLayoutBase setContentInset:](self->_searchContainerLayout, "setContentInset:");
  [(_UISearchBarSearchContainerLayout *)self->_searchContainerLayout setSearchBarReadableWidth:self->_searchBarReadableWidth];
  if ([(_UISearchBarLayout *)self representedLayoutState] != 3
    || (*(_WORD *)&self->_searchBarLayoutFlags & 0x200) != 0)
  {
    uint64_t v3 = 0;
  }
  else
  {
    if (_forceReadableWidthBehaviorPreference_onceToken != -1) {
      dispatch_once(&_forceReadableWidthBehaviorPreference_onceToken, &__block_literal_global_70);
    }
    if (_forceReadableWidthBehaviorPreference_pref < 0) {
      uint64_t v3 = (*(_WORD *)&self->_searchBarLayoutFlags >> 4) & 1;
    }
    else {
      uint64_t v3 = _forceReadableWidthBehaviorPreference_pref != 0;
    }
  }
  [(_UISearchBarSearchContainerLayout *)self->_searchContainerLayout setSearchFieldRespectsReadableWidth:v3];
  [(_UISearchBarSearchContainerLayout *)self->_searchContainerLayout setHostedInlineByNavigationBar:(*(_WORD *)&self->_searchBarLayoutFlags >> 9) & 1];
  [(_UISearchBarSearchContainerLayout *)self->_searchContainerLayout setTextFieldManagedInNSToolbar:(*(_WORD *)&self->_searchBarLayoutFlags >> 10) & 1];
  [(_UISearchBarSearchContainerLayout *)self->_searchContainerLayout setHasCancelButton:*(_WORD *)&self->_searchBarLayoutFlags & 1];
  [(_UISearchBarSearchContainerLayout *)self->_searchContainerLayout setHasDeleteButton:(*(_WORD *)&self->_searchBarLayoutFlags >> 1) & 1];
  [(_UISearchBarSearchContainerLayout *)self->_searchContainerLayout setDrawsSearchIconOnly:[(_UISearchBarLayout *)self representedLayoutState] == 1];
  [(_UISearchBarSearchContainerLayout *)self->_searchContainerLayout setHasLeftButton:(*(_WORD *)&self->_searchBarLayoutFlags >> 2) & 1];
  [(_UISearchBarSearchContainerLayout *)self->_searchContainerLayout setHasFloatingSearchIconBackgroundView:(*(_WORD *)&self->_searchBarLayoutFlags >> 3) & 1];
  [(_UISearchBarSearchContainerLayout *)self->_searchContainerLayout setAllowSearchFieldShrinkage:(*(_WORD *)&self->_searchBarLayoutFlags >> 11) & 1];
  [(_UISearchBarSearchContainerLayout *)self->_searchContainerLayout setSearchFieldUsesCustomBackgroundImage:(*(_WORD *)&self->_searchBarLayoutFlags >> 12) & 1];
  [(_UISearchBarSearchContainerLayout *)self->_searchContainerLayout setSearchFieldEffectivelySupportsDynamicType:(*(_WORD *)&self->_searchBarLayoutFlags >> 13) & 1];
  -[_UISearchBarSearchContainerLayout setSearchFieldBackgroundPositionAdjustment:](self->_searchContainerLayout, "setSearchFieldBackgroundPositionAdjustment:", self->_searchFieldBackgroundPositionAdjustment.horizontal, self->_searchFieldBackgroundPositionAdjustment.vertical);
  -[_UISearchBarLayoutBase setLayoutSize:](self->_searchContainerLayout, "setLayoutSize:", self->_searchFieldContainerLayoutFrame.size.width, self->_searchFieldContainerLayoutFrame.size.height);
  [(_UISearchBarSearchContainerLayout *)self->_searchContainerLayout setRepresentedLayoutState:self->_representedLayoutState];
  double v4 = [(_UISearchBarLayout *)self searchField];

  if (v4)
  {
    id v9 = [(_UISearchBarLayout *)self searchField];
    objc_msgSend(v9, "_defaultHeightForBarMetrics:", -[_UISearchBarLayoutBase barMetrics](self, "barMetrics"));
    -[_UISearchBarSearchContainerLayout setSearchBarFieldHeight:](self->_searchContainerLayout, "setSearchBarFieldHeight:");
  }
  else
  {
    v5 = +[UITraitCollection _fallbackTraitCollection]();
    v6 = +[_UIVisualStyleRegistry registryForIdiom:](_UIVisualStyleRegistry, "registryForIdiom:", [v5 userInterfaceIdiom]);
    v7 = (void *)[v6 visualStyleClassForStylableClass:objc_opt_class()];
    if (!v7) {
      v7 = objc_opt_class();
    }

    objc_msgSend(v7, "defaultHeightForBarMetrics:", -[_UISearchBarLayoutBase barMetrics](self, "barMetrics"));
    searchContainerLayout = self->_searchContainerLayout;
    -[_UISearchBarSearchContainerLayout setSearchBarFieldHeight:](searchContainerLayout, "setSearchBarFieldHeight:");
  }
}

- (UISearchBarTextField)searchField
{
  return [(_UISearchBarSearchContainerLayout *)self->_searchContainerLayout searchField];
}

- (int64_t)representedLayoutState
{
  return self->_representedLayoutState;
}

- (void)prepareBaseConfigurationForSublayout:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "setBarMetrics:", -[_UISearchBarLayoutBase barMetrics](self, "barMetrics"));
  objc_msgSend(v4, "setLayoutRTL:", -[_UISearchBarLayoutBase isLayoutRTL](self, "isLayoutRTL"));
  objc_msgSend(v4, "setHostedByNavigationBar:", -[_UISearchBarLayoutBase isHostedByNavigationBar](self, "isHostedByNavigationBar"));
}

- (void)setHasSearchBarBackground:(BOOL)a3
{
  __int16 searchBarLayoutFlags = (__int16)self->_searchBarLayoutFlags;
  if (((((searchBarLayoutFlags & 0x40) == 0) ^ a3) & 1) == 0)
  {
    if (a3) {
      __int16 v4 = 64;
    }
    else {
      __int16 v4 = 0;
    }
    *(_WORD *)&self->___int16 searchBarLayoutFlags = searchBarLayoutFlags & 0xFFBF | v4;
    [(_UISearchBarLayoutBase *)self invalidateLayout];
  }
}

- (void)setTextFieldManagedInNSToolbar:(BOOL)a3
{
  __int16 searchBarLayoutFlags = (__int16)self->_searchBarLayoutFlags;
  if (((((searchBarLayoutFlags & 0x400) == 0) ^ a3) & 1) == 0)
  {
    if (a3) {
      __int16 v4 = 1024;
    }
    else {
      __int16 v4 = 0;
    }
    *(_WORD *)&self->___int16 searchBarLayoutFlags = searchBarLayoutFlags & 0xFBFF | v4;
    [(_UISearchBarLayoutBase *)self invalidateLayout];
  }
}

- (void)setSeparator:(id)a3
{
}

- (void)setSearchIconBarButtonItem:(id)a3
{
  id v4 = a3;
  [(_UISearchBarLayout *)self setUpSearchContainerLayout];
  [(_UISearchBarSearchContainerLayout *)self->_searchContainerLayout setSearchIconBarButtonItem:v4];
}

- (void)setSearchFieldUsesCustomBackgroundImage:(BOOL)a3
{
  __int16 searchBarLayoutFlags = (__int16)self->_searchBarLayoutFlags;
  if (((((searchBarLayoutFlags & 0x1000) == 0) ^ a3) & 1) == 0)
  {
    if (a3) {
      __int16 v4 = 4096;
    }
    else {
      __int16 v4 = 0;
    }
    *(_WORD *)&self->___int16 searchBarLayoutFlags = searchBarLayoutFlags & 0xEFFF | v4;
    [(_UISearchBarLayoutBase *)self invalidateLayout];
  }
}

- (void)setSearchFieldFont:(id)a3
{
  v5 = (UIFont *)a3;
  if (self->_searchFieldFont != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_searchFieldFont, a3);
    v5 = v6;
    self->_cachedFontValueBeforeScaling = 0.0;
    self->_cachedFontValueAfterScaling = 0.0;
  }
}

- (void)setSearchFieldEffectivelySupportsDynamicType:(BOOL)a3
{
  __int16 searchBarLayoutFlags = (__int16)self->_searchBarLayoutFlags;
  if (((((searchBarLayoutFlags & 0x2000) == 0) ^ a3) & 1) == 0)
  {
    if (a3) {
      __int16 v4 = 0x2000;
    }
    else {
      __int16 v4 = 0;
    }
    *(_WORD *)&self->___int16 searchBarLayoutFlags = searchBarLayoutFlags & 0xDFFF | v4;
    [(_UISearchBarLayoutBase *)self invalidateLayout];
  }
}

- (void)setSearchFieldContainer:(id)a3
{
}

- (void)setSearchField:(id)a3
{
  id v4 = a3;
  [(_UISearchBarLayout *)self setUpSearchContainerLayout];
  [(_UISearchBarSearchContainerLayout *)self->_searchContainerLayout setSearchField:v4];
}

- (void)setSearchBarReadableWidth:(double)a3
{
  self->_searchBarReadableWidth = a3;
}

- (void)setSearchBarBackground:(id)a3
{
}

- (void)setSearchBarBackdrop:(id)a3
{
}

- (void)setScopeBarContainer:(id)a3
{
}

- (void)setScopeBar:(id)a3
{
  id v4 = a3;
  [(_UISearchBarLayout *)self setUpScopeContainerLayout];
  [(_UISearchBarScopeContainerLayout *)self->_scopeContainerLayout setScopeBar:v4];
}

- (void)setRepresentedLayoutState:(int64_t)a3
{
  self->_representedLayoutState = a3;
}

- (void)setPromptContainer:(id)a3
{
}

- (void)setOverrideInactiveWidth:(double)a3
{
}

- (void)setOverrideActiveWidth:(double)a3
{
}

- (void)setNumberOfScopeTitles:(unint64_t)a3
{
  self->_numberOfScopeTitles = a3;
}

- (void)setLeftButton:(id)a3
{
  id v4 = a3;
  [(_UISearchBarLayout *)self setUpSearchContainerLayout];
  [(_UISearchBarSearchContainerLayout *)self->_searchContainerLayout setLeftButton:v4];
}

- (void)setHostedScopeBarTopInsetForBarMetrics:(id)a3
{
}

- (void)setHostedScopeBarHeightForBarMetrics:(id)a3
{
}

- (void)setHostedInlineByNavigationBar:(BOOL)a3
{
  __int16 searchBarLayoutFlags = (__int16)self->_searchBarLayoutFlags;
  if (((((searchBarLayoutFlags & 0x200) == 0) ^ a3) & 1) == 0)
  {
    if (a3) {
      __int16 v4 = 512;
    }
    else {
      __int16 v4 = 0;
    }
    *(_WORD *)&self->___int16 searchBarLayoutFlags = searchBarLayoutFlags & 0xFDFF | v4;
    [(_UISearchBarLayoutBase *)self invalidateLayout];
  }
}

- (void)setHasSeparator:(BOOL)a3
{
  __int16 searchBarLayoutFlags = (__int16)self->_searchBarLayoutFlags;
  if (((((searchBarLayoutFlags & 0x100) == 0) ^ a3) & 1) == 0)
  {
    if (a3) {
      __int16 v4 = 256;
    }
    else {
      __int16 v4 = 0;
    }
    *(_WORD *)&self->___int16 searchBarLayoutFlags = searchBarLayoutFlags & 0xFEFF | v4;
    [(_UISearchBarLayoutBase *)self invalidateLayout];
  }
}

- (void)setHasSearchBarBackdrop:(BOOL)a3
{
  __int16 searchBarLayoutFlags = (__int16)self->_searchBarLayoutFlags;
  if (((((searchBarLayoutFlags & 0x80) == 0) ^ a3) & 1) == 0)
  {
    if (a3) {
      __int16 v4 = 128;
    }
    else {
      __int16 v4 = 0;
    }
    *(_WORD *)&self->___int16 searchBarLayoutFlags = searchBarLayoutFlags & 0xFF7F | v4;
    [(_UISearchBarLayoutBase *)self invalidateLayout];
  }
}

- (void)setHasScopeBar:(BOOL)a3
{
  __int16 searchBarLayoutFlags = (__int16)self->_searchBarLayoutFlags;
  if (((((searchBarLayoutFlags & 0x10) == 0) ^ a3) & 1) == 0)
  {
    if (a3) {
      __int16 v4 = 16;
    }
    else {
      __int16 v4 = 0;
    }
    *(_WORD *)&self->___int16 searchBarLayoutFlags = searchBarLayoutFlags & 0xFFEF | v4;
    [(_UISearchBarLayoutBase *)self invalidateLayout];
  }
}

- (void)setHasPromptLabel:(BOOL)a3
{
  __int16 searchBarLayoutFlags = (__int16)self->_searchBarLayoutFlags;
  if (((((searchBarLayoutFlags & 0x20) == 0) ^ a3) & 1) == 0)
  {
    if (a3) {
      __int16 v4 = 32;
    }
    else {
      __int16 v4 = 0;
    }
    *(_WORD *)&self->___int16 searchBarLayoutFlags = searchBarLayoutFlags & 0xFFDF | v4;
    [(_UISearchBarLayoutBase *)self invalidateLayout];
  }
}

- (void)setHasLeftButton:(BOOL)a3
{
  __int16 searchBarLayoutFlags = (__int16)self->_searchBarLayoutFlags;
  if (((((searchBarLayoutFlags & 4) == 0) ^ a3) & 1) == 0)
  {
    if (a3) {
      __int16 v4 = 4;
    }
    else {
      __int16 v4 = 0;
    }
    *(_WORD *)&self->___int16 searchBarLayoutFlags = searchBarLayoutFlags & 0xFFFB | v4;
    [(_UISearchBarLayoutBase *)self invalidateLayout];
  }
}

- (void)setHasDeleteButton:(BOOL)a3
{
  __int16 searchBarLayoutFlags = (__int16)self->_searchBarLayoutFlags;
  if (((((searchBarLayoutFlags & 2) == 0) ^ a3) & 1) == 0)
  {
    if (a3) {
      __int16 v4 = 2;
    }
    else {
      __int16 v4 = 0;
    }
    *(_WORD *)&self->___int16 searchBarLayoutFlags = searchBarLayoutFlags & 0xFFFD | v4;
    [(_UISearchBarLayoutBase *)self invalidateLayout];
  }
}

- (void)setHasCancelButton:(BOOL)a3
{
  __int16 searchBarLayoutFlags = (__int16)self->_searchBarLayoutFlags;
  if (((((searchBarLayoutFlags & 1) == 0) ^ a3) & 1) == 0)
  {
    *(_WORD *)&self->___int16 searchBarLayoutFlags = searchBarLayoutFlags & 0xFFFE | a3;
    [(_UISearchBarLayoutBase *)self invalidateLayout];
  }
}

- (void)setFloatingSearchIconView:(id)a3
{
  id v4 = a3;
  [(_UISearchBarLayout *)self setUpSearchContainerLayout];
  [(_UISearchBarSearchContainerLayout *)self->_searchContainerLayout setFloatingSearchIconView:v4];
}

- (void)setDeleteButton:(id)a3
{
  id v4 = a3;
  [(_UISearchBarLayout *)self setUpSearchContainerLayout];
  [(_UISearchBarSearchContainerLayout *)self->_searchContainerLayout setDeleteButton:v4];
}

- (void)setDefaultScopeBarInsets:(UIEdgeInsets)a3
{
  self->_defaultScopeBarInsets = a3;
}

- (void)setDefaultInactiveWidth:(double)a3
{
}

- (void)setDefaultActiveWidth:(double)a3
{
}

- (void)setCancelButton:(id)a3
{
  id v4 = a3;
  [(_UISearchBarLayout *)self setUpSearchContainerLayout];
  [(_UISearchBarSearchContainerLayout *)self->_searchContainerLayout setCancelButton:v4];
}

- (void)setBackgroundExtension:(double)a3
{
  if (self->_backgroundExtension != a3)
  {
    self->_backgroundExtension = a3;
    [(_UISearchBarLayoutBase *)self invalidateLayout];
  }
}

- (void)setAllowSearchFieldShrinkage:(BOOL)a3
{
  __int16 searchBarLayoutFlags = (__int16)self->_searchBarLayoutFlags;
  if (((((searchBarLayoutFlags & 0x800) == 0) ^ a3) & 1) == 0)
  {
    if (a3) {
      __int16 v4 = 2048;
    }
    else {
      __int16 v4 = 0;
    }
    *(_WORD *)&self->___int16 searchBarLayoutFlags = searchBarLayoutFlags & 0xF7FF | v4;
    [(_UISearchBarLayoutBase *)self invalidateLayout];
  }
}

- (double)rightContentInsetForInlineSearch
{
  return self->_rightContentInsetForInlineSearch;
}

- (double)leftContentInsetForInlineSearch
{
  return self->_leftContentInsetForInlineSearch;
}

- (void)setUpScopeContainerLayout
{
  if (!self->_scopeContainerLayout)
  {
    uint64_t v3 = objc_alloc_init(_UISearchBarScopeContainerLayout);
    scopeContainerLayout = self->_scopeContainerLayout;
    self->_scopeContainerLayout = v3;

    [(_UISearchBarScopeContainerLayout *)self->_scopeContainerLayout setDelegate:self];
  }
  if (![(_UISearchBarLayout *)self isProspective])
  {
    v5 = self->_scopeContainerLayout;
    scopeBarContainer = self->_scopeBarContainer;
    [(_UISearchBarScopeContainerView *)scopeBarContainer setLayout:v5];
  }
}

- (void)setUpSearchContainerLayout
{
  searchContainerLayout = self->_searchContainerLayout;
  if (!searchContainerLayout)
  {
    __int16 v4 = objc_alloc_init(_UISearchBarSearchContainerLayout);
    v5 = self->_searchContainerLayout;
    self->_searchContainerLayout = v4;

    [(_UISearchBarSearchContainerLayout *)self->_searchContainerLayout setDelegate:self];
    searchContainerLayout = self->_searchContainerLayout;
  }
  [(_UISearchBarSearchContainerLayout *)searchContainerLayout searchBarFieldHeight];
  if (v6 == 0.0)
  {
    v7 = [(_UISearchBarLayout *)self searchField];

    if (v7)
    {
      v8 = [(_UISearchBarLayout *)self searchField];
      objc_msgSend(v8, "_defaultHeightForBarMetrics:", -[_UISearchBarLayoutBase barMetrics](self, "barMetrics"));
      -[_UISearchBarSearchContainerLayout setSearchBarFieldHeight:](self->_searchContainerLayout, "setSearchBarFieldHeight:");
    }
  }
  if (![(_UISearchBarLayout *)self isProspective])
  {
    id v9 = self->_searchContainerLayout;
    searchFieldContainer = self->_searchFieldContainer;
    [(_UISearchBarSearchContainerView *)searchFieldContainer setLayout:v9];
  }
}

- (BOOL)isProspective
{
  return (*(_WORD *)&self->_searchBarLayoutFlags >> 14) & 1;
}

- (double)layout:(id)a3 fontScaledValueForValue:(double)a4
{
  double v4 = a4;
  if (self->_cachedFontValueBeforeScaling == a4) {
    return self->_cachedFontValueAfterScaling;
  }
  self->_cachedFontValueBeforeScaling = a4;
  double v6 = [(_UISearchBarLayout *)self searchField];
  searchFieldFont = self->_searchFieldFont;
  if (searchFieldFont) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (!v8)
  {
    [(UIFont *)searchFieldFont _scaledValueForValue:v4];
    UIRoundToViewScale(v6);
    double v4 = v9;
  }
  self->_cachedFontValueAfterScaling = v4;

  return v4;
}

- (BOOL)hasScopeBar
{
  return (*(_WORD *)&self->_searchBarLayoutFlags >> 4) & 1;
}

- (double)naturalTotalHeight
{
  [(_UISearchBarLayout *)self naturalSearchFieldContainerHeight];
  double v4 = v3;
  __int16 searchBarLayoutFlags = (__int16)self->_searchBarLayoutFlags;
  if ((searchBarLayoutFlags & 0x210) == 0x10)
  {
    [(_UISearchBarLayout *)self naturalScopeContainerHeight];
    double v4 = v4 + v6;
    __int16 searchBarLayoutFlags = (__int16)self->_searchBarLayoutFlags;
  }
  if ((searchBarLayoutFlags & 0x20) != 0)
  {
    [(_UISearchBarLayout *)self naturalPromptContainerHeight];
    return v4 + v7;
  }
  return v4;
}

- (double)naturalSearchFieldContainerHeight
{
  [(_UISearchBarLayout *)self prepareSearchContainerLayout];
  searchContainerLayout = self->_searchContainerLayout;
  [(_UISearchBarSearchContainerLayout *)searchContainerLayout naturalContainerHeight];
  return result;
}

- (double)naturalScopeContainerHeight
{
  [(_UISearchBarLayout *)self prepareScopeContainerLayout];
  scopeContainerLayout = self->_scopeContainerLayout;
  [(_UISearchBarScopeContainerLayout *)scopeContainerLayout naturalContainerHeight];
  return result;
}

- (void)applyLayout
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  [(_UISearchBarLayoutBase *)self layoutSize];
  int64_t representedLayoutState = self->_representedLayoutState;
  [(_UISearchBarLayout *)self searchFieldContainerLayoutFrame];
  -[UIView setFrame:](self->_searchFieldContainer, "setFrame:");
  if (representedLayoutState != 1)
  {
    if ((*(_WORD *)&self->_searchBarLayoutFlags & 0x20) != 0)
    {
      double v4 = [(UIView *)self->_promptContainer superview];

      if (!v4)
      {
        if (dyld_program_sdk_at_least())
        {
          [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3A8], @"Missing or detached view for search bar layout. The application must not remove %@ from the hierarchy.", self->_promptContainer format];
        }
        else if (os_variant_has_internal_diagnostics())
        {
          v21 = __UIFaultDebugAssertLog();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
          {
            promptContainer = self->_promptContainer;
            *(_DWORD *)buf = 138412290;
            v31 = promptContainer;
            _os_log_fault_impl(&dword_1853B0000, v21, OS_LOG_TYPE_FAULT, "Missing or detached view for search bar layout. The application must not remove %@ from the hierarchy. This will become a hard crash in a future release.", buf, 0xCu);
          }
        }
        else
        {
          v5 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_MergedGlobals_5_3) + 8);
          if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
          {
            double v6 = self->_promptContainer;
            *(_DWORD *)buf = 138412290;
            v31 = v6;
            _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_ERROR, "Missing or detached view for search bar layout. The application must not remove %@ from the hierarchy. This will become a hard crash in a future release.", buf, 0xCu);
          }
        }
      }
    }
    [(_UISearchBarLayout *)self promptContainerLayoutFrame];
    -[UIView setFrame:](self->_promptContainer, "setFrame:");
    __int16 searchBarLayoutFlags = (__int16)self->_searchBarLayoutFlags;
    if ((searchBarLayoutFlags & 0x200) == 0)
    {
      if ((searchBarLayoutFlags & 0x10) != 0)
      {
        BOOL v8 = [(UIView *)self->_scopeBarContainer superview];

        if (!v8)
        {
          if (dyld_program_sdk_at_least())
          {
            [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3A8], @"Missing or detached view for search bar layout. The application must not remove %@ from the hierarchy.", self->_scopeBarContainer format];
          }
          else if (os_variant_has_internal_diagnostics())
          {
            v24 = __UIFaultDebugAssertLog();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
            {
              scopeBarContainer = self->_scopeBarContainer;
              *(_DWORD *)buf = 138412290;
              v31 = scopeBarContainer;
              _os_log_fault_impl(&dword_1853B0000, v24, OS_LOG_TYPE_FAULT, "Missing or detached view for search bar layout. The application must not remove %@ from the hierarchy. This will become a hard crash in a future release.", buf, 0xCu);
            }
          }
          else
          {
            double v9 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB25C860) + 8);
            if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
            {
              v10 = self->_scopeBarContainer;
              *(_DWORD *)buf = 138412290;
              v31 = v10;
              _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_ERROR, "Missing or detached view for search bar layout. The application must not remove %@ from the hierarchy. This will become a hard crash in a future release.", buf, 0xCu);
            }
          }
        }
      }
      [(_UISearchBarLayout *)self scopeBarContainerLayoutFrame];
      -[UIView setFrame:](self->_scopeBarContainer, "setFrame:");
      __int16 searchBarLayoutFlags = (__int16)self->_searchBarLayoutFlags;
    }
    if ((searchBarLayoutFlags & 0x40) != 0)
    {
      v11 = [(UIView *)self->_searchBarBackground superview];

      if (!v11)
      {
        if (dyld_program_sdk_at_least())
        {
          [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3A8], @"Missing or detached view for search bar layout. The application must not remove %@ from the hierarchy.", self->_searchBarBackground format];
        }
        else if (os_variant_has_internal_diagnostics())
        {
          v22 = __UIFaultDebugAssertLog();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
          {
            searchBarBackground = self->_searchBarBackground;
            *(_DWORD *)buf = 138412290;
            v31 = searchBarBackground;
            _os_log_fault_impl(&dword_1853B0000, v22, OS_LOG_TYPE_FAULT, "Missing or detached view for search bar layout. The application must not remove %@ from the hierarchy. This will become a hard crash in a future release.", buf, 0xCu);
          }
        }
        else
        {
          v12 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB25C868) + 8);
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            v13 = self->_searchBarBackground;
            *(_DWORD *)buf = 138412290;
            v31 = v13;
            _os_log_impl(&dword_1853B0000, v12, OS_LOG_TYPE_ERROR, "Missing or detached view for search bar layout. The application must not remove %@ from the hierarchy. This will become a hard crash in a future release.", buf, 0xCu);
          }
        }
      }
    }
    [(_UISearchBarLayout *)self searchBarBackgroundLayoutFrame];
    -[UIView setFrame:](self->_searchBarBackground, "setFrame:");
    __int16 v14 = (__int16)self->_searchBarLayoutFlags;
    if ((v14 & 0x80) != 0)
    {
      v15 = [(UIView *)self->_searchBarBackdrop superview];
      v16 = self->_searchBarBackground;

      if (v15 != v16)
      {
        if (os_variant_has_internal_diagnostics())
        {
          v29 = __UIFaultDebugAssertLog();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_fault_impl(&dword_1853B0000, v29, OS_LOG_TYPE_FAULT, "Missing _searchBarBackdrop from search bar hierarchy for layout. This is a UIKit bug.", buf, 2u);
          }
        }
        else
        {
          v20 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB25C870) + 8);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1853B0000, v20, OS_LOG_TYPE_ERROR, "Missing _searchBarBackdrop from search bar hierarchy for layout. This is a UIKit bug.", buf, 2u);
          }
        }
      }
      [(UIView *)self->_searchBarBackground bounds];
      -[UIView setFrame:](self->_searchBarBackdrop, "setFrame:");
      __int16 v14 = (__int16)self->_searchBarLayoutFlags;
    }
    if ((v14 & 0x100) != 0)
    {
      v17 = [(UIView *)self->_separator superview];

      if (!v17)
      {
        if (dyld_program_sdk_at_least())
        {
          [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3A8], @"Missing or detached view for search bar layout. The application must not remove %@ from the hierarchy.", self->_separator format];
        }
        else if (os_variant_has_internal_diagnostics())
        {
          v23 = __UIFaultDebugAssertLog();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
          {
            separator = self->_separator;
            *(_DWORD *)buf = 138412290;
            v31 = separator;
            _os_log_fault_impl(&dword_1853B0000, v23, OS_LOG_TYPE_FAULT, "Missing or detached view for search bar layout. The application must not remove %@ from the hierarchy. This will become a hard crash in a future release.", buf, 0xCu);
          }
        }
        else
        {
          v18 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB25C878) + 8);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            v19 = self->_separator;
            *(_DWORD *)buf = 138412290;
            v31 = v19;
            _os_log_impl(&dword_1853B0000, v18, OS_LOG_TYPE_ERROR, "Missing or detached view for search bar layout. The application must not remove %@ from the hierarchy. This will become a hard crash in a future release.", buf, 0xCu);
          }
        }
      }
    }
    [(_UISearchBarLayout *)self separatorLayoutFrame];
    -[UIView setFrame:](self->_separator, "setFrame:");
    [(_UISearchBarLayout *)self ensureCorrectContainerViewOrdering];
    [(_UISearchBarLayout *)self prepareSublayouts];
  }
}

- (CGRect)searchFieldContainerLayoutFrame
{
  [(_UISearchBarLayoutBase *)self updateLayoutIfNeeded];
  double x = self->_searchFieldContainerLayoutFrame.origin.x;
  double y = self->_searchFieldContainerLayoutFrame.origin.y;
  double width = self->_searchFieldContainerLayoutFrame.size.width;
  double height = self->_searchFieldContainerLayoutFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)searchBarBackgroundLayoutFrame
{
  [(_UISearchBarLayoutBase *)self updateLayoutIfNeeded];
  double x = self->_searchBarBackgroundLayoutFrame.origin.x;
  double y = self->_searchBarBackgroundLayoutFrame.origin.y;
  double width = self->_searchBarBackgroundLayoutFrame.size.width;
  double height = self->_searchBarBackgroundLayoutFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)scopeBarContainerLayoutFrame
{
  [(_UISearchBarLayoutBase *)self updateLayoutIfNeeded];
  double x = self->_scopeBarContainerLayoutFrame.origin.x;
  double y = self->_scopeBarContainerLayoutFrame.origin.y;
  double width = self->_scopeBarContainerLayoutFrame.size.width;
  double height = self->_scopeBarContainerLayoutFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)separatorLayoutFrame
{
  [(_UISearchBarLayoutBase *)self updateLayoutIfNeeded];
  double x = self->_separatorLayoutFrame.origin.x;
  double y = self->_separatorLayoutFrame.origin.y;
  double width = self->_separatorLayoutFrame.size.width;
  double height = self->_separatorLayoutFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)promptContainerLayoutFrame
{
  [(_UISearchBarLayoutBase *)self updateLayoutIfNeeded];
  double x = self->_promptContainerLayoutFrame.origin.x;
  double y = self->_promptContainerLayoutFrame.origin.y;
  double width = self->_promptContainerLayoutFrame.size.width;
  double height = self->_promptContainerLayoutFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)prepareSublayouts
{
  [(_UISearchBarLayout *)self prepareSearchContainerLayout];
  [(_UISearchBarLayout *)self prepareScopeContainerLayout];
}

- (void)updateLayout
{
  [(_UISearchBarLayoutBase *)self layoutSize];
  double v4 = v3;
  double v6 = v5;
  if (self->_representedLayoutState == 1)
  {
    p_searchFieldContainerLayoutFrame = &self->_searchFieldContainerLayoutFrame;
    self->_searchFieldContainerLayoutFrame.origin = (CGPoint)*MEMORY[0x1E4F1DAD8];
  }
  else
  {
    __int16 searchBarLayoutFlags = (__int16)self->_searchBarLayoutFlags;
    double MaxY = 0.0;
    if ((searchBarLayoutFlags & 0x20) != 0)
    {
      [(_UISearchBarPromptContainerView *)self->_promptContainer setBarMetrics:[(_UISearchBarLayoutBase *)self barMetrics]];
      [(_UISearchBarLayoutBase *)self contentInset];
      -[_UISearchBarPromptContainerView setContentInset:](self->_promptContainer, "setContentInset:", 0.0, v10 + 0.0, 0.0, v11 + 0.0);
      [(UIView *)self->_promptContainer frame];
      CGFloat v13 = v12;
      CGFloat v15 = v14;
      [(_UISearchBarLayout *)self naturalPromptContainerHeight];
      CGFloat v17 = v16;
      v35.origin.CGFloat y = 0.0;
      v35.origin.CGFloat x = v13;
      v35.size.CGFloat width = v15;
      v35.size.CGFloat height = v17;
      double MaxY = CGRectGetMaxY(v35);
      self->_promptContainerLayoutFrame.origin.CGFloat x = v13;
      self->_promptContainerLayoutFrame.origin.CGFloat y = 0.0;
      self->_promptContainerLayoutFrame.size.CGFloat width = v15;
      self->_promptContainerLayoutFrame.size.CGFloat height = v17;
    }
    [(UIView *)self->_searchFieldContainer frame];
    CGFloat x = v36.origin.x;
    CGFloat y = v36.origin.y;
    CGFloat width = v36.size.width;
    CGFloat height = v36.size.height;
    CGFloat MinX = CGRectGetMinX(v36);
    v37.origin.CGFloat x = x;
    v37.origin.CGFloat y = y;
    v37.size.CGFloat width = width;
    v37.size.CGFloat height = height;
    CGFloat v22 = CGRectGetWidth(v37);
    double v23 = v6 - MaxY;
    if ((searchBarLayoutFlags & 0x10) != 0)
    {
      -[_UISearchBarScopeContainerView sizeThatFits:](self->_scopeBarContainer, "sizeThatFits:", v4, v6);
      double v24 = v25;
    }
    else
    {
      double v24 = 0.0;
    }
    -[_UISearchBarSearchContainerView sizeThatFits:](self->_searchFieldContainer, "sizeThatFits:", v4, v6);
    if (v26 >= v23 - v24) {
      double v27 = v26;
    }
    else {
      double v27 = v23 - v24;
    }
    if (((*(_WORD *)&self->_searchBarLayoutFlags & 0x800) != 0
       || ![(_UISearchBarLayoutBase *)self isHostedByNavigationBar])
      && v23 < v27)
    {
      double v27 = v6 - MaxY;
    }
    double v28 = 0.0;
    double v29 = 0.0;
    double v30 = MaxY;
    if ((*(_WORD *)&self->_searchBarLayoutFlags & 0x200) == 0)
    {
      v38.origin.CGFloat x = x;
      v38.origin.CGFloat y = MaxY;
      v38.size.CGFloat width = width;
      v38.size.CGFloat height = v27;
      double v28 = CGRectGetMaxY(v38);
      if (v23 - v27 >= v24) {
        double v29 = v24;
      }
      else {
        double v29 = v23 - v27;
      }
      double v30 = v28;
    }
    self->_searchFieldContainerLayoutFrame.origin.CGFloat x = x;
    self->_searchFieldContainerLayoutFrame.origin.CGFloat y = MaxY;
    self->_searchFieldContainerLayoutFrame.size.CGFloat width = width;
    self->_searchFieldContainerLayoutFrame.size.CGFloat height = v27;
    self->_scopeBarContainerLayoutFrame.origin.CGFloat x = MinX;
    self->_scopeBarContainerLayoutFrame.origin.CGFloat y = v28;
    self->_scopeBarContainerLayoutFrame.size.CGFloat width = v22;
    self->_scopeBarContainerLayoutFrame.size.CGFloat height = v29;
    [(UIView *)self->_searchBarBackground frame];
    double v4 = v31;
    double backgroundExtension = self->_backgroundExtension;
    double v6 = v30 + backgroundExtension;
    p_searchFieldContainerLayoutFrame = &self->_searchBarBackgroundLayoutFrame;
    self->_searchBarBackgroundLayoutFrame.origin.CGFloat x = v33;
    self->_searchBarBackgroundLayoutFrame.origin.CGFloat y = -backgroundExtension;
  }
  p_searchFieldContainerLayoutFrame->size.CGFloat width = v4;
  p_searchFieldContainerLayoutFrame->size.CGFloat height = v6;
}

- (void)containerLayoutWillUpdateLayout:(id)a3
{
  double v5 = (_UISearchBarScopeContainerLayout *)a3;
  [(_UISearchBarLayoutBase *)self updateLayoutIfNeeded];
  double v4 = v5;
  if ((_UISearchBarScopeContainerLayout *)self->_searchContainerLayout == v5)
  {
    [(_UISearchBarLayout *)self prepareSearchContainerLayout];
  }
  else
  {
    if (self->_scopeContainerLayout != v5) {
      goto LABEL_6;
    }
    [(_UISearchBarLayout *)self prepareScopeContainerLayout];
  }
  double v4 = v5;
LABEL_6:
}

- (void)setDelegateSearchFieldFrameManipulationBlock:(id)a3
{
  id v4 = a3;
  [(_UISearchBarLayout *)self setUpSearchContainerLayout];
  [(_UISearchBarSearchContainerLayout *)self->_searchContainerLayout setDelegateSearchFieldFrameForProposedFrame:v4];
}

- (void)ensureCorrectContainerViewOrdering
{
  id v3 = [(UIView *)self->_searchFieldContainer superview];
  [v3 insertSubview:self->_searchFieldContainer above:self->_searchBarBackground];
  if ((*(_WORD *)&self->_searchBarLayoutFlags & 0x210) == 0x10) {
    [v3 insertSubview:self->_scopeBarContainer above:self->_searchBarBackground];
  }
}

- (void)setProspective:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x4000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 searchBarLayoutFlags = *(_WORD *)&self->_searchBarLayoutFlags & 0xBFFF | v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchContainerLayout, 0);
  objc_storeStrong((id *)&self->_scopeContainerLayout, 0);
  objc_storeStrong((id *)&self->_searchFieldFont, 0);
  objc_storeStrong(&self->_hostedScopeBarTopInsetForBarMetrics, 0);
  objc_storeStrong(&self->_hostedScopeBarHeightForBarMetrics, 0);
  objc_storeStrong((id *)&self->_promptContainer, 0);
  objc_storeStrong((id *)&self->_searchFieldContainer, 0);
  objc_storeStrong((id *)&self->_scopeBarContainer, 0);
  objc_storeStrong((id *)&self->_separator, 0);
  objc_storeStrong((id *)&self->_searchBarBackdrop, 0);
  objc_storeStrong((id *)&self->_searchBarBackground, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v24.receiver = self;
  v24.super_class = (Class)_UISearchBarLayout;
  id v4 = [(_UISearchBarLayoutBase *)&v24 copyWithZone:a3];
  double v5 = v4;
  if (v4)
  {
    objc_storeStrong(v4 + 12, self->_searchBarBackground);
    objc_storeStrong(v5 + 13, self->_searchBarBackdrop);
    objc_storeStrong(v5 + 14, self->_separator);
    objc_storeStrong(v5 + 15, self->_scopeBarContainer);
    objc_storeStrong(v5 + 16, self->_searchFieldContainer);
    objc_storeStrong(v5 + 17, self->_promptContainer);
    uint64_t v6 = [(_UISearchBarSearchContainerLayout *)self->_searchContainerLayout copy];
    id v7 = v5[28];
    v5[28] = (id)v6;

    [v5[28] setDelegate:v5];
    uint64_t v8 = [(_UISearchBarScopeContainerLayout *)self->_scopeContainerLayout copy];
    id v9 = v5[27];
    v5[27] = (id)v8;

    [v5[27] setDelegate:v5];
    if ((*(_WORD *)&self->_searchBarLayoutFlags & 0x200) == 0) {
      [v5[27] setNeighboringSearchLayout:v5[28]];
    }
    double v10 = *(void **)&self->_searchBarLayoutFlags;
    v5[9] = v10;
    *((_WORD *)v5 + 36) = (unsigned __int16)v10 & 0xBFFF;
    *(UIOffset *)(v5 + 29) = self->_searchFieldBackgroundPositionAdjustment;
    v5[19] = *(id *)&self->_searchBarReadableWidth;
    v5[20] = self->_numberOfScopeTitles;
    long long v11 = *(_OWORD *)&self->_defaultScopeBarInsets.bottom;
    *(_OWORD *)(v5 + 53) = *(_OWORD *)&self->_defaultScopeBarInsets.top;
    *(_OWORD *)(v5 + 55) = v11;
    uint64_t v12 = [self->_hostedScopeBarHeightForBarMetrics copy];
    id v13 = v5[21];
    v5[21] = (id)v12;

    uint64_t v14 = [self->_hostedScopeBarTopInsetForBarMetrics copy];
    id v15 = v5[22];
    v5[22] = (id)v14;

    v5[26] = self->_representedLayoutState;
    uint64_t v16 = [(UIFont *)self->_searchFieldFont copy];
    id v17 = v5[23];
    v5[23] = (id)v16;

    CGSize size = self->_promptContainerLayoutFrame.size;
    *(CGPoint *)(v5 + 33) = self->_promptContainerLayoutFrame.origin;
    *(CGSize *)(v5 + 35) = size;
    CGSize v19 = self->_searchFieldContainerLayoutFrame.size;
    *(CGPoint *)(v5 + 37) = self->_searchFieldContainerLayoutFrame.origin;
    *(CGSize *)(v5 + 39) = v19;
    CGSize v20 = self->_scopeBarContainerLayoutFrame.size;
    *(CGPoint *)(v5 + 41) = self->_scopeBarContainerLayoutFrame.origin;
    *(CGSize *)(v5 + 43) = v20;
    CGSize v21 = self->_searchBarBackgroundLayoutFrame.size;
    *(CGPoint *)(v5 + 45) = self->_searchBarBackgroundLayoutFrame.origin;
    *(CGSize *)(v5 + 47) = v21;
    CGSize v22 = self->_separatorLayoutFrame.size;
    *(CGPoint *)(v5 + 49) = self->_separatorLayoutFrame.origin;
    *(CGSize *)(v5 + 51) = v22;
  }
  return v5;
}

- (BOOL)hasCancelButton
{
  return *(_WORD *)&self->_searchBarLayoutFlags & 1;
}

- (BOOL)hasDeleteButton
{
  return (*(_WORD *)&self->_searchBarLayoutFlags >> 1) & 1;
}

- (BOOL)hasLeftButton
{
  return (*(_WORD *)&self->_searchBarLayoutFlags >> 2) & 1;
}

- (void)setHasFloatingSearchIconBackgroundView:(BOOL)a3
{
  __int16 searchBarLayoutFlags = (__int16)self->_searchBarLayoutFlags;
  if (((((searchBarLayoutFlags & 8) == 0) ^ a3) & 1) == 0)
  {
    if (a3) {
      __int16 v4 = 8;
    }
    else {
      __int16 v4 = 0;
    }
    *(_WORD *)&self->___int16 searchBarLayoutFlags = searchBarLayoutFlags & 0xFFF7 | v4;
    [(_UISearchBarLayoutBase *)self invalidateLayout];
  }
}

- (BOOL)hasFloatingSearchIconBackgroundView
{
  return (*(_WORD *)&self->_searchBarLayoutFlags >> 3) & 1;
}

- (BOOL)hasPromptLabel
{
  return (*(_WORD *)&self->_searchBarLayoutFlags >> 5) & 1;
}

- (BOOL)hasSearchBarBackground
{
  return (*(_WORD *)&self->_searchBarLayoutFlags >> 6) & 1;
}

- (BOOL)hasSearchBarBackdrop
{
  return (*(_WORD *)&self->_searchBarLayoutFlags >> 7) & 1;
}

- (BOOL)hasSeparator
{
  return HIBYTE(*(_WORD *)&self->_searchBarLayoutFlags) & 1;
}

- (UIView)cancelButton
{
  return [(_UISearchBarSearchContainerLayout *)self->_searchContainerLayout cancelButton];
}

- (UIView)deleteButton
{
  return [(_UISearchBarSearchContainerLayout *)self->_searchContainerLayout deleteButton];
}

- (UIView)leftButton
{
  return [(_UISearchBarSearchContainerLayout *)self->_searchContainerLayout leftButton];
}

- (UIImageView)floatingSearchIconView
{
  return [(_UISearchBarSearchContainerLayout *)self->_searchContainerLayout floatingSearchIconView];
}

- (void)setFloatingSearchIconBackgroundView:(id)a3
{
  id v4 = a3;
  [(_UISearchBarLayout *)self setUpSearchContainerLayout];
  [(_UISearchBarSearchContainerLayout *)self->_searchContainerLayout setFloatingSearchIconBackgroundView:v4];
}

- (UIView)floatingSearchIconBackgroundView
{
  return [(_UISearchBarSearchContainerLayout *)self->_searchContainerLayout floatingSearchIconBackgroundView];
}

- (UIBarButtonItem)searchIconBarButtonItem
{
  return [(_UISearchBarSearchContainerLayout *)self->_searchContainerLayout searchIconBarButtonItem];
}

- (UIView)scopeBar
{
  return [(_UISearchBarScopeContainerLayout *)self->_scopeContainerLayout scopeBar];
}

- (BOOL)allowSearchFieldShrinkage
{
  return (*(_WORD *)&self->_searchBarLayoutFlags >> 11) & 1;
}

- (BOOL)isHostedInlineByNavigationBar
{
  return (*(_WORD *)&self->_searchBarLayoutFlags >> 9) & 1;
}

- (BOOL)isTextFieldManagedInNSToolbar
{
  return (*(_WORD *)&self->_searchBarLayoutFlags >> 10) & 1;
}

- (BOOL)searchFieldUsesCustomBackgroundImage
{
  return (*(_WORD *)&self->_searchBarLayoutFlags >> 12) & 1;
}

- (BOOL)searchFieldEffectivelySupportsDynamicType
{
  return (*(_WORD *)&self->_searchBarLayoutFlags >> 13) & 1;
}

- (void)setHostingNavBarTransitionActive:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x8000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 searchBarLayoutFlags = v3 & 0x8000 | *(_WORD *)&self->_searchBarLayoutFlags & 0x7FFF;
}

- (BOOL)isHostingNavBarTransitionActive
{
  return *(_WORD *)&self->_searchBarLayoutFlags >> 15;
}

- (void)setSearchFieldBackgroundPositionAdjustment:(UIOffset)a3
{
  if (a3.horizontal != self->_searchFieldBackgroundPositionAdjustment.horizontal
    || a3.vertical != self->_searchFieldBackgroundPositionAdjustment.vertical)
  {
    self->_searchFieldBackgroundPositionAdjustment = a3;
    [(_UISearchBarLayoutBase *)self invalidateLayout];
  }
}

- (double)naturalSearchFieldHeight
{
  [(_UISearchBarLayout *)self prepareSearchContainerLayout];
  searchContainerLayout = self->_searchContainerLayout;
  [(_UISearchBarSearchContainerLayout *)searchContainerLayout naturalSearchFieldHeight];
  return result;
}

- (double)defaultInactiveWidth
{
  [(_UISearchBarSearchContainerLayout *)self->_searchContainerLayout defaultInactiveWidth];
  return result;
}

- (double)defaultActiveWidth
{
  [(_UISearchBarSearchContainerLayout *)self->_searchContainerLayout defaultActiveWidth];
  return result;
}

- (double)overrideInactiveWidth
{
  [(_UISearchBarSearchContainerLayout *)self->_searchContainerLayout overrideInactiveWidth];
  return result;
}

- (double)overrideActiveWidth
{
  [(_UISearchBarSearchContainerLayout *)self->_searchContainerLayout overrideActiveWidth];
  return result;
}

- (double)prescribedSearchContainerWidth
{
  [(_UISearchBarLayout *)self prepareSearchContainerLayout];
  searchContainerLayout = self->_searchContainerLayout;
  [(_UISearchBarSearchContainerLayout *)searchContainerLayout prescribedWidth];
  return result;
}

- (UIEdgeInsets)scopeContainerSpecificInsets
{
  [(_UISearchBarLayout *)self prepareScopeContainerLayout];
  scopeContainerLayout = self->_scopeContainerLayout;
  [(_UISearchBarScopeContainerLayout *)scopeContainerLayout containerSpecificInsets];
  result.right = v7;
  result.bottom = v6;
  result.left = v5;
  result.top = v4;
  return result;
}

- (double)naturalPromptContainerHeight
{
  promptContainer = self->_promptContainer;
  [(UIView *)promptContainer bounds];
  -[_UISearchBarPromptContainerView sizeThatFits:](promptContainer, "sizeThatFits:", v3, v4);
  return v5;
}

- (double)minimumLayoutWidth
{
  [(_UISearchBarLayoutBase *)self contentInset];
  return v2 + v3 + 100.0;
}

- (void)applyScopeContainerSublayout
{
  [(_UISearchBarScopeContainerLayout *)self->_scopeContainerLayout applyLayout];
  id v3 = [(_UISearchBarScopeContainerLayout *)self->_scopeContainerLayout scopeBar];
  [v3 layoutIfNeeded];
}

- (void)cleanUpLayout
{
  __int16 searchBarLayoutFlags = (__int16)self->_searchBarLayoutFlags;
  double v5 = [(_UISearchBarSearchContainerLayout *)self->_searchContainerLayout cancelButton];
  double v6 = [v5 superview];

  if ((searchBarLayoutFlags & 1) == 0)
  {
    if (!v6) {
      goto LABEL_9;
    }
    double v7 = [(_UISearchBarSearchContainerLayout *)self->_searchContainerLayout cancelButton];
    [v7 setHidden:1];
    goto LABEL_8;
  }
  if (!v6)
  {
    v42 = [MEMORY[0x1E4F28B00] currentHandler];
    [v42 handleFailureInMethod:a2 object:self file:@"_UISearchBarLayout.m" lineNumber:618 description:@"Missing or detached view for search bar layout cleanup"];
  }
  uint64_t v8 = [(_UISearchBarSearchContainerLayout *)self->_searchContainerLayout cancelButton];
  [v8 setHidden:0];

  id v9 = [(_UISearchBarSearchContainerLayout *)self->_searchContainerLayout cancelButton];
  [v9 alpha];
  double v11 = v10;

  if (v11 < 0.01)
  {
    double v7 = [(_UISearchBarSearchContainerLayout *)self->_searchContainerLayout cancelButton];
    [v7 setAlpha:1.0];
LABEL_8:
  }
LABEL_9:
  __int16 v12 = (__int16)self->_searchBarLayoutFlags;
  id v13 = [(_UISearchBarSearchContainerLayout *)self->_searchContainerLayout deleteButton];
  uint64_t v14 = [v13 superview];

  if ((v12 & 2) == 0)
  {
    if (!v14) {
      goto LABEL_17;
    }
    id v15 = [(_UISearchBarSearchContainerLayout *)self->_searchContainerLayout deleteButton];
    [v15 setHidden:1];
    goto LABEL_16;
  }
  if (!v14)
  {
    v43 = [MEMORY[0x1E4F28B00] currentHandler];
    [v43 handleFailureInMethod:a2 object:self file:@"_UISearchBarLayout.m" lineNumber:619 description:@"Missing or detached view for search bar layout cleanup"];
  }
  uint64_t v16 = [(_UISearchBarSearchContainerLayout *)self->_searchContainerLayout deleteButton];
  [v16 setHidden:0];

  id v17 = [(_UISearchBarSearchContainerLayout *)self->_searchContainerLayout deleteButton];
  [v17 alpha];
  double v19 = v18;

  if (v19 < 0.01)
  {
    id v15 = [(_UISearchBarSearchContainerLayout *)self->_searchContainerLayout deleteButton];
    [v15 setAlpha:1.0];
LABEL_16:
  }
LABEL_17:
  __int16 v20 = (__int16)self->_searchBarLayoutFlags;
  CGSize v21 = [(_UISearchBarScopeContainerLayout *)self->_scopeContainerLayout scopeBar];
  CGSize v22 = [v21 superview];

  if ((v20 & 0x10) == 0)
  {
    if (!v22) {
      goto LABEL_25;
    }
    double v23 = [(_UISearchBarScopeContainerLayout *)self->_scopeContainerLayout scopeBar];
    [v23 setHidden:1];
    goto LABEL_24;
  }
  if (!v22)
  {
    v44 = [MEMORY[0x1E4F28B00] currentHandler];
    [v44 handleFailureInMethod:a2 object:self file:@"_UISearchBarLayout.m" lineNumber:620 description:@"Missing or detached view for search bar layout cleanup"];
  }
  objc_super v24 = [(_UISearchBarScopeContainerLayout *)self->_scopeContainerLayout scopeBar];
  [v24 setHidden:0];

  double v25 = [(_UISearchBarScopeContainerLayout *)self->_scopeContainerLayout scopeBar];
  [v25 alpha];
  double v27 = v26;

  if (v27 < 0.01)
  {
    double v23 = [(_UISearchBarScopeContainerLayout *)self->_scopeContainerLayout scopeBar];
    [v23 setAlpha:1.0];
LABEL_24:
  }
LABEL_25:
  __int16 v28 = (__int16)self->_searchBarLayoutFlags;
  double v29 = [(UIView *)self->_promptContainer superview];

  if ((v28 & 0x20) != 0)
  {
    if (!v29)
    {
      v45 = [MEMORY[0x1E4F28B00] currentHandler];
      [v45 handleFailureInMethod:a2 object:self file:@"_UISearchBarLayout.m" lineNumber:621 description:@"Missing or detached view for search bar layout cleanup"];
    }
    [(UIView *)self->_promptContainer setHidden:0];
    [(UIView *)self->_promptContainer alpha];
    if (v30 < 0.01) {
      [(UIView *)self->_promptContainer setAlpha:1.0];
    }
  }
  else if (v29)
  {
    [(UIView *)self->_promptContainer setHidden:1];
  }
  __int16 v31 = (__int16)self->_searchBarLayoutFlags;
  uint64_t v32 = [(UIView *)self->_searchBarBackground superview];

  if ((v31 & 0x40) != 0)
  {
    if (!v32)
    {
      v46 = [MEMORY[0x1E4F28B00] currentHandler];
      [v46 handleFailureInMethod:a2 object:self file:@"_UISearchBarLayout.m" lineNumber:622 description:@"Missing or detached view for search bar layout cleanup"];
    }
    [(UIView *)self->_searchBarBackground setHidden:0];
    [(UIView *)self->_searchBarBackground alpha];
    if (v33 < 0.01) {
      [(UIView *)self->_searchBarBackground setAlpha:1.0];
    }
  }
  else if (v32)
  {
    [(UIView *)self->_searchBarBackground setHidden:1];
  }
  __int16 v34 = (__int16)self->_searchBarLayoutFlags;
  CGRect v35 = [(UIView *)self->_searchBarBackdrop superview];

  if ((v34 & 0x80) != 0)
  {
    if (!v35)
    {
      v47 = [MEMORY[0x1E4F28B00] currentHandler];
      [v47 handleFailureInMethod:a2 object:self file:@"_UISearchBarLayout.m" lineNumber:623 description:@"Missing or detached view for search bar layout cleanup"];
    }
    [(UIView *)self->_searchBarBackdrop setHidden:0];
    [(UIView *)self->_searchBarBackdrop alpha];
    if (v36 < 0.01) {
      [(UIView *)self->_searchBarBackdrop setAlpha:1.0];
    }
  }
  else if (v35)
  {
    [(UIView *)self->_searchBarBackdrop setHidden:1];
  }
  __int16 v37 = (__int16)self->_searchBarLayoutFlags;
  CGRect v38 = [(UIView *)self->_separator superview];

  if ((v37 & 0x100) != 0)
  {
    if (!v38)
    {
      v48 = [MEMORY[0x1E4F28B00] currentHandler];
      [v48 handleFailureInMethod:a2 object:self file:@"_UISearchBarLayout.m" lineNumber:624 description:@"Missing or detached view for search bar layout cleanup"];
    }
    [(UIView *)self->_separator setHidden:0];
    [(UIView *)self->_separator alpha];
    if (v40 < 0.01)
    {
      separator = self->_separator;
      [(UIView *)separator setAlpha:1.0];
    }
  }
  else if (v38)
  {
    v39 = self->_separator;
    [(UIView *)v39 setHidden:1];
  }
}

- (NSString)description
{
  v24.receiver = self;
  v24.super_class = (Class)_UISearchBarLayout;
  id v3 = [(_UISearchBarLayoutBase *)&v24 description];
  if (os_variant_has_internal_diagnostics())
  {
    double v5 = _UISearchBarLayoutStateDebugDescription(self->_representedLayoutState);
    [(_UISearchBarLayout *)self naturalTotalHeight];
    double v7 = [v3 stringByAppendingFormat:@" %@ naturalHeight=%g", v5, v6];

    double minimum = self->_heightRange.minimum;
    double maximum = self->_heightRange.maximum;
    if (minimum != maximum)
    {
      uint64_t v10 = [v7 stringByAppendingFormat:@" (min=%g, max=%g)", *(void *)&self->_heightRange.minimum, *(void *)&maximum];

      double v7 = (void *)v10;
    }
    __int16 searchBarLayoutFlags = (__int16)self->_searchBarLayoutFlags;
    if ((searchBarLayoutFlags & 0x20) != 0)
    {
      [(_UISearchBarLayout *)self naturalPromptContainerHeight];
      uint64_t v14 = objc_msgSend(v7, "stringByAppendingFormat:", @" naturalPromptContainerHeight=%g", v13);

      __int16 v12 = (__int16)self->_searchBarLayoutFlags;
      double v7 = (void *)v14;
    }
    else
    {
      __int16 v12 = (__int16)self->_searchBarLayoutFlags;
    }
    if ((v12 & 0x200) != 0)
    {
      uint64_t v15 = objc_msgSend(v7, "stringByAppendingString:", @" inline", minimum);

      double v7 = (void *)v15;
    }
    if (self->_searchContainerLayout) {
      objc_msgSend(v7, "stringByAppendingFormat:", @" searchContainerLayout=%p", minimum, self->_searchContainerLayout);
    }
    else {
    id v3 = objc_msgSend(v7, "stringByAppendingString:", @" MISSING searchContainerLayout", minimum);
    }

    if (self->_scopeContainerLayout)
    {
      uint64_t v16 = objc_msgSend(v3, "stringByAppendingFormat:", @" scopeContainerLayout=%p", self->_scopeContainerLayout);

      id v3 = (void *)v16;
    }
    if ((searchBarLayoutFlags & 0x20) != 0)
    {
      uint64_t v17 = objc_msgSend(v3, "stringByAppendingFormat:", @" promptContainer=%p", self->_promptContainer);

      id v3 = (void *)v17;
    }
    if ([(_UISearchBarLayoutBase *)self isLayoutValid])
    {
      double v18 = [v3 stringByAppendingString:@" layoutFrames:"];

      if ((searchBarLayoutFlags & 0x20) != 0)
      {
        objc_msgSend(v18, "stringByAppendingFormat:", @" promptContainer=(%g, %g; %g, %g)",
          *(void *)&self->_promptContainerLayoutFrame.origin.x,
          *(void *)&self->_promptContainerLayoutFrame.origin.y,
          *(void *)&self->_promptContainerLayoutFrame.size.width,
        uint64_t v19 = *(void *)&self->_promptContainerLayoutFrame.size.height);

        double v18 = (void *)v19;
      }
      objc_msgSend(v18, "stringByAppendingFormat:", @" searchContainer=(%g, %g; %g, %g)",
        *(void *)&self->_searchFieldContainerLayoutFrame.origin.x,
        *(void *)&self->_searchFieldContainerLayoutFrame.origin.y,
        *(void *)&self->_searchFieldContainerLayoutFrame.size.width,
      id v3 = *(void *)&self->_searchFieldContainerLayoutFrame.size.height);

      __int16 v20 = (__int16)self->_searchBarLayoutFlags;
      if ((v20 & 0x210) == 0x10)
      {
        objc_msgSend(v3, "stringByAppendingFormat:", @" scopeContainer=(%g, %g; %g, %g)",
          *(void *)&self->_scopeBarContainerLayoutFrame.origin.x,
          *(void *)&self->_scopeBarContainerLayoutFrame.origin.y,
          *(void *)&self->_scopeBarContainerLayoutFrame.size.width,
        uint64_t v21 = *(void *)&self->_scopeBarContainerLayoutFrame.size.height);

        __int16 v20 = (__int16)self->_searchBarLayoutFlags;
        id v3 = (void *)v21;
        if ((v20 & 0x40) == 0)
        {
LABEL_24:
          if ((v20 & 0x100) == 0) {
            goto LABEL_2;
          }
LABEL_28:
          objc_msgSend(v3, "stringByAppendingFormat:", @" separator=(%g, %g; %g, %g)",
            *(void *)&self->_separatorLayoutFrame.origin.x,
            *(void *)&self->_separatorLayoutFrame.origin.y,
            *(void *)&self->_separatorLayoutFrame.size.width,
          uint64_t v23 = *(void *)&self->_separatorLayoutFrame.size.height);

          id v3 = (void *)v23;
          goto LABEL_2;
        }
      }
      else if ((v20 & 0x40) == 0)
      {
        goto LABEL_24;
      }
      objc_msgSend(v3, "stringByAppendingFormat:", @" searchBarBackground=(%g, %g; %g, %g)",
        *(void *)&self->_searchBarBackgroundLayoutFrame.origin.x,
        *(void *)&self->_searchBarBackgroundLayoutFrame.origin.y,
        *(void *)&self->_searchBarBackgroundLayoutFrame.size.width,
      uint64_t v22 = *(void *)&self->_searchBarBackgroundLayoutFrame.size.height);

      id v3 = (void *)v22;
      if ((*(_WORD *)&self->_searchBarLayoutFlags & 0x100) == 0) {
        goto LABEL_2;
      }
      goto LABEL_28;
    }
  }
LABEL_2:
  return (NSString *)v3;
}

- (void)setLayoutCustomizationDelegateSearchFieldContainerWillLayoutSubviewsCallback:(id)a3
{
  id v4 = a3;
  [(_UISearchBarLayout *)self setUpSearchContainerLayout];
  [(_UISearchBarSearchContainerLayout *)self->_searchContainerLayout setLayoutCustomizationDelegateSearchFieldContainerWillLayoutSubviewsCallback:v4];
}

- (void)setAdditionalPaddingForCancelButtonAtLeadingEdge:(double)a3
{
  [(_UISearchBarLayout *)self setUpSearchContainerLayout];
  searchContainerLayout = self->_searchContainerLayout;
  [(_UISearchBarSearchContainerLayout *)searchContainerLayout setAdditionalPaddingForCancelButtonAtLeadingEdge:a3];
}

- (double)additionalPaddingForCancelButtonAtLeadingEdge
{
  [(_UISearchBarSearchContainerLayout *)self->_searchContainerLayout additionalPaddingForCancelButtonAtLeadingEdge];
  return result;
}

- (void)setAdditionalPaddingForSearchFieldAtLeadingEdge:(double)a3
{
  [(_UISearchBarLayout *)self setUpSearchContainerLayout];
  searchContainerLayout = self->_searchContainerLayout;
  [(_UISearchBarSearchContainerLayout *)searchContainerLayout setAdditionalPaddingForSearchFieldAtLeadingEdge:a3];
}

- (double)additionalPaddingForSearchFieldAtLeadingEdge
{
  [(_UISearchBarSearchContainerLayout *)self->_searchContainerLayout additionalPaddingForSearchFieldAtLeadingEdge];
  return result;
}

- (UIView)searchBarBackground
{
  return self->_searchBarBackground;
}

- (UIView)searchBarBackdrop
{
  return self->_searchBarBackdrop;
}

- (UIView)separator
{
  return self->_separator;
}

- (_UISearchBarScopeContainerView)scopeBarContainer
{
  return self->_scopeBarContainer;
}

- (_UISearchBarSearchContainerView)searchFieldContainer
{
  return self->_searchFieldContainer;
}

- (_UISearchBarPromptContainerView)promptContainer
{
  return self->_promptContainer;
}

- (double)backgroundExtension
{
  return self->_backgroundExtension;
}

- (UIOffset)searchFieldBackgroundPositionAdjustment
{
  double horizontal = self->_searchFieldBackgroundPositionAdjustment.horizontal;
  double vertical = self->_searchFieldBackgroundPositionAdjustment.vertical;
  result.double vertical = vertical;
  result.double horizontal = horizontal;
  return result;
}

- (double)searchBarReadableWidth
{
  return self->_searchBarReadableWidth;
}

- (unint64_t)numberOfScopeTitles
{
  return self->_numberOfScopeTitles;
}

- (UIEdgeInsets)defaultScopeBarInsets
{
  double top = self->_defaultScopeBarInsets.top;
  double left = self->_defaultScopeBarInsets.left;
  double bottom = self->_defaultScopeBarInsets.bottom;
  double right = self->_defaultScopeBarInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (id)hostedScopeBarHeightForBarMetrics
{
  return self->_hostedScopeBarHeightForBarMetrics;
}

- (id)hostedScopeBarTopInsetForBarMetrics
{
  return self->_hostedScopeBarTopInsetForBarMetrics;
}

- (UIFont)searchFieldFont
{
  return self->_searchFieldFont;
}

- (void)setLeftContentInsetForInlineSearch:(double)a3
{
  self->_leftContentInsetForInlineSearch = a3;
}

- (void)setRightContentInsetForInlineSearch:(double)a3
{
  self->_rightContentInsetForInlineSearch = a3;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)heightRange
{
  double minimum = self->_heightRange.minimum;
  double maximum = self->_heightRange.maximum;
  result.var1 = maximum;
  result.var0 = minimum;
  return result;
}

- (_UISearchBarScopeContainerLayout)scopeContainerLayout
{
  return self->_scopeContainerLayout;
}

- (void)setScopeContainerLayout:(id)a3
{
}

- (_UISearchBarSearchContainerLayout)searchContainerLayout
{
  return self->_searchContainerLayout;
}

- (void)setSearchContainerLayout:(id)a3
{
}

@end