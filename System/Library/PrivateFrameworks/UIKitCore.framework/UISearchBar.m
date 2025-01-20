@interface UISearchBar
+ (void)_initializeForIdiom:(int64_t)a3;
- (BOOL)_activeSearchDeferringScopeBar;
- (BOOL)_allowsInlineScopeBar;
- (BOOL)_containedInNavigationPalette;
- (BOOL)_contentHuggingDefault_isUsuallyFixedHeight;
- (BOOL)_disableAutomaticKeyboardUI;
- (BOOL)_effectivelySupportsDynamicType;
- (BOOL)_enableAutomaticKeyboardPressDone;
- (BOOL)_forceCenteredPlaceholderLayout;
- (BOOL)_forceLegacyVisual;
- (BOOL)_hasCustomAutolayoutNeighborSpacingForAttribute:(int64_t *)a3;
- (BOOL)_hasDarkUIAppearance;
- (BOOL)_hideNavigationBarBackButton;
- (BOOL)_hideNavigationBarCenterBarButtons;
- (BOOL)_hideNavigationBarLeadingBarButtons;
- (BOOL)_hideNavigationBarStandardTitle;
- (BOOL)_hideNavigationBarTrailingBarButtons;
- (BOOL)_isHostedByNavigationBar;
- (BOOL)_isHostedInlineByNavigationBar;
- (BOOL)_isInBarButNotHosted;
- (BOOL)_isTextFieldManagedInNSToolbar;
- (BOOL)_navigationBarHeightShouldBeIncreasedByTabBarHeight;
- (BOOL)_ownsInputAccessoryView;
- (BOOL)_providesRestingMeasurementValues;
- (BOOL)_reliesOnNavigationBarBackdrop;
- (BOOL)_requiresSearchTextField;
- (BOOL)_scopeBarIsVisible;
- (BOOL)_searchBarTextFieldShouldBeginEditing;
- (BOOL)_searchBarTextFieldShouldChangeCharactersInRange:(_NSRange)a3 replacementString:(id)a4;
- (BOOL)_searchBarTextFieldShouldClear;
- (BOOL)_searchBarTextFieldShouldEndEditing;
- (BOOL)_searchBarTextFieldShouldScrollToVisibleWhenBecomingFirstResponder;
- (BOOL)_shouldCombineLandscapeBars;
- (BOOL)_shouldCombineLandscapeBarsForOrientation:(int64_t)a3;
- (BOOL)_shouldUseNavigationBarHeight;
- (BOOL)_showDictationDisplayInSearchBar;
- (BOOL)_showingDictationButton;
- (BOOL)_showsHelperPlaceholder;
- (BOOL)_supportsLayoutStates;
- (BOOL)_transplanting;
- (BOOL)_usesLegacyVisualProvider;
- (BOOL)_wantsTwoPartTransition;
- (BOOL)_wouldCombineLandscapeBarsForSize:(CGSize)a3;
- (BOOL)becomeFirstResponder;
- (BOOL)canBecomeFirstResponder;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)canResignFirstResponder;
- (BOOL)centerPlaceholder;
- (BOOL)drawsBackground;
- (BOOL)drawsBackgroundInPalette;
- (BOOL)isElementAccessibilityExposedToInterfaceBuilder;
- (BOOL)isEnabled;
- (BOOL)isFirstResponder;
- (BOOL)isLookToDictateEnabled;
- (BOOL)isSearchResultsButtonSelected;
- (BOOL)isTranslucent;
- (BOOL)pretendsIsInBar;
- (BOOL)resignFirstResponder;
- (BOOL)respondsToSelector:(SEL)a3;
- (BOOL)scribbleInteractionShouldDelayFocus:(id)a3;
- (BOOL)showsBookmarkButton;
- (BOOL)showsCancelButton;
- (BOOL)showsScopeBar;
- (BOOL)showsSearchResultsButton;
- (BOOL)usesEmbeddedAppearance;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (Class)_classForSearchTextField;
- (NSArray)_navigationBarContentOverlayRects;
- (NSArray)scopeButtonTitles;
- (NSDictionary)scopeBarButtonTitleTextAttributesForState:(UIControlState)state;
- (NSInteger)selectedScopeButtonIndex;
- (NSString)description;
- (NSString)placeholder;
- (NSString)prompt;
- (NSString)text;
- (UIBarButtonItem)_existingSearchIconBarButtonItem;
- (UIBarButtonItem)_searchIconBarButtonItem;
- (UIBarStyle)barStyle;
- (UIButton)_leftButton;
- (UIColor)barTintColor;
- (UIEdgeInsets)_effectiveContentInset;
- (UIEdgeInsets)_scopeBarInsets;
- (UIEdgeInsets)contentInset;
- (UIImage)backgroundImage;
- (UIImage)backgroundImageForBarPosition:(UIBarPosition)barPosition barMetrics:(UIBarMetrics)barMetrics;
- (UIImage)imageForSearchBarIcon:(UISearchBarIcon)icon state:(UIControlState)state;
- (UIImage)scopeBarBackgroundImage;
- (UIImage)scopeBarButtonBackgroundImageForState:(UIControlState)state;
- (UIImage)scopeBarButtonDividerImageForLeftSegmentState:(UIControlState)leftState rightSegmentState:(UIControlState)rightState;
- (UIImage)searchFieldBackgroundImageForState:(UIControlState)state;
- (UIOffset)positionAdjustmentForSearchBarIcon:(UISearchBarIcon)icon;
- (UIOffset)searchFieldBackgroundPositionAdjustment;
- (UIOffset)searchTextPositionAdjustment;
- (UISearchBar)init;
- (UISearchBar)initWithCoder:(NSCoder *)coder;
- (UISearchBar)initWithFrame:(CGRect)frame;
- (UISearchBarStyle)searchBarStyle;
- (UISearchBarTextField)_searchBarTextField;
- (UISearchController)_searchController;
- (UITextInputAssistantItem)inputAssistantItem;
- (UIView)_viewStackedInNavigationBar;
- (UIView)inputAccessoryView;
- (_UISearchBarSearchContainerLayoutCustomizationDelegate)_searchFieldContainerLayoutCustomizationDelegate;
- (_UISearchBarVisualProviderBase)_visualProvider;
- (double)_additionalPaddingForCancelButtonAtLeadingEdge;
- (double)_additionalPaddingForSearchFieldAtLeadingEdge;
- (double)_autolayoutSpacingAtEdge:(int)a3 forAttribute:(int64_t)a4 inContainer:(id)a5 isGuide:(BOOL)a6;
- (double)_barHeightForBarMetrics:(int64_t)a3;
- (double)_barHeightForBarMetrics:(int64_t)a3 barPosition:(int64_t)a4;
- (double)_defaultAutolayoutSpacing;
- (double)_defaultHeight;
- (double)_defaultHeightForOrientation:(int64_t)a3;
- (double)_heightAllowanceForTopSearchBarInTitleViewLocation;
- (double)_idealInlineWidthForLayoutState:(int64_t)a3;
- (double)_leftInsetForInlineSearch;
- (double)_navigationBarBackButtonAlpha;
- (double)_navigationBarBackButtonMaximumWidth;
- (double)_navigationBarContentHeight;
- (double)_navigationBarContentHeightExtension;
- (double)_navigationBarLeadingBarButtonsAlpha;
- (double)_navigationBarTrailingBarButtonsAlpha;
- (double)_overrideInlineAactiveWidth;
- (double)_overrideInlineInactiveWidth;
- (double)_rightInsetForInlineSearch;
- (double)_scopeBarHeight;
- (double)_widthForButtonBarItemLayout;
- (id)_animatedAppearanceBarButtonItem;
- (id)_backgroundView;
- (id)_cancelButton;
- (id)_cancelButtonText;
- (id)_colorForComponent:(unint64_t)a3 disabled:(BOOL)a4;
- (id)_containingNavigationPalette;
- (id)_makeShadowView;
- (id)_presentationBackgroundBlurEffectForTraitCollection:(id)a3;
- (id)_scopeBar;
- (id)_scopeBarContainerView;
- (id)_searchDisplayControllerNavigationItem;
- (id)_searchField;
- (id)_selectedTokens;
- (id)_separatorImage;
- (id)_textColor;
- (id)_tokens;
- (id)_traitCollectionOverridesForNavigationBarTraitCollection:(id)a3;
- (id)_uiktest_placeholderLabelColor;
- (id)_viewForChildViews;
- (id)cancelButton;
- (id)controller;
- (id)delegate;
- (id)focusGroupIdentifier;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)keyCommands;
- (id)methodSignatureForSelector:(SEL)a3;
- (id)preferredFocusEnvironments;
- (id)preferredFocusedView;
- (id)textInputTraits;
- (int64_t)_backdropStyle;
- (int64_t)_barMetricsForOrientation:(int64_t)a3;
- (int64_t)_barPosition;
- (int64_t)_expectedInterfaceOrientation;
- (int64_t)_layoutState;
- (int64_t)_preferredAlignment;
- (int64_t)_preferredContentSizeForSize:(int64_t)a3;
- (int64_t)_textInputSource;
- (int64_t)searchFieldLeftViewMode;
- (unint64_t)_scopeBarPosition;
- (void)_addSubview:(id)a3 positioned:(int64_t)a4 relativeTo:(id)a5;
- (void)_allowCursorToAppear:(BOOL)a3;
- (void)_animateTransitionToSearchLayoutState:(int64_t)a3;
- (void)_bookmarkButtonPressed;
- (void)_cancelButtonPressed;
- (void)_cancelOperation:(id)a3;
- (void)_cancelTransitionToSearchLayoutState:(int64_t)a3;
- (void)_commonInit;
- (void)_completeTransitionToSearchLayoutState:(int64_t)a3;
- (void)_containerSafeAreaInsetsDidChange:(id)a3;
- (void)_deleteButtonPressed;
- (void)_destroyCancelButton;
- (void)_didChangeFromIdiom:(int64_t)a3 onScreen:(id)a4 traverseHierarchy:(BOOL)a5;
- (void)_didMoveFromWindow:(id)a3 toWindow:(id)a4;
- (void)_dismissScopeBarIfNecessary;
- (void)_driveTransitionToSearchLayoutState:(int64_t)a3;
- (void)_freezeForAnimatedTransitionToSearchLayoutState:(int64_t)a3;
- (void)_getOverrideContentInsets:(UIEdgeInsets *)a3 overriddenEdges:(unint64_t *)a4;
- (void)_growToSearchFieldIfNecessary;
- (void)_identifyBarContainer;
- (void)_insertToken:(id)a3 atIndex:(unint64_t)a4;
- (void)_navigationBarSlideTransitionDidEnd;
- (void)_navigationBarSlideTransitionWillBegin;
- (void)_navigationBarTransitionCompleted:(int64_t)a3 willBeDisplayed:(BOOL)a4;
- (void)_navigationBarTransitionWillBegin:(int64_t)a3 willBeDisplayed:(BOOL)a4;
- (void)_performNavigationBarTransition:(int64_t)a3 willBeDisplayed:(BOOL)a4;
- (void)_populateArchivedSubviews:(id)a3;
- (void)_prepareForTransitionToSearchLayoutState:(int64_t)a3;
- (void)_presentScopeBarIfNecessary;
- (void)_removeTokenAtIndex:(unint64_t)a3;
- (void)_replaceSearchTextWithToken:(id)a3;
- (void)_resetIfNecessaryForNavigationBarHosting:(BOOL)a3;
- (void)_resultsListButtonPressed;
- (void)_scopeChanged:(id)a3;
- (void)_scopeIndexChanged:(int64_t)a3;
- (void)_searchButtonAction:(id)a3;
- (void)_searchFieldBeginEditing;
- (void)_searchFieldEditingChanged;
- (void)_searchFieldEndEditing;
- (void)_searchFieldReturnPressed;
- (void)_searchFieldSelectionChanged;
- (void)_searchFieldTextChanged:(BOOL)a3;
- (void)_searchFieldTokensChanged;
- (void)_setActiveSearchDeferringScopeBar:(BOOL)a3;
- (void)_setAdditionalPaddingForCancelButtonAtLeadingEdge:(double)a3;
- (void)_setAdditionalPaddingForSearchFieldAtLeadingEdge:(double)a3;
- (void)_setAllowsInlineScopeBar:(BOOL)a3;
- (void)_setAutoDisableCancelButton:(BOOL)a3;
- (void)_setBackdropStyle:(int64_t)a3;
- (void)_setBackgroundLayoutNeedsUpdate;
- (void)_setBarPosition:(int64_t)a3;
- (void)_setCancelButtonText:(id)a3;
- (void)_setClassForSearchTextField:(Class)a3;
- (void)_setDataSource:(id)a3 navigationItem:(id)a4 titleLocation:(int64_t)a5;
- (void)_setDeferredAutomaticShowsScopeBarInNavigationBar:(id)a3 hasContent:(BOOL)a4;
- (void)_setDisableDictationButton:(BOOL)a3;
- (void)_setDisableFocus:(BOOL)a3;
- (void)_setEnabled:(BOOL)a3;
- (void)_setEnabled:(BOOL)a3 animated:(BOOL)a4;
- (void)_setForceLegacyVisual:(BOOL)a3;
- (void)_setHelperPlaceholder:(id)a3;
- (void)_setHelperPlaceholderOverride:(id)a3;
- (void)_setHostedByNavigationBar:(BOOL)a3;
- (void)_setHostedInlineByNavigationBar:(BOOL)a3;
- (void)_setLeftInsetForInlineSearch:(double)a3;
- (void)_setMaskActive:(BOOL)a3;
- (void)_setMaskBounds:(CGRect)a3;
- (void)_setOverrideContentInsets:(UIEdgeInsets)a3 forRectEdges:(unint64_t)a4;
- (void)_setOverrideInlineActiveWidth:(double)a3;
- (void)_setOverrideInlineInactiveWidth:(double)a3;
- (void)_setProvidesRestingMeasurementValues:(BOOL)a3;
- (void)_setReliesOnNavigationBarBackdrop:(BOOL)a3;
- (void)_setRequiresLegacyVisualProvider;
- (void)_setRequiresSearchTextField:(BOOL)a3;
- (void)_setRightInsetForInlineSearch:(double)a3;
- (void)_setScopeBarHidden:(BOOL)a3;
- (void)_setScopeBarPosition:(unint64_t)a3;
- (void)_setSearchController:(id)a3;
- (void)_setSearchFieldContainerLayoutCustomizationDelegate:(id)a3;
- (void)_setSeparatorImage:(id)a3;
- (void)_setShadowVisibleIfNecessary:(BOOL)a3;
- (void)_setShowDictationDisplayInSearchBar:(BOOL)a3;
- (void)_setShowsCancelButton:(BOOL)a3;
- (void)_setShowsDeleteButton:(BOOL)a3;
- (void)_setShowsScopeBar:(BOOL)a3 animateOpacity:(BOOL)a4;
- (void)_setShowsSeparator:(BOOL)a3;
- (void)_setTextFieldManagedInNSToolbar:(BOOL)a3;
- (void)_setTokenBackgroundColor:(id)a3;
- (void)_setTransplanting:(BOOL)a3;
- (void)_setUpVisualProvider;
- (void)_setupCancelButton;
- (void)_setupCancelButtonWithAppearance:(id)a3;
- (void)_shrinkToButtonIfNecessary;
- (void)_updateBackgroundToBackdropStyle:(int64_t)a3;
- (void)_updateEffectiveContentInset;
- (void)_updateForNewSearchFieldText:(id)a3;
- (void)_updateInsetsForTableView:(id)a3;
- (void)_updateNavigationBarLayoutInsertDataForSearchBar:(id)a3 collapsibleScopeBar:(id)a4 forLayoutState:(int64_t)a5;
- (void)bringSubviewToFront:(id)a3;
- (void)dealloc;
- (void)didMoveToSuperview;
- (void)didMoveToWindow;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)insertTextSuggestion:(id)a3;
- (void)layoutMarginsDidChange;
- (void)layoutSubviews;
- (void)reloadInputViews;
- (void)safeAreaInsetsDidChange;
- (void)sendSubviewToBack:(id)a3;
- (void)setBackgroundImage:(UIImage *)backgroundImage;
- (void)setBackgroundImage:(UIImage *)backgroundImage forBarPosition:(UIBarPosition)barPosition barMetrics:(UIBarMetrics)barMetrics;
- (void)setBackgroundImage:(id)a3 forBarMetrics:(int64_t)a4;
- (void)setBarStyle:(UIBarStyle)barStyle;
- (void)setBarTintColor:(UIColor *)barTintColor;
- (void)setBounds:(CGRect)a3;
- (void)setCancelButton:(id)a3;
- (void)setCenter:(CGPoint)a3;
- (void)setCenterPlaceholder:(BOOL)a3;
- (void)setContentInset:(UIEdgeInsets)a3;
- (void)setController:(id)a3;
- (void)setDelegate:(id)delegate;
- (void)setDrawsBackground:(BOOL)a3;
- (void)setDrawsBackgroundInPalette:(BOOL)a3;
- (void)setEnabled:(BOOL)enabled;
- (void)setFocusGroupIdentifier:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setImage:(UIImage *)iconImage forSearchBarIcon:(UISearchBarIcon)icon state:(UIControlState)state;
- (void)setInputAccessoryView:(UIView *)inputAccessoryView;
- (void)setKeyboardAppearance:(int64_t)a3;
- (void)setNeedsLayout;
- (void)setPlaceholder:(NSString *)placeholder;
- (void)setPositionAdjustment:(UIOffset)adjustment forSearchBarIcon:(UISearchBarIcon)icon;
- (void)setPrompt:(NSString *)prompt;
- (void)setScopeBarBackgroundImage:(UIImage *)scopeBarBackgroundImage;
- (void)setScopeBarButtonBackgroundImage:(UIImage *)backgroundImage forState:(UIControlState)state;
- (void)setScopeBarButtonDividerImage:(UIImage *)dividerImage forLeftSegmentState:(UIControlState)leftState rightSegmentState:(UIControlState)rightState;
- (void)setScopeBarButtonTitleTextAttributes:(NSDictionary *)attributes forState:(UIControlState)state;
- (void)setScopeButtonTitles:(NSArray *)scopeButtonTitles;
- (void)setSearchBarStyle:(UISearchBarStyle)searchBarStyle;
- (void)setSearchFieldBackgroundImage:(UIImage *)backgroundImage forState:(UIControlState)state;
- (void)setSearchFieldBackgroundPositionAdjustment:(UIOffset)searchFieldBackgroundPositionAdjustment;
- (void)setSearchFieldLeftViewMode:(int64_t)a3;
- (void)setSearchResultsButtonSelected:(BOOL)searchResultsButtonSelected;
- (void)setSearchTextPositionAdjustment:(UIOffset)searchTextPositionAdjustment;
- (void)setSelectedScopeButtonIndex:(NSInteger)selectedScopeButtonIndex;
- (void)setSemanticContentAttribute:(int64_t)a3;
- (void)setShowsBookmarkButton:(BOOL)showsBookmarkButton;
- (void)setShowsCancelButton:(BOOL)showsCancelButton;
- (void)setShowsCancelButton:(BOOL)showsCancelButton animated:(BOOL)animated;
- (void)setShowsScopeBar:(BOOL)showsScopeBar;
- (void)setShowsSearchResultsButton:(BOOL)showsSearchResultsButton;
- (void)setText:(NSString *)text;
- (void)setTintColor:(UIColor *)tintColor;
- (void)setTranslucent:(BOOL)translucent;
- (void)setUsesEmbeddedAppearance:(BOOL)a3;
- (void)set_cancelButtonText:(id)a3;
- (void)set_forceCenteredPlaceholderLayout:(BOOL)a3;
- (void)takeTraitsFrom:(id)a3;
- (void)tappedSearchBar:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)willMoveToSuperview:(id)a3;
@end

@implementation UISearchBar

+ (void)_initializeForIdiom:(int64_t)a3
{
  if ((_initializeForIdiom__didInitializeForCarPlay & 1) == 0)
  {
    id v5 = (id)objc_opt_class();
    if (a3 == 3 && v5 == a1)
    {
      _initializeForIdiom__didInitializeForCarPlay = 1;
      id v7 = +[UITraitCollection traitCollectionWithUserInterfaceIdiom:3];
      v6 = +[UIView appearanceForTraitCollection:v7];
      [v6 setBorderStyle:3];
    }
  }
}

- (BOOL)isFirstResponder
{
  v2 = [(UISearchBar *)self _searchBarTextField];
  char v3 = [v2 isEditing];

  return v3;
}

- (void)didMoveToWindow
{
  char v3 = [(UIView *)self window];

  if (v3)
  {
    id v4 = [(_UISearchBarVisualProviderBase *)self->_visualProvider searchDisplayController];
    [v4 _updateSearchBarMaskIfNecessary];
  }
}

- (BOOL)_isHostedInlineByNavigationBar
{
  return [(_UISearchBarVisualProviderBase *)self->_visualProvider isHostedInlineByNavigationBar];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)UISearchBar;
  [(UIView *)&v11 traitCollectionDidChange:v4];
  id v5 = [(UIView *)self traitCollection];
  v6 = [v4 preferredContentSizeCategory];
  id v7 = [v5 preferredContentSizeCategory];
  if ([v6 isEqual:v7])
  {
  }
  else
  {
    BOOL v8 = [(UISearchBar *)self _effectivelySupportsDynamicType];

    if (v8)
    {
      [(_UISearchBarVisualProviderBase *)self->_visualProvider updateForDynamicType];
      [(UIView *)self invalidateIntrinsicContentSize];
    }
  }
  if (v4)
  {
    _UIRecordTraitUsage((unint64_t)v4, 0x13uLL);
    uint64_t v9 = v4[16];
    if (v5)
    {
LABEL_7:
      _UIRecordTraitUsage((unint64_t)v5, 0x13uLL);
      uint64_t v10 = v5[16];
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v9 = 0;
    if (v5) {
      goto LABEL_7;
    }
  }
  uint64_t v10 = 0;
LABEL_8:
  if (v9 != v10) {
    [(_UISearchBarVisualProviderBase *)self->_visualProvider updateForSemanticContext];
  }
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)UISearchBar;
  [(UIView *)&v3 layoutSubviews];
  [(_UISearchBarVisualProviderBase *)self->_visualProvider layoutSubviews];
}

- (void)setCenter:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if (![(_UISearchBarVisualProviderBase *)self->_visualProvider isFrozenForDismissalCrossfade])
  {
    v6.receiver = self;
    v6.super_class = (Class)UISearchBar;
    -[UIView setCenter:](&v6, sel_setCenter_, x, y);
  }
}

- (UISearchController)_searchController
{
  return self->__searchController;
}

- (BOOL)_effectivelySupportsDynamicType
{
  return dyld_program_sdk_at_least();
}

- (int64_t)_expectedInterfaceOrientation
{
  objc_super v3 = [(UIView *)self window];
  if (v3) {
    goto LABEL_2;
  }
  searchController = self->__searchController;
  if (!searchController)
  {
    objc_super v3 = 0;
LABEL_9:
    int64_t v5 = 1;
    goto LABEL_10;
  }
  objc_super v3 = [(UIViewController *)searchController _window];
  if (!v3) {
    goto LABEL_9;
  }
LABEL_2:
  uint64_t v4 = [v3 _windowInterfaceOrientation];
  if (!v4) {
    uint64_t v4 = [(id)UIApp _sceneInterfaceOrientationFromWindow:v3];
  }
  int64_t v5 = v4;
LABEL_10:

  return v5;
}

- (int64_t)_barPosition
{
  return [(_UISearchBarVisualProviderBase *)self->_visualProvider barPosition];
}

- (void)_updateEffectiveContentInset
{
}

- (BOOL)_contentHuggingDefault_isUsuallyFixedHeight
{
  return 1;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)UISearchBar;
  if (-[UISearchBar respondsToSelector:](&v7, sel_respondsToSelector_))
  {
    char v4 = 1;
  }
  else
  {
    int64_t v5 = [(UISearchBar *)self textInputTraits];
    char v4 = objc_opt_respondsToSelector();
  }
  return v4 & 1;
}

- (void)_updateNavigationBarLayoutInsertDataForSearchBar:(id)a3 collapsibleScopeBar:(id)a4 forLayoutState:(int64_t)a5
{
}

- (void)setTintColor:(UIColor *)tintColor
{
  v3.receiver = self;
  v3.super_class = (Class)UISearchBar;
  [(UIView *)&v3 setTintColor:tintColor];
}

- (BOOL)centerPlaceholder
{
  return [(_UISearchBarVisualProviderBase *)self->_visualProvider centerPlaceholder];
}

- (BOOL)showsSearchResultsButton
{
  return [(_UISearchBarVisualProviderBase *)self->_visualProvider showsSearchResultsButton];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[_UISearchBarVisualProviderBase sizeThatFits:](self->_visualProvider, "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (id)textInputTraits
{
  textInputTraits = self->_textInputTraits;
  if (!textInputTraits)
  {
    double v4 = objc_alloc_init(UITextInputTraits);
    int64_t v5 = self->_textInputTraits;
    self->_textInputTraits = v4;

    [(UITextInputTraits *)self->_textInputTraits setIsSingleLineDocument:1];
    textInputTraits = self->_textInputTraits;
  }
  return textInputTraits;
}

- (BOOL)showsScopeBar
{
  return [(_UISearchBarVisualProviderBase *)self->_visualProvider showsScopeBar];
}

- (UIView)_viewStackedInNavigationBar
{
  return [(_UISearchBarVisualProviderBase *)self->_visualProvider viewStackedInNavigationBar];
}

- (void)setBackgroundImage:(UIImage *)backgroundImage forBarPosition:(UIBarPosition)barPosition barMetrics:(UIBarMetrics)barMetrics
{
  BOOL v8 = backgroundImage;
  if (barMetrics == UIBarMetricsCompactPrompt || barMetrics == UIBarMetricsCompact)
  {
    if (byte_1EB25D01A) {
      goto LABEL_14;
    }
    byte_1EB25D01A = 1;
    objc_super v11 = "UIBarMetricsCompact";
    v12 = "UIBarMetricsCompactPrompt";
    uint64_t v9 = @"%s customization of %@ for %s or %s is ignored.";
  }
  else
  {
    if (barPosition == 4)
    {
      if (byte_1EB25D01C) {
        goto LABEL_14;
      }
      byte_1EB25D01C = 1;
      uint64_t v10 = "UIBarPositionBottomAttached";
    }
    else
    {
      if (barPosition != UIBarPositionBottom)
      {
        v13 = v8;
        [(_UISearchBarVisualProviderBase *)self->_visualProvider setBackgroundImage:v8 forBarPosition:barPosition barMetrics:barMetrics];
        goto LABEL_13;
      }
      if (byte_1EB25D01B) {
        goto LABEL_14;
      }
      byte_1EB25D01B = 1;
      uint64_t v10 = "UIBarPositionBottom";
    }
    objc_super v11 = v10;
    uint64_t v9 = @"%s customization of %@ for %s is ignored.";
  }
  v13 = v8;
  NSLog(&v9->isa, "UISearchBar", @"background image", v11, v12);
LABEL_13:
  BOOL v8 = v13;
LABEL_14:
}

- (id)_colorForComponent:(unint64_t)a3 disabled:(BOOL)a4
{
  return [(_UISearchBarVisualProviderBase *)self->_visualProvider colorForComponent:a3 disabled:a4];
}

- (UISearchBar)initWithFrame:(CGRect)frame
{
  v6.receiver = self;
  v6.super_class = (Class)UISearchBar;
  double v3 = -[UIView initWithFrame:](&v6, sel_initWithFrame_, frame.origin.x, frame.origin.y, frame.size.width, frame.size.height);
  double v4 = v3;
  if (v3)
  {
    [(UISearchBar *)v3 _commonInit];
    [(UISearchBar *)v4 setNeedsLayout];
  }
  return v4;
}

- (void)setNeedsLayout
{
  v3.receiver = self;
  v3.super_class = (Class)UISearchBar;
  [(UIView *)&v3 setNeedsLayout];
  [(_UISearchBarVisualProviderBase *)self->_visualProvider invalidateLayout];
}

- (Class)_classForSearchTextField
{
  classForSearchTextField = self->_classForSearchTextField;
  if (!classForSearchTextField) {
    classForSearchTextField = objc_opt_class();
  }
  return (Class)classForSearchTextField;
}

- (UISearchBarTextField)_searchBarTextField
{
  objc_super v3 = [(_UISearchBarVisualProviderBase *)self->_visualProvider searchField];
  if (!self->_didAddScribbleInteraction)
  {
    self->_didAddScribbleInteraction = 1;
    double v4 = [[UIScribbleInteraction alloc] initWithDelegate:self];
    [(UIScribbleInteraction *)v4 _setDefaultSystemInteraction:1];
    [v3 addInteraction:v4];
  }
  return (UISearchBarTextField *)v3;
}

- (void)_updateForNewSearchFieldText:(id)a3
{
  id v10 = a3;
  double v4 = [(UISearchBar *)self searchField];
  int64_t v5 = [v4 text];
  if (v5)
  {
    objc_super v6 = [(UISearchBar *)self searchField];
    objc_super v7 = [v6 text];
    BOOL v8 = [v7 length] != 0;
  }
  else
  {
    BOOL v8 = 0;
  }

  [(UISearchBar *)self _hideOrResetHelperPlaceHolder:v8];
  uint64_t v9 = [(_UISearchBarVisualProviderBase *)self->_visualProvider searchDisplayController];
  [v9 searchBar:self textDidChange:v10];

  [(UISearchController *)self->__searchController _searchBar:self textDidChange:v10 programatically:1];
}

double __27__UISearchBar_setDelegate___block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v11 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_searchBar:proposedSearchFieldFrame:", v11, a2, a3, a4, a5);
  double v13 = v12;

  return v13;
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (![(_UISearchBarVisualProviderBase *)self->_visualProvider isFrozenForDismissalCrossfade])
  {
    [(UIView *)self bounds];
    double v9 = v8;
    double v11 = v10;
    v12.receiver = self;
    v12.super_class = (Class)UISearchBar;
    -[UIView setBounds:](&v12, sel_setBounds_, x, y, width, height);
    -[_UISearchBarVisualProviderBase updateIfNecessaryForOldSize:](self->_visualProvider, "updateIfNecessaryForOldSize:", v9, v11);
  }
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (![(_UISearchBarVisualProviderBase *)self->_visualProvider isFrozenForDismissalCrossfade])
  {
    [(UIView *)self bounds];
    double v9 = v8;
    double v11 = v10;
    v12.receiver = self;
    v12.super_class = (Class)UISearchBar;
    -[UIView setFrame:](&v12, sel_setFrame_, x, y, width, height);
    -[_UISearchBarVisualProviderBase updateIfNecessaryForOldSize:](self->_visualProvider, "updateIfNecessaryForOldSize:", v9, v11);
  }
}

- (void)setPlaceholder:(NSString *)placeholder
{
  double v4 = placeholder;
  id v5 = [(UISearchBar *)self _searchBarTextField];
  [v5 setPlaceholder:v4];
}

- (void)_setSearchController:(id)a3
{
  double v8 = (UISearchController *)a3;
  if (!v8 && self->__searchController && [(UISearchBar *)self _isHostedByNavigationBar]) {
    [(UIView *)self removeFromSuperview];
  }
  self->__searchController = v8;
  if (![(UISearchBar *)self _usesLegacyVisualProvider]) {
    [(_UISearchBarVisualProviderBase *)self->_visualProvider resetLayoutState];
  }
  searchController = self->__searchController;
  if (searchController)
  {
    unint64_t v5 = ((unint64_t)searchController->_controllerFlags >> 5) & 3;
    if (!v5)
    {
      int v6 = dyld_program_sdk_at_least();
      unint64_t v5 = 2;
      if (!v6) {
        unint64_t v5 = 3;
      }
    }
    BOOL v7 = v5 == 2;
  }
  else
  {
    BOOL v7 = 0;
  }
  [(_UISearchBarVisualProviderBase *)self->_visualProvider setActiveSearchDeferringScopeBar:v7];
}

- (void)_setAutoDisableCancelButton:(BOOL)a3
{
}

- (void)setDelegate:(id)delegate
{
  objc_initWeak(&location, delegate);
  if ([(UISearchBar *)self _usesLegacyVisualProvider])
  {
    id v4 = objc_loadWeakRetained(&location);
    objc_storeWeak((id *)&self->_delegate, v4);
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v6 = objc_opt_respondsToSelector();

    id v7 = objc_loadWeakRetained(&location);
    char v8 = objc_opt_respondsToSelector();

    id v9 = objc_loadWeakRetained(&location);
    objc_storeWeak((id *)&self->_delegate, v9);

    if (v8)
    {
      objc_copyWeak(&to, &location);
      objc_initWeak(&from, self);
      visualProvider = self->_visualProvider;
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __27__UISearchBar_setDelegate___block_invoke;
      v11[3] = &unk_1E52DE9E0;
      objc_copyWeak(&v12, &to);
      objc_copyWeak(&v13, &from);
      [(_UISearchBarVisualProviderBase *)visualProvider setDelegateSearchFieldFrameManipulationBlock:v11];
      objc_destroyWeak(&v13);
      objc_destroyWeak(&v12);
      objc_destroyWeak(&from);
      objc_destroyWeak(&to);
    }
    else if (v6)
    {
      [(_UISearchBarVisualProviderBase *)self->_visualProvider setDelegateSearchFieldFrameManipulationBlock:0];
    }
  }
  objc_destroyWeak(&location);
}

- (BOOL)_usesLegacyVisualProvider
{
  int v3 = [(_UISearchBarVisualProviderBase *)self->_visualProvider visualProviderType];
  if (v3 != 1) {
    LOBYTE(v3) = [(_UISearchBarVisualProviderBase *)self->_visualProvider visualProviderType] == 3;
  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_classForSearchTextField, 0);
  objc_destroyWeak((id *)&self->_searchFieldContainerLayoutCustomizationDelegate);
  objc_storeStrong((id *)&self->_visualProvider, 0);
  objc_storeStrong((id *)&self->_inputAccessoryView, 0);
  objc_storeStrong((id *)&self->_cancelKeyCommand, 0);
  objc_storeStrong((id *)&self->_textInputTraits, 0);
  objc_storeStrong((id *)&self->_tapToActivateGestureRecognizer, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)_setOverrideContentInsets:(UIEdgeInsets)a3 forRectEdges:(unint64_t)a4
{
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  if ([(id)objc_opt_class() instancesRespondToSelector:a3])
  {
    unint64_t v5 = [(UISearchBar *)self textInputTraits];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UISearchBar;
    unint64_t v5 = [(UISearchBar *)&v7 forwardingTargetForSelector:a3];
  }
  return v5;
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  uint64_t v12 = 0;
  [(_UISearchBarVisualProviderBase *)self->_visualProvider getOverrideContentInsets:0 overriddenEdges:&v12];
  if (!v12) {
    goto LABEL_2;
  }
  if (os_variant_has_internal_diagnostics())
  {
    id v9 = __UIFaultDebugAssertLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1853B0000, v9, OS_LOG_TYPE_FAULT, "Setting SPI contentInset after using overrideContentInsets SPI is not allowed. This is an app bug. Use one or the other, not both.", buf, 2u);
    }
  }
  else
  {
    char v8 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &setContentInset____s_category) + 8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)double v10 = 0;
      _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_ERROR, "Setting SPI contentInset after using overrideContentInsets SPI is not allowed. This is an app bug. Use one or the other, not both.", v10, 2u);
    }
  }
  if (!v12) {
LABEL_2:
  }
    -[_UISearchBarVisualProviderBase setMinimumContentInset:](self->_visualProvider, "setMinimumContentInset:", top, left, bottom, right);
}

- (void)willMoveToSuperview:(id)a3
{
  unint64_t v5 = [(_UISearchBarVisualProviderBase *)self->_visualProvider searchDisplayController];
  [v5 _searchBarSuperviewWillChange];

  if (a3)
  {
    if (self->__transplanting) {
      self->__transplanting = 0;
    }
  }
}

- (void)_resetIfNecessaryForNavigationBarHosting:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(_UISearchBarVisualProviderBase *)self->_visualProvider isHostedByNavigationBar] != a3)
  {
    [(UISearchBar *)self _setReliesOnNavigationBarBackdrop:v3];
    [(UISearchBar *)self _setHostedByNavigationBar:v3];
    if (v3)
    {
      searchController = self->__searchController;
      if (searchController
        && [(UISearchController *)searchController hidesNavigationBarDuringPresentation])
      {
        if ([(UISearchController *)self->__searchController isActive]) {
          uint64_t v6 = 3;
        }
        else {
          uint64_t v6 = 2;
        }
      }
      else
      {
        uint64_t v6 = 2;
      }
      [(UISearchBar *)self _setBarPosition:v6];
      int v8 = _UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_SearchBarUsesAutomaticBackdropStyle, @"SearchBarUsesAutomaticBackdropStyle");
      if (byte_1EB256E5C) {
        int v9 = 1;
      }
      else {
        int v9 = v8;
      }
      if (v9) {
        uint64_t v7 = 2005;
      }
      else {
        uint64_t v7 = 2010;
      }
    }
    else
    {
      [(UISearchBar *)self _setHostedInlineByNavigationBar:0];
      [(UISearchBar *)self _setBarPosition:2];
      uint64_t v7 = 0;
    }
    [(UISearchBar *)self _setBackdropStyle:v7];
  }
}

- (void)_setHostedInlineByNavigationBar:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (a3 && ![(UISearchBar *)self _isHostedByNavigationBar])
  {
    if (os_variant_has_internal_diagnostics())
    {
      int v9 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      {
        searchController = self->__searchController;
        int v11 = 138412546;
        uint64_t v12 = self;
        __int16 v13 = 2112;
        v14 = searchController;
        _os_log_fault_impl(&dword_1853B0000, v9, OS_LOG_TYPE_FAULT, "Inline hosting of search bar ignored because navigation bar hosting is not enabled. This is a UIKit bug. search bar: %@, searchController: %@", (uint8_t *)&v11, 0x16u);
      }
    }
    else
    {
      uint64_t v7 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_setHostedInlineByNavigationBar____s_category) + 8);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        int v8 = self->__searchController;
        int v11 = 138412546;
        uint64_t v12 = self;
        __int16 v13 = 2112;
        v14 = v8;
        _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_ERROR, "Inline hosting of search bar ignored because navigation bar hosting is not enabled. This is a UIKit bug. search bar: %@, searchController: %@", (uint8_t *)&v11, 0x16u);
      }
    }
  }
  int v5 = [(_UISearchBarVisualProviderBase *)self->_visualProvider isHostedInlineByNavigationBar];
  uint64_t v6 = [(UISearchBar *)self _isHostedByNavigationBar] & v3;
  [(_UISearchBarVisualProviderBase *)self->_visualProvider setHostedInlineByNavigationBar:v6];
  if (v5 != v6)
  {
    [(UISearchController *)self->__searchController _updateHasPendingSuggestionMenuRefreshFlagForReason:v6 ^ 1];
    [(UISearchController *)self->__searchController _updateSearchSuggestionsListVisibility];
  }
}

- (BOOL)_isHostedByNavigationBar
{
  return [(_UISearchBarVisualProviderBase *)self->_visualProvider isHostedByNavigationBar];
}

- (void)_identifyBarContainer
{
  BOOL v3 = [(_UISearchBarVisualProviderBase *)self->_visualProvider isHostedByNavigationBar];
  visualProvider = self->_visualProvider;
  if (v3)
  {
    [(_UISearchBarVisualProviderBase *)visualProvider setInNavigationPalette:0];
    [(_UISearchBarVisualProviderBase *)self->_visualProvider setPlacedInNavigationBar:0];
    int v5 = self->_visualProvider;
    [(_UISearchBarVisualProviderBase *)v5 setPlacedInToolbar:0];
  }
  else
  {
    BOOL v6 = [(_UISearchBarVisualProviderBase *)visualProvider isPlacedInNavigationBar];
    BOOL v7 = [(_UISearchBarVisualProviderBase *)self->_visualProvider isPlacedInToolbar];
    objc_opt_class();
    [(_UISearchBarVisualProviderBase *)self->_visualProvider setInNavigationPalette:_containedInViewOfClass(self)];
    if ([(_UISearchBarVisualProviderBase *)self->_visualProvider isInNavigationPalette])
    {
      BOOL v8 = 0;
    }
    else
    {
      objc_opt_class();
      BOOL v8 = _containedInViewOfClass(self);
    }
    [(_UISearchBarVisualProviderBase *)self->_visualProvider setPlacedInNavigationBar:v8];
    if ([(_UISearchBarVisualProviderBase *)self->_visualProvider isInNavigationPalette]
      || [(_UISearchBarVisualProviderBase *)self->_visualProvider isPlacedInNavigationBar])
    {
      BOOL v9 = 0;
    }
    else
    {
      objc_opt_class();
      BOOL v9 = _containedInViewOfClass(self);
    }
    [(_UISearchBarVisualProviderBase *)self->_visualProvider setPlacedInToolbar:v9];
    if (!v6
      && [(_UISearchBarVisualProviderBase *)self->_visualProvider isPlacedInNavigationBar]
      || !v7 && [(_UISearchBarVisualProviderBase *)self->_visualProvider isPlacedInToolbar])
    {
      [(UISearchBar *)self setNeedsLayout];
    }
  }
}

- (void)_addSubview:(id)a3 positioned:(int64_t)a4 relativeTo:(id)a5
{
  id v8 = a5;
  BOOL v9 = (UISearchBar *)a3;
  double v10 = [(UISearchBar *)self _viewForChildViews];
  int v11 = v10;
  if (v10 == self || v10 == v9)
  {
    v12.receiver = self;
    v12.super_class = (Class)UISearchBar;
    [(UIView *)&v12 _addSubview:v9 positioned:a4 relativeTo:v8];
  }
  else
  {
    [(UISearchBar *)v10 _addSubview:v9 positioned:a4 relativeTo:v8];
  }
}

- (id)_viewForChildViews
{
  BOOL v3 = [(_UISearchBarVisualProviderBase *)self->_visualProvider searchBarClippingView];
  id v4 = v3;
  if (!v3) {
    BOOL v3 = self;
  }
  id v5 = v3;

  return v5;
}

- (void)layoutMarginsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)UISearchBar;
  [(UIView *)&v3 layoutMarginsDidChange];
  if ([(_UISearchBarVisualProviderBase *)self->_visualProvider alwaysUsesLayoutMarginsForHorizontalContentInset]|| [(UISearchBar *)self _containedInNavigationPalette])
  {
    [(UISearchBar *)self _updateEffectiveContentInset];
  }
}

- (void)_setBarPosition:(int64_t)a3
{
}

- (void)_setBackdropStyle:(int64_t)a3
{
}

- (void)_setReliesOnNavigationBarBackdrop:(BOOL)a3
{
}

- (void)_setHostedByNavigationBar:(BOOL)a3
{
  [(_UISearchBarVisualProviderBase *)self->_visualProvider setHostedByNavigationBar:a3];
  [(UISearchBar *)self _identifyBarContainer];
}

- (void)_didMoveFromWindow:(id)a3 toWindow:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10.receiver = self;
  v10.super_class = (Class)UISearchBar;
  [(UIView *)&v10 _didMoveFromWindow:v6 toWindow:v7];
  if (v7)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector()) {
      -[UISearchBar _setBarPosition:](self, "_setBarPosition:", [WeakRetained positionForBar:self]);
    }
    if ([(_UISearchBarVisualProviderBase *)self->_visualProvider backgroundLayoutNeedsUpdate])
    {
      [(UISearchBar *)self setNeedsLayout];
    }
    [(UISearchBar *)self _identifyBarContainer];
    [(_UISearchBarVisualProviderBase *)self->_visualProvider updateScopeBarBackground];
    [(UIView *)self invalidateIntrinsicContentSize];
  }
  if (v7 != v6)
  {
    BOOL v9 = [(_UISearchBarVisualProviderBase *)self->_visualProvider searchDisplayController];
    [v9 _updateSearchBarMaskIfNecessary];
  }
}

- (void)didMoveToSuperview
{
  [(UISearchBar *)self _identifyBarContainer];
  if ([(_UISearchBarVisualProviderBase *)self->_visualProvider isInNavigationPalette]
    || [(_UISearchBarVisualProviderBase *)self->_visualProvider isHostedByNavigationBar])
  {
    if ([(_UISearchBarVisualProviderBase *)self->_visualProvider isInNavigationPalette]) {
      [(_UISearchBarVisualProviderBase *)self->_visualProvider updateForDrawsBackgroundInPalette];
    }
    objc_super v3 = [(UISearchBar *)self _searchBarTextField];
    [v3 _setAnimatesBackgroundCornerRadius:1];

    if (UISearchBarUsesModernAppearance()) {
      [(UIView *)self setPreservesSuperviewLayoutMargins:1];
    }
    [(UISearchBar *)self _setMaskActive:0];
  }
  else
  {
    id v4 = [(UISearchBar *)self _searchBarTextField];
    [v4 _setAnimatesBackgroundCornerRadius:0];
  }
  [(UISearchBar *)self _updateEffectiveContentInset];
  [(_UISearchBarVisualProviderBase *)self->_visualProvider updateScopeBarBackground];
  id v5 = [(_UISearchBarVisualProviderBase *)self->_visualProvider searchDisplayController];
  [v5 _searchBarSuperviewChanged];

  [(UISearchController *)self->__searchController _searchBarSuperviewChanged];
  [(UIView *)self invalidateIntrinsicContentSize];
}

- (void)_didChangeFromIdiom:(int64_t)a3 onScreen:(id)a4 traverseHierarchy:(BOOL)a5
{
  v6.receiver = self;
  v6.super_class = (Class)UISearchBar;
  [(UIView *)&v6 _didChangeFromIdiom:a3 onScreen:a4 traverseHierarchy:a5];
  [(_UISearchBarVisualProviderBase *)self->_visualProvider updatePlaceholderColor];
  [(_UISearchBarVisualProviderBase *)self->_visualProvider updateDictationButton];
  [(_UISearchBarVisualProviderBase *)self->_visualProvider updateRightView];
  [(_UISearchBarVisualProviderBase *)self->_visualProvider updateMagnifyingGlassView];
  [(_UISearchBarVisualProviderBase *)self->_visualProvider applySearchBarStyle];
}

- (void)_setMaskActive:(BOOL)a3
{
}

- (void)setKeyboardAppearance:(int64_t)a3
{
  if ([(UISearchBar *)self keyboardAppearance] != a3)
  {
    id v5 = [(UISearchBar *)self textInputTraits];
    [v5 setKeyboardAppearance:a3];
  }
}

- (BOOL)isEnabled
{
  return [(_UISearchBarVisualProviderBase *)self->_visualProvider isEnabled];
}

- (void)_commonInit
{
  objc_super v3 = [[UITapGestureRecognizer alloc] initWithTarget:self action:sel_tappedSearchBar_];
  tapToActivateGestureRecognizer = self->_tapToActivateGestureRecognizer;
  self->_tapToActivateGestureRecognizer = v3;

  [(UIView *)self addGestureRecognizer:self->_tapToActivateGestureRecognizer];
  [(UISearchBar *)self setEnablesReturnKeyAutomatically:1];
  [(UISearchBar *)self setReturnKeyType:6];
  [(UISearchBar *)self setAutocorrectionType:1];
  [(UISearchBar *)self _setUpVisualProvider];
}

- (void)setSearchBarStyle:(UISearchBarStyle)searchBarStyle
{
}

- (void)_setEnabled:(BOOL)a3
{
}

- (NSString)text
{
  v2 = [(_UISearchBarVisualProviderBase *)self->_visualProvider searchField];
  objc_super v3 = v2;
  id v4 = &stru_1ED0E84C0;
  if (v2)
  {
    uint64_t v5 = [v2 text];
    if (v5) {
      id v4 = (__CFString *)v5;
    }
  }

  return (NSString *)v4;
}

- (UIBarButtonItem)_existingSearchIconBarButtonItem
{
  return [(_UISearchBarVisualProviderBase *)self->_visualProvider existingSearchIconBarButtonItem];
}

- (void)setTranslucent:(BOOL)translucent
{
  if (translucent) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = 2;
  }
  [(_UISearchBarVisualProviderBase *)self->_visualProvider setBarTranslucence:v3];
}

- (BOOL)showsCancelButton
{
  return [(_UISearchBarVisualProviderBase *)self->_visualProvider showsCancelButton];
}

- (CGSize)intrinsicContentSize
{
  [(_UISearchBarVisualProviderBase *)self->_visualProvider intrinsicContentSize];
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (NSString)placeholder
{
  double v2 = [(UISearchBar *)self _searchBarTextField];
  double v3 = [v2 placeholder];

  return (NSString *)v3;
}

- (void)_setUpVisualProvider
{
  if (!self->_visualProvider)
  {
    if (_searchBarShouldSeparateLayouts()) {
      double v3 = (objc_class *)objc_opt_class();
    }
    else {
      double v3 = (objc_class *)_UISearchBarVisualProviderLegacy;
    }
    id v4 = (_UISearchBarVisualProviderBase *)[[v3 alloc] initWithDelegate:self];
    visualProvider = self->_visualProvider;
    self->_visualProvider = v4;

    objc_super v6 = self->_visualProvider;
    [(_UISearchBarVisualProviderBase *)v6 prepare];
  }
}

- (UISearchBar)init
{
  return -[UISearchBar initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
}

- (void)setBackgroundImage:(UIImage *)backgroundImage
{
}

- (void)setCenterPlaceholder:(BOOL)a3
{
}

- (void)setBarStyle:(UIBarStyle)barStyle
{
}

- (void)_setActiveSearchDeferringScopeBar:(BOOL)a3
{
}

- (void)dealloc
{
  [(_UISearchBarVisualProviderBase *)self->_visualProvider teardown];
  v3.receiver = self;
  v3.super_class = (Class)UISearchBar;
  [(UIView *)&v3 dealloc];
}

- (void)setPositionAdjustment:(UIOffset)adjustment forSearchBarIcon:(UISearchBarIcon)icon
{
  CGFloat vertical = adjustment.vertical;
  CGFloat horizontal = adjustment.horizontal;
  id v7 = [(UISearchBar *)self _searchBarTextField];
  *(CGFloat *)BOOL v9 = horizontal;
  *(CGFloat *)&v9[1] = vertical;
  id v8 = [MEMORY[0x1E4F29238] valueWithBytes:v9 objCType:"{UIOffset=dd}"];
  [v7 _setOffsetValue:v8 forIcon:icon];
}

- (BOOL)isElementAccessibilityExposedToInterfaceBuilder
{
  return 0;
}

- (void)_setRequiresLegacyVisualProvider
{
  if (![(UISearchBar *)self _usesLegacyVisualProvider])
  {
    uint64_t v5 = self->_visualProvider;
    objc_super v3 = [(_UISearchBarVisualProviderBase *)[_UISearchBarVisualProviderLegacy alloc] initWithDelegate:self];
    [(_UISearchBarVisualProviderLegacy *)v3 prepareFromAbandonedVisualProvider:v5];
    visualProvider = self->_visualProvider;
    self->_visualProvider = &v3->super;
  }
}

- (BOOL)_supportsLayoutStates
{
  return [(_UISearchBarVisualProviderBase *)self->_visualProvider layoutState] != -1;
}

- (void)_setMaskBounds:(CGRect)a3
{
}

- (void)setSemanticContentAttribute:(int64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)UISearchBar;
  -[UIView setSemanticContentAttribute:](&v6, sel_setSemanticContentAttribute_);
  uint64_t v5 = [(UISearchBar *)self _searchBarTextField];
  [v5 setSemanticContentAttribute:a3];
}

- (NSString)description
{
  v7.receiver = self;
  v7.super_class = (Class)UISearchBar;
  objc_super v3 = [(UIView *)&v7 description];
  if (dyld_program_sdk_at_least() && os_variant_has_internal_diagnostics())
  {
    if (self->__searchController)
    {
      uint64_t v5 = objc_msgSend(v3, "stringByAppendingFormat:", @" searchController=%p", self->__searchController);

      objc_super v3 = (void *)v5;
    }
    uint64_t v6 = objc_msgSend(v3, "stringByAppendingFormat:", @" visualProvider=%p", self->_visualProvider);

    objc_super v3 = (void *)v6;
  }
  return (NSString *)v3;
}

- (void)_setSearchFieldContainerLayoutCustomizationDelegate:(id)a3
{
  objc_initWeak(&location, a3);
  if (![(UISearchBar *)self _usesLegacyVisualProvider])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_searchFieldContainerLayoutCustomizationDelegate);
    id v5 = objc_loadWeakRetained(&location);

    if (WeakRetained != v5)
    {
      id v6 = objc_loadWeakRetained(&location);
      objc_storeWeak((id *)&self->_searchFieldContainerLayoutCustomizationDelegate, v6);

      id v7 = objc_loadWeakRetained((id *)&self->_searchFieldContainerLayoutCustomizationDelegate);
      if (v7)
      {
        objc_copyWeak(&to, &location);
        objc_initWeak(&from, self);
        visualProvider = self->_visualProvider;
        v9[0] = MEMORY[0x1E4F143A8];
        v9[1] = 3221225472;
        void v9[2] = __67__UISearchBar__setSearchFieldContainerLayoutCustomizationDelegate___block_invoke;
        v9[3] = &unk_1E52DEA08;
        objc_copyWeak(&v10, &to);
        objc_copyWeak(&v11, &from);
        [(_UISearchBarVisualProviderBase *)visualProvider setLayoutCustomizationDelegateSearchFieldContainerWillLayoutSubviewsCallback:v9];
        objc_destroyWeak(&v11);
        objc_destroyWeak(&v10);
        objc_destroyWeak(&from);
        objc_destroyWeak(&to);
      }
      else
      {
        [(_UISearchBarVisualProviderBase *)self->_visualProvider setLayoutCustomizationDelegateSearchFieldContainerWillLayoutSubviewsCallback:0];
      }
    }
  }
  objc_destroyWeak(&location);
}

void __67__UISearchBar__setSearchFieldContainerLayoutCustomizationDelegate___block_invoke(uint64_t a1, void *a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9, double a10)
{
  v19 = (id *)(a1 + 32);
  id v20 = a2;
  id WeakRetained = objc_loadWeakRetained(v19);
  id v21 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_searchBarWillLayoutSubviews:inSearchFieldContainer:searchTextFieldFrame:cancelButtonFrame:", v21, v20, a3, a4, a5, a6, a7, a8, a9, a10);
}

- (void)_setAdditionalPaddingForCancelButtonAtLeadingEdge:(double)a3
{
  if (![(UISearchBar *)self _usesLegacyVisualProvider])
  {
    visualProvider = self->_visualProvider;
    [(_UISearchBarVisualProviderBase *)visualProvider setAdditionalPaddingForCancelButtonAtLeadingEdge:a3];
  }
}

- (double)_additionalPaddingForCancelButtonAtLeadingEdge
{
  if ([(UISearchBar *)self _usesLegacyVisualProvider]) {
    return 0.0;
  }
  visualProvider = self->_visualProvider;
  [(_UISearchBarVisualProviderBase *)visualProvider additionalPaddingForCancelButtonAtLeadingEdge];
  return result;
}

- (void)_setAdditionalPaddingForSearchFieldAtLeadingEdge:(double)a3
{
  if (![(UISearchBar *)self _usesLegacyVisualProvider])
  {
    visualProvider = self->_visualProvider;
    [(_UISearchBarVisualProviderBase *)visualProvider setAdditionalPaddingForSearchFieldAtLeadingEdge:a3];
  }
}

- (double)_additionalPaddingForSearchFieldAtLeadingEdge
{
  if ([(UISearchBar *)self _usesLegacyVisualProvider]) {
    return 0.0;
  }
  visualProvider = self->_visualProvider;
  [(_UISearchBarVisualProviderBase *)visualProvider additionalPaddingForSearchFieldAtLeadingEdge];
  return result;
}

- (UISearchBar)initWithCoder:(NSCoder *)coder
{
  id v4 = coder;
  v27.receiver = self;
  v27.super_class = (Class)UISearchBar;
  id v5 = [(UIView *)&v27 initWithCoder:v4];
  id v6 = v5;
  if (v5)
  {
    [(UISearchBar *)v5 _commonInit];
    id v7 = [(NSCoder *)v4 decodeObjectForKey:@"UIDelegate"];
    objc_storeWeak((id *)&v6->_delegate, v7);

    id v8 = [(NSCoder *)v4 decodeObjectForKey:@"UIPrompt"];
    BOOL v9 = [(NSCoder *)v4 decodeObjectForKey:@"UIText"];
    id v10 = [(NSCoder *)v4 decodeObjectForKey:@"UIPlaceholder"];
    visualProvider = v6->_visualProvider;
    objc_super v12 = [(NSCoder *)v4 decodeObjectForKey:@"UIBarTintColor"];
    [(_UISearchBarVisualProviderBase *)visualProvider _setBarTintColor:v12];

    [(_UISearchBarVisualProviderBase *)v6->_visualProvider _setBarStyle:0];
    if ([(NSCoder *)v4 containsValueForKey:@"UIBarStyle"]) {
      [(_UISearchBarVisualProviderBase *)v6->_visualProvider _setBarStyle:[(NSCoder *)v4 decodeIntegerForKey:@"UIBarStyle"]];
    }
    __int16 v13 = [(_UISearchBarVisualProviderBase *)v6->_visualProvider searchBarBackground];
    v14 = [(_UISearchBarVisualProviderBase *)v6->_visualProvider effectiveBarTintColor];
    [v13 setBarTintColor:v14];

    objc_msgSend(v13, "setBarStyle:", -[_UISearchBarVisualProviderBase barStyle](v6->_visualProvider, "barStyle"));
    uint64_t v15 = [(NSCoder *)v4 decodeObjectForKey:@"UIBackgroundImage"];
    [(UISearchBar *)v6 setBackgroundImage:v15];

    [(_UISearchBarVisualProviderBase *)v6->_visualProvider _setShowsScopeBar:[(NSCoder *)v4 decodeBoolForKey:@"UIShowsScopeBar"]];
    v16 = [(NSCoder *)v4 decodeObjectForKey:@"UIScopeButtonTitles"];
    [(UISearchBar *)v6 setScopeButtonTitles:v16];

    v17 = [(NSCoder *)v4 decodeObjectForKey:@"UIScopeBarBackgroundImage"];
    [(UISearchBar *)v6 setScopeBarBackgroundImage:v17];

    if ([(NSCoder *)v4 containsValueForKey:@"UIAutoDisableCancelButton"]) {
      [(_UISearchBarVisualProviderBase *)v6->_visualProvider _setAutoDisableCancelButton:[(NSCoder *)v4 decodeBoolForKey:@"UIAutoDisableCancelButton"]];
    }
    [(_UISearchBarVisualProviderBase *)v6->_visualProvider _setShowsCancelButton:[(NSCoder *)v4 decodeBoolForKey:@"UIShowsCancelButton"]];
    [(_UISearchBarVisualProviderBase *)v6->_visualProvider _setShowsBookmarkButton:[(NSCoder *)v4 decodeBoolForKey:@"UIShowsBookmarkButton"]];
    [(_UISearchBarVisualProviderBase *)v6->_visualProvider _setShowsSearchResultsButton:[(NSCoder *)v4 decodeBoolForKey:@"UIShowSearchResultsButton"]];
    [(_UISearchBarVisualProviderBase *)v6->_visualProvider _setSearchResultsButtonSelected:[(NSCoder *)v4 decodeBoolForKey:@"UISearchResultsButtonSelected"]];
    if ([(NSCoder *)v4 containsValueForKey:@"UICombinesLandscapeBars"]) {
      v18 = @"UICombinesLandscapeBars";
    }
    else {
      v18 = @"UIAllowsInlineScopeBar";
    }
    [(_UISearchBarVisualProviderBase *)v6->_visualProvider setAllowsInlineScopeBar:[(NSCoder *)v4 decodeBoolForKey:v18]];
    if ([(NSCoder *)v4 containsValueForKey:@"UISearchBarTranslucence"])
    {
      [(_UISearchBarVisualProviderBase *)v6->_visualProvider _setBarTranslucence:[(NSCoder *)v4 decodeIntegerForKey:@"UISearchBarTranslucence"]];
    }
    else if ([(NSCoder *)v4 decodeBoolForKey:@"UISearchBarIsTranslucent"])
    {
      [(UISearchBar *)v6 setTranslucent:1];
    }
    uint64_t v19 = [(NSCoder *)v4 decodeBoolForKey:@"UIHidesBackground"];
    [(_UISearchBarVisualProviderBase *)v6->_visualProvider _setHideBackground:v19];
    id v20 = [(_UISearchBarVisualProviderBase *)v6->_visualProvider searchBarBackground];
    [v20 setHidden:v19];

    [(UISearchBar *)v6 setUsesEmbeddedAppearance:[(NSCoder *)v4 decodeBoolForKey:@"UIUsesEmbeddedAppearance"]];
    [(_UISearchBarVisualProviderBase *)v6->_visualProvider updateSearchBarOpacity];
    id v21 = [(_UISearchBarVisualProviderBase *)v6->_visualProvider searchField];
    [v21 setText:v9];

    v22 = [(_UISearchBarVisualProviderBase *)v6->_visualProvider searchField];
    [v22 setPlaceholder:v10];

    if ([(_UISearchBarVisualProviderBase *)v6->_visualProvider centerPlaceholder])
    {
      v23 = [(UISearchBar *)v6 textInputTraits];
      [v23 setDeferBecomingResponder:1];
    }
    if ([(NSCoder *)v4 containsValueForKey:@"UISearchBarStyle"]) {
      [(UISearchBar *)v6 setSearchBarStyle:[(NSCoder *)v4 decodeIntegerForKey:@"UISearchBarStyle"]];
    }
    if (v8)
    {
      [(_UISearchBarVisualProviderBase *)v6->_visualProvider setUpPromptLabel];
      v24 = [(_UISearchBarVisualProviderBase *)v6->_visualProvider promptLabel];
      [v24 setText:v8];
    }
    if ([(_UISearchBarVisualProviderBase *)v6->_visualProvider showsCancelButton]) {
      [(_UISearchBarVisualProviderBase *)v6->_visualProvider setUpCancelButtonWithAppearance:0];
    }
    if ([(NSCoder *)v4 decodeBoolForKey:@"UIShowsSeparator"]) {
      [(UISearchBar *)v6 _setShowsSeparator:1];
    }
    if ([(NSCoder *)v4 containsValueForKey:@"UIKeyboardType"]) {
      [(UISearchBar *)v6 setKeyboardType:[(NSCoder *)v4 decodeIntegerForKey:@"UIKeyboardType"]];
    }
    if ([(NSCoder *)v4 containsValueForKey:@"UISpellCheckingType"]) {
      [(UISearchBar *)v6 setSpellCheckingType:[(NSCoder *)v4 decodeIntegerForKey:@"UISpellCheckingType"]];
    }
    if ([(NSCoder *)v4 containsValueForKey:@"UIAutocorrectionType"]) {
      [(UISearchBar *)v6 setAutocorrectionType:[(NSCoder *)v4 decodeIntegerForKey:@"UIAutocorrectionType"]];
    }
    if ([(NSCoder *)v4 containsValueForKey:@"UIAutocapitalizationType"]) {
      [(UISearchBar *)v6 setAutocapitalizationType:[(NSCoder *)v4 decodeIntegerForKey:@"UIAutocapitalizationType"]];
    }
    if ([(NSCoder *)v4 containsValueForKey:@"UIKeyboardAppearance"]) {
      [(UISearchBar *)v6 setKeyboardAppearance:[(NSCoder *)v4 decodeIntegerForKey:@"UIKeyboardAppearance"]];
    }
    if ([(NSCoder *)v4 containsValueForKey:@"UIReturnKeyType"]) {
      [(UISearchBar *)v6 setReturnKeyType:[(NSCoder *)v4 decodeIntegerForKey:@"UIReturnKeyType"]];
    }
    if ([(NSCoder *)v4 containsValueForKey:@"UIEnablesReturnKeyAutomatically"]) {
      [(UISearchBar *)v6 setEnablesReturnKeyAutomatically:[(NSCoder *)v4 decodeBoolForKey:@"UIEnablesReturnKeyAutomatically"]];
    }
    if ([(NSCoder *)v4 containsValueForKey:@"UITextContentType"])
    {
      v25 = [(NSCoder *)v4 decodeObjectOfClass:objc_opt_class() forKey:@"UITextContentType"];
      [(UISearchBar *)v6 setTextContentType:v25];
    }
    if ([(NSCoder *)v4 containsValueForKey:@"UITextSmartInsertDeleteType"]) {
      [(UISearchBar *)v6 setSmartInsertDeleteType:[(NSCoder *)v4 decodeIntegerForKey:@"UITextSmartInsertDeleteType"]];
    }
    if ([(NSCoder *)v4 containsValueForKey:@"UITextSmartQuotesType"]) {
      [(UISearchBar *)v6 setSmartQuotesType:[(NSCoder *)v4 decodeIntegerForKey:@"UITextSmartQuotesType"]];
    }
    if ([(NSCoder *)v4 containsValueForKey:@"UITextSmartDashesType"]) {
      [(UISearchBar *)v6 setSmartDashesType:[(NSCoder *)v4 decodeIntegerForKey:@"UITextSmartDashesType"]];
    }
    if ([(NSCoder *)v4 containsValueForKey:@"UISecureTextEntry"]) {
      [(UISearchBar *)v6 setSecureTextEntry:[(NSCoder *)v4 decodeBoolForKey:@"UISecureTextEntry"]];
    }
    if ([(NSCoder *)v4 containsValueForKey:@"UISearchTextPositionAdjustment"])
    {
      [(NSCoder *)v4 decodeUIOffsetForKey:@"UISearchTextPositionAdjustment"];
      -[UISearchBar setSearchTextPositionAdjustment:](v6, "setSearchTextPositionAdjustment:");
    }
    if ([(NSCoder *)v4 containsValueForKey:@"UISearchFieldBackgroundPositionAdjustment"])
    {
      [(NSCoder *)v4 decodeUIOffsetForKey:@"UISearchFieldBackgroundPositionAdjustment"];
      -[UISearchBar setSearchFieldBackgroundPositionAdjustment:](v6, "setSearchFieldBackgroundPositionAdjustment:");
    }
    if ([(NSCoder *)v4 decodeBoolForKey:@"UISearchBarDisabled"]) {
      [(_UISearchBarVisualProviderBase *)v6->_visualProvider setEnabled:0];
    }
    [(UISearchBar *)v6 setNeedsLayout];
  }
  return v6;
}

- (void)_populateArchivedSubviews:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)UISearchBar;
  [(UIView *)&v14 _populateArchivedSubviews:v4];
  id v5 = [(_UISearchBarVisualProviderBase *)self->_visualProvider runtimeOnlyViews];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [v4 removeObject:*(void *)(*((void *)&v10 + 1) + 8 * v9++)];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)UISearchBar;
  [(UIView *)&v31 encodeWithCoder:v4];
  if ([(_UISearchBarVisualProviderBase *)self->_visualProvider barStyle]) {
    objc_msgSend(v4, "encodeInteger:forKey:", -[_UISearchBarVisualProviderBase barStyle](self->_visualProvider, "barStyle"), @"UIBarStyle");
  }
  if ([(_UISearchBarVisualProviderBase *)self->_visualProvider showsCancelButton]) {
    objc_msgSend(v4, "encodeBool:forKey:", -[_UISearchBarVisualProviderBase showsCancelButton](self->_visualProvider, "showsCancelButton"), @"UIShowsCancelButton");
  }
  if ([(_UISearchBarVisualProviderBase *)self->_visualProvider showsBookmarkButton]) {
    objc_msgSend(v4, "encodeBool:forKey:", -[_UISearchBarVisualProviderBase showsBookmarkButton](self->_visualProvider, "showsBookmarkButton"), @"UIShowsBookmarkButton");
  }
  if ([(_UISearchBarVisualProviderBase *)self->_visualProvider showsScopeBar]) {
    objc_msgSend(v4, "encodeBool:forKey:", -[_UISearchBarVisualProviderBase showsScopeBar](self->_visualProvider, "showsScopeBar"), @"UIShowsScopeBar");
  }
  if ([(_UISearchBarVisualProviderBase *)self->_visualProvider showsSearchResultsButton]) {
    objc_msgSend(v4, "encodeBool:forKey:", -[_UISearchBarVisualProviderBase showsSearchResultsButton](self->_visualProvider, "showsSearchResultsButton"), @"UIShowSearchResultsButton");
  }
  if ([(_UISearchBarVisualProviderBase *)self->_visualProvider isSearchResultsButtonSelected])
  {
    objc_msgSend(v4, "encodeBool:forKey:", -[_UISearchBarVisualProviderBase isSearchResultsButtonSelected](self->_visualProvider, "isSearchResultsButtonSelected"), @"UISearchResultsButtonSelected");
  }
  if (![(_UISearchBarVisualProviderBase *)self->_visualProvider autoDisableCancelButton]) {
    objc_msgSend(v4, "encodeBool:forKey:", -[_UISearchBarVisualProviderBase autoDisableCancelButton](self->_visualProvider, "autoDisableCancelButton"), @"UIAutoDisableCancelButton");
  }
  if ([(_UISearchBarVisualProviderBase *)self->_visualProvider allowsInlineScopeBar]) {
    objc_msgSend(v4, "encodeBool:forKey:", -[_UISearchBarVisualProviderBase allowsInlineScopeBar](self->_visualProvider, "allowsInlineScopeBar"), @"UIAllowsInlineScopeBar");
  }
  if ([(_UISearchBarVisualProviderBase *)self->_visualProvider barTranslucence]) {
    objc_msgSend(v4, "encodeInteger:forKey:", -[_UISearchBarVisualProviderBase barTranslucence](self->_visualProvider, "barTranslucence"), @"UISearchBarTranslucence");
  }
  if (![(_UISearchBarVisualProviderBase *)self->_visualProvider drawsBackground]) {
    [v4 encodeBool:1 forKey:@"UIHidesBackground"];
  }
  if ([(_UISearchBarVisualProviderBase *)self->_visualProvider usesEmbeddedAppearance]) {
    objc_msgSend(v4, "encodeBool:forKey:", -[_UISearchBarVisualProviderBase usesEmbeddedAppearance](self->_visualProvider, "usesEmbeddedAppearance"), @"UIUsesEmbeddedAppearance");
  }
  id v5 = [(UISearchBar *)self scopeButtonTitles];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    uint64_t v7 = [(UISearchBar *)self scopeButtonTitles];
    [v4 encodeObject:v7 forKey:@"UIScopeButtonTitles"];
  }
  uint64_t v8 = [(_UISearchBarVisualProviderBase *)self->_visualProvider separator];

  if (v8) {
    [v4 encodeBool:1 forKey:@"UIShowsSeparator"];
  }
  uint64_t v9 = [(UISearchBar *)self prompt];

  if (v9)
  {
    long long v10 = [(UISearchBar *)self prompt];
    [v4 encodeObject:v10 forKey:@"UIPrompt"];
  }
  long long v11 = [(UISearchBar *)self text];

  if (v11)
  {
    long long v12 = [(UISearchBar *)self text];
    [v4 encodeObject:v12 forKey:@"UIText"];
  }
  long long v13 = [(UISearchBar *)self placeholder];

  if (v13)
  {
    objc_super v14 = [(UISearchBar *)self placeholder];
    [v4 encodeObject:v14 forKey:@"UIPlaceholder"];
  }
  uint64_t v15 = [(UISearchBar *)self barTintColor];

  if (v15)
  {
    uint64_t v16 = [(UISearchBar *)self barTintColor];
    [v4 encodeObject:v16 forKey:@"UIBarTintColor"];
  }
  if ([(UISearchBar *)self keyboardType]) {
    objc_msgSend(v4, "encodeInteger:forKey:", -[UISearchBar keyboardType](self, "keyboardType"), @"UIKeyboardType");
  }
  if ([(UISearchBar *)self spellCheckingType]) {
    objc_msgSend(v4, "encodeInteger:forKey:", -[UISearchBar spellCheckingType](self, "spellCheckingType"), @"UISpellCheckingType");
  }
  if ([(UISearchBar *)self autocorrectionType]) {
    objc_msgSend(v4, "encodeInteger:forKey:", -[UISearchBar autocorrectionType](self, "autocorrectionType"), @"UIAutocorrectionType");
  }
  if ([(UISearchBar *)self autocapitalizationType]) {
    objc_msgSend(v4, "encodeInteger:forKey:", -[UISearchBar autocapitalizationType](self, "autocapitalizationType"), @"UIAutocapitalizationType");
  }
  uint64_t v17 = [(UISearchBar *)self keyboardAppearance];
  if (v17) {
    [v4 encodeInteger:v17 forKey:@"UIKeyboardAppearance"];
  }
  uint64_t v18 = [(UISearchBar *)self returnKeyType];
  if (v18) {
    [v4 encodeInteger:v18 forKey:@"UIReturnKeyType"];
  }
  objc_msgSend(v4, "encodeBool:forKey:", -[UISearchBar enablesReturnKeyAutomatically](self, "enablesReturnKeyAutomatically"), @"UIEnablesReturnKeyAutomatically");
  objc_msgSend(v4, "encodeBool:forKey:", -[UISearchBar isSecureTextEntry](self, "isSecureTextEntry"), @"UISecureTextEntry");
  uint64_t v19 = [(UISearchBar *)self textContentType];
  if (v19) {
    [v4 encodeObject:v19 forKey:@"UITextContentType"];
  }
  uint64_t v20 = [(UISearchBar *)self smartInsertDeleteType];
  if (v20) {
    [v4 encodeInteger:v20 forKey:@"UITextSmartInsertDeleteType"];
  }
  uint64_t v21 = [(UISearchBar *)self smartQuotesType];
  if (v21) {
    [v4 encodeInteger:v21 forKey:@"UITextSmartQuotesType"];
  }
  uint64_t v22 = [(UISearchBar *)self smartDashesType];
  if (v22) {
    [v4 encodeInteger:v22 forKey:@"UITextSmartDashesType"];
  }
  v23 = [(UISearchBar *)self delegate];
  if (v23) {
    [v4 encodeConditionalObject:v23 forKey:@"UIDelegate"];
  }
  v24 = [(UISearchBar *)self backgroundImage];
  if (v24) {
    [v4 encodeObject:v24 forKey:@"UIBackgroundImage"];
  }
  v25 = [(UISearchBar *)self scopeBarBackgroundImage];

  if (v25) {
    [v4 encodeObject:v25 forKey:@"UIScopeBarBackgroundImage"];
  }
  [(UISearchBar *)self searchTextPositionAdjustment];
  if (v27 != 0.0 || v26 != 0.0) {
    objc_msgSend(v4, "encodeUIOffset:forKey:", @"UISearchTextPositionAdjustment");
  }
  [(UISearchBar *)self searchFieldBackgroundPositionAdjustment];
  if (v29 != 0.0 || v28 != 0.0) {
    objc_msgSend(v4, "encodeUIOffset:forKey:", @"UISearchFieldBackgroundPositionAdjustment");
  }
  UISearchBarStyle v30 = [(UISearchBar *)self searchBarStyle];
  if (v30) {
    [v4 encodeInteger:v30 forKey:@"UISearchBarStyle"];
  }
  if (![(UISearchBar *)self isEnabled]) {
    [v4 encodeBool:1 forKey:@"UISearchBarDisabled"];
  }
}

- (void)setController:(id)a3
{
}

- (id)controller
{
  return [(_UISearchBarVisualProviderBase *)self->_visualProvider searchDisplayController];
}

- (id)_searchField
{
  objc_super v3 = NSStringFromSelector(a2);
  UIKVCAccessProhibited((uint64_t)v3, @"UISearchBar");

  visualProvider = self->_visualProvider;
  return [(_UISearchBarVisualProviderBase *)visualProvider searchField];
}

- (id)_cancelButton
{
  objc_super v3 = NSStringFromSelector(a2);
  UIKVCAccessProhibited((uint64_t)v3, @"UISearchBar");

  visualProvider = self->_visualProvider;
  return [(_UISearchBarVisualProviderBase *)visualProvider cancelButton];
}

- (void)set_cancelButtonText:(id)a3
{
  id v6 = a3;
  id v5 = NSStringFromSelector(a2);
  UIKVCAccessProhibited((uint64_t)v5, @"UISearchBar");

  [(UISearchBar *)self _setCancelButtonText:v6];
}

- (id)_cancelButtonText
{
  objc_super v3 = NSStringFromSelector(a2);
  UIKVCAccessProhibited((uint64_t)v3, @"UISearchBar");

  visualProvider = self->_visualProvider;
  return [(_UISearchBarVisualProviderBase *)visualProvider cancelButtonText];
}

- (id)keyCommands
{
  v8[1] = *MEMORY[0x1E4F143B8];
  if ([(UISearchBar *)self showsCancelButton])
  {
    cancelKeyCommand = self->_cancelKeyCommand;
    if (!cancelKeyCommand)
    {
      id v4 = +[UIKeyCommand keyCommandWithInput:@"UIKeyInputEscape" modifierFlags:0 action:sel__cancelButtonPressed];
      id v5 = self->_cancelKeyCommand;
      self->_cancelKeyCommand = v4;

      cancelKeyCommand = self->_cancelKeyCommand;
    }
    v8[0] = cancelKeyCommand;
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (id)_scopeBar
{
  return [(_UISearchBarVisualProviderBase *)self->_visualProvider scopeBar];
}

- (id)_containingNavigationPalette
{
  objc_opt_class();
  return _enclosingViewOfClass(self);
}

- (UIBarStyle)barStyle
{
  return [(_UISearchBarVisualProviderBase *)self->_visualProvider barStyle];
}

- (BOOL)isTranslucent
{
  if ([(_UISearchBarVisualProviderBase *)self->_visualProvider isHostedByNavigationBar]
    || [(_UISearchBarVisualProviderBase *)self->_visualProvider isInNavigationPalette]
    || ![(_UISearchBarVisualProviderBase *)self->_visualProvider drawsBackground])
  {
    return 1;
  }
  objc_super v3 = [(_UISearchBarVisualProviderBase *)self->_visualProvider searchDisplayController];
  if ([v3 displaysSearchBarInNavigationBar])
  {
    char v4 = 1;
  }
  else
  {
    id v6 = [(_UISearchBarVisualProviderBase *)self->_visualProvider searchBarBackground];
    if (v6)
    {
      uint64_t v7 = [(_UISearchBarVisualProviderBase *)self->_visualProvider searchBarBackground];
      char v4 = [v7 isTranslucent];
    }
    else
    {
      char v4 = 1;
    }
  }
  return v4;
}

- (void)_setClassForSearchTextField:(Class)a3
{
  id v6 = a3;
  if (!a3) {
    id v6 = objc_opt_class();
  }
  if (v6 != [(UISearchBar *)self _classForSearchTextField])
  {
    if ((_searchBarShouldSeparateLayouts() & 1) == 0)
    {
      uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
      [v9 handleFailureInMethod:a2 object:self file:@"UISearchBar.m" lineNumber:842 description:@"Can't change _classForSearchTextField in old-style UISearchBar"];
    }
    if (([v6 isSubclassOfClass:objc_opt_class()] & 1) == 0)
    {
      long long v10 = [MEMORY[0x1E4F28B00] currentHandler];
      [v10 handleFailureInMethod:a2 object:self file:@"UISearchBar.m" lineNumber:843 description:@"_classForSearchTextField must be a subclass of UISearchTextField"];
    }
    uint64_t v7 = [(UIView *)self window];

    if (v7)
    {
      long long v11 = [MEMORY[0x1E4F28B00] currentHandler];
      [v11 handleFailureInMethod:a2 object:self file:@"UISearchBar.m" lineNumber:844 description:@"Can't change _classForSearchTextField when UISearchBar is in a window"];
    }
    objc_storeStrong((id *)&self->_classForSearchTextField, a3);
    uint64_t v8 = [(_UISearchBarVisualProviderBase *)self->_visualProvider searchFieldIfExists];
    [v8 removeFromSuperview];

    [(_UISearchBarVisualProviderBase *)self->_visualProvider setSearchField:0];
    [(UISearchBar *)self setNeedsLayout];
  }
}

- (void)setEnabled:(BOOL)enabled
{
}

- (void)setText:(NSString *)text
{
  id v5 = text;
  char v4 = [(UISearchBar *)self _searchBarTextField];
  [v4 setText:v5];

  if ((dyld_program_sdk_at_least() & 1) == 0) {
    [(UISearchBar *)self _updateForNewSearchFieldText:v5];
  }
}

- (void)setPrompt:(NSString *)prompt
{
}

- (NSString)prompt
{
  return [(_UISearchBarVisualProviderBase *)self->_visualProvider prompt];
}

- (void)setShowsSearchResultsButton:(BOOL)showsSearchResultsButton
{
}

- (void)setSearchResultsButtonSelected:(BOOL)searchResultsButtonSelected
{
}

- (BOOL)isSearchResultsButtonSelected
{
  return [(_UISearchBarVisualProviderBase *)self->_visualProvider isSearchResultsButtonSelected];
}

- (void)setShowsBookmarkButton:(BOOL)showsBookmarkButton
{
}

- (BOOL)showsBookmarkButton
{
  return [(_UISearchBarVisualProviderBase *)self->_visualProvider showsBookmarkButton];
}

- (void)setShowsCancelButton:(BOOL)showsCancelButton
{
}

- (void)setShowsCancelButton:(BOOL)showsCancelButton animated:(BOOL)animated
{
}

- (void)_setDisableDictationButton:(BOOL)a3
{
}

- (BOOL)_showingDictationButton
{
  return [(_UISearchBarVisualProviderBase *)self->_visualProvider wantsDictationButton];
}

- (void)_setShowsCancelButton:(BOOL)a3
{
}

- (void)setDrawsBackground:(BOOL)a3
{
}

- (BOOL)drawsBackground
{
  return [(_UISearchBarVisualProviderBase *)self->_visualProvider drawsBackground];
}

- (void)setDrawsBackgroundInPalette:(BOOL)a3
{
}

- (BOOL)drawsBackgroundInPalette
{
  return [(_UISearchBarVisualProviderBase *)self->_visualProvider drawsBackgroundInPalette];
}

- (BOOL)_reliesOnNavigationBarBackdrop
{
  return [(_UISearchBarVisualProviderBase *)self->_visualProvider reliesOnNavigationBarBackdrop];
}

- (void)_setTextFieldManagedInNSToolbar:(BOOL)a3
{
}

- (BOOL)_isTextFieldManagedInNSToolbar
{
  return [(_UISearchBarVisualProviderBase *)self->_visualProvider isTextFieldManagedInNSToolbar];
}

- (void)_setProvidesRestingMeasurementValues:(BOOL)a3
{
}

- (BOOL)_providesRestingMeasurementValues
{
  return [(_UISearchBarVisualProviderBase *)self->_visualProvider providesRestingMeasurementValues];
}

- (double)_widthForButtonBarItemLayout
{
  if ([(_UISearchBarVisualProviderBase *)self->_visualProvider providesRestingMeasurementValues])
  {
    uint64_t v3 = 2;
  }
  else if ([(UISearchBar *)self _layoutState] == 3)
  {
    uint64_t v3 = 3;
  }
  else
  {
    uint64_t v3 = 2;
  }
  [(UISearchBar *)self _idealInlineWidthForLayoutState:v3];
  return result;
}

- (void)_setAllowsInlineScopeBar:(BOOL)a3
{
}

- (BOOL)_allowsInlineScopeBar
{
  return [(_UISearchBarVisualProviderBase *)self->_visualProvider allowsInlineScopeBar];
}

- (BOOL)_shouldCombineLandscapeBars
{
  visualProvider = self->_visualProvider;
  int64_t v3 = [(UISearchBar *)self _expectedInterfaceOrientation];
  return [(_UISearchBarVisualProviderBase *)visualProvider shouldCombineLandscapeBarsForOrientation:v3];
}

- (BOOL)_shouldCombineLandscapeBarsForOrientation:(int64_t)a3
{
  return [(_UISearchBarVisualProviderBase *)self->_visualProvider shouldCombineLandscapeBarsForOrientation:a3];
}

- (BOOL)_wouldCombineLandscapeBarsForSize:(CGSize)a3
{
  return -[_UISearchBarVisualProviderBase wouldCombineLandscapeBarsForSize:](self->_visualProvider, "wouldCombineLandscapeBarsForSize:", a3.width, a3.height);
}

- (void)setUsesEmbeddedAppearance:(BOOL)a3
{
}

- (BOOL)usesEmbeddedAppearance
{
  return [(_UISearchBarVisualProviderBase *)self->_visualProvider usesEmbeddedAppearance];
}

- (void)setCancelButton:(id)a3
{
}

- (id)cancelButton
{
  return [(_UISearchBarVisualProviderBase *)self->_visualProvider cancelButton];
}

- (UIButton)_leftButton
{
  return (UIButton *)[(_UISearchBarVisualProviderBase *)self->_visualProvider leftButton];
}

- (void)_setOverrideInlineInactiveWidth:(double)a3
{
}

- (double)_overrideInlineInactiveWidth
{
  [(_UISearchBarVisualProviderBase *)self->_visualProvider overrideInlineInactiveWidth];
  return result;
}

- (void)_setOverrideInlineActiveWidth:(double)a3
{
}

- (double)_overrideInlineAactiveWidth
{
  [(_UISearchBarVisualProviderBase *)self->_visualProvider overrideInlineActiveWidth];
  return result;
}

- (void)takeTraitsFrom:(id)a3
{
  id v4 = a3;
  id v5 = [(UISearchBar *)self textInputTraits];
  [v5 takeTraitsFrom:v4];
}

- (id)methodSignatureForSelector:(SEL)a3
{
  id v4 = [(id)objc_opt_class() instanceMethodSignatureForSelector:a3];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [(id)objc_opt_class() instanceMethodSignatureForSelector:a3];
  }
  uint64_t v7 = v6;

  return v7;
}

- (BOOL)_searchBarTextFieldShouldBeginEditing
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    char v4 = [WeakRetained searchBarShouldBeginEditing:self];
  }
  else {
    char v4 = 1;
  }

  return v4;
}

- (BOOL)_searchBarTextFieldShouldEndEditing
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    char v4 = [WeakRetained searchBarShouldEndEditing:self];
  }
  else {
    char v4 = 1;
  }

  return v4;
}

- (BOOL)_searchBarTextFieldShouldScrollToVisibleWhenBecomingFirstResponder
{
  int64_t v3 = [(_UISearchBarVisualProviderBase *)self->_visualProvider searchDisplayController];
  char v4 = v3;
  if (v3) {
    char v5 = [v3 _searchBarShouldScrollToVisible:self];
  }
  else {
    char v5 = 1;
  }

  return v5;
}

- (BOOL)_searchBarTextFieldShouldClear
{
  int64_t v3 = [(UIView *)self traitCollection];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if (v4 == 6)
  {
    [(UISearchBar *)self _cancelButtonPressed];
    return 1;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector()) {
      char v5 = [WeakRetained searchBarShouldClear:self];
    }
    else {
      char v5 = 1;
    }
  }
  return v5;
}

- (BOOL)_searchBarTextFieldShouldChangeCharactersInRange:(_NSRange)a3 replacementString:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    char v9 = objc_msgSend(WeakRetained, "searchBar:shouldChangeTextInRange:replacementText:", self, location, length, v7);
  }
  else {
    char v9 = 1;
  }

  return v9;
}

- (int64_t)_preferredAlignment
{
  return 2;
}

- (void)_setDataSource:(id)a3 navigationItem:(id)a4 titleLocation:(int64_t)a5
{
  -[_UISearchBarVisualProviderBase setNavBarTitleViewDataSource:](self->_visualProvider, "setNavBarTitleViewDataSource:", a3, a4);
  visualProvider = self->_visualProvider;
  [(_UISearchBarVisualProviderBase *)visualProvider setNavBarTitleViewLocation:a5];
}

- (BOOL)_navigationBarHeightShouldBeIncreasedByTabBarHeight
{
  return 0;
}

- (NSArray)_navigationBarContentOverlayRects
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

- (double)_navigationBarContentHeight
{
  [(_UISearchBarVisualProviderBase *)self->_visualProvider navigationBarContentHeight];
  return result;
}

- (double)_navigationBarContentHeightExtension
{
  return 0.0;
}

- (double)_navigationBarBackButtonMaximumWidth
{
  return 0.0;
}

- (BOOL)_hideNavigationBarBackButton
{
  return 0;
}

- (BOOL)_hideNavigationBarLeadingBarButtons
{
  return 0;
}

- (BOOL)_hideNavigationBarStandardTitle
{
  return 1;
}

- (BOOL)_hideNavigationBarCenterBarButtons
{
  return 1;
}

- (BOOL)_hideNavigationBarTrailingBarButtons
{
  return 0;
}

- (double)_navigationBarBackButtonAlpha
{
  return 1.0;
}

- (double)_navigationBarLeadingBarButtonsAlpha
{
  return 1.0;
}

- (double)_navigationBarTrailingBarButtonsAlpha
{
  return 1.0;
}

- (int64_t)_preferredContentSizeForSize:(int64_t)a3
{
  return a3;
}

- (BOOL)_wantsTwoPartTransition
{
  return 1;
}

- (void)_navigationBarTransitionWillBegin:(int64_t)a3 willBeDisplayed:(BOOL)a4
{
}

- (void)_performNavigationBarTransition:(int64_t)a3 willBeDisplayed:(BOOL)a4
{
  double v4 = 0.0;
  if (a4) {
    double v4 = 1.0;
  }
  -[UIView setAlpha:](self, "setAlpha:", a3, v4);
}

- (void)_navigationBarTransitionCompleted:(int64_t)a3 willBeDisplayed:(BOOL)a4
{
}

- (id)_traitCollectionOverridesForNavigationBarTraitCollection:(id)a3
{
  id v4 = a3;
  if ([(UISearchBar *)self _effectivelySupportsDynamicType])
  {
    char v5 = [v4 preferredContentSizeCategory];
    id v6 = +[UITraitCollection traitCollectionWithPreferredContentSizeCategory:v5];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)_driveTransitionToSearchLayoutState:(int64_t)a3
{
  _confirmIOSorVisionOSVisualProvider(self->_visualProvider);
  visualProvider = self->_visualProvider;
  [(_UISearchBarVisualProviderBase *)visualProvider driveTransitionToSearchLayoutState:a3];
}

- (void)_prepareForTransitionToSearchLayoutState:(int64_t)a3
{
  _confirmIOSorVisionOSVisualProvider(self->_visualProvider);
  visualProvider = self->_visualProvider;
  [(_UISearchBarVisualProviderBase *)visualProvider prepareForTransitionToSearchLayoutState:a3];
}

- (void)_freezeForAnimatedTransitionToSearchLayoutState:(int64_t)a3
{
  if (a3 == 2)
  {
    _confirmIOSorVisionOSVisualProvider(self->_visualProvider);
    visualProvider = self->_visualProvider;
    [(_UISearchBarVisualProviderBase *)visualProvider freezeForAnimatedTransitionToSearchLayoutState:2];
  }
}

- (void)_animateTransitionToSearchLayoutState:(int64_t)a3
{
  _confirmIOSorVisionOSVisualProvider(self->_visualProvider);
  visualProvider = self->_visualProvider;
  [(_UISearchBarVisualProviderBase *)visualProvider animateTransitionToSearchLayoutState:a3];
}

- (void)_completeTransitionToSearchLayoutState:(int64_t)a3
{
  _confirmIOSorVisionOSVisualProvider(self->_visualProvider);
  visualProvider = self->_visualProvider;
  [(_UISearchBarVisualProviderBase *)visualProvider completeTransitionToSearchLayoutState:a3];
}

- (void)_cancelTransitionToSearchLayoutState:(int64_t)a3
{
  _confirmIOSorVisionOSVisualProvider(self->_visualProvider);
  visualProvider = self->_visualProvider;
  [(_UISearchBarVisualProviderBase *)visualProvider cancelTransitionToSearchLayoutState:a3];
}

- (void)_growToSearchFieldIfNecessary
{
  _confirmIOSorVisionOSVisualProvider(self->_visualProvider);
  visualProvider = self->_visualProvider;
  [(_UISearchBarVisualProviderBase *)visualProvider growToSearchFieldIfNecessary];
}

- (void)_shrinkToButtonIfNecessary
{
  _confirmIOSorVisionOSVisualProvider(self->_visualProvider);
  visualProvider = self->_visualProvider;
  [(_UISearchBarVisualProviderBase *)visualProvider shrinkToButtonIfNecessary];
}

- (void)_searchButtonAction:(id)a3
{
  id v4 = [(UISearchBar *)self _searchController];

  if (v4)
  {
    [(UISearchBar *)self _shrinkToButtonIfNecessary];
    [(_UISearchBarVisualProviderBase *)self->_visualProvider setRequiresSearchTextField:1];
    [(UISearchBar *)self becomeFirstResponder];
  }
  else
  {
    if (os_variant_has_internal_diagnostics())
    {
      id v6 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1853B0000, v6, OS_LOG_TYPE_FAULT, "searchButtonAction not properly implemented when there's no search controller", buf, 2u);
      }
    }
    else
    {
      char v5 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_searchButtonAction____s_category) + 8);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)id v7 = 0;
        _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_ERROR, "searchButtonAction not properly implemented when there's no search controller", v7, 2u);
      }
    }
    [(UISearchBar *)self _growToSearchFieldIfNecessary];
  }
}

- (void)_navigationBarSlideTransitionWillBegin
{
  _confirmIOSorVisionOSVisualProvider(self->_visualProvider);
  visualProvider = self->_visualProvider;
  [(_UISearchBarVisualProviderBase *)visualProvider navigationBarSlideTransitionWillBegin];
}

- (void)_navigationBarSlideTransitionDidEnd
{
  _confirmIOSorVisionOSVisualProvider(self->_visualProvider);
  visualProvider = self->_visualProvider;
  [(_UISearchBarVisualProviderBase *)visualProvider navigationBarSlideTransitionDidEnd];
}

- (double)_barHeightForBarMetrics:(int64_t)a3
{
  [(_UISearchBarVisualProviderBase *)self->_visualProvider barHeightForBarMetrics:a3];
  return result;
}

- (double)_barHeightForBarMetrics:(int64_t)a3 barPosition:(int64_t)a4
{
  [(_UISearchBarVisualProviderBase *)self->_visualProvider barHeightForBarMetrics:a3 barPosition:a4];
  return result;
}

- (double)_defaultHeight
{
  int64_t v3 = [(UISearchBar *)self _expectedInterfaceOrientation];
  [(UISearchBar *)self _defaultHeightForOrientation:v3];
  return result;
}

- (double)_defaultHeightForOrientation:(int64_t)a3
{
  [(_UISearchBarVisualProviderBase *)self->_visualProvider defaultHeightForOrientation:a3];
  return result;
}

- (void)_setShowsSeparator:(BOOL)a3
{
}

- (void)bringSubviewToFront:(id)a3
{
  id v4 = (UISearchBar *)a3;
  char v5 = [(UISearchBar *)self _viewForChildViews];
  id v6 = v5;
  if (v5 == self || v5 == v4)
  {
    v7.receiver = self;
    v7.super_class = (Class)UISearchBar;
    [(UIView *)&v7 bringSubviewToFront:v4];
  }
  else
  {
    [(UISearchBar *)v5 bringSubviewToFront:v4];
  }
}

- (void)sendSubviewToBack:(id)a3
{
  id v4 = (UISearchBar *)a3;
  char v5 = [(UISearchBar *)self _viewForChildViews];
  id v6 = v5;
  if (v5 == self || v5 == v4)
  {
    v7.receiver = self;
    v7.super_class = (Class)UISearchBar;
    [(UIView *)&v7 sendSubviewToBack:v4];
  }
  else
  {
    [(UISearchBar *)v5 sendSubviewToBack:v4];
  }
}

- (double)_scopeBarHeight
{
  [(_UISearchBarVisualProviderBase *)self->_visualProvider scopeBarHeight];
  return result;
}

- (BOOL)isLookToDictateEnabled
{
  return 0;
}

- (id)_makeShadowView
{
  if (dyld_program_sdk_at_least())
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"No UISearchDisplayController support methods should run on this version of iOS"];
    int64_t v3 = 0;
  }
  else
  {
    int64_t v3 = [(_UISearchBarVisualProviderBase *)self->_visualProvider makeShadowView];
  }
  return v3;
}

- (void)_setShadowVisibleIfNecessary:(BOOL)a3
{
}

- (UIEdgeInsets)contentInset
{
  [(_UISearchBarVisualProviderBase *)self->_visualProvider minimumContentInset];
  result.double right = v5;
  result.double bottom = v4;
  result.double left = v3;
  result.double top = v2;
  return result;
}

- (void)_getOverrideContentInsets:(UIEdgeInsets *)a3 overriddenEdges:(unint64_t *)a4
{
}

- (void)safeAreaInsetsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)UISearchBar;
  [(UIView *)&v3 safeAreaInsetsDidChange];
  [(UISearchBar *)self _updateEffectiveContentInset];
}

- (void)_containerSafeAreaInsetsDidChange:(id)a3
{
  id v5 = a3;
  if (![(UISearchBar *)self _usesLegacyVisualProvider]
    && [(_UISearchBarVisualProviderBase *)self->_visualProvider barPosition] == 3)
  {
    visualProvider = self->_visualProvider;
    [v5 safeAreaInsets];
    -[_UISearchBarVisualProviderBase setBackgroundExtension:](visualProvider, "setBackgroundExtension:");
  }
}

- (UIEdgeInsets)_effectiveContentInset
{
  [(_UISearchBarVisualProviderBase *)self->_visualProvider effectiveContentInset];
  result.double right = v5;
  result.double bottom = v4;
  result.double left = v3;
  result.double top = v2;
  return result;
}

- (BOOL)_scopeBarIsVisible
{
  return [(_UISearchBarVisualProviderBase *)self->_visualProvider scopeBarIsVisible];
}

- (UIEdgeInsets)_scopeBarInsets
{
  [(_UISearchBarVisualProviderBase *)self->_visualProvider scopeBarInsets];
  result.double right = v5;
  result.double bottom = v4;
  result.double left = v3;
  result.double top = v2;
  return result;
}

- (void)setScopeButtonTitles:(NSArray *)scopeButtonTitles
{
}

- (NSArray)scopeButtonTitles
{
  return [(_UISearchBarVisualProviderBase *)self->_visualProvider scopeTitles];
}

- (void)setSelectedScopeButtonIndex:(NSInteger)selectedScopeButtonIndex
{
  int64_t v5 = [(_UISearchBarVisualProviderBase *)self->_visualProvider selectedScope];
  [(_UISearchBarVisualProviderBase *)self->_visualProvider setSelectedScope:selectedScopeButtonIndex];
  if (v5 != selectedScopeButtonIndex)
  {
    visualProvider = self->_visualProvider;
    [(_UISearchBarVisualProviderBase *)visualProvider updateScopeBarForSelectedScope];
  }
}

- (NSInteger)selectedScopeButtonIndex
{
  return [(_UISearchBarVisualProviderBase *)self->_visualProvider selectedScope];
}

- (void)_setScopeBarHidden:(BOOL)a3
{
  BOOL v3 = a3;
  int64_t v5 = [(_UISearchBarVisualProviderBase *)self->_visualProvider scopeBarContainerView];
  [v5 setHidden:v3];

  id v6 = [(UISearchBar *)self _searchController];
  [v6 _searchBarDidUpdateScopeBar:self];
}

- (void)_setScopeBarPosition:(unint64_t)a3
{
  [(_UISearchBarVisualProviderBase *)self->_visualProvider setScopeBarPosition:a3];
  id v4 = [(UISearchBar *)self _searchController];
  [v4 _searchBarDidUpdateScopeBar:self];
}

- (unint64_t)_scopeBarPosition
{
  return [(_UISearchBarVisualProviderBase *)self->_visualProvider scopeBarPosition];
}

- (void)_presentScopeBarIfNecessary
{
  BOOL v3 = [(_UISearchBarVisualProviderBase *)self->_visualProvider scopeTitles];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    int has_internal_diagnostics = os_variant_has_internal_diagnostics();
    BOOL v6 = [(UISearchBar *)self _usesLegacyVisualProvider];
    if (has_internal_diagnostics)
    {
      if (!v6)
      {
        objc_super v7 = __UIFaultDebugAssertLog();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_1853B0000, v7, OS_LOG_TYPE_FAULT, "Legacy search bar path only. This is a UIKit bug.", buf, 2u);
        }
      }
    }
    else if (!v6)
    {
      uint64_t v8 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_presentScopeBarIfNecessary___s_category) + 8);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)char v9 = 0;
        _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_ERROR, "Legacy search bar path only. This is a UIKit bug.", v9, 2u);
      }
    }
    [(UISearchBar *)self _setShowsScopeBar:1 animateOpacity:+[UIView _isInAnimationBlockWithAnimationsEnabled]];
  }
}

- (void)_dismissScopeBarIfNecessary
{
  BOOL v3 = [(_UISearchBarVisualProviderBase *)self->_visualProvider scopeTitles];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    int has_internal_diagnostics = os_variant_has_internal_diagnostics();
    BOOL v6 = [(UISearchBar *)self _usesLegacyVisualProvider];
    if (has_internal_diagnostics)
    {
      if (!v6)
      {
        objc_super v7 = __UIFaultDebugAssertLog();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_1853B0000, v7, OS_LOG_TYPE_FAULT, "Legacy search bar path only. This is a UIKit bug.", buf, 2u);
        }
      }
    }
    else if (!v6)
    {
      uint64_t v8 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_dismissScopeBarIfNecessary___s_category) + 8);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)char v9 = 0;
        _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_ERROR, "Legacy search bar path only. This is a UIKit bug.", v9, 2u);
      }
    }
    [(UISearchBar *)self _setShowsScopeBar:0 animateOpacity:+[UIView _isInAnimationBlockWithAnimationsEnabled]];
  }
}

- (void)_setShowsScopeBar:(BOOL)a3 animateOpacity:(BOOL)a4
{
}

- (void)setShowsScopeBar:(BOOL)showsScopeBar
{
}

- (void)_setDeferredAutomaticShowsScopeBarInNavigationBar:(id)a3 hasContent:(BOOL)a4
{
}

- (void)_scopeChanged:(id)a3
{
  uint64_t v4 = [a3 selectedSegmentIndex];
  [(UISearchBar *)self _scopeIndexChanged:v4];
}

- (void)_scopeIndexChanged:(int64_t)a3
{
  if ([(_UISearchBarVisualProviderBase *)self->_visualProvider selectedScope] != a3)
  {
    [(_UISearchBarVisualProviderBase *)self->_visualProvider setSelectedScope:a3];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector()) {
      [WeakRetained searchBar:self selectedScopeButtonIndexDidChange:a3];
    }
    int64_t v5 = [(_UISearchBarVisualProviderBase *)self->_visualProvider searchDisplayController];
    [v5 searchBar:self selectedScopeButtonIndexDidChange:a3];

    [(UISearchController *)self->__searchController _searchBar:self selectedScopeButtonIndexDidChange:a3];
    if (!self->__searchController)
    {
      BOOL v6 = [(UISearchBar *)self _searchBarTextField];
      -[UISearchTextField _clearSearchSuggestionsIfNecessary](v6);
    }
  }
}

- (id)_scopeBarContainerView
{
  return [(_UISearchBarVisualProviderBase *)self->_visualProvider scopeBarContainerView];
}

- (void)_updateBackgroundToBackdropStyle:(int64_t)a3
{
}

- (id)preferredFocusEnvironments
{
  v8[1] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(_UISearchBarVisualProviderBase *)self->_visualProvider searchField];
  if ([v3 canBecomeFocused]
    && ([(UIView *)self traitCollection],
        uint64_t v4 = objc_claimAutoreleasedReturnValue(),
        uint64_t v5 = [v4 userInterfaceIdiom],
        v4,
        v5 == 3))
  {
    v8[0] = v3;
    BOOL v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  }
  else
  {
    BOOL v6 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v6;
}

- (id)preferredFocusedView
{
  return [(_UISearchBarVisualProviderBase *)self->_visualProvider searchField];
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6 = a3;
  v19.receiver = self;
  v19.super_class = (Class)UISearchBar;
  [(UIView *)&v19 didUpdateFocusInContext:v6 withAnimationCoordinator:a4];
  objc_super v7 = [(UIView *)self traitCollection];
  uint64_t v8 = [v7 userInterfaceIdiom];

  if (v8 == 3)
  {
    char v9 = [(_UISearchBarVisualProviderBase *)self->_visualProvider searchField];
    long long v10 = [v6 nextFocusedView];

    long long v11 = [v9 layer];
    long long v12 = v11;
    if (v10 == v9)
    {
      [v11 setCornerRadius:6.0];

      uint64_t v17 = [v9 layer];
      id v18 = +[UIColor externalSystemTealColor];
      objc_msgSend(v17, "setBorderColor:", objc_msgSend(v18, "CGColor"));

      objc_super v14 = [v9 layer];
      uint64_t v15 = v14;
      double v16 = 1.0;
    }
    else
    {
      [v11 setCornerRadius:0.0];

      long long v13 = [v9 layer];
      [v13 setBorderColor:0];

      objc_super v14 = [v9 layer];
      uint64_t v15 = v14;
      double v16 = 0.0;
    }
    [v14 setBorderWidth:v16];
  }
}

- (void)_setDisableFocus:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(_UISearchBarVisualProviderBase *)self->_visualProvider searchField];
  [v4 _setDisableFocus:v3];
}

- (void)setFocusGroupIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(UISearchBar *)self _searchBarTextField];
  [v5 setFocusGroupIdentifier:v4];
}

- (id)focusGroupIdentifier
{
  double v2 = [(UISearchBar *)self _searchBarTextField];
  BOOL v3 = [v2 focusGroupIdentifier];

  return v3;
}

- (void)setBarTintColor:(UIColor *)barTintColor
{
}

- (UIColor)barTintColor
{
  return [(_UISearchBarVisualProviderBase *)self->_visualProvider barTintColor];
}

- (void)setBackgroundImage:(id)a3 forBarMetrics:(int64_t)a4
{
  id v8 = a3;
  objc_super v7 = NSStringFromSelector(a2);
  NSLog(&cfstr_NoteUisearchba.isa, v7);

  [(UISearchBar *)self setBackgroundImage:v8 forBarPosition:2 barMetrics:a4];
}

- (UIImage)backgroundImageForBarPosition:(UIBarPosition)barPosition barMetrics:(UIBarMetrics)barMetrics
{
  if (barMetrics == UIBarMetricsCompactPrompt || barMetrics == UIBarMetricsCompact)
  {
    if ((byte_1EB25D01D & 1) == 0)
    {
      byte_1EB25D01D = 1;
      NSLog(&cfstr_SCustomization.isa, a2, barPosition, "UISearchBar", @"background image", "UIBarMetricsCompact", "UIBarMetricsCompactPrompt");
    }
    goto LABEL_12;
  }
  if (barPosition == 4)
  {
    if ((byte_1EB25D01F & 1) == 0)
    {
      byte_1EB25D01F = 1;
      id v4 = "UIBarPositionBottomAttached";
      goto LABEL_11;
    }
LABEL_12:
    id v5 = 0;
    goto LABEL_13;
  }
  if (barPosition == UIBarPositionBottom)
  {
    if ((byte_1EB25D01E & 1) == 0)
    {
      byte_1EB25D01E = 1;
      id v4 = "UIBarPositionBottom";
LABEL_11:
      NSLog(&cfstr_SCustomization_0.isa, a2, barPosition, "UISearchBar", @"background image", v4);
      goto LABEL_12;
    }
    goto LABEL_12;
  }
  id v5 = -[_UISearchBarVisualProviderBase backgroundImageForBarPosition:barMetrics:](self->_visualProvider, "backgroundImageForBarPosition:barMetrics:");
LABEL_13:
  return (UIImage *)v5;
}

- (UIImage)backgroundImage
{
  double v2 = [(_UISearchBarVisualProviderBase *)self->_visualProvider searchBarBackground];
  BOOL v3 = [v2 backgroundImage];

  return (UIImage *)v3;
}

- (id)_separatorImage
{
  return [(_UISearchBarVisualProviderBase *)self->_visualProvider separatorImage];
}

- (void)_setSeparatorImage:(id)a3
{
}

- (void)setSearchFieldBackgroundImage:(UIImage *)backgroundImage forState:(UIControlState)state
{
}

- (UIImage)searchFieldBackgroundImageForState:(UIControlState)state
{
  return (UIImage *)[(_UISearchBarVisualProviderBase *)self->_visualProvider searchFieldBackgroundImageForState:state];
}

- (void)setImage:(UIImage *)iconImage forSearchBarIcon:(UISearchBarIcon)icon state:(UIControlState)state
{
}

- (UIImage)imageForSearchBarIcon:(UISearchBarIcon)icon state:(UIControlState)state
{
  return (UIImage *)[(_UISearchBarVisualProviderBase *)self->_visualProvider imageForSearchBarIcon:icon state:state];
}

- (void)setScopeBarBackgroundImage:(UIImage *)scopeBarBackgroundImage
{
}

- (UIImage)scopeBarBackgroundImage
{
  return [(_UISearchBarVisualProviderBase *)self->_visualProvider scopeBarBackgroundImage];
}

- (void)setScopeBarButtonBackgroundImage:(UIImage *)backgroundImage forState:(UIControlState)state
{
  objc_super v7 = backgroundImage;
  uint64_t v6 = [(_UISearchBarVisualProviderBase *)self->_visualProvider scopeBar];
  if ((unint64_t)v7 | v6)
  {
    [(_UISearchBarVisualProviderBase *)self->_visualProvider setUpScopeBar];
    [(id)v6 _setBackgroundImage:v7 forState:state barMetrics:0];
  }
}

- (UIImage)scopeBarButtonBackgroundImageForState:(UIControlState)state
{
  id v4 = [(_UISearchBarVisualProviderBase *)self->_visualProvider scopeBar];
  id v5 = [v4 backgroundImageForState:state barMetrics:0];

  return (UIImage *)v5;
}

- (void)setScopeBarButtonDividerImage:(UIImage *)dividerImage forLeftSegmentState:(UIControlState)leftState rightSegmentState:(UIControlState)rightState
{
  char v9 = dividerImage;
  uint64_t v8 = [(_UISearchBarVisualProviderBase *)self->_visualProvider scopeBar];
  if ((unint64_t)v9 | v8)
  {
    [(_UISearchBarVisualProviderBase *)self->_visualProvider setUpScopeBar];
    [(id)v8 _setDividerImage:v9 forLeftSegmentState:leftState rightSegmentState:rightState barMetrics:0];
  }
}

- (UIImage)scopeBarButtonDividerImageForLeftSegmentState:(UIControlState)leftState rightSegmentState:(UIControlState)rightState
{
  uint64_t v6 = [(_UISearchBarVisualProviderBase *)self->_visualProvider scopeBar];
  objc_super v7 = [v6 dividerImageForLeftSegmentState:leftState rightSegmentState:rightState barMetrics:0];

  return (UIImage *)v7;
}

- (void)setScopeBarButtonTitleTextAttributes:(NSDictionary *)attributes forState:(UIControlState)state
{
  objc_super v7 = attributes;
  uint64_t v6 = [(_UISearchBarVisualProviderBase *)self->_visualProvider scopeBar];
  if ((unint64_t)v7 | v6)
  {
    [(_UISearchBarVisualProviderBase *)self->_visualProvider setUpScopeBar];
    [(id)v6 _setTitleTextAttributes:v7 forState:state];
  }
}

- (NSDictionary)scopeBarButtonTitleTextAttributesForState:(UIControlState)state
{
  id v4 = [(_UISearchBarVisualProviderBase *)self->_visualProvider scopeBar];
  id v5 = [v4 titleTextAttributesForState:state];

  return (NSDictionary *)v5;
}

- (void)setSearchFieldBackgroundPositionAdjustment:(UIOffset)searchFieldBackgroundPositionAdjustment
{
}

- (UIOffset)searchFieldBackgroundPositionAdjustment
{
  [(_UISearchBarVisualProviderBase *)self->_visualProvider searchFieldBackgroundPositionAdjustment];
  result.CGFloat vertical = v3;
  result.CGFloat horizontal = v2;
  return result;
}

- (void)setSearchTextPositionAdjustment:(UIOffset)searchTextPositionAdjustment
{
  CGFloat vertical = searchTextPositionAdjustment.vertical;
  CGFloat horizontal = searchTextPositionAdjustment.horizontal;
  id v5 = [(UISearchBar *)self _searchBarTextField];
  *(CGFloat *)objc_super v7 = horizontal;
  *(CGFloat *)&v7[1] = vertical;
  uint64_t v6 = [MEMORY[0x1E4F29238] valueWithBytes:v7 objCType:"{UIOffset=dd}"];
  [v5 _setSearchTextOffetValue:v6];
}

- (UIOffset)searchTextPositionAdjustment
{
  double v2 = [(UISearchBar *)self _searchBarTextField];
  double v3 = [v2 _searchTextOffsetValue];

  if (v3)
  {
    [v3 UIOffsetValue];
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
  result.CGFloat vertical = v9;
  result.CGFloat horizontal = v8;
  return result;
}

- (UIOffset)positionAdjustmentForSearchBarIcon:(UISearchBarIcon)icon
{
  double v4 = [(UISearchBar *)self _searchBarTextField];
  double v5 = [v4 _offsetValueForIcon:icon];

  if (v5)
  {
    [v5 UIOffsetValue];
    double v7 = v6;
    double v9 = v8;
  }
  else
  {
    double v7 = 0.0;
    double v9 = 0.0;
  }

  double v10 = v7;
  double v11 = v9;
  result.CGFloat vertical = v11;
  result.CGFloat horizontal = v10;
  return result;
}

- (UIView)inputAccessoryView
{
  inputAccessoryView = self->_inputAccessoryView;
  if (inputAccessoryView)
  {
    double v3 = inputAccessoryView;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)UISearchBar;
    double v3 = [(UIResponder *)&v5 inputAccessoryView];
  }
  return v3;
}

- (BOOL)_ownsInputAccessoryView
{
  if (self->_inputAccessoryView) {
    return 1;
  }
  v3.receiver = self;
  v3.super_class = (Class)UISearchBar;
  return [(UIResponder *)&v3 _ownsInputAccessoryView];
}

- (UITextInputAssistantItem)inputAssistantItem
{
  double v2 = [(UISearchBar *)self searchField];
  objc_super v3 = [v2 inputAssistantItem];

  return (UITextInputAssistantItem *)v3;
}

- (id)_searchDisplayControllerNavigationItem
{
  return [(_UISearchBarVisualProviderBase *)self->_visualProvider searchNavigationItem];
}

- (id)_animatedAppearanceBarButtonItem
{
  return [(_UISearchBarVisualProviderBase *)self->_visualProvider animatedAppearanceBarButtonItem];
}

- (UIBarButtonItem)_searchIconBarButtonItem
{
  return [(_UISearchBarVisualProviderBase *)self->_visualProvider searchIconBarButtonItem];
}

- (void)_setRequiresSearchTextField:(BOOL)a3
{
}

- (BOOL)_requiresSearchTextField
{
  return [(_UISearchBarVisualProviderBase *)self->_visualProvider requiresSearchTextField];
}

- (BOOL)_activeSearchDeferringScopeBar
{
  return [(_UISearchBarVisualProviderBase *)self->_visualProvider isActiveSearchDeferringScopeBar];
}

- (int64_t)_layoutState
{
  return [(_UISearchBarVisualProviderBase *)self->_visualProvider layoutState];
}

- (double)_idealInlineWidthForLayoutState:(int64_t)a3
{
  [(_UISearchBarVisualProviderBase *)self->_visualProvider idealInlineWidthForLayoutState:a3];
  return result;
}

- (void)_setLeftInsetForInlineSearch:(double)a3
{
}

- (double)_leftInsetForInlineSearch
{
  [(_UISearchBarVisualProviderBase *)self->_visualProvider leftInsetForInlineSearch];
  return result;
}

- (void)_setRightInsetForInlineSearch:(double)a3
{
}

- (double)_rightInsetForInlineSearch
{
  [(_UISearchBarVisualProviderBase *)self->_visualProvider rightInsetForInlineSearch];
  return result;
}

- (BOOL)_containedInNavigationPalette
{
  return [(_UISearchBarVisualProviderBase *)self->_visualProvider isInNavigationPalette];
}

- (void)_setBackgroundLayoutNeedsUpdate
{
}

- (UISearchBarStyle)searchBarStyle
{
  return [(_UISearchBarVisualProviderBase *)self->_visualProvider searchBarStyle];
}

- (int64_t)_backdropStyle
{
  return [(_UISearchBarVisualProviderBase *)self->_visualProvider backdropStyle];
}

- (id)_presentationBackgroundBlurEffectForTraitCollection:(id)a3
{
  id v4 = a3;
  if ([(UISearchBar *)self keyboardAppearance]
    && [(UISearchBar *)self keyboardAppearance] != 10)
  {
    BOOL v5 = [(UISearchBar *)self _hasDarkUIAppearance];
  }
  else
  {
    BOOL v5 = [v4 userInterfaceStyle] == 2;
  }
  if (v5) {
    uint64_t v6 = 4007;
  }
  else {
    uint64_t v6 = 4002;
  }
  double v7 = +[UIBlurEffect effectWithStyle:v6];

  return v7;
}

- (BOOL)_hasDarkUIAppearance
{
  objc_super v3 = [(UIView *)self traitCollection];
  uint64_t v4 = [v3 userInterfaceStyle];

  uint64_t v5 = [(UISearchBar *)self keyboardAppearance];
  BOOL result = 0;
  if (v5 > 8)
  {
    if (v5 != 10)
    {
      if (v5 != 9) {
        return result;
      }
      return 1;
    }
    return v4 == 2;
  }
  if (!v5) {
    return v4 == 2;
  }
  if (v5 == 1) {
    return 1;
  }
  return result;
}

- (id)_textColor
{
  return [(_UISearchBarVisualProviderBase *)self->_visualProvider textColor];
}

- (void)_allowCursorToAppear:(BOOL)a3
{
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  uint64_t v4 = self;
  v12.receiver = self;
  v12.super_class = (Class)UISearchBar;
  -[UIView hitTest:withEvent:](&v12, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  uint64_t v5 = (UISearchBar *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [(_UISearchBarVisualProviderBase *)v4->_visualProvider searchBarClippingView];
  double v7 = v6;
  if (v6) {
    BOOL v8 = v5 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {

LABEL_8:
    uint64_t v4 = v5;
    goto LABEL_9;
  }
  double v9 = [(_UISearchBarVisualProviderBase *)v4->_visualProvider searchBarClippingView];

  if (v5 != v9) {
    goto LABEL_8;
  }
LABEL_9:
  double v10 = v4;

  return v10;
}

- (void)tappedSearchBar:(id)a3
{
  if (![(UISearchBar *)self isFirstResponder])
  {
    [(UISearchBar *)self becomeFirstResponder];
  }
}

- (void)_updateInsetsForTableView:(id)a3
{
  if (a3) {
    [a3 _indexBarExtentFromEdge];
  }
  else {
    double v4 = 0.0;
  }
  [(_UISearchBarVisualProviderBase *)self->_visualProvider setTableViewIndexWidth:v4];
  visualProvider = self->_visualProvider;
  [(_UISearchBarVisualProviderBase *)visualProvider updateEffectiveContentInset];
}

- (int64_t)searchFieldLeftViewMode
{
  return [(_UISearchBarVisualProviderBase *)self->_visualProvider searchFieldLeftViewMode];
}

- (void)setSearchFieldLeftViewMode:(int64_t)a3
{
}

- (int64_t)_barMetricsForOrientation:(int64_t)a3
{
  return [(_UISearchBarVisualProviderBase *)self->_visualProvider barMetricsForOrientation:a3];
}

- (BOOL)_shouldUseNavigationBarHeight
{
  return [(_UISearchBarVisualProviderBase *)self->_visualProvider isPlacedInNavigationBar];
}

- (void)_setShowsDeleteButton:(BOOL)a3
{
}

- (id)_uiktest_placeholderLabelColor
{
  double v2 = [(UISearchBar *)self _searchBarTextField];
  objc_super v3 = [v2 _placeholderLabel];
  double v4 = [v3 textColor];

  return v4;
}

- (BOOL)pretendsIsInBar
{
  return 0;
}

- (BOOL)_isInBarButNotHosted
{
  return [(_UISearchBarVisualProviderBase *)self->_visualProvider isInBarButNotHosted];
}

- (void)_deleteButtonPressed
{
  id v2 = [(_UISearchBarVisualProviderBase *)self->_visualProvider searchField];
  [v2 deleteBackward];
}

- (void)_setCancelButtonText:(id)a3
{
}

- (void)_setupCancelButton
{
}

- (void)_setupCancelButtonWithAppearance:(id)a3
{
}

- (void)_destroyCancelButton
{
}

- (void)_cancelButtonPressed
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained searchBarCancelButtonClicked:self];
  }
  objc_super v3 = [(_UISearchBarVisualProviderBase *)self->_visualProvider searchDisplayController];
  [v3 searchBarCancelButtonClicked:self];

  [(UISearchController *)self->__searchController _searchBarCancelButtonClicked:self];
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  if (sel__cancelOperation_ == a3)
  {
    uint64_t v5 = [(_UISearchBarVisualProviderBase *)self->_visualProvider cancelButton];
    BOOL v4 = v5 != 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UISearchBar;
    return -[UIView canPerformAction:withSender:](&v7, sel_canPerformAction_withSender_);
  }
  return v4;
}

- (void)_cancelOperation:(id)a3
{
  BOOL v4 = [(_UISearchBarVisualProviderBase *)self->_visualProvider cancelButton];

  if (v4)
  {
    [(UISearchBar *)self _cancelButtonPressed];
  }
}

- (void)_bookmarkButtonPressed
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained searchBarBookmarkButtonClicked:self];
  }
}

- (void)_resultsListButtonPressed
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained searchBarResultsListButtonClicked:self];
  }
  objc_super v3 = [(_UISearchBarVisualProviderBase *)self->_visualProvider searchDisplayController];
  [v3 searchBarResultsListButtonClicked:self];
}

- (void)_searchFieldBeginEditing
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained searchBarTextDidBeginEditing:self];
  }
  objc_super v3 = [(_UISearchBarVisualProviderBase *)self->_visualProvider searchDisplayController];
  [v3 searchBarTextDidBeginEditing:self];

  [(UISearchController *)self->__searchController _searchBarTextDidBeginEditing:self];
  BOOL v4 = [(_UISearchBarVisualProviderBase *)self->_visualProvider cancelButton];
  [v4 setEnabled:1];
}

- (void)_searchFieldEndEditing
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained searchBarTextDidEndEditing:self];
  }
  uint64_t v3 = [(_UISearchBarVisualProviderBase *)self->_visualProvider autoDisableCancelButton] ^ 1;
  BOOL v4 = [(_UISearchBarVisualProviderBase *)self->_visualProvider cancelButton];
  [v4 setEnabled:v3];
}

- (void)_searchFieldReturnPressed
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained searchBarSearchButtonClicked:self];
  }
  uint64_t v3 = [(_UISearchBarVisualProviderBase *)self->_visualProvider searchDisplayController];
  [v3 searchBarSearchButtonClicked:self];

  [(UISearchController *)self->__searchController _searchBarSearchButtonClicked:self];
}

- (void)_searchFieldTextChanged:(BOOL)a3
{
  BOOL v3 = a3;
  id v11 = [(_UISearchBarVisualProviderBase *)self->_visualProvider searchField];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    uint64_t v6 = [v11 searchText];
    [WeakRetained searchBar:self textDidChange:v6];
  }
  objc_super v7 = [(_UISearchBarVisualProviderBase *)self->_visualProvider searchDisplayController];
  BOOL v8 = [v11 searchText];
  [v7 searchBar:self textDidChange:v8];

  searchController = self->__searchController;
  double v10 = [v11 searchText];
  [(UISearchController *)searchController _searchBar:self textDidChange:v10 programatically:v3];
}

- (void)_searchFieldEditingChanged
{
}

- (void)_searchFieldSelectionChanged
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained _searchBarSelectionChanged:self];
  }
}

- (void)_searchFieldTokensChanged
{
}

- (void)insertTextSuggestion:(id)a3
{
  id v10 = a3;
  BOOL v4 = [(UISearchBar *)self _searchBarTextField];
  uint64_t v5 = [v4 text];

  if ([(UISearchController *)self->__searchController _delegateWantsInsertSearchFieldTextSuggestion])
  {
    [(UISearchController *)self->__searchController _sendDelegateInsertSearchFieldTextSuggestion:v10];
  }
  else
  {
    uint64_t v6 = [(UISearchBar *)self _searchBarTextField];
    [v6 _defaultInsertTextSuggestion:v10];
  }
  objc_super v7 = [(UISearchBar *)self _searchBarTextField];
  BOOL v8 = [v7 text];
  char v9 = [v5 isEqualToString:v8];

  if ((v9 & 1) == 0) {
    [(UISearchBar *)self _searchFieldTextChanged:1];
  }
}

- (BOOL)_disableAutomaticKeyboardUI
{
  id v2 = [(UIView *)self traitCollection];
  BOOL v3 = [v2 userInterfaceIdiom] == 3;

  return v3;
}

- (BOOL)_enableAutomaticKeyboardPressDone
{
  id v2 = [(UIView *)self traitCollection];
  BOOL v3 = [v2 userInterfaceIdiom] == 3;

  return v3;
}

- (void)reloadInputViews
{
  id v2 = [(UISearchBar *)self _searchBarTextField];
  [v2 reloadInputViews];
}

- (BOOL)canBecomeFirstResponder
{
  id v2 = [(UISearchBar *)self _searchBarTextField];
  char v3 = [v2 canBecomeFirstResponder];

  return v3;
}

- (BOOL)becomeFirstResponder
{
  id v2 = [(UISearchBar *)self _searchBarTextField];
  char v3 = [v2 becomeFirstResponder];

  return v3;
}

- (BOOL)canResignFirstResponder
{
  id v2 = [(UISearchBar *)self _searchBarTextField];
  char v3 = [v2 canResignFirstResponder];

  return v3;
}

- (BOOL)resignFirstResponder
{
  id v2 = [(UISearchBar *)self _searchBarTextField];
  char v3 = [v2 resignFirstResponder];

  return v3;
}

- (void)_setEnabled:(BOOL)a3 animated:(BOOL)a4
{
}

- (id)_backgroundView
{
  return [(_UISearchBarVisualProviderBase *)self->_visualProvider searchBarBackground];
}

- (int64_t)_textInputSource
{
  id v2 = [(_UISearchBarVisualProviderBase *)self->_visualProvider searchField];
  int64_t v3 = [v2 _textInputSource];

  return v3;
}

- (double)_heightAllowanceForTopSearchBarInTitleViewLocation
{
  [(_UISearchBarVisualProviderBase *)self->_visualProvider heightAllowanceForTopSearchBarInTitleViewLocation];
  return result;
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return WeakRetained;
}

- (void)setInputAccessoryView:(UIView *)inputAccessoryView
{
}

- (_UISearchBarVisualProviderBase)_visualProvider
{
  return self->_visualProvider;
}

- (_UISearchBarSearchContainerLayoutCustomizationDelegate)_searchFieldContainerLayoutCustomizationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_searchFieldContainerLayoutCustomizationDelegate);
  return (_UISearchBarSearchContainerLayoutCustomizationDelegate *)WeakRetained;
}

- (BOOL)_forceCenteredPlaceholderLayout
{
  return self->__forceCenteredPlaceholderLayout;
}

- (void)set_forceCenteredPlaceholderLayout:(BOOL)a3
{
  self->__forceCenteredPlaceholderLayout = a3;
}

- (BOOL)_transplanting
{
  return self->__transplanting;
}

- (void)_setTransplanting:(BOOL)a3
{
  self->__transplanting = a3;
}

- (BOOL)_showsHelperPlaceholder
{
  return 0;
}

- (void)_setHelperPlaceholder:(id)a3
{
}

- (void)_setForceLegacyVisual:(BOOL)a3
{
  if (self->_forceLegacyVisual != a3)
  {
    self->_forceLegacyVisual = a3;
    [(_UISearchBarVisualProviderBase *)self->_visualProvider teardown];
    visualProvider = self->_visualProvider;
    self->_visualProvider = 0;

    [(UISearchBar *)self _setUpVisualProvider];
  }
}

- (BOOL)_forceLegacyVisual
{
  return self->_forceLegacyVisual;
}

- (void)_setShowDictationDisplayInSearchBar:(BOOL)a3
{
}

- (BOOL)_showDictationDisplayInSearchBar
{
  return 0;
}

- (void)_setHelperPlaceholderOverride:(id)a3
{
}

- (id)_tokens
{
  id v2 = [(UISearchBar *)self searchField];
  int64_t v3 = [v2 tokens];

  return v3;
}

- (void)_insertToken:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = a3;
  objc_super v7 = [(UISearchBar *)self searchField];
  [v7 insertToken:v6 atIndex:a4];

  [(UISearchBar *)self _searchFieldTextChanged:1];
}

- (void)_removeTokenAtIndex:(unint64_t)a3
{
  uint64_t v5 = [(UISearchBar *)self searchField];
  [v5 removeTokenAtIndex:a3];

  [(UISearchBar *)self _searchFieldTextChanged:1];
}

- (void)_replaceSearchTextWithToken:(id)a3
{
  id v4 = a3;
  id v7 = [(UISearchBar *)self searchField];
  uint64_t v5 = [v7 textualRange];
  id v6 = [v7 tokens];
  objc_msgSend(v7, "replaceTextualPortionOfRange:withToken:atIndex:", v5, v4, objc_msgSend(v6, "count"));

  [(UISearchBar *)self _searchFieldTextChanged:1];
}

- (void)_setTokenBackgroundColor:(id)a3
{
  id v4 = a3;
  id v5 = [(UISearchBar *)self searchField];
  [v5 setTokenBackgroundColor:v4];
}

- (id)_selectedTokens
{
  id v2 = [(UISearchBar *)self searchField];
  int64_t v3 = [v2 selectedTextRange];
  id v4 = [v2 tokensInRange:v3];

  return v4;
}

- (BOOL)scribbleInteractionShouldDelayFocus:(id)a3
{
  return self->__searchController != 0;
}

- (BOOL)_hasCustomAutolayoutNeighborSpacingForAttribute:(int64_t *)a3
{
  return 1;
}

- (double)_autolayoutSpacingAtEdge:(int)a3 forAttribute:(int64_t)a4 inContainer:(id)a5 isGuide:(BOOL)a6
{
  double result = 0.0;
  if (a6)
  {
    v7.receiver = self;
    v7.super_class = (Class)UISearchBar;
    -[UIView _autolayoutSpacingAtEdge:forAttribute:inContainer:isGuide:](&v7, sel__autolayoutSpacingAtEdge_forAttribute_inContainer_isGuide_, *(void *)&a3, a4, a5, 1, 0.0);
  }
  return result;
}

- (double)_defaultAutolayoutSpacing
{
  return 0.0;
}

@end