@interface UISearchController
+ (void)_resignSearchBarAsFirstResponder:(id)a3;
- (BOOL)_allowFormSheetStylePresentation;
- (BOOL)_alwaysHidesNavigationBar;
- (BOOL)_clearSuggestionsOnSelection;
- (BOOL)_containedInNavigationPaletteAndNotHidden;
- (BOOL)_dci_automaticScopeBarShowsOnPresentation;
- (BOOL)_delegateWantsInsertSearchFieldTextSuggestion;
- (BOOL)_disableAutomaticKeyboardUI;
- (BOOL)_gestureRecognizerShouldBegin:(id)a3;
- (BOOL)_hidesNavigationBarDuringPresentationRespectingInlineSearch;
- (BOOL)_isGridKeyboardVisible;
- (BOOL)_isSearchController;
- (BOOL)_requiresCustomPresentationController;
- (BOOL)_resultsControllerWillLayoutVisibleUnderContainerView;
- (BOOL)_searchBarShouldFinalizeBecomingFirstResponder;
- (BOOL)_searchFieldIsBeginningEditing;
- (BOOL)_searchbarWasTableHeaderView;
- (BOOL)_shouldDisplayDefaultSuggestion;
- (BOOL)_shouldHideGridKeyboardUnfocused;
- (BOOL)_shouldLogAppearance;
- (BOOL)_shouldRespectPreferredContentSize;
- (BOOL)_showResultsForEmptySearch;
- (BOOL)_showSearchSuggestionPreview;
- (BOOL)_tabBarHidden;
- (BOOL)_transitioningOutWithoutDisappearing;
- (BOOL)_tvShouldScrollWithObservedScrollViewIfPossible;
- (BOOL)_updateSearchTextOnDidSelectSuggestion;
- (BOOL)_usesSearchSuggestionsMenuForStackedSearch;
- (BOOL)automaticallyShowsCancelButton;
- (BOOL)automaticallyShowsScopeBar;
- (BOOL)automaticallyShowsSearchResultsController;
- (BOOL)hidesNavigationBarDuringPresentation;
- (BOOL)ignoresSearchSuggestionsForSearchBarPlacementStacked;
- (BOOL)isActive;
- (BOOL)isBeingDismissed;
- (BOOL)obscuresBackgroundDuringPresentation;
- (BOOL)showsSearchResultsController;
- (CGSize)preferredContentSize;
- (NSArray)_dci_suggestionsMenuDismissalPassthroughViews;
- (NSArray)_scopeBarConstraints;
- (NSArray)_searchSuggestionGroups;
- (NSArray)searchHints;
- (NSArray)searchSuggestions;
- (NSString)_suggestionRowTitle;
- (NSString)description;
- (UICollectionView)_suggestionView;
- (UIEdgeInsets)_edgeInsetsForChildViewController:(id)a3 insetsAreAbsolute:(BOOL *)a4;
- (UIFocusContainerGuide)_scopeBarFocusContainerGuide;
- (UIFocusGuide)keyboardToSearchResultsFocusGuide;
- (UIFocusGuide)searchResultsToHiddenKeyboardFocusGuide;
- (UINavigationItem)_navigationItemCurrentlyDisplayingSearchController;
- (UINavigationItemSearchBarPlacement)searchBarPlacement;
- (UIScrollView)searchControllerObservedScrollView;
- (UISearchBar)searchBar;
- (UISearchController)initWithCoder:(NSCoder *)coder;
- (UISearchController)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil;
- (UISearchController)initWithSearchResultsController:(UIViewController *)searchResultsController;
- (UISearchControllerScopeBarActivation)scopeBarActivation;
- (UISearchResultsUpdatingPrivate)searchResultsUpdaterPrivate;
- (UISearchSuggestion)selectedSuggestion;
- (UISystemInputViewController)_systemInputViewController;
- (UIView)_leftDividerView;
- (UIView)_resultsControllerViewContainer;
- (UIView)_rightDividerView;
- (UIView)_suggestionContainerView;
- (UIView)_systemInputMarginView;
- (UIViewController)_currentActiveChildViewController;
- (UIViewController)searchResultsController;
- (_UINavigationControllerManagedSearchPalette)_managedPalette;
- (_UISearchControllerTVKeyboardContainerView)_tvKeyboardContainerView;
- (_UISearchSuggestionController)_suggestionController;
- (_UISearchSuggestionsListViewController)_suggestionsListViewController;
- (double)_resultsContentScrollViewPresentationOffset;
- (double)_topResultsViewEdgeInset;
- (double)transitionDuration:(id)a3;
- (id)_animatorForBarPresentationStyle:(int)a3 dismissing:(BOOL)a4;
- (id)_carPlayLimitedUIToken;
- (id)_carPlayLimitedUIViewController;
- (id)_createAnimationCoordinator;
- (id)_defaultAnimationController;
- (id)_deferredSearchSuggestionGroups;
- (id)_locatePresentingViewController;
- (id)_locatePresentingViewControllerIfInManagedPaletteOrHostedByNavigationBar;
- (id)_presentationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5;
- (id)_searchPresentationController;
- (id)_systemInputViewControllerAfterUpdate:(BOOL)a3;
- (id)_tvSuggestionController;
- (id)_viewToInsertSearchBarContainerViewUnder;
- (id)animationControllerForDismissedController:(id)a3;
- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5;
- (id)delegate;
- (id)focusItemContainer;
- (id)preferredFocusEnvironments;
- (id)searchPlaceholderColor;
- (id)searchResultsUpdater;
- (id)searchTextColor;
- (id)searchTextField;
- (int)_barPresentationStyle;
- (int64_t)_previousSearchBarPosition;
- (uint64_t)_isSearchResultsControllerViewUnhidden;
- (uint64_t)_isSuggestionsListViewControllerViewUnhidden;
- (unint64_t)_requestedInteractionModel;
- (void)__searchBar:(int)a3 changedSearchTextFieldContentProgramatically:;
- (void)__searchTextFieldDidSetOrInsertTokens:(uint64_t)a1;
- (void)_adjustSearchBarSizeForOrientation:(int64_t)a3;
- (void)_adjustSearchBarSizeForOrientation:(int64_t)a3 oldPaletteFrame:(CGRect)a4;
- (void)_adjustTVSearchContainerViewForContentScrollView:(id)a3;
- (void)_beginWatchingPresentingController;
- (void)_clearSearchSuggestionsIfNecessary;
- (void)_commonInit;
- (void)_connectSearchBar:(id)a3;
- (void)_contentScrollViewDidFinishContentOffsetAnimation;
- (void)_createOrUpdateKeyboardToSearchResultsFocusGuide;
- (void)_createOrUpdateSearchResultsToHiddenKeyboardFocusGuide;
- (void)_createSystemInputViewControllerIfNeededForTraitEnvironment:(id)a3;
- (void)_dci_setAutomaticScopeBarShowsOnPresentation:(BOOL)a3;
- (void)_didCreateSystemInputViewController;
- (void)_didDismissSearchController;
- (void)_didPresentFromViewController:(id)a3;
- (void)_dismissPresentation:(BOOL)a3;
- (void)_endWatchingPresentingController;
- (void)_handleBackButtonGesture:(id)a3;
- (void)_hideSearchSuggestionsList;
- (void)_installBackGestureRecognizer;
- (void)_installDoneGestureRecognizer;
- (void)_ios_searchBar:(id)a3 textDidChange:(id)a4 programatically:(BOOL)a5;
- (void)_limitedUIDidChangeAnimated:(BOOL)a3;
- (void)_navigationControllerWillShowViewController:(id)a3;
- (void)_performAutomaticPresentationFromTextField:(BOOL)a3;
- (void)_performDidBeginEditingForSearchBar:(id)a3;
- (void)_preferredContentSizeDidChangeForChildViewController:(id)a3;
- (void)_presentingViewControllerDidChange:(id)a3;
- (void)_presentingViewControllerWillChange:(id)a3;
- (void)_removeCarPlayLimitedUIObserver;
- (void)_requestNavigationControllerObservingUpdateForSearchBar:(int)a3 visibilityChangedForSearchSuggestionsList:(int)a4 forSearchResultsController:;
- (void)_requestPendingSuggestionMenuRefresh;
- (void)_resizeResultsControllerWithDelta:(CGSize)a3;
- (void)_scopeBarWillShowOrHide;
- (void)_searchBar:(id)a3 selectedScopeButtonIndexDidChange:(int64_t)a4;
- (void)_searchBarCancelButtonClicked:(id)a3;
- (void)_searchBarSearchButtonClicked:(id)a3;
- (void)_searchBarSearchTextFieldRequirementDidChange:(id)a3;
- (void)_searchBarSuperviewChanged;
- (void)_searchBarTextDidBeginEditing:(id)a3;
- (void)_searchBarTextFieldDidSelectSearchSuggestion:(id)a3;
- (void)_searchBarTokensDidChange:(id)a3;
- (void)_sendDelegateInsertSearchFieldTextSuggestion:(id)a3;
- (void)_setAlwaysHidesNavigationBar:(BOOL)a3;
- (void)_setCarPlayLimitedUIToken:(id)a3;
- (void)_setCarPlayLimitedUIViewController:(id)a3;
- (void)_setClearSuggestionsOnSelection:(BOOL)a3;
- (void)_setDeferredSearchSuggestionGroups:(id)a3;
- (void)_setGridKeyboardVisible:(BOOL)a3;
- (void)_setNavigationItemCurrentlyDisplayingSearchController:(id)a3;
- (void)_setRequestedInteractionModel:(unint64_t)a3;
- (void)_setSearchSuggestionGroups:(id)a3;
- (void)_setShouldDisplayDefaultSuggestion:(BOOL)a3;
- (void)_setShouldHideGridKeyboardUnfocused:(BOOL)a3;
- (void)_setShouldRespectPreferredContentSize:(BOOL)a3;
- (void)_setShowResultsForEmptySearch:(BOOL)a3;
- (void)_setShowSearchSuggestionPreview:(BOOL)a3;
- (void)_setSuggestionController:(id)a3;
- (void)_setSuggestionRowTitle:(id)a3;
- (void)_setTransitioningOutWithoutDisappearing:(BOOL)a3;
- (void)_setUpdateSearchTextOnDidSelectSuggestion:(BOOL)a3;
- (void)_setUsesSearchSuggestionsMenuForStackedSearch:(BOOL)a3;
- (void)_setupForCurrentTraitCollection;
- (void)_showSearchSuggestionsListIfApplicable;
- (void)_sizeSearchViewToPresentingViewController:(id)a3;
- (void)_startDeferringSettingSearchSuggestions;
- (void)_startManagingPalette:(id)a3;
- (void)_stopDeferringAndShowDeferredSearchSuggestions;
- (void)_stopManagingPalette;
- (void)_suggestionsMenuInteractionWillEndWithAnimator:(id)a3;
- (void)_tvos_searchBar:(id)a3 textDidChange:(id)a4 programatically:(BOOL)a5;
- (void)_uninstallBackGestureRecognizer;
- (void)_uninstallDoneGestureRecognizer;
- (void)_updateBarPresentationStyleForPresentingViewController:(id)a3;
- (void)_updateFocusFromDoneButton:(id)a3;
- (void)_updateHasPendingSuggestionMenuRefreshFlagForReason:(int64_t)a3;
- (void)_updateKeyboardFocusGuidesForAnimator:(id)a3;
- (void)_updateSearchBarMaskIfNecessary;
- (void)_updateSearchResultsContentScrollViewWithDelta:(CGSize)a3;
- (void)_updateSearchResultsControllerWithDelta:(CGSize)a3;
- (void)_updateSearchResultsPositionWithDelta:(CGSize)a3;
- (void)_updateSearchSuggestionsListVisibility;
- (void)_updateSearchSuggestionsListVisibilityShouldRequestNavigationControllerObservingUpdate:(BOOL)a3;
- (void)_updateSystemInputViewController;
- (void)_updateTableHeaderBackgroundViewInTableView:(id)a3 amountScrolledUnder:(double)a4;
- (void)_updateVisibilityOfSearchResultsForSearchBar:(id)a3;
- (void)_watchScrollView:(id)a3 forScrolling:(BOOL)a4;
- (void)_willDismissSearchController;
- (void)_willPresentFromViewController:(id)a3;
- (void)_willUpdateFocusInContext:(id)a3;
- (void)animateTransition:(id)a3;
- (void)applicationDidBecomeActive:(id)a3;
- (void)applicationDidEnterBackground:(id)a3;
- (void)applicationWillEnterForeground:(id)a3;
- (void)applicationWillResignActive:(id)a3;
- (void)dealloc;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)loadView;
- (void)setActive:(BOOL)active;
- (void)setAutomaticallyShowsCancelButton:(BOOL)automaticallyShowsCancelButton;
- (void)setAutomaticallyShowsScopeBar:(BOOL)automaticallyShowsScopeBar;
- (void)setAutomaticallyShowsSearchResultsController:(BOOL)automaticallyShowsSearchResultsController;
- (void)setDelegate:(id)delegate;
- (void)setHidesNavigationBarDuringPresentation:(BOOL)hidesNavigationBarDuringPresentation;
- (void)setIgnoresSearchSuggestionsForSearchBarPlacementStacked:(BOOL)ignoresSearchSuggestionsForSearchBarPlacementStacked;
- (void)setKeyboardToSearchResultsFocusGuide:(id)a3;
- (void)setModalPresentationStyle:(int64_t)a3;
- (void)setObscuresBackgroundDuringPresentation:(BOOL)obscuresBackgroundDuringPresentation;
- (void)setScopeBarActivation:(UISearchControllerScopeBarActivation)scopeBarActivation;
- (void)setSearchControllerObservedScrollView:(UIScrollView *)searchControllerObservedScrollView;
- (void)setSearchHints:(id)a3;
- (void)setSearchResultsToHiddenKeyboardFocusGuide:(id)a3;
- (void)setSearchResultsUpdater:(id)searchResultsUpdater;
- (void)setSearchResultsUpdaterPrivate:(id)a3;
- (void)setSearchSuggestions:(NSArray *)searchSuggestions;
- (void)setSelectedSuggestion:(id)a3;
- (void)setShowsSearchResultsController:(BOOL)showsSearchResultsController;
- (void)set_previousSearchBarPosition:(int64_t)a3;
- (void)set_resultsContentScrollViewPresentationOffset:(double)a3;
- (void)set_resultsControllerViewContainer:(id)a3;
- (void)set_scopeBarConstraints:(id)a3;
- (void)set_shouldLogAppearance:(BOOL)a3;
- (void)set_suggestionContainerView:(id)a3;
- (void)set_systemInputMarginView:(id)a3;
- (void)set_tabBarHidden:(BOOL)a3;
- (void)set_topResultsViewEdgeInset:(double)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4;
@end

@implementation UISearchController

- (BOOL)hidesNavigationBarDuringPresentation
{
  return (*((unsigned __int8 *)&self->_controllerFlags + 1) >> 2) & 1;
}

- (BOOL)_hidesNavigationBarDuringPresentationRespectingInlineSearch
{
  if ([(UISearchController *)self searchBarPlacement] != UINavigationItemSearchBarPlacementStacked) {
    return 0;
  }
  return [(UISearchController *)self hidesNavigationBarDuringPresentation];
}

- (UINavigationItemSearchBarPlacement)searchBarPlacement
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__navigationItemCurrentlyDisplayingSearchController);
  if ([WeakRetained _hasInlineSearchBar]) {
    UINavigationItemSearchBarPlacement v3 = UINavigationItemSearchBarPlacementInline;
  }
  else {
    UINavigationItemSearchBarPlacement v3 = UINavigationItemSearchBarPlacementStacked;
  }

  return v3;
}

- (UISearchBar)searchBar
{
  return self->_searchBar;
}

- (UINavigationItem)_navigationItemCurrentlyDisplayingSearchController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__navigationItemCurrentlyDisplayingSearchController);
  return (UINavigationItem *)WeakRetained;
}

- (BOOL)automaticallyShowsCancelButton
{
  return (*(unsigned char *)&self->_controllerFlags >> 4) & 1;
}

- (void)setSearchSuggestions:(NSArray *)searchSuggestions
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v4 = searchSuggestions;
  if (v4)
  {
    v5 = [[_UISearchSuggestionItemGroup alloc] initWithHeaderTitle:0 suggestionItems:v4];
    v7[0] = v5;
    v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
    [(UISearchController *)self _setSearchSuggestionGroups:v6];
  }
  else
  {
    [(UISearchController *)self _setSearchSuggestionGroups:0];
  }
}

- (void)_setSearchSuggestionGroups:(id)a3
{
  id v4 = a3;
  $D69225ED9BA803AE184F8CEF6B0C1DE3 controllerFlags = self->_controllerFlags;
  unsigned int v6 = *(_DWORD *)&controllerFlags & 0xFFFFDFFF;
  self->_$D69225ED9BA803AE184F8CEF6B0C1DE3 controllerFlags = ($D69225ED9BA803AE184F8CEF6B0C1DE3)(*(_DWORD *)&controllerFlags & 0xFFFFDFFF);
  id v9 = v4;
  if (!v4) {
    goto LABEL_5;
  }
  if ((*(_WORD *)&controllerFlags & 0x800) == 0 && [(UISearchController *)self isActive])
  {
    unsigned int v6 = self->_controllerFlags;
LABEL_5:
    self->_$D69225ED9BA803AE184F8CEF6B0C1DE3 controllerFlags = ($D69225ED9BA803AE184F8CEF6B0C1DE3)(v6 & 0xFFFFEFFF);
    v7 = [(UISearchController *)self _suggestionController];
    [v7 updateSuggestionGroups:v9 userInitiated:1];

    v8 = [(UISearchController *)self searchBar];
    [(UISearchController *)self _updateVisibilityOfSearchResultsForSearchBar:v8];

    goto LABEL_7;
  }
  [(UISearchController *)self _setDeferredSearchSuggestionGroups:v9];
LABEL_7:
}

- (void)_setDeferredSearchSuggestionGroups:(id)a3
{
}

- (UIViewController)_currentActiveChildViewController
{
  if (![(UISearchController *)self isActive])
  {
    v5 = 0;
    goto LABEL_19;
  }
  UINavigationItemSearchBarPlacement v3 = [(UISearchController *)self searchResultsController];
  if (!v3 || ![(UISearchController *)self showsSearchResultsController]) {
    goto LABEL_14;
  }
  if (((v3[94] >> 1) & 3u) - 1 <= 1)
  {
    id v4 = v3;
LABEL_16:
    v5 = v4;
    goto LABEL_18;
  }
  if ([v3 _appearState] != 3)
  {
LABEL_14:
    if (!-[UISearchController _isSuggestionsListViewControllerViewUnhidden]((uint64_t)self))
    {
      v5 = 0;
      goto LABEL_18;
    }
    id v4 = self->_suggestionsListViewController;
    goto LABEL_16;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->__navigationItemCurrentlyDisplayingSearchController);
  v7 = [WeakRetained _navigationBar];
  v8 = [v7 delegate];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v8 = 0;
LABEL_13:

    goto LABEL_14;
  }
  if (!v8 || [v8 _appearState] != 3) {
    goto LABEL_13;
  }
  v5 = v3;

LABEL_18:
LABEL_19:
  return (UIViewController *)v5;
}

- (BOOL)isActive
{
  if (self)
  {
    if (self->super._parentModalViewController) {
      LOBYTE(self) = ![(UISearchController *)self isBeingDismissed];
    }
    else {
      LOBYTE(self) = 0;
    }
  }
  return (char)self;
}

- (void)_setNavigationItemCurrentlyDisplayingSearchController:(id)a3
{
}

- (UISearchController)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
  v7.receiver = self;
  v7.super_class = (Class)UISearchController;
  id v4 = [(UIViewController *)&v7 initWithNibName:0 bundle:0];
  v5 = v4;
  if (v4) {
    [(UISearchController *)v4 _commonInit];
  }
  return v5;
}

- (UISearchController)initWithSearchResultsController:(UIViewController *)searchResultsController
{
  v5 = searchResultsController;
  if (dyld_program_sdk_at_least())
  {
    v10.receiver = self;
    v10.super_class = (Class)UISearchController;
    unsigned int v6 = [(UIViewController *)&v10 initWithNibName:0 bundle:0];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)UISearchController;
    unsigned int v6 = [(UIViewController *)&v9 init];
  }
  objc_super v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_searchResultsController, searchResultsController);
    [(UISearchController *)v7 _commonInit];
  }

  return v7;
}

- (void)_commonInit
{
  v26[1] = *MEMORY[0x1E4F143B8];
  [(UISearchController *)self setModalPresentationStyle:4];
  [(UIViewController *)self setModalTransitionStyle:2];
  [(UIViewController *)self setTransitioningDelegate:self];
  UINavigationItemSearchBarPlacement v3 = [(UIViewController *)self traitCollection];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if (v4 == 6) {
    self->_obscuresBackgroundDuringPresentation = 1;
  }
  else {
    self->_obscuresBackgroundDuringPresentation = _UIBarsApplyChromelessEverywhere() ^ 1;
  }
  *(_DWORD *)&self->_controllerFlags |= 0x400u;
  self->__previousSearchBarPosition = -1;
  self->__showResultsForEmptySearch = 0;
  *(_DWORD *)&self->_controllerFlags |= 0x80u;
  v5 = [(UIViewController *)self traitCollection];
  uint64_t v6 = [v5 userInterfaceIdiom];

  $D69225ED9BA803AE184F8CEF6B0C1DE3 controllerFlags = self->_controllerFlags;
  if (v6 != 6)
  {
    $D69225ED9BA803AE184F8CEF6B0C1DE3 controllerFlags = ($D69225ED9BA803AE184F8CEF6B0C1DE3)(*(_DWORD *)&controllerFlags | 0x10);
    self->_$D69225ED9BA803AE184F8CEF6B0C1DE3 controllerFlags = controllerFlags;
  }
  self->_$D69225ED9BA803AE184F8CEF6B0C1DE3 controllerFlags = ($D69225ED9BA803AE184F8CEF6B0C1DE3)(*(_DWORD *)&controllerFlags | 0x1600000);
  v8 = [(UISearchController *)self searchBar];
  if (!v8)
  {
    objc_super v9 = [UISearchBar alloc];
    v8 = -[UISearchBar initWithFrame:](v9, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    objc_super v10 = _UINSLocalizedStringWithDefaultValue(@"Search", @"Search");
    [(UISearchBar *)v8 setPlaceholder:v10];
  }
  [(UISearchController *)self _connectSearchBar:v8];
  objc_initWeak(&location, self);
  v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v20 = MEMORY[0x1E4F143A8];
  uint64_t v21 = 3221225472;
  v22 = __33__UISearchController__commonInit__block_invoke;
  v23 = &unk_1E52DA728;
  objc_copyWeak(&v24, &location);
  v12 = [v11 addObserverForName:@"UIWindowWillAnimateRotationNotification" object:0 queue:0 usingBlock:&v20];
  id windowWillAnimateToken = self->_windowWillAnimateToken;
  self->_id windowWillAnimateToken = v12;

  v26[0] = 0x1ED3F5A30;
  v14 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v26, 1, v20, v21, v22, v23);
  id v15 = [(UIViewController *)self _registerForTraitTokenChanges:v14 withTarget:self action:sel__setupForCurrentTraitCollection];

  v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v16 addObserver:self selector:sel_applicationWillEnterForeground_ name:@"UIApplicationWillEnterForegroundNotification" object:0];

  v17 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v17 addObserver:self selector:sel_applicationDidBecomeActive_ name:@"UIApplicationDidBecomeActiveNotification" object:0];

  v18 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v18 addObserver:self selector:sel_applicationWillResignActive_ name:@"UIApplicationWillResignActiveNotification" object:0];

  v19 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v19 addObserver:self selector:sel_applicationDidEnterBackground_ name:@"UIApplicationDidEnterBackgroundNotification" object:0];

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);
}

- (void)setModalPresentationStyle:(int64_t)a3
{
  if (self->_searchResultsController)
  {
    if (!a3) {
      return;
    }
  }
  else
  {
    if (!a3) {
      return;
    }
    if (a3 == 7 || a3 == 2) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Presenting UISearchController in a popover or form sheet while reusing the search origin as the search results destination makes little sense. Initialize UISearchController with a proper search results controller to present as a popover or in a form sheet."];
    }
  }
  if ((unint64_t)a3 > 7 || ((1 << a3) & 0x94) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"UISearchController currently only supports UIModalPresentationCustom, UIModalPresentationPopover and UIModalPresentationFormSheet presentation styles" format];
  }
  BOOL v6 = a3 == 7 || a3 == 2;
  self->__showResultsForEmptySearch = v6;
  v7.receiver = self;
  v7.super_class = (Class)UISearchController;
  [(UIViewController *)&v7 setModalPresentationStyle:a3];
}

- (void)_connectSearchBar:(id)a3
{
  v5 = (UISearchBar *)a3;
  p_searchBar = &self->_searchBar;
  searchBar = self->_searchBar;
  if (searchBar != v5)
  {
    v11 = v5;
    [(UISearchBar *)searchBar _setSearchController:0];
    objc_storeStrong((id *)&self->_searchBar, a3);
    [(UISearchBar *)*p_searchBar _setSearchController:self];
    [(UISearchBar *)*p_searchBar _setAutoDisableCancelButton:0];
    [(UIView *)*p_searchBar frame];
    if (CGRectEqualToRect(v13, *MEMORY[0x1E4F1DB28])) {
      [(UIView *)*p_searchBar sizeToFit];
    }
    v8 = [(UISearchBar *)*p_searchBar searchTextField];
    objc_super v9 = [v8 _suggestionController];
    suggestionController = self->_suggestionController;
    self->_suggestionController = v9;

    v5 = v11;
  }
}

- (void)setObscuresBackgroundDuringPresentation:(BOOL)obscuresBackgroundDuringPresentation
{
  self->_obscuresBackgroundDuringPresentation = obscuresBackgroundDuringPresentation;
}

- (void)setSearchResultsUpdater:(id)searchResultsUpdater
{
}

- (void)_searchBarSuperviewChanged
{
  UINavigationItemSearchBarPlacement v3 = [(UISearchController *)self searchBar];
  uint64_t v4 = [v3 superview];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    BOOL v6 = [(UISearchController *)self searchBar];
    objc_super v7 = [v6 superview];

    v8 = [v7 tableHeaderView];
    objc_super v9 = [(UISearchController *)self searchBar];

    if (v8 == v9)
    {
      *(_DWORD *)&self->_controllerFlags |= 1u;
      objc_super v10 = [(UISearchController *)self searchBar];
      [v10 _setShowsSeparator:0];

      v11 = [(UISearchController *)self searchBar];
      [v11 _updateInsetsForTableView:v7];

      if (([v7 _usingCustomBackgroundView] & 1) == 0)
      {
        v12 = +[UIColor colorWithRed:0.937254902 green:0.937254902 blue:0.956862745 alpha:1.0];
        [v7 setTableHeaderBackgroundColor:v12];
      }
      [(UISearchController *)self _updateTableHeaderBackgroundViewInTableView:v7 amountScrolledUnder:0.0];
      [(UISearchController *)self _watchScrollView:v7 forScrolling:1];
    }
  }
  else if (*(unsigned char *)&self->_controllerFlags)
  {
    if (![(UIViewController *)self isBeingPresented])
    {
      CGRect v13 = [(UISearchController *)self searchBar];
      [v13 _setShowsSeparator:0];

      v14 = [(UISearchController *)self searchBar];
      [v14 _updateInsetsForTableView:0];
    }
    [(UISearchController *)self _watchScrollView:0 forScrolling:0];
  }
  id v15 = [(UIViewController *)self traitCollection];
  uint64_t v16 = [v15 userInterfaceIdiom];

  if (v16 == 3)
  {
    v17 = [(UISearchController *)self searchBar];
    id v21 = [v17 searchField];

    uint64_t v18 = [v21 window];
    if (v18)
    {
      v19 = (void *)v18;
      id v20 = [(UISystemInputViewController *)self->_systemInputViewController persistentDelegate];

      if (v21 == v20) {
        [(UISystemInputViewController *)self->_systemInputViewController reloadInputViewsForPersistentDelegate];
      }
    }
  }
}

- (void)dealloc
{
  v16[5] = *MEMORY[0x1E4F143B8];
  UINavigationItemSearchBarPlacement v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self->_windowWillAnimateToken];

  uint64_t v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v16[0] = @"UIApplicationWillEnterForegroundNotification";
  v16[1] = @"UIApplicationDidBecomeActiveNotification";
  v16[2] = @"UIApplicationWillResignActiveNotification";
  v16[3] = @"UIApplicationDidEnterBackgroundNotification";
  v16[4] = 0x1ED10DD40;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:5];
  -[NSNotificationCenter _uiRemoveObserver:names:](v4, self, v5);

  [(UISearchController *)self _uninstallBackGestureRecognizer];
  [(UISearchController *)self _uninstallDoneGestureRecognizer];
  [(UISystemInputViewController *)self->_systemInputViewController prepareForRelease];
  [(UISystemInputViewController *)self->_systemInputViewController resetContainingResponder];
  systemInputViewController = self->_systemInputViewController;
  self->_systemInputViewController = 0;

  [(UISearchBar *)self->_searchBar _setSearchController:0];
  [(UISearchBar *)self->_searchBar setDelegate:0];
  leftDividerView = self->__leftDividerView;
  self->__leftDividerView = 0;

  rightDividerView = self->__rightDividerView;
  self->__rightDividerView = 0;

  scopeBarFocusContainerGuide = self->__scopeBarFocusContainerGuide;
  self->__scopeBarFocusContainerGuide = 0;

  suggestionController = self->_suggestionController;
  self->_suggestionController = 0;

  suggestionContainerView = self->__suggestionContainerView;
  self->__suggestionContainerView = 0;

  tvKeyboardContainerView = self->__tvKeyboardContainerView;
  self->__tvKeyboardContainerView = 0;

  didScrollDelegate = self->_didScrollDelegate;
  if (didScrollDelegate)
  {
    v14 = [(_UISearchControllerDidScrollDelegate *)didScrollDelegate scrollView];
    [v14 _removeScrollViewScrollObserver:self->_didScrollDelegate];
  }
  [(UISearchController *)self _removeCarPlayLimitedUIObserver];
  v15.receiver = self;
  v15.super_class = (Class)UISearchController;
  [(UIViewController *)&v15 dealloc];
}

- (void)_uninstallDoneGestureRecognizer
{
  UINavigationItemSearchBarPlacement v3 = [(UIViewController *)self viewIfLoaded];
  [v3 removeGestureRecognizer:self->_doneButtonGestureRecognizer];

  doneButtonGestureRecognizer = self->_doneButtonGestureRecognizer;
  self->_doneButtonGestureRecognizer = 0;
}

- (void)_uninstallBackGestureRecognizer
{
  UINavigationItemSearchBarPlacement v3 = [(UIViewController *)self viewIfLoaded];
  [v3 removeGestureRecognizer:self->_backButtonDismissGestureRecognizer];

  backButtonDismissGestureRecognizer = self->_backButtonDismissGestureRecognizer;
  self->_backButtonDismissGestureRecognizer = 0;
}

- (void)_removeCarPlayLimitedUIObserver
{
  id v4 = [(UISearchController *)self _carPlayLimitedUIToken];
  if (v4)
  {
    UINavigationItemSearchBarPlacement v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 removeObserver:v4];

    [(UISearchController *)self _setCarPlayLimitedUIToken:0];
  }
}

- (id)_carPlayLimitedUIToken
{
  return objc_getAssociatedObject(self, &kCarPlayLimitedUIWillAnimateTokenKey);
}

- (UISearchControllerScopeBarActivation)scopeBarActivation
{
  return ((unint64_t)self->_controllerFlags >> 5) & 3;
}

- (void)applicationDidBecomeActive:(id)a3
{
  *(_DWORD *)&self->_controllerFlags |= 0x200000u;
}

- (void)_updateVisibilityOfSearchResultsForSearchBar:(id)a3
{
  id v20 = a3;
  id v4 = [(UIViewController *)self traitCollection];
  if ([v4 userInterfaceIdiom] == 2) {
    goto LABEL_4;
  }
  v5 = [(UIViewController *)self traitCollection];
  if ([v5 userInterfaceIdiom] == 8)
  {

LABEL_4:
LABEL_5:
    BOOL v6 = [(UIViewController *)self->_searchResultsController view];
    [v6 setHidden:0];

    goto LABEL_6;
  }
  objc_super v7 = [(UIViewController *)self traitCollection];
  uint64_t v8 = [v7 userInterfaceIdiom];

  if (v8 == 3) {
    goto LABEL_5;
  }
  if ([(UIViewController *)self modalPresentationStyle] == UIModalPresentationCustom)
  {
    int isSearchResultsControllerView = -[UISearchController _isSearchResultsControllerViewUnhidden]((uint64_t)self);
    int isSuggestionsListViewControllerView = -[UISearchController _isSuggestionsListViewControllerViewUnhidden]((uint64_t)self);
    uint64_t v11 = [(UISearchController *)self _showsSearchResultsController] ^ 1;
    v12 = [(UIViewController *)self->_searchResultsController view];
    [v12 setHidden:v11];

    [(UISearchController *)self _updateSearchSuggestionsListVisibilityShouldRequestNavigationControllerObservingUpdate:0];
    int v13 = isSuggestionsListViewControllerView ^ -[UISearchController _isSuggestionsListViewControllerViewUnhidden]((uint64_t)self);
    int v14 = -[UISearchController _isSearchResultsControllerViewUnhidden]((uint64_t)self);
    -[UISearchController _requestNavigationControllerObservingUpdateForSearchBar:visibilityChangedForSearchSuggestionsList:forSearchResultsController:](self, v20, v13, isSearchResultsControllerView ^ v14);
  }
  else
  {
    uint64_t v15 = [(UISearchController *)self _showsSearchResultsController] ^ 1;
    uint64_t v16 = [(UIViewController *)self->_searchResultsController view];
    [v16 setHidden:v15];

    [(UISearchController *)self _updateSearchSuggestionsListVisibilityShouldRequestNavigationControllerObservingUpdate:0];
    v17 = [(UISearchController *)self _searchPresentationController];
    uint64_t v18 = [v17 presentedView];

    if (v18)
    {
      if ([(UISearchController *)self _showsSearchResultsController]) {
        uint64_t v19 = 1;
      }
      else {
        uint64_t v19 = -[UISearchController _isSuggestionsListViewControllerViewUnhidden]((uint64_t)self);
      }
      [v17 setContentVisible:v19];
    }
  }
LABEL_6:
}

- (void)_updateSearchSuggestionsListVisibilityShouldRequestNavigationControllerObservingUpdate:(BOOL)a3
{
  BOOL v3 = a3;
  int isSuggestionsListViewControllerView = -[UISearchController _isSuggestionsListViewControllerViewUnhidden]((uint64_t)self);
  $D69225ED9BA803AE184F8CEF6B0C1DE3 controllerFlags = self->_controllerFlags;
  if ((*(_WORD *)&controllerFlags & 0xC000) != 0
    || (*(_WORD *)&controllerFlags & 0x1000) != 0
    || (id WeakRetained = objc_loadWeakRetained((id *)&self->__navigationItemCurrentlyDisplayingSearchController)) == 0
    || (uint64_t v8 = WeakRetained,
        id v9 = objc_loadWeakRetained((id *)&self->__navigationItemCurrentlyDisplayingSearchController),
        char v10 = [v9 _hasInlineSearchBar],
        v9,
        v8,
        (v10 & 1) != 0))
  {
    -[UISearchController _hideSearchSuggestionsList]((uint64_t)self);
    if (!v3) {
      return;
    }
    goto LABEL_6;
  }
  int v13 = [(UISearchController *)self _suggestionController];
  int v14 = [v13 suggestions];
  uint64_t v15 = [v14 count];

  if (!v15
    || (-[UISearchController _isSearchResultsControllerViewUnhidden]((uint64_t)self) & 1) != 0
    || (*((unsigned char *)&self->_controllerFlags + 2) & 0xA) != 0)
  {
    -[UISearchController _hideSearchSuggestionsList]((uint64_t)self);
  }
  else
  {
    -[UISearchController _showSearchSuggestionsListIfApplicable]((uint64_t)self);
    [(_UISearchSuggestionsListViewController *)self->_suggestionsListViewController updateList];
  }
  *(_DWORD *)&self->_controllerFlags &= ~0x20000u;
  if (v3)
  {
LABEL_6:
    searchBar = self->_searchBar;
    int v12 = isSuggestionsListViewControllerView ^ -[UISearchController _isSuggestionsListViewControllerViewUnhidden]((uint64_t)self);
    -[UISearchController _requestNavigationControllerObservingUpdateForSearchBar:visibilityChangedForSearchSuggestionsList:forSearchResultsController:](self, searchBar, v12, 0);
  }
}

- (uint64_t)_isSuggestionsListViewControllerViewUnhidden
{
  uint64_t v1 = a1;
  if (a1)
  {
    v2 = [*(id *)(a1 + 1136) _existingView];
    if (v2)
    {
      BOOL v3 = [*(id *)(v1 + 1136) _existingView];
      uint64_t v1 = [v3 isHidden] ^ 1;
    }
    else
    {
      uint64_t v1 = 0;
    }
  }
  return v1;
}

- (void)_hideSearchSuggestionsList
{
  id v1 = [*(id *)(a1 + 1136) _existingView];
  [v1 setHidden:1];
}

- (void)_requestNavigationControllerObservingUpdateForSearchBar:(int)a3 visibilityChangedForSearchSuggestionsList:(int)a4 forSearchResultsController:
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  if (a1 && a3 | a4)
  {
    uint64_t v8 = [a1 presentingViewController];
    if (v8
      && _UIBarsApplyChromelessEverywhere()
      && [v7 _isHostedByNavigationBar])
    {
      uint64_t isSearchResultsControllerView = -[UISearchController _isSearchResultsControllerViewUnhidden]((uint64_t)a1);
      uint64_t isSuggestionsListViewControllerView = -[UISearchController _isSuggestionsListViewControllerViewUnhidden]((uint64_t)a1);
      uint64_t v11 = isSearchResultsControllerView ^ a4;
      uint64_t v12 = isSuggestionsListViewControllerView ^ a3;
      int v13 = [v8 navigationController];
      int v14 = [v13 _outermostNavigationController];

      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v35 = __147__UISearchController__requestNavigationControllerObservingUpdateForSearchBar_visibilityChangedForSearchSuggestionsList_forSearchResultsController___block_invoke;
      v36 = &unk_1E5303E70;
      id v15 = v14;
      id v37 = v15;
      id v38 = v8;
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v30 = (id (*)(uint64_t, int, int, id *, id *))__147__UISearchController__requestNavigationControllerObservingUpdateForSearchBar_visibilityChangedForSearchSuggestionsList_forSearchResultsController___block_invoke_2;
      v31 = &unk_1E5303E98;
      v32 = a1;
      id v33 = v38;
      if (isSearchResultsControllerView && isSuggestionsListViewControllerView)
      {
        if (os_variant_has_internal_diagnostics())
        {
          logb = __UIFaultDebugAssertLog();
          if (os_log_type_enabled(logb, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412290;
            v40 = a1;
            _os_log_fault_impl(&dword_1853B0000, logb, OS_LOG_TYPE_FAULT, "UISearchController should not be showing the search results controller and the search suggestions list at the same time. Internal UIKit logic error. searchController = %@", buf, 0xCu);
          }
        }
        else
        {
          log = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_MergedGlobals_21_3) + 8);
          if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v40 = a1;
            _os_log_impl(&dword_1853B0000, log, OS_LOG_TYPE_ERROR, "UISearchController should not be showing the search results controller and the search suggestions list at the same time. Internal UIKit logic error. searchController = %@", buf, 0xCu);
          }
        }
      }
      id v27 = 0;
      id v28 = 0;
      v30((uint64_t)v29, isSearchResultsControllerView, isSuggestionsListViewControllerView, &v28, &v27);
      id v16 = v28;
      id v17 = v27;
      if ((v11 & v12) == 1)
      {
        if (os_variant_has_internal_diagnostics())
        {
          logc = __UIFaultDebugAssertLog();
          if (os_log_type_enabled(logc, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412290;
            v40 = a1;
            _os_log_fault_impl(&dword_1853B0000, logc, OS_LOG_TYPE_FAULT, "UISearchController should not have been showing the search results controller and the search suggestions list at the same time. Internal UIKit logic error. searchController = %@", buf, 0xCu);
          }
        }
        else
        {
          loga = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB25E818) + 8);
          if (os_log_type_enabled(loga, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v40 = a1;
            _os_log_impl(&dword_1853B0000, loga, OS_LOG_TYPE_ERROR, "UISearchController should not have been showing the search results controller and the search suggestions list at the same time. Internal UIKit logic error. searchController = %@", buf, 0xCu);
          }
        }
      }
      id v25 = 0;
      id v26 = 0;
      v30((uint64_t)v29, v11, v12, &v26, &v25);
      id v18 = v26;
      id v19 = v25;
      id v20 = v19;
      if (v16 != v18 || v17 != v19)
      {
        if (v16 != v18) {
          [v15 _stopObservingContentScrollView:v18];
        }
        if (v17 != v20) {
          [v15 _stopObservingContentScrollView:v20];
        }
        v35((uint64_t)v34, v16, v17);
      }
    }
  }
}

- (uint64_t)_isSearchResultsControllerViewUnhidden
{
  uint64_t v1 = a1;
  if (a1)
  {
    v2 = [*(id *)(a1 + 1168) _existingView];
    if (v2)
    {
      BOOL v3 = [*(id *)(v1 + 1168) _existingView];
      uint64_t v1 = [v3 isHidden] ^ 1;
    }
    else
    {
      uint64_t v1 = 0;
    }
  }
  return v1;
}

- (BOOL)showsSearchResultsController
{
  $D69225ED9BA803AE184F8CEF6B0C1DE3 controllerFlags = self->_controllerFlags;
  if ((*(unsigned char *)&controllerFlags & 0x80) != 0)
  {
    v5 = [(UISearchBar *)self->_searchBar text];
    if ([v5 length])
    {
    }
    else
    {
      BOOL showResultsForEmptySearch = self->__showResultsForEmptySearch;

      if (!showResultsForEmptySearch)
      {
        LOBYTE(v3) = 0;
        return v3;
      }
    }
    id v7 = [(UISearchController *)self _dci_searchSuggestions];
    if ([v7 count]) {
      BOOL v3 = (*((unsigned __int8 *)&self->_controllerFlags + 1) >> 4) & 1;
    }
    else {
      LOBYTE(v3) = 1;
    }
  }
  else
  {
    return (*(unsigned int *)&controllerFlags >> 8) & 1;
  }
  return v3;
}

- (_UISearchSuggestionController)_suggestionController
{
  return self->_suggestionController;
}

- (void)setHidesNavigationBarDuringPresentation:(BOOL)hidesNavigationBarDuringPresentation
{
  if (hidesNavigationBarDuringPresentation) {
    int v3 = 1024;
  }
  else {
    int v3 = 0;
  }
  self->_$D69225ED9BA803AE184F8CEF6B0C1DE3 controllerFlags = ($D69225ED9BA803AE184F8CEF6B0C1DE3)(*(_DWORD *)&self->_controllerFlags & 0xFFFFFBFF | v3);
}

- (void)setAutomaticallyShowsCancelButton:(BOOL)automaticallyShowsCancelButton
{
  if (automaticallyShowsCancelButton) {
    int v3 = 16;
  }
  else {
    int v3 = 0;
  }
  self->_$D69225ED9BA803AE184F8CEF6B0C1DE3 controllerFlags = ($D69225ED9BA803AE184F8CEF6B0C1DE3)(*(_DWORD *)&self->_controllerFlags & 0xFFFFFFEF | v3);
}

- (void)setIgnoresSearchSuggestionsForSearchBarPlacementStacked:(BOOL)ignoresSearchSuggestionsForSearchBarPlacementStacked
{
  if (((((*(_DWORD *)&self->_controllerFlags & 0x4000) == 0) ^ ignoresSearchSuggestionsForSearchBarPlacementStacked) & 1) == 0)
  {
    if (ignoresSearchSuggestionsForSearchBarPlacementStacked) {
      int v3 = 0x4000;
    }
    else {
      int v3 = 0;
    }
    self->_$D69225ED9BA803AE184F8CEF6B0C1DE3 controllerFlags = ($D69225ED9BA803AE184F8CEF6B0C1DE3)(*(_DWORD *)&self->_controllerFlags & 0xFFFFBFFF | v3);
    [(UISearchController *)self _updateSearchSuggestionsListVisibilityShouldRequestNavigationControllerObservingUpdate:1];
  }
}

- (void)setDelegate:(id)delegate
{
  id obj = delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    if (objc_opt_respondsToSelector()) {
      int v5 = 8;
    }
    else {
      int v5 = 0;
    }
    self->_$D69225ED9BA803AE184F8CEF6B0C1DE3 controllerFlags = ($D69225ED9BA803AE184F8CEF6B0C1DE3)(*(_DWORD *)&self->_controllerFlags & 0xFFFFFFF7 | v5);
    objc_storeWeak((id *)&self->_delegate, obj);
  }
}

- (void)_dci_setAutomaticScopeBarShowsOnPresentation:(BOOL)a3
{
  if (a3) {
    uint64_t v3 = 3;
  }
  else {
    uint64_t v3 = 2;
  }
  [(UISearchController *)self setScopeBarActivation:v3];
}

- (void)applicationWillEnterForeground:(id)a3
{
  id v4 = [(UIViewController *)self traitCollection];
  uint64_t v5 = [v4 userInterfaceIdiom];

  if (v5 == 3)
  {
    BOOL v6 = [(UISearchController *)self searchBar];
    [v6 becomeFirstResponder];

    id v7 = +[UIKeyboard activeKeyboard];
    [v7 didMoveToWindow];
  }
  *(_DWORD *)&self->_controllerFlags |= 0x200000u;
}

- (void)setAutomaticallyShowsSearchResultsController:(BOOL)automaticallyShowsSearchResultsController
{
  if (automaticallyShowsSearchResultsController)
  {
    $D69225ED9BA803AE184F8CEF6B0C1DE3 controllerFlags = self->_controllerFlags;
    int v5 = 128;
  }
  else
  {
    BOOL v6 = [(UISearchController *)self showsSearchResultsController];
    int v5 = 0;
    if (v6) {
      int v7 = 256;
    }
    else {
      int v7 = 0;
    }
    $D69225ED9BA803AE184F8CEF6B0C1DE3 controllerFlags = ($D69225ED9BA803AE184F8CEF6B0C1DE3)(*(_DWORD *)&self->_controllerFlags & 0xFFFFFEFF | v7);
    self->_$D69225ED9BA803AE184F8CEF6B0C1DE3 controllerFlags = controllerFlags;
  }
  self->_$D69225ED9BA803AE184F8CEF6B0C1DE3 controllerFlags = ($D69225ED9BA803AE184F8CEF6B0C1DE3)(*(_DWORD *)&controllerFlags & 0xFFFFFF7F | v5);
  searchBar = self->_searchBar;
  [(UISearchController *)self _updateVisibilityOfSearchResultsForSearchBar:searchBar];
}

- (void)setShowsSearchResultsController:(BOOL)showsSearchResultsController
{
  if (showsSearchResultsController) {
    int v3 = 256;
  }
  else {
    int v3 = 0;
  }
  self->_$D69225ED9BA803AE184F8CEF6B0C1DE3 controllerFlags = ($D69225ED9BA803AE184F8CEF6B0C1DE3)(*(_DWORD *)&self->_controllerFlags & 0xFFFFFE7F | v3);
  [(UISearchController *)self _updateVisibilityOfSearchResultsForSearchBar:self->_searchBar];
}

- (void)setScopeBarActivation:(UISearchControllerScopeBarActivation)scopeBarActivation
{
  self->_$D69225ED9BA803AE184F8CEF6B0C1DE3 controllerFlags = ($D69225ED9BA803AE184F8CEF6B0C1DE3)(*(_DWORD *)&self->_controllerFlags & 0xFFFFFF9F | (32 * (scopeBarActivation & 3)));
  if ((scopeBarActivation & 3) != 0)
  {
    uint64_t v4 = scopeBarActivation & 3;
  }
  else
  {
    int v5 = dyld_program_sdk_at_least();
    uint64_t v4 = 2;
    if (!v5) {
      uint64_t v4 = 3;
    }
  }
  searchBar = self->_searchBar;
  [(UISearchBar *)searchBar _setActiveSearchDeferringScopeBar:v4 == 2];
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_searchResultsUpdaterPrivate);
  objc_storeStrong((id *)&self->_searchHints, 0);
  objc_storeStrong((id *)&self->__suggestionContainerView, 0);
  objc_storeStrong((id *)&self->_searchResultsToHiddenKeyboardFocusGuide, 0);
  objc_storeStrong((id *)&self->_keyboardToSearchResultsFocusGuide, 0);
  objc_storeStrong((id *)&self->__scopeBarConstraints, 0);
  objc_storeStrong((id *)&self->__scopeBarFocusContainerGuide, 0);
  objc_storeStrong((id *)&self->__rightDividerView, 0);
  objc_storeStrong((id *)&self->__leftDividerView, 0);
  objc_storeStrong((id *)&self->__suggestionView, 0);
  objc_storeStrong((id *)&self->__tvKeyboardContainerView, 0);
  objc_destroyWeak((id *)&self->__navigationItemCurrentlyDisplayingSearchController);
  objc_storeStrong((id *)&self->__systemInputMarginView, 0);
  objc_storeStrong((id *)&self->_searchControllerObservedScrollView, 0);
  objc_storeStrong((id *)&self->_searchResultsController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_searchResultsUpdater);
  objc_storeStrong((id *)&self->_managedPalette, 0);
  objc_storeStrong((id *)&self->_suggestionsListViewController, 0);
  objc_storeStrong((id *)&self->_suggestionController, 0);
  objc_storeStrong((id *)&self->_resultsControllerViewContainer, 0);
  objc_destroyWeak((id *)&self->_tvObservingScrollView);
  objc_storeStrong(&self->_deferredActivationOrDismissal, 0);
  objc_storeStrong((id *)&self->_doneButtonGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_backButtonDismissGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_systemInputViewController, 0);
  objc_storeStrong((id *)&self->_didScrollDelegate, 0);
  objc_storeStrong(&self->_windowWillAnimateToken, 0);
  objc_storeStrong((id *)&self->_animator, 0);
  objc_storeStrong((id *)&self->_searchBar, 0);
}

- (id)_tvSuggestionController
{
  return 0;
}

- (UISearchSuggestion)selectedSuggestion
{
  if (os_variant_has_internal_diagnostics())
  {
    uint64_t v4 = __UIFaultDebugAssertLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1853B0000, v4, OS_LOG_TYPE_FAULT, "UIKit issue: selectedSuggestion property not supported on this platform", buf, 2u);
    }
  }
  else
  {
    v2 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &selectedSuggestion___s_category) + 8);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)int v5 = 0;
      _os_log_impl(&dword_1853B0000, v2, OS_LOG_TYPE_ERROR, "UIKit issue: selectedSuggestion property not supported on this platform", v5, 2u);
    }
  }
  return 0;
}

- (void)setSelectedSuggestion:(id)a3
{
  if (os_variant_has_internal_diagnostics())
  {
    uint64_t v4 = __UIFaultDebugAssertLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1853B0000, v4, OS_LOG_TYPE_FAULT, "UIKit issue: selectedSuggestion property not supported on this platform", buf, 2u);
    }
  }
  else
  {
    int v3 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &setSelectedSuggestion____s_category) + 8);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)int v5 = 0;
      _os_log_impl(&dword_1853B0000, v3, OS_LOG_TYPE_ERROR, "UIKit issue: selectedSuggestion property not supported on this platform", v5, 2u);
    }
  }
}

- (BOOL)_delegateWantsInsertSearchFieldTextSuggestion
{
  return (*(unsigned char *)&self->_controllerFlags >> 3) & 1;
}

- (void)_sendDelegateInsertSearchFieldTextSuggestion:(id)a3
{
  if ((*(unsigned char *)&self->_controllerFlags & 8) != 0)
  {
    id v4 = a3;
    id v5 = [(UISearchController *)self delegate];
    [v5 _searchController:self insertSearchFieldTextSuggestion:v4];
  }
}

- (void)_setTransitioningOutWithoutDisappearing:(BOOL)a3
{
  if (a3) {
    int v3 = 4;
  }
  else {
    int v3 = 0;
  }
  self->_$D69225ED9BA803AE184F8CEF6B0C1DE3 controllerFlags = ($D69225ED9BA803AE184F8CEF6B0C1DE3)(*(_DWORD *)&self->_controllerFlags & 0xFFFFFFFB | v3);
}

- (BOOL)_transitioningOutWithoutDisappearing
{
  return (*(unsigned char *)&self->_controllerFlags >> 2) & 1;
}

void __33__UISearchController__commonInit__block_invoke(uint64_t a1, void *a2)
{
  id v14 = a2;
  int v3 = [v14 object];
  id v4 = [v3 window];
  id v5 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v5);
  int v7 = [WeakRetained searchBar];
  uint64_t v8 = [v7 window];
  if (v4 != v8)
  {

LABEL_3:
    goto LABEL_6;
  }
  id v9 = objc_loadWeakRetained(v5);
  if (!v9)
  {

    goto LABEL_10;
  }
  uint64_t v10 = v9[15];

  if (!v10)
  {
LABEL_10:
    uint64_t v11 = [v14 userInfo];
    uint64_t v12 = [v11 objectForKey:@"UIWindowNewOrientationUserInfoKey"];
    uint64_t v13 = [v12 integerValue];

    id v4 = objc_loadWeakRetained(v5);
    [v4 _adjustSearchBarSizeForOrientation:v13];
    goto LABEL_3;
  }
LABEL_6:
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)UISearchController;
  [(UIViewController *)&v7 encodeWithCoder:v4];
  searchResultsController = self->_searchResultsController;
  if (searchResultsController) {
    [v4 encodeObject:searchResultsController forKey:@"UISearchControllerResultsController"];
  }
  [v4 encodeBool:self->_obscuresBackgroundDuringPresentation forKey:@"UISearchControllerDimsBackgroundDuringPresentation"];
  [v4 encodeBool:self->_obscuresBackgroundDuringPresentation forKey:@"UISearchControllerObscuresBackgroundDuringPresentation"];
  [v4 encodeBool:(*(_DWORD *)&self->_controllerFlags >> 10) & 1 forKey:@"UISearchControllerHidesNavigationBarDuringPresentation"];
  [v4 encodeBool:(*(_DWORD *)&self->_controllerFlags >> 7) & 1 forKey:@"UISearchControllerAutomaticallyShowsSearchResultsController"];
  $D69225ED9BA803AE184F8CEF6B0C1DE3 controllerFlags = self->_controllerFlags;
  if ((*(unsigned char *)&controllerFlags & 0x80) == 0)
  {
    [v4 encodeBool:(*(unsigned int *)&controllerFlags >> 8) & 1 forKey:@"UISearchControllerShowsSearchResultsController"];
    $D69225ED9BA803AE184F8CEF6B0C1DE3 controllerFlags = self->_controllerFlags;
  }
  [v4 encodeBool:(*(unsigned int *)&controllerFlags >> 4) & 1 forKey:@"UISearchControllerAutomaticallyShowsCancelButton"];
  [v4 encodeInteger:((unint64_t)self->_controllerFlags >> 5) & 3 forKey:@"UISearchControllerScopeBarActivation"];
  [v4 encodeBool:(*(_DWORD *)&self->_controllerFlags >> 14) & 1 forKey:@"UISearchControllerIgnoresSearchSuggestionsForStackedSearch"];
  objc_msgSend(v4, "encodeInteger:forKey:", -[UIViewController modalPresentationStyle](self, "modalPresentationStyle"), @"UISearchControllerModalPresentationStyle");
  [v4 encodeObject:self->_searchBar forKey:@"UISearchControllerSearchBar"];
}

- (UISearchController)initWithCoder:(NSCoder *)coder
{
  id v4 = coder;
  v19.receiver = self;
  v19.super_class = (Class)UISearchController;
  id v5 = [(UIViewController *)&v19 initWithCoder:v4];
  if (!v5) {
    goto LABEL_38;
  }
  uint64_t v6 = [(NSCoder *)v4 decodeObjectForKey:@"UISearchControllerSearchBar"];
  searchBar = v5->_searchBar;
  v5->_searchBar = (UISearchBar *)v6;

  [(UISearchController *)v5 _commonInit];
  [(UISearchController *)v5 setModalPresentationStyle:[(NSCoder *)v4 decodeIntegerForKey:@"UISearchControllerModalPresentationStyle"]];
  if ([(NSCoder *)v4 containsValueForKey:@"UISearchControllerObscuresBackgroundDuringPresentation"])
  {
    uint64_t v8 = @"UISearchControllerObscuresBackgroundDuringPresentation";
  }
  else
  {
    uint64_t v8 = @"UISearchControllerDimsBackgroundDuringPresentation";
  }
  v5->_obscuresBackgroundDuringPresentation = [(NSCoder *)v4 decodeBoolForKey:v8];
  if ([(NSCoder *)v4 decodeBoolForKey:@"UISearchControllerHidesNavigationBarDuringPresentation"])
  {
    int v9 = 1024;
  }
  else
  {
    int v9 = 0;
  }
  v5->_$D69225ED9BA803AE184F8CEF6B0C1DE3 controllerFlags = ($D69225ED9BA803AE184F8CEF6B0C1DE3)(*(_DWORD *)&v5->_controllerFlags & 0xFFFFFBFF | v9);
  if ([(NSCoder *)v4 containsValueForKey:@"UISearchControllerResultsController"])
  {
    uint64_t v10 = [(NSCoder *)v4 decodeObjectForKey:@"UISearchControllerResultsController"];
    searchResultsController = v5->_searchResultsController;
    v5->_searchResultsController = (UIViewController *)v10;
  }
  if ([(NSCoder *)v4 containsValueForKey:@"UISearchControllerAutomaticallyShowsSearchResultsController"])
  {
    if ([(NSCoder *)v4 decodeBoolForKey:@"UISearchControllerAutomaticallyShowsSearchResultsController"])
    {
      int v12 = 128;
    }
    else
    {
      int v12 = 0;
    }
    v5->_$D69225ED9BA803AE184F8CEF6B0C1DE3 controllerFlags = ($D69225ED9BA803AE184F8CEF6B0C1DE3)(*(_DWORD *)&v5->_controllerFlags & 0xFFFFFF7F | v12);
    if (v12) {
      goto LABEL_22;
    }
  }
  else if ((*(_DWORD *)&v5->_controllerFlags & 0x80) != 0)
  {
    goto LABEL_22;
  }
  if ([(NSCoder *)v4 containsValueForKey:@"UISearchControllerShowsSearchResultsController"])
  {
    if ([(NSCoder *)v4 decodeBoolForKey:@"UISearchControllerShowsSearchResultsController"]) {
      int v13 = 256;
    }
    else {
      int v13 = 0;
    }
    v5->_$D69225ED9BA803AE184F8CEF6B0C1DE3 controllerFlags = ($D69225ED9BA803AE184F8CEF6B0C1DE3)(*(_DWORD *)&v5->_controllerFlags & 0xFFFFFEFF | v13);
  }
LABEL_22:
  if ([(NSCoder *)v4 containsValueForKey:@"UISearchControllerAutomaticallyShowsCancelButton"])
  {
    if ([(NSCoder *)v4 decodeBoolForKey:@"UISearchControllerAutomaticallyShowsCancelButton"])
    {
      int v14 = 16;
    }
    else
    {
      int v14 = 0;
    }
    v5->_$D69225ED9BA803AE184F8CEF6B0C1DE3 controllerFlags = ($D69225ED9BA803AE184F8CEF6B0C1DE3)(*(_DWORD *)&v5->_controllerFlags & 0xFFFFFFEF | v14);
  }
  if ([(NSCoder *)v4 containsValueForKey:@"UISearchControllerScopeBarActivation"])
  {
    unsigned int v15 = 32
        * ([(NSCoder *)v4 decodeIntegerForKey:@"UISearchControllerScopeBarActivation"] & 3);
    unsigned int v16 = *(_DWORD *)&v5->_controllerFlags & 0xFFFFFF9F;
LABEL_32:
    v5->_$D69225ED9BA803AE184F8CEF6B0C1DE3 controllerFlags = ($D69225ED9BA803AE184F8CEF6B0C1DE3)(v15 | v16);
    goto LABEL_33;
  }
  if ([(NSCoder *)v4 containsValueForKey:@"UISearchControllerAutomaticallyShowsScopeBar"]&& ![(NSCoder *)v4 decodeBoolForKey:@"UISearchControllerAutomaticallyShowsScopeBar"])
  {
    unsigned int v15 = *(_DWORD *)&v5->_controllerFlags & 0xFFFFFF9F;
    unsigned int v16 = 32;
    goto LABEL_32;
  }
LABEL_33:
  if ([(NSCoder *)v4 containsValueForKey:@"UISearchControllerIgnoresSearchSuggestionsForStackedSearch"])
  {
    if ([(NSCoder *)v4 decodeBoolForKey:@"UISearchControllerIgnoresSearchSuggestionsForStackedSearch"])
    {
      int v17 = 0x4000;
    }
    else
    {
      int v17 = 0;
    }
    v5->_$D69225ED9BA803AE184F8CEF6B0C1DE3 controllerFlags = ($D69225ED9BA803AE184F8CEF6B0C1DE3)(*(_DWORD *)&v5->_controllerFlags & 0xFFFFBFFF | v17);
  }
LABEL_38:

  return v5;
}

- (void)loadView
{
  int v3 = [(UIViewController *)self presentingViewController];
  if (v3)
  {
    id v4 = [(UIViewController *)self presentingViewController];
    id v5 = [v4 view];
    [v5 bounds];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
  }
  else
  {
    [(UIViewController *)self _defaultInitialViewFrame];
    double v7 = v14;
    double v9 = v15;
    double v11 = v16;
    double v13 = v17;
  }

  id v18 = -[UIView initWithFrame:]([_UISearchControllerView alloc], "initWithFrame:", v7, v9, v11, v13);
  [(UIView *)v18 setAutoresizingMask:18];
  [(UIViewController *)self setView:v18];
}

- (void)viewDidLoad
{
  v9.receiver = self;
  v9.super_class = (Class)UISearchController;
  [(UIViewController *)&v9 viewDidLoad];
  if (self->_searchResultsController)
  {
    int v3 = [UIView alloc];
    id v4 = [(UIViewController *)self view];
    [v4 bounds];
    id v5 = -[UIView initWithFrame:](v3, "initWithFrame:");
    resultsControllerViewContainer = self->_resultsControllerViewContainer;
    self->_resultsControllerViewContainer = v5;

    [(UIView *)self->_resultsControllerViewContainer setAutoresizingMask:18];
    double v7 = [(UIViewController *)self->_searchResultsController view];
    [(UIView *)self->_resultsControllerViewContainer bounds];
    objc_msgSend(v7, "setFrame:");
    [(UIView *)self->_resultsControllerViewContainer addSubview:v7];
    [v7 setAutoresizingMask:18];
    [(UIViewController *)self addChildViewController:self->_searchResultsController];
    double v8 = [(UIViewController *)self view];
    [v8 addSubview:self->_resultsControllerViewContainer];

    [(UIViewController *)self->_searchResultsController didMoveToParentViewController:self];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)UISearchController;
  [(UIViewController *)&v6 viewDidAppear:a3];
  id v4 = [(UIViewController *)self traitCollection];
  uint64_t v5 = [v4 userInterfaceIdiom];

  if (v5 == 3) {
    [(UISearchController *)self _limitedUIDidChangeAnimated:0];
  }
  if ([(UISearchController *)self _shouldLogAppearance]) {
    AnalyticsSendEventLazy();
  }
  [(UISearchController *)self set_shouldLogAppearance:1];
}

id __36__UISearchController_viewDidAppear___block_invoke()
{
  v5[1] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = _UIPrivateMainBundleIdentifier();
  uint64_t v1 = (void *)v0;
  if (v0)
  {
    id v4 = @"bundle_id";
    v5[0] = v0;
    v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (void)viewDidDisappear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)UISearchController;
  [(UIViewController *)&v3 viewDidDisappear:a3];
  AnalyticsSendEventLazy();
}

id __39__UISearchController_viewDidDisappear___block_invoke()
{
  v5[1] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = _UIPrivateMainBundleIdentifier();
  uint64_t v1 = (void *)v0;
  if (v0)
  {
    id v4 = @"bundle_id";
    v5[0] = v0;
    v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (void)applicationWillResignActive:(id)a3
{
  *(_DWORD *)&self->_controllerFlags &= ~0x200000u;
}

- (void)applicationDidEnterBackground:(id)a3
{
  id v4 = [(UIViewController *)self traitCollection];
  uint64_t v5 = [v4 userInterfaceIdiom];

  if (v5 == 3)
  {
    objc_super v6 = [(UISearchController *)self searchBar];
    [v6 resignFirstResponder];
  }
  *(_DWORD *)&self->_controllerFlags &= ~0x200000u;
}

- (id)_createAnimationCoordinator
{
  objc_super v3 = objc_alloc_init(_UIAnimationCoordinator);
  id v4 = [(UIViewController *)self view];
  [(_UIAnimationCoordinator *)v3 setContainerView:v4];

  return v3;
}

- (void)_resizeResultsControllerWithDelta:(CGSize)a3
{
  double height = a3.height;
  [(UIView *)self->_resultsControllerViewContainer frame];
  double v6 = v5;
  double v8 = v7;
  double v10 = height + v9;
  double v12 = v11 - height;
  double v13 = [(UISearchController *)self _createAnimationCoordinator];
  [(UIView *)self->_resultsControllerViewContainer frame];
  objc_msgSend(v13, "setStartFrame:");
  objc_msgSend(v13, "setEndFrame:", v6, v10, v8, v12);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __56__UISearchController__resizeResultsControllerWithDelta___block_invoke;
  v14[3] = &unk_1E5303E48;
  v14[4] = self;
  *(double *)&v14[5] = v6;
  *(double *)&v14[6] = v10;
  *(double *)&v14[7] = v8;
  *(double *)&v14[8] = v12;
  [v13 setAnimator:v14];
  [v13 animate];
}

uint64_t __56__UISearchController__resizeResultsControllerWithDelta___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1120), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (BOOL)_resultsControllerWillLayoutVisibleUnderContainerView
{
  searchResultsController = self->_searchResultsController;
  if (searchResultsController) {
    int v4 = [(UIViewController *)searchResultsController edgesForExtendedLayout] & 1;
  }
  else {
    LOBYTE(v4) = 1;
  }
  double v5 = [(UIViewController *)self presentationController];
  char v6 = [v5 resultsUnderlapsSearchBar];

  return v6 & v4;
}

- (BOOL)_disableAutomaticKeyboardUI
{
  return self->_barPresentationStyle == 5;
}

- (id)preferredFocusEnvironments
{
  v22[1] = *MEMORY[0x1E4F143B8];
  if (self->_barPresentationStyle != 5)
  {
    searchResultsController = self->_searchResultsController;
    if (searchResultsController)
    {
      double v9 = [(UIViewController *)searchResultsController view];
      int v10 = [v9 isHidden] ^ 1;
    }
    else
    {
      int v10 = 0;
    }
    if (self->_systemInputViewController)
    {
      double v11 = [(UISearchController *)self _tvKeyboardContainerView];
      int v12 = [v11 isUserInteractionEnabled];

      $D69225ED9BA803AE184F8CEF6B0C1DE3 controllerFlags = self->_controllerFlags;
      if (v12)
      {
        if ((v10 & (*(unsigned int *)&controllerFlags >> 23)) != 1 || (*(_DWORD *)&controllerFlags & 0x2000000) != 0) {
          goto LABEL_19;
        }
LABEL_16:
        if (!v10)
        {
          uint64_t v17 = [(UISearchController *)self searchBar];
          int v4 = (void *)v17;
          if (v17)
          {
            uint64_t v19 = v17;
            double v5 = (void *)MEMORY[0x1E4F1C978];
            char v6 = &v19;
            goto LABEL_4;
          }
LABEL_23:
          double v7 = (void *)MEMORY[0x1E4F1CBF0];
          goto LABEL_24;
        }
        id v20 = self->_searchResultsController;
        double v15 = (void *)MEMORY[0x1E4F1C978];
        p_systemInputViewController = (UISystemInputViewController **)&v20;
LABEL_20:
        double v7 = [v15 arrayWithObjects:p_systemInputViewController count:1];
        goto LABEL_25;
      }
      if ((*(_DWORD *)&controllerFlags & 0x2000000) == 0) {
        goto LABEL_16;
      }
    }
    else if ((*((unsigned char *)&self->_controllerFlags + 3) & 2) == 0)
    {
      goto LABEL_16;
    }
LABEL_19:
    systemInputViewController = self->_systemInputViewController;
    double v15 = (void *)MEMORY[0x1E4F1C978];
    p_systemInputViewController = &systemInputViewController;
    goto LABEL_20;
  }
  uint64_t v3 = [(UISearchController *)self searchBar];
  int v4 = (void *)v3;
  if (!v3) {
    goto LABEL_23;
  }
  v22[0] = v3;
  double v5 = (void *)MEMORY[0x1E4F1C978];
  char v6 = v22;
LABEL_4:
  double v7 = [v5 arrayWithObjects:v6 count:1];
LABEL_24:

LABEL_25:
  return v7;
}

- (void)set_systemInputMarginView:(id)a3
{
  id v10 = a3;
  p_systemInputMarginView = &self->__systemInputMarginView;
  objc_storeStrong((id *)&self->__systemInputMarginView, a3);
  char v6 = [(UIViewController *)self view];
  double v7 = [v6 subviews];
  char v8 = [v7 containsObject:self->__systemInputMarginView];

  if ((v8 & 1) == 0)
  {
    double v9 = [(UIViewController *)self view];
    [v9 addSubview:*p_systemInputMarginView];
  }
}

- (void)_setRequestedInteractionModel:(unint64_t)a3
{
  if (UIKeyboardCarPlayRequiresTouch()) {
    unint64_t v5 = 1;
  }
  else {
    unint64_t v5 = a3;
  }
  if (self->__requestedInteractionModel != v5)
  {
    self->__requestedInteractionModel = v5;
    if (self->_systemInputViewController)
    {
      LODWORD(v6) = 0;
    }
    else
    {
      char v6 = [(UIViewController *)self _window];

      if (v6)
      {
        double v7 = [(UISearchController *)self searchBar];
        char v8 = [v7 searchField];
        double v9 = +[UISystemInputViewController systemInputViewControllerForResponder:v8 editorView:0 containingResponder:self];
        systemInputViewController = self->_systemInputViewController;
        self->_systemInputViewController = v9;

        LODWORD(v6) = 1;
      }
    }
    +[UISystemInputViewController setKeyboardInteractionModel:self->__requestedInteractionModel];
    double v11 = self->_systemInputViewController;
    if (v11) {
      [(UISystemInputViewController *)v11 setRequestedInteractionModel:self->__requestedInteractionModel];
    }
    if (v6)
    {
      [(UISearchController *)self _didCreateSystemInputViewController];
    }
  }
}

- (void)_createSystemInputViewControllerIfNeededForTraitEnvironment:(id)a3
{
  id v33 = a3;
  int v4 = [v33 traitCollection];
  if ([v4 userInterfaceIdiom] != 2)
  {
    unint64_t v5 = [v33 traitCollection];
    if ([v5 userInterfaceIdiom] != 8)
    {
      v31 = [v33 traitCollection];
      uint64_t v32 = [v31 userInterfaceIdiom];

      if (v32 != 3) {
        goto LABEL_18;
      }
      goto LABEL_5;
    }
  }
LABEL_5:
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v6 = [v33 _window];
    double v7 = [v6 windowScene];
    char v8 = [v7 _carPlaySceneComponent];

    if (v8) {
      UIKeyboardCarPlayFiveRowKeyboardEnabled = [v8 disableFiveRowKeyboards] ^ 1;
    }
  }
  systemInputViewController = self->_systemInputViewController;
  if (!systemInputViewController)
  {
    id v10 = [(UISearchController *)self searchBar];
    double v11 = [v10 searchField];
    int v12 = +[UISystemInputViewController systemInputViewControllerForResponder:v11 editorView:0 containingResponder:self];
    double v13 = self->_systemInputViewController;
    self->_systemInputViewController = v12;
  }
  +[UISystemInputViewController setKeyboardInteractionModel:[(UISearchController *)self _requestedInteractionModel]];
  if (self->_systemInputViewController)
  {
    [(UISearchBar *)self->_searchBar _setShowsDeleteButton:([(UISearchController *)self _requestedInteractionModel] & 1) == 0];
    [(UISystemInputViewController *)self->_systemInputViewController setRequestedInteractionModel:[(UISearchController *)self _requestedInteractionModel]];
    double v14 = self->_systemInputViewController;
    uint64_t v15 = [(UISearchController *)self searchBar];
    double v16 = [(id)v15 searchField];
    [(UISystemInputViewController *)v14 setPersistentDelegate:v16];

    uint64_t v17 = [(UIViewController *)self childViewControllers];
    LOBYTE(v15) = [v17 containsObject:self->_systemInputViewController];

    if ((v15 & 1) == 0)
    {
      [(UIViewController *)self addChildViewController:self->_systemInputViewController];
      id v18 = [(UIViewController *)self view];
      uint64_t v19 = [(UIViewController *)self->_systemInputViewController view];
      [v18 addSubview:v19];

      double v20 = *MEMORY[0x1E4F1DB28];
      double v21 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
      v22 = [(UIViewController *)self->_systemInputViewController view];
      objc_msgSend(v22, "systemLayoutSizeFittingSize:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
      double v24 = v23;

      id v25 = [(UIViewController *)self view];
      id v26 = [v25 safeAreaLayoutGuide];
      [v26 layoutFrame];
      double v28 = v27;

      v29 = [(UIViewController *)self->_systemInputViewController view];
      objc_msgSend(v29, "setFrame:", v20, v21, v28, v24);

      [(UIViewController *)self->_systemInputViewController didMoveToParentViewController:self];
    }
    [(UISystemInputViewController *)self->_systemInputViewController reloadInputViewsForPersistentDelegate];
  }
  v30 = [(UIViewController *)self view];
  objc_msgSend(v30, "set_ensureSystemInputViewAboveSearchBarContainerView:", 1);

  if (!systemInputViewController) {
    [(UISearchController *)self _didCreateSystemInputViewController];
  }
LABEL_18:
}

- (id)_viewToInsertSearchBarContainerViewUnder
{
  uint64_t v3 = [(UIViewController *)self view];
  int v4 = [v3 _ensureSystemInputViewAboveSearchBarContainerView];

  if (v4)
  {
    unint64_t v5 = [(UIViewController *)self->_systemInputViewController view];
  }
  else
  {
    unint64_t v5 = 0;
  }
  return v5;
}

- (void)_updateSystemInputViewController
{
}

- (UISystemInputViewController)_systemInputViewController
{
  [(UISearchController *)self _createSystemInputViewControllerIfNeededForTraitEnvironment:self];
  systemInputViewController = self->_systemInputViewController;
  return systemInputViewController;
}

- (id)_systemInputViewControllerAfterUpdate:(BOOL)a3
{
  systemInputViewController = self->_systemInputViewController;
  if (!systemInputViewController || a3)
  {
    int v4 = [(UISearchController *)self _systemInputViewController];
  }
  else
  {
    int v4 = systemInputViewController;
  }
  return v4;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_barPresentationStyle && ![(UISearchController *)self isBeingDismissed])
  {
    char v8 = [(UISearchController *)self _animatorForBarPresentationStyle:self->_barPresentationStyle dismissing:0];
    [(UISearchController *)self _updateKeyboardFocusGuidesForAnimator:v8];
    double v9 = [v6 previouslyFocusedView];
    id v10 = [v6 nextFocusedView];
    double v11 = v10;
    if (v10)
    {
      id v12 = v10;
    }
    else
    {
      double v13 = [(UIViewController *)self _focusSystem];
      id v12 = [v13 _focusedView];
    }
    if (v9)
    {
      double v14 = [(UISearchController *)self searchBar];
      if ([v9 isDescendantOfView:v14])
      {
        int v15 = 1;
      }
      else
      {
        double v16 = [(UIViewController *)self->_systemInputViewController view];
        int v15 = [v9 isDescendantOfView:v16];
      }
      [v9 isDescendantOfView:self->_resultsControllerViewContainer];
    }
    else
    {
      int v15 = 0;
    }
    uint64_t v17 = [(UISearchController *)self searchBar];
    if ([v12 isDescendantOfView:v17])
    {
      int v18 = 1;
    }
    else
    {
      [(UIViewController *)self->_systemInputViewController view];
      double v20 = v19 = v8;
      int v18 = [v12 isDescendantOfView:v20];

      char v8 = v19;
    }

    if (((v18 ^ 1 | v15) & 1) == 0)
    {
      [v8 didFocusSearchBarForController:self];
      goto LABEL_34;
    }
    if ((v18 | v15 ^ 1))
    {
      if (!v12)
      {
        uint64_t v21 = [(UISearchController *)self _systemInputViewControllerAfterUpdate:0];
        if (v21)
        {
          v22 = (void *)v21;
          double v23 = [(UISearchController *)self _systemInputViewControllerAfterUpdate:0];
          v59 = v8;
          uint64_t v24 = [v23 resolvedKeyboardStyle];

          BOOL v52 = v24 == 2;
          char v8 = v59;
          if (!v52)
          {
            id v25 = [(UIViewController *)self presentingViewController];
            id v26 = [v25 navigationController];

            double v27 = [(UIViewController *)self presentedViewController];
            if (v27)
            {
              int v56 = 1;
            }
            else
            {
              id v38 = v26;
              v39 = [(UISearchController *)self searchResultsController];
              v40 = [v39 presentedViewController];
              if (v40)
              {
                int v56 = 1;
              }
              else
              {
                uint64_t v41 = [v38 presentedViewController];
                int v56 = v41 != 0;
              }
              id v26 = v38;
            }

            char v70 = 0;
            uint64_t v64 = 0;
            v65 = &v64;
            uint64_t v66 = 0x3032000000;
            v67 = __Block_byref_object_copy__169;
            v68 = __Block_byref_object_dispose__169;
            id v69 = 0;
            uint64_t v42 = [(UIViewController *)self presentingViewController];
            v43 = (void *)v42;
            if (v42) {
              v44 = (UISearchController *)v42;
            }
            else {
              v44 = self;
            }
            v45 = v44;

            v61[0] = MEMORY[0x1E4F143A8];
            v61[1] = 3221225472;
            v61[2] = __71__UISearchController_didUpdateFocusInContext_withAnimationCoordinator___block_invoke;
            v61[3] = &unk_1E52E9C88;
            id v46 = v26;
            id v62 = v46;
            v63 = &v64;
            v57 = v45;
            [(UIViewController *)v45 _enumerateAncestorViewControllersUntilStop:&v70 usingBlock:v61];
            v47 = [v46 viewControllers];
            uint64_t v48 = [v47 indexOfObject:v65[5]];

            v58 = v46;
            v49 = [v46 viewControllers];
            v50 = [v46 topViewController];
            uint64_t v51 = [v49 indexOfObject:v50];

            if (v65[5]) {
              BOOL v52 = v48 == v51;
            }
            else {
              BOOL v52 = 1;
            }
            int v53 = v52;
            [(UIViewController *)self view];
            v54 = char v8 = v59;
            v55 = [v54 window];
            if (v55)
            {

              if ((v53 & ~v56) == 1)
              {
                [v59 willFocusOffscreenViewForController:self withHeading:1];
                [v59 didFocusSearchBarForController:self];
              }
            }
            else
            {
            }
            _Block_object_dispose(&v64, 8);
          }
        }
      }
LABEL_34:
      if (v18) {
        int v31 = 0;
      }
      else {
        int v31 = 0x800000;
      }
      self->_$D69225ED9BA803AE184F8CEF6B0C1DE3 controllerFlags = ($D69225ED9BA803AE184F8CEF6B0C1DE3)(*(_DWORD *)&self->_controllerFlags & 0xFF7FFFFF | v31);
      uint64_t v32 = [v6 nextFocusedItem];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        v34 = [v6 previouslyFocusedItem];
        v35 = [v6 nextFocusedItem];

        if (v34 == v35)
        {
LABEL_42:

          goto LABEL_43;
        }
        v36 = [(UISearchController *)self searchBar];
        [v36 _hideOrResetHelperPlaceHolder:0];

        [(UISearchController *)self _displayDefaultHelperPlaceholderMessage];
        id v37 = +[UIDictationController sharedInstance];
        [v37 updateHelperMessageDisplayIfNeeded];
      }
      else
      {
        id v37 = [(UISearchController *)self searchBar];
        [v37 _hideOrResetHelperPlaceHolder:1];
      }

      goto LABEL_42;
    }
    v60 = v8;
    double v28 = [v12 _scroller];
    v29 = [v28 _scroller];
    if ([v29 isDescendantOfView:self->_resultsControllerViewContainer])
    {
      do
      {
        id v30 = v29;

        v29 = [v30 _scroller];

        double v28 = v30;
      }
      while (([v29 isDescendantOfView:self->_resultsControllerViewContainer] & 1) != 0);
    }
    else
    {
      id v30 = v28;
    }
    char v8 = v60;
    if (v30)
    {
      if ([(UISystemInputViewController *)self->_systemInputViewController resolvedKeyboardStyle] == 1)
      {
        if (([v30 _canScrollY] & 1) == 0) {
          goto LABEL_33;
        }
        goto LABEL_32;
      }
      if ([v30 _canScrollX]) {
LABEL_32:
      }
        [v60 didUnfocusSearchBarForController:self];
    }
LABEL_33:

    goto LABEL_34;
  }
LABEL_43:
}

void __71__UISearchController_didUpdateFocusInContext_withAnimationCoordinator___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v8 = a2;
  id v6 = [v8 parentViewController];
  id v7 = *(void **)(a1 + 32);

  if (v6 == v7)
  {
    *a3 = 1;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
}

- (void)_updateKeyboardFocusGuidesForAnimator:(id)a3
{
  if ([a3 collapesKeyboardWhenNotFocused])
  {
    [(UISearchController *)self _createOrUpdateKeyboardToSearchResultsFocusGuide];
    [(UISearchController *)self _createOrUpdateSearchResultsToHiddenKeyboardFocusGuide];
    systemInputViewController = self->_systemInputViewController;
    [(UISystemInputViewController *)systemInputViewController setKeyboardCanBecomeFocusedWithZeroAlpha:1];
  }
  else
  {
    unint64_t v5 = [(UISearchController *)self keyboardToSearchResultsFocusGuide];

    if (v5)
    {
      id v6 = [(UISearchController *)self keyboardToSearchResultsFocusGuide];
      id v7 = [v6 owningView];
      id v8 = [(UISearchController *)self keyboardToSearchResultsFocusGuide];
      [v7 removeLayoutGuide:v8];

      [(UISearchController *)self setKeyboardToSearchResultsFocusGuide:0];
    }
    double v9 = [(UISearchController *)self searchResultsToHiddenKeyboardFocusGuide];

    if (v9)
    {
      id v10 = [(UISearchController *)self searchResultsToHiddenKeyboardFocusGuide];
      double v11 = [v10 owningView];
      id v12 = [(UISearchController *)self searchResultsToHiddenKeyboardFocusGuide];
      [v11 removeLayoutGuide:v12];

      [(UISearchController *)self setSearchResultsToHiddenKeyboardFocusGuide:0];
    }
    [(UISystemInputViewController *)self->_systemInputViewController setKeyboardCanBecomeFocusedWithZeroAlpha:0];
    id v13 = [(UIViewController *)self->_systemInputViewController view];
    [v13 setAlpha:1.0];
  }
}

- (void)_createOrUpdateKeyboardToSearchResultsFocusGuide
{
  v36[4] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(UISearchController *)self _systemInputViewControllerAfterUpdate:0];
  int v4 = [v3 view];

  if (v4)
  {
    unint64_t v5 = [(UISearchController *)self keyboardToSearchResultsFocusGuide];

    unint64_t v6 = 0x1E4F1C000;
    if (!v5)
    {
      id v7 = objc_alloc_init(UIFocusGuide);
      [(UIFocusGuide *)v7 setEnabled:0];
      id v8 = [v3 view];
      [v8 addLayoutGuide:v7];

      double v27 = (void *)MEMORY[0x1E4F5B268];
      id v33 = [(UILayoutGuide *)v7 heightAnchor];
      uint64_t v32 = [v33 constraintEqualToConstant:1.0];
      v36[0] = v32;
      id v30 = [(UILayoutGuide *)v7 topAnchor];
      int v31 = [v3 view];
      v29 = [v31 bottomAnchor];
      double v28 = [v30 constraintEqualToAnchor:v29];
      v36[1] = v28;
      id v25 = [(UILayoutGuide *)v7 leadingAnchor];
      id v26 = [v3 view];
      double v9 = [v26 leadingAnchor];
      id v10 = [v25 constraintEqualToAnchor:v9];
      v36[2] = v10;
      double v11 = [v3 view];
      id v12 = [v11 trailingAnchor];
      id v13 = [(UILayoutGuide *)v7 trailingAnchor];
      double v14 = [v12 constraintEqualToAnchor:v13];
      v36[3] = v14;
      int v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:4];
      [v27 activateConstraints:v15];

      unint64_t v6 = 0x1E4F1C000uLL;
      [(UISearchController *)self setKeyboardToSearchResultsFocusGuide:v7];
    }
    double v16 = [(UISearchController *)self searchResultsController];
    if (v16)
    {
      uint64_t v17 = [(UISearchController *)self searchResultsController];
      v35 = v17;
      int v18 = [*(id *)(v6 + 2424) arrayWithObjects:&v35 count:1];
    }
    else
    {
      int v18 = 0;
    }

    uint64_t v19 = [(UISearchController *)self searchBar];
    if ([v19 showsScopeBar])
    {
      double v20 = [(UISearchController *)self searchBar];
      uint64_t v21 = [v20 _scopeBar];

      if (!v21)
      {
LABEL_11:
        uint64_t v24 = [(UISearchController *)self keyboardToSearchResultsFocusGuide];
        [v24 setPreferredFocusEnvironments:v18];

        goto LABEL_12;
      }
      uint64_t v19 = [(UISearchController *)self searchBar];
      v22 = [v19 _scopeBar];
      v34 = v22;
      uint64_t v23 = [*(id *)(v6 + 2424) arrayWithObjects:&v34 count:1];

      int v18 = (void *)v23;
    }

    goto LABEL_11;
  }
LABEL_12:
}

- (void)_createOrUpdateSearchResultsToHiddenKeyboardFocusGuide
{
  v27[4] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(UISearchController *)self _systemInputViewControllerAfterUpdate:0];
  int v4 = [v3 view];

  if (v4)
  {
    unint64_t v5 = 0x1E4F1C000;
    if (!self->_searchResultsToHiddenKeyboardFocusGuide)
    {
      unint64_t v6 = objc_alloc_init(UIFocusGuide);
      [(UIFocusGuide *)v6 setEnabled:0];
      id v7 = [(UIViewController *)self view];
      [v7 addLayoutGuide:v6];

      uint64_t v19 = (void *)MEMORY[0x1E4F5B268];
      id v25 = [(UILayoutGuide *)v6 heightAnchor];
      uint64_t v24 = [v25 constraintEqualToConstant:1.0];
      v27[0] = v24;
      v22 = [(UILayoutGuide *)v6 leadingAnchor];
      uint64_t v23 = [(UIViewController *)self view];
      uint64_t v21 = [v23 leadingAnchor];
      double v20 = [v22 constraintEqualToAnchor:v21];
      v27[1] = v20;
      uint64_t v17 = [(UILayoutGuide *)v6 topAnchor];
      int v18 = [v3 view];
      id v8 = [v18 bottomAnchor];
      double v9 = [v17 constraintEqualToAnchor:v8];
      v27[2] = v9;
      id v10 = [(UIViewController *)self view];
      double v11 = [v10 trailingAnchor];
      id v12 = [(UILayoutGuide *)v6 trailingAnchor];
      id v13 = [v11 constraintEqualToAnchor:v12];
      v27[3] = v13;
      double v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:4];
      [v19 activateConstraints:v14];

      [(UISearchController *)self setSearchResultsToHiddenKeyboardFocusGuide:v6];
      unint64_t v5 = 0x1E4F1C000uLL;
    }
    id v26 = v3;
    int v15 = [*(id *)(v5 + 2424) arrayWithObjects:&v26 count:1];
    double v16 = [(UISearchController *)self searchResultsToHiddenKeyboardFocusGuide];
    [v16 setPreferredFocusEnvironments:v15];
  }
}

- (void)_willUpdateFocusInContext:(id)a3
{
  id v25 = a3;
  dyld_program_sdk_at_least();
  int v4 = [v25 previouslyFocusedItem];
  uint64_t v5 = [v25 nextFocusedItem];
  if (v4 == (void *)v5)
  {
    unint64_t v6 = v4;
  }
  else
  {
    unint64_t v6 = (void *)v5;
    if (self->_barPresentationStyle)
    {
      BOOL v7 = [(UISearchController *)self isBeingDismissed];

      if (v7) {
        goto LABEL_13;
      }
      int v4 = [v25 nextFocusedView];
      id v8 = [(UIViewController *)self view];
      [v4 bounds];
      objc_msgSend(v8, "convertRect:fromView:", v4);
      CGFloat v10 = v9;
      CGFloat v12 = v11;
      CGFloat v14 = v13;
      CGFloat v16 = v15;

      unint64_t v6 = [(UISearchController *)self _animatorForBarPresentationStyle:self->_barPresentationStyle dismissing:0];
      [(UISearchController *)self _updateKeyboardFocusGuidesForAnimator:v6];
      v27.origin.x = v10;
      v27.origin.y = v12;
      v27.size.width = v14;
      v27.size.double height = v16;
      double MaxY = CGRectGetMaxY(v27);
      int v18 = [(UIViewController *)self view];
      [v18 bounds];
      double v19 = CGRectGetMaxY(v28);

      if (MaxY > v19)
      {
        uint64_t v20 = 2;
LABEL_9:
        [v6 willFocusOffscreenViewForController:self withHeading:v20];
        uint64_t v24 = [v4 _scroller];
        if (v24)
        {
          [v4 bounds];
          objc_msgSend(v24, "convertRect:fromView:", v4);
          objc_msgSend(v24, "scrollRectToVisible:animated:", 1);
        }

        goto LABEL_12;
      }
      v29.origin.x = v10;
      v29.origin.y = v12;
      v29.size.width = v14;
      v29.size.double height = v16;
      double MinY = CGRectGetMinY(v29);
      v22 = [(UIViewController *)self view];
      [v22 bounds];
      double v23 = CGRectGetMinY(v30);

      if (MinY < v23)
      {
        uint64_t v20 = 1;
        goto LABEL_9;
      }
    }
  }
LABEL_12:

LABEL_13:
}

- (void)viewWillAppear:(BOOL)a3
{
  v30.receiver = self;
  v30.super_class = (Class)UISearchController;
  [(UIViewController *)&v30 viewWillAppear:a3];
  int v4 = [(UISearchController *)self _searchPresentationController];
  if ([(UISearchController *)self _resultsControllerWillLayoutVisibleUnderContainerView])
  {
    uint64_t v5 = [(UIViewController *)self->_searchResultsController _contentOrObservableScrollViewForEdge:1];
    unint64_t v6 = v5;
    if (v5)
    {
      if ([v5 _compatibleContentInsetAdjustmentBehavior] == 101)
      {
        searchResultsController = self->_searchResultsController;
        if (searchResultsController)
        {
          if ([(UIViewController *)searchResultsController automaticallyAdjustsScrollViewInsets])
          {
            id v8 = [v4 presentingViewController];
            double v9 = [v8 navigationController];

            if (v9)
            {
              [v6 contentInset];
              double v11 = v10;
              double v13 = v12;
              double v15 = v14;
              [v9 _scrollViewBottomContentInsetForViewController:self->_searchResultsController];
              objc_msgSend(v6, "setContentInset:", v11, v13, v16, v15);
            }
          }
        }
      }
    }
  }
  else if (([v4 animatorShouldLayoutPresentationViews] & 1) == 0)
  {
    [v4 finalFrameForContainerView];
    CGFloat v18 = v17;
    CGFloat v20 = v19;
    double v22 = v21;
    double v24 = v23;
    id v25 = [(UISearchBar *)self->_searchBar scopeButtonTitles];
    if ([v25 count])
    {
      BOOL v26 = -[UISearchBar _wouldCombineLandscapeBarsForSize:](self->_searchBar, "_wouldCombineLandscapeBarsForSize:", v22, v24);

      if (!v26)
      {
        [(UISearchBar *)self->_searchBar _scopeBarHeight];
        double v24 = v24 + v27;
      }
    }
    else
    {
    }
    v31.origin.x = v18;
    v31.origin.y = v20;
    v31.size.width = v22;
    v31.size.double height = v24;
    double MaxY = CGRectGetMaxY(v31);
    [(UIView *)self->_resultsControllerViewContainer frame];
    -[UISearchController _resizeResultsControllerWithDelta:](self, "_resizeResultsControllerWithDelta:", 0.0, MaxY - v29);
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)UISearchController;
  [(UIViewController *)&v3 viewWillDisappear:a3];
}

- (void)_willPresentFromViewController:(id)a3
{
  [(UISearchController *)self _startDeferringSettingSearchSuggestions];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  uint64_t v5 = WeakRetained;
  if (WeakRetained)
  {
    BOOL v7 = WeakRetained;
    char v6 = objc_opt_respondsToSelector();
    uint64_t v5 = v7;
    if (v6)
    {
      [v7 willPresentSearchController:self];
      uint64_t v5 = v7;
    }
  }
}

- (void)_didPresentFromViewController:(id)a3
{
  [(UISearchController *)self _stopDeferringAndShowDeferredSearchSuggestions];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  uint64_t v5 = WeakRetained;
  if (WeakRetained)
  {
    BOOL v7 = WeakRetained;
    char v6 = objc_opt_respondsToSelector();
    uint64_t v5 = v7;
    if (v6)
    {
      [v7 didPresentSearchController:self];
      uint64_t v5 = v7;
    }
  }
}

- (void)_willDismissSearchController
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  objc_super v3 = [(UIViewController *)self presentingViewController];
  if (v3)
  {
    *(_DWORD *)&self->_controllerFlags |= 0x80000u;
  }
  else if (dyld_program_sdk_at_least())
  {
    if (os_variant_has_internal_diagnostics())
    {
      char v6 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      {
        int v7 = 138412290;
        id v8 = self;
        _os_log_fault_impl(&dword_1853B0000, v6, OS_LOG_TYPE_FAULT, "-_willDismissSearchController unexpectedly received with nil presentingViewController on iOS16.4 or later. self = %@", (uint8_t *)&v7, 0xCu);
      }
    }
    else
    {
      uint64_t v5 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_willDismissSearchController___s_category) + 8);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        int v7 = 138412290;
        id v8 = self;
        _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_ERROR, "-_willDismissSearchController unexpectedly received with nil presentingViewController on iOS16.4 or later. self = %@", (uint8_t *)&v7, 0xCu);
      }
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0) {
    [WeakRetained willDismissSearchController:self];
  }
}

- (void)_didDismissSearchController
{
  *(_DWORD *)&self->_controllerFlags &= ~0x80000u;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  int v4 = WeakRetained;
  if (WeakRetained)
  {
    char v6 = WeakRetained;
    char v5 = objc_opt_respondsToSelector();
    int v4 = v6;
    if (v5)
    {
      [v6 didDismissSearchController:self];
      int v4 = v6;
    }
  }
}

- (CGSize)preferredContentSize
{
  [(UIViewController *)self->_searchResultsController preferredContentSize];
  result.double height = v3;
  result.width = v2;
  return result;
}

- (void)_preferredContentSizeDidChangeForChildViewController:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)UISearchController;
  id v4 = a3;
  [(UIViewController *)&v9 _preferredContentSizeDidChangeForChildViewController:v4];
  objc_msgSend(v4, "preferredContentSize", v9.receiver, v9.super_class);
  double v6 = v5;
  double v8 = v7;

  -[UIViewController setPreferredContentSize:](self, "setPreferredContentSize:", v6, v8);
}

- (void)setActive:(BOOL)active
{
  if (active)
  {
    [(UISearchController *)self _performAutomaticPresentationFromTextField:0];
  }
  else
  {
    BOOL v4 = +[UIView areAnimationsEnabled];
    [(UISearchController *)self _dismissPresentation:v4];
  }
}

- (BOOL)automaticallyShowsSearchResultsController
{
  return *(unsigned char *)&self->_controllerFlags >> 7;
}

- (void)_setShowResultsForEmptySearch:(BOOL)a3
{
  self->__BOOL showResultsForEmptySearch = a3;
  [(UISearchController *)self _updateVisibilityOfSearchResultsForSearchBar:self->_searchBar];
}

- (void)setAutomaticallyShowsScopeBar:(BOOL)automaticallyShowsScopeBar
{
  if (automaticallyShowsScopeBar) {
    int v3 = 0;
  }
  else {
    int v3 = 32;
  }
  self->_$D69225ED9BA803AE184F8CEF6B0C1DE3 controllerFlags = ($D69225ED9BA803AE184F8CEF6B0C1DE3)(*(_DWORD *)&self->_controllerFlags & 0xFFFFFF9F | v3);
}

- (BOOL)automaticallyShowsScopeBar
{
  return (*(_DWORD *)&self->_controllerFlags & 0x60) != 32;
}

- (void)_scopeBarWillShowOrHide
{
  if (a1
    && (*(_DWORD *)(a1 + 1052) & 0x60) == 0x20
    && [*(id *)(a1 + 976) _isHostedByNavigationBar])
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 1208));
    id v4 = [WeakRetained _navigationBar];

    id v3 = objc_loadWeakRetained((id *)(a1 + 1208));
    [v4 _searchScopeBarWillManuallyShowOrHideForNavigationItem:v3];
  }
}

- (BOOL)_dci_automaticScopeBarShowsOnPresentation
{
  if (self)
  {
    unint64_t v2 = ((unint64_t)self->_controllerFlags >> 5) & 3;
    if (!v2)
    {
      int v3 = dyld_program_sdk_at_least();
      unint64_t v2 = 2;
      if (!v3) {
        unint64_t v2 = 3;
      }
    }
  }
  else
  {
    unint64_t v2 = 0;
  }
  return v2 == 3;
}

- (void)_sizeSearchViewToPresentingViewController:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __64__UISearchController__sizeSearchViewToPresentingViewController___block_invoke;
  v6[3] = &unk_1E52D9F98;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  +[UIView performWithoutAnimation:v6];
}

void __64__UISearchController__sizeSearchViewToPresentingViewController___block_invoke(uint64_t a1)
{
  id v11 = [*(id *)(a1 + 40) view];
  [v11 bounds];
  double v3 = v2;
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v10 = [*(id *)(a1 + 32) view];
  objc_msgSend(v10, "setFrame:", v3, v5, v7, v9);
}

- (BOOL)_searchFieldIsBeginningEditing
{
  return (*((unsigned __int8 *)&self->_controllerFlags + 1) >> 1) & 1;
}

- (BOOL)_searchBarShouldFinalizeBecomingFirstResponder
{
  double v3 = [(UISearchController *)self _locatePresentingViewController];
  uint64_t v4 = [(UIViewController *)v3 _transitionCoordinator];
  double v5 = (void *)v4;
  BOOL v7 = v3 == self || v4 == 0;
  double v8 = [(UIViewController *)self traitCollection];
  if ([v8 userInterfaceIdiom] == 2) {
    goto LABEL_10;
  }
  double v9 = [(UIViewController *)self traitCollection];
  if ([v9 userInterfaceIdiom] == 8)
  {

LABEL_10:
    goto LABEL_11;
  }
  id v11 = [(UIViewController *)self traitCollection];
  uint64_t v12 = [v11 userInterfaceIdiom];

  char v13 = v12 == 3 || v7;
  if ((v13 & 1) != 0 || !v5)
  {
    if ((v13 & 1) == 0)
    {
LABEL_23:
      BOOL v10 = 0;
      goto LABEL_24;
    }
  }
  else if (![(UIViewController *)self isBeingPresented] {
         || ![(UISearchBar *)self->_searchBar _isHostedByNavigationBar])
  }
  {
    goto LABEL_23;
  }
LABEL_11:
  if ([(UIViewController *)v3 _appearState] == 3
    || ![(UIViewController *)v3 _appearState])
  {
    goto LABEL_23;
  }
  BOOL v10 = 1;
LABEL_24:

  return v10;
}

- (void)_clearSearchSuggestionsIfNecessary
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if ((*(unsigned char *)(a1 + 1053) & 0x20) != 0)
    {
      double v2 = [(id)a1 _suggestionController];
      int v3 = [v2 hasVisibleMenu];

      if (v3)
      {
        if (os_variant_has_internal_diagnostics())
        {
          double v5 = __UIFaultDebugAssertLog();
          if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
          {
            int v6 = 138412290;
            uint64_t v7 = a1;
            _os_log_fault_impl(&dword_1853B0000, v5, OS_LOG_TYPE_FAULT, "UIKit inconsistency: Menu became visible with clear-search-suggestions still pending. Search suggestions will not be cleared. %@", (uint8_t *)&v6, 0xCu);
          }
        }
        else
        {
          uint64_t v4 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_clearSearchSuggestionsIfNecessary___s_category_0)
                            + 8);
          if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
          {
            int v6 = 138412290;
            uint64_t v7 = a1;
            _os_log_impl(&dword_1853B0000, v4, OS_LOG_TYPE_ERROR, "UIKit inconsistency: Menu became visible with clear-search-suggestions still pending. Search suggestions will not be cleared. %@", (uint8_t *)&v6, 0xCu);
          }
        }
      }
      else
      {
        [(id)a1 setSearchSuggestions:0];
      }
    }
    *(_DWORD *)(a1 + 1052) &= ~0x2000u;
  }
}

- (void)_searchBar:(id)a3 selectedScopeButtonIndexDidChange:(int64_t)a4
{
  if (dyld_program_sdk_at_least())
  {
    -[UISearchController _clearSearchSuggestionsIfNecessary]((uint64_t)self);
    id v5 = [(UISearchController *)self searchResultsUpdater];
    [v5 updateSearchResultsForSearchController:self];
  }
}

- (void)_tvos_searchBar:(id)a3 textDidChange:(id)a4 programatically:(BOOL)a5
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (os_variant_has_internal_diagnostics())
  {
    uint64_t v7 = __UIFaultDebugAssertLog();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      goto LABEL_5;
    }
    uint64_t v8 = NSStringFromSelector(a2);
    int v9 = 138412290;
    BOOL v10 = v8;
    _os_log_fault_impl(&dword_1853B0000, v7, OS_LOG_TYPE_FAULT, "UIKit issue: dedicated tvOS method not executed on this platform: %@", (uint8_t *)&v9, 0xCu);
  }
  else
  {
    int v6 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_tvos_searchBar_textDidChange_programatically____s_category)+ 8);
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      return;
    }
    uint64_t v7 = v6;
    uint64_t v8 = NSStringFromSelector(a2);
    int v9 = 138412290;
    BOOL v10 = v8;
    _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_ERROR, "UIKit issue: dedicated tvOS method not executed on this platform: %@", (uint8_t *)&v9, 0xCu);
  }

LABEL_5:
}

- (void)__searchBar:(int)a3 changedSearchTextFieldContentProgramatically:
{
  id v13 = a2;
  if (a1)
  {
    if (a3)
    {
      if ([(id)a1 isBeingDismissed]) {
        goto LABEL_16;
      }
      int v3 = [v13 _searchBarTextField];
      if (![v3 _hasContent]) {
        goto LABEL_15;
      }
    }
    int v6 = (*(_DWORD *)(a1 + 1052) >> 5) & 3;
    if (v6 != 2 && (v6 || !dyld_program_sdk_at_least())
      || [*(id *)(a1 + 976) showsScopeBar])
    {
      if ((a3 & 1) == 0) {
        goto LABEL_16;
      }
LABEL_15:

      goto LABEL_16;
    }
    uint64_t v7 = [*(id *)(a1 + 976) scopeButtonTitles];
    uint64_t v8 = [v7 count];

    if (a3) {
    if (v8)
    }
    {
      int v9 = *(void **)(a1 + 976);
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 1208));
      uint64_t v11 = [WeakRetained _navigationBar];
      uint64_t v12 = [v13 _searchBarTextField];
      objc_msgSend(v9, "_setDeferredAutomaticShowsScopeBarInNavigationBar:hasContent:", v11, objc_msgSend(v12, "_hasContent"));

      int v3 = objc_loadWeakRetained((id *)(a1 + 1208));
      [v3 _searchControllerReadyForDeferredAutomaticShowsScopeBar];
      goto LABEL_15;
    }
  }
LABEL_16:
}

- (void)__searchTextFieldDidSetOrInsertTokens:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v5 = v3;
    id v4 = [*(id *)(a1 + 976) _searchBarTextField];

    id v3 = v5;
    if (v4 == v5)
    {
      -[UISearchController __searchBar:changedSearchTextFieldContentProgramatically:](a1, *(void **)(a1 + 976), 1);
      id v3 = v5;
    }
  }
}

- (void)_ios_searchBar:(id)a3 textDidChange:(id)a4 programatically:(BOOL)a5
{
  BOOL v5 = a5;
  id v12 = a3;
  id v8 = a4;
  if (!v5)
  {
    int v9 = [v12 _searchBarTextField];
    int v10 = [v9 _needsDelayedSearchControllerPresentation];

    if (v10) {
      [(UISearchController *)self _performDidBeginEditingForSearchBar:v12];
    }
    else {
      -[UISearchController _clearSearchSuggestionsIfNecessary]((uint64_t)self);
    }
  }
  -[UISearchController __searchBar:changedSearchTextFieldContentProgramatically:]((uint64_t)self, v12, v5);
  [(UISearchController *)self _updateVisibilityOfSearchResultsForSearchBar:v12];
  uint64_t v11 = [(UISearchController *)self searchResultsUpdater];
  [v11 updateSearchResultsForSearchController:self];
}

- (void)_searchBarTokensDidChange:(id)a3
{
  id v4 = a3;
  -[UISearchController _clearSearchSuggestionsIfNecessary]((uint64_t)self);
  [(UISearchController *)self _updateVisibilityOfSearchResultsForSearchBar:v4];

  id v5 = [(UISearchController *)self searchResultsUpdater];
  [v5 updateSearchResultsForSearchController:self];
}

- (void)_performDidBeginEditingForSearchBar:(id)a3
{
  id v4 = [a3 _searchBarTextField];
  [v4 _resetNeedsDelayedSearchControllerPresentation];

  [(UISearchController *)self _performAutomaticPresentationFromTextField:1];
  id v5 = [(UIViewController *)self traitCollection];
  uint64_t v6 = [v5 userInterfaceIdiom];

  if (v6 == 3)
  {
    uint64_t v7 = [(UIViewController *)self _focusSystem];
    id v9 = [v7 _focusedView];

    if ([v9 isDescendantOfView:self->_resultsControllerViewContainer])
    {
      id v8 = [(UISearchController *)self _animatorForBarPresentationStyle:self->_barPresentationStyle dismissing:0];
      [v8 didFocusSearchBarForController:self];
    }
  }
}

- (void)_searchBarTextDidBeginEditing:(id)a3
{
  id v6 = a3;
  id v4 = [v6 _searchBarTextField];
  char v5 = [v4 _needsDelayedSearchControllerPresentation];

  if ((v5 & 1) == 0) {
    [(UISearchController *)self _performDidBeginEditingForSearchBar:v6];
  }
}

- (void)_searchBarSearchButtonClicked:(id)a3
{
}

- (void)_searchBarCancelButtonClicked:(id)a3
{
  -[UISearchController _clearSearchSuggestionsIfNecessary]((uint64_t)self);
  BOOL v4 = +[UIView areAnimationsEnabled];
  [(UISearchController *)self _dismissPresentation:v4];
}

- (void)_searchBarSearchTextFieldRequirementDidChange:(id)a3
{
  p_navigationItemCurrentlyDisplayingSearchController = &self->__navigationItemCurrentlyDisplayingSearchController;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_navigationItemCurrentlyDisplayingSearchController);
  [WeakRetained _updateSearchBarItemGroup];

  LODWORD(WeakRetained) = [v4 _requiresSearchTextField];
  id v6 = [v4 _searchBarTextField];

  id v10 = [v6 window];

  uint64_t v7 = v10;
  if (WeakRetained && !v10)
  {
    id v8 = objc_loadWeakRetained((id *)p_navigationItemCurrentlyDisplayingSearchController);
    id v9 = [v8 _navigationBar];
    [v9 layoutIfNeeded];

    uint64_t v7 = 0;
  }
}

- (id)_locatePresentingViewControllerIfInManagedPaletteOrHostedByNavigationBar
{
  searchBar = self->_searchBar;
  if (!searchBar)
  {
    id v9 = 0;
    goto LABEL_18;
  }
  id v4 = [(UIView *)searchBar _viewControllerForAncestor];
  if (!v4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->__navigationItemCurrentlyDisplayingSearchController);
    if ([WeakRetained _hasInlineSearchBar])
    {
      id v6 = objc_loadWeakRetained((id *)&self->__navigationItemCurrentlyDisplayingSearchController);
      uint64_t v7 = [v6 _inlineSearchBarItemGroup];
      char v8 = [v7 isHidden];

      if (v8)
      {
        id v4 = 0;
        goto LABEL_10;
      }
      id WeakRetained = objc_loadWeakRetained((id *)&self->__navigationItemCurrentlyDisplayingSearchController);
      id v10 = [WeakRetained _navigationBar];
      id v4 = [v10 _effectiveDelegate];
    }
    else
    {
      id v4 = 0;
    }
  }
LABEL_10:
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v11 = [v4 topViewController];
    id v9 = v11;
    if (self->_managedPalette) {
      goto LABEL_17;
    }
    if ([v11 _isNestedNavigationController])
    {
      uint64_t v12 = [v9 topViewController];

      id v9 = (void *)v12;
    }
    id v13 = [v9 navigationItem];
    double v14 = [v13 _searchControllerIfAllowed];

    if (v14 == self) {
      goto LABEL_17;
    }
  }
  id v9 = 0;
LABEL_17:

LABEL_18:
  return v9;
}

- (id)_locatePresentingViewController
{
  id v3 = [(UISearchController *)self _locatePresentingViewControllerIfInManagedPaletteOrHostedByNavigationBar];
  if (!v3)
  {
    id v4 = [(UISearchController *)self searchBar];
    id v3 = [v4 _viewControllerForAncestor];

    if (!v3)
    {
      char v5 = [(UIViewController *)self _window];
      id v3 = [v5 rootViewController];
    }
  }
  _firstChildViewControllerDefiningPresentationContext(v3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  if (!v6) {
    id v6 = v3;
  }

  return v6;
}

- (void)_contentScrollViewDidFinishContentOffsetAnimation
{
  if (self)
  {
    deferredActivationOrDismissal = (void (**)(id, SEL))self->_deferredActivationOrDismissal;
    if (deferredActivationOrDismissal)
    {
      deferredActivationOrDismissal[2](deferredActivationOrDismissal, a2);
      id v4 = self->_deferredActivationOrDismissal;
      self->_deferredActivationOrDismissal = 0;

      *(_DWORD *)&self->_controllerFlags &= ~0x100000u;
    }
  }
}

- (void)_performAutomaticPresentationFromTextField:(BOOL)a3
{
  p_navigationItemCurrentlyDisplayingSearchController = &self->__navigationItemCurrentlyDisplayingSearchController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->__navigationItemCurrentlyDisplayingSearchController);
  if (WeakRetained)
  {
    uint64_t v7 = WeakRetained;
    id v8 = objc_loadWeakRetained((id *)p_navigationItemCurrentlyDisplayingSearchController);
    if ([v8 searchBarPlacement] == 2)
    {
      id v9 = objc_loadWeakRetained((id *)p_navigationItemCurrentlyDisplayingSearchController);
      int v10 = [v9 _shouldSearchControllerDeferPresentationTransition:self];

      if (v10)
      {
        if ((*((unsigned char *)&self->_controllerFlags + 2) & 0x10) != 0 || !self->_deferredActivationOrDismissal)
        {
          objc_initWeak(&location, self);
          aBlock[0] = MEMORY[0x1E4F143A8];
          aBlock[1] = 3221225472;
          aBlock[2] = __65__UISearchController__performAutomaticPresentationFromTextField___block_invoke;
          aBlock[3] = &unk_1E52E7E68;
          objc_copyWeak(&v26, &location);
          BOOL v27 = a3;
          uint64_t v11 = _Block_copy(aBlock);
          id deferredActivationOrDismissal = self->_deferredActivationOrDismissal;
          self->_id deferredActivationOrDismissal = v11;

          *(_DWORD *)&self->_controllerFlags |= 0x100000u;
          objc_destroyWeak(&v26);
          objc_destroyWeak(&location);
        }
        return;
      }
    }
    else
    {
    }
  }
  id v13 = [(UISearchController *)self _locatePresentingViewController];
  if (([v13 isBeingDismissed] & 1) == 0)
  {
    if (self) {
      BOOL v14 = self->super._parentModalViewController != 0;
    }
    else {
      BOOL v14 = 0;
    }
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __65__UISearchController__performAutomaticPresentationFromTextField___block_invoke_2;
    v21[3] = &unk_1E52DD128;
    v21[4] = self;
    id v15 = v13;
    id v22 = v15;
    BOOL v23 = v14;
    BOOL v24 = a3;
    double v16 = (void (**)(void))_Block_copy(v21);
    double v17 = [v15 transitionCoordinator];

    if (v17)
    {
      CGFloat v18 = [v15 transitionCoordinator];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __65__UISearchController__performAutomaticPresentationFromTextField___block_invoke_4;
      v19[3] = &unk_1E52DA110;
      CGFloat v20 = v16;
      [v18 animateAlongsideTransition:0 completion:v19];
    }
    else
    {
      v16[2](v16);
    }
  }
}

void __65__UISearchController__performAutomaticPresentationFromTextField___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _performAutomaticPresentationFromTextField:*(unsigned __int8 *)(a1 + 40)];
}

void __65__UISearchController__performAutomaticPresentationFromTextField___block_invoke_2(uint64_t a1)
{
  v30[1] = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) _createSystemInputViewControllerIfNeededForTraitEnvironment:*(void *)(a1 + 40)];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(a1 + 48) || v2 && *(void *)(v2 + 120))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(v2 + 1160));
    goto LABEL_5;
  }
  id v7 = objc_loadWeakRetained((id *)(v2 + 1208));
  if ([v7 _hasInlineSearchBar])
  {
    id v8 = [*(id *)(*(void *)(a1 + 32) + 976) _searchBarTextField];
    id v9 = [v8 window];
    if (!v9)
    {
      id v21 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1208));
      id v22 = [v21 _inlineSearchBarItemGroup];
      char v23 = [v22 isHidden];

      if ((v23 & 1) == 0)
      {
        [*(id *)(*(void *)(a1 + 32) + 976) _shrinkToButtonIfNecessary];
        [*(id *)(*(void *)(a1 + 32) + 976) _setRequiresSearchTextField:1];
      }
      goto LABEL_10;
    }
  }
LABEL_10:
  [*(id *)(a1 + 32) _sizeSearchViewToPresentingViewController:*(void *)(a1 + 40)];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1160));
  if (!WeakRetained
    || (objc_opt_respondsToSelector() & 1) == 0
    || ([WeakRetained presentSearchController:*(void *)(a1 + 32)], (uint64_t v10 = *(void *)(a1 + 32)) == 0)
    || !*(void *)(v10 + 120))
  {
    if (*(void *)(a1 + 40))
    {
      *(_DWORD *)(*(void *)(a1 + 32) + 1052) = *(_DWORD *)(*(void *)(a1 + 32) + 1052) & 0xFFFFFDFF | (*(unsigned __int8 *)(a1 + 49) << 9);
      [*(id *)(a1 + 32) _willPresentFromViewController:*(void *)(a1 + 40)];
      uint64_t v12 = *(void *)(a1 + 32);
      uint64_t v11 = *(void **)(a1 + 40);
      uint64_t v24 = MEMORY[0x1E4F143A8];
      uint64_t v25 = 3221225472;
      id v26 = __65__UISearchController__performAutomaticPresentationFromTextField___block_invoke_3;
      BOOL v27 = &unk_1E52D9F98;
      uint64_t v28 = v12;
      id v29 = v11;
      [v29 presentViewController:v12 animated:1 completion:&v24];
      if (objc_msgSend(*(id *)(a1 + 32), "modalPresentationStyle", v24, v25, v26, v27, v28) == 7)
      {
        id v13 = [*(id *)(a1 + 32) popoverPresentationController];
        [v13 setPermittedArrowDirections:15];
        BOOL v14 = [*(id *)(a1 + 32) searchBar];
        id v15 = [v14 searchField];
        [v13 setSourceView:v15];

        if ((dyld_program_sdk_at_least() & 1) == 0)
        {
          double v16 = [*(id *)(a1 + 32) searchBar];
          double v17 = [v16 searchField];
          [v17 bounds];
          objc_msgSend(v13, "setSourceRect:");
        }
        CGFloat v18 = [*(id *)(a1 + 32) searchBar];
        double v19 = [v18 searchField];
        v30[0] = v19;
        CGFloat v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:1];
        [v13 setPassthroughViews:v20];
      }
    }
  }
LABEL_5:
  id v4 = *(void **)(a1 + 32);
  char v5 = [v4 searchBar];
  [v4 _updateVisibilityOfSearchResultsForSearchBar:v5];

  id v6 = [*(id *)(a1 + 32) searchResultsUpdater];
  [v6 updateSearchResultsForSearchController:*(void *)(a1 + 32)];
}

uint64_t __65__UISearchController__performAutomaticPresentationFromTextField___block_invoke_3(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _didPresentFromViewController:*(void *)(a1 + 40)];
  *(_DWORD *)(*(void *)(a1 + 32) + 1052) &= ~0x200u;
  return result;
}

uint64_t __65__UISearchController__performAutomaticPresentationFromTextField___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_dismissPresentation:(BOOL)a3
{
  p_navigationItemCurrentlyDisplayingSearchController = &self->__navigationItemCurrentlyDisplayingSearchController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->__navigationItemCurrentlyDisplayingSearchController);
  if (WeakRetained)
  {
    id v7 = WeakRetained;
    id v8 = objc_loadWeakRetained((id *)p_navigationItemCurrentlyDisplayingSearchController);
    if ([v8 searchBarPlacement] == 2)
    {
      id v9 = objc_loadWeakRetained((id *)p_navigationItemCurrentlyDisplayingSearchController);
      int v10 = [v9 _shouldSearchControllerDeferPresentationTransition:self];

      if (v10)
      {
        if ((*((unsigned char *)&self->_controllerFlags + 2) & 0x10) == 0 || !self->_deferredActivationOrDismissal)
        {
          objc_initWeak(&location, self);
          aBlock[0] = MEMORY[0x1E4F143A8];
          aBlock[1] = 3221225472;
          aBlock[2] = __43__UISearchController__dismissPresentation___block_invoke;
          aBlock[3] = &unk_1E52E7E68;
          objc_copyWeak(&v18, &location);
          BOOL v19 = a3;
          uint64_t v11 = _Block_copy(aBlock);
          id deferredActivationOrDismissal = self->_deferredActivationOrDismissal;
          self->_id deferredActivationOrDismissal = v11;

          objc_destroyWeak(&v18);
          objc_destroyWeak(&location);
        }
        return;
      }
    }
    else
    {
    }
  }
  id v13 = [(UIViewController *)self presentingViewController];
  if (v13 || (dyld_program_sdk_at_least() & 1) == 0) {
    [(UISearchController *)self _willDismissSearchController];
  }
  BOOL v14 = [(UISearchBar *)self->_searchBar searchTextField];
  [v14 setText:0];
  [v14 setTokens:MEMORY[0x1E4F1CBF0]];
  +[UISearchController _resignSearchBarAsFirstResponder:self->_searchBar];
  BOOL v15 = +[UIView areAnimationsEnabled];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __43__UISearchController__dismissPresentation___block_invoke_2;
  v16[3] = &unk_1E52D9F70;
  v16[4] = self;
  [v13 dismissViewControllerAnimated:v15 completion:v16];
}

void __43__UISearchController__dismissPresentation___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _dismissPresentation:*(unsigned __int8 *)(a1 + 40)];
}

uint64_t __43__UISearchController__dismissPresentation___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _didDismissSearchController];
}

- (void)_showSearchSuggestionsListIfApplicable
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 1208));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    id v4 = objc_loadWeakRetained((id *)(a1 + 1208));
    char v5 = [v4 _hasInlineSearchBar];

    if ((v5 & 1) == 0)
    {
      id v6 = *(void **)(a1 + 1136);
      if (!v6)
      {
        id v7 = [[_UISearchSuggestionsListViewController alloc] initWithSearchController:a1];
        id v8 = *(void **)(a1 + 1136);
        *(void *)(a1 + 1136) = v7;

        [(id)a1 addChildViewController:*(void *)(a1 + 1136)];
        id v9 = [*(id *)(a1 + 1136) view];
        [v9 setAutoresizingMask:18];
        if (*(void *)(a1 + 1168))
        {
          [(id)a1 loadViewIfRequired];
          [*(id *)(a1 + 1120) bounds];
          objc_msgSend(v9, "setFrame:");
          int v10 = *(void **)(a1 + 1120);
          uint64_t v11 = [*(id *)(a1 + 1136) view];
          uint64_t v12 = v10;
          id v13 = v11;
        }
        else
        {
          BOOL v14 = [(id)a1 view];
          [v14 bounds];
          objc_msgSend(v9, "setFrame:");

          uint64_t v12 = [(id)a1 view];
          uint64_t v11 = v12;
          id v13 = v9;
        }
        [v12 addSubview:v13];

        [*(id *)(a1 + 1136) didMoveToParentViewController:a1];
        id v6 = *(void **)(a1 + 1136);
      }
      id v15 = [v6 view];
      [v15 setHidden:0];
    }
  }
}

- (void)_updateSearchSuggestionsListVisibility
{
}

- (void)_updateHasPendingSuggestionMenuRefreshFlagForReason:(int64_t)a3
{
  $D69225ED9BA803AE184F8CEF6B0C1DE3 controllerFlags = self->_controllerFlags;
  if ((*(_DWORD *)&controllerFlags & 0x10000) == 0)
  {
    switch(a3)
    {
      case 0:
      case 2:
      case 4:
        id WeakRetained = objc_loadWeakRetained((id *)&self->__navigationItemCurrentlyDisplayingSearchController);
        id v7 = [WeakRetained _navigationBar];
        id v8 = [v7 _viewControllerForAncestor];

        id v9 = [v8 _splitViewControllerEnforcingClass:1];
        int v10 = v9;
        if (a3)
        {
          uint64_t v11 = [(UISearchController *)self _suggestionController];
          int v12 = [v11 hasVisibleMenu];

          int v13 = [v10 _isExpanding];
          $D69225ED9BA803AE184F8CEF6B0C1DE3 v14 = self->_controllerFlags;
          if (v13 | ((unsigned __int16)(*(_WORD *)&v14 & 0x8000) >> 15)) {
            int v15 = 0x40000;
          }
          else {
            int v15 = 0x10000;
          }
          if (v13 | ((unsigned __int16)(*(_WORD *)&v14 & 0x8000) >> 15)) {
            int v16 = -262145;
          }
          else {
            int v16 = -65537;
          }
          if (!v12) {
            int v15 = 0;
          }
          $D69225ED9BA803AE184F8CEF6B0C1DE3 v17 = ($D69225ED9BA803AE184F8CEF6B0C1DE3)(v16 & *(_DWORD *)&v14 | v15);
          goto LABEL_13;
        }
        if ([v9 _isExpanding])
        {
          char isSuggestionsListViewControllerView = -[UISearchController _isSuggestionsListViewControllerViewUnhidden]((uint64_t)self);
          $D69225ED9BA803AE184F8CEF6B0C1DE3 v19 = self->_controllerFlags;
          if (isSuggestionsListViewControllerView)
          {
            int v20 = 0x40000;
LABEL_32:
            $D69225ED9BA803AE184F8CEF6B0C1DE3 v17 = ($D69225ED9BA803AE184F8CEF6B0C1DE3)(v20 | *(_DWORD *)&v19 & 0xFFFBFFFF);
LABEL_13:
            self->_$D69225ED9BA803AE184F8CEF6B0C1DE3 controllerFlags = v17;
            goto LABEL_14;
          }
          if ((*(_WORD *)&v19 & 0x8000) == 0)
          {
            int v20 = 0;
            goto LABEL_32;
          }
          id v7 = [(UISearchController *)self _suggestionController];
          if ([v7 hasVisibleMenu]) {
            int v32 = 0x40000;
          }
          else {
            int v32 = 0;
          }
          $D69225ED9BA803AE184F8CEF6B0C1DE3 v30 = ($D69225ED9BA803AE184F8CEF6B0C1DE3)(*(_DWORD *)&self->_controllerFlags & 0xFFFBFFFF | v32);
          goto LABEL_47;
        }
        int v29 = *(_DWORD *)&self->_controllerFlags & 0xC000;
        if (v29)
        {
          id v7 = [(UISearchController *)self searchSuggestions];
          if ([v7 count])
          {
            $D69225ED9BA803AE184F8CEF6B0C1DE3 v30 = ($D69225ED9BA803AE184F8CEF6B0C1DE3)(*(_DWORD *)&self->_controllerFlags | 0x10000);
LABEL_47:
            self->_$D69225ED9BA803AE184F8CEF6B0C1DE3 controllerFlags = v30;
LABEL_48:

            goto LABEL_14;
          }
        }
        if (-[UISearchController _isSuggestionsListViewControllerViewUnhidden]((uint64_t)self)) {
          int v31 = 0x10000;
        }
        else {
          int v31 = 0;
        }
        self->_$D69225ED9BA803AE184F8CEF6B0C1DE3 controllerFlags = ($D69225ED9BA803AE184F8CEF6B0C1DE3)(*(_DWORD *)&self->_controllerFlags & 0xFFFEFFFF | v31);
        if (v29) {
          goto LABEL_48;
        }
LABEL_14:

        break;
      case 1:
        goto LABEL_17;
      case 3:
        id v21 = [(UISearchController *)self searchBar];
        int v22 = [v21 isFirstResponder];

        unsigned int v23 = self->_controllerFlags;
        if (v22)
        {
          if ((v23 & 0xC000) != 0)
          {
            uint64_t v24 = [(UISearchController *)self searchSuggestions];
            uint64_t v25 = [v24 count];
            $D69225ED9BA803AE184F8CEF6B0C1DE3 v26 = self->_controllerFlags;
            int v27 = *(_DWORD *)&v26 | 0x10000;
            unsigned int v28 = *(_DWORD *)&v26 & 0xFFFEFFFF | (((*(unsigned int *)&v26 >> 18) & 1) << 16);
            if (v25) {
              unsigned int v28 = v27;
            }
            self->_$D69225ED9BA803AE184F8CEF6B0C1DE3 controllerFlags = ($D69225ED9BA803AE184F8CEF6B0C1DE3)v28;

            unsigned int v23 = self->_controllerFlags;
          }
          else
          {
            unsigned int v23 = v23 & 0xFFFEFFFF | (((v23 >> 18) & 1) << 16);
          }
        }
        self->_$D69225ED9BA803AE184F8CEF6B0C1DE3 controllerFlags = ($D69225ED9BA803AE184F8CEF6B0C1DE3)(v23 & 0xFFFBFFFF);
        if ((v23 & 0x10000) != 0)
        {
          id v33 = [(UIView *)self->_searchBar superview];
          [v33 setNeedsLayout];
        }
        return;
      default:
        return;
    }
  }
  if (a3 == 1)
  {
    $D69225ED9BA803AE184F8CEF6B0C1DE3 controllerFlags = self->_controllerFlags;
LABEL_17:
    self->_$D69225ED9BA803AE184F8CEF6B0C1DE3 controllerFlags = ($D69225ED9BA803AE184F8CEF6B0C1DE3)(*(_DWORD *)&controllerFlags & 0xFFFAFFFF);
  }
}

- (void)_requestPendingSuggestionMenuRefresh
{
  if (*((unsigned char *)&self->_controllerFlags + 2))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->__navigationItemCurrentlyDisplayingSearchController);
    int v4 = [WeakRetained _hasInlineSearchBar];

    if (v4)
    {
      char v5 = [(UISearchController *)self _suggestionController];
      id v6 = [(UISearchController *)self _searchSuggestionGroups];
      [v5 updateSuggestionGroups:v6 userInitiated:0];
    }
  }
  *(_DWORD *)&self->_controllerFlags &= ~0x10000u;
}

void __147__UISearchController__requestNavigationControllerObservingUpdateForSearchBar_visibilityChangedForSearchSuggestionsList_forSearchResultsController___block_invoke(uint64_t a1, id a2, void *a3)
{
  id v5 = a3;
  id v6 = *(void **)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  id v10 = v5;
  id v8 = a2;
  if (a2 == v5)
  {
    uint64_t v9 = 5;
  }
  else
  {
    [v6 _updateAndObserveScrollView:a2 viewController:v7 forEdges:1];
    id v6 = *(void **)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    id v8 = v10;
    uint64_t v9 = 4;
  }
  [v6 _updateAndObserveScrollView:v8 viewController:v7 forEdges:v9];
}

id __147__UISearchController__requestNavigationControllerObservingUpdateForSearchBar_visibilityChangedForSearchSuggestionsList_forSearchResultsController___block_invoke_2(uint64_t a1, int a2, int a3, void *a4, void *a5)
{
  if (a2)
  {
    *a4 = [*(id *)(*(void *)(a1 + 32) + 1168) _contentOrObservableScrollViewForEdge:1];
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = 1168;
  }
  else
  {
    if (!a3)
    {
      id v10 = (id *)(a1 + 40);
      *a4 = [*(id *)(a1 + 40) _contentOrObservableScrollViewForEdge:1];
      goto LABEL_7;
    }
    *a4 = [*(id *)(*(void *)(a1 + 32) + 1136) _contentOrObservableScrollViewForEdge:1];
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = 1136;
  }
  id v10 = (id *)(v8 + v9);
LABEL_7:
  id result = [*v10 _contentOrObservableScrollViewForEdge:4];
  *a5 = result;
  return result;
}

- (void)_setupForCurrentTraitCollection
{
  uint64_t v3 = [(UIViewController *)self traitCollection];
  if (v3)
  {
    int v4 = (void *)v3;
    id v5 = [(UIViewController *)self traitCollection];
    uint64_t v6 = [v5 userInterfaceIdiom];

    [(UISearchController *)self _uninstallBackGestureRecognizer];
    [(UISearchController *)self _uninstallDoneGestureRecognizer];
    if ((v6 == 8 || v6 == 2)
      && dyld_program_sdk_at_least()
      && (-[UISearchController _systemInputViewControllerAfterUpdate:](self, "_systemInputViewControllerAfterUpdate:", 0), uint64_t v7 = objc_claimAutoreleasedReturnValue(), v8 = [v7 resolvedKeyboardStyle], v7, v8 == 2))
    {
      [(UISearchController *)self _installBackGestureRecognizer];
      [(UISearchController *)self _installDoneGestureRecognizer];
      [(UISearchController *)self _removeCarPlayLimitedUIObserver];
    }
    else if ((v6 & 0xFFFFFFFFFFFFFFFELL) == 2)
    {
      uint64_t v9 = self;
      id v10 = v9;
      if (v9)
      {
        uint64_t v11 = v9;
        while ([(UIViewController *)v11 _transitionsChildViewControllers])
        {
          int v12 = [(UIViewController *)v11 parentViewController];
          int v13 = v12;
          if (v12)
          {
            $D69225ED9BA803AE184F8CEF6B0C1DE3 v14 = v12;
          }
          else
          {
            $D69225ED9BA803AE184F8CEF6B0C1DE3 v14 = [(UIViewController *)v11 presentingViewController];
          }
          int v15 = v14;

          uint64_t v11 = v15;
          if (!v15) {
            goto LABEL_17;
          }
        }
      }
      else
      {
LABEL_17:
        [(UISearchController *)v10 _installBackGestureRecognizer];
        uint64_t v11 = 0;
      }
      [(UISearchController *)v10 _installDoneGestureRecognizer];
      int v16 = [(UISearchController *)v10 _carPlayLimitedUIToken];
      $D69225ED9BA803AE184F8CEF6B0C1DE3 v17 = [(UIViewController *)v10 traitCollection];
      uint64_t v18 = [v17 userInterfaceIdiom];

      if (v18 != 3 || v16)
      {
        id v21 = [(UIViewController *)v10 traitCollection];
        uint64_t v22 = [v21 userInterfaceIdiom];

        if (v22 != 3 && v16) {
          [(UISearchController *)v10 _removeCarPlayLimitedUIObserver];
        }
      }
      else
      {
        objc_initWeak(&location, v10);
        $D69225ED9BA803AE184F8CEF6B0C1DE3 v19 = [MEMORY[0x1E4F28EB8] defaultCenter];
        int v20 = [MEMORY[0x1E4F28F08] mainQueue];
        uint64_t v23 = MEMORY[0x1E4F143A8];
        uint64_t v24 = 3221225472;
        uint64_t v25 = __53__UISearchController__setupForCurrentTraitCollection__block_invoke;
        $D69225ED9BA803AE184F8CEF6B0C1DE3 v26 = &unk_1E52DA728;
        objc_copyWeak(&v27, &location);
        int v16 = [v19 addObserverForName:@"UIScreenCarScreenLimitedUIDidChangeNotification" object:0 queue:v20 usingBlock:&v23];

        -[UISearchController _setCarPlayLimitedUIToken:](v10, "_setCarPlayLimitedUIToken:", v16, v23, v24, v25, v26);
        [(UISearchController *)v10 _limitedUIDidChangeAnimated:0];
        objc_destroyWeak(&v27);
        objc_destroyWeak(&location);
      }
    }
  }
  else
  {
    [(UISearchController *)self _uninstallBackGestureRecognizer];
    [(UISearchController *)self _uninstallDoneGestureRecognizer];
  }
}

void __53__UISearchController__setupForCurrentTraitCollection__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _limitedUIDidChangeAnimated:1];
}

- (void)_installBackGestureRecognizer
{
  if (!self->_backButtonDismissGestureRecognizer)
  {
    uint64_t v3 = [[UITapGestureRecognizer alloc] initWithTarget:self action:sel__handleBackButtonGesture_];
    backButtonDismissGestureRecognizer = self->_backButtonDismissGestureRecognizer;
    self->_backButtonDismissGestureRecognizer = v3;

    [(UITapGestureRecognizer *)self->_backButtonDismissGestureRecognizer setAllowedPressTypes:&unk_1ED3F0DF0];
    [(UIGestureRecognizer *)self->_backButtonDismissGestureRecognizer setDelegate:self];
  }
  id v5 = [(UIViewController *)self view];
  [v5 addGestureRecognizer:self->_backButtonDismissGestureRecognizer];
}

- (BOOL)_gestureRecognizerShouldBegin:(id)a3
{
  return 1;
}

- (void)_handleBackButtonGesture:(id)a3
{
  if ([a3 state] == 3)
  {
    BOOL v4 = +[UIView areAnimationsEnabled];
    [(UISearchController *)self _dismissPresentation:v4];
  }
}

- (void)_installDoneGestureRecognizer
{
  if (!self->_doneButtonGestureRecognizer)
  {
    uint64_t v3 = [[UITapGestureRecognizer alloc] initWithTarget:self action:sel__updateFocusFromDoneButton_];
    doneButtonGestureRecognizer = self->_doneButtonGestureRecognizer;
    self->_doneButtonGestureRecognizer = v3;

    [(UITapGestureRecognizer *)self->_doneButtonGestureRecognizer setAllowedPressTypes:&unk_1ED3F0E08];
  }
  id v5 = [(UIViewController *)self view];
  [v5 addGestureRecognizer:self->_doneButtonGestureRecognizer];
}

- (void)_updateFocusFromDoneButton:(id)a3
{
  if ([a3 state] == 3)
  {
    BOOL v4 = [(UIViewController *)self _focusSystem];
    id v5 = [v4 _focusedView];
    uint64_t v6 = [(UIViewController *)self->_systemInputViewController view];
    int v7 = [v5 isDescendantOfView:v6];

    if (v7)
    {
      *(_DWORD *)&self->_controllerFlags |= 0x800000u;
      [(UIViewController *)self setNeedsFocusUpdate];
    }
  }
}

- (void)_setCarPlayLimitedUIToken:(id)a3
{
}

- (id)_carPlayLimitedUIViewController
{
  return objc_getAssociatedObject(self, &kCarPlayLimitedUIViewControllerKey);
}

- (void)_setCarPlayLimitedUIViewController:(id)a3
{
}

- (void)_limitedUIDidChangeAnimated:(BOOL)a3
{
  BOOL v45 = a3;
  v58[4] = *MEMORY[0x1E4F143B8];
  BOOL v4 = [(UISearchController *)self _carPlayLimitedUIViewController];
  objc_initWeak(&location, self);
  id v5 = [(UIViewController *)self _screen];
  int v6 = [v5 _isSoftKeyboardLimited];

  int v7 = [(UIViewController *)self->_systemInputViewController view];
  [v7 setUserInteractionEnabled:v6 ^ 1u];

  uint64_t v8 = [(UISearchController *)self searchBar];
  uint64_t v9 = [v8 searchField];
  [v9 setUserInteractionEnabled:v6 ^ 1u];

  if (v6)
  {
    if (!v4)
    {
      BOOL v4 = objc_alloc_init(_UISearchControllerLimitedUIShieldViewController);
      v55[0] = MEMORY[0x1E4F143A8];
      v55[1] = 3221225472;
      v55[2] = __50__UISearchController__limitedUIDidChangeAnimated___block_invoke;
      v55[3] = &unk_1E52D9960;
      objc_copyWeak(&v56, &location);
      v55[4] = self;
      [(_UISearchControllerLimitedUIShieldViewController *)v4 setDismissAction:v55];
      [(UISearchController *)self _setCarPlayLimitedUIViewController:v4];
      [(UIViewController *)self addChildViewController:v4];
      id v10 = [(UIViewController *)v4 view];
      uint64_t v11 = [(UIViewController *)self view];
      [v11 bounds];
      objc_msgSend(v10, "setFrame:");

      int v12 = [(UIViewController *)self view];
      int v13 = [(UIViewController *)v4 view];
      [v12 addSubview:v13];

      [(UIViewController *)v4 didMoveToParentViewController:self];
      $D69225ED9BA803AE184F8CEF6B0C1DE3 v14 = [(UIViewController *)v4 view];
      [v14 setTranslatesAutoresizingMaskIntoConstraints:0];

      int v31 = (void *)MEMORY[0x1E4F5B268];
      v44 = [(UIViewController *)v4 view];
      uint64_t v42 = [v44 topAnchor];
      v43 = [(UIViewController *)self view];
      uint64_t v41 = [v43 topAnchor];
      v40 = [v42 constraintEqualToAnchor:v41];
      v58[0] = v40;
      v39 = [(UIViewController *)v4 view];
      id v37 = [v39 bottomAnchor];
      id v38 = [(UIViewController *)self view];
      v36 = [v38 bottomAnchor];
      v35 = [v37 constraintEqualToAnchor:v36];
      v58[1] = v35;
      v34 = [(UIViewController *)v4 view];
      int v32 = [v34 leadingAnchor];
      id v33 = [(UIViewController *)self view];
      int v15 = [v33 leadingAnchor];
      int v16 = [v32 constraintEqualToAnchor:v15];
      v58[2] = v16;
      $D69225ED9BA803AE184F8CEF6B0C1DE3 v17 = [(UIViewController *)v4 view];
      uint64_t v18 = [v17 trailingAnchor];
      $D69225ED9BA803AE184F8CEF6B0C1DE3 v19 = [(UIViewController *)self view];
      int v20 = [v19 trailingAnchor];
      id v21 = [v18 constraintEqualToAnchor:v20];
      v58[3] = v21;
      uint64_t v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v58 count:4];
      [v31 activateConstraints:v22];

      uint64_t v23 = [(UISearchController *)self searchBar];
      uint64_t v24 = [v23 cancelButton];
      [v24 setEnabled:0];

      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __50__UISearchController__limitedUIDidChangeAnimated___block_invoke_2;
      aBlock[3] = &unk_1E52DC3A0;
      void aBlock[4] = self;
      uint64_t v25 = _Block_copy(aBlock);
      $D69225ED9BA803AE184F8CEF6B0C1DE3 v26 = v25;
      if (v45)
      {
        id v27 = [(UIViewController *)v4 view];
        [v27 setAlpha:0.0];

        v51[0] = MEMORY[0x1E4F143A8];
        v51[1] = 3221225472;
        v51[2] = __50__UISearchController__limitedUIDidChangeAnimated___block_invoke_3;
        v51[3] = &unk_1E52D9F98;
        BOOL v52 = v4;
        int v53 = self;
        +[UIView animateWithDuration:v51 animations:v26 completion:0.4];
      }
      else
      {
        (*((void (**)(void *, uint64_t))v25 + 2))(v25, 1);
      }

      objc_destroyWeak(&v56);
    }
  }
  else if (v4)
  {
    unsigned int v28 = [(UISearchController *)self searchBar];
    [v28 setHidden:0];

    int v29 = [(UISearchController *)self searchBar];
    $D69225ED9BA803AE184F8CEF6B0C1DE3 v30 = [v29 cancelButton];
    [v30 setEnabled:1];

    v49[0] = MEMORY[0x1E4F143A8];
    v49[1] = 3221225472;
    v49[2] = __50__UISearchController__limitedUIDidChangeAnimated___block_invoke_4;
    v49[3] = &unk_1E52D9F98;
    v49[4] = self;
    v50 = v4;
    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = __50__UISearchController__limitedUIDidChangeAnimated___block_invoke_5;
    v46[3] = &unk_1E52DA660;
    BOOL v4 = v50;
    v47 = v4;
    uint64_t v48 = self;
    +[UIView animateWithDuration:v49 animations:v46 completion:0.4];
    [(UISearchController *)self _setCarPlayLimitedUIViewController:0];
    [(UIViewController *)self setNeedsFocusUpdate];
  }
  objc_destroyWeak(&location);
}

void __50__UISearchController__limitedUIDidChangeAnimated___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v2 = [*(id *)(a1 + 32) presentingViewController];
  uint64_t v3 = [v2 navigationController];

  if (v3)
  {
    [*(id *)(a1 + 32) _willDismissSearchController];
    BOOL v4 = [WeakRetained searchBar];
    id v5 = [v4 searchField];
    [v5 setText:0];

    int v6 = [WeakRetained searchBar];
    +[UISearchController _resignSearchBarAsFirstResponder:v6];

    int v7 = [WeakRetained presentingViewController];
    uint64_t v8 = [v7 navigationController];
    id v9 = (id)[v8 popViewControllerAnimated:1];

    [*(id *)(a1 + 32) _didDismissSearchController];
  }
  else
  {
    [WeakRetained setActive:0];
  }
}

void __50__UISearchController__limitedUIDidChangeAnimated___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) searchBar];
  [v2 setHidden:1];

  uint64_t v3 = [*(id *)(a1 + 32) view];
  BOOL v4 = [*(id *)(a1 + 32) searchBar];
  id v5 = [*(id *)(a1 + 32) view];
  int v6 = [v5 window];
  id v9 = [v3 _firstCommonAncestorToView:v4 givenCommonAncestor:v6];

  int v7 = v9;
  if (!v9)
  {
    uint64_t v8 = [*(id *)(a1 + 32) searchBar];
    [v8 setNeedsFocusUpdate];

    int v7 = *(void **)(a1 + 32);
  }
  [v7 setNeedsFocusUpdate];
}

void __50__UISearchController__limitedUIDidChangeAnimated___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) view];
  [v2 setAlpha:1.0];

  id v3 = [*(id *)(a1 + 40) searchBar];
  [v3 setAlpha:0.0];
}

void __50__UISearchController__limitedUIDidChangeAnimated___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) searchBar];
  [v2 setAlpha:1.0];

  id v3 = [*(id *)(a1 + 40) view];
  [v3 setAlpha:0.0];
}

void __50__UISearchController__limitedUIDidChangeAnimated___block_invoke_5(uint64_t a1)
{
  [*(id *)(a1 + 32) willMoveToParentViewController:0];
  uint64_t v2 = [*(id *)(a1 + 32) view];
  [v2 removeFromSuperview];

  [*(id *)(a1 + 32) removeFromParentViewController];
  id v3 = [*(id *)(a1 + 40) searchBar];
  [v3 becomeFirstResponder];
}

- (id)focusItemContainer
{
  id v3 = [(UISearchController *)self _carPlayLimitedUIViewController];
  BOOL v4 = [v3 view];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)UISearchController;
    id v6 = [(UIViewController *)&v9 focusItemContainer];
  }
  int v7 = v6;

  return v7;
}

- (BOOL)_allowFormSheetStylePresentation
{
  return (self->_barPresentationStyle & 0xFFFFFFFE) == 2;
}

- (void)_updateBarPresentationStyleForPresentingViewController:(id)a3
{
  id v9 = a3;
  BOOL v4 = [(UISearchController *)self searchBar];
  id v5 = [v4 window];

  if (v5)
  {
    id v6 = [(UISearchController *)self searchBar];
    BOOL v7 = +[_UISearchPresentationController shouldExciseSearchBar:v6 duringPresentationWithPresenter:v9];

    if (v7) {
      int v8 = 1;
    }
    else {
      int v8 = 2;
    }
  }
  else
  {
    int v8 = 3;
  }
  self->_barPresentationStyle = v8;
}

- (id)_presentationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  [(UISearchController *)self _updateBarPresentationStyleForPresentingViewController:v10];
  UIModalPresentationStyle v12 = [(UIViewController *)self modalPresentationStyle];
  if (v12 == UIModalPresentationFormSheet)
  {
    if ([(UISearchController *)self _allowFormSheetStylePresentation]) {
      UIModalPresentationStyle v12 = UIModalPresentationFormSheet;
    }
    else {
      UIModalPresentationStyle v12 = UIModalPresentationCustom;
    }
  }
  int v13 = [v11 traitCollection];
  if ([v13 userInterfaceIdiom] == 2)
  {

LABEL_8:
    int v16 = [(_UISearchPresentationController *)[_UISearchATVPresentationController alloc] initWithPresentedViewController:v9 presentingViewController:v10];
    int v17 = 4;
LABEL_9:
    self->_barPresentationStyle = v17;
    goto LABEL_10;
  }
  $D69225ED9BA803AE184F8CEF6B0C1DE3 v14 = [v11 traitCollection];
  uint64_t v15 = [v14 userInterfaceIdiom];

  if (v15 == 8) {
    goto LABEL_8;
  }
  int v20 = [v11 traitCollection];
  uint64_t v21 = [v20 userInterfaceIdiom];

  if (v21 == 3)
  {
    int v16 = [(_UISearchPresentationController *)[_UISearchCarPlayPresentationController alloc] initWithPresentedViewController:v9 presentingViewController:v10];
    int v17 = 5;
    goto LABEL_9;
  }
  switch(v12)
  {
    case UIModalPresentationFormSheet:
      uint64_t v22 = _UISearchFormSheetPresentationController;
      goto LABEL_21;
    case UIModalPresentationPopover:
      uint64_t v22 = _UISearchPopoverPresentationController;
      goto LABEL_21;
    case UIModalPresentationCustom:
      uint64_t v22 = _UISearchPresentationController;
LABEL_21:
      int v16 = (_UISearchATVPresentationController *)[[v22 alloc] initWithPresentedViewController:v9 presentingViewController:v10];
      goto LABEL_10;
  }
  uint64_t v23 = [MEMORY[0x1E4F28B00] currentHandler];
  [v23 handleFailureInMethod:a2, self, @"UISearchController.m", 2398, @"UISearchController only supports modal presentation styles UIModalPresentationPopover, UIModalPresentationFormSheet and UIModalPresentationCustom" object file lineNumber description];

  int v16 = 0;
LABEL_10:
  uint64_t v18 = [(UISearchController *)self searchBar];
  [(UISearchController *)self _updateVisibilityOfSearchResultsForSearchBar:v18];

  return v16;
}

- (id)_searchPresentationController
{
  id v3 = [(UIViewController *)self _parentModalViewController];

  if (v3)
  {
    BOOL v4 = [(UIViewController *)self _parentModalViewController];
    id v5 = [v4 _originalPresentationController];
  }
  else
  {
    id v5 = 0;
  }
  id v6 = [v5 adaptivePresentationController];

  if (v6)
  {
    uint64_t v7 = [v5 adaptivePresentationController];

    id v5 = (void *)v7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {

          id v5 = 0;
        }
      }
    }
  }
  return v5;
}

- (id)_animatorForBarPresentationStyle:(int)a3 dismissing:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = self;
  int v8 = [(UISearchController *)v7 searchBar];
  id v9 = [v8 _searchController];

  if (v9 != v7)
  {
    if (dyld_program_sdk_at_least())
    {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"Custom searchBar not correctly configured for UISearchController. The searchBar property getter override must always return the same searchBar instance, and never return nil. The getter may be called very early! searchBar = %@, searchController = %@", v8, v7 format];
    }
    else
    {
      if (os_variant_has_internal_diagnostics())
      {
        uint64_t v18 = __UIFaultDebugAssertLog();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412546;
          int v20 = v8;
          __int16 v21 = 2112;
          uint64_t v22 = v7;
          _os_log_fault_impl(&dword_1853B0000, v18, OS_LOG_TYPE_FAULT, "Custom searchBar not correctly configured for UISearchController. The searchBar property getter override must always return the same searchBar instance, and never return nil. The getter may be called very early! searchBar = %@, searchController = %@", buf, 0x16u);
        }
      }
      else
      {
        id v10 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_handleOrThrowForDisconnectedSearchBarAsAppropriate___s_category)+ 8);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          int v20 = v8;
          __int16 v21 = 2112;
          uint64_t v22 = v7;
          _os_log_impl(&dword_1853B0000, v10, OS_LOG_TYPE_ERROR, "Custom searchBar not correctly configured for UISearchController. The searchBar property getter override must always return the same searchBar instance, and never return nil. The getter may be called very early! searchBar = %@, searchController = %@", buf, 0x16u);
        }
      }
      [v8 _setRequiresLegacyVisualProvider];
      id v11 = _UIMainBundleIdentifier();
      int v12 = [v11 isEqualToString:@"com.spotify.client"];

      if (v12)
      {
        int v13 = [v8 backgroundImageForBarPosition:2 barMetrics:0];
        [v8 setBackgroundImage:v13 forBarPosition:2 barMetrics:101];
      }
    }
  }

  switch(a3)
  {
    case 1:
      $D69225ED9BA803AE184F8CEF6B0C1DE3 v14 = _UISearchControllerTransplantSearchBarAnimator;
      goto LABEL_18;
    case 2:
      $D69225ED9BA803AE184F8CEF6B0C1DE3 v14 = _UISearchControllerInPlaceSearchBarAnimator;
      goto LABEL_18;
    case 3:
      $D69225ED9BA803AE184F8CEF6B0C1DE3 v14 = _UISearchControllerOffscreenSearchBarAnimator;
      goto LABEL_18;
    case 4:
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"presentationStyle is _UISearchBarPresentationStyleATV, but we're not on tvOS. This is not supported." format];
      goto LABEL_16;
    case 5:
      $D69225ED9BA803AE184F8CEF6B0C1DE3 v14 = _UISearchControllerCarPlaySearchBarAnimator;
LABEL_18:
      id v16 = objc_alloc_init(v14);
      break;
    default:
      if (v4)
      {
        uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
        [v15 handleFailureInMethod:a2 object:v7 file:@"UISearchController.m" lineNumber:2487 description:@"How did we get here? Was state restoration involved?"];
      }
LABEL_16:
      id v16 = 0;
      break;
  }
  return v16;
}

- (id)_defaultAnimationController
{
  if (dyld_program_sdk_at_least())
  {
    uint64_t barPresentationStyle = self->_barPresentationStyle;
    if (!barPresentationStyle)
    {
      [(UISearchController *)self _updateBarPresentationStyleForPresentingViewController:0];
      uint64_t barPresentationStyle = self->_barPresentationStyle;
    }
    BOOL v4 = [(UISearchController *)self _animatorForBarPresentationStyle:barPresentationStyle dismissing:1];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)UISearchController;
    BOOL v4 = [(UIViewController *)&v6 _defaultAnimationController];
  }
  return v4;
}

- (id)animationControllerForDismissedController:(id)a3
{
  BOOL v4 = [(UISearchController *)self _animatorForBarPresentationStyle:self->_barPresentationStyle dismissing:1];
  animator = self->_animator;
  self->_animator = v4;

  return self;
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  -[UISearchController _animatorForBarPresentationStyle:dismissing:](self, "_animatorForBarPresentationStyle:dismissing:", self->_barPresentationStyle, 0, a5);
  objc_super v6 = (UIViewControllerAnimatedTransitioning *)objc_claimAutoreleasedReturnValue();
  animator = self->_animator;
  self->_animator = v6;

  return self;
}

- (double)transitionDuration:(id)a3
{
  [(UIViewControllerAnimatedTransitioning *)self->_animator transitionDuration:a3];
  return result;
}

- (void)animateTransition:(id)a3
{
}

- (BOOL)_requiresCustomPresentationController
{
  return 1;
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UISearchController;
  [(UIViewController *)&v9 viewDidMoveToWindow:v6 shouldAppearOrDisappear:v4];
  if (v6 && !v4)
  {
    if ([(UIViewController *)self _appearState] == 2)
    {
      uint64_t v7 = [v6 windowScene];
      int64_t v8 = [v7 interfaceOrientation];

      if (self->_lastKnownInterfaceOrientation != v8)
      {
        if (self->_managedPalette) {
          [(UISearchController *)self _adjustSearchBarSizeForOrientation:v8];
        }
        self->_lastKnownInterfaceOrientation = v8;
      }
    }
    goto LABEL_9;
  }
  if (v6) {
LABEL_9:
  }
    [(UISearchController *)self _setupForCurrentTraitCollection];
}

- (void)viewDidLayoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)UISearchController;
  [(UIViewController *)&v4 viewDidLayoutSubviews];
  id v3 = [(UISearchController *)self _animatorForBarPresentationStyle:self->_barPresentationStyle dismissing:0];
  [(UISearchController *)self _updateKeyboardFocusGuidesForAnimator:v3];
  [v3 didRelayoutSearchBarForController:self];
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)UISearchController;
  [(UIViewController *)&v16 willTransitionToTraitCollection:v6 withTransitionCoordinator:v7];
  if (v7)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->__navigationItemCurrentlyDisplayingSearchController);
    if ([WeakRetained _hasInlineSearchBar])
    {
      uint64_t v9 = [v6 horizontalSizeClass];
      id v10 = [(UIViewController *)self traitCollection];
      uint64_t v11 = [v10 horizontalSizeClass];

      if (v9 != v11)
      {
        int v12 = [(UISearchController *)self _dci_searchSuggestions];
        if ([v12 count])
        {
          int v13 = [(UISearchController *)self _suggestionController];
          if ([v13 hasVisibleMenu]) {
            int v14 = 0;
          }
          else {
            int v14 = 0x20000;
          }
          self->_$D69225ED9BA803AE184F8CEF6B0C1DE3 controllerFlags = ($D69225ED9BA803AE184F8CEF6B0C1DE3)(*(_DWORD *)&self->_controllerFlags & 0xFFFDFFFF | v14);
        }
        else
        {
          *(_DWORD *)&self->_controllerFlags &= ~0x20000u;
        }

        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __80__UISearchController_willTransitionToTraitCollection_withTransitionCoordinator___block_invoke;
        v15[3] = &unk_1E52DA598;
        v15[4] = self;
        [v7 animateAlongsideTransition:0 completion:v15];
      }
    }
    else
    {
    }
  }
}

uint64_t __80__UISearchController_willTransitionToTraitCollection_withTransitionCoordinator___block_invoke(uint64_t result)
{
  *(_DWORD *)(*(void *)(result + 32) + 1052) &= ~0x20000u;
  return result;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  int64_t v8 = [(UIViewController *)self view];
  uint64_t v9 = [v8 _window];
  int64_t v10 = [v9 _toWindowOrientation];

  uint64_t v11 = [(UISearchController *)self _managedPalette];
  if (v11 && [(UISearchController *)self isActive])
  {
    [v11 frame];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __73__UISearchController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
    v17[3] = &unk_1E5303EC0;
    v17[4] = self;
    v17[5] = v10;
    v17[6] = v12;
    v17[7] = v13;
    v17[8] = v14;
    v17[9] = v15;
    [v7 animateAlongsideTransition:v17 completion:0];
    if (!v10) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  [(UISearchController *)self _adjustSearchBarSizeForOrientation:v10];
  if (v10) {
LABEL_6:
  }
    self->_lastKnownInterfaceOrientation = v10;
LABEL_7:
  v16.receiver = self;
  v16.super_class = (Class)UISearchController;
  -[UIViewController viewWillTransitionToSize:withTransitionCoordinator:](&v16, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);

  [(UISearchController *)self _updateHasPendingSuggestionMenuRefreshFlagForReason:2];
}

uint64_t __73__UISearchController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_adjustSearchBarSizeForOrientation:oldPaletteFrame:", *(void *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
}

- (BOOL)_containedInNavigationPaletteAndNotHidden
{
  return 0;
}

- (void)_adjustSearchBarSizeForOrientation:(int64_t)a3
{
}

- (void)_adjustSearchBarSizeForOrientation:(int64_t)a3 oldPaletteFrame:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  if (![(UISearchController *)self _containedInNavigationPaletteAndNotHidden])return; {
  int64_t v10 = [(UISearchController *)self searchBar];
  }
  uint64_t v11 = [v10 prompt];
  if (v11)
  {
    uint64_t v12 = (void *)v11;
    uint64_t v13 = [(UISearchController *)self searchBar];
    char v14 = [v13 _scopeBarIsVisible];

    if (v14) {
      return;
    }
  }
  else
  {
  }
  uint64_t v15 = [(UISearchController *)self searchBar];
  objc_opt_class();
  if (v15)
  {
    objc_super v16 = v15;
    do
    {
      if (objc_opt_isKindOfClass()) {
        break;
      }
      objc_super v16 = (void *)[v16 superview];
    }
    while (v16);
  }
  else
  {
    objc_super v16 = 0;
  }
  id v45 = v16;

  int v17 = [(UISearchController *)self searchBar];
  [v17 _defaultHeightForOrientation:a3];
  double v19 = v18;

  int v20 = [(UISearchController *)self searchBar];
  [v20 size];
  double v22 = v21;

  uint64_t v23 = v45;
  if (v22 != v19)
  {
    v47.origin.CGFloat x = x;
    v47.origin.CGFloat y = y;
    v47.size.CGFloat width = width;
    v47.size.CGFloat height = height;
    BOOL IsNull = CGRectIsNull(v47);
    if (IsNull)
    {
      [v45 frame];
      CGFloat v25 = CGRectGetHeight(v48);
      $D69225ED9BA803AE184F8CEF6B0C1DE3 v26 = v45;
      double v43 = v19 - v25;
      double v44 = 0.0;
    }
    else
    {
      double v43 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
      double v44 = *MEMORY[0x1E4F1DB30];
      $D69225ED9BA803AE184F8CEF6B0C1DE3 v26 = v45;
    }
    [v26 frame];
    double v28 = v27;
    double v30 = v29;
    int v31 = [v45 superview];
    [v31 bounds];
    double v33 = v32;

    objc_msgSend(v45, "setFrame:", v28, v30, v33, v19);
    v34 = [(UISearchController *)self searchBar];
    [v45 bounds];
    objc_msgSend(v34, "setFrame:");

    v35 = [(UISearchController *)self searchBar];
    [v35 setNeedsLayout];

    v36 = [(UISearchController *)self searchBar];
    [v36 layoutIfNeeded];

    BOOL v37 = [(UISearchController *)self isActive];
    uint64_t v23 = v45;
    if (v37)
    {
      if (IsNull)
      {
        if ([(UISearchController *)self _resultsControllerWillLayoutVisibleUnderContainerView])
        {
          double v39 = v43;
          double v38 = v44;
LABEL_21:
          -[UISearchController _updateSearchResultsContentScrollViewWithDelta:](self, "_updateSearchResultsContentScrollViewWithDelta:", v38, v39);
LABEL_27:
          [(UIViewController *)self _updateContentOverlayInsetsFromParentIfNecessary];
          [(UIViewController *)self _updateContentOverlayInsetsForSelfAndChildren];
          uint64_t v23 = v45;
          goto LABEL_28;
        }
        if (self->_managedPalette)
        {
          v51.origin.CGFloat x = v28;
          v51.origin.CGFloat y = v30;
          v51.size.CGFloat width = v33;
          v51.size.CGFloat height = v19;
          double MaxY = CGRectGetMaxY(v51);
          [(UIView *)self->_resultsControllerViewContainer frame];
          double v39 = MaxY - CGRectGetMinY(v52);
        }
        else
        {
          double v39 = v43;
        }
        double v38 = v44;
      }
      else
      {
        v49.origin.CGFloat x = v28;
        v49.origin.CGFloat y = v30;
        v49.size.CGFloat width = v33;
        v49.size.CGFloat height = v19;
        double v40 = CGRectGetMaxY(v49);
        v50.origin.CGFloat x = x;
        v50.origin.CGFloat y = y;
        v50.size.CGFloat width = width;
        v50.size.CGFloat height = height;
        double v39 = v40 - CGRectGetMaxY(v50);
        BOOL v41 = [(UISearchController *)self _resultsControllerWillLayoutVisibleUnderContainerView];
        double v38 = 0.0;
        if (v41) {
          goto LABEL_21;
        }
      }
      -[UISearchController _resizeResultsControllerWithDelta:](self, "_resizeResultsControllerWithDelta:", v38, v39);
      goto LABEL_27;
    }
  }
LABEL_28:
}

- (void)_updateSearchResultsContentScrollViewWithDelta:(CGSize)a3
{
  double height = a3.height;
  id v5 = -[UIViewController _contentOrObservableScrollViewForEdge:](self->_searchResultsController, "_contentOrObservableScrollViewForEdge:", 1, a3.width);
  id v6 = v5;
  if (v5)
  {
    uint64_t v24 = v5;
    uint64_t v7 = [v5 _compatibleContentInsetAdjustmentBehavior];
    id v6 = v24;
    if (v7 == 101)
    {
      searchResultsController = self->_searchResultsController;
      if (searchResultsController)
      {
        BOOL v9 = [(UIViewController *)searchResultsController automaticallyAdjustsScrollViewInsets];
        id v6 = v24;
        if (v9)
        {
          char v10 = [(UIViewController *)self->_searchResultsController edgesForExtendedLayout];
          id v6 = v24;
          if (v10)
          {
            [v24 contentOffset];
            double v12 = v11;
            double v14 = v13;
            [v24 contentInset];
            double v16 = v15;
            double v18 = v17;
            double v20 = v19;
            double v21 = v14 - height;
            double v23 = height + v22;
            objc_msgSend(v24, "setContentOffset:", v12, v21);
            objc_msgSend(v24, "setContentInset:", v23, v16, v18, v20);
            id v6 = v24;
          }
        }
      }
    }
  }
}

- (void)_updateSearchResultsPositionWithDelta:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if (![(UISearchController *)self _resultsControllerWillLayoutVisibleUnderContainerView])
  {
    -[UISearchController _resizeResultsControllerWithDelta:](self, "_resizeResultsControllerWithDelta:", width, height);
  }
}

- (void)_updateSearchResultsControllerWithDelta:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  -[UISearchController _updateSearchResultsContentScrollViewWithDelta:](self, "_updateSearchResultsContentScrollViewWithDelta:");
  -[UISearchController _updateSearchResultsPositionWithDelta:](self, "_updateSearchResultsPositionWithDelta:", width, height);
}

- (BOOL)isBeingDismissed
{
  if (dyld_program_sdk_at_least() && (*((unsigned char *)&self->_controllerFlags + 2) & 8) != 0) {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)UISearchController;
  return [(UIViewController *)&v4 isBeingDismissed];
}

- (void)_presentingViewControllerWillChange:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)UISearchController;
  [(UIViewController *)&v24 _presentingViewControllerWillChange:v4];
  if (![(UIViewController *)self isBeingPresented]) {
    goto LABEL_21;
  }
  [(UISearchController *)self _sizeSearchViewToPresentingViewController:v4];
  [(UISearchController *)self _beginWatchingPresentingController];
  id v5 = [(UISearchController *)self _locatePresentingViewControllerIfInManagedPaletteOrHostedByNavigationBar];
  id v6 = v5;
  if (v5)
  {
    if (([v5 definesPresentationContext] & 1) == 0)
    {
      uint64_t v7 = *(NSObject **)(__UILogGetCategoryCachedImpl("Search", &_presentingViewControllerWillChange____s_category) + 8);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        $D69225ED9BA803AE184F8CEF6B0C1DE3 v26 = v6;
        __int16 v27 = 2112;
        double v28 = self;
        _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_ERROR, "The topViewController (%@) of the navigation controller containing the presented search controller (%@) must have definesPresentationContext set to YES.", buf, 0x16u);
      }
    }
  }
  int64_t v8 = [(UISearchController *)self searchResultsController];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_9;
  }
  BOOL v9 = [(UISearchController *)self searchResultsController];
  char v10 = [v9 topViewController];
  double v11 = [v10 _existingView];

  if (!v11)
  {
    int64_t v8 = [(UISearchController *)self searchResultsController];
    double v12 = [v8 view];
    [v12 layoutSubviews];

LABEL_9:
  }
  double v13 = [(UISearchController *)self searchBar];
  [v13 _setScopeBarPosition:0];

  double v14 = [v4 _splitViewControllerEnforcingClass:0];
  double v15 = v14;
  if (v14)
  {
    if ([v14 isCollapsed])
    {
      BOOL v16 = 0;
    }
    else
    {
      double v17 = [v15 masterViewController];
      -[UIViewController _parentViewController]((id *)v4);
      double v18 = (id *)objc_claimAutoreleasedReturnValue();
      while (1)
      {
        BOOL v16 = v18 != v17;
        if (v18 == v17) {
          break;
        }
        uint64_t v19 = -[UIViewController _parentViewController](v18);

        double v18 = (id *)v19;
        if (!v19)
        {
          double v20 = 0;
          goto LABEL_19;
        }
      }
      double v20 = v17;
LABEL_19:
    }
  }
  else
  {
    BOOL v16 = 1;
  }
  double v21 = [(UISearchController *)self searchBar];
  [v21 _setAllowsInlineScopeBar:v16];

LABEL_21:
  if ([(UISearchController *)self isBeingDismissed])
  {
    [(UISearchController *)self _endWatchingPresentingController];
    double v22 = [(UISearchController *)self searchResultsUpdater];
    [v22 updateSearchResultsForSearchController:self];

    if ([(UIViewController *)self modalPresentationStyle] == UIModalPresentationPopover)
    {
      double v23 = [(UISearchController *)self searchBar];
      +[UISearchController _resignSearchBarAsFirstResponder:v23];
    }
  }
}

- (void)_presentingViewControllerDidChange:(id)a3
{
  animator = self->_animator;
  self->_animator = 0;
  id v5 = a3;

  if (!v5) {
    self->_uint64_t barPresentationStyle = 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)UISearchController;
  [(UIViewController *)&v6 _presentingViewControllerDidChange:v5];
}

- (UIEdgeInsets)_edgeInsetsForChildViewController:(id)a3 insetsAreAbsolute:(BOOL *)a4
{
  id v6 = a3;
  if ([(UISearchController *)self isActive]
    && ([v6 presentedViewController],
        uint64_t v7 = (UISearchController *)objc_claimAutoreleasedReturnValue(),
        v7,
        v7 == self))
  {
    double v15 = 0.0;
    double Height = 0.0;
    if (*(unsigned char *)&self->_controllerFlags)
    {
      [(UIView *)self->_searchBar frame];
      double Height = CGRectGetHeight(v23);
      double v20 = [v6 _contentOrObservableScrollViewForEdge:1];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        double v21 = [v20 tableHeaderView];
        [v21 frame];
        double Height = Height - CGRectGetHeight(v24);
      }
    }
    if (a4) {
      *a4 = 0;
    }
    double v13 = 0.0;
    double v11 = 0.0;
  }
  else
  {
    v22.receiver = self;
    v22.super_class = (Class)UISearchController;
    [(UIViewController *)&v22 _edgeInsetsForChildViewController:v6 insetsAreAbsolute:a4];
    double Height = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
  }

  double v16 = Height;
  double v17 = v11;
  double v18 = v13;
  double v19 = v15;
  result.right = v19;
  result.bottom = v18;
  result.left = v17;
  result.top = v16;
  return result;
}

- (BOOL)_searchbarWasTableHeaderView
{
  return *(_DWORD *)&self->_controllerFlags & 1;
}

+ (void)_resignSearchBarAsFirstResponder:(id)a3
{
  id v3 = a3;
  [v3 resignFirstResponder];
  id v5 = [v3 keyboardSceneDelegate];
  id v4 = [v3 searchField];

  [v5 _clearPreservedInputViewsWithRestorableResponder:v4];
}

- (void)_updateTableHeaderBackgroundViewInTableView:(id)a3 amountScrolledUnder:(double)a4
{
  id v10 = a3;
  id v5 = [v10 _tableHeaderBackgroundView];
  if (v5)
  {
    if ([v10 _usingCustomBackgroundView])
    {
      [v10 setTableHeaderBackgroundColor:0];
    }
    else
    {
      int v6 = [v5 isHidden];
      if (a4 >= 0.0)
      {
        if ((v6 & 1) == 0) {
          [v5 setHidden:1];
        }
      }
      else
      {
        if (v6) {
          [v5 setHidden:0];
        }
        [v10 bounds];
        objc_msgSend(v5, "setFrame:");
        uint64_t v7 = [v10 _refreshControl];
        double v8 = [v7 backgroundColor];
        if (v8) {
          [v7 backgroundColor];
        }
        else {
        BOOL v9 = [v10 tableHeaderBackgroundColor];
        }
        [v5 setBackgroundColor:v9];
      }
    }
  }
}

- (void)_updateSearchBarMaskIfNecessary
{
  id v3 = [(UISearchController *)self searchBar];
  id v4 = [v3 window];

  if (!v4) {
    return;
  }
  id v5 = [(UISearchController *)self searchBar];
  int v6 = [v5 _containingScrollView];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v35 = v6;
    uint64_t v7 = [v35 _refreshControl];
    if (!v6) {
      goto LABEL_16;
    }
LABEL_7:
    double v8 = [(UISearchController *)self searchBar];
    [v8 bounds];
    double Height = CGRectGetHeight(v37);

    [v6 _effectiveContentInset];
    double v11 = v10;
    [v6 contentOffset];
    double v13 = v11 + v12;
    double v14 = [(UISearchController *)self searchBar];
    [v14 frame];
    double v16 = v13 - v15;

    if (v7 && ([v7 refreshControlState] == 2 || objc_msgSend(v7, "refreshControlState") == 3))
    {
      [v7 _refreshControlHeight];
      double v16 = v16 - v17;
    }
    double v18 = [(UISearchController *)self searchBar];
    [v18 _currentScreenScale];
    double v20 = 1.0 / v19;

    double v21 = v16 + v20;
    objc_super v22 = [(UISearchController *)self searchBar];
    [v22 bounds];
    double v24 = v23;
    double v26 = v25;
    double Width = v27;
    double v30 = v29;

    if (v21 <= Height)
    {
      if (v21 > 0.0)
      {
        v39.origin.CGFloat x = v24;
        v39.origin.CGFloat y = v26;
        v39.size.double width = Width;
        v39.size.double height = v30;
        double Width = CGRectGetWidth(v39);
        double v30 = Height - v21;
        double v24 = 0.0;
        double v26 = v21;
      }
    }
    else
    {
      double v31 = *MEMORY[0x1E4F1DB28];
      double v32 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
      double v33 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
      v38.origin.CGFloat x = v24;
      v38.origin.CGFloat y = v26;
      v38.size.double width = Width;
      v38.size.double height = v30;
      double Width = CGRectGetWidth(v38);
      double v24 = v31;
      double v26 = v32;
      double v30 = v33;
    }
    v34 = [(UISearchController *)self searchBar];
    objc_msgSend(v34, "_setMaskBounds:", v24, v26, Width, v30);

    [(UISearchController *)self _updateTableHeaderBackgroundViewInTableView:v35 amountScrolledUnder:v21];
    goto LABEL_16;
  }
  uint64_t v7 = 0;
  id v35 = 0;
  if (v6) {
    goto LABEL_7;
  }
LABEL_16:
}

- (void)_watchScrollView:(id)a3 forScrolling:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  didScrollDelegate = self->_didScrollDelegate;
  double v12 = v6;
  if (!v4)
  {
    double v8 = [(_UISearchControllerDidScrollDelegate *)didScrollDelegate scrollView];
    [v8 _removeScrollViewScrollObserver:self->_didScrollDelegate];

    BOOL v9 = self->_didScrollDelegate;
    self->_didScrollDelegate = 0;

LABEL_8:
    id v6 = v12;
    goto LABEL_9;
  }
  if (!didScrollDelegate)
  {
    double v10 = objc_alloc_init(_UISearchControllerDidScrollDelegate);
    double v11 = self->_didScrollDelegate;
    self->_didScrollDelegate = v10;

    [(_UISearchControllerDidScrollDelegate *)self->_didScrollDelegate setController:self];
    id v6 = v12;
    if (!v12) {
      goto LABEL_9;
    }
    goto LABEL_7;
  }
  if (v6)
  {
LABEL_7:
    [(_UISearchControllerDidScrollDelegate *)self->_didScrollDelegate setScrollView:v12];
    [v12 _addScrollViewScrollObserver:self->_didScrollDelegate];
    goto LABEL_8;
  }
LABEL_9:
}

- (void)_beginWatchingPresentingController
{
  id v3 = [(UIViewController *)self presentingViewController];
  id v5 = [v3 navigationController];

  if (v5)
  {
    BOOL v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 addObserver:self selector:sel__navigationControllerWillShowViewController_ name:0x1ED10DD40 object:v5];
  }
}

- (void)_endWatchingPresentingController
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:0x1ED10DD40 object:0];
}

- (void)_navigationControllerWillShowViewController:(id)a3
{
  id v4 = a3;
  id v5 = [v4 object];
  id v6 = [v4 userInfo];
  uint64_t v7 = [v6 objectForKey:0x1ED10DDA0];

  double v8 = [v4 userInfo];

  BOOL v9 = [v8 objectForKey:0x1ED10DDC0];

  double v10 = [v7 presentedViewController];

  if (v10 == self)
  {
    if (-[UISearchController _hidesNavigationBarDuringPresentationRespectingInlineSearch](self, "_hidesNavigationBarDuringPresentationRespectingInlineSearch")&& [v5 isNavigationBarHidden])
    {
      if ([(UISearchController *)self isActive] && v9)
      {
        double v11 = [(UISearchController *)self _managedPalette];
        [v11 setIgnoreGeometryChanges:1];
      }
      [v5 setNavigationBarHidden:0 animated:1];
      [v5 _setSearchHidNavigationBar:0];
      double v12 = [(UISearchController *)self _managedPalette];
      [v12 setIgnoreGeometryChanges:0];
    }
    double v13 = [(UIViewController *)self traitCollection];
    uint64_t v14 = [v13 userInterfaceIdiom];

    if (v14 == 3)
    {
      *(_DWORD *)&self->_controllerFlags |= 2u;
    }
    else
    {
      double v15 = [(UISearchController *)self searchBar];
      if ([v15 isFirstResponder]) {
        int v16 = 2;
      }
      else {
        int v16 = 0;
      }
      self->_$D69225ED9BA803AE184F8CEF6B0C1DE3 controllerFlags = ($D69225ED9BA803AE184F8CEF6B0C1DE3)(*(_DWORD *)&self->_controllerFlags & 0xFFFFFFFD | v16);
    }
    double v17 = [(UISearchController *)self searchBar];
    +[UISearchController _resignSearchBarAsFirstResponder:v17];
  }
  double v18 = [v9 presentedViewController];

  if (v18 == self)
  {
    double v19 = [(UISearchController *)self searchBar];
    int v20 = [v19 _containedInNavigationPalette];

    if (v20)
    {
      double v21 = [v5 existingPaletteForEdge:2];
      [v21 setVisibleWhenPinningBarIsHidden:1];
    }
    objc_super v22 = [v9 navigationItem];
    double v23 = [v22 _searchControllerIfAllowed];

    if (!v23)
    {
      if ([(UISearchController *)self _hidesNavigationBarDuringPresentationRespectingInlineSearch])
      {
        if (([v5 isNavigationBarHidden] & 1) == 0)
        {
          if (![v5 isInteractiveTransition]
            || (_UIMainBundleIdentifier(),
                double v24 = objc_claimAutoreleasedReturnValue(),
                char v25 = [v24 isEqualToString:@"com.apple.mobileslideshow"],
                v24,
                (v25 & 1) == 0))
          {
            [v5 setNavigationBarHidden:1 animated:1];
            [v5 _setSearchHidNavigationBar:1];
          }
        }
      }
    }
    $D69225ED9BA803AE184F8CEF6B0C1DE3 controllerFlags = self->_controllerFlags;
    if ((*(unsigned char *)&controllerFlags & 2) != 0)
    {
      self->_$D69225ED9BA803AE184F8CEF6B0C1DE3 controllerFlags = ($D69225ED9BA803AE184F8CEF6B0C1DE3)(*(_DWORD *)&controllerFlags & 0xFFFFFFFD);
      double v27 = [(UIViewController *)self transitionCoordinator];
      double v28 = v27;
      if (v27)
      {
        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        void v30[2] = __66__UISearchController__navigationControllerWillShowViewController___block_invoke;
        v30[3] = &unk_1E52DA598;
        v30[4] = self;
        [v27 animateAlongsideTransition:0 completion:v30];
      }
      else
      {
        double v29 = [(UISearchController *)self searchBar];
        [v29 becomeFirstResponder];
      }
    }
  }
}

void __66__UISearchController__navigationControllerWillShowViewController___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) searchBar];
  [v1 becomeFirstResponder];
}

- (BOOL)_isSearchController
{
  return 1;
}

- (void)_didCreateSystemInputViewController
{
  id v3 = [(UISearchController *)self _animatorForBarPresentationStyle:self->_barPresentationStyle dismissing:0];
  [(UISearchController *)self _updateKeyboardFocusGuidesForAnimator:v3];
}

- (id)_deferredSearchSuggestionGroups
{
  return objc_getAssociatedObject(self, &_UISearchControllerDeferredSuggestionGroups);
}

- (NSArray)_searchSuggestionGroups
{
  uint64_t v2 = [(UISearchController *)self _suggestionController];
  id v3 = [v2 suggestionGroups];

  return (NSArray *)v3;
}

- (NSArray)searchSuggestions
{
  uint64_t v2 = [(UISearchController *)self _suggestionController];
  id v3 = [v2 suggestions];

  return (NSArray *)v3;
}

- (BOOL)_shouldDisplayDefaultSuggestion
{
  uint64_t v2 = [(UISearchController *)self _tvSuggestionController];
  char v3 = [v2 shouldDisplayDefaultSuggestion];

  return v3;
}

- (void)_setClearSuggestionsOnSelection:(BOOL)a3
{
  if (a3) {
    int v3 = 0x400000;
  }
  else {
    int v3 = 0;
  }
  self->_$D69225ED9BA803AE184F8CEF6B0C1DE3 controllerFlags = ($D69225ED9BA803AE184F8CEF6B0C1DE3)(*(_DWORD *)&self->_controllerFlags & 0xFFBFFFFF | v3);
}

- (BOOL)_clearSuggestionsOnSelection
{
  return (*((unsigned __int8 *)&self->_controllerFlags + 2) >> 6) & 1;
}

- (void)_setUpdateSearchTextOnDidSelectSuggestion:(BOOL)a3
{
  if (a3) {
    int v3 = 0x1000000;
  }
  else {
    int v3 = 0;
  }
  self->_$D69225ED9BA803AE184F8CEF6B0C1DE3 controllerFlags = ($D69225ED9BA803AE184F8CEF6B0C1DE3)(*(_DWORD *)&self->_controllerFlags & 0xFEFFFFFF | v3);
}

- (BOOL)_updateSearchTextOnDidSelectSuggestion
{
  return *((unsigned char *)&self->_controllerFlags + 3) & 1;
}

- (void)_setShouldDisplayDefaultSuggestion:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(UISearchController *)self _tvSuggestionController];
  [v4 setShouldDisplayDefaultSuggestion:v3];
}

- (BOOL)_showSearchSuggestionPreview
{
  uint64_t v2 = [(UISearchController *)self _tvSuggestionController];
  char v3 = [v2 showSearchSuggestionPreview];

  return v3;
}

- (void)_setShowSearchSuggestionPreview:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(UISearchController *)self _tvSuggestionController];
  [v4 setShowSearchSuggestionPreview:v3];
}

- (NSString)_suggestionRowTitle
{
  uint64_t v2 = [(UISearchController *)self _tvSuggestionController];
  BOOL v3 = [v2 searchSuggestionsTitle];

  return (NSString *)v3;
}

- (void)_setSuggestionRowTitle:(id)a3
{
  id v4 = a3;
  id v5 = [(UISearchController *)self _tvSuggestionController];
  [v5 setSearchSuggestionsTitle:v4];
}

- (BOOL)ignoresSearchSuggestionsForSearchBarPlacementStacked
{
  return (*((unsigned __int8 *)&self->_controllerFlags + 1) >> 6) & 1;
}

- (void)_setUsesSearchSuggestionsMenuForStackedSearch:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000;
  }
  else {
    int v3 = 0;
  }
  self->_$D69225ED9BA803AE184F8CEF6B0C1DE3 controllerFlags = ($D69225ED9BA803AE184F8CEF6B0C1DE3)(*(_DWORD *)&self->_controllerFlags & 0xFFFF7FFF | v3);
}

- (BOOL)_usesSearchSuggestionsMenuForStackedSearch
{
  return *((unsigned __int8 *)&self->_controllerFlags + 1) >> 7;
}

- (NSArray)_dci_suggestionsMenuDismissalPassthroughViews
{
  return 0;
}

- (BOOL)_tvShouldScrollWithObservedScrollViewIfPossible
{
  int64_t v3 = [(UISystemInputViewController *)self->_systemInputViewController resolvedKeyboardStyle];
  if (v3 != 1)
  {
    LOBYTE(v3) = [(UISearchController *)self _shouldHideGridKeyboardUnfocused];
  }
  return v3;
}

- (void)_adjustTVSearchContainerViewForContentScrollView:(id)a3
{
  id v32 = a3;
  uint64_t v4 = [v32 window];
  if (v4)
  {
    id v5 = (void *)v4;
    BOOL v6 = [(UISearchController *)self _tvShouldScrollWithObservedScrollViewIfPossible];

    if (v6)
    {
      uint64_t v7 = [v32 _focusSystemSceneComponent];
      double v8 = [v7 coordinateSpace];
      BOOL v9 = [(UISearchController *)self _tvKeyboardContainerView];
      double v10 = [(UISearchController *)self _tvKeyboardContainerView];
      [v10 bounds];
      objc_msgSend(v9, "convertRect:toCoordinateSpace:", v8);
      double v12 = v11;

      double v13 = [(UISearchController *)self _tvKeyboardContainerView];
      [v13 bounds];
      double v15 = v14;
      double v17 = v16;
      double v19 = v18;

      double v20 = v12 + v19;
      [v32 contentOffset];
      double v22 = v21;
      [v32 adjustedContentInset];
      double v24 = fmax(fmin(v22 + v23, v20), 0.0);
      char v25 = [(UISearchController *)self _systemInputViewControllerAfterUpdate:0];
      uint64_t v26 = [v25 resolvedKeyboardStyle];

      if (v26 == 1)
      {
        double v27 = vabdd_f64(v24, v20);
        double v28 = [(UISearchController *)self _tvKeyboardContainerView];
        int v29 = [v28 isUserInteractionEnabled];

        if (v27 > 2.22044605e-16 != v29)
        {
          double v30 = [(UISearchController *)self _tvKeyboardContainerView];
          [v30 setUserInteractionEnabled:v27 > 2.22044605e-16];
        }
      }
      double v31 = [(UISearchController *)self _tvKeyboardContainerView];
      objc_msgSend(v31, "setBounds:", v15, v24, v17, v19);
    }
  }
}

- (void)_setGridKeyboardVisible:(BOOL)a3
{
  self->__gridKeyboardVisible = a3;
}

- (void)_searchBarTextFieldDidSelectSearchSuggestion:(id)a3
{
  id v6 = a3;
  uint64_t v4 = [(UISearchController *)self searchResultsUpdater];
  if (objc_opt_respondsToSelector())
  {
    [v4 updateSearchResultsForSearchController:self selectingSearchSuggestion:v6];
  }
  else if (objc_opt_respondsToSelector())
  {
    objc_msgSend(v4, "_dci_updateSearchResultsForSearchController:selectingSearchSuggestion:", self, v6);
  }
  [(UISearchController *)self _dci_setSearchSuggestions:0];
  self->_$D69225ED9BA803AE184F8CEF6B0C1DE3 controllerFlags = ($D69225ED9BA803AE184F8CEF6B0C1DE3)(*(_DWORD *)&self->_controllerFlags & 0xFFFFCFFF | 0x1000);
  id v5 = [(UISearchController *)self searchBar];
  [(UISearchController *)self _updateVisibilityOfSearchResultsForSearchBar:v5];
}

- (void)_startDeferringSettingSearchSuggestions
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__navigationItemCurrentlyDisplayingSearchController);
  if ([WeakRetained _hasInlineSearchBar]) {
    int v3 = 2048;
  }
  else {
    int v3 = 0;
  }
  self->_$D69225ED9BA803AE184F8CEF6B0C1DE3 controllerFlags = ($D69225ED9BA803AE184F8CEF6B0C1DE3)(*(_DWORD *)&self->_controllerFlags & 0xFFFFF7FF | v3);
}

- (void)_stopDeferringAndShowDeferredSearchSuggestions
{
  *(_DWORD *)&self->_controllerFlags &= ~0x800u;
  id v5 = [(UISearchController *)self _deferredSearchSuggestionGroups];
  if (v5)
  {
    *(_DWORD *)&self->_controllerFlags &= 0xFFFFCFFF;
    int v3 = [(UISearchController *)self _suggestionController];
    [v3 updateSuggestionGroups:v5 userInitiated:1];

    [(UISearchController *)self _setDeferredSearchSuggestionGroups:0];
    uint64_t v4 = [(UISearchController *)self searchBar];
    [(UISearchController *)self _updateVisibilityOfSearchResultsForSearchBar:v4];
  }
}

- (void)_suggestionsMenuInteractionWillEndWithAnimator:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(WeakRetained, "_dci_searchController:willDismissSearchSuggestionsMenuWasSuggestionSelected:", self, (*(_DWORD *)&self->_controllerFlags >> 12) & 1);
  }
  $D69225ED9BA803AE184F8CEF6B0C1DE3 controllerFlags = self->_controllerFlags;
  if ((*(_DWORD *)&controllerFlags & 0x11000) == 0) {
    self->_$D69225ED9BA803AE184F8CEF6B0C1DE3 controllerFlags = ($D69225ED9BA803AE184F8CEF6B0C1DE3)(*(_DWORD *)&controllerFlags | 0x2000);
  }
}

- (id)searchTextField
{
  uint64_t v2 = [(UISearchController *)self searchBar];
  int v3 = [v2 searchField];

  return v3;
}

- (id)searchTextColor
{
  uint64_t v2 = [(UISearchController *)self searchBar];
  int v3 = [v2 searchField];
  uint64_t v4 = [v3 textColor];

  return v4;
}

- (id)searchPlaceholderColor
{
  uint64_t v2 = [(UISearchController *)self searchBar];
  int v3 = [v2 searchField];
  uint64_t v4 = [v3 _placeholderColor];

  return v4;
}

- (void)_startManagingPalette:(id)a3
{
  if (a3)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"UISearchController.m" lineNumber:3685 description:@"UIKit Bug – we should not be going down this code path"];
  }
  managedPalette = self->_managedPalette;
  self->_managedPalette = 0;
}

- (void)_stopManagingPalette
{
  [(UIView *)self->_searchBar removeFromSuperview];
  managedPalette = self->_managedPalette;
  self->_managedPalette = 0;
}

- (NSString)description
{
  v16.receiver = self;
  v16.super_class = (Class)UISearchController;
  int v3 = [(UISearchController *)&v16 description];
  if (os_variant_has_internal_diagnostics())
  {
    if (self->_obscuresBackgroundDuringPresentation)
    {
      uint64_t v5 = [v3 stringByAppendingString:@" obscuresBackgroundDuringPresentation"];

      int v3 = (void *)v5;
    }
    if (self->__showResultsForEmptySearch)
    {
      uint64_t v6 = [v3 stringByAppendingString:@" showResultsForEmptySearch"];

      int v3 = (void *)v6;
    }
    $D69225ED9BA803AE184F8CEF6B0C1DE3 controllerFlags = self->_controllerFlags;
    if ((*(unsigned char *)&controllerFlags & 0x80) == 0)
    {
      if ((*(_WORD *)&controllerFlags & 0x100) != 0) {
        double v8 = @"shown";
      }
      else {
        double v8 = @"hidden";
      }
      uint64_t v9 = [v3 stringByAppendingFormat:@" [manually shows searchResultsController—%@]", v8];

      $D69225ED9BA803AE184F8CEF6B0C1DE3 controllerFlags = self->_controllerFlags;
      int v3 = (void *)v9;
    }
    if ((*(unsigned char *)&controllerFlags & 0x60) == 0x20)
    {
      searchBar = self->_searchBar;
      if (searchBar)
      {
        BOOL v11 = [(UISearchBar *)searchBar showsScopeBar];
        double v12 = @"hidden";
        if (v11) {
          double v12 = @"shown";
        }
      }
      else
      {
        double v12 = @"missing searchBar";
      }
      uint64_t v13 = [v3 stringByAppendingFormat:@" [UISearchBar API shows scopeBar—%@]", v12];

      int v3 = (void *)v13;
    }
    if (self->_obscuresBackgroundDuringPresentation)
    {
      uint64_t v14 = [v3 stringByAppendingString:@" obscuresBackgroundDuringPresentation"];

      int v3 = (void *)v14;
    }
    uint64_t v15 = objc_msgSend(v3, "stringByAppendingFormat:", @" searchBar=%p", self->_searchBar);

    int v3 = (void *)v15;
  }
  return (NSString *)v3;
}

- (int)_barPresentationStyle
{
  return self->_barPresentationStyle;
}

- (UIView)_resultsControllerViewContainer
{
  return self->_resultsControllerViewContainer;
}

- (void)set_resultsControllerViewContainer:(id)a3
{
}

- (void)_setSuggestionController:(id)a3
{
}

- (_UISearchSuggestionsListViewController)_suggestionsListViewController
{
  return self->_suggestionsListViewController;
}

- (_UINavigationControllerManagedSearchPalette)_managedPalette
{
  return self->_managedPalette;
}

- (id)searchResultsUpdater
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_searchResultsUpdater);
  return WeakRetained;
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return WeakRetained;
}

- (BOOL)obscuresBackgroundDuringPresentation
{
  return self->_obscuresBackgroundDuringPresentation;
}

- (UIViewController)searchResultsController
{
  return self->_searchResultsController;
}

- (UIScrollView)searchControllerObservedScrollView
{
  return self->_searchControllerObservedScrollView;
}

- (void)setSearchControllerObservedScrollView:(UIScrollView *)searchControllerObservedScrollView
{
}

- (int64_t)_previousSearchBarPosition
{
  return self->__previousSearchBarPosition;
}

- (void)set_previousSearchBarPosition:(int64_t)a3
{
  self->__previousSearchBarPosition = a3;
}

- (double)_resultsContentScrollViewPresentationOffset
{
  return self->__resultsContentScrollViewPresentationOffset;
}

- (void)set_resultsContentScrollViewPresentationOffset:(double)a3
{
  self->__resultsContentScrollViewPresentationOffset = a3;
}

- (BOOL)_tabBarHidden
{
  return self->__tabBarHidden;
}

- (void)set_tabBarHidden:(BOOL)a3
{
  self->__tabBarHidden = a3;
}

- (UIView)_systemInputMarginView
{
  return self->__systemInputMarginView;
}

- (_UISearchControllerTVKeyboardContainerView)_tvKeyboardContainerView
{
  return self->__tvKeyboardContainerView;
}

- (UICollectionView)_suggestionView
{
  return self->__suggestionView;
}

- (UIView)_leftDividerView
{
  return self->__leftDividerView;
}

- (UIView)_rightDividerView
{
  return self->__rightDividerView;
}

- (UIFocusContainerGuide)_scopeBarFocusContainerGuide
{
  return self->__scopeBarFocusContainerGuide;
}

- (NSArray)_scopeBarConstraints
{
  return self->__scopeBarConstraints;
}

- (void)set_scopeBarConstraints:(id)a3
{
}

- (double)_topResultsViewEdgeInset
{
  return self->__topResultsViewEdgeInset;
}

- (void)set_topResultsViewEdgeInset:(double)a3
{
  self->__topResultsViewEdgeInset = a3;
}

- (UIFocusGuide)keyboardToSearchResultsFocusGuide
{
  return self->_keyboardToSearchResultsFocusGuide;
}

- (void)setKeyboardToSearchResultsFocusGuide:(id)a3
{
}

- (UIFocusGuide)searchResultsToHiddenKeyboardFocusGuide
{
  return self->_searchResultsToHiddenKeyboardFocusGuide;
}

- (void)setSearchResultsToHiddenKeyboardFocusGuide:(id)a3
{
}

- (BOOL)_shouldLogAppearance
{
  return self->__shouldLogAppearance;
}

- (void)set_shouldLogAppearance:(BOOL)a3
{
  self->__shouldLogAppearance = a3;
}

- (UIView)_suggestionContainerView
{
  return self->__suggestionContainerView;
}

- (void)set_suggestionContainerView:(id)a3
{
}

- (BOOL)_isGridKeyboardVisible
{
  return self->__gridKeyboardVisible;
}

- (BOOL)_shouldHideGridKeyboardUnfocused
{
  return self->__shouldHideGridKeyboardUnfocused;
}

- (void)_setShouldHideGridKeyboardUnfocused:(BOOL)a3
{
  self->__shouldHideGridKeyboardUnfocused = a3;
}

- (NSArray)searchHints
{
  return self->_searchHints;
}

- (void)setSearchHints:(id)a3
{
}

- (UISearchResultsUpdatingPrivate)searchResultsUpdaterPrivate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_searchResultsUpdaterPrivate);
  return (UISearchResultsUpdatingPrivate *)WeakRetained;
}

- (void)setSearchResultsUpdaterPrivate:(id)a3
{
}

- (BOOL)_showResultsForEmptySearch
{
  return self->__showResultsForEmptySearch;
}

- (unint64_t)_requestedInteractionModel
{
  return self->__requestedInteractionModel;
}

- (BOOL)_shouldRespectPreferredContentSize
{
  return self->__shouldRespectPreferredContentSize;
}

- (void)_setShouldRespectPreferredContentSize:(BOOL)a3
{
  self->__shouldRespectPreferredContentSize = a3;
}

- (BOOL)_alwaysHidesNavigationBar
{
  return self->__alwaysHidesNavigationBar;
}

- (void)_setAlwaysHidesNavigationBar:(BOOL)a3
{
  self->__alwaysHidesNavigationBar = a3;
}

@end