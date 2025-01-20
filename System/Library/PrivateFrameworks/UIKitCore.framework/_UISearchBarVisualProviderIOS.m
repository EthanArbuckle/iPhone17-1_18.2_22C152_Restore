@interface _UISearchBarVisualProviderIOS
- (BOOL)_getNavigationTitleLeadingInset:(double *)a3 trailingInset:(double *)a4 isRTL:(BOOL)a5;
- (BOOL)allowsInlineScopeBar;
- (BOOL)alwaysUsesLayoutMarginsForHorizontalContentInset;
- (BOOL)autoDisableCancelButton;
- (BOOL)backgroundLayoutNeedsUpdate;
- (BOOL)canShowDictationButton;
- (BOOL)centerPlaceholder;
- (BOOL)containsScopeBar;
- (BOOL)drawsBackground;
- (BOOL)drawsBackgroundInPalette;
- (BOOL)hasDarkUIAppearance;
- (BOOL)isActiveSearchDeferringScopeBar;
- (BOOL)isAtTop;
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
- (BOOL)isTranslucent;
- (BOOL)providesRestingMeasurementValues;
- (BOOL)reliesOnNavigationBarBackdrop;
- (BOOL)requiresSearchTextField;
- (BOOL)scopeBarIsVisible;
- (BOOL)searchFieldContainerViewNeedsLayoutForTransitionFromLayoutState:(id)a3 toLayout:(id)a4;
- (BOOL)shouldCombineLandscapeBarsForOrientation:(int64_t)a3;
- (BOOL)showsBookmarkButton;
- (BOOL)showsCancelButton;
- (BOOL)showsScopeBar;
- (BOOL)showsSearchResultsButton;
- (BOOL)supportsDynamicType;
- (BOOL)usesBackdrop;
- (BOOL)usesEmbeddedAppearance;
- (BOOL)wantsDictationButton;
- (BOOL)wouldCombineLandscapeBarsForSize:(CGSize)a3;
- (CGRect)boundsForSearchBarAndUpdateIfNecessaryFromSuggestedBounds:(CGRect)a3;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (UIEdgeInsets)defaultScopeBarInsets;
- (UIEdgeInsets)effectiveContentInset;
- (UIEdgeInsets)minimumContentInset;
- (UIEdgeInsets)recalculatedEffectiveContentInsetForLayoutState:(int64_t)a3;
- (UIEdgeInsets)recalculatedEffectiveContentInsetForLayoutState:(int64_t)a3 forcingInlineCalculation:(BOOL)a4;
- (UIEdgeInsets)scopeBarInsets;
- (UIOffset)searchFieldBackgroundPositionAdjustment;
- (UIView)floatingSearchIconBackgroundView;
- (UIView)searchFieldContainerView;
- (_UISearchBarLayout)currentLayout;
- (_UISearchBarLayout)prospectiveLayout;
- (_UISearchBarTransitionerBase)transitioner;
- (_UISearchBarVisualProviderIOS)initWithDelegate:(id)a3;
- (double)additionalPaddingForCancelButtonAtLeadingEdge;
- (double)additionalPaddingForSearchFieldAtLeadingEdge;
- (double)allowedHeightInNavigationContentView;
- (double)availableBoundsWidth;
- (double)availableBoundsWidthForSize:(CGSize)a3;
- (double)backgroundExtension;
- (double)barHeightForBarMetrics:(int64_t)a3;
- (double)barHeightForBarMetrics:(int64_t)a3 barPosition:(int64_t)a4;
- (double)barHeightForBarMetrics:(int64_t)a3 withEffectiveInsets:(UIEdgeInsets)a4;
- (double)defaultActiveSearchFieldWidth;
- (double)defaultHeightForOrientation:(int64_t)a3;
- (double)defaultInactiveSearchFieldWidth;
- (double)effectiveBackgroundExtension;
- (double)hostedScopeBarHeightForBarMetrics:(int64_t)a3;
- (double)hostedScopeBarTopInsetForBarMetrics:(int64_t)a3;
- (double)idealInlineWidthForLayoutState:(int64_t)a3;
- (double)leftInsetForInlineSearch;
- (double)minimumHorizontalMargin;
- (double)navigationBarContentHeight;
- (double)rightInsetForInlineSearch;
- (double)scopeBarHeight;
- (double)searchFieldHeight;
- (double)tableViewIndexWidth;
- (id)animatedAppearanceBarButtonItem;
- (id)backdrop;
- (id)backdropVisualEffectView;
- (id)backgroundImageForBarPosition:(int64_t)a3 barMetrics:(int64_t)a4;
- (id)barTintColor;
- (id)cancelBarButtonItem;
- (id)cancelBarButtonItemIfExists;
- (id)cancelButton;
- (id)cancelButtonText;
- (id)colorForComponent:(unint64_t)a3 disabled:(BOOL)a4;
- (id)currentSeparatorImage;
- (id)description;
- (id)effectiveBarTintColor;
- (id)existingSearchIconBarButtonItem;
- (id)floatingSearchIconView;
- (id)floatingSearchIconViewIfExists;
- (id)floatingSearchIconViewSuitableForMeasuring;
- (id)imageForSearchBarIcon:(int64_t)a3 state:(unint64_t)a4;
- (id)internalImageForSearchBarIcon:(int64_t)a3 state:(unint64_t)a4;
- (id)internalImageForSearchBarIcon:(int64_t)a3 state:(unint64_t)a4 customImage:(BOOL *)a5;
- (id)leftButton;
- (id)leftButtonIfExists;
- (id)makeShadowView;
- (id)navBarTitleViewDataSource;
- (id)navBarTitleViewOverlayRects;
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
- (id)searchIconBarButtonItem;
- (id)searchNavigationItem;
- (id)separator;
- (id)separatorImage;
- (id)shadowView;
- (id)textColor;
- (id)viewStackedInNavigationBar;
- (int)visualProviderType;
- (int64_t)backdropStyle;
- (int64_t)barMetricsForOrientation:(int64_t)a3;
- (int64_t)barPosition;
- (int64_t)barStyle;
- (int64_t)barTranslucence;
- (int64_t)layoutState;
- (int64_t)navBarTitleViewLocation;
- (int64_t)previousLayoutState;
- (int64_t)searchFieldLeftViewMode;
- (int64_t)selectedScope;
- (unint64_t)scopeBarPosition;
- (unint64_t)searchBarStyle;
- (void)_establishScopeBarInSearchBarIfNecessary;
- (void)_resetScopeBarFlagsAfterCompleteOrCancelTransition;
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
- (void)animateShowsScopeBarAnimatingOut:(void *)a1;
- (void)animateTransitionToSearchLayoutState:(int64_t)a3;
- (void)applySearchBarStyle;
- (void)cancelTransitionToSearchLayoutState:(int64_t)a3;
- (void)cleanUpDictationMicsWithSearchField:(id)a3;
- (void)completeTransitionToSearchLayoutState:(int64_t)a3;
- (void)configureLayout:(id)a3;
- (void)configureLayout:(id)a3 forState:(int64_t)a4;
- (void)destroyCancelButton;
- (void)destroyPromptLabel;
- (void)dictationAvailabilityDidChange:(id)a3;
- (void)dictationButtonPressed:(id)a3 withEvent:(id)a4;
- (void)dictationControllerDidFinish:(id)a3;
- (void)displayNavBarCancelButton:(BOOL)a3 animated:(BOOL)a4;
- (void)driveTransitionToSearchLayoutState:(int64_t)a3;
- (void)effectiveBarTintColorDidChange:(BOOL)a3;
- (void)freezeForAnimatedTransitionToSearchLayoutState:(int64_t)a3;
- (void)getDefaultTopInset:(double *)a3 bottomInset:(double *)a4;
- (void)getNavigationBarHostedTopInset:(double *)a3 bottomInset:(double *)a4 forActive:(BOOL)a5 isCompact:(BOOL)a6;
- (void)getOverrideContentInsets:(UIEdgeInsets *)a3 overriddenEdges:(unint64_t *)a4;
- (void)getTopAttachedTopInset:(double *)a3 bottomInset:(double *)a4 isCompact:(BOOL)a5;
- (void)getTopInset:(double *)a3 bottomInset:(double *)a4 forBarMetrics:(int64_t)a5 barPosition:(int64_t)a6;
- (void)getTopInset:(double *)a3 bottomInset:(double *)a4 forBarMetrics:(int64_t)a5 barPosition:(int64_t)a6 layoutState:(int64_t)a7;
- (void)getTopInset:(double *)a3 bottomInset:(double *)a4 forBarMetrics:(int64_t)a5 barPosition:(int64_t)a6 layoutState:(int64_t)a7 forcingInlineCalculation:(BOOL)a8;
- (void)growToSearchFieldIfNecessary;
- (void)invalidateLayout;
- (void)layoutBackgroundViewConsideringTopBarStatusAndChangedHeight:(BOOL)a3;
- (void)layoutSubviews;
- (void)layoutSubviewsInBounds:(CGRect)a3;
- (void)navigationBarSlideTransitionDidEnd;
- (void)navigationBarSlideTransitionWillBegin;
- (void)navigationBarTransitionCompleted:(int64_t)a3 willBeDisplayed:(BOOL)a4;
- (void)navigationBarTransitionWillBegin:(int64_t)a3 willBeDisplayed:(BOOL)a4;
- (void)prepare;
- (void)prepareForTransitionToSearchLayoutState:(int64_t)a3;
- (void)removeBackdropVisualEffectView;
- (void)removeLegacyBackdropView;
- (void)resetLayoutState;
- (void)revertViewHierarchyIfNecessary;
- (void)setActiveSearchDeferringScopeBar:(BOOL)a3;
- (void)setAdditionalPaddingForCancelButtonAtLeadingEdge:(double)a3;
- (void)setAdditionalPaddingForSearchFieldAtLeadingEdge:(double)a3;
- (void)setAutoDisableCancelButton:(BOOL)a3;
- (void)setBackdrop:(id)a3;
- (void)setBackdropStyle:(int64_t)a3;
- (void)setBackdropVisualEffectView:(id)a3;
- (void)setBackgroundExtension:(double)a3;
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
- (void)setCurrentLayout:(id)a3;
- (void)setDeferredAutomaticShowsScopeBarInNavigationBar:(id)a3 hasContent:(BOOL)a4;
- (void)setDelegateSearchFieldFrameManipulationBlock:(id)a3;
- (void)setDisableDictationButton:(BOOL)a3;
- (void)setDrawsBackground:(BOOL)a3;
- (void)setDrawsBackgroundInPalette:(BOOL)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setEnabled:(BOOL)a3 animated:(BOOL)a4;
- (void)setHostedByNavigationBar:(BOOL)a3;
- (void)setHostedInlineByNavigationBar:(BOOL)a3;
- (void)setImage:(id)a3 forSearchBarIcon:(int64_t)a4 state:(unint64_t)a5;
- (void)setInNavigationPalette:(BOOL)a3;
- (void)setLayoutCustomizationDelegateSearchFieldContainerWillLayoutSubviewsCallback:(id)a3;
- (void)setLeftInsetForInlineSearch:(double)a3;
- (void)setMinimumContentInset:(UIEdgeInsets)a3;
- (void)setNavBarTitleViewDataSource:(id)a3;
- (void)setNavBarTitleViewLocation:(int64_t)a3;
- (void)setNavBarTitleViewOverlayRects:(id)a3;
- (void)setOverrideContentInsets:(UIEdgeInsets)a3 forRectEdges:(unint64_t)a4;
- (void)setPlacedInNavigationBar:(BOOL)a3;
- (void)setPlacedInToolbar:(BOOL)a3;
- (void)setPrompt:(id)a3;
- (void)setPromptLabel:(id)a3;
- (void)setProspectiveLayout:(id)a3;
- (void)setProvidesRestingMeasurementValues:(BOOL)a3;
- (void)setReliesOnNavigationBarBackdrop:(BOOL)a3;
- (void)setRequiresSearchTextField:(BOOL)a3;
- (void)setRightInsetForInlineSearch:(double)a3;
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
- (void)setShowDictationButton:(BOOL)a3 shouldUpdateView:(BOOL)a4;
- (void)setShowsBookmarkButton:(BOOL)a3;
- (void)setShowsCancelButton:(BOOL)a3;
- (void)setShowsCancelButton:(BOOL)a3 animated:(BOOL)a4;
- (void)setShowsDeleteButton:(BOOL)a3;
- (void)setShowsScopeBar:(BOOL)a3;
- (void)setShowsScopeBar:(BOOL)a3 animateOpacity:(BOOL)a4;
- (void)setShowsSearchResultsButton:(BOOL)a3;
- (void)setShowsSeparator:(BOOL)a3;
- (void)setTableViewIndexWidth:(double)a3;
- (void)setTextFieldManagedInNSToolbar:(BOOL)a3;
- (void)setTransitioner:(id)a3;
- (void)setUpCancelButton;
- (void)setUpCancelButtonWithAppearance:(id)a3;
- (void)setUpDictationMicWithSearchField:(id)a3;
- (void)setUpFloatingSearchIconView;
- (void)setUpLeftButton;
- (void)setUpPromptLabel;
- (void)setUpScopeBar;
- (void)setUpSearchBarSearchContainerIfNecessary;
- (void)setUpSearchField;
- (void)setUpSearchNavigationItem;
- (void)setUsesEmbeddedAppearance:(BOOL)a3;
- (void)shrinkToButtonIfNecessary;
- (void)teardown;
- (void)updateBackgroundToBackdropStyle:(int64_t)a3;
- (void)updateCancelButtonForDynamicType;
- (void)updateDictationButtonActiveState;
- (void)updateDictationButtonForDynamicTypeWithSearchField:(id)a3;
- (void)updateEffectiveContentInset;
- (void)updateForAllowedToShowDictationChange;
- (void)updateForDrawsBackgroundInPalette;
- (void)updateForDynamicType;
- (void)updateIfNecessaryForOldSize:(CGSize)a3;
- (void)updateMagnifyingGlassView;
- (void)updateNavigationBarLayoutInsertDataForSearchBar:(id)a3 collapsibleScopeBar:(id)a4 forLayoutState:(int64_t)a5;
- (void)updateNeedForBackdrop;
- (void)updatePlaceholderColor;
- (void)updateRightView;
- (void)updateScopeBarBackground;
- (void)updateScopeBarForSelectedScope;
- (void)updateSearchBarOpacity;
- (void)updateSearchFieldArt;
- (void)updateSearchFieldControlSize;
- (void)updateSearchFieldForDynamicType;
@end

@implementation _UISearchBarVisualProviderIOS

- (BOOL)isHostedInlineByNavigationBar
{
  return (*((unsigned __int8 *)&self->_searchBarVisualProviderFlags + 3) >> 3) & 1;
}

- (void)configureLayout:(id)a3 forState:(int64_t)a4
{
  location[3] = *(id *)MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [(_UISearchBarVisualProviderBase *)self searchBar];
  if (!v7) {
    goto LABEL_61;
  }
  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  v9 = [v7 _searchController];
  if (a4) {
    BOOL v10 = v9 == 0;
  }
  else {
    BOOL v10 = 0;
  }
  int v11 = v10;

  if (has_internal_diagnostics)
  {
    if (v11)
    {
      v42 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_FAULT))
      {
        if ((unint64_t)(a4 + 1) > 4) {
          v46 = @"Unknown _UISearchBarLayoutState";
        }
        else {
          v46 = off_1E52DF300[a4 + 1];
        }
        LODWORD(location[0]) = 138412290;
        *(id *)((char *)location + 4) = v46;
        _os_log_fault_impl(&dword_1853B0000, v42, OS_LOG_TYPE_FAULT, "When there is no search controller, configuring for %@ may result in broken search bar layout. This is an internal UIKit problem.", (uint8_t *)location, 0xCu);
      }
    }
  }
  else if (v11)
  {
    v43 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &configureLayout_forState____s_category) + 8);
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      if ((unint64_t)(a4 + 1) > 4) {
        v44 = @"Unknown _UISearchBarLayoutState";
      }
      else {
        v44 = off_1E52DF300[a4 + 1];
      }
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = v44;
      v45 = v43;
      _os_log_impl(&dword_1853B0000, v45, OS_LOG_TYPE_ERROR, "When there is no search controller, configuring for %@ may result in broken search bar layout. This is an internal UIKit problem.", (uint8_t *)location, 0xCu);
    }
  }
  [v6 setHostedInlineByNavigationBar:(*(void *)&self->_searchBarVisualProviderFlags >> 27) & 1];
  [v6 setRepresentedLayoutState:a4];
  objc_msgSend(v6, "setBarMetrics:", -[_UISearchBarVisualProviderIOS barMetricsForOrientation:](self, "barMetricsForOrientation:", objc_msgSend(v7, "_expectedInterfaceOrientation")));
  [(_UISearchBarVisualProviderIOS *)self recalculatedEffectiveContentInsetForLayoutState:a4];
  objc_msgSend(v6, "setContentInset:");
  [v6 setSearchFieldContainer:self->_searchFieldContainerView];
  v12 = [(_UISearchBarVisualProviderIOS *)self searchField];
  [v6 setSearchField:v12];

  [v6 setSearchIconBarButtonItem:self->_searchIconBarButtonItem];
  [(_UISearchBarVisualProviderIOS *)self defaultActiveSearchFieldWidth];
  objc_msgSend(v6, "setDefaultActiveWidth:");
  [(_UISearchBarVisualProviderIOS *)self defaultInactiveSearchFieldWidth];
  objc_msgSend(v6, "setDefaultInactiveWidth:");
  [(_UISearchBarVisualProviderBase *)self overrideInlineInactiveWidth];
  objc_msgSend(v6, "setOverrideInactiveWidth:");
  [(_UISearchBarVisualProviderBase *)self overrideInlineActiveWidth];
  objc_msgSend(v6, "setOverrideActiveWidth:");
  if (a4 == 1)
  {
    if ([v6 isProspective]) {
      [(_UISearchBarVisualProviderIOS *)self floatingSearchIconViewSuitableForMeasuring];
    }
    else {
    v14 = [(_UISearchBarVisualProviderIOS *)self floatingSearchIconView];
    }
    [v6 setFloatingSearchIconView:v14];

    v15 = [(_UISearchBarVisualProviderIOS *)self floatingSearchIconBackgroundView];
    [v6 setHasFloatingSearchIconBackgroundView:v15 != 0];

    v16 = [(_UISearchBarVisualProviderIOS *)self floatingSearchIconBackgroundView];
    [v6 setFloatingSearchIconBackgroundView:v16];
  }
  else
  {
    [v6 setFloatingSearchIconView:self->_floatingSearchIconView];
    if (!a4)
    {
      char v13 = 1;
      goto LABEL_19;
    }
  }
  v17 = [v7 _searchController];
  char v18 = [v17 automaticallyShowsCancelButton];

  char v13 = 0;
  if (v18)
  {
    uint64_t v19 = (unint64_t)(a4 - 3) < 0xFFFFFFFFFFFFFFFELL;
    goto LABEL_20;
  }
LABEL_19:
  uint64_t v19 = (*(_DWORD *)&self->_searchBarVisualProviderFlags >> 18) & 1;
LABEL_20:
  [v6 setHasCancelButton:v19];
  if ((*((unsigned char *)&self->_searchBarVisualProviderFlags + 2) & 0x10) != 0)
  {
    [v6 setHasDeleteButton:1];
    [v6 setHasCancelButton:0];
    [v6 setCancelButton:0];
    [v6 setDeleteButton:self->_cancelButton];
  }
  else
  {
    [v6 setHasDeleteButton:0];
    [v6 setDeleteButton:0];
    [v6 setCancelButton:self->_cancelButton];
  }
  [v6 setHasLeftButton:self->_leftButton != 0];
  [v6 setLeftButton:self->_leftButton];
  if (v13)
  {
    if (![(_UISearchBarVisualProviderIOS *)self isTextFieldManagedInNSToolbar]) {
      goto LABEL_34;
    }
LABEL_32:
    BOOL v23 = 0;
    goto LABEL_36;
  }
  uint64_t v20 = [v7 _searchController];
  v21 = (void *)v20;
  if (v20)
  {
    unint64_t v22 = ((unint64_t)*(unsigned int *)(v20 + 1052) >> 5) & 3;
    if (!v22)
    {
      if (dyld_program_sdk_at_least()) {
        unint64_t v22 = 2;
      }
      else {
        unint64_t v22 = 3;
      }
    }
  }
  else
  {
    unint64_t v22 = 0;
  }

  if ([(_UISearchBarVisualProviderIOS *)self isTextFieldManagedInNSToolbar]) {
    goto LABEL_32;
  }
  if (v22 != 1)
  {
    int v24 = a4 != 2 && (*((unsigned char *)&self->_searchBarVisualProviderFlags + 3) & 0x80) == 0;
    goto LABEL_35;
  }
LABEL_34:
  int v24 = (*(_DWORD *)&self->_searchBarVisualProviderFlags >> 30) & 1;
LABEL_35:
  BOOL v23 = v24 != 0;
LABEL_36:
  NSUInteger v25 = [(NSArray *)self->_scopeTitles count];
  if (v25) {
    BOOL v26 = v23;
  }
  else {
    BOOL v26 = 0;
  }
  [v6 setHasScopeBar:v26];
  [v6 setNumberOfScopeTitles:v25];
  [(_UISearchBarVisualProviderIOS *)self defaultScopeBarInsets];
  objc_msgSend(v6, "setDefaultScopeBarInsets:");
  objc_initWeak(location, self);
  v52[0] = MEMORY[0x1E4F143A8];
  v52[1] = 3221225472;
  v52[2] = __58___UISearchBarVisualProviderIOS_configureLayout_forState___block_invoke;
  v52[3] = &unk_1E52DF2E0;
  objc_copyWeak(&v53, location);
  [v6 setHostedScopeBarHeightForBarMetrics:v52];
  uint64_t v47 = MEMORY[0x1E4F143A8];
  uint64_t v48 = 3221225472;
  v49 = __58___UISearchBarVisualProviderIOS_configureLayout_forState___block_invoke_2;
  v50 = &unk_1E52DF2E0;
  objc_copyWeak(&v51, location);
  [v6 setHostedScopeBarTopInsetForBarMetrics:&v47];
  objc_msgSend(v6, "setScopeBarContainer:", self->_scopeBarContainerView, v47, v48, v49, v50);
  [v6 setScopeBar:self->_scopeBar];
  [v6 setHasSearchBarBackground:self->_searchBarBackground != 0];
  [(_UISearchBarVisualProviderIOS *)self effectiveBackgroundExtension];
  objc_msgSend(v6, "setBackgroundExtension:");
  [v6 setSearchBarBackground:self->_searchBarBackground];
  objc_msgSend(v6, "setHasSearchBarBackdrop:", -[_UISearchBarVisualProviderIOS usesBackdrop](self, "usesBackdrop"));
  backdropVisualEffectView = self->_backdropVisualEffectView;
  if (!backdropVisualEffectView) {
    backdropVisualEffectView = self->_backdrop;
  }
  [v6 setSearchBarBackdrop:backdropVisualEffectView];
  [v6 setHasSeparator:self->_separator != 0];
  [v6 setSeparator:self->_separator];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navBarTitleViewDataSource);
  if (WeakRetained || (*((unsigned char *)&self->_searchBarVisualProviderFlags + 3) & 5) != 0)
  {
  }
  else
  {
    v40 = [(_UISearchBarVisualProviderIOS *)self prompt];
    BOOL v41 = [v40 length] == 0;

    if (!v41)
    {
      [v6 setHasPromptLabel:1];
      [(_UISearchBarVisualProviderIOS *)self setUpPromptLabel];
      [v6 setPromptContainer:self->_promptContainerView];
      [v7 addSubview:self->_promptContainerView];
      goto LABEL_45;
    }
  }
  [v6 setHasPromptLabel:0];
  [v6 setPromptContainer:0];
  [(UIView *)self->_promptContainerView removeFromSuperview];
LABEL_45:
  if (a4 == 3) {
    uint64_t v29 = 0;
  }
  else {
    uint64_t v29 = (*(void *)&self->_searchBarVisualProviderFlags >> 26) & 1;
  }
  [v6 setAllowSearchFieldShrinkage:v29];
  v30 = [(_UISearchBarAppearanceStorage *)self->_appearanceStorage searchFieldBackgroundImageForState:0];
  [v6 setSearchFieldUsesCustomBackgroundImage:v30 != 0];

  objc_msgSend(v6, "setSearchFieldEffectivelySupportsDynamicType:", objc_msgSend(v7, "_effectivelySupportsDynamicType"));
  v31 = [(UITextField *)self->_searchField font];
  [v6 setSearchFieldFont:v31];

  [v6 setLayoutRTL:((unint64_t)v7[28] >> 19) & 1];
  if ([(_UISearchBarVisualProviderIOS *)self isInBarButNotHosted])
  {
    v32 = +[UIDevice currentDevice];
    uint64_t v33 = [v32 userInterfaceIdiom];

    if ((v33 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
      goto LABEL_51;
    }
  }
  v34 = [v7 traitCollection];
  BOOL v35 = [v34 userInterfaceIdiom] == 6;

  if (v35) {
LABEL_51:
  }
    [v6 setHasCancelButton:0];
  [v6 setHostedByNavigationBar:(*(void *)&self->_searchBarVisualProviderFlags >> 26) & 1];
  [v6 setTextFieldManagedInNSToolbar:(*(void *)&self->_searchBarVisualProviderFlags >> 28) & 1];
  [v6 setSearchBarReadableWidth:_UIViewReadableWidthForView(v7)];
  double leftInsetForInlineSearch = 0.0;
  if (self->_layoutState == 1)
  {
    double rightInsetForInlineSearch = 0.0;
  }
  else
  {
    double rightInsetForInlineSearch = 0.0;
    if ((*((unsigned char *)&self->_searchBarVisualProviderFlags + 3) & 8) != 0)
    {
      double leftInsetForInlineSearch = self->_leftInsetForInlineSearch;
      double rightInsetForInlineSearch = self->_rightInsetForInlineSearch;
    }
  }
  [v6 leftContentInsetForInlineSearch];
  if (v38 != leftInsetForInlineSearch
    || ([v6 rightContentInsetForInlineSearch], v39 != rightInsetForInlineSearch))
  {
    [v6 setLeftContentInsetForInlineSearch:leftInsetForInlineSearch];
    [v6 setRightContentInsetForInlineSearch:rightInsetForInlineSearch];
    if (([v6 isProspective] & 1) == 0)
    {
      [v7 setNeedsLayout];
      [(_UISearchBarSearchContainerView *)self->_searchFieldContainerView setNeedsLayout];
    }
  }
  objc_destroyWeak(&v51);
  objc_destroyWeak(&v53);
  objc_destroyWeak(location);
LABEL_61:
}

- (id)searchField
{
  searchField = self->_searchField;
  if (!searchField)
  {
    [(_UISearchBarVisualProviderIOS *)self setUpSearchField];
    searchField = self->_searchField;
  }
  return searchField;
}

- (UIEdgeInsets)recalculatedEffectiveContentInsetForLayoutState:(int64_t)a3 forcingInlineCalculation:(BOOL)a4
{
  BOOL v4 = a4;
  v7 = [(_UISearchBarVisualProviderBase *)self searchBar];
  v8 = v7;
  if (!v7)
  {
    double right = 0.0;
    double bottom = 0.0;
    double left = 0.0;
    double top = 0.0;
    goto LABEL_45;
  }
  double v42 = 0.0;
  double v43 = 0.0;
  uint64_t v9 = [v7 effectiveUserInterfaceLayoutDirection];
  if (![(_UISearchBarVisualProviderIOS *)self _getNavigationTitleLeadingInset:&v43 trailingInset:&v42 isRTL:v9 == 1])
  {
    $3CCFBAC33A89B83EF2A602DE1312B683 searchBarVisualProviderFlags = self->_searchBarVisualProviderFlags;
    if ((*(_DWORD *)&searchBarVisualProviderFlags & 0x3000000) == 0)
    {
      if ((*(_DWORD *)&searchBarVisualProviderFlags & 0x4000000) != 0)
      {
        v21 = [v8 _searchController];
        unint64_t v22 = [v21 _navigationItemCurrentlyDisplayingSearchController];
        BOOL v23 = [v22 _navigationBar];

        if (v23) {
          [v23 _resolvedSearchBarMargins];
        }
        else {
          [v8 directionalLayoutMargins];
        }
        double v42 = v25;
        double v43 = v24;
      }
      else
      {
        if ([(_UISearchBarVisualProviderIOS *)self alwaysUsesLayoutMarginsForHorizontalContentInset])
        {
          [v8 directionalLayoutMargins];
          double v12 = v11;
          double v43 = v13;
          double tableViewIndexWidth = self->_tableViewIndexWidth;
          [(_UISearchBarVisualProviderIOS *)self minimumHorizontalMargin];
          double v16 = tableViewIndexWidth + v15;
          if (v12 >= v16) {
            double v16 = v12;
          }
        }
        else
        {
          double v26 = self->_tableViewIndexWidth;
          if (v26 <= 0.0)
          {
            [v8 safeAreaInsets];
            if (v9 == 1) {
              double v30 = v29;
            }
            else {
              double v30 = v28;
            }
            double v43 = v30;
            if (v9 == 1) {
              double v16 = v28;
            }
            else {
              double v16 = v29;
            }
          }
          else
          {
            [(_UISearchBarVisualProviderIOS *)self minimumHorizontalMargin];
            double v16 = v26 + v27;
          }
        }
        double v42 = v16;
      }
      double v31 = v43;
      [(_UISearchBarVisualProviderIOS *)self minimumHorizontalMargin];
      if (v31 >= v32) {
        double v32 = v31;
      }
      double v43 = v32;
      double v33 = v42;
      [(_UISearchBarVisualProviderIOS *)self minimumHorizontalMargin];
      if (v33 >= v34) {
        double v34 = v33;
      }
      double v42 = v34;
    }
  }
  double v41 = 0.0;
  -[_UISearchBarVisualProviderIOS getTopInset:bottomInset:forBarMetrics:barPosition:layoutState:forcingInlineCalculation:](self, "getTopInset:bottomInset:forBarMetrics:barPosition:layoutState:forcingInlineCalculation:", &v41, &v40, -[_UISearchBarVisualProviderIOS barMetricsForOrientation:](self, "barMetricsForOrientation:", objc_msgSend(v8, "_expectedInterfaceOrientation", 0)), self->_barPosition, a3, v4);
  double top = v41;
  if (v9 == 1) {
    double left = v42;
  }
  else {
    double left = v43;
  }
  double bottom = v40;
  if (v9 == 1) {
    double right = v43;
  }
  else {
    double right = v42;
  }
  unint64_t overriddenContentInsetEdges = self->_overriddenContentInsetEdges;
  if (!overriddenContentInsetEdges)
  {
    double top = fmax(v41, self->_contentInsetPrivateMinOrOverride.top);
    double left = fmax(left, self->_contentInsetPrivateMinOrOverride.left);
    double bottom = fmax(v40, self->_contentInsetPrivateMinOrOverride.bottom);
    double right = fmax(right, self->_contentInsetPrivateMinOrOverride.right);
    goto LABEL_45;
  }
  if ((overriddenContentInsetEdges & 1) == 0)
  {
    if ((overriddenContentInsetEdges & 2) == 0) {
      goto LABEL_37;
    }
LABEL_42:
    double left = self->_contentInsetPrivateMinOrOverride.left;
    if ((overriddenContentInsetEdges & 4) == 0)
    {
LABEL_38:
      if ((overriddenContentInsetEdges & 8) == 0) {
        goto LABEL_45;
      }
      goto LABEL_44;
    }
    goto LABEL_43;
  }
  double top = self->_contentInsetPrivateMinOrOverride.top;
  if ((overriddenContentInsetEdges & 2) != 0) {
    goto LABEL_42;
  }
LABEL_37:
  if ((overriddenContentInsetEdges & 4) == 0) {
    goto LABEL_38;
  }
LABEL_43:
  double bottom = self->_contentInsetPrivateMinOrOverride.bottom;
  if ((overriddenContentInsetEdges & 8) != 0) {
LABEL_44:
  }
    double right = self->_contentInsetPrivateMinOrOverride.right;
LABEL_45:

  double v36 = top;
  double v37 = left;
  double v38 = bottom;
  double v39 = right;
  result.double right = v39;
  result.double bottom = v38;
  result.double left = v37;
  result.double top = v36;
  return result;
}

- (double)minimumHorizontalMargin
{
  return 8.0;
}

- (int64_t)barMetricsForOrientation:(int64_t)a3
{
  v5 = [(_UISearchBarVisualProviderBase *)self searchBar];
  if (!v5)
  {
    int64_t v9 = 0;
    goto LABEL_14;
  }
  id v6 = [(UILabel *)self->_promptLabel text];
  uint64_t v7 = [v6 length];

  if ((unint64_t)(a3 - 1) <= 1 || (*((unsigned char *)&self->_searchBarVisualProviderFlags + 3) & 1) == 0) {
    goto LABEL_11;
  }
  v8 = [v5 traitCollection];
  if ([v8 userInterfaceIdiom] == 1)
  {

    goto LABEL_11;
  }
  BOOL v10 = [v5 traitCollection];
  uint64_t v11 = [v10 horizontalSizeClass];

  if (v11 != 1)
  {
LABEL_11:
    if (v7) {
      int64_t v9 = 101;
    }
    else {
      int64_t v9 = 0;
    }
    goto LABEL_14;
  }
  if (v7) {
    int64_t v9 = 102;
  }
  else {
    int64_t v9 = 1;
  }
LABEL_14:

  return v9;
}

- (void)getTopInset:(double *)a3 bottomInset:(double *)a4 forBarMetrics:(int64_t)a5 barPosition:(int64_t)a6 layoutState:(int64_t)a7 forcingInlineCalculation:(BOOL)a8
{
  BOOL v8 = a8;
  double v15 = [(_UISearchBarVisualProviderBase *)self searchBar];
  if (v15)
  {
    BOOL v17 = a5 == 1 || a5 == 102;
    $3CCFBAC33A89B83EF2A602DE1312B683 searchBarVisualProviderFlags = self->_searchBarVisualProviderFlags;
    id v31 = v15;
    if ((*(_DWORD *)&searchBarVisualProviderFlags & 0x8000000) != 0 || v8)
    {
      [(_UISearchBarVisualProviderIOS *)self allowedHeightInNavigationContentView];
      double v20 = v19;
      v21 = [(_UISearchBarVisualProviderIOS *)self transitioner];
      unint64_t v22 = [v21 activeLayout];
      currentLayout = v22;
      if (!v22) {
        currentLayout = self->_currentLayout;
      }
      double v24 = currentLayout;

      [(_UISearchBarLayout *)v24 naturalSearchFieldHeight];
      double v26 = v25;

      UIFloorToViewScale(v31);
      double v15 = v31;
      double v28 = fmax(v27, 0.0);
      *a3 = v28;
      *a4 = fmax(v20 - v28 - v26, 0.0);
    }
    else
    {
      if ((*(_DWORD *)&searchBarVisualProviderFlags & 0x4000000) != 0)
      {
        if (a7 == 3)
        {
          double v29 = [v15 _searchController];
          uint64_t v30 = [v29 hidesNavigationBarDuringPresentation];
        }
        else
        {
          uint64_t v30 = 0;
        }
        [(_UISearchBarVisualProviderIOS *)self getNavigationBarHostedTopInset:a3 bottomInset:a4 forActive:v30 isCompact:v17];
      }
      else if (a6 == 3)
      {
        [(_UISearchBarVisualProviderIOS *)self getTopAttachedTopInset:a3 bottomInset:a4 isCompact:v17];
      }
      else
      {
        [(_UISearchBarVisualProviderIOS *)self getDefaultTopInset:a3 bottomInset:a4];
      }
      double v15 = v31;
    }
  }
}

- (BOOL)_getNavigationTitleLeadingInset:(double *)a3 trailingInset:(double *)a4 isRTL:(BOOL)a5
{
  BOOL v5 = a5;
  int64_t v9 = [(_UISearchBarVisualProviderBase *)self searchBar];
  BOOL v10 = v9;
  if (v9 && self->_navBarTitleViewLocation && self->_navBarTitleViewOverlayRects)
  {
    [v9 bounds];
    uint64_t v12 = v11;
    uint64_t v14 = v13;
    uint64_t v16 = v15;
    uint64_t v18 = v17;
    [v10 _contentMargin];
    double v56 = v19;
    [v10 safeAreaInsets];
    double v54 = v21;
    double v55 = v20;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __85___UISearchBarVisualProviderIOS__getNavigationTitleLeadingInset_trailingInset_isRTL___block_invoke;
    aBlock[3] = &__block_descriptor_65_e39_d40__0_CGRect__CGPoint_dd__CGSize_dd__8l;
    BOOL v60 = v5;
    aBlock[4] = v12;
    aBlock[5] = v14;
    aBlock[6] = v16;
    aBlock[7] = v18;
    unint64_t v22 = (double (**)(void, double, double, double, double))_Block_copy(aBlock);
    v57[0] = MEMORY[0x1E4F143A8];
    v57[1] = 3221225472;
    v57[2] = __85___UISearchBarVisualProviderIOS__getNavigationTitleLeadingInset_trailingInset_isRTL___block_invoke_2;
    v57[3] = &__block_descriptor_65_e39_d40__0_CGRect__CGPoint_dd__CGSize_dd__8l;
    BOOL v58 = v5;
    v57[4] = v12;
    v57[5] = v14;
    v57[6] = v16;
    v57[7] = v18;
    BOOL v23 = (double (**)(void, double, double, double, double))_Block_copy(v57);
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
    v61.origin.double x = x;
    v61.origin.double y = y;
    v61.size.double width = width;
    v61.size.double height = height;
    if (CGRectIsNull(v61)
      && (v62.origin.double x = v33, v62.origin.y = v35, v62.size.width = v37, v62.size.height = v39, CGRectIsNull(v62)))
    {
      double v40 = v55;
      if (v5) {
        double v40 = v54;
      }
      double v41 = v56 + v40;
    }
    else
    {
      v63.origin.double x = v33;
      v63.origin.double y = v35;
      v63.size.double width = v37;
      v63.size.double height = v39;
      if (!CGRectIsNull(v63))
      {
        v64.origin.double x = x;
        v64.origin.double y = y;
        v64.size.double width = width;
        v64.size.double height = height;
        if (CGRectIsNull(v64))
        {
          double x = v33;
          double y = v35;
          double width = v37;
          double height = v39;
        }
        else
        {
          v65.origin.double x = v33;
          v65.origin.double y = v35;
          v65.size.double width = v37;
          v65.size.double height = v39;
          v68.origin.double x = x;
          v68.origin.double y = y;
          v68.size.double width = width;
          v68.size.double height = height;
          CGRect v66 = CGRectUnion(v65, v68);
          double x = v66.origin.x;
          double y = v66.origin.y;
          double width = v66.size.width;
          double height = v66.size.height;
        }
      }
      double v43 = v22[2](v22, x, y, width, height);
      [(_UISearchBarVisualProviderIOS *)self minimumHorizontalMargin];
      double v41 = v43 + v44;
    }
    *a3 = v41;
    [(_UINavigationBarTitleViewOverlayRects *)self->_navBarTitleViewOverlayRects trailingItemsRect];
    double v45 = v67.origin.x;
    double v46 = v67.origin.y;
    double v47 = v67.size.width;
    double v48 = v67.size.height;
    if (CGRectIsNull(v67))
    {
      double v49 = v55;
      if (!v5) {
        double v49 = v54;
      }
      double v50 = v56 + v49;
    }
    else
    {
      double v51 = v23[2](v23, v45, v46, v47, v48);
      [(_UISearchBarVisualProviderIOS *)self minimumHorizontalMargin];
      double v50 = v51 + v52;
    }
    *a4 = v50;

    BOOL v42 = 1;
  }
  else
  {
    BOOL v42 = 0;
  }

  return v42;
}

- (UIEdgeInsets)recalculatedEffectiveContentInsetForLayoutState:(int64_t)a3
{
  [(_UISearchBarVisualProviderIOS *)self recalculatedEffectiveContentInsetForLayoutState:a3 forcingInlineCalculation:0];
  result.double right = v6;
  result.double bottom = v5;
  result.double left = v4;
  result.double top = v3;
  return result;
}

- (BOOL)usesBackdrop
{
  double v3 = [(UISearchBarBackground *)self->_searchBarBackground backgroundImage];
  if (v3) {
    BOOL v4 = 0;
  }
  else {
    BOOL v4 = (*(void *)&self->_searchBarVisualProviderFlags & 0x38) == 0x10
  }
      && (*(void *)&self->_searchBarVisualProviderFlags & 0x2000) == 0;

  return v4;
}

- (BOOL)isInBarButNotHosted
{
  if ([(_UISearchBarVisualProviderIOS *)self isHostedByNavigationBar])
  {
    LOBYTE(v3) = 0;
  }
  else if (self->_navBarTitleViewLocation {
         || ($3CCFBAC33A89B83EF2A602DE1312B683 searchBarVisualProviderFlags = self->_searchBarVisualProviderFlags,
  }
             (*(_DWORD *)&searchBarVisualProviderFlags & 0x1000000) != 0))
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    return (*(unint64_t *)&searchBarVisualProviderFlags >> 25) & 1;
  }
  return v3;
}

- (BOOL)isHostedByNavigationBar
{
  return (*((unsigned __int8 *)&self->_searchBarVisualProviderFlags + 3) >> 2) & 1;
}

- (void)getNavigationBarHostedTopInset:(double *)a3 bottomInset:(double *)a4 forActive:(BOOL)a5 isCompact:(BOOL)a6
{
  BOOL v6 = a5;
  if (a6)
  {
    BOOL v9 = !a5;
    double v10 = 0.0;
    double v11 = 4.0;
    if (a5) {
      double v10 = 4.0;
    }
    *a3 = v10;
    double v12 = 8.0;
  }
  else
  {
    int v13 = _UIBarsUseNewPadHeights();
    BOOL v9 = !v6;
    double v14 = 1.0;
    if (v13) {
      double v11 = 7.0;
    }
    else {
      double v11 = 8.0;
    }
    if (v6) {
      double v14 = v11;
    }
    *a3 = v14;
    double v12 = 15.0;
  }
  if (!v9) {
    double v12 = v11;
  }
  *a4 = v12;
}

- (BOOL)isTextFieldManagedInNSToolbar
{
  return (*((unsigned __int8 *)&self->_searchBarVisualProviderFlags + 3) >> 4) & 1;
}

- (double)effectiveBackgroundExtension
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  double backgroundExtension = self->_backgroundExtension;
  if (backgroundExtension == 0.0)
  {
    BOOL v3 = [(_UISearchBarVisualProviderBase *)self searchBar];
    if ([v3 barPosition] != 3)
    {
LABEL_16:

      return backgroundExtension;
    }
    BOOL v4 = [v3 window];
    if (!v4) {
      goto LABEL_15;
    }
    double v5 = [v3 _searchController];

    if (v5
      || ([v3 superview],
          BOOL v6 = objc_claimAutoreleasedReturnValue(),
          [v6 safeAreaInsets],
          double backgroundExtension = v7,
          v6,
          backgroundExtension != 0.0))
    {
LABEL_15:

      goto LABEL_16;
    }
    int v8 = [(__CFString *)v4 _isHostedInAnotherProcess];
    BOOL v9 = [(__CFString *)v4 rootViewController];
    double v10 = v9;
    if (v8)
    {
      double v11 = [v9 presentedViewController];
      double v12 = v11;
      if (v11)
      {
        id v13 = v11;
      }
      else
      {
        double v14 = [(__CFString *)v4 rootViewController];
        uint64_t v15 = [v14 childViewControllers];
        id v13 = [v15 firstObject];
      }
      double v10 = v13;
    }
    uint64_t v16 = [v10 _viewControllerForRotation];

    if (v16 && ((v16[94] >> 1) & 3u) - 1 < 2)
    {
      uint64_t v17 = [v16 view];
      [v17 safeAreaInsets];
      double backgroundExtension = v18;

LABEL_14:
      goto LABEL_15;
    }
    if (os_variant_has_internal_diagnostics())
    {
      double v20 = __UIFaultDebugAssertLog();
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
        goto LABEL_26;
      }
      if (v16)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"; viewController is not appearing or appeared: %@",
          v16);
        double v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
        double v24 = v21;
      }
      else
      {
        double v21 = [v3 superview];
        double v24 = &stru_1ED0E84C0;
        if (v21 == v4) {
          double v24 = @". Don't make the search bar a direct subview of the window.";
        }
      }
      *(_DWORD *)buf = 138412290;
      double v26 = v24;
      _os_log_fault_impl(&dword_1853B0000, v20, OS_LOG_TYPE_FAULT, "Failed to find view controller source of information for search bar's background extension%@", buf, 0xCu);
    }
    else
    {
      double v20 = *(id *)(__UILogGetCategoryCachedImpl("Assert", &effectiveBackgroundExtension___s_category)+ 8);
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
LABEL_26:

        [(__CFString *)v4 safeAreaInsets];
        double backgroundExtension = v23;
        goto LABEL_14;
      }
      if (v16)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"; viewController is not appearing or appeared: %@",
          v16);
        double v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
        unint64_t v22 = v21;
      }
      else
      {
        double v21 = [v3 superview];
        unint64_t v22 = &stru_1ED0E84C0;
        if (v21 == v4) {
          unint64_t v22 = @". Don't make the search bar a direct subview of the window.";
        }
      }
      *(_DWORD *)buf = 138412290;
      double v26 = v22;
      _os_log_impl(&dword_1853B0000, v20, OS_LOG_TYPE_ERROR, "Failed to find view controller source of information for search bar's background extension%@", buf, 0xCu);
    }

    goto LABEL_26;
  }
  return backgroundExtension;
}

- (UIEdgeInsets)defaultScopeBarInsets
{
  double v2 = 7.0;
  double v3 = 8.0;
  double v4 = 8.0;
  double v5 = 8.0;
  result.double right = v5;
  result.double bottom = v4;
  result.double left = v3;
  result.double top = v2;
  return result;
}

- (double)defaultInactiveSearchFieldWidth
{
  return 240.0;
}

- (double)defaultActiveSearchFieldWidth
{
  return 280.0;
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

- (double)hostedScopeBarHeightForBarMetrics:(int64_t)a3
{
  BOOL v3 = a3 == 102 || a3 == 1;
  double result = 44.0;
  if (v3) {
    return 32.0;
  }
  return result;
}

- (void)getDefaultTopInset:(double *)a3 bottomInset:(double *)a4
{
  *a3 = 10.0;
  *a4 = 10.0;
}

- (id)prompt
{
  return [(UILabel *)self->_promptLabel text];
}

- (void)updateNavigationBarLayoutInsertDataForSearchBar:(id)a3 collapsibleScopeBar:(id)a4 forLayoutState:(int64_t)a5
{
  double v18 = (double *)a3;
  int v8 = (double *)a4;
  [(_UISearchBarVisualProviderIOS *)self configureLayout:self->_prospectiveLayout forState:a5];
  [(_UISearchBarLayout *)self->_prospectiveLayout naturalTotalHeight];
  double v10 = v9;
  [(_UISearchBarLayout *)self->_prospectiveLayout naturalScopeContainerHeight];
  double v12 = v11;
  if ((*((unsigned char *)&self->_searchBarVisualProviderFlags + 3) & 8) != 0)
  {
    if (v18)
    {
      v18[4] = 0.0;
      v18[5] = 0.0;
    }
    BOOL v16 = [(_UISearchBarLayout *)self->_prospectiveLayout hasScopeBar];
    if (v8)
    {
      double v17 = 0.0;
      if (v16) {
        double v17 = v12;
      }
      v8[4] = v17;
      v8[5] = v17;
      goto LABEL_20;
    }
  }
  else
  {
    if ([(_UISearchBarLayout *)self->_prospectiveLayout hasScopeBar])
    {
      if (v18)
      {
        v18[4] = v10 - v12;
        v18[5] = v10 - v12;
      }
      if (v8)
      {
        v8[4] = v12;
        v8[5] = v12;
      }
      id v13 = [(_UISearchBarVisualProviderBase *)self searchBar];
      double v14 = [v13 traitCollection];
      uint64_t v15 = [v14 verticalSizeClass];
      if (v8) {
        *((unsigned char *)v8 + 8) = (v15 == 1) | (2 * (v15 == 1)) | (_BYTE)v8[1] & 0xFC;
      }

      goto LABEL_21;
    }
    if (v18)
    {
      v18[4] = v10;
      v18[5] = v10;
    }
    if (v8)
    {
      v8[4] = 0.0;
      v8[5] = 0.0;
LABEL_20:
      *((unsigned char *)v8 + 8) &= ~1u;
    }
  }
LABEL_21:
}

- (BOOL)centerPlaceholder
{
  return (*((unsigned __int8 *)&self->_searchBarVisualProviderFlags + 1) >> 3) & 1;
}

- (BOOL)showsSearchResultsButton
{
  return (*((unsigned __int8 *)&self->_searchBarVisualProviderFlags + 2) >> 5) & 1;
}

- (id)viewStackedInNavigationBar
{
  if ((*((unsigned char *)&self->_searchBarVisualProviderFlags + 3) & 8) != 0)
  {
    if ([(_UISearchBarLayout *)self->_currentLayout hasScopeBar]) {
      scopeBarContainerView = self->_scopeBarContainerView;
    }
    else {
      scopeBarContainerView = 0;
    }
    BOOL v3 = scopeBarContainerView;
  }
  else
  {
    BOOL v3 = [(_UISearchBarVisualProviderBase *)self searchBar];
  }
  return v3;
}

- (void)setBackgroundImage:(id)a3 forBarPosition:(int64_t)a4 barMetrics:(int64_t)a5
{
  [(UISearchBarBackground *)self->_searchBarBackground _setBackgroundImage:a3 forBarPosition:a4 barMetrics:a5];
  [(_UISearchBarVisualProviderIOS *)self updateNeedForBackdrop];
}

- (void)updatePlaceholderColor
{
  BOOL v3 = [(_UISearchBarVisualProviderBase *)self searchBar];
  if (v3)
  {
    id v9 = v3;
    double v4 = [v3 _searchBarTextField];
    double v5 = [v4 _placeholderLabel];

    BOOL v6 = [(_UISearchBarVisualProviderIOS *)self colorForComponent:3 disabled:0];
    if (dyld_program_sdk_at_least())
    {
      double v7 = [v5 _defaultAttributes];
      int v8 = (void *)[v7 mutableCopy];

      [v8 setObject:v6 forKeyedSubscript:*(void *)off_1E52D2048];
      [v5 _setDefaultAttributes:v8];
    }
    else
    {
      [v5 setTextColor:v6];
    }

    BOOL v3 = v9;
  }
}

- (id)colorForComponent:(unint64_t)a3 disabled:(BOOL)a4
{
  BOOL v4 = a4;
  double v7 = [(_UISearchBarVisualProviderBase *)self searchBar];
  int v8 = v7;
  if (!v7)
  {
LABEL_5:
    uint64_t v11 = +[UIColor labelColor];
LABEL_27:
    uint64_t v15 = (void *)v11;
    goto LABEL_28;
  }
  id v9 = [v7 traitCollection];
  uint64_t v10 = [v9 userInterfaceIdiom];

  if (v10 == 3)
  {
    switch(a3)
    {
      case 0uLL:
      case 2uLL:
        uint64_t v11 = +[UIColor _carSystemPrimaryColor];
        goto LABEL_27;
      case 1uLL:
      case 3uLL:
        uint64_t v11 = +[UIColor _carSystemSecondaryColor];
        goto LABEL_27;
      case 4uLL:
        goto LABEL_5;
      default:
        uint64_t v15 = 0;
        break;
    }
    goto LABEL_28;
  }
  int64_t backdropStyle = self->_backdropStyle;
  if (backdropStyle == 2030)
  {
    if (!v4)
    {
      double v14 = 1.0;
      if (a3 == 4) {
        double v13 = 1.0;
      }
      else {
        double v13 = 0.5;
      }
      goto LABEL_26;
    }
    goto LABEL_12;
  }
  if (backdropStyle == 2020)
  {
    if (!v4)
    {
LABEL_24:
      uint64_t v11 = +[UIColor whiteColor];
      goto LABEL_27;
    }
LABEL_12:
    double v13 = 0.35;
    double v14 = 1.0;
    goto LABEL_26;
  }
  if ([(_UISearchBarVisualProviderIOS *)self barStyle])
  {
    if (!v4)
    {
      if (a3 != 4)
      {
        uint64_t v11 = +[UIColor _searchFieldPlaceholderTextClearButtonColor];
        goto LABEL_27;
      }
      goto LABEL_24;
    }
    double v14 = 0.47;
    double v13 = 0.35;
LABEL_26:
    uint64_t v11 = +[UIColor colorWithWhite:v14 alpha:v13];
    goto LABEL_27;
  }
  int64_t v16 = self->_backdropStyle;
  if ((v16 == 2010 || v16 == 2005) && a3 == 4)
  {
    double v17 = +[UIColor labelColor];
  }
  else
  {
    double v17 = +[UIColor secondaryLabelColor];
  }
  uint64_t v15 = v17;
  if (v4)
  {
    uint64_t v19 = [v17 colorWithAlphaComponent:0.35];

    uint64_t v15 = (void *)v19;
  }
LABEL_28:

  return v15;
}

- (int64_t)barStyle
{
  return *(void *)&self->_searchBarVisualProviderFlags & 7;
}

- (void)updateSearchFieldForDynamicType
{
  BOOL v3 = [(_UISearchBarVisualProviderIOS *)self supportsDynamicType];
  if (v3)
  {
    [off_1E52D39B8 preferredFontForTextStyle:@"UICTFontTextStyleBody"];
  }
  else
  {
    [off_1E52D39B8 defaultFontSize];
    objc_msgSend(off_1E52D39B8, "systemFontOfSize:");
  BOOL v4 = };
  [(UITextField *)self->_searchField setFont:v4];

  [(UITextField *)self->_searchField setAdjustsFontForContentSizeCategory:v3];
  uint64_t v5 = v3 ^ 1;
  [(UISearchTextField *)self->_searchField _setIgnoresDynamicType:v5];
  searchField = self->_searchField;
  [(UIView *)searchField setShowsLargeContentViewer:v5];
}

- (void)updateDictationButtonForDynamicTypeWithSearchField:(id)a3
{
  id v12 = a3;
  BOOL v4 = [(_UISearchBarVisualProviderIOS *)self supportsDynamicType];
  if (v4)
  {
    uint64_t v5 = [(UIButton *)self->_dictationButton imageForState:0];
    BOOL v6 = [v12 font];
    double v7 = [v12 traitCollection];
    int v8 = [v7 preferredContentSizeCategory];
    if (UIContentSizeCategoryIsAccessibilityCategory((UIContentSizeCategory)v8))
    {
      if (UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)v8, &cfstr_Uictcontentsiz_11.isa) != NSOrderedAscending)
      {
        uint64_t v9 = 1;
LABEL_7:

        uint64_t v10 = +[UIImageSymbolConfiguration configurationWithFont:v6 scale:v9];
        uint64_t v11 = [v5 imageWithConfiguration:v10];

        [(UIButton *)self->_dictationButton setImage:v11 forState:0];
        goto LABEL_8;
      }
      UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)v8, &cfstr_Uictcontentsiz_9.isa);
    }
    uint64_t v9 = 2;
    goto LABEL_7;
  }
LABEL_8:
  [(UIView *)self->_dictationButton setShowsLargeContentViewer:!v4];
}

- (BOOL)supportsDynamicType
{
  double v2 = [(_UISearchBarVisualProviderBase *)self searchBar];
  char v3 = [v2 _effectivelySupportsDynamicType];

  return v3;
}

- (void)setUpSearchField
{
  char v3 = [(_UISearchBarVisualProviderBase *)self searchBar];
  if (v3)
  {
    [(_UISearchBarVisualProviderIOS *)self setUpSearchBarSearchContainerIfNecessary];
    BOOL v4 = (objc_class *)[v3 _classForSearchTextField];
    if (v4 == (objc_class *)objc_opt_class()) {
      BOOL v4 = (objc_class *)objc_opt_class();
    }
    uint64_t v5 = (UISearchBarTextField *)[[v4 alloc] _initWithDeferredSearchIconImageConfiguration];
    searchField = self->_searchField;
    self->_searchField = v5;

    [(UISearchTextField *)self->_searchField _setSearchBar:v3];
    [(UIView *)self->_searchField setOpaque:0];
    -[UITextField setSemanticContentAttribute:](self->_searchField, "setSemanticContentAttribute:", [v3 semanticContentAttribute]);
    [(_UISearchBarVisualProviderIOS *)self updateSearchFieldForDynamicType];
    [(_UISearchBarVisualProviderIOS *)self updateSearchFieldControlSize];
    [(_UISearchBarVisualProviderIOS *)self updateMagnifyingGlassView];
    [(UITextField *)self->_searchField setLeftViewMode:(*(void *)&self->_searchBarVisualProviderFlags >> 9) & 3];
    [(_UISearchBarVisualProviderIOS *)self updateRightView];
    [(UITextField *)self->_searchField setClearButtonMode:3];
    [(UITextField *)self->_searchField setBorderStyle:3];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __49___UISearchBarVisualProviderIOS_setUpSearchField__block_invoke;
    v13[3] = &unk_1E52D9F70;
    v13[4] = self;
    +[UIView _performSystemAppearanceModifications:v13];
    if ([(_UISearchBarVisualProviderIOS *)self centerPlaceholder])
    {
      double v7 = [v3 textInputTraits];
      [v7 setDeferBecomingResponder:1];
    }
    char v12 = 0;
    int v8 = [(_UISearchBarVisualProviderIOS *)self internalImageForSearchBarIcon:1 state:0 customImage:&v12];
    if (v8 && v12) {
      [(UISearchTextField *)self->_searchField _setClearButtonImage:v8 forState:0];
    }
    uint64_t v9 = [(_UISearchBarVisualProviderIOS *)self internalImageForSearchBarIcon:1 state:1 customImage:&v12];

    if (v9 && v12) {
      [(UISearchTextField *)self->_searchField _setClearButtonImage:v9 forState:1];
    }
    uint64_t v10 = [(_UISearchBarVisualProviderIOS *)self internalImageForSearchBarIcon:1 state:2 customImage:&v12];

    if (v10 && v12) {
      [(UISearchTextField *)self->_searchField _setClearButtonImage:v10 forState:2];
    }
    [(_UISearchBarVisualProviderIOS *)self updateSearchFieldArt];
    [(UIControl *)self->_searchField addTarget:v3 action:sel__searchFieldBeginEditing forControlEvents:0x10000];
    [(UIControl *)self->_searchField addTarget:v3 action:sel__searchFieldEditingChanged forControlEvents:0x20000];
    [(UIControl *)self->_searchField addTarget:v3 action:sel__searchFieldEndEditing forControlEvents:0x40000];
    [(UIControl *)self->_searchField addTarget:v3 action:sel__searchFieldReturnPressed forControlEvents:0x80000];
    if ((*((unsigned char *)&self->_searchBarVisualProviderFlags + 3) & 0x10) == 0)
    {
      [(UIView *)self->_searchFieldContainerView addSubview:self->_searchField];
      [(_UISearchBarSearchContainerView *)self->_searchFieldContainerView setNeedsLayout];
    }
    uint64_t v11 = [(UIView *)self->_searchField layer];
    [v11 setAllowsGroupOpacity:0];

    if ((*(void *)&self->_searchBarVisualProviderFlags & 0x38) == 0x10) {
      [(_UISearchBarVisualProviderIOS *)self applySearchBarStyle];
    }
  }
}

- (void)updateSearchFieldControlSize
{
  char v3 = [(_UISearchBarVisualProviderBase *)self searchBar];
  if (v3)
  {
    id v7 = v3;
    unint64_t v4 = [v3 traitCollection];
    uint64_t v5 = (void *)v4;
    if (v4)
    {
      _UIRecordTraitUsage(v4, 0x13uLL);
      uint64_t v6 = 2 * (v5[16] == 2);
    }
    else
    {
      uint64_t v6 = 0;
    }
    [(UITextField *)self->_searchField setControlSize:v6];

    [(_UISearchBarVisualProviderIOS *)self updateSearchFieldForDynamicType];
    char v3 = v7;
  }
}

- (void)updateSearchFieldArt
{
  char v3 = [(_UISearchBarVisualProviderBase *)self searchBar];
  if (v3)
  {
    id v19 = v3;
    unint64_t v4 = [v3 _searchBarTextField];
    uint64_t v5 = [(_UISearchBarAppearanceStorage *)self->_appearanceStorage searchFieldBackgroundImageForState:0];
    if (!v5)
    {
      [v4 setBorderStyle:3];
      id v9 = [v4 _systemBackgroundView];
      objc_msgSend(v9, "setBarStyle:", -[_UISearchBarVisualProviderIOS barStyle](self, "barStyle"));
LABEL_16:

      char v3 = v19;
      goto LABEL_17;
    }
    uint64_t v6 = [(_UISearchBarAppearanceStorage *)self->_appearanceStorage searchFieldBackgroundImageForState:2];
    id v7 = (void *)v6;
    if (v6) {
      int v8 = (void *)v6;
    }
    else {
      int v8 = v5;
    }
    id v9 = v8;

    if ([v5 _isResizable])
    {
      [v4 setBackground:v5];
      if (![v9 _isResizable])
      {
        uint64_t v10 = [v5 leftCapWidth];
        uint64_t v11 = [v5 topCapHeight];
        char v12 = v9;
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
      int64_t v16 = [v5 stretchableImageWithLeftCapWidth:v15 topCapHeight:0];
      [v4 setBackground:v16];

      if (![v9 _isResizable])
      {
        char v12 = v9;
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

- (void)setUpSearchBarSearchContainerIfNecessary
{
  if (!self->_searchFieldContainerView)
  {
    uint64_t v3 = [(_UISearchBarVisualProviderBase *)self searchBar];
    unint64_t v4 = (void *)v3;
    if (v3)
    {
      uint64_t v10 = (void *)v3;
      uint64_t v5 = [_UISearchBarSearchContainerView alloc];
      [v10 bounds];
      uint64_t v6 = -[UIView initWithFrame:](v5, "initWithFrame:");
      searchFieldContainerView = self->_searchFieldContainerView;
      self->_searchFieldContainerView = v6;

      [(UIView *)self->_searchFieldContainerView setAutoresizingMask:2];
      if (![(_UISearchBarVisualProviderIOS *)self supportsDynamicType])
      {
        int v8 = self->_searchFieldContainerView;
        id v9 = objc_opt_new();
        [(UIView *)v8 addInteraction:v9];
      }
      [v10 addSubview:self->_searchFieldContainerView];
      [v10 setNeedsLayout];
      unint64_t v4 = v10;
    }
  }
}

- (void)invalidateLayout
{
}

- (void)updateRightView
{
  uint64_t v3 = [(_UISearchBarVisualProviderBase *)self searchBar];
  unint64_t v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 _searchBarTextField];
    uint64_t v6 = v5;
    $3CCFBAC33A89B83EF2A602DE1312B683 searchBarVisualProviderFlags = self->_searchBarVisualProviderFlags;
    if ((*(void *)&searchBarVisualProviderFlags & 0x200000) != 0) {
      uint64_t v8 = 2;
    }
    else {
      uint64_t v8 = (*(unint64_t *)&searchBarVisualProviderFlags >> 22) & 2;
    }
    [v5 setRightViewMode:v8];
    $3CCFBAC33A89B83EF2A602DE1312B683 v9 = self->_searchBarVisualProviderFlags;
    if ((*(_DWORD *)&v9 & 0x200000) != 0)
    {
      uint64_t v10 = [(_UISearchBarVisualProviderIOS *)self internalImageForSearchBarIcon:3 state:0];
      uint64_t v11 = [(_UISearchBarVisualProviderIOS *)self internalImageForSearchBarIcon:3 state:1];
      char v12 = [(_UISearchBarVisualProviderIOS *)self internalImageForSearchBarIcon:3 state:2];
      uint64_t v13 = objc_alloc_init(UIButton);
      [(UIControl *)v13 addTarget:v4 action:sel__resultsListButtonPressed forControlEvents:64];
      [(UIButton *)v13 setImage:v10 forStates:0];
      [(UIButton *)v13 setImage:v11 forStates:1];
      [(UIButton *)v13 setImage:v11 forStates:4];
      [(UIButton *)v13 setImage:v12 forStates:2];
      [(UIButton *)v13 setSelected:(*(void *)&self->_searchBarVisualProviderFlags >> 22) & 1];
      [(UIControl *)v13 setPointerInteractionEnabled:1];
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __48___UISearchBarVisualProviderIOS_updateRightView__block_invoke;
      v28[3] = &unk_1E52D9F98;
      double v29 = v13;
      id v14 = v6;
      id v30 = v14;
      uint64_t v15 = v13;
      +[UIView performWithoutAnimation:v28];
      int64_t v16 = [(_UISearchBarVisualProviderIOS *)self colorForComponent:0 disabled:0];
      [(UIButton *)v15 setTintColor:v16];

      LODWORD(v17) = -0.5;
      [(UIView *)v15 setCharge:v17];
      [v14 setRightView:v15];
      objc_msgSend(v14, "_setRightViewOffset:", -1.0, -1.0);

      double v18 = v29;
    }
    else
    {
      if ((*(_DWORD *)&v9 & 0x800000) == 0)
      {
        if ([(_UISearchBarVisualProviderIOS *)self canShowDictationButton])
        {
          [(_UISearchBarVisualProviderIOS *)self setUpDictationMicWithSearchField:v6];
          [(_UISearchBarVisualProviderIOS *)self setShowDictationButton:1 shouldUpdateView:0];
        }
        goto LABEL_12;
      }
      uint64_t v10 = [(_UISearchBarVisualProviderIOS *)self internalImageForSearchBarIcon:2 state:0];
      uint64_t v11 = [(_UISearchBarVisualProviderIOS *)self internalImageForSearchBarIcon:2 state:1];
      char v12 = [(_UISearchBarVisualProviderIOS *)self internalImageForSearchBarIcon:2 state:2];
      id v19 = objc_alloc_init(UIButton);
      [(UIControl *)v19 addTarget:v4 action:sel__bookmarkButtonPressed forControlEvents:64];
      [(UIButton *)v19 setImage:v10 forStates:0];
      [(UIButton *)v19 setImage:v11 forStates:1];
      [(UIButton *)v19 setImage:v12 forStates:2];
      [(UIControl *)v19 setPointerInteractionEnabled:1];
      uint64_t v22 = MEMORY[0x1E4F143A8];
      uint64_t v23 = 3221225472;
      double v24 = __48___UISearchBarVisualProviderIOS_updateRightView__block_invoke_2;
      double v25 = &unk_1E52D9F98;
      double v26 = v19;
      id v20 = v6;
      id v27 = v20;
      uint64_t v15 = v19;
      +[UIView performWithoutAnimation:&v22];
      double v21 = -[_UISearchBarVisualProviderIOS colorForComponent:disabled:](self, "colorForComponent:disabled:", 0, 0, v22, v23, v24, v25);
      [(UIButton *)v15 setTintColor:v21];

      [v20 setRightView:v15];
      double v18 = v26;
    }

LABEL_12:
  }
}

- (void)setUpDictationMicWithSearchField:(id)a3
{
  id v4 = a3;
  id v10 = v4;
  if (!self->_dictationButton)
  {
    uint64_t v5 = +[UIDictationSearchButton button];
    dictationButton = self->_dictationButton;
    self->_dictationButton = v5;

    id v7 = [(_UISearchBarVisualProviderIOS *)self colorForComponent:0 disabled:0];
    [(UIButton *)self->_dictationButton setTintColor:v7];

    [(UIControl *)self->_dictationButton addTarget:self action:sel_dictationButtonPressed_withEvent_ forControlEvents:64];
    [(UIView *)self->_dictationButton _setDisableDictationTouchCancellation:1];
    uint64_t v8 = _UINSLocalizedStringWithDefaultValue(@"Dictation", @"Dictation");
    [(UIView *)self->_dictationButton setLargeContentTitle:v8];

    id v4 = v10;
  }
  [(_UISearchBarVisualProviderIOS *)self updateDictationButtonForDynamicTypeWithSearchField:v4];
  $3CCFBAC33A89B83EF2A602DE1312B683 v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v9 addObserver:self selector:sel_dictationControllerDidFinish_ name:@"UIDictationControllerDictationDidFinish" object:0];

  [v10 setRightView:self->_dictationButton];
  [v10 setRightViewMode:2];
}

- (void)setShowDictationButton:(BOOL)a3 shouldUpdateView:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v6 = 0x100000000;
  if (!a3) {
    uint64_t v6 = 0;
  }
  self->_$3CCFBAC33A89B83EF2A602DE1312B683 searchBarVisualProviderFlags = ($3CCFBAC33A89B83EF2A602DE1312B683)(*(void *)&self->_searchBarVisualProviderFlags & 0xFFFFFFFEFFFFFFFFLL | v6);
  -[UISearchBarTextField setShowDictationButton:](self->_searchField, "setShowDictationButton:");
  if (v4)
  {
    [(_UISearchBarVisualProviderIOS *)self updateRightView];
  }
}

- (BOOL)canShowDictationButton
{
  LODWORD(v3) = [(_UISearchBarVisualProviderIOS *)self wantsDictationButton];
  if (v3)
  {
    $3CCFBAC33A89B83EF2A602DE1312B683 searchBarVisualProviderFlags = self->_searchBarVisualProviderFlags;
    if ((*(void *)&searchBarVisualProviderFlags & 0x400000000) == 0)
    {
      self->_$3CCFBAC33A89B83EF2A602DE1312B683 searchBarVisualProviderFlags = ($3CCFBAC33A89B83EF2A602DE1312B683)(*(void *)&searchBarVisualProviderFlags | 0x400000000);
      [(_UISearchBarVisualProviderIOS *)self updateDictationButton];
      $3CCFBAC33A89B83EF2A602DE1312B683 searchBarVisualProviderFlags = self->_searchBarVisualProviderFlags;
    }
    return (*(unint64_t *)&searchBarVisualProviderFlags >> 33) & 1;
  }
  return v3;
}

- (BOOL)wantsDictationButton
{
  return *((unsigned char *)&self->_searchBarVisualProviderFlags + 4) & 1;
}

- (void)updateMagnifyingGlassView
{
  BOOL v3 = [(_UISearchBarVisualProviderBase *)self searchBar];
  if (v3)
  {
    if (self->_searchField)
    {
      id v11 = v3;
      BOOL v4 = [v3 _searchBarTextField];
      uint64_t v5 = [(_UISearchBarVisualProviderIOS *)self internalImageForSearchBarIcon:0 state:(*(void *)&self->_searchBarVisualProviderFlags >> 11) & 2 customImage:0];
      [v4 _setMagnifyingGlassImage:v5];

      uint64_t v6 = [v11 traitCollection];
      uint64_t v7 = [v6 userInterfaceIdiom];

      BOOL v3 = v11;
      if (v7 == 3)
      {
        uint64_t v8 = [(_UISearchBarVisualProviderIOS *)self colorForComponent:2 disabled:0];
        $3CCFBAC33A89B83EF2A602DE1312B683 v9 = [v11 _searchBarTextField];
        id v10 = [v9 leftView];
        [v10 setTintColor:v8];

        BOOL v3 = v11;
      }
    }
  }
}

- (id)internalImageForSearchBarIcon:(int64_t)a3 state:(unint64_t)a4 customImage:(BOOL *)a5
{
  $3CCFBAC33A89B83EF2A602DE1312B683 v9 = [(_UISearchBarVisualProviderBase *)self searchBar];
  if (!v9)
  {
    char v12 = objc_alloc_init(UIImage);
    goto LABEL_13;
  }
  uint64_t v10 = [(_UISearchBarAppearanceStorage *)self->_appearanceStorage imageForIcon:a3 state:a4];
  if (!v10)
  {
    if (a5) {
      *a5 = 0;
    }
    if (a3 == 3)
    {
      uint64_t v13 = @"chevron.down.circle.fill";
    }
    else
    {
      if (a3 != 2)
      {
        id v11 = 0;
        goto LABEL_14;
      }
      uint64_t v13 = @"book";
    }
    char v12 = +[UIImage systemImageNamed:v13];
LABEL_13:
    id v11 = v12;
    goto LABEL_14;
  }
  id v11 = (void *)v10;
  if (a5) {
    *a5 = 1;
  }
LABEL_14:

  return v11;
}

- (void)setBarTranslucence:(int64_t)a3
{
  $3CCFBAC33A89B83EF2A602DE1312B683 searchBarVisualProviderFlags = self->_searchBarVisualProviderFlags;
  if (((*(unint64_t *)&searchBarVisualProviderFlags >> 6) & 7) != a3)
  {
    self->_$3CCFBAC33A89B83EF2A602DE1312B683 searchBarVisualProviderFlags = ($3CCFBAC33A89B83EF2A602DE1312B683)(*(void *)&searchBarVisualProviderFlags & 0xFFFFFFFFFFFFFE3FLL | ((unint64_t)(a3 & 7) << 6));
    [(UISearchBarBackground *)self->_searchBarBackground setTranslucent:[(_UISearchBarVisualProviderIOS *)self isTranslucent]];
    [(_UISearchBarVisualProviderIOS *)self updateSearchBarOpacity];
  }
}

- (void)layoutSubviews
{
  BOOL v3 = [(_UISearchBarVisualProviderBase *)self searchBar];
  if (v3)
  {
    id v4 = v3;
    [v3 bounds];
    [(_UISearchBarVisualProviderIOS *)self layoutSubviewsInBounds:"layoutSubviewsInBounds:"];
    BOOL v3 = v4;
  }
}

- (void)layoutSubviewsInBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = [(_UISearchBarVisualProviderBase *)self searchBar];
  if (v8)
  {
    if (!self->_searchField)
    {
      int has_internal_diagnostics = os_variant_has_internal_diagnostics();
      transitioner = self->_transitioner;
      if (has_internal_diagnostics)
      {
        if (transitioner)
        {
          uint64_t v23 = __UIFaultDebugAssertLog();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
          {
            LOWORD(v25) = 0;
            _os_log_fault_impl(&dword_1853B0000, v23, OS_LOG_TYPE_FAULT, "Unexpected late creation of UISearchBar's searchField during a transition. This is a UIKit bug.", (uint8_t *)&v25, 2u);
          }
        }
      }
      else if (transitioner)
      {
        double v24 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB25BA48) + 8);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v25) = 0;
          _os_log_impl(&dword_1853B0000, v24, OS_LOG_TYPE_ERROR, "Unexpected late creation of UISearchBar's searchField during a transition. This is a UIKit bug.", (uint8_t *)&v25, 2u);
        }
      }
      id v11 = [v8 _searchBarTextField];
      searchField = self->_searchField;
      self->_searchField = v11;

      [(UIView *)self->_searchField setShowsLargeContentViewer:[(_UISearchBarVisualProviderIOS *)self supportsDynamicType] ^ 1];
    }
    uint64_t v13 = [(_UISearchBarTransitionerBase *)self->_transitioner activeLayout];
    currentLayout = v13;
    if (!v13) {
      currentLayout = self->_currentLayout;
    }
    uint64_t v15 = currentLayout;

    if (!self->_transitioner) {
      [(_UISearchBarVisualProviderIOS *)self configureLayout:v15];
    }
    -[_UISearchBarVisualProviderIOS boundsForSearchBarAndUpdateIfNecessaryFromSuggestedBounds:](self, "boundsForSearchBarAndUpdateIfNecessaryFromSuggestedBounds:", x, y, width, height);
    -[_UISearchBarLayoutBase setLayoutSize:](v15, "setLayoutSize:", v16, v17);
    [(_UISearchBarLayout *)v15 applyLayout];
    int v18 = os_variant_has_internal_diagnostics();
    BOOL v19 = [(_UISearchBarLayout *)v15 isProspective];
    if (v18)
    {
      if (!v19)
      {
LABEL_12:

        goto LABEL_13;
      }
      id v20 = __UIFaultDebugAssertLog();
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      {
LABEL_20:

        goto LABEL_12;
      }
      double v21 = [v8 recursiveDescription];
      int v25 = 138412290;
      double v26 = v21;
      _os_log_fault_impl(&dword_1853B0000, v20, OS_LOG_TYPE_FAULT, "Live layout with a prospective search layout. Search Bar layout may be incorrect. Please send to UIKit for investigation, and include the following recursive description.\n%@", (uint8_t *)&v25, 0xCu);
    }
    else
    {
      if (!v19) {
        goto LABEL_12;
      }
      uint64_t v22 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB25BA50) + 8);
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        goto LABEL_12;
      }
      id v20 = v22;
      double v21 = [v8 recursiveDescription];
      int v25 = 138412290;
      double v26 = v21;
      _os_log_impl(&dword_1853B0000, v20, OS_LOG_TYPE_ERROR, "Live layout with a prospective search layout. Search Bar layout may be incorrect. Please send to UIKit for investigation, and include the following recursive description.\n%@", (uint8_t *)&v25, 0xCu);
    }

    goto LABEL_20;
  }
LABEL_13:
}

- (CGRect)boundsForSearchBarAndUpdateIfNecessaryFromSuggestedBounds:(CGRect)a3
{
  CGFloat height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v8 = [(_UISearchBarVisualProviderBase *)self searchBar];
  if (v8)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_navBarTitleViewDataSource);
    if (WeakRetained)
    {
      navBarTitleViewOverlayRects = self->_navBarTitleViewOverlayRects;
      if (navBarTitleViewOverlayRects)
      {
        [(_UINavigationBarTitleViewOverlayRects *)navBarTitleViewOverlayRects reset];
      }
      else
      {
        char v12 = objc_alloc_init(_UINavigationBarTitleViewOverlayRects);
        uint64_t v13 = self->_navBarTitleViewOverlayRects;
        self->_navBarTitleViewOverlayRects = v12;
      }
      [WeakRetained titleView:v8 needsUpdatedContentOverlayRects:self->_navBarTitleViewOverlayRects];
      [(_UISearchBarVisualProviderIOS *)self updateEffectiveContentInset];
    }
    else if (![(_UISearchBarVisualProviderIOS *)self isInBarButNotHosted])
    {
      [(UIImageView *)self->_searchBarBackground setHidden:(*(void *)&self->_searchBarVisualProviderFlags >> 14) & 1];
      BOOL v11 = (*((unsigned char *)&self->_searchBarVisualProviderFlags + 1) & 0x40) == 0 && self->_searchBarBackground != 0;
      [(_UISearchBarLayout *)self->_currentLayout setHasSearchBarBackground:v11];
      [(_UISearchBarVisualProviderIOS *)self updateSearchBarOpacity];
LABEL_16:

      goto LABEL_17;
    }
    id v14 = [v8 superview];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v15 = [v14 topItem];
      double v16 = [v15 titleView];

      if (v16 != v8)
      {
        [v14 frame];
        CGFloat height = v17;
        objc_msgSend(v8, "setBounds:", x, y, width);
      }
    }
    [(UIImageView *)self->_searchBarBackground setHidden:1];
    [(_UISearchBarLayout *)self->_currentLayout setHasSearchBarBackground:0];
    [(_UISearchBarVisualProviderIOS *)self updateSearchBarOpacity];

    goto LABEL_16;
  }
  double x = *MEMORY[0x1E4F1DB28];
  double y = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double width = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  CGFloat height = *(double *)(MEMORY[0x1E4F1DB28] + 24);
LABEL_17:

  double v18 = x;
  double v19 = y;
  double v20 = width;
  double v21 = height;
  result.size.CGFloat height = v21;
  result.size.double width = v20;
  result.origin.double y = v19;
  result.origin.double x = v18;
  return result;
}

- (void)updateSearchBarOpacity
{
  id v3 = [(_UISearchBarVisualProviderBase *)self searchBar];
  if (v3) {
    objc_msgSend(v3, "setOpaque:", -[_UISearchBarVisualProviderIOS isTranslucent](self, "isTranslucent") ^ 1);
  }
}

- (BOOL)isTranslucent
{
  return (*(void *)&self->_searchBarVisualProviderFlags & 0x1C0) == 64;
}

- (BOOL)isFrozenForDismissalCrossfade
{
  return *((unsigned char *)&self->_searchBarVisualProviderFlags + 2) & 1;
}

- (void)updateIfNecessaryForOldSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v6 = [(_UISearchBarVisualProviderBase *)self searchBar];
  if (!v6) {
    goto LABEL_12;
  }
  id v12 = v6;
  [v6 bounds];
  uint64_t v6 = v12;
  if (width == v8 && height == v7) {
    goto LABEL_12;
  }
  [(_UISearchBarVisualProviderIOS *)self layoutBackgroundViewConsideringTopBarStatusAndChangedHeight:v7 != height];
  uint64_t v10 = [v12 window];
  if (v10
    && +[UIView _isInAnimationBlockWithAnimationsEnabled])
  {
    transitioner = self->_transitioner;

    uint64_t v6 = v12;
    if (transitioner) {
      goto LABEL_12;
    }
    [v12 setNeedsLayout];
    [(_UISearchBarSearchContainerView *)self->_searchFieldContainerView setNeedsLayout];
    [(_UISearchBarScopeContainerView *)self->_scopeBarContainerView setNeedsLayout];
    [v12 layoutIfNeeded];
  }
  else
  {
  }
  uint64_t v6 = v12;
LABEL_12:
}

- (void)layoutBackgroundViewConsideringTopBarStatusAndChangedHeight:(BOOL)a3
{
  uint64_t v5 = [(_UISearchBarVisualProviderBase *)self searchBar];
  if (v5)
  {
    *(void *)&self->_searchBarVisualProviderFlags &= ~0x8000uLL;
    id v23 = v5;
    [v5 bounds];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    id v14 = [v23 window];
    if (v14)
    {
      if (self->_barPosition == 3 || [(_UISearchBarVisualProviderIOS *)self isAtTop])
      {
        uint64_t v15 = __UIStatusBarManagerForWindow(v14);
        [v15 statusBarHeight];
        double v17 = v16;

        double v9 = v9 - v17;
        double v13 = v13 + v17;
      }
    }
    else
    {
      *(void *)&self->_searchBarVisualProviderFlags |= 0x8000uLL;
    }
    [(UIView *)self->_searchBarBackground frame];
    if (a3
      || (v25.origin.double x = v7,
          v25.origin.double y = v9,
          v25.size.double width = v11,
          v25.size.double height = v13,
          !CGRectEqualToRect(*(CGRect *)&v18, v25)))
    {
      if ([(_UISearchBarVisualProviderIOS *)self scopeBarIsVisible])
      {
        [(_UISearchBarVisualProviderIOS *)self scopeBarHeight];
        double v13 = v13 - v22;
      }
      -[UISearchBarBackground setFrame:](self->_searchBarBackground, "setFrame:", v7, v9, v11, v13);
    }

    uint64_t v5 = v23;
  }
}

- (BOOL)scopeBarIsVisible
{
  [(_UISearchBarVisualProviderIOS *)self configureLayout:self->_currentLayout];
  currentLayout = self->_currentLayout;
  return [(_UISearchBarLayout *)currentLayout hasScopeBar];
}

- (void)configureLayout:(id)a3
{
}

- (BOOL)isAtTop
{
  double v2 = [(_UISearchBarVisualProviderBase *)self searchBar];
  id v3 = v2;
  if (v2)
  {
    id v4 = [v2 window];
    if (v4
      && ([v3 _containingScrollView],
          uint64_t v5 = objc_claimAutoreleasedReturnValue(),
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
          double v20 = __UIStatusBarManagerForWindow(v4);
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

- (BOOL)showsScopeBar
{
  double v2 = self;
  id v3 = [(_UISearchBarVisualProviderBase *)self searchBar];
  uint64_t v4 = [v3 _searchController];
  if (!v4) {
    goto LABEL_9;
  }
  uint64_t v5 = (void *)v4;
  BOOL v6 = [v3 _searchController];
  uint64_t v7 = v6;
  if (v6)
  {
    int v8 = (v6[263] >> 5) & 3;
    if (v8 == 1)
    {

      goto LABEL_9;
    }
    if (!v8) {
      dyld_program_sdk_at_least();
    }
  }
  BOOL v9 = [(_UISearchBarVisualProviderIOS *)v2 isActiveSearchDeferringScopeBar];

  if (v9)
  {
LABEL_9:
    LODWORD(v2) = (*((unsigned __int8 *)&v2->_searchBarVisualProviderFlags + 3) >> 6) & 1;
    goto LABEL_10;
  }
  LOBYTE(v2) = v2->_layoutState == 3;
LABEL_10:

  return (char)v2;
}

- (BOOL)isActiveSearchDeferringScopeBar
{
  return *((unsigned __int8 *)&self->_searchBarVisualProviderFlags + 3) >> 7;
}

- (void)setAutoDisableCancelButton:(BOOL)a3
{
  uint64_t v3 = 0x80000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$3CCFBAC33A89B83EF2A602DE1312B683 searchBarVisualProviderFlags = ($3CCFBAC33A89B83EF2A602DE1312B683)(*(void *)&self->_searchBarVisualProviderFlags & 0xFFFFFFFFFFF7FFFFLL | v3);
  if (!a3) {
    [(UIButton *)self->_cancelButton setEnabled:1];
  }
}

- (void)setActiveSearchDeferringScopeBar:(BOOL)a3
{
  uint64_t v3 = 0x80000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$3CCFBAC33A89B83EF2A602DE1312B683 searchBarVisualProviderFlags = ($3CCFBAC33A89B83EF2A602DE1312B683)(*(void *)&self->_searchBarVisualProviderFlags & 0xFFFFFFFF7FFFFFFFLL | v3);
}

- (void)resetLayoutState
{
  self->_layoutState = 0;
}

- (int)visualProviderType
{
  return 2;
}

- (void)setDelegateSearchFieldFrameManipulationBlock:(id)a3
{
  currentLayout = self->_currentLayout;
  id v5 = a3;
  [(_UISearchBarLayout *)currentLayout setDelegateSearchFieldFrameManipulationBlock:v5];
  [(_UISearchBarLayout *)self->_prospectiveLayout setDelegateSearchFieldFrameManipulationBlock:v5];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitioner, 0);
  objc_storeStrong((id *)&self->_prospectiveLayout, 0);
  objc_storeStrong((id *)&self->_currentLayout, 0);
  objc_storeStrong((id *)&self->_searchIconBarButtonItem, 0);
  objc_destroyWeak((id *)&self->_navBarTitleViewDataSource);
  objc_storeStrong((id *)&self->_navBarTitleViewOverlayRects, 0);
  objc_storeStrong((id *)&self->_barTintColor, 0);
  objc_storeStrong((id *)&self->_scopeTitles, 0);
  objc_storeStrong((id *)&self->_scopeBarBackgroundView, 0);
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
  objc_storeStrong((id *)&self->_inlineWidthConstraints, 0);
  objc_storeStrong((id *)&self->_searchNavigationItem, 0);
  objc_storeStrong((id *)&self->_animatedAppearanceBarButtonItem, 0);
  objc_storeStrong((id *)&self->_appearanceStorage, 0);
  objc_storeStrong((id *)&self->_floatingSearchIconView, 0);
  objc_storeStrong((id *)&self->_scopeBarContainerView, 0);
  objc_storeStrong((id *)&self->_promptContainerView, 0);
  objc_storeStrong((id *)&self->_searchFieldContainerView, 0);
  objc_storeStrong((id *)&self->_dictationButton, 0);
}

- (void)updateForAllowedToShowDictationChange
{
  uint64_t v3 = [(_UISearchBarVisualProviderBase *)self searchBar];
  if (v3)
  {
    id v10 = v3;
    uint64_t v4 = +[UIDictationController sharedInstance];
    id v5 = [v10 traitCollection];
    int v6 = [v4 dictationSearchFieldUISupportsTraitCollection:v5];

    uint64_t v7 = 0x400000000;
    if (v6)
    {
      int v8 = +[UIDictationController sharedInstance];
      int v9 = [v8 dictationSearchFieldUIEnabled];

      if (v9) {
        uint64_t v7 = 0x600000000;
      }
    }
    self->_$3CCFBAC33A89B83EF2A602DE1312B683 searchBarVisualProviderFlags = ($3CCFBAC33A89B83EF2A602DE1312B683)(*(void *)&self->_searchBarVisualProviderFlags & 0xFFFFFFF9FFFFFFFFLL | v7);
    uint64_t v3 = v10;
  }
}

- (void)setMinimumContentInset:(UIEdgeInsets)a3
{
  if (self->_contentInsetPrivateMinOrOverride.left != a3.left
    || self->_contentInsetPrivateMinOrOverride.top != a3.top
    || self->_contentInsetPrivateMinOrOverride.right != a3.right
    || self->_contentInsetPrivateMinOrOverride.bottom != a3.bottom)
  {
    self->_contentInsetPrivateMinOrOverride = a3;
    [(_UISearchBarVisualProviderIOS *)self updateEffectiveContentInset];
  }
}

- (void)getOverrideContentInsets:(UIEdgeInsets *)a3 overriddenEdges:(unint64_t *)a4
{
  if (a4) {
    *a4 = self->_overriddenContentInsetEdges;
  }
  if (a3)
  {
    if (self->_overriddenContentInsetEdges) {
      p_contentInsetPrivateMinOrOverride = &self->_contentInsetPrivateMinOrOverride;
    }
    else {
      p_contentInsetPrivateMinOrOverride = (UIEdgeInsets *)&UIEdgeInsetsZero;
    }
    long long v5 = *(_OWORD *)&p_contentInsetPrivateMinOrOverride->bottom;
    *(_OWORD *)&a3->double top = *(_OWORD *)&p_contentInsetPrivateMinOrOverride->top;
    *(_OWORD *)&a3->double bottom = v5;
  }
}

- (void)setPlacedInToolbar:(BOOL)a3
{
  uint64_t v3 = 0x2000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$3CCFBAC33A89B83EF2A602DE1312B683 searchBarVisualProviderFlags = ($3CCFBAC33A89B83EF2A602DE1312B683)(*(void *)&self->_searchBarVisualProviderFlags & 0xFFFFFFFFFDFFFFFFLL | v3);
}

- (void)setHostedInlineByNavigationBar:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(_UISearchBarVisualProviderIOS *)self isHostedInlineByNavigationBar];
  BOOL v6 = v5;
  uint64_t v7 = 0x8000000;
  if (v3)
  {
    if (!v5)
    {
      int v8 = [(_UISearchBarVisualProviderBase *)self searchBar];
      LODWORD(v9) = 1.0;
      [v8 setContentHuggingPriority:0 forAxis:v9];
      id v10 = [(_UISearchBarVisualProviderBase *)self searchBar];
      double v11 = [v10 traitCollection];
      BOOL v12 = [v11 userInterfaceIdiom] == 6;

      LODWORD(v13) = dword_186B936C0[v12];
      [v8 setContentCompressionResistancePriority:0 forAxis:v13];
      if (!self->_layoutState)
      {
        self->_layoutState = 2;
        self->_previousLayoutState = 2;
      }
      scopeBarContainerView = self->_scopeBarContainerView;
      if (scopeBarContainerView) {
        [(UIView *)scopeBarContainerView removeFromSuperview];
      }

      uint64_t v7 = 0x8000000;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }
  self->_$3CCFBAC33A89B83EF2A602DE1312B683 searchBarVisualProviderFlags = ($3CCFBAC33A89B83EF2A602DE1312B683)(*(void *)&self->_searchBarVisualProviderFlags & 0xFFFFFFFFF7FFFFFFLL | v7);
  if (!v3 && v6)
  {
    -[_UISearchBarVisualProviderIOS _establishScopeBarInSearchBarIfNecessary]((uint64_t)self);
    [(_UISearchBarVisualProviderIOS *)self growToSearchFieldIfNecessary];
  }
}

- (void)setPlacedInNavigationBar:(BOOL)a3
{
  uint64_t v3 = 0x1000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$3CCFBAC33A89B83EF2A602DE1312B683 searchBarVisualProviderFlags = ($3CCFBAC33A89B83EF2A602DE1312B683)(*(void *)&self->_searchBarVisualProviderFlags & 0xFFFFFFFFFEFFFFFFLL | v3);
}

- (void)setInNavigationPalette:(BOOL)a3
{
  BOOL v3 = a3;
  if (os_variant_has_internal_diagnostics())
  {
    if (v3)
    {
      uint64_t v4 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1853B0000, v4, OS_LOG_TYPE_FAULT, "_UISearchBarVisualProviderIOS doesn't support search bars in navigation palettes. This code path is a UIKit bug.", buf, 2u);
      }
    }
  }
  else if (v3)
  {
    BOOL v5 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &setInNavigationPalette____s_category) + 8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)BOOL v6 = 0;
      _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_ERROR, "_UISearchBarVisualProviderIOS doesn't support search bars in navigation palettes. This code path is a UIKit bug.", v6, 2u);
    }
  }
}

- (BOOL)isPlacedInNavigationBar
{
  return *((unsigned char *)&self->_searchBarVisualProviderFlags + 3) & 1;
}

- (void)setBarPosition:(int64_t)a3
{
  BOOL v5 = [(_UISearchBarVisualProviderBase *)self searchBar];
  if (v5 && self->_barPosition != a3)
  {
    if (!a3) {
      a3 = 2;
    }
    id v9 = v5;
    [(UISearchBarBackground *)self->_searchBarBackground _setBarPosition:a3];
    self->_int64_t barPosition = a3;
    *(void *)&self->_searchBarVisualProviderFlags |= 0x8000uLL;
    BOOL v6 = [v9 _searchController];
    if (!v6 || (int64_t barPosition = self->_barPosition, v6, barPosition == 3))
    {
      BOOL v8 = self->_barPosition != 3 && (*((unsigned char *)&self->_searchBarVisualProviderFlags + 3) & 4) == 0;
      [(_UISearchBarVisualProviderIOS *)self setClippingViewActive:v8];
    }
    [(_UISearchBarVisualProviderIOS *)self updateEffectiveContentInset];
    [v9 setNeedsLayout];
    BOOL v5 = v9;
  }
}

- (void)prepare
{
  v16.receiver = self;
  v16.super_class = (Class)_UISearchBarVisualProviderIOS;
  [(_UISearchBarVisualProviderBase *)&v16 prepare];
  uint64_t v4 = [(_UISearchBarVisualProviderBase *)self searchBar];
  if (!v4)
  {
    double v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2 object:self file:@"_UISearchBarVisualProviderIOS.m" lineNumber:1027 description:@"visual provider can not prepare without the search bar"];
  }
  self->_double tableViewIndexWidth = 0.0;
  *(_OWORD *)&self->_contentInsetPrivateMinOrOverride.double top = 0u;
  *(_OWORD *)&self->_contentInsetPrivateMinOrOverride.double bottom = 0u;
  *(void *)&self->_searchBarVisualProviderFlags |= 0x80000uLL;
  [(_UISearchBarVisualProviderIOS *)self updateEffectiveContentInset];
  if ((dyld_program_sdk_at_least() & 1) == 0)
  {
    BOOL v5 = _UIMainBundleIdentifier();
    [v5 isEqualToString:@"com.sina.weibo"];
  }
  id v6 = objc_alloc((Class)objc_opt_class());
  [v4 bounds];
  uint64_t v7 = (UIView *)objc_msgSend(v6, "initWithFrame:");
  searchBarClippingView = self->_searchBarClippingView;
  self->_searchBarClippingView = v7;

  [(UIView *)self->_searchBarClippingView setAutoresizingMask:18];
  [(UIView *)self->_searchBarClippingView setClipsToBounds:1];
  [v4 addSubview:self->_searchBarClippingView];
  BOOL v9 = UISearchBarUsesModernAppearance();
  uint64_t v10 = 0x300008600;
  if (!v9) {
    uint64_t v10 = 0x300008E00;
  }
  self->_$3CCFBAC33A89B83EF2A602DE1312B683 searchBarVisualProviderFlags = ($3CCFBAC33A89B83EF2A602DE1312B683)(*(void *)&self->_searchBarVisualProviderFlags & 0xFFFFFFFFFFFFF7FFLL | v10);
  double v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v11 addObserver:self selector:sel_dictationAvailabilityDidChange_ name:@"UIKeyboardDictationAvailabilityDidChangeNotification" object:0];

  BOOL v12 = [UISearchBarBackground alloc];
  [v4 bounds];
  double v13 = -[UISearchBarBackground initWithFrame:](v12, "initWithFrame:");
  searchBarBackground = self->_searchBarBackground;
  self->_searchBarBackground = v13;

  [v4 insertSubview:self->_searchBarBackground atIndex:0];
}

- (id)searchBarClippingView
{
  return self->_searchBarClippingView;
}

- (BOOL)alwaysUsesLayoutMarginsForHorizontalContentInset
{
  return dyld_program_sdk_at_least();
}

- (void)updateEffectiveContentInset
{
  BOOL v3 = [(_UISearchBarVisualProviderBase *)self searchBar];
  if (v3)
  {
    id v22 = v3;
    transitioner = self->_transitioner;
    if (transitioner)
    {
      BOOL v5 = [(_UISearchBarTransitionerBase *)transitioner activeLayout];
      -[_UISearchBarVisualProviderIOS recalculatedEffectiveContentInsetForLayoutState:](self, "recalculatedEffectiveContentInsetForLayoutState:", [v5 representedLayoutState]);
      double v7 = v6;
      double v9 = v8;
      double v11 = v10;
      double v13 = v12;
    }
    else
    {
      [(_UISearchBarVisualProviderIOS *)self recalculatedEffectiveContentInsetForLayoutState:self->_layoutState];
      double v7 = v14;
      double v9 = v15;
      double v11 = v16;
      double v13 = v17;
    }
    BOOL v18 = v9 == self->_effectiveContentInset.left && v7 == self->_effectiveContentInset.top;
    BOOL v19 = v18 && v13 == self->_effectiveContentInset.right;
    BOOL v20 = v19 && v11 == self->_effectiveContentInset.bottom;
    BOOL v3 = v22;
    if (!v20)
    {
      self->_effectiveContentInset.double top = v7;
      self->_effectiveContentInset.double left = v9;
      self->_effectiveContentInset.double bottom = v11;
      self->_effectiveContentInset.double right = v13;
      double v21 = [v22 window];

      BOOL v3 = v22;
      if (v21)
      {
        [v22 setNeedsLayout];
        [(_UISearchBarSearchContainerView *)self->_searchFieldContainerView setNeedsLayout];
        [(_UISearchBarScopeContainerView *)self->_scopeBarContainerView setNeedsLayout];
        BOOL v3 = v22;
      }
    }
  }
}

- (void)setReliesOnNavigationBarBackdrop:(BOOL)a3
{
  uint64_t v3 = 0x2000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$3CCFBAC33A89B83EF2A602DE1312B683 searchBarVisualProviderFlags = ($3CCFBAC33A89B83EF2A602DE1312B683)(*(void *)&self->_searchBarVisualProviderFlags & 0xFFFFFFFFFFFFDFFFLL | v3);
}

- (void)setHostedByNavigationBar:(BOOL)a3
{
  uint64_t v3 = 0x4000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$3CCFBAC33A89B83EF2A602DE1312B683 searchBarVisualProviderFlags = ($3CCFBAC33A89B83EF2A602DE1312B683)(*(void *)&self->_searchBarVisualProviderFlags & 0xFFFFFFFFFBFFFFFFLL | v3);
}

- (BOOL)isInNavigationPalette
{
  return 0;
}

- (id)searchDisplayController
{
  return 0;
}

- (void)updateScopeBarBackground
{
  uint64_t v3 = [(_UISearchBarVisualProviderBase *)self searchBar];
  if (v3 && self->_scopeBarContainerView)
  {
    id v16 = v3;
    uint64_t v4 = [(_UISearchBarVisualProviderIOS *)self scopeBarBackgroundImage];

    if (v4)
    {
      scopeBarBackgroundView = self->_scopeBarBackgroundView;
      double v6 = [(_UISearchBarVisualProviderIOS *)self scopeBarBackgroundImage];
      [(UIImageView *)scopeBarBackgroundView setImage:v6];

      [(UIImageView *)self->_scopeBarBackgroundView setBackgroundColor:0];
    }
    else
    {
      BOOL v7 = [(_UISearchBarVisualProviderIOS *)self isHostedByNavigationBar];
      double v8 = self->_scopeBarBackgroundView;
      if (v7)
      {
        [(UIImageView *)v8 setHidden:1];
      }
      else
      {
        [(UIImageView *)v8 setHidden:0];
        $3CCFBAC33A89B83EF2A602DE1312B683 searchBarVisualProviderFlags = self->_searchBarVisualProviderFlags;
        double v10 = [(_UISearchBarVisualProviderIOS *)self effectiveBarTintColor];
        double v11 = v10;
        double v12 = v10;
        if ((*(_DWORD *)&searchBarVisualProviderFlags & 0x20000) != 0)
        {
          double v12 = _GetLightenedTintColor(v10);
        }
        double v13 = _UISearchBarBackgroundFillColor(*(unsigned char *)&searchBarVisualProviderFlags & 7, v12);
        [(UIImageView *)self->_scopeBarBackgroundView setBackgroundColor:v13];

        if ((*(_DWORD *)&searchBarVisualProviderFlags & 0x20000) != 0) {
        [(UIImageView *)self->_scopeBarBackgroundView setImage:0];
        }
      }
    }
    BOOL v14 = [(_UISearchBarVisualProviderIOS *)self isTranslucent];
    double v15 = 0.96;
    if (!v14) {
      double v15 = 1.0;
    }
    [(UIView *)self->_scopeBarBackgroundView setAlpha:v15];
    uint64_t v3 = v16;
  }
}

- (BOOL)backgroundLayoutNeedsUpdate
{
  return *((unsigned __int8 *)&self->_searchBarVisualProviderFlags + 1) >> 7;
}

- (void)applySearchBarStyle
{
  uint64_t v3 = [(_UISearchBarVisualProviderBase *)self searchBar];
  if (v3)
  {
    id v15 = v3;
    uint64_t v4 = [v3 _searchBarTextField];
    BOOL v5 = [v4 _systemBackgroundView];
    uint64_t v6 = *(void *)&self->_searchBarVisualProviderFlags & 0x38;
    BOOL v7 = [v15 layer];
    double v8 = v7;
    if (v6 == 16)
    {
      [v7 setAllowsGroupBlending:0];

      double v9 = [v15 layer];
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

      double v12 = [v15 layer];
      [v12 setAllowsGroupOpacity:1];

      double v13 = [v5 layer];
      [v13 setAllowsGroupBlending:1];

      [v5 setBackgroundContainer:0];
      [v4 _removeEffectsBackgroundViews];
      [v5 updateView];
    }
    [(_UISearchBarVisualProviderIOS *)self updateNeedForBackdrop];
    if (self->_backdropStyle) {
      uint64_t v14 = 2;
    }
    else {
      uint64_t v14 = (*(void *)&self->_searchBarVisualProviderFlags >> 3) & 7;
    }
    [(UISearchBarBackground *)self->_searchBarBackground setSearchBarStyle:v14];
    [(_UISearchBarVisualProviderIOS *)self updatePlaceholderColor];
    [(_UISearchBarVisualProviderIOS *)self updateMagnifyingGlassView];
    [(_UISearchBarVisualProviderIOS *)self updateRightView];
    [v15 setNeedsLayout];

    uint64_t v3 = v15;
  }
}

- (void)setBackdropStyle:(int64_t)a3
{
  BOOL v5 = [(_UISearchBarVisualProviderBase *)self searchBar];
  if (v5 && self->_backdropStyle != a3)
  {
    self->_int64_t backdropStyle = a3;
    self->_$3CCFBAC33A89B83EF2A602DE1312B683 searchBarVisualProviderFlags = ($3CCFBAC33A89B83EF2A602DE1312B683)(*(void *)&self->_searchBarVisualProviderFlags & 0xFFFFFFFFFFFFFFC7 | 0x10);
    id v12 = v5;
    [(_UISearchBarVisualProviderIOS *)self updateNeedForBackdrop];
    [(UISearchBarBackground *)self->_searchBarBackground setSearchBarStyle:(*(void *)&self->_searchBarVisualProviderFlags >> 3) & 7];
    uint64_t v6 = [v12 _searchBarTextField];
    BOOL v7 = [v6 _systemBackgroundView];
    double v8 = [v12 layer];
    [v8 setAllowsGroupBlending:0];

    double v9 = [v12 layer];
    [v9 setAllowsGroupOpacity:0];

    double v10 = [v7 layer];
    [v10 setAllowsGroupBlending:0];

    [v7 setBackgroundContainer:1];
    [v6 updateForBackdropStyle:self->_backdropStyle];
    double v11 = [(_UISearchBarVisualProviderIOS *)self colorForComponent:4 disabled:0];
    [v6 setTextColor:v11];

    [(_UISearchBarVisualProviderIOS *)self updatePlaceholderColor];
    [(_UISearchBarVisualProviderIOS *)self updateMagnifyingGlassView];
    [(_UISearchBarVisualProviderIOS *)self updateRightView];
    [v12 setNeedsLayout];

    BOOL v5 = v12;
  }
}

- (void)removeBackdropVisualEffectView
{
  [(UIView *)self->_backdropVisualEffectView removeFromSuperview];
  backdropVisualEffectView = self->_backdropVisualEffectView;
  self->_backdropVisualEffectView = 0;
}

- (void)updateNeedForBackdrop
{
  if ([(_UISearchBarVisualProviderIOS *)self usesBackdrop])
  {
    if (self->_backdropStyle == 2005)
    {
      [(_UISearchBarVisualProviderIOS *)self removeLegacyBackdropView];
      if (!self->_backdropVisualEffectView)
      {
        BOOL v5 = [UIVisualEffectView alloc];
        uint64_t v6 = +[UIBlurEffect effectWithStyle:10];
        BOOL v7 = [(UIVisualEffectView *)v5 initWithEffect:v6];
        backdropVisualEffectView = self->_backdropVisualEffectView;
        self->_backdropVisualEffectView = v7;

        [(UIView *)self->_searchBarBackground addSubview:self->_backdropVisualEffectView];
        double v9 = self->_backdropVisualEffectView;
        [(UIView *)v9 setUserInteractionEnabled:1];
      }
    }
    else
    {
      [(_UISearchBarVisualProviderIOS *)self removeBackdropVisualEffectView];
      backdrop = self->_backdrop;
      int64_t backdropStyle = self->_backdropStyle;
      if (backdrop)
      {
        [(_UIBackdropView *)backdrop transitionToPrivateStyle:backdropStyle];
      }
      else
      {
        if (backdropStyle) {
          int64_t v10 = self->_backdropStyle;
        }
        else {
          int64_t v10 = -2;
        }
        double v11 = [[_UIBackdropView alloc] initWithPrivateStyle:v10];
        id v12 = self->_backdrop;
        self->_backdrop = v11;

        [(UIView *)self->_searchBarBackground addSubview:self->_backdrop];
        [(UIView *)self->_backdrop setUserInteractionEnabled:1];
      }
      BOOL v13 = self->_backdropStyle == 0;
      uint64_t v14 = self->_backdrop;
      [(UIView *)v14 setHidden:v13];
    }
  }
  else
  {
    [(_UISearchBarVisualProviderIOS *)self removeLegacyBackdropView];
    [(_UISearchBarVisualProviderIOS *)self removeBackdropVisualEffectView];
  }
}

- (void)removeLegacyBackdropView
{
  [(UIView *)self->_backdrop removeFromSuperview];
  backdrop = self->_backdrop;
  self->_backdrop = 0;
}

- (void)setClippingViewActive:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(_UISearchBarVisualProviderBase *)self searchBar];
  if (v5)
  {
    id v10 = v5;
    uint64_t v6 = [(_UISearchBarVisualProviderBase *)self searchBar];
    BOOL v7 = [v6 traitCollection];
    uint64_t v8 = [v7 userInterfaceIdiom];

    if (v8 == 5
      || ($3CCFBAC33A89B83EF2A602DE1312B683 searchBarVisualProviderFlags = self->_searchBarVisualProviderFlags,
          (*(_DWORD *)&searchBarVisualProviderFlags & 0x4000000) == 0))
    {
      [(UIView *)self->_searchBarClippingView setClipsToBounds:v3];
      BOOL v5 = v10;
      if (v3) {
        goto LABEL_6;
      }
      goto LABEL_5;
    }
    [(UIView *)self->_searchBarClippingView setClipsToBounds:(*(void *)&self->_searchBarVisualProviderFlags & 0x8000000) == 0];
    BOOL v5 = v10;
    if ((*(_DWORD *)&searchBarVisualProviderFlags & 0x8000000) != 0)
    {
LABEL_5:
      [v10 bounds];
      -[_UISearchBarVisualProviderIOS setClippingViewBounds:](self, "setClippingViewBounds:");
      BOOL v5 = v10;
    }
  }
LABEL_6:
}

- (BOOL)isPlacedInToolbar
{
  return (*((unsigned __int8 *)&self->_searchBarVisualProviderFlags + 3) >> 1) & 1;
}

- (BOOL)isEnabled
{
  return (*((unsigned char *)&self->_searchBarVisualProviderFlags + 1) & 0x10) == 0;
}

- (id)existingSearchIconBarButtonItem
{
  return self->_searchIconBarButtonItem;
}

- (_UISearchBarVisualProviderIOS)initWithDelegate:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)_UISearchBarVisualProviderIOS;
  BOOL v3 = [(_UISearchBarVisualProviderBase *)&v9 initWithDelegate:a3];
  if (v3)
  {
    uint64_t v4 = objc_alloc_init(_UISearchBarLayout);
    currentLayout = v3->_currentLayout;
    v3->_currentLayout = v4;

    uint64_t v6 = objc_alloc_init(_UISearchBarLayout);
    prospectiveLayout = v3->_prospectiveLayout;
    v3->_prospectiveLayout = v6;

    [(_UISearchBarLayout *)v3->_prospectiveLayout setProspective:1];
  }
  return v3;
}

- (CGSize)intrinsicContentSize
{
  BOOL v3 = [(_UISearchBarVisualProviderBase *)self searchBar];
  uint64_t v4 = v3;
  if (v3)
  {
    -[_UISearchBarVisualProviderIOS defaultHeightForOrientation:](self, "defaultHeightForOrientation:", [v3 _expectedInterfaceOrientation]);
    double v6 = -1.0;
    if (v5 == 0.0) {
      double v7 = -1.0;
    }
    else {
      double v7 = v5;
    }
    if ((*((unsigned char *)&self->_searchBarVisualProviderFlags + 3) & 8) != 0)
    {
      uint64_t v8 = [(_UISearchBarVisualProviderIOS *)self transitioner];
      if (v8)
      {
        objc_super v9 = [(_UISearchBarVisualProviderIOS *)self transitioner];
        id v10 = [v9 activeLayout];
      }
      else
      {
        id v10 = self->_currentLayout;
      }

      [(_UISearchBarVisualProviderIOS *)self configureLayout:v10 forState:[(_UISearchBarLayout *)v10 representedLayoutState]];
      [(_UISearchBarLayout *)v10 prescribedSearchContainerWidth];
      if (v11 == 0.0) {
        double v6 = -1.0;
      }
      else {
        double v6 = v11;
      }
    }
  }
  else
  {
    double v7 = -1.0;
    double v6 = -1.0;
  }

  double v12 = v6;
  double v13 = v7;
  result.double height = v13;
  result.double width = v12;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  double v6 = [(_UISearchBarVisualProviderBase *)self searchBar];
  double v7 = v6;
  if (v6)
  {
    -[_UISearchBarVisualProviderIOS defaultHeightForOrientation:](self, "defaultHeightForOrientation:", [v6 _expectedInterfaceOrientation]);
    CGFloat v9 = v8;
    int v10 = dyld_program_sdk_at_least();
    double v11 = fabs(width);
    if (v10)
    {
      if (v11 >= INFINITY && v11 <= INFINITY)
      {
        double v12 = [MEMORY[0x1E4F28B00] currentHandler];
        v24.double width = width;
        v24.double height = v9;
        double v13 = NSStringFromCGSize(v24);
        [v12 handleFailureInMethod:a2, self, @"_UISearchBarVisualProviderIOS.m", 3184, @"-[UISearchBar sizeThatFits:] does not support passing non-finite values (%@)", v13 object file lineNumber description];
      }
    }
    else
    {
      if (v11 == INFINITY) {
        double v14 = 0.0;
      }
      else {
        double v14 = width;
      }
      double width = v14;
    }
    if (![(_UISearchBarVisualProviderIOS *)self isInBarButNotHosted]
      || (+[UIDevice currentDevice],
          id v15 = objc_claimAutoreleasedReturnValue(),
          uint64_t v16 = [v15 userInterfaceIdiom],
          v15,
          (v16 & 0xFFFFFFFFFFFFFFFBLL) != 1))
    {
      if (width == 0.0)
      {
        double v17 = [v7 superview];
        BOOL v18 = v17;
        if (v17)
        {
          [v17 bounds];
          double width = v19;
        }
        else if (fabs(width) < 2.22044605e-16)
        {
          BOOL v20 = [v7 _screen];
          [v20 bounds];
          double width = v21;
        }
      }
    }
  }
  else
  {
    double width = *MEMORY[0x1E4F1DB30];
    CGFloat v9 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }

  double v22 = width;
  double v23 = v9;
  result.double height = v23;
  result.double width = v22;
  return result;
}

- (double)defaultHeightForOrientation:(int64_t)a3
{
  double v5 = [(_UISearchBarVisualProviderBase *)self searchBar];
  double v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 _expectedInterfaceOrientation];
    int64_t layoutState = self->_layoutState;
    uint64_t v9 = [(_UISearchBarVisualProviderIOS *)self transitioner];
    int v10 = (void *)v9;
    if (v7 == a3)
    {
      if (v9)
      {
        double v11 = [(_UISearchBarVisualProviderIOS *)self transitioner];
        double v12 = [v11 activeLayout];

        int64_t layoutState = [(_UISearchBarLayout *)v12 representedLayoutState];
      }
      else
      {
        double v12 = self->_currentLayout;
      }
      [(_UISearchBarVisualProviderIOS *)self configureLayout:v12 forState:layoutState];
    }
    else
    {
      double v12 = self->_prospectiveLayout;
      [(_UISearchBarLayout *)self->_prospectiveLayout setRepresentedLayoutState:layoutState];
      [(_UISearchBarVisualProviderIOS *)self configureLayout:v12 forState:layoutState];
      [(_UISearchBarLayoutBase *)v12 setBarMetrics:[(_UISearchBarVisualProviderIOS *)self barMetricsForOrientation:a3]];
    }
    [(_UISearchBarLayout *)v12 naturalTotalHeight];
    double v13 = v14;
  }
  else
  {
    double v13 = 0.0;
  }

  return v13;
}

- (_UISearchBarTransitionerBase)transitioner
{
  return self->_transitioner;
}

- (void)setSearchBarStyle:(unint64_t)a3
{
  if (!self->_backdropStyle)
  {
    $3CCFBAC33A89B83EF2A602DE1312B683 searchBarVisualProviderFlags = self->_searchBarVisualProviderFlags;
    uint64_t v4 = (*(unint64_t *)&searchBarVisualProviderFlags >> 3) & 7;
    if (v4 != a3)
    {
      if (a3 != 2 || v4 == 2)
      {
        self->_$3CCFBAC33A89B83EF2A602DE1312B683 searchBarVisualProviderFlags = ($3CCFBAC33A89B83EF2A602DE1312B683)(*(void *)&searchBarVisualProviderFlags & 0xFFFFFFFFFFFFFFC7 | (8 * (a3 & 7)));
        if (a3 == 2 || v4 != 2) {
          return;
        }
      }
      else
      {
        self->_$3CCFBAC33A89B83EF2A602DE1312B683 searchBarVisualProviderFlags = ($3CCFBAC33A89B83EF2A602DE1312B683)(*(void *)&searchBarVisualProviderFlags & 0xFFFFFFFFFFFFFFC7 | 0x10);
      }
      if (self->_searchField) {
        [(_UISearchBarVisualProviderIOS *)self applySearchBarStyle];
      }
    }
  }
}

- (void)setOverrideContentInsets:(UIEdgeInsets)a3 forRectEdges:(unint64_t)a4
{
  unint64_t overriddenContentInsetEdges = self->_overriddenContentInsetEdges;
  double v6 = self->_contentInsetPrivateMinOrOverride.top + 0.0;
  if ((overriddenContentInsetEdges & 1) == 0) {
    double v6 = 0.0;
  }
  double v7 = self->_contentInsetPrivateMinOrOverride.left + 0.0;
  if ((overriddenContentInsetEdges & 2) == 0) {
    double v7 = 0.0;
  }
  double v8 = self->_contentInsetPrivateMinOrOverride.bottom + 0.0;
  if ((overriddenContentInsetEdges & 4) == 0) {
    double v8 = 0.0;
  }
  double v9 = self->_contentInsetPrivateMinOrOverride.right + 0.0;
  if ((overriddenContentInsetEdges & 8) == 0) {
    double v9 = 0.0;
  }
  double v10 = a3.top + 0.0;
  if ((a4 & 1) == 0) {
    double v10 = 0.0;
  }
  double v11 = a3.left + 0.0;
  if ((a4 & 2) == 0) {
    double v11 = 0.0;
  }
  double v12 = a3.bottom + 0.0;
  if ((a4 & 4) == 0) {
    double v12 = 0.0;
  }
  double v13 = a3.right + 0.0;
  if ((a4 & 8) == 0) {
    double v13 = 0.0;
  }
  if (v7 == v11 && v6 == v10 && v9 == v13 && v8 == v12)
  {
    if (overriddenContentInsetEdges != a4) {
      self->_unint64_t overriddenContentInsetEdges = a4;
    }
  }
  else
  {
    self->_unint64_t overriddenContentInsetEdges = a4;
    self->_contentInsetPrivateMinOrOverride.double top = v10;
    self->_contentInsetPrivateMinOrOverride.double left = v11;
    self->_contentInsetPrivateMinOrOverride.double bottom = v12;
    self->_contentInsetPrivateMinOrOverride.double right = v13;
    id v27 = [(_UISearchBarVisualProviderBase *)self searchBar];
    [v27 setNeedsLayout];
    [(_UISearchBarSearchContainerView *)self->_searchFieldContainerView setNeedsLayout];
    [(_UISearchBarScopeContainerView *)self->_scopeBarContainerView setNeedsLayout];
    if (self->_transitioner)
    {
      if (+[UIView _isInAnimationBlockWithAnimationsEnabled])
      {
        double v17 = [v27 window];

        if (v17)
        {
          [(_UISearchBarVisualProviderIOS *)self updateEffectiveContentInset];
          [(_UISearchBarVisualProviderIOS *)self effectiveContentInset];
          double v19 = v18;
          double v21 = v20;
          double v23 = v22;
          double v25 = v24;
          double v26 = [(_UISearchBarTransitionerBase *)self->_transitioner activeLayout];
          objc_msgSend(v26, "setContentInset:", v19, v21, v23, v25);

          [v27 layoutIfNeeded];
        }
      }
    }
  }
}

- (BOOL)showsCancelButton
{
  double v2 = self;
  BOOL v3 = [(_UISearchBarVisualProviderBase *)self searchBar];
  uint64_t v4 = [v3 _searchController];
  int v5 = [v4 automaticallyShowsCancelButton];

  if (v5) {
    LOBYTE(v2) = v2->_layoutState == 3;
  }
  else {
    LODWORD(v2) = (*((unsigned __int8 *)&v2->_searchBarVisualProviderFlags + 2) >> 2) & 1;
  }

  return (char)v2;
}

- (void)teardown
{
  uint64_t v4 = [(_UISearchBarVisualProviderBase *)self searchBar];
  if (!v4)
  {
    int v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2 object:self file:@"_UISearchBarVisualProviderIOS.m" lineNumber:1075 description:@"visual provider can not clean up without delegate"];
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
  [(UIView *)self->_searchFieldContainerView removeFromSuperview];
  [(UIView *)self->_promptContainerView removeFromSuperview];
  v6.receiver = self;
  v6.super_class = (Class)_UISearchBarVisualProviderIOS;
  [(_UISearchBarVisualProviderBase *)&v6 teardown];
}

- (void)setEnabled:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  double v7 = [(_UISearchBarVisualProviderBase *)self searchBar];
  double v8 = v7;
  if (v7)
  {
    $3CCFBAC33A89B83EF2A602DE1312B683 searchBarVisualProviderFlags = self->_searchBarVisualProviderFlags;
    if (((*(unint64_t *)&searchBarVisualProviderFlags >> 12) & 1) == v5)
    {
      uint64_t v10 = 4096;
      if (v5) {
        uint64_t v10 = 0;
      }
      self->_$3CCFBAC33A89B83EF2A602DE1312B683 searchBarVisualProviderFlags = ($3CCFBAC33A89B83EF2A602DE1312B683)(*(void *)&searchBarVisualProviderFlags & 0xFFFFFFFFFFFFEFFFLL | v10);
      [v7 setUserInteractionEnabled:v5];
      if (v4)
      {
        double v11 = [v8 _searchBarTextField];
        [v11 _setEnabled:v5 animated:1];
      }
      else
      {
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __53___UISearchBarVisualProviderIOS_setEnabled_animated___block_invoke;
        v23[3] = &unk_1E52DF220;
        id v24 = v8;
        BOOL v25 = v5;
        BOOL v26 = v4;
        +[UIView performWithoutAnimation:v23];
      }
      [(UIButton *)self->_cancelButton setEnabled:v5];
      double v12 = [(_UISearchBarVisualProviderIOS *)self existingSearchIconBarButtonItem];
      [v12 setEnabled:v5];
      double v13 = [v8 _searchController];
      double v14 = [v13 _navigationItemCurrentlyDisplayingSearchController];
      uint64_t v15 = [v14 _inlineSearchBarItemGroup];
      uint64_t v16 = (unsigned char *)v15;
      if (v5)
      {
        if (v15) {
          *(unsigned char *)(v15 + 89) = 0;
        }
      }
      else
      {
        double v17 = [v12 view];
        double v18 = [v17 window];
        if (v16) {
          v16[89] = v18 != 0;
        }
      }
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __53___UISearchBarVisualProviderIOS_setEnabled_animated___block_invoke_2;
      v21[3] = &unk_1E52D9FC0;
      v21[4] = self;
      BOOL v22 = v5;
      double v19 = _Block_copy(v21);
      double v20 = v19;
      if (v4) {
        +[UIView animateWithDuration:v19 animations:0.35];
      }
      else {
        (*((void (**)(void *))v19 + 2))(v19);
      }
    }
  }
}

- (void)setCenterPlaceholder:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(_UISearchBarVisualProviderBase *)self searchBar];
  if (v5 && ((*(void *)&self->_searchBarVisualProviderFlags & 0x800) == 0) == v3)
  {
    uint64_t v6 = 2048;
    if (!v3) {
      uint64_t v6 = 0;
    }
    self->_$3CCFBAC33A89B83EF2A602DE1312B683 searchBarVisualProviderFlags = ($3CCFBAC33A89B83EF2A602DE1312B683)(*(void *)&self->_searchBarVisualProviderFlags & 0xFFFFFFFFFFFFF7FFLL | v6);
    id v8 = v5;
    double v7 = [v5 textInputTraits];
    [v7 setDeferBecomingResponder:v3];

    BOOL v5 = v8;
  }
}

- (void)setBarStyle:(int64_t)a3
{
  uint64_t v5 = [(_UISearchBarVisualProviderBase *)self searchBar];
  uint64_t v6 = (void *)v5;
  if (v5)
  {
    $3CCFBAC33A89B83EF2A602DE1312B683 searchBarVisualProviderFlags = self->_searchBarVisualProviderFlags;
    if ((*(unsigned char *)&searchBarVisualProviderFlags & 7) != a3)
    {
      uint64_t v15 = (void *)v5;
      if (a3) {
        BOOL v8 = (*(unsigned char *)&searchBarVisualProviderFlags & 7) == 0;
      }
      else {
        BOOL v8 = 1;
      }
      self->_$3CCFBAC33A89B83EF2A602DE1312B683 searchBarVisualProviderFlags = ($3CCFBAC33A89B83EF2A602DE1312B683)(*(void *)&searchBarVisualProviderFlags & 0xFFFFFFFFFFFFFFF8 | a3 & 7);
      int v9 = v8;
      [(UISearchBarBackground *)self->_searchBarBackground setBarStyle:a3];
      if (!self->_barTintColor)
      {
        if (self->_cancelButton)
        {
          [(_UISearchBarVisualProviderIOS *)self setUpCancelButtonWithAppearance:0];
          [v15 setNeedsLayout];
          [(_UISearchBarSearchContainerView *)self->_searchFieldContainerView setNeedsLayout];
        }
        if (self->_promptLabel)
        {
          [(_UISearchBarVisualProviderIOS *)self setUpPromptLabel];
          [v15 setNeedsLayout];
          [(UIView *)self->_promptContainerView setNeedsLayout];
        }
        if (v9) {
          [(_UISearchBarVisualProviderIOS *)self updateSearchFieldArt];
        }
        separator = self->_separator;
        if (separator)
        {
          double v11 = [(_UISearchBarVisualProviderIOS *)self currentSeparatorImage];
          [(UIImageView *)separator setImage:v11];
        }
        [(UISegmentedControl *)self->_scopeBar setBarStyle:a3];
        [(_UISearchBarVisualProviderIOS *)self updateScopeBarBackground];
        [(_UISearchBarVisualProviderIOS *)self updateSearchBarOpacity];
      }
      uint64_t v6 = v15;
      if (v9)
      {
        [(_UISearchBarVisualProviderIOS *)self updatePlaceholderColor];
        [(_UISearchBarVisualProviderIOS *)self updateRightView];
        [(_UISearchBarVisualProviderIOS *)self updateMagnifyingGlassView];
        BOOL v12 = [(UISearchBarBackground *)self->_searchBarBackground _hasCustomBackgroundImage];
        uint64_t v6 = v15;
        if (!v12 && !self->_backdropStyle)
        {
          double v13 = [v15 _searchBarTextField];
          double v14 = [(_UISearchBarVisualProviderIOS *)self textColor];
          [v13 setTextColor:v14];

          uint64_t v6 = v15;
        }
      }
    }
  }
}

- (void)_establishScopeBarInSearchBarIfNecessary
{
  if (a1 && (*(unsigned char *)(a1 + 155) & 8) == 0 && *(void *)(a1 + 64))
  {
    id v2 = [(id)a1 searchBar];
    [v2 insertSubview:*(void *)(a1 + 64) atIndex:0];
    [v2 setNeedsLayout];
    [*(id *)(a1 + 64) setNeedsLayout];
  }
}

- (void)setTextFieldManagedInNSToolbar:(BOOL)a3
{
  if (a3)
  {
    uint64_t v4 = 0x10000000;
  }
  else
  {
    if ((*((unsigned char *)&self->_searchBarVisualProviderFlags + 3) & 0x10) != 0 && self->_searchField) {
      -[UIView addSubview:](self->_searchFieldContainerView, "addSubview:");
    }
    uint64_t v4 = 0;
  }
  self->_$3CCFBAC33A89B83EF2A602DE1312B683 searchBarVisualProviderFlags = ($3CCFBAC33A89B83EF2A602DE1312B683)(*(void *)&self->_searchBarVisualProviderFlags & 0xFFFFFFFFEFFFFFFFLL | v4);
}

- (void)setProvidesRestingMeasurementValues:(BOOL)a3
{
  uint64_t v3 = 0x20000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$3CCFBAC33A89B83EF2A602DE1312B683 searchBarVisualProviderFlags = ($3CCFBAC33A89B83EF2A602DE1312B683)(*(void *)&self->_searchBarVisualProviderFlags & 0xFFFFFFFFDFFFFFFFLL | v3);
}

- (BOOL)providesRestingMeasurementValues
{
  return (*((unsigned __int8 *)&self->_searchBarVisualProviderFlags + 3) >> 5) & 1;
}

- (void)_setSearchResultsButtonSelected:(BOOL)a3
{
  uint64_t v3 = 0x400000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$3CCFBAC33A89B83EF2A602DE1312B683 searchBarVisualProviderFlags = ($3CCFBAC33A89B83EF2A602DE1312B683)(*(void *)&self->_searchBarVisualProviderFlags & 0xFFFFFFFFFFBFFFFFLL | v3);
}

- (BOOL)isSearchResultsButtonSelected
{
  return (*((unsigned __int8 *)&self->_searchBarVisualProviderFlags + 2) >> 6) & 1;
}

- (void)_setShowsBookmarkButton:(BOOL)a3
{
  uint64_t v3 = 0x800000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$3CCFBAC33A89B83EF2A602DE1312B683 searchBarVisualProviderFlags = ($3CCFBAC33A89B83EF2A602DE1312B683)(*(void *)&self->_searchBarVisualProviderFlags & 0xFFFFFFFFFF7FFFFFLL | v3);
}

- (BOOL)showsBookmarkButton
{
  return *((unsigned __int8 *)&self->_searchBarVisualProviderFlags + 2) >> 7;
}

- (void)_setShowsSearchResultsButton:(BOOL)a3
{
  uint64_t v3 = 0x200000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$3CCFBAC33A89B83EF2A602DE1312B683 searchBarVisualProviderFlags = ($3CCFBAC33A89B83EF2A602DE1312B683)(*(void *)&self->_searchBarVisualProviderFlags & 0xFFFFFFFFFFDFFFFFLL | v3);
}

- (void)_setAutoDisableCancelButton:(BOOL)a3
{
  uint64_t v3 = 0x80000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$3CCFBAC33A89B83EF2A602DE1312B683 searchBarVisualProviderFlags = ($3CCFBAC33A89B83EF2A602DE1312B683)(*(void *)&self->_searchBarVisualProviderFlags & 0xFFFFFFFFFFF7FFFFLL | v3);
}

- (BOOL)autoDisableCancelButton
{
  return (*((unsigned __int8 *)&self->_searchBarVisualProviderFlags + 2) >> 3) & 1;
}

- (BOOL)reliesOnNavigationBarBackdrop
{
  return (*((unsigned __int8 *)&self->_searchBarVisualProviderFlags + 1) >> 5) & 1;
}

- (void)_setBarStyle:(int64_t)a3
{
  self->_$3CCFBAC33A89B83EF2A602DE1312B683 searchBarVisualProviderFlags = ($3CCFBAC33A89B83EF2A602DE1312B683)(*(void *)&self->_searchBarVisualProviderFlags & 0xFFFFFFFFFFFFFFF8 | a3 & 7);
}

- (unint64_t)searchBarStyle
{
  return (*(void *)&self->_searchBarVisualProviderFlags >> 3) & 7;
}

- (void)_setBarTranslucence:(int64_t)a3
{
  self->_$3CCFBAC33A89B83EF2A602DE1312B683 searchBarVisualProviderFlags = ($3CCFBAC33A89B83EF2A602DE1312B683)(*(void *)&self->_searchBarVisualProviderFlags & 0xFFFFFFFFFFFFFE3FLL | ((unint64_t)(a3 & 7) << 6));
}

- (int64_t)barTranslucence
{
  return (*(void *)&self->_searchBarVisualProviderFlags >> 6) & 7;
}

- (void)setSearchFieldLeftViewMode:(int64_t)a3
{
  self->_$3CCFBAC33A89B83EF2A602DE1312B683 searchBarVisualProviderFlags = ($3CCFBAC33A89B83EF2A602DE1312B683)(*(void *)&self->_searchBarVisualProviderFlags & 0xFFFFFFFFFFFFF9FFLL | ((unint64_t)(a3 & 3) << 9));
  searchField = self->_searchField;
  if (searchField) {
    [(UITextField *)searchField setLeftViewMode:a3 & 3];
  }
}

- (int64_t)searchFieldLeftViewMode
{
  if (self->_searchField) {
    return [(UITextField *)self->_searchField leftViewMode];
  }
  else {
    return (*(void *)&self->_searchBarVisualProviderFlags >> 9) & 3;
  }
}

- (void)setEnabled:(BOOL)a3
{
}

- (void)setDrawsBackgroundInPalette:(BOOL)a3
{
  if (os_variant_has_internal_diagnostics())
  {
    if (!a3)
    {
      uint64_t v4 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1853B0000, v4, OS_LOG_TYPE_FAULT, "_UISearchBarVisualProviderIOS doesn't support drawsBackgroundInPalette. This code path is a UIKit bug.", buf, 2u);
      }
    }
  }
  else if (!a3)
  {
    uint64_t v5 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &setDrawsBackgroundInPalette____s_category) + 8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_ERROR, "_UISearchBarVisualProviderIOS doesn't support drawsBackgroundInPalette. This code path is a UIKit bug.", v6, 2u);
    }
  }
}

- (BOOL)drawsBackgroundInPalette
{
  return 1;
}

- (void)setDrawsBackground:(BOOL)a3
{
  $3CCFBAC33A89B83EF2A602DE1312B683 searchBarVisualProviderFlags = self->_searchBarVisualProviderFlags;
  if (((*(unint64_t *)&searchBarVisualProviderFlags >> 14) & 1) == a3)
  {
    uint64_t v4 = 0x4000;
    if (a3) {
      uint64_t v4 = 0;
    }
    self->_$3CCFBAC33A89B83EF2A602DE1312B683 searchBarVisualProviderFlags = ($3CCFBAC33A89B83EF2A602DE1312B683)(*(void *)&searchBarVisualProviderFlags & 0xFFFFFFFFFFFFBFFFLL | v4);
    [(UIImageView *)self->_searchBarBackground setHidden:!a3];
  }
}

- (void)_setHideBackground:(BOOL)a3
{
  uint64_t v3 = 0x4000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$3CCFBAC33A89B83EF2A602DE1312B683 searchBarVisualProviderFlags = ($3CCFBAC33A89B83EF2A602DE1312B683)(*(void *)&self->_searchBarVisualProviderFlags & 0xFFFFFFFFFFFFBFFFLL | v3);
}

- (BOOL)drawsBackground
{
  return (*((unsigned char *)&self->_searchBarVisualProviderFlags + 1) & 0x40) == 0;
}

- (void)setUsesEmbeddedAppearance:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(_UISearchBarVisualProviderBase *)self searchBar];
  if (v5)
  {
    $3CCFBAC33A89B83EF2A602DE1312B683 searchBarVisualProviderFlags = self->_searchBarVisualProviderFlags;
    if (((*(void *)&searchBarVisualProviderFlags & 0x20000) == 0) == v3)
    {
      id v9 = v5;
      uint64_t v7 = 0x20000;
      if (!v3) {
        uint64_t v7 = 0;
      }
      self->_$3CCFBAC33A89B83EF2A602DE1312B683 searchBarVisualProviderFlags = ($3CCFBAC33A89B83EF2A602DE1312B683)(*(void *)&searchBarVisualProviderFlags & 0xFFFFFFFFFFFDFFFFLL | v7);
      [(UISearchBarBackground *)self->_searchBarBackground setUsesEmbeddedAppearance:v3];
      barTintColor = self->_barTintColor;
      if (barTintColor) {
        [(_UISearchBarVisualProviderIOS *)self setBarTintColor:barTintColor forceUpdate:1];
      }
      [v9 setNeedsLayout];
      uint64_t v5 = v9;
    }
  }
}

- (BOOL)usesEmbeddedAppearance
{
  return (*((unsigned __int8 *)&self->_searchBarVisualProviderFlags + 2) >> 1) & 1;
}

- (void)allowCursorToAppear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(_UISearchBarVisualProviderBase *)self searchBar];
  if (v5)
  {
    id v9 = v5;
    BOOL v6 = [(_UISearchBarVisualProviderIOS *)self centerPlaceholder];
    uint64_t v5 = v9;
    if (v6)
    {
      uint64_t v7 = [v9 _searchBarTextField];
      BOOL v8 = v7;
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

      uint64_t v5 = v9;
    }
  }
}

- (void)setShowsCancelButton:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v7 = [(_UISearchBarVisualProviderBase *)self searchBar];
  if (v7)
  {
    if (dyld_program_sdk_at_least())
    {
      BOOL v8 = [v7 _searchController];
      [v8 setAutomaticallyShowsCancelButton:0];
    }
    if (((((*((unsigned char *)&self->_searchBarVisualProviderFlags + 2) & 4) == 0) ^ v5) & 1) == 0)
    {
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __63___UISearchBarVisualProviderIOS_setShowsCancelButton_animated___block_invoke;
      aBlock[3] = &unk_1E52DD128;
      BOOL v26 = v5;
      aBlock[4] = self;
      BOOL v27 = v4;
      id v9 = v7;
      id v25 = v9;
      uint64_t v10 = (void (**)(void))_Block_copy(aBlock);
      double v11 = [v9 _searchController];
      BOOL v12 = [v11 _managedPalette];

      if (v12) {
        v10[2](v10);
      }
      else {
        +[UIView performWithoutAnimation:v10];
      }
      uint64_t v13 = 0x40000;
      if (!v5) {
        uint64_t v13 = 0;
      }
      self->_$3CCFBAC33A89B83EF2A602DE1312B683 searchBarVisualProviderFlags = ($3CCFBAC33A89B83EF2A602DE1312B683)(*(void *)&self->_searchBarVisualProviderFlags & 0xFFFFFFFFFFFBFFFFLL | v13);
      [v9 setNeedsLayout];
      [(_UISearchBarSearchContainerView *)self->_searchFieldContainerView setNeedsLayout];
      if ([(_UISearchBarVisualProviderIOS *)self centerPlaceholder]
        && v4
        && (*((unsigned char *)&self->_searchBarVisualProviderFlags + 2) & 4) != 0)
      {
        [(_UISearchBarVisualProviderIOS *)self allowCursorToAppear:0];
        double v14 = [v9 textInputTraits];
        [v14 setDeferBecomingResponder:0];
      }
      uint64_t v15 = [v9 _isHostedInlineByNavigationBar] & v5 ^ 1;
      BOOL v16 = [(_UISearchBarVisualProviderIOS *)self isHostedByNavigationBar];
      BOOL v17 = v16;
      if (v4)
      {
        if (v16) {
          [v9 _setClipsToBounds:1];
        }
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = __63___UISearchBarVisualProviderIOS_setShowsCancelButton_animated___block_invoke_2;
        v22[3] = &unk_1E52D9F70;
        id v23 = v9;
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __63___UISearchBarVisualProviderIOS_setShowsCancelButton_animated___block_invoke_3;
        v18[3] = &unk_1E52DF248;
        v18[4] = self;
        id v19 = v23;
        BOOL v20 = v17;
        char v21 = v15;
        +[UIView animateWithDuration:4 delay:v22 options:v18 animations:0.25 completion:0.0];
      }
      else
      {
        if ((*((unsigned char *)&self->_searchBarVisualProviderFlags + 2) & 4) == 0) {
          [(_UISearchBarVisualProviderIOS *)self destroyCancelButton];
        }
        if (v17) {
          [v9 _setClipsToBounds:v15];
        }
      }
      if ([(_UISearchBarVisualProviderIOS *)self isInBarButNotHosted]) {
        [(_UISearchBarVisualProviderIOS *)self displayNavBarCancelButton:(*(void *)&self->_searchBarVisualProviderFlags >> 18) & 1 animated:v4];
      }
    }
  }
}

- (void)setShowsCancelButton:(BOOL)a3
{
}

- (void)_setShowsCancelButton:(BOOL)a3
{
  uint64_t v3 = 0x40000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$3CCFBAC33A89B83EF2A602DE1312B683 searchBarVisualProviderFlags = ($3CCFBAC33A89B83EF2A602DE1312B683)(*(void *)&self->_searchBarVisualProviderFlags & 0xFFFFFFFFFFFBFFFFLL | v3);
}

- (void)setShowsSearchResultsButton:(BOOL)a3
{
  $3CCFBAC33A89B83EF2A602DE1312B683 searchBarVisualProviderFlags = self->_searchBarVisualProviderFlags;
  if (((((*(void *)&searchBarVisualProviderFlags & 0x200000) == 0) ^ a3) & 1) == 0)
  {
    uint64_t v4 = 0x200000;
    if (!a3) {
      uint64_t v4 = 0;
    }
    self->_$3CCFBAC33A89B83EF2A602DE1312B683 searchBarVisualProviderFlags = ($3CCFBAC33A89B83EF2A602DE1312B683)(*(void *)&searchBarVisualProviderFlags & 0xFFFFFFFFFFDFFFFFLL | v4);
    [(_UISearchBarVisualProviderIOS *)self updateRightView];
  }
}

- (void)setSearchResultsButtonSelected:(BOOL)a3
{
  $3CCFBAC33A89B83EF2A602DE1312B683 searchBarVisualProviderFlags = self->_searchBarVisualProviderFlags;
  if (((((*(void *)&searchBarVisualProviderFlags & 0x400000) == 0) ^ a3) & 1) == 0)
  {
    uint64_t v4 = 0x400000;
    if (!a3) {
      uint64_t v4 = 0;
    }
    self->_$3CCFBAC33A89B83EF2A602DE1312B683 searchBarVisualProviderFlags = ($3CCFBAC33A89B83EF2A602DE1312B683)(*(void *)&searchBarVisualProviderFlags & 0xFFFFFFFFFFBFFFFFLL | v4);
    [(_UISearchBarVisualProviderIOS *)self updateRightView];
  }
}

- (void)setShowsBookmarkButton:(BOOL)a3
{
  $3CCFBAC33A89B83EF2A602DE1312B683 searchBarVisualProviderFlags = self->_searchBarVisualProviderFlags;
  if (((((*(void *)&searchBarVisualProviderFlags & 0x800000) == 0) ^ a3) & 1) == 0)
  {
    uint64_t v4 = 0x800000;
    if (!a3) {
      uint64_t v4 = 0;
    }
    self->_$3CCFBAC33A89B83EF2A602DE1312B683 searchBarVisualProviderFlags = ($3CCFBAC33A89B83EF2A602DE1312B683)(*(void *)&searchBarVisualProviderFlags & 0xFFFFFFFFFF7FFFFFLL | v4);
    [(_UISearchBarVisualProviderIOS *)self updateRightView];
  }
}

- (void)animateShowsScopeBarAnimatingOut:(void *)a1
{
  if (a1)
  {
    uint64_t v4 = [a1 searchBar];
    char v5 = [a1 isHostedInlineByNavigationBar];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __66___UISearchBarVisualProviderIOS_animateShowsScopeBarAnimatingOut___block_invoke;
    aBlock[3] = &unk_1E52DC3D0;
    char v6 = v5 ^ 1;
    char v20 = a2;
    aBlock[4] = a1;
    id v7 = v4;
    id v19 = v7;
    BOOL v8 = _Block_copy(aBlock);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __66___UISearchBarVisualProviderIOS_animateShowsScopeBarAnimatingOut___block_invoke_6;
    v16[3] = &unk_1E52D9FC0;
    v16[4] = a1;
    char v17 = a2;
    +[UIView performWithoutAnimation:v16];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __66___UISearchBarVisualProviderIOS_animateShowsScopeBarAnimatingOut___block_invoke_7;
    v11[3] = &unk_1E52DA138;
    char v15 = v6;
    id v12 = v7;
    uint64_t v13 = a1;
    id v14 = v8;
    id v9 = v8;
    id v10 = v7;
    +[UIView animateWithDuration:4 delay:v11 options:0 animations:0.25 completion:0.0];
  }
}

- (void)setShowsScopeBar:(BOOL)a3 animateOpacity:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id v7 = [(_UISearchBarVisualProviderBase *)self searchBar];
  if (v7)
  {
    id v14 = v7;
    if (dyld_program_sdk_at_least())
    {
      BOOL v8 = [v14 _searchController];
      [v8 setScopeBarActivation:1];
    }
    if ([(_UISearchBarVisualProviderIOS *)self isTextFieldManagedInNSToolbar])
    {
      uint64_t v9 = 0x40000000;
      if (!v5) {
        uint64_t v9 = 0;
      }
      self->_$3CCFBAC33A89B83EF2A602DE1312B683 searchBarVisualProviderFlags = ($3CCFBAC33A89B83EF2A602DE1312B683)(*(void *)&self->_searchBarVisualProviderFlags & 0xFFFFFFFFBFFFFFFFLL | v9);
LABEL_25:
      id v7 = v14;
      goto LABEL_26;
    }
    if (v5 && !self->_cancelButton) {
      [(_UISearchBarVisualProviderIOS *)self setUpCancelButton];
    }
    $3CCFBAC33A89B83EF2A602DE1312B683 searchBarVisualProviderFlags = self->_searchBarVisualProviderFlags;
    id v7 = v14;
    if (((((*(_DWORD *)&searchBarVisualProviderFlags & 0x40000000) == 0) ^ v5) & 1) == 0)
    {
      if ((*(_DWORD *)&searchBarVisualProviderFlags & 0x4000000) != 0)
      {
        double v11 = [v14 _searchController];
        -[UISearchController _scopeBarWillShowOrHide]((uint64_t)v11);

        id v7 = v14;
        $3CCFBAC33A89B83EF2A602DE1312B683 searchBarVisualProviderFlags = self->_searchBarVisualProviderFlags;
      }
      uint64_t v12 = 0x40000000;
      if (!v5) {
        uint64_t v12 = 0;
      }
      self->_$3CCFBAC33A89B83EF2A602DE1312B683 searchBarVisualProviderFlags = ($3CCFBAC33A89B83EF2A602DE1312B683)(*(void *)&searchBarVisualProviderFlags & 0xFFFFFFFFBFFFFFFFLL | v12);
      [v7 invalidateIntrinsicContentSize];
      [v14 setNeedsLayout];
      if (v5) {
        [(UIView *)self->_scopeBarContainerView setHidden:0];
      }
      if (v4) {
        -[_UISearchBarVisualProviderIOS animateShowsScopeBarAnimatingOut:](self, !v5);
      }
      else {
        [(UIView *)self->_scopeBarContainerView setAlpha:(double)v5];
      }
      if (self->_scopeBarContainerView) {
        BOOL v13 = v5;
      }
      else {
        BOOL v13 = 0;
      }
      [(UISearchBarBackground *)self->_searchBarBackground setUsesContiguousBarBackground:v13];
      goto LABEL_25;
    }
  }
LABEL_26:
}

- (void)setShowsScopeBar:(BOOL)a3
{
}

- (void)_setShowsScopeBar:(BOOL)a3
{
  uint64_t v3 = 0x40000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$3CCFBAC33A89B83EF2A602DE1312B683 searchBarVisualProviderFlags = ($3CCFBAC33A89B83EF2A602DE1312B683)(*(void *)&self->_searchBarVisualProviderFlags & 0xFFFFFFFFBFFFFFFFLL | v3);
}

- (void)setDeferredAutomaticShowsScopeBarInNavigationBar:(id)a3 hasContent:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __93___UISearchBarVisualProviderIOS_setDeferredAutomaticShowsScopeBarInNavigationBar_hasContent___block_invoke;
  v16[3] = &unk_1E52D9F70;
  id v7 = v6;
  id v17 = v7;
  +[UIView performWithoutAnimation:v16];
  $3CCFBAC33A89B83EF2A602DE1312B683 searchBarVisualProviderFlags = self->_searchBarVisualProviderFlags;
  if ((*(_DWORD *)&searchBarVisualProviderFlags & 0x80000000) == 0 || v4)
  {
    self->_$3CCFBAC33A89B83EF2A602DE1312B683 searchBarVisualProviderFlags = ($3CCFBAC33A89B83EF2A602DE1312B683)(*(void *)&searchBarVisualProviderFlags & 0xFFFFFFFF3FFFFFFFLL | 0x40000000);
    [(_UISearchBarVisualProviderIOS *)self setUpScopeBar];
    [(UIView *)self->_scopeBarContainerView frame];
    uint64_t v10 = v9;
    uint64_t v12 = v11;
    [v7 bounds];
    CGFloat Width = CGRectGetWidth(v18);
    [(_UISearchBarVisualProviderIOS *)self scopeBarHeight];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __93___UISearchBarVisualProviderIOS_setDeferredAutomaticShowsScopeBarInNavigationBar_hasContent___block_invoke_2;
    v15[3] = &unk_1E52DA520;
    v15[4] = self;
    v15[5] = v10;
    v15[6] = v12;
    *(CGFloat *)&v15[7] = Width;
    v15[8] = v14;
    +[UIView performWithoutAnimation:v15];
    -[_UISearchBarVisualProviderIOS animateShowsScopeBarAnimatingOut:](self, 0);
    [(_UISearchBarVisualProviderIOS *)self configureLayout:self->_currentLayout];
  }
}

- (BOOL)allowsInlineScopeBar
{
  return 0;
}

- (UIView)searchFieldContainerView
{
  return (UIView *)self->_searchFieldContainerView;
}

- (void)setCancelButton:(id)a3
{
  BOOL v5 = (UIButton *)a3;
  cancelButton = self->_cancelButton;
  if (cancelButton != v5)
  {
    id v7 = v5;
    [(UIView *)cancelButton removeFromSuperview];
    objc_storeStrong((id *)&self->_cancelButton, a3);
    [(_UISearchBarVisualProviderIOS *)self updateCancelButtonForDynamicType];
    BOOL v5 = v7;
  }
}

- (void)setScopeTitles:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![(NSArray *)self->_scopeTitles isEqualToArray:v4] || v4 && !self->_scopeTitles)
  {
    BOOL v5 = (NSArray *)[v4 copy];
    scopeTitles = self->_scopeTitles;
    self->_scopeTitles = v5;

    [(_UISearchBarVisualProviderIOS *)self setUpScopeBar];
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

- (void)setPrompt:(id)a3
{
  id v9 = a3;
  id v4 = [(_UISearchBarVisualProviderBase *)self searchBar];
  if (v4)
  {
    BOOL v5 = self->_promptLabel;
    if (v9)
    {
      if (v5)
      {
        id v6 = [(UILabel *)v5 text];
        char v7 = [v9 isEqualToString:v6];

        [(UILabel *)v5 setText:v9];
        if (v7) {
          goto LABEL_10;
        }
      }
      else
      {
        [(_UISearchBarVisualProviderIOS *)self setUpPromptLabel];
        BOOL v5 = self->_promptLabel;
        [v4 invalidateIntrinsicContentSize];
        [(UILabel *)v5 setText:v9];
      }
    }
    else
    {
      if (!v5)
      {
LABEL_10:

        goto LABEL_11;
      }
      [(UIView *)self->_promptLabel removeFromSuperview];
      promptLabel = self->_promptLabel;
      self->_promptLabel = 0;

      [v4 invalidateIntrinsicContentSize];
    }
    [(UIView *)self->_promptContainerView setNeedsLayout];
    goto LABEL_10;
  }
LABEL_11:
}

- (void)setBackgroundExtension:(double)a3
{
  if (self->_backgroundExtension != a3)
  {
    BOOL v5 = [(_UISearchBarVisualProviderBase *)self searchBar];
    if (v5)
    {
      self->_double backgroundExtension = a3;
      id v6 = v5;
      [v5 setNeedsLayout];
      BOOL v5 = v6;
    }
  }
}

- (id)searchFieldIfExists
{
  return self->_searchField;
}

- (id)floatingSearchIconView
{
  floatingSearchIconView = self->_floatingSearchIconView;
  if (!floatingSearchIconView || (*((unsigned char *)&self->_searchBarVisualProviderFlags + 4) & 0x10) == 0)
  {
    [(_UISearchBarVisualProviderIOS *)self setUpFloatingSearchIconView];
    floatingSearchIconView = self->_floatingSearchIconView;
  }
  return floatingSearchIconView;
}

- (id)floatingSearchIconViewIfExists
{
  return self->_floatingSearchIconView;
}

- (UIView)floatingSearchIconBackgroundView
{
  return 0;
}

- (id)leftButton
{
  [(_UISearchBarVisualProviderIOS *)self setUpLeftButton];
  leftButton = self->_leftButton;
  return leftButton;
}

- (id)leftButtonIfExists
{
  return self->_leftButton;
}

- (id)cancelBarButtonItem
{
  uint64_t v3 = [(_UISearchBarVisualProviderBase *)self searchBar];
  if (v3)
  {
    if (!self->_cancelBarButtonItem)
    {
      id v4 = [UIBarButtonItem alloc];
      cancelButtonText = self->_cancelButtonText;
      id v6 = cancelButtonText;
      if (!cancelButtonText)
      {
        id v6 = _UINSLocalizedStringWithDefaultValue(@"Cancel", @"Cancel");
      }
      char v7 = [(UIBarButtonItem *)v4 initWithTitle:v6 style:2 target:v3 action:sel__cancelButtonPressed];
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

- (id)cancelBarButtonItemIfExists
{
  return self->_cancelBarButtonItem;
}

- (id)runtimeOnlyViews
{
  uint64_t v3 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:7];
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
  BOOL v5 = (void *)[v4 copy];

  return v5;
}

- (void)revertViewHierarchyIfNecessary
{
  __63___UISearchBarVisualProviderIOS_revertViewHierarchyIfNecessary__block_invoke(self->_searchFieldContainerView);
  promptContainerView = self->_promptContainerView;
  __63___UISearchBarVisualProviderIOS_revertViewHierarchyIfNecessary__block_invoke(promptContainerView);
}

- (void)destroyCancelButton
{
  [(UIView *)self->_cancelButton removeFromSuperview];
  cancelButton = self->_cancelButton;
  self->_cancelButton = 0;

  [(_UISearchBarLayout *)self->_prospectiveLayout setCancelButton:0];
  currentLayout = self->_currentLayout;
  [(_UISearchBarLayout *)currentLayout setCancelButton:0];
}

- (void)destroyPromptLabel
{
  [(UIView *)self->_promptContainerView removeFromSuperview];
  promptContainerView = self->_promptContainerView;
  self->_promptContainerView = 0;

  [(UIView *)self->_promptLabel removeFromSuperview];
  promptLabel = self->_promptLabel;
  self->_promptLabel = 0;
}

- (id)currentSeparatorImage
{
  uint64_t v3 = [(_UISearchBarAppearanceStorage *)self->_appearanceStorage separatorImage];

  if (v3)
  {
    id v4 = [(_UISearchBarAppearanceStorage *)self->_appearanceStorage separatorImage];
  }
  else
  {
    if ((*(unsigned char *)&self->_searchBarVisualProviderFlags & 7) != 0
      || ([(_UISearchBarVisualProviderIOS *)self effectiveBarTintColor],
          BOOL v5 = objc_claimAutoreleasedReturnValue(),
          v5,
          v5))
    {
      id v6 = [(_UISearchBarVisualProviderIOS *)self effectiveBarTintColor];
      if ((v6 || (*(void *)&self->_searchBarVisualProviderFlags & 7) == 1)
        && (uint64_t v7 = *(void *)&self->_searchBarVisualProviderFlags & 0x1C0, v6, v7 != 64))
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
      id v6 = objc_alloc_init(_UISearchBarAppearanceStorage);
      uint64_t v7 = self->_appearanceStorage;
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
    uint64_t v10 = [(_UISearchBarVisualProviderIOS *)self currentSeparatorImage];
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
    [(_UISearchBarVisualProviderIOS *)self updateSearchFieldArt];
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
  return [(_UISearchBarVisualProviderIOS *)self internalImageForSearchBarIcon:a3 state:a4 customImage:0];
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
        id v10 = objc_alloc_init(_UISearchBarAppearanceStorage);
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
        [(_UISearchBarVisualProviderIOS *)self updateRightView];
      }
      else if (a4)
      {
        uint64_t v13 = [v8 _searchBarTextField];
        [v13 _setClearButtonImage:v14 forState:a5];
      }
      else
      {
        [(_UISearchBarVisualProviderIOS *)self updateMagnifyingGlassView];
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
      uint64_t v7 = self->_appearanceStorage;
      self->_appearanceStorage = v6;

      appearanceStorage = self->_appearanceStorage;
    }
    id v8 = [(_UISearchBarAppearanceStorage *)appearanceStorage scopeBarBackgroundImage];

    if (v8 != v9) {
      [(_UISearchBarAppearanceStorage *)self->_appearanceStorage setScopeBarBackgroundImage:v9];
    }
    [(_UISearchBarVisualProviderIOS *)self setUpScopeBar];
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
    id v10 = [(_UISearchBarAppearanceStorage *)appearanceStorage searchFieldPositionAdjustment];
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
      *(double *)long long v17 = horizontal;
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
  id v2 = [(_UISearchBarAppearanceStorage *)self->_appearanceStorage searchFieldPositionAdjustment];
  uint64_t v3 = v2;
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

- (id)backgroundImageForBarPosition:(int64_t)a3 barMetrics:(int64_t)a4
{
  return [(UISearchBarBackground *)self->_searchBarBackground _backgroundImageForBarPosition:a3 barMetrics:a4];
}

- (BOOL)hasDarkUIAppearance
{
  id v2 = [(_UISearchBarVisualProviderBase *)self searchBar];
  uint64_t v3 = v2;
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

- (id)textColor
{
  uint64_t v3 = [(_UISearchBarVisualProviderBase *)self searchBar];
  if (!v3)
  {
    uint64_t v4 = +[UIColor labelColor];
    goto LABEL_7;
  }
  if (self->_backdropStyle)
  {
    uint64_t v4 = [(_UISearchBarVisualProviderIOS *)self colorForComponent:4 disabled:0];
LABEL_7:
    uint64_t v5 = (void *)v4;
    goto LABEL_8;
  }
  if ([(_UISearchBarVisualProviderIOS *)self barStyle])
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
    -[_UISearchBarVisualProviderIOS _setBarTintColor:](self, "_setBarTintColor:");
    [(_UISearchBarVisualProviderIOS *)self effectiveBarTintColorDidChange:1];
  }
}

- (void)effectiveBarTintColorDidChange:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(_UISearchBarVisualProviderBase *)self searchBar];
  if (v5)
  {
    id v12 = v5;
    $3CCFBAC33A89B83EF2A602DE1312B683 searchBarVisualProviderFlags = self->_searchBarVisualProviderFlags;
    BOOL v7 = [(_UISearchBarVisualProviderIOS *)self effectiveBarTintColor];
    double v8 = v7;
    if ((*(_DWORD *)&searchBarVisualProviderFlags & 0x20000) != 0)
    {
      double v9 = _GetLightenedTintColor(v7);
      [(UISearchBarBackground *)self->_searchBarBackground setBarTintColor:v9];
    }
    else
    {
      [(UISearchBarBackground *)self->_searchBarBackground setBarTintColor:v7];
    }

    if (self->_cancelButton) {
      [(_UISearchBarVisualProviderIOS *)self setUpCancelButtonWithAppearance:0];
    }
    if (self->_promptLabel) {
      [(_UISearchBarVisualProviderIOS *)self setUpPromptLabel];
    }
    if (v3)
    {
      [(_UISearchBarVisualProviderIOS *)self updateSearchFieldArt];
      [(_UISearchBarVisualProviderIOS *)self updateMagnifyingGlassView];
      separator = self->_separator;
      if (separator)
      {
        id v11 = [(_UISearchBarVisualProviderIOS *)self currentSeparatorImage];
        [(UIImageView *)separator setImage:v11];
      }
    }
    [(_UISearchBarVisualProviderIOS *)self updateScopeBarBackground];
    uint64_t v5 = v12;
  }
}

- (id)effectiveBarTintColor
{
  return self->_barTintColor;
}

- (void)updateCancelButtonForDynamicType
{
  if ([(_UISearchBarVisualProviderIOS *)self supportsDynamicType])
  {
    cancelButton = self->_cancelButton;
    int v4 = objc_opt_new();
    [(UIView *)cancelButton addInteraction:v4];
  }
  uint64_t v5 = self->_cancelButton;
  [(UIView *)v5 setShowsLargeContentViewer:1];
}

- (void)updateForDynamicType
{
  [(_UISearchBarVisualProviderIOS *)self updateSearchFieldForDynamicType];
  id v4 = [(_UISearchBarVisualProviderBase *)self searchBar];
  BOOL v3 = [v4 _searchBarTextField];
  [(_UISearchBarVisualProviderIOS *)self updateDictationButtonForDynamicTypeWithSearchField:v3];
}

- (void)updateForDrawsBackgroundInPalette
{
  if (os_variant_has_internal_diagnostics())
  {
    BOOL v3 = __UIFaultDebugAssertLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1853B0000, v3, OS_LOG_TYPE_FAULT, "Incorrect code path for UISearchBar in navigation palette. This is a UIKit bug.", buf, 2u);
    }
  }
  else
  {
    id v2 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &updateForDrawsBackgroundInPalette___s_category) + 8);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_1853B0000, v2, OS_LOG_TYPE_ERROR, "Incorrect code path for UISearchBar in navigation palette. This is a UIKit bug.", v4, 2u);
    }
  }
}

- (void)updateScopeBarForSelectedScope
{
}

- (void)dictationAvailabilityDidChange:(id)a3
{
  [(_UISearchBarVisualProviderIOS *)self updateForAllowedToShowDictationChange];
  int v4 = [(UISearchBarTextField *)self->_searchField showDictationButton];
  if (v4 != [(_UISearchBarVisualProviderIOS *)self canShowDictationButton])
  {
    if (v4) {
      [(_UISearchBarVisualProviderIOS *)self cleanUpDictationMicsWithSearchField:self->_searchField];
    }
    [(_UISearchBarVisualProviderIOS *)self updateRightView];
  }
  [(_UISearchBarVisualProviderIOS *)self updateDictationButtonActiveState];
}

- (void)dictationControllerDidFinish:(id)a3
{
  id v6 = [(_UISearchBarVisualProviderBase *)self searchBar];
  [v6 setUseAutomaticEndpointing:0];
  int v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self name:@"UIDictationControllerDictationDidFinish" object:0];

  uint64_t v5 = +[UIDictationController sharedInstance];
  [v5 dismissSoftwareKeyboardIfNeeded];
}

- (void)dictationButtonPressed:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [(_UISearchBarVisualProviderBase *)self searchBar];
  double v9 = [v8 _searchBarTextField];
  objc_initWeak(&location, v9);

  id v10 = +[UIKeyboardInputModeController sharedInputModeController];
  id v11 = +[UIDictationInputModeOptions dictationInputModeOptionsWithInvocationSource:@"UIDictationInputModeInvocationSourceMicButtonMicButtonInFirstResponderSearchBar"];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __66___UISearchBarVisualProviderIOS_dictationButtonPressed_withEvent___block_invoke;
  v12[3] = &unk_1E52DC308;
  objc_copyWeak(&v13, &location);
  [v10 toggleDictationForResponder:v8 withOption:v11 firstResponderSetupCompletion:v12];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (void)cleanUpDictationMicsWithSearchField:(id)a3
{
  id v7 = a3;
  if (v7)
  {
    int v4 = [v7 rightView];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass) {
      [v7 setRightView:0];
    }
  }
  [(UIView *)self->_dictationButton removeFromSuperview];
  dictationButton = self->_dictationButton;
  self->_dictationButton = 0;

  [v7 setShowDictationButton:0];
}

- (void)setDisableDictationButton:(BOOL)a3
{
}

- (void)updateDictationButtonActiveState
{
}

- (void)setUpCancelButton
{
}

- (void)setUpCancelButtonWithAppearance:(id)a3
{
  id v12 = a3;
  int v4 = [(_UISearchBarVisualProviderBase *)self searchBar];
  if (v4)
  {
    [(_UISearchBarVisualProviderIOS *)self setUpSearchBarSearchContainerIfNecessary];
    cancelButton = self->_cancelButton;
    if (cancelButton)
    {
      [(UIButton *)cancelButton setBarStyle:*(void *)&self->_searchBarVisualProviderFlags & 7];
      id v6 = [(_UISearchBarVisualProviderIOS *)self effectiveBarTintColor];
      [(UIButton *)self->_cancelButton _setTintColor:v6];
    }
    else
    {
      id v6 = self->_cancelButtonText;
      if (!v6)
      {
        _UINSLocalizedStringWithDefaultValue(@"Cancel", @"Cancel");
        id v6 = (NSString *)objc_claimAutoreleasedReturnValue();
      }
      id v7 = [UINavigationButton alloc];
      double v8 = [(_UISearchBarVisualProviderIOS *)self effectiveBarTintColor];
      double v9 = [(UINavigationButton *)v7 initWithValue:v6 width:3 style:0 barStyle:0 possibleTitles:v8 tintColor:0.0];
      id v10 = self->_cancelButton;
      self->_cancelButton = v9;

      [(UIButton *)self->_cancelButton _setAppearanceGuideClass:objc_opt_class()];
      [(UIControl *)self->_cancelButton addTarget:v4 action:sel__cancelButtonPressed forControlEvents:64];
      BOOL v11 = ([v4 isFirstResponder] & 1) != 0
         || (*((unsigned char *)&self->_searchBarVisualProviderFlags + 2) & 8) == 0;
      [(UIButton *)self->_cancelButton setEnabled:v11];
      [(_UISearchBarVisualProviderIOS *)self updateCancelButtonForDynamicType];
      [(UIView *)self->_searchFieldContainerView addSubview:self->_cancelButton];
      [(_UISearchBarSearchContainerView *)self->_searchFieldContainerView setNeedsLayout];
      [(_UISearchBarScopeContainerView *)self->_scopeBarContainerView setNeedsLayout];
      [v4 setNeedsLayout];
    }

    if (v12) {
      [(UIButton *)self->_cancelButton _applyBarButtonAppearanceStorage:v12 withTaggedSelectors:0];
    }
  }
}

- (void)setUpLeftButton
{
  BOOL v3 = [(_UISearchBarVisualProviderBase *)self searchBar];
  if (v3)
  {
    id v9 = v3;
    if (self->_leftButton)
    {
      int v4 = [(_UISearchBarVisualProviderIOS *)self effectiveBarTintColor];
      [(UINavigationButton *)self->_leftButton _setTintColor:v4];
    }
    else
    {
      uint64_t v5 = [UINavigationButton alloc];
      id v6 = [(_UISearchBarVisualProviderIOS *)self effectiveBarTintColor];
      id v7 = [(UINavigationButton *)v5 initWithValue:@"<configure>" width:3 style:0 barStyle:0 possibleTitles:v6 tintColor:0.0];
      leftButton = self->_leftButton;
      self->_leftButton = v7;

      [(UINavigationButton *)self->_leftButton _setAppearanceGuideClass:objc_opt_class()];
      [(UIView *)self->_searchFieldContainerView addSubview:self->_leftButton];
      [v9 setNeedsLayout];
    }
    BOOL v3 = v9;
  }
}

- (void)setUpPromptLabel
{
  BOOL v3 = [(_UISearchBarVisualProviderBase *)self searchBar];
  if (v3)
  {
    id v27 = v3;
    if (!_MergedGlobals_59)
    {
      int v4 = [[UIColor alloc] initWithRed:0.168 green:0.243 blue:0.353 alpha:1.0];
      uint64_t v5 = (void *)_MergedGlobals_59;
      _MergedGlobals_59 = (uint64_t)v4;
    }
    if (!qword_1EB25BA30)
    {
      id v6 = [[UIColor alloc] initWithWhite:1.0 alpha:0.44];
      id v7 = (void *)qword_1EB25BA30;
      qword_1EB25BA30 = (uint64_t)v6;
    }
    if (!qword_1EB25BA38)
    {
      double v8 = [[UIColor alloc] initWithWhite:1.0 alpha:0.6];
      id v9 = (void *)qword_1EB25BA38;
      qword_1EB25BA38 = (uint64_t)v8;
    }
    if (!qword_1EB25BA40)
    {
      id v10 = [[UIColor alloc] initWithWhite:0.0 alpha:1.0];
      BOOL v11 = (void *)qword_1EB25BA40;
      qword_1EB25BA40 = (uint64_t)v10;
    }
    if (!self->_promptLabel)
    {
      id v12 = objc_alloc_init(UILabel);
      promptLabel = self->_promptLabel;
      self->_promptLabel = v12;

      id v14 = [off_1E52D39B8 systemFontOfSize:14.0];
      [(UILabel *)self->_promptLabel setFont:v14];

      [(UILabel *)self->_promptLabel setNumberOfLines:1];
      [(UILabel *)self->_promptLabel setTextAlignment:1];
      [(UIView *)self->_promptLabel setBackgroundColor:0];
      [(UIView *)self->_promptLabel setOpaque:0];
      uint64_t v15 = [_UISearchBarPromptContainerView alloc];
      [v27 bounds];
      long long v16 = -[UIView initWithFrame:](v15, "initWithFrame:");
      promptContainerView = self->_promptContainerView;
      self->_promptContainerView = v16;

      [(UIView *)self->_promptContainerView setAutoresizingMask:2];
      [v27 addSubview:self->_promptContainerView];
      [(UIView *)self->_promptContainerView addSubview:self->_promptLabel];
      [(_UISearchBarPromptContainerView *)self->_promptContainerView setPromptLabel:self->_promptLabel];
    }
    id v18 = (id)_MergedGlobals_59;
    id v19 = (id)qword_1EB25BA30;
    char v20 = [(_UISearchBarVisualProviderIOS *)self effectiveBarTintColor];

    if (v20)
    {
      uint64_t v21 = [(_UISearchBarVisualProviderIOS *)self effectiveBarTintColor];
      BOOL v22 = _GetLightenedTintColor(v21);
      GetTintedPromptTextColor(v22);
      id v23 = (id)objc_claimAutoreleasedReturnValue();

      double v24 = 1.0;
    }
    else
    {
      if ((*(unsigned char *)&self->_searchBarVisualProviderFlags & 7) == 0)
      {
        id v25 = [v27 traitCollection];
        uint64_t v26 = [v25 userInterfaceStyle];

        if (v26 != 2)
        {
          double v24 = 1.0;
          goto LABEL_18;
        }
      }
      id v23 = (id)qword_1EB25BA38;

      uint64_t v21 = v19;
      double v24 = -1.0;
      id v19 = (id)qword_1EB25BA40;
    }

    id v18 = v23;
LABEL_18:
    [(UILabel *)self->_promptLabel setTextColor:v18];
    [(UILabel *)self->_promptLabel setShadowColor:v19];
    -[UILabel setShadowOffset:](self->_promptLabel, "setShadowOffset:", 0.0, v24);

    BOOL v3 = v27;
  }
}

- (void)setUpScopeBar
{
  id v18 = [(_UISearchBarVisualProviderBase *)self searchBar];
  if (v18 && ![(_UISearchBarVisualProviderIOS *)self isTextFieldManagedInNSToolbar])
  {
    if (!self->_scopeBar)
    {
      [v18 sizeToFit];
      [v18 bounds];
      double v4 = v3;
      double v6 = v5;
      +[UISegmentedControl defaultHeightForStyle:7 size:0];
      float v8 = v7;
      id v9 = -[UISegmentedControl initWithFrame:withStyle:withItems:]([UISegmentedControl alloc], "initWithFrame:withStyle:withItems:", 7, self->_scopeTitles, 0.0, v6 - v8, v4);
      scopeBar = self->_scopeBar;
      self->_scopeBar = v9;
      BOOL v11 = v9;

      [(UISegmentedControl *)v11 setSelectedSegmentIndex:self->_selectedScope];
      [(UIControl *)v11 addTarget:v18 action:sel__scopeChanged_ forControlEvents:4096];
      [(UISegmentedControl *)v11 setBarStyle:*(void *)&self->_searchBarVisualProviderFlags & 7];
      [(_UISearchBarVisualProviderIOS *)self scopeBarHeight];
      id v13 = -[_UISearchBarScopeContainerView initWithFrame:]([_UISearchBarScopeContainerView alloc], "initWithFrame:", 0.0, v6 - v12, v4, v12);
      scopeBarContainerView = self->_scopeBarContainerView;
      self->_scopeBarContainerView = v13;

      [(UIView *)self->_scopeBarContainerView setAutoresizingMask:2];
      uint64_t v15 = [_UISearchBarScopeBarBackground alloc];
      [(UIView *)self->_scopeBarContainerView bounds];
      long long v16 = -[UIImageView initWithFrame:](v15, "initWithFrame:");
      scopeBarBackgroundView = self->_scopeBarBackgroundView;
      self->_scopeBarBackgroundView = v16;

      [(UIView *)self->_scopeBarBackgroundView setAutoresizingMask:18];
      [(UIView *)self->_scopeBarContainerView addSubview:self->_scopeBarBackgroundView];
      [(_UISearchBarVisualProviderIOS *)self updateScopeBarBackground];
      [(UIView *)v11 setAutoresizingMask:2];
      [(UIView *)self->_scopeBarContainerView addSubview:v11];

      -[_UISearchBarVisualProviderIOS _establishScopeBarInSearchBarIfNecessary]((uint64_t)self);
    }
    [(_UISearchBarVisualProviderIOS *)self updateScopeBarBackground];
  }
}

- (id)floatingSearchIconViewSuitableForMeasuring
{
  floatingSearchIconView = self->_floatingSearchIconView;
  if (!floatingSearchIconView)
  {
    double v4 = [(_UISearchBarVisualProviderIOS *)self searchIconBarButtonItem];
    double v5 = [v4 image];

    double v6 = [[UIImageView alloc] initWithImage:v5];
    double v7 = self->_floatingSearchIconView;
    self->_floatingSearchIconView = v6;

    floatingSearchIconView = self->_floatingSearchIconView;
  }
  return floatingSearchIconView;
}

- (void)setUpFloatingSearchIconView
{
  double v3 = [(_UISearchBarVisualProviderBase *)self searchBar];
  if (v3)
  {
    $3CCFBAC33A89B83EF2A602DE1312B683 searchBarVisualProviderFlags = self->_searchBarVisualProviderFlags;
    if ((*(_DWORD *)&searchBarVisualProviderFlags & 0x8000000) != 0
      && ((*(void *)&searchBarVisualProviderFlags & 0x1000000000) == 0 || !self->_floatingSearchIconView))
    {
      id v7 = v3;
      [(_UISearchBarVisualProviderIOS *)self setUpSearchBarSearchContainerIfNecessary];
      double v5 = [(_UISearchBarVisualProviderIOS *)self floatingSearchIconViewSuitableForMeasuring];
      floatingSearchIconView = self->_floatingSearchIconView;
      self->_floatingSearchIconView = v5;

      [(UIView *)self->_searchFieldContainerView addSubview:self->_floatingSearchIconView];
      [(_UISearchBarSearchContainerView *)self->_searchFieldContainerView setNeedsLayout];
      double v3 = v7;
      *(void *)&self->_searchBarVisualProviderFlags |= 0x1000000000uLL;
    }
  }
}

- (void)driveTransitionToSearchLayoutState:(int64_t)a3
{
  if (self->_layoutState != a3)
  {
    [(_UISearchBarVisualProviderIOS *)self prepareForTransitionToSearchLayoutState:"prepareForTransitionToSearchLayoutState:"];
    double v5 = [(_UISearchBarVisualProviderBase *)self searchBar];
    v5[12] |= 2uLL;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    id v14 = __68___UISearchBarVisualProviderIOS_driveTransitionToSearchLayoutState___block_invoke;
    uint64_t v15 = &unk_1E52D9CD0;
    long long v16 = self;
    int64_t v17 = a3;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    float v8 = (void (*)(void *, uint64_t))__68___UISearchBarVisualProviderIOS_driveTransitionToSearchLayoutState___block_invoke_2;
    id v9 = &unk_1E52DF298;
    double v6 = v5;
    id v10 = v6;
    BOOL v11 = self;
    int64_t v12 = a3;
    if (+[UIView areAnimationsEnabled])
    {
      +[UIView animateWithDuration:4 delay:v13 options:v7 animations:0.25 completion:0.0];
    }
    else
    {
      v14((uint64_t)v13);
      v8(v7, 1);
    }
  }
}

- (void)prepareForTransitionToSearchLayoutState:(int64_t)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  double v6 = [(_UISearchBarVisualProviderBase *)self searchBar];
  id v7 = v6;
  if (!v6) {
    goto LABEL_56;
  }
  float v8 = [v6 _searchController];

  if (!v8)
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"_UISearchBarVisualProviderIOS.m" lineNumber:2397 description:@"layoutState transitions for a search bar without a search controller are not supported. This is an internal UIKit bug."];
  }
  uint64_t v9 = [v7 _searchController];
  if (!v9)
  {
    if (a3 != 3) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  id v10 = (void *)v9;
  unint64_t v11 = ((unint64_t)*(unsigned int *)(v9 + 1052) >> 5) & 3;
  if (!v11)
  {
    if (dyld_program_sdk_at_least()) {
      unint64_t v11 = 2;
    }
    else {
      unint64_t v11 = 3;
    }
  }

  if (a3 == 3 && v11 != 1)
  {
    if (v11 == 2)
    {
      int64_t v12 = [v7 _searchBarTextField];
      -[_UISearchBarVisualProviderIOS setActiveSearchDeferringScopeBar:](self, "setActiveSearchDeferringScopeBar:", [v12 _hasContent] ^ 1);

      goto LABEL_15;
    }
LABEL_14:
    [(_UISearchBarVisualProviderIOS *)self setActiveSearchDeferringScopeBar:0];
  }
LABEL_15:
  int64_t layoutState = self->_layoutState;
  if (self->_transitioner)
  {
    [(_UISearchBarVisualProviderIOS *)self cancelTransitionToSearchLayoutState:self->_layoutState];
    int64_t layoutState = self->_layoutState;
    if (layoutState == a3) {
      goto LABEL_56;
    }
  }
  if (!layoutState)
  {
    self->_previousLayoutState = 2;
    self->_int64_t layoutState = 2;
    id v17 = v7;
    goto LABEL_25;
  }
  id v15 = v7;
  if (layoutState == 3)
  {
    if ((unint64_t)(a3 - 1) >= 2) {
      goto LABEL_31;
    }
    long long v16 = off_1E52D5EE8;
    goto LABEL_52;
  }
  if (layoutState == 2)
  {
LABEL_25:
    int64_t layoutState = 2;
    if (a3 == 1)
    {
      long long v16 = off_1E52D5F00;
    }
    else
    {
      if (a3 != 3) {
        goto LABEL_31;
      }
      long long v16 = off_1E52D5EF8;
      int64_t layoutState = 2;
    }
    goto LABEL_52;
  }
  if (layoutState != 1) {
    goto LABEL_31;
  }
  if (a3 != 2)
  {
    if (a3 == 3)
    {
      long long v16 = off_1E52D5EF8;
      int64_t layoutState = 1;
      goto LABEL_52;
    }
LABEL_31:
    if (os_variant_has_internal_diagnostics())
    {
      uint64_t v21 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
      {
        if ((unint64_t)(layoutState + 1) > 4) {
          double v29 = @"Unknown _UISearchBarLayoutState";
        }
        else {
          double v29 = off_1E52DF300[layoutState + 1];
        }
        if ((unint64_t)(a3 + 1) > 4) {
          double v32 = @"Unknown _UISearchBarLayoutState";
        }
        else {
          double v32 = off_1E52DF328[a3 + 1];
        }
        *(_DWORD *)double v34 = 138412546;
        *(void *)&v34[4] = v29;
        *(_WORD *)&v34[12] = 2112;
        *(void *)&v34[14] = v32;
        _os_log_fault_impl(&dword_1853B0000, v21, OS_LOG_TYPE_FAULT, "UISearchBar transition from %@ to %@ is not supported. This is an internal UIKit problem.", v34, 0x16u);
      }
    }
    else
    {
      id v18 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB25BA58) + 8);
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
LABEL_41:
        if (os_variant_has_internal_diagnostics())
        {
          double v30 = __UIFaultDebugAssertLog();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
          {
            if ((unint64_t)(layoutState + 1) > 4) {
              double v31 = @"Unknown _UISearchBarLayoutState";
            }
            else {
              double v31 = off_1E52DF300[layoutState + 1];
            }
            if ((unint64_t)(a3 + 1) > 4) {
              double v33 = @"Unknown _UISearchBarLayoutState";
            }
            else {
              double v33 = off_1E52DF328[a3 + 1];
            }
            *(_DWORD *)double v34 = 138412546;
            *(void *)&v34[4] = v31;
            *(_WORD *)&v34[12] = 2112;
            *(void *)&v34[14] = v33;
            _os_log_fault_impl(&dword_1853B0000, v30, OS_LOG_TYPE_FAULT, "TODO: create and implement a transitioner for %@ to %@. This is an internal UIKit task.", v34, 0x16u);
          }
        }
        else
        {
          BOOL v22 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB25BA60) + 8);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            if ((unint64_t)(layoutState + 1) > 4) {
              id v23 = @"Unknown _UISearchBarLayoutState";
            }
            else {
              id v23 = off_1E52DF300[layoutState + 1];
            }
            if ((unint64_t)(a3 + 1) > 4) {
              double v24 = @"Unknown _UISearchBarLayoutState";
            }
            else {
              double v24 = off_1E52DF328[a3 + 1];
            }
            *(_DWORD *)double v34 = 138412546;
            *(void *)&v34[4] = v23;
            *(_WORD *)&v34[12] = 2112;
            *(void *)&v34[14] = v24;
            id v25 = v22;
            _os_log_impl(&dword_1853B0000, v25, OS_LOG_TYPE_ERROR, "TODO: create and implement a transitioner for %@ to %@. This is an internal UIKit task.", v34, 0x16u);
          }
        }
        uint64_t v26 = 0;
        goto LABEL_53;
      }
      if ((unint64_t)(layoutState + 1) > 4) {
        id v19 = @"Unknown _UISearchBarLayoutState";
      }
      else {
        id v19 = off_1E52DF300[layoutState + 1];
      }
      if ((unint64_t)(a3 + 1) > 4) {
        char v20 = @"Unknown _UISearchBarLayoutState";
      }
      else {
        char v20 = off_1E52DF328[a3 + 1];
      }
      *(_DWORD *)double v34 = 138412546;
      *(void *)&v34[4] = v19;
      *(_WORD *)&v34[12] = 2112;
      *(void *)&v34[14] = v20;
      uint64_t v21 = v18;
      _os_log_impl(&dword_1853B0000, v21, OS_LOG_TYPE_ERROR, "UISearchBar transition from %@ to %@ is not supported. This is an internal UIKit problem.", v34, 0x16u);
    }

    goto LABEL_41;
  }
  long long v16 = off_1E52D5EE0;
LABEL_52:
  uint64_t v26 = (_UISearchBarTransitionerBase *)[objc_alloc(*v16) initWithNewTransitionContextForSearchBar:v7];
  if (!v26) {
    goto LABEL_41;
  }
LABEL_53:

  transitioner = self->_transitioner;
  self->_transitioner = v26;

  if (!self->_cancelButton) {
    [(_UISearchBarVisualProviderIOS *)self setUpCancelButton];
  }
  self->_previousLayoutState = self->_layoutState;
  self->_int64_t layoutState = a3;
  -[_UISearchBarVisualProviderIOS configureLayout:forState:](self, "configureLayout:forState:", self->_prospectiveLayout, self->_previousLayoutState, *(_OWORD *)v34, *(void *)&v34[16]);
  [(_UISearchBarVisualProviderIOS *)self configureLayout:self->_currentLayout];
  double v28 = [(_UISearchBarTransitionerBase *)self->_transitioner transitionContext];
  [v28 setFromLayout:self->_prospectiveLayout];
  [v28 setToLayout:self->_currentLayout];
  [(_UISearchBarTransitionerBase *)self->_transitioner prepare];

LABEL_56:
}

- (void)freezeForAnimatedTransitionToSearchLayoutState:(int64_t)a3
{
  if (a3 == 2) {
    *(void *)&self->_searchBarVisualProviderFlags |= 0x10000uLL;
  }
}

- (void)animateTransitionToSearchLayoutState:(int64_t)a3
{
  RaiseForUnexpectedLayoutState(a3, self->_layoutState);
  BOOL v5 = [(_UISearchBarVisualProviderIOS *)self isHostedInlineByNavigationBar];
  BOOL v6 = v5;
  if (a3 == 3 && v5) {
    [(_UISearchBarVisualProviderIOS *)self setRequiresSearchTextField:1];
  }
  id v10 = [(_UISearchBarTransitionerBase *)self->_transitioner transitionContext];
  id v7 = [v10 toLayout];
  float v8 = [v10 fromLayout];
  [(_UISearchBarVisualProviderIOS *)self configureLayout:v7 forState:a3];
  if (v6)
  {
    uint64_t v9 = [(_UISearchBarVisualProviderBase *)self searchBar];
    [v9 invalidateIntrinsicContentSize];
  }
  if ([(_UISearchBarVisualProviderIOS *)self searchFieldContainerViewNeedsLayoutForTransitionFromLayoutState:v8 toLayout:v7])
  {
    [(_UISearchBarSearchContainerView *)self->_searchFieldContainerView setNeedsLayout];
  }
  [(_UISearchBarTransitionerBase *)self->_transitioner animate];
}

- (BOOL)searchFieldContainerViewNeedsLayoutForTransitionFromLayoutState:(id)a3 toLayout:(id)a4
{
  id v5 = a4;
  LOBYTE(a3) = [a3 hasCancelButton];
  char v6 = [v5 hasCancelButton];

  return a3 ^ v6;
}

- (void)_resetScopeBarFlagsAfterCompleteOrCancelTransition
{
  if (!a1) {
    return;
  }
  id v2 = [a1 searchBar];
  uint64_t v9 = [v2 _searchController];

  double v3 = v9;
  if (!v9)
  {
    uint64_t v6 = 0;
LABEL_9:
    unint64_t v8 = a1[19] & 0xFFFFFFFF7FFFFFFFLL | ((unint64_t)(v6 == 2) << 31);
    a1[19] = v8;
    if (v6 == 2) {
      a1[19] = v8 & 0xFFFFFFFFBFFFFFFFLL;
    }
    goto LABEL_11;
  }
  unsigned int v4 = v9[263];
  int v5 = (v4 >> 5) & 3;
  if (v5 != 1)
  {
    if (!v5)
    {
      dyld_program_sdk_at_least();
      double v3 = v9;
      unsigned int v4 = v9[263];
    }
    uint64_t v6 = (v4 >> 5) & 3;
    if (!v6)
    {
      BOOL v7 = dyld_program_sdk_at_least() == 0;
      double v3 = v9;
      uint64_t v6 = 2;
      if (v7) {
        uint64_t v6 = 3;
      }
    }
    goto LABEL_9;
  }
LABEL_11:
}

- (void)completeTransitionToSearchLayoutState:(int64_t)a3
{
  RaiseForUnexpectedLayoutState(a3, self->_layoutState);
  [(_UISearchBarSearchContainerView *)self->_searchFieldContainerView setFrozenLayout:0];
  *(void *)&self->_searchBarVisualProviderFlags &= ~0x10000uLL;
  [(_UISearchBarTransitionerBase *)self->_transitioner complete];
  transitioner = self->_transitioner;
  self->_transitioner = 0;

  self->_previousLayoutState = self->_layoutState;
  if (a3 != 3)
  {
    -[_UISearchBarVisualProviderIOS _resetScopeBarFlagsAfterCompleteOrCancelTransition](self);
    if (a3 == 2)
    {
      uint64_t v6 = [(UIView *)self->_searchField window];
      BOOL v7 = [v6 firstResponder];
      searchField = self->_searchField;

      if (v7 == searchField)
      {
        uint64_t v9 = [(_UISearchBarVisualProviderBase *)self searchBar];
        [v9 resignFirstResponder];

        [(UISearchTextField *)self->_searchField setText:&stru_1ED0E84C0];
        [(UISearchTextField *)self->_searchField setTokens:MEMORY[0x1E4F1CBF0]];
      }
    }
  }
  [(_UISearchBarVisualProviderIOS *)self setRequiresSearchTextField:self->_layoutState == 3];
  currentLayout = self->_currentLayout;
  [(_UISearchBarLayout *)currentLayout prepareSearchContainerLayout];
}

- (void)cancelTransitionToSearchLayoutState:(int64_t)a3
{
  [(_UISearchBarSearchContainerView *)self->_searchFieldContainerView setFrozenLayout:0];
  *(void *)&self->_searchBarVisualProviderFlags &= ~0x10000uLL;
  [(_UISearchBarTransitionerBase *)self->_transitioner cancel];
  transitioner = self->_transitioner;
  self->_transitioner = 0;

  self->_int64_t layoutState = self->_previousLayoutState;
  if (a3 == 3) {
    -[_UISearchBarVisualProviderIOS _resetScopeBarFlagsAfterCompleteOrCancelTransition](self);
  }
  [(_UISearchBarVisualProviderIOS *)self configureLayout:self->_currentLayout];
  [(_UISearchBarVisualProviderIOS *)self setRequiresSearchTextField:self->_layoutState == 3];
  if ((*((unsigned char *)&self->_searchBarVisualProviderFlags + 4) & 8) != 0)
  {
    currentLayout = self->_currentLayout;
    [(_UISearchBarLayout *)currentLayout prepareSearchContainerLayout];
  }
}

- (void)growToSearchFieldIfNecessary
{
  if (self->_layoutState == 1)
  {
    self->_previousLayoutState = 1;
    self->_int64_t layoutState = 2;
    double v3 = [(_UISearchBarVisualProviderBase *)self searchBar];
    [v3 invalidateIntrinsicContentSize];

    searchFieldContainerView = self->_searchFieldContainerView;
    [(_UISearchBarSearchContainerView *)searchFieldContainerView setNeedsLayout];
  }
}

- (void)shrinkToButtonIfNecessary
{
  int64_t layoutState = self->_layoutState;
  if (layoutState != 1)
  {
    self->_previousLayoutState = layoutState;
    self->_int64_t layoutState = 1;
    unsigned int v4 = [(_UISearchBarVisualProviderBase *)self searchBar];
    [v4 invalidateIntrinsicContentSize];

    searchFieldContainerView = self->_searchFieldContainerView;
    [(_UISearchBarSearchContainerView *)searchFieldContainerView setNeedsLayout];
  }
}

- (void)navigationBarSlideTransitionWillBegin
{
  if ([(_UISearchBarLayout *)self->_currentLayout isHostingNavBarTransitionActive])
  {
    if (os_variant_has_internal_diagnostics())
    {
      unsigned int v4 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1853B0000, v4, OS_LOG_TYPE_FAULT, "Unexpected nesting of -navigationBarSlideTransitionWillBegin may result in incorrect visibility of search scope bar", buf, 2u);
      }
    }
    else
    {
      double v3 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &navigationBarSlideTransitionWillBegin___s_category) + 8);
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)int v5 = 0;
        _os_log_impl(&dword_1853B0000, v3, OS_LOG_TYPE_ERROR, "Unexpected nesting of -navigationBarSlideTransitionWillBegin may result in incorrect visibility of search scope bar", v5, 2u);
      }
    }
  }
  [(_UISearchBarLayout *)self->_currentLayout setHostingNavBarTransitionActive:1];
}

- (void)navigationBarSlideTransitionDidEnd
{
}

- (void)setShowsSeparator:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(_UISearchBarVisualProviderBase *)self searchBar];
  if (v5)
  {
    separator = self->_separator;
    if (v3)
    {
      if (separator) {
        goto LABEL_8;
      }
      int64_t v12 = v5;
      BOOL v7 = [UIImageView alloc];
      unint64_t v8 = [(_UISearchBarVisualProviderIOS *)self currentSeparatorImage];
      uint64_t v9 = [(UIImageView *)v7 initWithImage:v8];
      id v10 = self->_separator;
      self->_separator = v9;

      [v12 addSubview:self->_separator];
      [v12 setNeedsLayout];
    }
    else
    {
      if (!separator) {
        goto LABEL_8;
      }
      int64_t v12 = v5;
      [(UIView *)separator removeFromSuperview];
      unint64_t v11 = self->_separator;
      self->_separator = 0;
    }
    int v5 = v12;
  }
LABEL_8:
}

- (void)setShowsDeleteButton:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(_UISearchBarVisualProviderBase *)self searchBar];
  if (v5)
  {
    $3CCFBAC33A89B83EF2A602DE1312B683 searchBarVisualProviderFlags = self->_searchBarVisualProviderFlags;
    if (((((*(void *)&searchBarVisualProviderFlags & 0x100000) == 0) ^ v3) & 1) == 0)
    {
      id v18 = v5;
      uint64_t v7 = 0x100000;
      if (!v3) {
        uint64_t v7 = 0;
      }
      self->_$3CCFBAC33A89B83EF2A602DE1312B683 searchBarVisualProviderFlags = ($3CCFBAC33A89B83EF2A602DE1312B683)(*(void *)&searchBarVisualProviderFlags & 0xFFFFFFFFFFEFFFFFLL | v7);
      [(_UISearchBarVisualProviderIOS *)self destroyCancelButton];
      if ((*((unsigned char *)&self->_searchBarVisualProviderFlags + 2) & 0x10) != 0)
      {
        unint64_t v8 = [v18 _searchController];
        uint64_t v9 = [v8 traitCollection];
        id v10 = v9;
        if (v9)
        {
          id v11 = v9;
        }
        else
        {
          id v11 = [v18 traitCollection];
        }
        int64_t v12 = v11;

        id v13 = [UINavigationButton alloc];
        id v14 = _UIImageWithNameAndTraitCollection(@"delete-on", v12);
        id v15 = [(UINavigationButton *)v13 initWithImage:v14 style:3];
        cancelButton = self->_cancelButton;
        self->_cancelButton = v15;

        [(UIButton *)self->_cancelButton _setAppearanceGuideClass:objc_opt_class()];
        [(UIControl *)self->_cancelButton addTarget:v18 action:sel__deleteButtonPressed forControlEvents:64];
        [(_UISearchBarVisualProviderIOS *)self updateCancelButtonForDynamicType];
        [(_UISearchBarVisualProviderIOS *)self setUpSearchBarSearchContainerIfNecessary];
        [(UIView *)self->_searchFieldContainerView addSubview:self->_cancelButton];
        BOOL v17 = ([v18 isFirstResponder] & 1) != 0
           || (*((unsigned char *)&self->_searchBarVisualProviderFlags + 2) & 8) == 0;
        [(UIButton *)self->_cancelButton setEnabled:v17];
        [(_UISearchBarSearchContainerView *)self->_searchFieldContainerView setNeedsLayout];
      }
      else
      {
        [(_UISearchBarVisualProviderIOS *)self setUpCancelButton];
      }
      int v5 = v18;
    }
  }
}

- (void)setClippingViewBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  unint64_t v8 = [(_UISearchBarVisualProviderBase *)self searchBar];
  if (v8)
  {
    searchBarClippingView = self->_searchBarClippingView;
    if (searchBarClippingView)
    {
      id v11 = v8;
      [(UIView *)searchBarClippingView frame];
      v14.origin.double x = x;
      v14.origin.double y = y;
      v14.size.double width = width;
      v14.size.double height = height;
      BOOL v10 = CGRectEqualToRect(v13, v14);
      unint64_t v8 = v11;
      if (!v10)
      {
        [v11 frame];
        -[UIView setBounds:](self->_searchBarClippingView, "setBounds:", x, y);
        -[UIView setFrame:](self->_searchBarClippingView, "setFrame:", x, y, width, height);
        unint64_t v8 = v11;
      }
    }
  }
}

- (void)navigationBarTransitionWillBegin:(int64_t)a3 willBeDisplayed:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v7 = [(_UISearchBarVisualProviderBase *)self searchBar];
  if (v7)
  {
    double v8 = 1.0;
    if (v4) {
      double v8 = 0.0;
    }
    id v21 = v7;
    [v7 setAlpha:v8];
    uint64_t v7 = v21;
    if (a3 == 2)
    {
      uint64_t v9 = self->_searchBarClippingView;
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

      -[_UISearchBarVisualProviderIOS layoutSubviewsInBounds:](self, "layoutSubviewsInBounds:", v14, v16, v18, v20);
      uint64_t v7 = v21;
    }
  }
}

- (void)navigationBarTransitionCompleted:(int64_t)a3 willBeDisplayed:(BOOL)a4
{
  uint64_t v6 = [(_UISearchBarVisualProviderBase *)self searchBar];
  if (v6)
  {
    id v7 = v6;
    [v6 setAlpha:1.0];
    uint64_t v6 = v7;
    if (a3 == 2)
    {
      [v7 bounds];
      -[UIView setFrame:](self->_searchBarClippingView, "setFrame:");
      [(UIView *)self->_searchBarClippingView setAutoresizingMask:18];
      [v7 layoutSubviews];
      uint64_t v6 = v7;
    }
  }
}

- (void)getTopAttachedTopInset:(double *)a3 bottomInset:(double *)a4 isCompact:(BOOL)a5
{
  BOOL v5 = a5;
  double v8 = [(_UISearchBarVisualProviderBase *)self searchBar];
  if (v8)
  {
    if (v5)
    {
      *a3 = 7.0;
      *a4 = 7.0;
    }
    else
    {
      id v12 = v8;
      if (_UIBarsUseNewPadHeights())
      {
        *a3 = 7.0;
        *a4 = 7.0;
      }
      else
      {
        *a3 = 4.0;
        uint64_t v9 = [v12 _screen];
        if (![v9 _isEmbeddedScreen]
          || ([v9 _peripheryInsets], double v10 = 15.0, v11 <= 0.0))
        {
          double v10 = 10.0;
        }
        *a4 = v10;
      }
      double v8 = v12;
    }
  }
}

- (void)getTopInset:(double *)a3 bottomInset:(double *)a4 forBarMetrics:(int64_t)a5 barPosition:(int64_t)a6
{
  transitioner = self->_transitioner;
  if (transitioner)
  {
    id v13 = [(_UISearchBarTransitionerBase *)transitioner activeLayout];
    -[_UISearchBarVisualProviderIOS getTopInset:bottomInset:forBarMetrics:barPosition:layoutState:](self, "getTopInset:bottomInset:forBarMetrics:barPosition:layoutState:", a3, a4, a5, a6, [v13 representedLayoutState]);
  }
  else
  {
    int64_t layoutState = self->_layoutState;
    [(_UISearchBarVisualProviderIOS *)self getTopInset:a3 bottomInset:a4 forBarMetrics:a5 barPosition:a6 layoutState:layoutState];
  }
}

- (void)getTopInset:(double *)a3 bottomInset:(double *)a4 forBarMetrics:(int64_t)a5 barPosition:(int64_t)a6 layoutState:(int64_t)a7
{
}

- (UIEdgeInsets)scopeBarInsets
{
  [(_UISearchBarVisualProviderIOS *)self configureLayout:self->_currentLayout];
  currentLayout = self->_currentLayout;
  [(_UISearchBarLayout *)currentLayout scopeContainerSpecificInsets];
  result.double right = v7;
  result.double bottom = v6;
  result.double left = v5;
  result.double top = v4;
  return result;
}

- (double)scopeBarHeight
{
  [(_UISearchBarVisualProviderIOS *)self configureLayout:self->_currentLayout];
  currentLayout = self->_currentLayout;
  [(_UISearchBarLayout *)currentLayout naturalScopeContainerHeight];
  return result;
}

- (BOOL)containsScopeBar
{
  BOOL v3 = [(_UISearchBarVisualProviderBase *)self searchBar];
  if (v3) {
    BOOL v4 = [(UIView *)self->_scopeBarContainerView isDescendantOfView:v3];
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (double)barHeightForBarMetrics:(int64_t)a3 withEffectiveInsets:(UIEdgeInsets)a4
{
  double right = a4.right;
  double bottom = a4.bottom;
  double left = a4.left;
  double top = a4.top;
  double v10 = [(_UISearchBarVisualProviderBase *)self searchBar];
  if (-[_UISearchBarVisualProviderIOS barMetricsForOrientation:](self, "barMetricsForOrientation:", [v10 _expectedInterfaceOrientation]) == a3&& (left == self->_effectiveContentInset.left ? (BOOL v11 = top == self->_effectiveContentInset.top) : (BOOL v11 = 0), v11 ? (v12 = right == self->_effectiveContentInset.right) : (v12 = 0), v12 && bottom == self->_effectiveContentInset.bottom))
  {
    int v14 = 0;
    id v13 = &OBJC_IVAR____UISearchBarVisualProviderIOS__prospectiveLayout;
  }
  else
  {
    id v13 = &OBJC_IVAR____UISearchBarVisualProviderIOS__currentLayout;
    int v14 = 1;
  }
  id v15 = *(id *)((char *)&self->super.super.isa + *v13);
  [(_UISearchBarVisualProviderIOS *)self configureLayout:v15];
  if (v14)
  {
    [v15 setBarMetrics:a3];
    objc_msgSend(v15, "setContentInset:", top, left, bottom, right);
  }
  [v15 naturalSearchFieldContainerHeight];
  double v17 = v16;

  return v17;
}

- (double)searchFieldHeight
{
  [(_UISearchBarVisualProviderIOS *)self configureLayout:self->_currentLayout];
  currentLayout = self->_currentLayout;
  [(_UISearchBarLayout *)currentLayout naturalSearchFieldHeight];
  return result;
}

- (double)barHeightForBarMetrics:(int64_t)a3 barPosition:(int64_t)a4
{
  CGFloat top = self->_effectiveContentInset.top;
  double left = self->_effectiveContentInset.left;
  double right = self->_effectiveContentInset.right;
  double bottom = self->_effectiveContentInset.bottom;
  double v11 = top;
  [(_UISearchBarVisualProviderIOS *)self getTopInset:&v11 bottomInset:&bottom forBarMetrics:a3 barPosition:a4];
  -[_UISearchBarVisualProviderIOS barHeightForBarMetrics:withEffectiveInsets:](self, "barHeightForBarMetrics:withEffectiveInsets:", a3, v11, left, bottom, right);
  return result;
}

- (double)barHeightForBarMetrics:(int64_t)a3
{
  -[_UISearchBarVisualProviderIOS barHeightForBarMetrics:withEffectiveInsets:](self, "barHeightForBarMetrics:withEffectiveInsets:", a3, self->_effectiveContentInset.top, self->_effectiveContentInset.left, self->_effectiveContentInset.bottom, self->_effectiveContentInset.right);
  return result;
}

- (double)allowedHeightInNavigationContentView
{
  return 44.0;
}

- (double)navigationBarContentHeight
{
  if (_UIBarsUseNewPadHeights()) {
    return 50.0;
  }
  [(_UISearchBarVisualProviderIOS *)self intrinsicContentSize];
  return v4;
}

- (void)displayNavBarCancelButton:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id v13 = [(_UISearchBarVisualProviderIOS *)self searchNavigationItem];
  if (v5)
  {
    double v7 = [(_UISearchBarVisualProviderIOS *)self cancelBarButtonItem];
    double v8 = (void *)MEMORY[0x1E4F1CA48];
    uint64_t v9 = [v13 rightBarButtonItems];
    cancelBarButtonItem = [v8 arrayWithArray:v9];

    [cancelBarButtonItem addObject:v7];
    [v13 setRightBarButtonItems:cancelBarButtonItem animated:v4];
  }
  else
  {
    double v11 = (void *)MEMORY[0x1E4F1CA48];
    BOOL v12 = [v13 rightBarButtonItems];
    double v7 = [v11 arrayWithArray:v12];

    [v7 removeObjectIdenticalTo:self->_cancelBarButtonItem];
    [v13 setRightBarButtonItems:v7 animated:v4];
    cancelBarButtonItem = self->_cancelBarButtonItem;
    self->_cancelBarButtonItem = 0;
  }
}

- (double)availableBoundsWidth
{
  BOOL v3 = [(_UISearchBarVisualProviderBase *)self searchBar];
  BOOL v4 = v3;
  if (v3)
  {
    [v3 bounds];
    -[_UISearchBarVisualProviderIOS availableBoundsWidthForSize:](self, "availableBoundsWidthForSize:", v5, v6);
    double v8 = v7;
  }
  else
  {
    double v8 = 0.0;
  }

  return v8;
}

- (double)availableBoundsWidthForSize:(CGSize)a3
{
  p_effectiveContentInset = &self->_effectiveContentInset;
  double v5 = a3.width - self->_effectiveContentInset.left - self->_effectiveContentInset.right;
  leftButton = self->_leftButton;
  if (leftButton)
  {
    [(UINavigationButton *)leftButton _pathTitleEdgeInsets];
    double v9 = v7 + v8;
    [(UIView *)self->_leftButton frame];
    double v5 = v5 - (CGRectGetWidth(v22) + 11.0 - v9);
  }
  if (self->_cancelButton)
  {
    if ((*((unsigned char *)&self->_searchBarVisualProviderFlags + 2) & 4) != 0)
    {
      if (![(_UISearchBarVisualProviderIOS *)self isInBarButNotHosted]
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
        double v16 = v5 - (CGRectGetWidth(v23) + 11.0 - v15 - v13);
        double right = p_effectiveContentInset->right;
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

- (BOOL)shouldCombineLandscapeBarsForOrientation:(int64_t)a3
{
  return 0;
}

- (BOOL)wouldCombineLandscapeBarsForSize:(CGSize)a3
{
  return 0;
}

- (id)searchIconBarButtonItem
{
  searchIconBarButtonItem = self->_searchIconBarButtonItem;
  if (!searchIconBarButtonItem)
  {
    BOOL v4 = [UIBarButtonItem alloc];
    double v5 = +[UIImage systemImageNamed:@"magnifyingglass"];
    double v6 = [(_UISearchBarVisualProviderBase *)self searchBar];
    double v7 = [(UIBarButtonItem *)v4 initWithImage:v5 style:0 target:v6 action:sel__searchButtonAction_];
    double v8 = self->_searchIconBarButtonItem;
    self->_searchIconBarButtonItem = v7;

    [(UIBarButtonItem *)self->_searchIconBarButtonItem setEnabled:(*(void *)&self->_searchBarVisualProviderFlags & 0x1000) == 0];
    searchIconBarButtonItem = self->_searchIconBarButtonItem;
  }
  return searchIconBarButtonItem;
}

- (void)setRequiresSearchTextField:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(_UISearchBarVisualProviderIOS *)self requiresSearchTextField];
  uint64_t v6 = 0x2000000000;
  if (!v3) {
    uint64_t v6 = 0;
  }
  self->_$3CCFBAC33A89B83EF2A602DE1312B683 searchBarVisualProviderFlags = ($3CCFBAC33A89B83EF2A602DE1312B683)(*(void *)&self->_searchBarVisualProviderFlags & 0xFFFFFFDFFFFFFFFFLL | v6);
  if (v5 != [(_UISearchBarVisualProviderIOS *)self requiresSearchTextField])
  {
    id v8 = [(_UISearchBarVisualProviderBase *)self searchBar];
    double v7 = [v8 _searchController];
    [v7 _searchBarSearchTextFieldRequirementDidChange:v8];
  }
}

- (BOOL)requiresSearchTextField
{
  if ([(_UISearchBarVisualProviderIOS *)self isHostedInlineByNavigationBar]) {
    return (*((unsigned __int8 *)&self->_searchBarVisualProviderFlags + 4) >> 5) & 1;
  }
  else {
    LOBYTE(v3) = 1;
  }
  return v3;
}

- (double)idealInlineWidthForLayoutState:(int64_t)a3
{
  if (a3 == -1 || (*(void *)&self->_searchBarVisualProviderFlags & 0x4000000) == 0) {
    return 0.0;
  }
  [(_UISearchBarVisualProviderIOS *)self setUpCancelButton];
  if (a3) {
    int64_t v5 = a3;
  }
  else {
    int64_t v5 = 2;
  }
  [(_UISearchBarVisualProviderIOS *)self configureLayout:self->_prospectiveLayout forState:v5];
  [(_UISearchBarLayout *)self->_prospectiveLayout setHostedInlineByNavigationBar:1];
  if (![(_UISearchBarVisualProviderIOS *)self isHostedInlineByNavigationBar])
  {
    [(_UISearchBarVisualProviderIOS *)self recalculatedEffectiveContentInsetForLayoutState:a3 forcingInlineCalculation:1];
    -[_UISearchBarLayoutBase setContentInset:](self->_prospectiveLayout, "setContentInset:");
  }
  prospectiveLayout = self->_prospectiveLayout;
  [(_UISearchBarLayout *)prospectiveLayout prescribedSearchContainerWidth];
  return result;
}

- (void)setLeftInsetForInlineSearch:(double)a3
{
  if (self->_leftInsetForInlineSearch != a3)
  {
    self->_double leftInsetForInlineSearch = a3;
    transitioner = self->_transitioner;
    if (transitioner)
    {
      id v5 = [(_UISearchBarTransitionerBase *)transitioner activeLayout];
      [(_UISearchBarVisualProviderIOS *)self configureLayout:v5];
    }
  }
}

- (void)setRightInsetForInlineSearch:(double)a3
{
  if (self->_rightInsetForInlineSearch != a3)
  {
    self->_double rightInsetForInlineSearch = a3;
    transitioner = self->_transitioner;
    if (transitioner)
    {
      id v5 = [(_UISearchBarTransitionerBase *)transitioner activeLayout];
      [(_UISearchBarVisualProviderIOS *)self configureLayout:v5];
    }
  }
}

- (id)description
{
  v25.receiver = self;
  v25.super_class = (Class)_UISearchBarVisualProviderIOS;
  BOOL v3 = [(_UISearchBarVisualProviderIOS *)&v25 description];
  if (!os_variant_has_internal_diagnostics()) {
    goto LABEL_2;
  }
  id v5 = [(_UISearchBarVisualProviderBase *)self searchBar];
  uint64_t v6 = [v3 stringByAppendingFormat:@" searchBar=%p effectiveContentInset={%g, %g, %g, %g}", v5, *(void *)&self->_effectiveContentInset.top, *(void *)&self->_effectiveContentInset.left, *(void *)&self->_effectiveContentInset.bottom, *(void *)&self->_effectiveContentInset.right];

  if (self->_overriddenContentInsetEdges)
  {
    double v7 = [v6 stringByAppendingString:@" [SPI contentInset overrides"];

    unint64_t overriddenContentInsetEdges = self->_overriddenContentInsetEdges;
    if (overriddenContentInsetEdges)
    {
      uint64_t v17 = objc_msgSend(v7, "stringByAppendingFormat:", @" .top=%g", *(void *)&self->_contentInsetPrivateMinOrOverride.top);

      unint64_t overriddenContentInsetEdges = self->_overriddenContentInsetEdges;
      double v7 = (void *)v17;
      if ((overriddenContentInsetEdges & 2) == 0)
      {
LABEL_8:
        if ((overriddenContentInsetEdges & 4) == 0) {
          goto LABEL_9;
        }
        goto LABEL_25;
      }
    }
    else if ((overriddenContentInsetEdges & 2) == 0)
    {
      goto LABEL_8;
    }
    uint64_t v18 = objc_msgSend(v7, "stringByAppendingFormat:", @" .left=%g", *(void *)&self->_contentInsetPrivateMinOrOverride.left);

    unint64_t overriddenContentInsetEdges = self->_overriddenContentInsetEdges;
    double v7 = (void *)v18;
    if ((overriddenContentInsetEdges & 4) == 0)
    {
LABEL_9:
      if ((overriddenContentInsetEdges & 8) == 0)
      {
LABEL_11:
        uint64_t v10 = [v7 stringByAppendingString:@"]"];
        uint64_t v6 = v7;
        goto LABEL_17;
      }
LABEL_10:
      uint64_t v9 = objc_msgSend(v7, "stringByAppendingFormat:", @" .right=%g", *(void *)&self->_contentInsetPrivateMinOrOverride.right);

      double v7 = (void *)v9;
      goto LABEL_11;
    }
LABEL_25:
    uint64_t v19 = objc_msgSend(v7, "stringByAppendingFormat:", @" .bottom=%g", *(void *)&self->_contentInsetPrivateMinOrOverride.bottom);

    double v7 = (void *)v19;
    if ((self->_overriddenContentInsetEdges & 8) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  double top = self->_contentInsetPrivateMinOrOverride.top;
  double left = self->_contentInsetPrivateMinOrOverride.left;
  double right = self->_contentInsetPrivateMinOrOverride.right;
  if (left == 0.0 && top == 0.0 && right == 0.0 && self->_contentInsetPrivateMinOrOverride.bottom == 0.0) {
    goto LABEL_18;
  }
  uint64_t v10 = [v6 stringByAppendingFormat:@" SPI min contentInset={%g, %g, %g, %g}", *(void *)&top, *(void *)&left, *(void *)&self->_contentInsetPrivateMinOrOverride.bottom, *(void *)&right];
LABEL_17:

  uint64_t v6 = (void *)v10;
LABEL_18:
  $3CCFBAC33A89B83EF2A602DE1312B683 searchBarVisualProviderFlags = self->_searchBarVisualProviderFlags;
  if ((*(void *)&searchBarVisualProviderFlags & 0x800000000) != 0)
  {
    uint64_t v15 = [v6 stringByAppendingString:@" [using searchFieldContainerLayout customization SPI]"];

    $3CCFBAC33A89B83EF2A602DE1312B683 searchBarVisualProviderFlags = self->_searchBarVisualProviderFlags;
    uint64_t v6 = (void *)v15;
  }
  if ((*(_DWORD *)&searchBarVisualProviderFlags & 0x8000000) != 0)
  {
    double v16 = [v6 stringByAppendingString:@" inline"];

    if (self->_searchIconBarButtonItem)
    {
      uint64_t v6 = objc_msgSend(v16, "stringByAppendingFormat:", @" searchIcon=%p", self->_searchIconBarButtonItem);
    }
    else
    {
      uint64_t v6 = v16;
    }
  }
  if (self->_transitioner)
  {
    uint64_t v20 = objc_msgSend(v6, "stringByAppendingFormat:", @" transitioner=%p", self->_transitioner);

    uint64_t v6 = (void *)v20;
  }
  unint64_t v21 = self->_layoutState + 1;
  if (v21 > 4) {
    CGRect v22 = @"Unknown _UISearchBarLayoutState";
  }
  else {
    CGRect v22 = off_1E52DF328[v21];
  }
  BOOL v3 = [v6 stringByAppendingFormat:@" %@", v22];

  if (self->_prospectiveLayout)
  {
    uint64_t v23 = objc_msgSend(v3, "stringByAppendingFormat:", @" prospectiveLayout=%p", self->_prospectiveLayout);

    BOOL v3 = (void *)v23;
  }
  if (self->_currentLayout)
  {
    uint64_t v24 = objc_msgSend(v3, "stringByAppendingFormat:", @" currentLayout=%p", self->_currentLayout);

    BOOL v3 = (void *)v24;
  }
LABEL_2:
  return v3;
}

- (double)hostedScopeBarTopInsetForBarMetrics:(int64_t)a3
{
  return 2.0;
}

- (void)setLayoutCustomizationDelegateSearchFieldContainerWillLayoutSubviewsCallback:(id)a3
{
  BOOL v4 = a3 != 0;
  [(_UISearchBarLayout *)self->_currentLayout setLayoutCustomizationDelegateSearchFieldContainerWillLayoutSubviewsCallback:"setLayoutCustomizationDelegateSearchFieldContainerWillLayoutSubviewsCallback:"];
  self->_$3CCFBAC33A89B83EF2A602DE1312B683 searchBarVisualProviderFlags = ($3CCFBAC33A89B83EF2A602DE1312B683)(*(void *)&self->_searchBarVisualProviderFlags & 0xFFFFFFF7FFFFFFFFLL | ((unint64_t)v4 << 35));
}

- (void)setAdditionalPaddingForCancelButtonAtLeadingEdge:(double)a3
{
  id v6 = [(_UISearchBarVisualProviderBase *)self searchBar];
  [(_UISearchBarVisualProviderIOS *)self additionalPaddingForCancelButtonAtLeadingEdge];
  if (v5 != a3)
  {
    [v6 setNeedsLayout];
    [(_UISearchBarSearchContainerView *)self->_searchFieldContainerView setNeedsLayout];
    [(_UISearchBarLayout *)self->_currentLayout setAdditionalPaddingForCancelButtonAtLeadingEdge:a3];
    [(_UISearchBarLayout *)self->_prospectiveLayout setAdditionalPaddingForCancelButtonAtLeadingEdge:a3];
  }
}

- (double)additionalPaddingForCancelButtonAtLeadingEdge
{
  [(_UISearchBarLayout *)self->_currentLayout additionalPaddingForCancelButtonAtLeadingEdge];
  return result;
}

- (void)setAdditionalPaddingForSearchFieldAtLeadingEdge:(double)a3
{
  id v6 = [(_UISearchBarVisualProviderBase *)self searchBar];
  [(_UISearchBarVisualProviderIOS *)self additionalPaddingForSearchFieldAtLeadingEdge];
  if (v5 != a3)
  {
    [v6 setNeedsLayout];
    [(_UISearchBarSearchContainerView *)self->_searchFieldContainerView setNeedsLayout];
    [(_UISearchBarLayout *)self->_currentLayout setAdditionalPaddingForSearchFieldAtLeadingEdge:a3];
    [(_UISearchBarLayout *)self->_prospectiveLayout setAdditionalPaddingForSearchFieldAtLeadingEdge:a3];
  }
}

- (double)additionalPaddingForSearchFieldAtLeadingEdge
{
  [(_UISearchBarLayout *)self->_currentLayout additionalPaddingForSearchFieldAtLeadingEdge];
  return result;
}

- (void)updateBackgroundToBackdropStyle:(int64_t)a3
{
  if (os_variant_has_internal_diagnostics())
  {
    BOOL v4 = __UIFaultDebugAssertLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1853B0000, v4, OS_LOG_TYPE_FAULT, "UISearchDisplayController should not call through to the iOS 13.0+ search bar visual provider. This is a UIKit bug", buf, 2u);
    }
  }
  else
  {
    BOOL v3 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &updateBackgroundToBackdropStyle____s_category) + 8);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)double v5 = 0;
      _os_log_impl(&dword_1853B0000, v3, OS_LOG_TYPE_ERROR, "UISearchDisplayController should not call through to the iOS 13.0+ search bar visual provider. This is a UIKit bug", v5, 2u);
    }
  }
}

- (void)setBackgroundLayoutNeedsUpdate
{
  if (os_variant_has_internal_diagnostics())
  {
    BOOL v4 = __UIFaultDebugAssertLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1853B0000, v4, OS_LOG_TYPE_FAULT, "UISearchDisplayController should not call through to the iOS 13.0+ search bar visual provider. This is a UIKit bug", buf, 2u);
    }
  }
  else
  {
    BOOL v3 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &setBackgroundLayoutNeedsUpdate___s_category) + 8);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)double v5 = 0;
      _os_log_impl(&dword_1853B0000, v3, OS_LOG_TYPE_ERROR, "UISearchDisplayController should not call through to the iOS 13.0+ search bar visual provider. This is a UIKit bug", v5, 2u);
    }
  }
  *(void *)&self->_searchBarVisualProviderFlags |= 0x8000uLL;
}

- (id)shadowView
{
  if (os_variant_has_internal_diagnostics())
  {
    BOOL v4 = __UIFaultDebugAssertLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1853B0000, v4, OS_LOG_TYPE_FAULT, "UISearchDisplayController should not call through to the iOS 13.0+ search bar visual provider. This is a UIKit bug", buf, 2u);
    }
  }
  else
  {
    id v2 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &shadowView___s_category) + 8);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)double v5 = 0;
      _os_log_impl(&dword_1853B0000, v2, OS_LOG_TYPE_ERROR, "UISearchDisplayController should not call through to the iOS 13.0+ search bar visual provider. This is a UIKit bug", v5, 2u);
    }
  }
  return 0;
}

- (id)makeShadowView
{
  if (os_variant_has_internal_diagnostics())
  {
    BOOL v4 = __UIFaultDebugAssertLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1853B0000, v4, OS_LOG_TYPE_FAULT, "UISearchDisplayController should not call through to the iOS 13.0+ search bar visual provider. This is a UIKit bug", buf, 2u);
    }
  }
  else
  {
    id v2 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &makeShadowView___s_category) + 8);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)double v5 = 0;
      _os_log_impl(&dword_1853B0000, v2, OS_LOG_TYPE_ERROR, "UISearchDisplayController should not call through to the iOS 13.0+ search bar visual provider. This is a UIKit bug", v5, 2u);
    }
  }
  return 0;
}

- (void)setShadowVisibleIfNecessary:(BOOL)a3
{
  if (os_variant_has_internal_diagnostics())
  {
    BOOL v4 = __UIFaultDebugAssertLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1853B0000, v4, OS_LOG_TYPE_FAULT, "UISearchDisplayController should not call through to the iOS 13.0+ search bar visual provider. This is a UIKit bug", buf, 2u);
    }
  }
  else
  {
    BOOL v3 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &setShadowVisibleIfNecessary____s_category) + 8);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)double v5 = 0;
      _os_log_impl(&dword_1853B0000, v3, OS_LOG_TYPE_ERROR, "UISearchDisplayController should not call through to the iOS 13.0+ search bar visual provider. This is a UIKit bug", v5, 2u);
    }
  }
}

- (void)setSearchDisplayControllerShowsCancelButton:(BOOL)a3
{
  if (os_variant_has_internal_diagnostics())
  {
    BOOL v4 = __UIFaultDebugAssertLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1853B0000, v4, OS_LOG_TYPE_FAULT, "UISearchDisplayController should not call through to the iOS 13.0+ search bar visual provider. This is a UIKit bug", buf, 2u);
    }
  }
  else
  {
    BOOL v3 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &setSearchDisplayControllerShowsCancelButton____s_category)+ 8);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)double v5 = 0;
      _os_log_impl(&dword_1853B0000, v3, OS_LOG_TYPE_ERROR, "UISearchDisplayController should not call through to the iOS 13.0+ search bar visual provider. This is a UIKit bug", v5, 2u);
    }
  }
}

- (void)setSearchDisplayController:(id)a3
{
  if (os_variant_has_internal_diagnostics())
  {
    BOOL v4 = __UIFaultDebugAssertLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1853B0000, v4, OS_LOG_TYPE_FAULT, "UISearchDisplayController is not supported by the iOS 13.0+ provider. This is a UIKit problem", buf, 2u);
    }
  }
  else
  {
    BOOL v3 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &setSearchDisplayController____s_category) + 8);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)double v5 = 0;
      _os_log_impl(&dword_1853B0000, v3, OS_LOG_TYPE_ERROR, "UISearchDisplayController is not supported by the iOS 13.0+ provider. This is a UIKit problem", v5, 2u);
    }
  }
}

- (id)searchNavigationItem
{
  if (!self->_searchNavigationItem)
  {
    BOOL v3 = [(_UISearchBarVisualProviderBase *)self searchBar];

    if (v3)
    {
      BOOL v4 = [_UISearchBarNavigationItem alloc];
      double v5 = _UINSLocalizedStringWithDefaultValue(@"Search", @"Search");
      id v6 = [(UINavigationItem *)v4 initWithTitle:v5];
      searchNavigationItem = self->_searchNavigationItem;
      self->_searchNavigationItem = v6;

      [(_UISearchBarVisualProviderIOS *)self setUpSearchNavigationItem];
    }
  }
  id v8 = self->_searchNavigationItem;
  return v8;
}

- (void)setUpSearchNavigationItem
{
  BOOL v3 = [(_UISearchBarVisualProviderBase *)self searchBar];
  if (v3)
  {
    id v9 = v3;
    BOOL v4 = self->_searchNavigationItem;
    double v5 = [v9 _searchBarTextField];
    [(_UISearchBarVisualProviderIOS *)self searchFieldHeight];
    objc_msgSend(v5, "setFrame:", 0.0, 0.0, 14433663.0, v6);
    [(UINavigationItem *)v4 setTitleView:v5];
    if ((*((unsigned char *)&self->_searchBarVisualProviderFlags + 2) & 4) != 0) {
      [(_UISearchBarVisualProviderIOS *)self displayNavBarCancelButton:1 animated:0];
    }
    double v7 = [(_UISearchBarVisualProviderIOS *)self prompt];
    [(UINavigationItem *)v4 setPrompt:v7];

    [(UIView *)self->_searchBarBackground removeFromSuperview];
    searchBarBackground = self->_searchBarBackground;
    self->_searchBarBackground = 0;

    BOOL v3 = v9;
  }
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
  self->_scopeBarPosition = a3;
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
  double top = self->_contentInsetPrivateMinOrOverride.top;
  double left = self->_contentInsetPrivateMinOrOverride.left;
  double bottom = self->_contentInsetPrivateMinOrOverride.bottom;
  double right = self->_contentInsetPrivateMinOrOverride.right;
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

- (int64_t)layoutState
{
  return self->_layoutState;
}

- (double)leftInsetForInlineSearch
{
  return self->_leftInsetForInlineSearch;
}

- (double)rightInsetForInlineSearch
{
  return self->_rightInsetForInlineSearch;
}

- (int64_t)previousLayoutState
{
  return self->_previousLayoutState;
}

- (double)backgroundExtension
{
  return self->_backgroundExtension;
}

- (_UISearchBarLayout)currentLayout
{
  return self->_currentLayout;
}

- (void)setCurrentLayout:(id)a3
{
}

- (_UISearchBarLayout)prospectiveLayout
{
  return self->_prospectiveLayout;
}

- (void)setProspectiveLayout:(id)a3
{
}

- (void)setTransitioner:(id)a3
{
}

@end