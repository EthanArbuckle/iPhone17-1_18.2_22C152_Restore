@interface _UISearchBarVisualProviderBase
- (BOOL)allowsInlineScopeBar;
- (BOOL)alwaysUsesLayoutMarginsForHorizontalContentInset;
- (BOOL)autoDisableCancelButton;
- (BOOL)backgroundLayoutNeedsUpdate;
- (BOOL)centerPlaceholder;
- (BOOL)drawsBackground;
- (BOOL)drawsBackgroundInPalette;
- (BOOL)isActiveSearchDeferringScopeBar;
- (BOOL)isEnabled;
- (BOOL)isFrozenForDismissalCrossfade;
- (BOOL)isHostedByNavigationBar;
- (BOOL)isHostedInlineByNavigationBar;
- (BOOL)isInBarButNotHosted;
- (BOOL)isInNavigationPalette;
- (BOOL)isPlacedInNavigationBar;
- (BOOL)isPlacedInToolbar;
- (BOOL)isSearchResultsButtonSelected;
- (BOOL)isTextFieldManagedInNSToolbar;
- (BOOL)providesRestingMeasurementValues;
- (BOOL)reliesOnNavigationBarBackdrop;
- (BOOL)requiresSearchTextField;
- (BOOL)scopeBarIsVisible;
- (BOOL)shouldCombineLandscapeBarsForOrientation:(int64_t)a3;
- (BOOL)showsBookmarkButton;
- (BOOL)showsCancelButton;
- (BOOL)showsScopeBar;
- (BOOL)showsSearchResultsButton;
- (BOOL)usesEmbeddedAppearance;
- (BOOL)wantsDictationButton;
- (BOOL)wouldCombineLandscapeBarsForSize:(CGSize)a3;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)runtimeOnlyViews;
- (NSArray)scopeTitles;
- (NSString)cancelButtonText;
- (NSString)prompt;
- (UIBarButtonItem)animatedAppearanceBarButtonItem;
- (UIBarButtonItem)cancelBarButtonItem;
- (UIBarButtonItem)existingSearchIconBarButtonItem;
- (UIBarButtonItem)searchIconBarButtonItem;
- (UIButton)cancelButton;
- (UIColor)barTintColor;
- (UIColor)textColor;
- (UIEdgeInsets)effectiveContentInset;
- (UIEdgeInsets)minimumContentInset;
- (UIEdgeInsets)scopeBarInsets;
- (UIImage)scopeBarBackgroundImage;
- (UIImage)separatorImage;
- (UIImageView)separator;
- (UIImageView)shadowView;
- (UILabel)promptLabel;
- (UINavigationButton)leftButton;
- (UINavigationItem)searchNavigationItem;
- (UIOffset)searchFieldBackgroundPositionAdjustment;
- (UISearchBar)searchBar;
- (UISearchBarBackground)searchBarBackground;
- (UISearchBarTextField)searchField;
- (UISegmentedControl)scopeBar;
- (UITextField)searchFieldIfExists;
- (UIView)scopeBarContainerView;
- (UIView)searchBarClippingView;
- (UIVisualEffectView)backdropVisualEffectView;
- (_UIBackdropView)backdrop;
- (_UINavigationBarTitleViewDataSource)navBarTitleViewDataSource;
- (_UINavigationBarTitleViewOverlayRects)navBarTitleViewOverlayRects;
- (_UISearchBarScopeBarBackground)scopeBarBackgroundView;
- (_UISearchBarVisualProviderBase)initWithDelegate:(id)a3;
- (double)barHeightForBarMetrics:(int64_t)a3;
- (double)barHeightForBarMetrics:(int64_t)a3 barPosition:(int64_t)a4;
- (double)barHeightForBarMetrics:(int64_t)a3 withEffectiveInsets:(UIEdgeInsets)a4;
- (double)defaultActiveSearchFieldWidth;
- (double)defaultHeightForOrientation:(int64_t)a3;
- (double)defaultInactiveSearchFieldWidth;
- (double)heightAllowanceForTopSearchBarInTitleViewLocation;
- (double)idealInlineWidthForLayoutState:(int64_t)a3;
- (double)leftInsetForInlineSearch;
- (double)navigationBarContentHeight;
- (double)overrideInlineActiveWidth;
- (double)overrideInlineInactiveWidth;
- (double)rightInsetForInlineSearch;
- (double)scopeBarHeight;
- (double)searchFieldHeight;
- (double)tableViewIndexWidth;
- (id)backgroundImageForBarPosition:(int64_t)a3 barMetrics:(int64_t)a4;
- (id)colorForComponent:(unint64_t)a3 disabled:(BOOL)a4;
- (id)effectiveBarTintColor;
- (id)imageForSearchBarIcon:(int64_t)a3 state:(unint64_t)a4;
- (id)internalImageForSearchBarIcon:(int64_t)a3 state:(unint64_t)a4 customImage:(BOOL *)a5;
- (id)makeShadowView;
- (id)searchDisplayController;
- (id)searchFieldBackgroundImageForState:(unint64_t)a3;
- (int)visualProviderType;
- (int64_t)backdropStyle;
- (int64_t)barMetricsForOrientation:(int64_t)a3;
- (int64_t)barPosition;
- (int64_t)barStyle;
- (int64_t)barTranslucence;
- (int64_t)layoutState;
- (int64_t)navBarTitleViewLocation;
- (int64_t)searchFieldLeftViewMode;
- (int64_t)selectedScope;
- (unint64_t)scopeBarPosition;
- (unint64_t)searchBarStyle;
- (void)setOverrideInlineActiveWidth:(double)a3;
- (void)setOverrideInlineInactiveWidth:(double)a3;
- (void)setSearchBar:(id)a3;
- (void)setVisualProviderType:(int)a3;
- (void)teardown;
@end

@implementation _UISearchBarVisualProviderBase

- (UISearchBar)searchBar
{
  return self->_searchBar;
}

- (double)overrideInlineInactiveWidth
{
  return self->_overrideInlineInactiveWidth;
}

- (double)overrideInlineActiveWidth
{
  return self->_overrideInlineActiveWidth;
}

- (_UISearchBarVisualProviderBase)initWithDelegate:(id)a3
{
  v5 = (UISearchBar *)a3;
  if (!v5)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"_UISearchBarVisualProviderBase.m" lineNumber:15 description:@"visual provider requires a search bar as a delegate"];
  }
  v10.receiver = self;
  v10.super_class = (Class)_UISearchBarVisualProviderBase;
  v6 = [(_UISearchBarVisualProviderBase *)&v10 init];
  v7 = v6;
  if (v6) {
    v6->_searchBar = v5;
  }

  return v7;
}

- (void)teardown
{
  self->_searchBar = 0;
}

- (NSArray)runtimeOnlyViews
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

- (int)visualProviderType
{
  return 0;
}

- (UISearchBarTextField)searchField
{
  return 0;
}

- (UITextField)searchFieldIfExists
{
  return 0;
}

- (UISearchBarBackground)searchBarBackground
{
  return 0;
}

- (_UIBackdropView)backdrop
{
  return 0;
}

- (UIVisualEffectView)backdropVisualEffectView
{
  return 0;
}

- (UIButton)cancelButton
{
  return 0;
}

- (UIBarButtonItem)cancelBarButtonItem
{
  return 0;
}

- (UINavigationButton)leftButton
{
  return 0;
}

- (UILabel)promptLabel
{
  return 0;
}

- (UIImageView)separator
{
  return 0;
}

- (UISegmentedControl)scopeBar
{
  return 0;
}

- (UIView)scopeBarContainerView
{
  return 0;
}

- (_UISearchBarScopeBarBackground)scopeBarBackgroundView
{
  return 0;
}

- (UIView)searchBarClippingView
{
  return 0;
}

- (UIImageView)shadowView
{
  return 0;
}

- (NSString)prompt
{
  return 0;
}

- (NSArray)scopeTitles
{
  return 0;
}

- (NSString)cancelButtonText
{
  return 0;
}

- (int64_t)barStyle
{
  return 0;
}

- (unint64_t)searchBarStyle
{
  return 0;
}

- (int64_t)barTranslucence
{
  return 0;
}

- (int64_t)backdropStyle
{
  return 2005;
}

- (UIColor)barTintColor
{
  return 0;
}

- (int64_t)barPosition
{
  return 0;
}

- (unint64_t)scopeBarPosition
{
  return 0;
}

- (int64_t)searchFieldLeftViewMode
{
  return 0;
}

- (BOOL)centerPlaceholder
{
  return 0;
}

- (BOOL)isEnabled
{
  return 0;
}

- (BOOL)reliesOnNavigationBarBackdrop
{
  return 0;
}

- (BOOL)drawsBackground
{
  return 0;
}

- (BOOL)usesEmbeddedAppearance
{
  return 0;
}

- (BOOL)showsCancelButton
{
  return 0;
}

- (BOOL)autoDisableCancelButton
{
  return 0;
}

- (BOOL)showsSearchResultsButton
{
  return 0;
}

- (BOOL)isSearchResultsButtonSelected
{
  return 0;
}

- (BOOL)showsBookmarkButton
{
  return 0;
}

- (BOOL)showsScopeBar
{
  return 0;
}

- (BOOL)isActiveSearchDeferringScopeBar
{
  return 0;
}

- (BOOL)scopeBarIsVisible
{
  return 0;
}

- (int64_t)selectedScope
{
  return 0;
}

- (BOOL)isPlacedInNavigationBar
{
  return 0;
}

- (BOOL)isPlacedInToolbar
{
  return 0;
}

- (BOOL)isInNavigationPalette
{
  return 0;
}

- (BOOL)isHostedByNavigationBar
{
  return 0;
}

- (BOOL)isHostedInlineByNavigationBar
{
  return 0;
}

- (BOOL)isTextFieldManagedInNSToolbar
{
  return 0;
}

- (BOOL)providesRestingMeasurementValues
{
  return 0;
}

- (BOOL)isFrozenForDismissalCrossfade
{
  return 0;
}

- (UIBarButtonItem)searchIconBarButtonItem
{
  return 0;
}

- (UIBarButtonItem)existingSearchIconBarButtonItem
{
  return 0;
}

- (BOOL)requiresSearchTextField
{
  return 1;
}

- (int64_t)layoutState
{
  return -1;
}

- (double)idealInlineWidthForLayoutState:(int64_t)a3
{
  return 0.0;
}

- (double)leftInsetForInlineSearch
{
  return 0.0;
}

- (double)rightInsetForInlineSearch
{
  return 0.0;
}

- (double)heightAllowanceForTopSearchBarInTitleViewLocation
{
  return 0.0;
}

- (UIImage)separatorImage
{
  return 0;
}

- (id)searchFieldBackgroundImageForState:(unint64_t)a3
{
  return 0;
}

- (id)imageForSearchBarIcon:(int64_t)a3 state:(unint64_t)a4
{
  return 0;
}

- (id)internalImageForSearchBarIcon:(int64_t)a3 state:(unint64_t)a4 customImage:(BOOL *)a5
{
  return 0;
}

- (id)backgroundImageForBarPosition:(int64_t)a3 barMetrics:(int64_t)a4
{
  return 0;
}

- (UIImage)scopeBarBackgroundImage
{
  return 0;
}

- (UIOffset)searchFieldBackgroundPositionAdjustment
{
  double v2 = 0.0;
  double v3 = 0.0;
  result.vertical = v3;
  result.horizontal = v2;
  return result;
}

- (UIColor)textColor
{
  return 0;
}

- (id)colorForComponent:(unint64_t)a3 disabled:(BOOL)a4
{
  return 0;
}

- (id)effectiveBarTintColor
{
  return 0;
}

- (UIEdgeInsets)minimumContentInset
{
  double v2 = 0.0;
  double v3 = 0.0;
  double v4 = 0.0;
  double v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (UIEdgeInsets)effectiveContentInset
{
  double v2 = 0.0;
  double v3 = 0.0;
  double v4 = 0.0;
  double v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (UIEdgeInsets)scopeBarInsets
{
  double v2 = 0.0;
  double v3 = 0.0;
  double v4 = 0.0;
  double v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (BOOL)alwaysUsesLayoutMarginsForHorizontalContentInset
{
  return 0;
}

- (double)tableViewIndexWidth
{
  return 0.0;
}

- (double)searchFieldHeight
{
  return 0.0;
}

- (double)scopeBarHeight
{
  return 0.0;
}

- (double)defaultHeightForOrientation:(int64_t)a3
{
  return 0.0;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3 = *MEMORY[0x1E4F1DB30];
  double v4 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)intrinsicContentSize
{
  double v2 = -1.0;
  double v3 = -1.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (double)defaultInactiveSearchFieldWidth
{
  return 0.0;
}

- (double)defaultActiveSearchFieldWidth
{
  return 0.0;
}

- (_UINavigationBarTitleViewDataSource)navBarTitleViewDataSource
{
  return 0;
}

- (int64_t)navBarTitleViewLocation
{
  return 1;
}

- (_UINavigationBarTitleViewOverlayRects)navBarTitleViewOverlayRects
{
  return 0;
}

- (BOOL)drawsBackgroundInPalette
{
  return 0;
}

- (BOOL)backgroundLayoutNeedsUpdate
{
  return 0;
}

- (BOOL)allowsInlineScopeBar
{
  return 0;
}

- (BOOL)shouldCombineLandscapeBarsForOrientation:(int64_t)a3
{
  return 0;
}

- (BOOL)wouldCombineLandscapeBarsForSize:(CGSize)a3
{
  return 0;
}

- (int64_t)barMetricsForOrientation:(int64_t)a3
{
  return 0;
}

- (double)barHeightForBarMetrics:(int64_t)a3
{
  return 0.0;
}

- (double)barHeightForBarMetrics:(int64_t)a3 withEffectiveInsets:(UIEdgeInsets)a4
{
  return 0.0;
}

- (double)barHeightForBarMetrics:(int64_t)a3 barPosition:(int64_t)a4
{
  return 0.0;
}

- (double)navigationBarContentHeight
{
  return 0.0;
}

- (UIBarButtonItem)animatedAppearanceBarButtonItem
{
  return 0;
}

- (UINavigationItem)searchNavigationItem
{
  return 0;
}

- (id)searchDisplayController
{
  return 0;
}

- (id)makeShadowView
{
  return 0;
}

- (BOOL)wantsDictationButton
{
  return 0;
}

- (BOOL)isInBarButNotHosted
{
  return 0;
}

- (void)setSearchBar:(id)a3
{
  self->_searchBar = (UISearchBar *)a3;
}

- (void)setVisualProviderType:(int)a3
{
  self->_visualProviderType = a3;
}

- (void)setOverrideInlineInactiveWidth:(double)a3
{
  self->_overrideInlineInactiveWidth = a3;
}

- (void)setOverrideInlineActiveWidth:(double)a3
{
  self->_overrideInlineActiveWidth = a3;
}

@end