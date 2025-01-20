@interface SBHLibrarySearchController
- (BOOL)canBecomeFirstResponder;
- (BOOL)forcedSearchTextFieldNoneditable;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)isActive;
- (BOOL)isSearchFieldEditing;
- (BOOL)isTransitionInProgress;
- (BOOL)needsToManageTopInset;
- (BOOL)scrollViewBeganScrollingFromTop;
- (BOOL)searchBarShouldBeginEditing:(id)a3;
- (BOOL)searchBarShouldEndEditing:(id)a3;
- (BOOL)searchBarShouldReturn:(id)a3;
- (BOOL)shouldAutomaticallyForwardAppearanceMethods;
- (BOOL)usesPlatterAppearance;
- (CGRect)_calculateSearchBarFrame:(BOOL)a3;
- (CGRect)_calculateSearchBarFrame:(BOOL)a3 forExplicitVisualConfiguration:(id)a4;
- (CGSize)preferredContentSize;
- (NSArray)contentViewGradientMaskLayers;
- (NSArray)searchResultsGradientMaskLayers;
- (NSString)containingIconLocation;
- (SBFFluidBehaviorSettings)searchAnimationSettings;
- (SBHIconLibraryTableViewController)searchResultsController;
- (SBHLibrarySearchController)initWithSearchResultsController:(id)a3 contentViewController:(id)a4 usingPlatterAppearance:(BOOL)a5;
- (SBHLibrarySearchControllerContentViewControllerScrollViewProvider)contentViewController;
- (SBHLibrarySearchControllerDelegate)delegate;
- (SBHSearchBar)searchBar;
- (SBHSearchResultsUpdating)searchResultsUpdater;
- (SBHSearchTextField)searchField;
- (SBIconListLayoutProvider)listLayoutProvider;
- (UIEdgeInsets)_edgeInsetsForChildViewController:(id)a3 insetsAreAbsolute:(BOOL *)a4;
- (UIEdgeInsets)_windowSafeAreaInsets;
- (UIEdgeInsets)safeAreaInsetsForSearchBar:(id)a3;
- (UIView)searchDimmingView;
- (double)_bottomLayoutInsetForSearchResultsView;
- (double)_rubberbandingOffsetForContentOffset:(CGPoint)a3;
- (double)_searchPresentationProgressForOffset:(double)a3;
- (id)_activeSearchConfiguration;
- (id)_inactiveSearchConfiguration;
- (id)contentScrollView;
- (id)keyCommands;
- (int64_t)searchState;
- (unint64_t)searchBarAppearance;
- (void)_didDismissSearch;
- (void)_didPresentSearch;
- (void)_dismissPresentation:(BOOL)a3;
- (void)_layoutSearchViews;
- (void)_layoutSearchViewsWithMode:(int64_t)a3 withCompletion:(id)a4;
- (void)_performPresentation:(BOOL)a3;
- (void)_searchBackgroundContentReplacedWithSnapshot:(BOOL)a3;
- (void)_setUpFeatherMaskLayerMatchMoveAnimations;
- (void)_setupSearchAnimationSettings;
- (void)_updateContentOverlayInsetsFromParentForChildren;
- (void)_updateEffectiveSearchVisualConfiguration;
- (void)_willDismissSearchAnimated:(BOOL)a3;
- (void)_willPresentSearchAnimated:(BOOL)a3;
- (void)beginEditingForSearchField;
- (void)endEditingForSearchField;
- (void)libraryTableViewControllerDidEndDecelerating:(id)a3;
- (void)libraryTableViewControllerWillBeginDragging:(id)a3;
- (void)ppt_setDisablePullToSearch:(BOOL)a3;
- (void)resetSearchController:(BOOL)a3 clearSearchResults:(BOOL)a4 resetSearchBarTransformAndAlpha:(BOOL)a5;
- (void)scrollViewDidEndScrolling:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)scrollViewWillBeginScrolling:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)searchBar:(id)a3 textDidChange:(id)a4;
- (void)searchBarCancelButtonClicked:(id)a3;
- (void)searchBarDidInvalidateIntrinsicContentSize:(id)a3;
- (void)setActive:(BOOL)a3;
- (void)setContainingIconLocation:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setForcedSearchTextFieldNoneditable:(BOOL)a3;
- (void)setListLayoutProvider:(id)a3;
- (void)setScrollViewBeganScrollingFromTop:(BOOL)a3;
- (void)setSearchAnimationSettings:(id)a3;
- (void)setSearchBarAppearance:(unint64_t)a3;
- (void)setSearchDimmingView:(id)a3;
- (void)setSearchResultsUpdater:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation SBHLibrarySearchController

- (BOOL)isActive
{
  return [(SBHLibrarySearchController *)self searchState] == 2;
}

- (int64_t)searchState
{
  return self->_searchState;
}

- (SBHLibrarySearchController)initWithSearchResultsController:(id)a3 contentViewController:(id)a4 usingPlatterAppearance:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v20.receiver = self;
  v20.super_class = (Class)SBHLibrarySearchController;
  v11 = [(SBHLibrarySearchController *)&v20 initWithNibName:0 bundle:0];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_containingIconLocation, @"SBIconLocationAppLibrary");
    objc_storeStrong((id *)&v12->_searchResultsController, a3);
    [(SBHIconLibraryTableViewController *)v12->_searchResultsController setLayoutDelegate:v12];
    [(SBHIconLibraryTableViewController *)v12->_searchResultsController setObserver:v12];
    objc_storeStrong((id *)&v12->_contentViewController, a4);
    uint64_t v13 = [v10 contentScrollView];
    scrollView = v12->_scrollView;
    v12->_scrollView = (UIScrollView *)v13;

    [(SBHLibrarySearchControllerContentViewControllerScrollViewProvider *)v12->_contentViewController setLibrarySearchControllerScrollViewDelegate:v12];
    v12->_usesPlatterAppearance = a5;
    v12->_searchBarAppearance = 0;
    v15 = +[SBHHomeScreenDomain rootSettings];
    uint64_t v16 = [v15 libraryPullToSearchSettings];
    pullToSearchSettings = v12->_pullToSearchSettings;
    v12->_pullToSearchSettings = (SBHHomePullToSearchSettings *)v16;

    [(PTSettings *)v12->_pullToSearchSettings addKeyObserver:v12];
    if (a5)
    {
      v18 = [MEMORY[0x1E4FB16C8] currentDevice];
      v12->_needsLowQualityBackgroundEffects = objc_msgSend(v18, "sbf_animatedBlurRadiusGraphicsQuality") < 41;
    }
    else
    {
      v12->_needsLowQualityBackgroundEffects = 0;
    }
    [(SBHLibrarySearchController *)v12 _setupSearchAnimationSettings];
  }

  return v12;
}

- (id)contentScrollView
{
  BOOL v3 = [(SBHLibrarySearchController *)self isActive];
  v4 = &OBJC_IVAR___SBHLibrarySearchController__contentViewController;
  if (v3) {
    v4 = &OBJC_IVAR___SBHLibrarySearchController__searchResultsController;
  }
  v5 = [*(id *)((char *)&self->super.super.super.isa + *v4) contentScrollView];
  return v5;
}

- (void)viewDidLoad
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  v83.receiver = self;
  v83.super_class = (Class)SBHLibrarySearchController;
  [(SBHLibrarySearchController *)&v83 viewDidLoad];
  BOOL v3 = [(SBHLibrarySearchController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  v12 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v4, v6, v8, v10);
  containerView = self->_containerView;
  self->_containerView = v12;

  v78 = v3;
  [v3 addSubview:self->_containerView];
  v14 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v5, v7, v9, v11);
  contentContainerView = self->_contentContainerView;
  self->_contentContainerView = v14;

  [(UIView *)self->_contentContainerView setAutoresizingMask:18];
  [(UIView *)self->_containerView addSubview:self->_contentContainerView];
  uint64_t v16 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E4FA5F10]), "initWithFrame:", v5, v7, v9, v11);
  searchResultsContainerView = self->_searchResultsContainerView;
  self->_searchResultsContainerView = v16;

  [(UIView *)self->_searchResultsContainerView setAutoresizingMask:18];
  [(UIView *)self->_searchResultsContainerView _setIgnoreBackdropViewsWhenHiding:1];
  v18 = &OBJC_IVAR___SBWidgetIcon__stackChangeReason;
  if ([(SBHLibrarySearchController *)self usesPlatterAppearance])
  {
    id v19 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    double v20 = *MEMORY[0x1E4F1DB28];
    double v21 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v22 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v23 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    v24 = (UIView *)objc_msgSend(v19, "initWithFrame:", *MEMORY[0x1E4F1DB28], v21, v22, v23);
    [(UIView *)v24 setClipsToBounds:1];
    [(UIView *)v24 setAlpha:0.0];
    searchResultsPlatterView = self->_searchResultsPlatterView;
    self->_searchResultsPlatterView = v24;
    v26 = v24;

    [(UIView *)self->_searchResultsContainerView insertSubview:v26 atIndex:0];
    v27 = -[SBHVisualStylingView initWithFrame:]([SBHLibraryCategoryPodBackgroundView alloc], "initWithFrame:", v20, v21, v22, v23);
    [(SBHLibraryCategoryPodBackgroundView *)v27 setAutoresizingMask:18];
    [(UIView *)self->_searchResultsPlatterView addSubview:v27];
    v28 = [(SBHLibrarySearchController *)self containingIconLocation];
    v29 = [(SBHLibrarySearchController *)self listLayoutProvider];
    v30 = [v29 layoutForIconLocation:v28];

    v31 = [v30 appLibraryVisualConfiguration];
    [v31 searchContinuousCornerRadius];
    double v33 = v32;
    -[UIView _setContinuousCornerRadius:](self->_searchResultsPlatterView, "_setContinuousCornerRadius:");
    v34 = [(SBHIconLibraryTableViewController *)self->_searchResultsController contentScrollView];
    objc_msgSend(v34, "setVerticalScrollIndicatorInsets:", v33, 0.0, v33, 0.0);

    v35 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel_endEditingForSearchField];
    [v35 setDelegate:self];
    [(UIView *)self->_searchResultsContainerView addGestureRecognizer:v35];

    v18 = &OBJC_IVAR___SBWidgetIcon__stackChangeReason;
  }
  [(SBHLibrarySearchController *)self _calculateSearchBarFrame:0];
  v40 = -[SBHSearchBar initWithFrame:]([SBHSearchBar alloc], "initWithFrame:", v36, v37, v38, v39);
  searchBar = self->_searchBar;
  self->_searchBar = v40;

  [(SBHSearchBar *)self->_searchBar setDelegate:self];
  v42 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v43 = [v42 userInterfaceIdiom];

  if ((v43 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    [(SBHSearchBar *)self->_searchBar setBackgroundViewBottomInsetToTextField:24.0];
  }
  v44 = self->_searchBar;
  uint64_t v45 = v18[139];
  v46 = [*(id *)((char *)&self->super.super.super.isa + v45) focusGroupIdentifier];
  [(SBHSearchBar *)v44 setFocusGroupIdentifier:v46];

  [v3 addSubview:self->_searchBar];
  [(SBHLibrarySearchController *)self _updateEffectiveSearchVisualConfiguration];
  v47 = [(SBHSearchBar *)self->_searchBar searchTextField];
  searchField = self->_searchField;
  self->_searchField = v47;

  v49 = self->_searchResultsPlatterView;
  if (!v49) {
    v49 = self->_searchResultsContainerView;
  }
  v50 = v49;
  [(SBHLibrarySearchController *)self bs_addChildViewController:self->_contentViewController withSuperview:self->_contentContainerView];
  v77 = v50;
  [(SBHLibrarySearchController *)self bs_addChildViewController:*(Class *)((char *)&self->super.super.super.isa + v45) withSuperview:v50];
  v51 = [(SBHLibrarySearchController *)self view];
  [v51 bringSubviewToFront:self->_searchBar];

  long long v81 = 0u;
  long long v82 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  uint64_t v52 = *(uint64_t *)((char *)&self->super.super.super.isa + v45);
  v84[0] = self->_contentViewController;
  v84[1] = v52;
  v53 = [MEMORY[0x1E4F1C978] arrayWithObjects:v84 count:2];
  uint64_t v54 = [v53 countByEnumeratingWithState:&v79 objects:v85 count:16];
  if (v54)
  {
    uint64_t v55 = v54;
    uint64_t v56 = *(void *)v80;
    do
    {
      for (uint64_t i = 0; i != v55; ++i)
      {
        if (*(void *)v80 != v56) {
          objc_enumerationMutation(v53);
        }
        v58 = [*(id *)(*((void *)&v79 + 1) + 8 * i) view];
        [(UIView *)self->_containerView bounds];
        objc_msgSend(v58, "setFrame:");
      }
      uint64_t v55 = [v53 countByEnumeratingWithState:&v79 objects:v85 count:16];
    }
    while (v55);
  }

  if (self->_needsLowQualityBackgroundEffects)
  {
    v59 = -[SBHVisualStylingView initWithFrame:]([SBHLibrarySearchSimplifiedBackgroundView alloc], "initWithFrame:", v5, v7, v9, v11);
    [(SBHLibrarySearchSimplifiedBackgroundView *)v59 setAutoresizingMask:18];
  }
  else
  {
    v60 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v61 = [v60 userInterfaceIdiom];

    if ((v61 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
      v62 = @"homeScreenOverlayLibrarySearch-iPad";
    }
    else {
      v62 = @"homeScreenOverlayLibrarySearch";
    }
    v63 = (void *)MEMORY[0x1E4F743C8];
    v64 = v62;
    v65 = SBHBundle();
    v59 = [v63 materialViewWithRecipeNamed:v64 inBundle:v65 options:0 initialWeighting:0 scaleAdjustment:0.0];

    [(SBHLibrarySearchSimplifiedBackgroundView *)v59 setGroupNameBase:@"SBHLibrarySearchControllerBackdropView"];
    [(SBHLibrarySearchSimplifiedBackgroundView *)v59 setUseBuiltInAlphaTransformerAndBackdropScaleAdjustmentIfNecessary:1];
    v66 = SBHHomeScreenMaterialViewBackdropScaleAdjustmentHandlerForCurrentDevice();
    [(SBHLibrarySearchSimplifiedBackgroundView *)v59 setBackdropScaleAdjustment:v66];
  }
  [(SBHLibrarySearchSimplifiedBackgroundView *)v59 bs_setHitTestingDisabled:1];
  searchBackgroundView = self->_searchBackgroundView;
  self->_searchBackgroundView = &v59->super.super;
  v68 = v59;

  [(UIView *)self->_searchResultsContainerView insertSubview:v68 atIndex:0];
  v69 = (void *)MEMORY[0x1E4FA5F00];
  v70 = [(SBHLibrarySearchControllerContentViewControllerScrollViewProvider *)self->_contentViewController view];
  v71 = [v69 configureGradientMaskForFeatherBlurRecipe:1 onContentView:v70];
  contentViewGradientMaskLayers = self->_contentViewGradientMaskLayers;
  self->_contentViewGradientMaskLayers = v71;

  v73 = (void *)MEMORY[0x1E4FA5F00];
  v74 = [*(id *)((char *)&self->super.super.super.isa + v45) view];
  v75 = [v73 configureGradientMaskForFeatherBlurRecipe:3 onContentView:v74];
  searchResultsGradientMaskLayers = self->_searchResultsGradientMaskLayers;
  self->_searchResultsGradientMaskLayers = v75;
}

- (void)viewWillLayoutSubviews
{
  v11.receiver = self;
  v11.super_class = (Class)SBHLibrarySearchController;
  [(SBHLibrarySearchController *)&v11 viewWillLayoutSubviews];
  BOOL v3 = [(SBHLibrarySearchController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;

  double v8 = [(SBHLibrarySearchController *)self searchBar];
  [v8 setPortraitOrientation:v5 < v7];

  if ([(SBHLibrarySearchController *)self _rotatingToInterfaceOrientation]) {
    uint64_t v9 = 1;
  }
  else {
    uint64_t v9 = 4;
  }
  if ([(SBHLibrarySearchController *)self _appearState]) {
    uint64_t v10 = v9;
  }
  else {
    uint64_t v10 = 1;
  }
  [(SBHLibrarySearchController *)self _layoutSearchViewsWithMode:v10 withCompletion:0];
}

- (UIEdgeInsets)_edgeInsetsForChildViewController:(id)a3 insetsAreAbsolute:(BOOL *)a4
{
  double v6 = (SBHLibrarySearchControllerContentViewControllerScrollViewProvider *)a3;
  uint64_t v7 = MEMORY[0x1E4FB2848];
  [(SBHLibrarySearchController *)self _windowSafeAreaInsets];
  double v9 = v8;
  if (self->_contentViewController == v6)
  {
    v12 = [(SBHLibrarySearchController *)self _inactiveSearchConfiguration];
    [(SBHLibrarySearchController *)self _calculateSearchBarFrame:0 forExplicitVisualConfiguration:v12];
    CGFloat MaxY = CGRectGetMaxY(v20);

    goto LABEL_6;
  }
  if ((SBHLibrarySearchControllerContentViewControllerScrollViewProvider *)self->_searchResultsController != v6
    || (double v10 = 0.0, MaxY = 0.0, ![(SBHLibrarySearchController *)self usesPlatterAppearance]))
  {
    [(SBHLibrarySearchController *)self _calculateSearchBarFrame:0];
    CGFloat MaxY = CGRectGetMaxY(v19);
LABEL_6:
    double v10 = v9;
  }
  double v13 = *(double *)(v7 + 8);
  double v14 = *(double *)(v7 + 24);
  if (a4) {
    *a4 = 1;
  }

  double v15 = MaxY;
  double v16 = v13;
  double v17 = v10;
  double v18 = v14;
  result.right = v18;
  result.bottom = v17;
  result.left = v16;
  result.top = v15;
  return result;
}

- (CGSize)preferredContentSize
{
  [(UIView *)self->_containerView frame];
  double v3 = v2;
  double v5 = v4;
  result.height = v5;
  result.width = v3;
  return result;
}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return 0;
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)SBHLibrarySearchController;
  -[SBHLibrarySearchController viewWillAppear:](&v5, sel_viewWillAppear_);
  [(SBHLibrarySearchControllerContentViewControllerScrollViewProvider *)self->_contentViewController bs_beginAppearanceTransition:1 animated:v3];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBHLibrarySearchController;
  [(SBHLibrarySearchController *)&v4 viewDidAppear:a3];
  [(SBHLibrarySearchControllerContentViewControllerScrollViewProvider *)self->_contentViewController bs_endAppearanceTransition];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)SBHLibrarySearchController;
  -[SBHLibrarySearchController viewWillDisappear:](&v5, sel_viewWillDisappear_);
  [MEMORY[0x1E4F39CF8] setFrameStallSkipRequest:1];
  [(SBHLibrarySearchControllerContentViewControllerScrollViewProvider *)self->_contentViewController bs_beginAppearanceTransition:0 animated:v3];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBHLibrarySearchController;
  [(SBHLibrarySearchController *)&v5 viewDidDisappear:a3];
  if ([(SBHLibrarySearchController *)self isActive]) {
    [(SBHLibrarySearchController *)self _dismissPresentation:0];
  }
  [(SBHLibrarySearchControllerContentViewControllerScrollViewProvider *)self->_contentViewController bs_endAppearanceTransition];
  objc_super v4 = [(SBHIconLibraryTableViewController *)self->_searchResultsController contentScrollView];
  [v4 _scrollToTopIfPossible:0];

  [(SBHLibrarySearchController *)self resetSearchController:0 clearSearchResults:1 resetSearchBarTransformAndAlpha:0];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v15.receiver = self;
  v15.super_class = (Class)SBHLibrarySearchController;
  id v7 = a4;
  -[SBHLibrarySearchController viewWillTransitionToSize:withTransitionCoordinator:](&v15, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  double v8 = [(UIView *)self->_searchBackgroundView layer];
  double v9 = [v8 animationForKey:@"SBLibrarySearchMatchMoveAnimation"];
  [v8 removeAnimationForKey:@"SBLibrarySearchMatchMoveAnimation"];
  [(SBHLibrarySearchController *)self _searchBackgroundContentReplacedWithSnapshot:0];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __81__SBHLibrarySearchController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v12[3] = &unk_1E6AB25B8;
  id v13 = v8;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  [v7 animateAlongsideTransition:0 completion:v12];
}

uint64_t __81__SBHLibrarySearchController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) addAnimation:*(void *)(a1 + 40) forKey:@"SBLibrarySearchMatchMoveAnimation"];
}

- (id)keyCommands
{
  v12[1] = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)SBHLibrarySearchController;
  BOOL v3 = [(SBHLibrarySearchController *)&v11 keyCommands];
  if ([(SBHSearchBar *)self->_searchBar showsCancelButton])
  {
    objc_super v4 = (__CFString *)*MEMORY[0x1E4FB2B08];
    objc_super v5 = sel_endEditingForSearchField;
    uint64_t v6 = 0;
  }
  else
  {
    objc_super v5 = sel_beginEditingForSearchField;
    objc_super v4 = @"f";
    uint64_t v6 = 0x100000;
  }
  uint64_t v7 = [MEMORY[0x1E4FB18D0] keyCommandWithInput:v4 modifierFlags:v6 action:v5];
  double v8 = (void *)v7;
  if (v3)
  {
    double v9 = [v3 arrayByAddingObject:v7];
  }
  else
  {
    v12[0] = v7;
    double v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  }

  return v9;
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  v6.receiver = self;
  v6.super_class = (Class)SBHLibrarySearchController;
  [(SBHLibrarySearchController *)&v6 viewDidMoveToWindow:a3 shouldAppearOrDisappear:a4];
  [(SBHLibrarySearchController *)self _updateContentOverlayInsetsFromParentForChildren];
  objc_super v5 = [(SBHLibrarySearchController *)self view];
  [v5 setNeedsLayout];
}

- (BOOL)isTransitionInProgress
{
  return [(SBHLibrarySearchController *)self searchState] == 1;
}

- (void)setActive:(BOOL)a3
{
  if (a3)
  {
    searchField = self->_searchField;
    [(UISearchTextField *)searchField becomeFirstResponder];
  }
  else
  {
    uint64_t v5 = [MEMORY[0x1E4FB1EB0] areAnimationsEnabled];
    [(SBHLibrarySearchController *)self _dismissPresentation:v5];
  }
}

- (double)_rubberbandingOffsetForContentOffset:(CGPoint)a3
{
  double y = a3.y;
  [(UIScrollView *)self->_scrollView adjustedContentInset];
  double v5 = -v4;
  double result = -(y + v4);
  if (y >= v5) {
    return 0.0;
  }
  return result;
}

- (double)_searchPresentationProgressForOffset:(double)a3
{
  [(SBHHomePullToSearchSettings *)self->_pullToSearchSettings pullTransitionDistance];
  return a3 / v4 + 0.0;
}

- (void)_layoutSearchViewsWithMode:(int64_t)a3 withCompletion:(id)a4
{
  id v6 = a4;
  uint64_t v7 = (void *)MEMORY[0x1E4FB1EB0];
  searchAnimationSettings = self->_searchAnimationSettings;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __72__SBHLibrarySearchController__layoutSearchViewsWithMode_withCompletion___block_invoke;
  v12[3] = &unk_1E6AAC810;
  void v12[4] = self;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __72__SBHLibrarySearchController__layoutSearchViewsWithMode_withCompletion___block_invoke_2;
  v10[3] = &unk_1E6AAE760;
  id v11 = v6;
  id v9 = v6;
  objc_msgSend(v7, "sb_animateWithSettings:mode:animations:completion:", searchAnimationSettings, a3, v12, v10);
}

uint64_t __72__SBHLibrarySearchController__layoutSearchViewsWithMode_withCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _layoutSearchViews];
}

uint64_t __72__SBHLibrarySearchController__layoutSearchViewsWithMode_withCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_layoutSearchViews
{
  uint64_t v119 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(SBHLibrarySearchController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  v12 = self->_containerView;
  -[UIView setFrame:](v12, "setFrame:", v5, v7, v9, v11);
  id v13 = [(SBHLibrarySearchControllerContentViewControllerScrollViewProvider *)self->_contentViewController view];
  objc_msgSend(v13, "setFrame:", v5, v7, v9, v11);

  id v14 = [(SBHIconLibraryTableViewController *)self->_searchResultsController view];
  objc_super v15 = self->_scrollView;
  v108 = v12;
  [(UIView *)v12 bounds];
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  UIRectGetCenter();
  double v25 = v24;
  double v27 = v26;
  [(UIScrollView *)v15 contentOffset];
  -[SBHLibrarySearchController _rubberbandingOffsetForContentOffset:](self, "_rubberbandingOffsetForContentOffset:");
  int64_t searchState = self->_searchState;
  v105 = v15;
  double v104 = v17;
  if (searchState == 2)
  {
    double v32 = 1.0;
    double v30 = 0.0;
  }
  else if (searchState == 1)
  {
    double v30 = v28;
    -[SBHLibrarySearchController _searchPresentationProgressForOffset:](self, "_searchPresentationProgressForOffset:");
    double v32 = v31;
  }
  else
  {
    double v30 = 0.0;
    double v32 = 0.0;
  }
  double v33 = self->_searchResultsPlatterView;
  double v107 = v23;
  if (v33)
  {
    v34 = [(SBHLibrarySearchController *)self _activeSearchConfiguration];
    if (self->_searchState == 2)
    {
      [(SBHLibrarySearchController *)self _calculateSearchBarFrame:0 forExplicitVisualConfiguration:v34];
      double v36 = v35;
    }
    else
    {
      double v37 = [(SBHLibrarySearchController *)self _inactiveSearchConfiguration];
      [(SBHLibrarySearchController *)self _calculateSearchBarFrame:0 forExplicitVisualConfiguration:v37];
      double v36 = v38;
    }
    [(SBHLibrarySearchController *)self _bottomLayoutInsetForSearchResultsView];
    double v39 = v19 + v36;
    double v41 = v23 - (v40 + v36);
    [v34 textFieldWidth];
    double v43 = v42;
    if (v42 <= 0.0)
    {
      if (v23 <= v21) {
        [v34 textFieldLandscapeLayoutInsets];
      }
      else {
        [v34 textFieldPortraitLayoutInsets];
      }
      double v43 = v21 - (v44 + v45);
    }
    [v14 frame];
    -[UIView setFrame:](v33, "setFrame:", (v21 - v43) * 0.5, v30 + v39, v43, v41);
    [(UIView *)v33 bounds];
    objc_msgSend(v14, "setFrame:");
  }
  else
  {
    objc_msgSend(v14, "setCenter:", v25, v27 + v30);
  }
  [(SBHLibrarySearchController *)self _calculateSearchBarFrame:1];
  double v47 = v46;
  double v49 = v48;
  double v51 = v50;
  [(UIView *)v12 bringSubviewToFront:self->_searchBar];
  searchBar = self->_searchBar;
  BSRectWithSize();
  -[SBHSearchBar setBounds:](searchBar, "setBounds:");
  v53 = self->_searchBar;
  double v103 = v47;
  UIRectGetCenter();
  -[SBHSearchBar setCenter:](v53, "setCenter:");
  uint64_t v54 = [(SBHLibrarySearchControllerContentViewControllerScrollViewProvider *)self->_contentViewController contentScrollView];
  uint64_t v55 = self->_searchBackgroundView;
  -[UIView setFrame:](v55, "setFrame:", v104, v19, v21, v23);
  if (self->_needsLowQualityBackgroundEffects)
  {
    [v54 setAlpha:1.0 - ((v32 + -0.15) / 0.4 + 0.0)];
    [(UIView *)v55 setAlpha:v32];
  }
  else
  {
    [(UIView *)v55 setWeighting:v32];
  }
  [(UIView *)v33 setAlpha:(v32 + -0.3) / 0.7 + 0.0];
  [v14 setAlpha:(v32 + -0.3) / 0.7 + 0.0];
  [v54 adjustedContentInset];
  double v57 = v56;
  [v54 contentOffset];
  double v59 = v57 + v58;
  BOOL v60 = v57 + v58 <= 0.0;
  uint64_t v61 = [(SBHSearchBar *)self->_searchBar backgroundView];
  [v61 setHidden:v60];

  [MEMORY[0x1E4FA5F00] gradientMaskLayerInsetsForFeatherBlurRecipe:1];
  double v63 = v62;
  double v65 = v64;
  double v68 = v51 - (v66 + v67);
  [(SBHSearchBar *)self->_searchBar backgroundViewBottomInsetToTextField];
  double v70 = v69;
  v106 = v14;
  if (v69 != *MEMORY[0x1E4FB30D8])
  {
    v71 = [(SBHLibrarySearchController *)self _inactiveSearchConfiguration];
    v72 = v71;
    if (v107 <= v21) {
      objc_msgSend(v71, "textFieldLandscapeLayoutInsets", v107);
    }
    else {
      objc_msgSend(v71, "textFieldPortraitLayoutInsets", v107);
    }
    double v68 = v68 - (v73 - v70);
  }
  long long v115 = 0u;
  long long v116 = 0u;
  long long v113 = 0u;
  long long v114 = 0u;
  v74 = self->_contentViewGradientMaskLayers;
  uint64_t v75 = [(NSArray *)v74 countByEnumeratingWithState:&v113 objects:v118 count:16];
  if (v75)
  {
    uint64_t v76 = v75;
    uint64_t v77 = *(void *)v114;
    do
    {
      for (uint64_t i = 0; i != v76; ++i)
      {
        if (*(void *)v114 != v77) {
          objc_enumerationMutation(v74);
        }
        long long v79 = *(void **)(*((void *)&v113 + 1) + 8 * i);
        objc_msgSend(v79, "setFrame:", v103 + v63, 0.0, v49 - (v63 + v65), v68);
        [v79 setHidden:v59 <= 0.0];
      }
      uint64_t v76 = [(NSArray *)v74 countByEnumeratingWithState:&v113 objects:v118 count:16];
    }
    while (v76);
  }

  [MEMORY[0x1E4FA5F00] gradientMaskLayerInsetsForFeatherBlurRecipe:3];
  double v81 = v80;
  double v83 = v82;
  double v85 = v84;
  double v87 = v86;
  v88 = [(SBHIconLibraryTableViewController *)self->_searchResultsController headerBlurView];
  [v88 bounds];
  objc_msgSend(v88, "convertRect:toView:", v108);
  double v90 = v89;
  double v92 = v91;
  double v94 = v93;
  long long v109 = 0u;
  long long v110 = 0u;
  long long v111 = 0u;
  long long v112 = 0u;
  v95 = self->_searchResultsGradientMaskLayers;
  uint64_t v96 = [(NSArray *)v95 countByEnumeratingWithState:&v109 objects:v117 count:16];
  if (v96)
  {
    uint64_t v97 = v96;
    double v98 = v94 - (v81 + v85);
    double v99 = v92 - (v83 + v87);
    double v100 = v83 + v90;
    uint64_t v101 = *(void *)v110;
    do
    {
      for (uint64_t j = 0; j != v97; ++j)
      {
        if (*(void *)v110 != v101) {
          objc_enumerationMutation(v95);
        }
        objc_msgSend(*(id *)(*((void *)&v109 + 1) + 8 * j), "setFrame:", v100, 0.0, v99, v98);
      }
      uint64_t v97 = [(NSArray *)v95 countByEnumeratingWithState:&v109 objects:v117 count:16];
    }
    while (v97);
  }

  [(SBHLibrarySearchController *)self _setUpFeatherMaskLayerMatchMoveAnimations];
}

- (void)_setUpFeatherMaskLayerMatchMoveAnimations
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([(NSArray *)self->_contentViewGradientMaskLayers count]) {
    [v3 addObjectsFromArray:self->_contentViewGradientMaskLayers];
  }
  if ([(NSArray *)self->_searchResultsGradientMaskLayers count]) {
    [v3 addObjectsFromArray:self->_searchResultsGradientMaskLayers];
  }
  double v4 = [(UIView *)self->_containerView window];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        double v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        double v11 = (void *)MEMORY[0x1E4FA5F00];
        objc_msgSend(v10, "frame", (void)v13);
        v12 = objc_msgSend(v11, "matchMoveAnimationForFrame:relativeToView:", v4);
        [v10 addAnimation:v12 forKey:@"SBLibrarySearchMatchMoveAnimation"];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
}

- (CGRect)_calculateSearchBarFrame:(BOOL)a3
{
  [(SBHLibrarySearchController *)self _calculateSearchBarFrame:a3 forExplicitVisualConfiguration:0];
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)_calculateSearchBarFrame:(BOOL)a3 forExplicitVisualConfiguration:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  uint64_t v7 = self->_scrollView;
  [(SBHLibrarySearchController *)self _windowSafeAreaInsets];
  double v9 = v8;
  double v10 = v8;
  [(UIScrollView *)v7 contentOffset];
  -[SBHLibrarySearchController _rubberbandingOffsetForContentOffset:](self, "_rubberbandingOffsetForContentOffset:");
  if (v4 && self->_searchState != 2) {
    double v10 = v9 + v11 / 3.0;
  }
  [(UIView *)self->_containerView bounds];
  searchBar = self->_searchBar;
  if (v6) {
    -[SBHSearchBar sizeThatFits:forVisualConfiguration:](searchBar, "sizeThatFits:forVisualConfiguration:", v6, v12, v13);
  }
  else {
    -[SBHSearchBar sizeThatFits:](searchBar, "sizeThatFits:", v12, v13);
  }
  [(SBHLibrarySearchController *)self needsToManageTopInset];
  BSRectWithSize();
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;

  double v21 = v16;
  double v22 = v10 - v9;
  double v23 = v18;
  double v24 = v20;
  result.size.double height = v24;
  result.size.double width = v23;
  result.origin.double y = v22;
  result.origin.x = v21;
  return result;
}

- (void)_updateContentOverlayInsetsFromParentForChildren
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  double v2 = [(SBHLibrarySearchController *)self childViewControllers];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) _updateContentOverlayInsetsFromParentIfNecessary];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)_updateEffectiveSearchVisualConfiguration
{
  unint64_t v3 = [(SBHLibrarySearchController *)self searchBarAppearance];
  if (v3 == 2)
  {
    uint64_t v4 = [(SBHAppLibraryVisualConfiguration *)self->_libraryVisualConfiguration extendedSearchVisualConfiguration];
  }
  else if (v3 == 1)
  {
    uint64_t v4 = [(SBHAppLibraryVisualConfiguration *)self->_libraryVisualConfiguration compactSearchVisualConfiguration];
  }
  else if (v3)
  {
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v4 = [(SBHAppLibraryVisualConfiguration *)self->_libraryVisualConfiguration standardSearchVisualConfiguration];
  }
  obuint64_t j = (SBHSearchVisualConfiguration *)v4;
  [(SBHSearchBar *)self->_searchBar setInactiveSearchConfiguration:v4];
  uint64_t v5 = obj;
  if (self->_searchVisualConfiguration != obj)
  {
    objc_storeStrong((id *)&self->_searchVisualConfiguration, obj);
    [(SBHLibrarySearchController *)self _updateContentOverlayInsetsFromParentForChildren];
    uint64_t v5 = obj;
  }
}

- (id)_inactiveSearchConfiguration
{
  return self->_searchVisualConfiguration;
}

- (id)_activeSearchConfiguration
{
  return [(SBHAppLibraryVisualConfiguration *)self->_libraryVisualConfiguration activeSearchVisualConfiguration];
}

- (BOOL)isSearchFieldEditing
{
  return [(SBHSearchTextField *)self->_searchField isEditing];
}

- (void)setSearchBarAppearance:(unint64_t)a3
{
  if (self->_searchBarAppearance != a3)
  {
    self->_searchBarAppearance = a3;
    [(SBHLibrarySearchController *)self _updateEffectiveSearchVisualConfiguration];
  }
}

- (void)setListLayoutProvider:(id)a3
{
  obuint64_t j = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_listLayoutProvider);

  uint64_t v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_listLayoutProvider, obj);
    [(SBHSearchBar *)self->_searchBar setListLayoutProvider:obj];
    uint64_t v6 = [(SBHLibrarySearchController *)self containingIconLocation];
    long long v7 = [obj layoutForIconLocation:v6];
    long long v8 = [v7 appLibraryVisualConfiguration];
    if ([(SBHLibrarySearchController *)self usesPlatterAppearance])
    {
      [(SBHAppLibraryVisualConfiguration *)v8 searchContinuousCornerRadius];
      double v10 = v9;
      -[UIView _setContinuousCornerRadius:](self->_searchResultsPlatterView, "_setContinuousCornerRadius:");
      double v11 = [(SBHIconLibraryTableViewController *)self->_searchResultsController contentScrollView];
      objc_msgSend(v11, "setVerticalScrollIndicatorInsets:", v10, 0.0, v10, 0.0);
    }
    libraryVisualConfiguration = self->_libraryVisualConfiguration;
    self->_libraryVisualConfiguration = v8;

    [(SBHLibrarySearchController *)self _updateEffectiveSearchVisualConfiguration];
    uint64_t v5 = obj;
  }
}

- (void)setSearchResultsUpdater:(id)a3
{
  id v4 = a3;
  objc_storeWeak((id *)&self->_searchResultsUpdater, v4);
  if (objc_opt_respondsToSelector()) {
    [v4 setSearchController:self];
  }
}

- (void)ppt_setDisablePullToSearch:(BOOL)a3
{
  if (self->_disablePullToSearch != a3)
  {
    self->_disablePullToSearch = a3;
    [(SBHLibrarySearchController *)self _dismissPresentation:0];
  }
}

- (void)endEditingForSearchField
{
}

- (void)scrollViewWillBeginScrolling:(id)a3
{
}

- (void)scrollViewDidEndScrolling:(id)a3
{
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4 = a3;
  [v4 contentOffset];
  [v4 adjustedContentInset];

  [(SBHHomePullToSearchSettings *)self->_pullToSearchSettings pullGestureBeganFromTopLeeway];
  self->_scrollViewBeganScrollingFromTop = BSFloatLessThanOrEqualToFloat();
}

- (void)scrollViewDidScroll:(id)a3
{
  [a3 contentOffset];
  -[SBHLibrarySearchController _rubberbandingOffsetForContentOffset:](self, "_rubberbandingOffsetForContentOffset:");
  if (!self->_disablePullToSearch
    && self->_scrollViewBeganScrollingFromTop
    && BSFloatGreaterThanFloat()
    && !self->_searchState)
  {
    self->_int64_t searchState = 1;
    [(SBHLibrarySearchController *)self _willPresentSearchAnimated:1];
  }
  if (self->_searchState == 1) {
    uint64_t v4 = 2;
  }
  else {
    uint64_t v4 = 4;
  }
  [(SBHLibrarySearchController *)self _layoutSearchViewsWithMode:v4 withCompletion:0];
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  id v6 = a3;
  long long v7 = v6;
  if (!self->_disablePullToSearch)
  {
    self->_scrollViewBeganScrollingFromTop = 0;
    if (self->_searchState == 1 && !self->_disablePullToSearch)
    {
      double v8 = *MEMORY[0x1E4FB2EE8];
      [v6 contentOffset];
      double v10 = v9;
      double v12 = v11;
      double v13 = [v7 panGestureRecognizer];
      [v13 velocityInView:v7];
      double v15 = v14;
      double v17 = v16;

      -[SBHLibrarySearchController _rubberbandingOffsetForContentOffset:](self, "_rubberbandingOffsetForContentOffset:", v10 - v8 * (v15 / 1000.0) / (1.0 - v8), v12 - v8 * (v17 / 1000.0) / (1.0 - v8));
      -[SBHLibrarySearchController _searchPresentationProgressForOffset:](self, "_searchPresentationProgressForOffset:");
      [(SBHHomePullToSearchSettings *)self->_pullToSearchSettings pullTransitionActivationThreshold];
      int v18 = BSFloatGreaterThanFloat();
      char v19 = v18;
      if (v18)
      {
        [MEMORY[0x1E4F39CF8] setFrameStallSkipRequest:1];
        [(UISearchTextField *)self->_searchField becomeFirstResponder];
        [(SBHLibrarySearchController *)self _didPresentSearch];
      }
      else
      {
        [(SBHLibrarySearchController *)self _willDismissSearchAnimated:1];
      }
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __89__SBHLibrarySearchController_scrollViewWillEndDragging_withVelocity_targetContentOffset___block_invoke_2;
      v20[3] = &unk_1E6AAF6D8;
      char v21 = v19;
      v20[4] = self;
      [(SBHLibrarySearchController *)self _layoutSearchViewsWithMode:3 withCompletion:v20];
    }
  }
}

uint64_t __89__SBHLibrarySearchController_scrollViewWillEndDragging_withVelocity_targetContentOffset___block_invoke_2(uint64_t result)
{
  if (!*(unsigned char *)(result + 40))
  {
    uint64_t v1 = result;
    CGRect result = [*(id *)(result + 32) searchState];
    if (!result)
    {
      double v2 = *(void **)(v1 + 32);
      return [v2 _didDismissSearch];
    }
  }
  return result;
}

- (BOOL)searchBarShouldBeginEditing:(id)a3
{
  if (([(SBHLibrarySearchController *)self bs_isDisappearingOrDisappeared] & 1) != 0
    || [(SBHLibrarySearchController *)self forcedSearchTextFieldNoneditable])
  {
    [(SBHLibrarySearchController *)self setForcedSearchTextFieldNoneditable:0];
    return 0;
  }
  else
  {
    BOOL v4 = 1;
    if (self->_searchState != 1) {
      [(SBHLibrarySearchController *)self _performPresentation:1];
    }
  }
  return v4;
}

- (BOOL)searchBarShouldEndEditing:(id)a3
{
  return 1;
}

- (void)searchBarCancelButtonClicked:(id)a3
{
  if (![(SBHLibrarySearchController *)self isTransitionInProgress]
    && [(SBHLibrarySearchController *)self isActive])
  {
    [(SBHLibrarySearchController *)self _dismissPresentation:1];
  }
}

- (BOOL)searchBarShouldReturn:(id)a3
{
  unint64_t v3 = self;
  BOOL v4 = [(SBHLibrarySearchController *)self searchResultsUpdater];
  LOBYTE(v3) = [v4 searchControllerShouldReturn:v3];

  return (char)v3;
}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  id v5 = [(SBHLibrarySearchController *)self searchResultsUpdater];
  [v5 updateSearchResultsForSearchController:self];
}

- (void)searchBarDidInvalidateIntrinsicContentSize:(id)a3
{
  [(SBHLibrarySearchController *)self _calculateSearchBarFrame:0];
  searchBar = self->_searchBar;
  BSRectWithSize();
  -[SBHSearchBar setBounds:](searchBar, "setBounds:");
  id v5 = self->_searchBar;
  UIRectGetCenter();
  -[SBHSearchBar setCenter:](v5, "setCenter:");
}

- (UIEdgeInsets)safeAreaInsetsForSearchBar:(id)a3
{
  if ([(SBHLibrarySearchController *)self needsToManageTopInset])
  {
    [(SBHLibrarySearchController *)self _windowSafeAreaInsets];
    UIEdgeInsetsMakeWithEdges();
  }
  else
  {
    double v4 = *MEMORY[0x1E4FB2848];
    double v5 = *(double *)(MEMORY[0x1E4FB2848] + 8);
    double v6 = *(double *)(MEMORY[0x1E4FB2848] + 16);
    double v7 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  }
  result.right = v7;
  result.bottom = v6;
  result.left = v5;
  result.top = v4;
  return result;
}

- (double)_bottomLayoutInsetForSearchResultsView
{
  unint64_t v3 = [(SBHLibrarySearchController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v8 = [(SBHLibrarySearchController *)self _activeSearchConfiguration];
  double v9 = v8;
  if (v7 <= v5) {
    [v8 textFieldLandscapeLayoutInsets];
  }
  else {
    [v8 textFieldPortraitLayoutInsets];
  }
  double v11 = v10;
  double v12 = 0.0;
  if ([(SBHLibrarySearchController *)self usesPlatterAppearance])
  {
    [(SBHLibrarySearchController *)self _windowSafeAreaInsets];
    double v12 = v11 + v13 + -10.0;
  }

  return v12;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  searchResultsController = self->_searchResultsController;
  id v5 = a4;
  double v6 = [(SBHIconLibraryTableViewController *)searchResultsController view];
  [v6 bounds];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  [v5 locationInView:v6];
  CGFloat v16 = v15;
  CGFloat v18 = v17;

  v21.origin.x = v8;
  v21.origin.double y = v10;
  v21.size.double width = v12;
  v21.size.double height = v14;
  v20.x = v16;
  v20.double y = v18;
  LOBYTE(v5) = !CGRectContainsPoint(v21, v20);

  return (char)v5;
}

- (void)libraryTableViewControllerWillBeginDragging:(id)a3
{
}

- (void)libraryTableViewControllerDidEndDecelerating:(id)a3
{
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)_setupSearchAnimationSettings
{
  unint64_t v3 = (SBFFluidBehaviorSettings *)[objc_alloc(MEMORY[0x1E4FA5F08]) initWithDefaultValues];
  searchAnimationSettings = self->_searchAnimationSettings;
  self->_searchAnimationSettings = v3;

  id v8 = [(SBHHomePullToSearchSettings *)self->_pullToSearchSettings pullTransitionAnimationSettings];
  id v5 = self->_searchAnimationSettings;
  [v8 dampingRatio];
  -[SBFFluidBehaviorSettings setDampingRatio:](v5, "setDampingRatio:");
  double v6 = self->_searchAnimationSettings;
  [v8 response];
  -[SBFFluidBehaviorSettings setResponse:](v6, "setResponse:");
  double v7 = self->_searchAnimationSettings;
  CAFrameRateRange v10 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  -[SBFFluidBehaviorSettings setFrameRateRange:highFrameRateReason:](v7, "setFrameRateRange:highFrameRateReason:", 1114128, *(double *)&v10.minimum, *(double *)&v10.maximum, *(double *)&v10.preferred);
}

- (void)beginEditingForSearchField
{
}

- (void)_performPresentation:(BOOL)a3
{
  BOOL v3 = a3;
  -[SBHLibrarySearchController _willPresentSearchAnimated:](self, "_willPresentSearchAnimated:");
  if (v3)
  {
    [(SBHLibrarySearchController *)self _layoutSearchViewsWithMode:2 withCompletion:0];
    uint64_t v5 = 3;
  }
  else
  {
    uint64_t v5 = 4;
  }
  [(SBHLibrarySearchController *)self _didPresentSearch];
  [(SBHLibrarySearchController *)self _layoutSearchViewsWithMode:v5 withCompletion:0];
}

- (void)_dismissPresentation:(BOOL)a3
{
  if (a3)
  {
    double v4 = [(SBHLibrarySearchController *)self searchField];
    [v4 setText:0];

    [(SBHLibrarySearchController *)self _layoutSearchViewsWithMode:2 withCompletion:0];
    [(SBHLibrarySearchController *)self _willDismissSearchAnimated:1];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __51__SBHLibrarySearchController__dismissPresentation___block_invoke;
    v5[3] = &unk_1E6AACAB8;
    v5[4] = self;
    [(SBHLibrarySearchController *)self _layoutSearchViewsWithMode:3 withCompletion:v5];
  }
  else
  {
    -[SBHLibrarySearchController _willDismissSearchAnimated:](self, "_willDismissSearchAnimated:");
    [(SBHLibrarySearchController *)self _didDismissSearch];
    [(SBHLibrarySearchController *)self _layoutSearchViewsWithMode:4 withCompletion:0];
  }
}

uint64_t __51__SBHLibrarySearchController__dismissPresentation___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) searchState];
  if (!result)
  {
    BOOL v3 = *(void **)(a1 + 32);
    return [v3 _didDismissSearch];
  }
  return result;
}

- (void)_willPresentSearchAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  [MEMORY[0x1E4F39CF8] setFrameStallSkipRequest:1];
  uint64_t v5 = [(UIView *)self->_searchResultsContainerView superview];

  if (v5)
  {
    [(SBHLibrarySearchController *)self bs_beginAppearanceTransitionForChildViewController:self->_searchResultsController toVisible:1 animated:v3];
    double v6 = [(SBHIconLibraryTableViewController *)self->_searchResultsController contentScrollView];
    [v6 _scrollToTopIfPossible:0];
  }
  else
  {
    searchResultsContainerView = self->_searchResultsContainerView;
    [(UIView *)self->_containerView bounds];
    -[UIView setFrame:](searchResultsContainerView, "setFrame:");
    [(SBHLibrarySearchController *)self bs_beginAppearanceTransitionForChildViewController:self->_searchResultsController toVisible:1 animated:v3];
    [(UIView *)self->_containerView addSubview:self->_searchResultsContainerView];
    [(UIView *)self->_searchResultsContainerView layoutIfNeeded];
  }
  id v8 = (void *)MEMORY[0x1E4FA5E88];
  double v9 = [(UIView *)self->_containerView window];
  CAFrameRateRange v10 = [v8 matchMoveAnimationForPinningToView:v9];

  [v10 setAppliesX:1];
  double v11 = [(UIView *)self->_searchBackgroundView layer];
  [v11 addAnimation:v10 forKey:@"SBLibrarySearchMatchMoveAnimation"];

  CGFloat v12 = [(SBHLibrarySearchController *)self searchResultsUpdater];
  [v12 updateSearchResultsForSearchController:self];

  [(UIView *)self->_searchResultsContainerView bs_setHitTestingDisabled:0];
  [(UIView *)self->_searchResultsContainerView setHidden:0];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  double v13 = self->_searchResultsGradientMaskLayers;
  uint64_t v14 = [(NSArray *)v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v21;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v21 != v16) {
          objc_enumerationMutation(v13);
        }
        objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * v17++), "setHidden:", 0, (void)v20);
      }
      while (v15 != v17);
      uint64_t v15 = [(NSArray *)v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v15);
  }

  CGFloat v18 = objc_msgSend(MEMORY[0x1E4F28EB8], "sbh_defaultPPTNotificationCenter");
  [v18 postNotificationName:@"SBHLibraryViewControllerWillPresentSearchPPTNotification" object:self];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained willPresentSearchController:self];
  }
}

- (void)_didPresentSearch
{
  self->_int64_t searchState = 2;
  [(SBHLibrarySearchController *)self bs_endAppearanceTransitionForChildViewController:self->_searchResultsController toVisible:1];
  [(SBHSearchTextField *)self->_searchField setAlignmentBehavior:1 animated:1];
  BOOL v3 = objc_msgSend(MEMORY[0x1E4F28EB8], "sbh_defaultPPTNotificationCenter");
  [v3 postNotificationName:@"SBHLibraryViewControllerDidPresentSearchPPTNotification" object:self];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained didPresentSearchController:self];
  }
}

- (void)_willDismissSearchAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  [MEMORY[0x1E4F39CF8] setFrameStallSkipRequest:1];
  [(SBHLibrarySearchController *)self _searchBackgroundContentReplacedWithSnapshot:0];
  self->_int64_t searchState = 0;
  [(UIView *)self->_searchResultsContainerView bs_setHitTestingDisabled:1];
  [(SBHSearchBar *)self->_searchBar endEditing:1];
  [(SBHSearchBar *)self->_searchBar setShowsCancelButton:0 animated:v3];
  [(SBHLibrarySearchController *)self bs_beginAppearanceTransitionForChildViewController:self->_searchResultsController toVisible:0 animated:v3];
  [(SBHLibrarySearchController *)self resetSearchController:v3 clearSearchResults:0 resetSearchBarTransformAndAlpha:0];
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F28EB8], "sbh_defaultPPTNotificationCenter");
  [v5 postNotificationName:@"SBHLibraryViewControllerWillDismissSearchPPTNotification" object:self];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained willDismissSearchController:self];
  }
}

- (void)_didDismissSearch
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  [(UIView *)self->_searchResultsContainerView setHidden:1];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  BOOL v3 = self->_searchResultsGradientMaskLayers;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v7++), "setHidden:", 1, (void)v12);
      }
      while (v5 != v7);
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }

  id v8 = [(SBHIconLibraryTableViewController *)self->_searchResultsController contentScrollView];
  [v8 _scrollToTopIfPossible:0];

  [(SBHLibrarySearchController *)self resetSearchController:0 clearSearchResults:1 resetSearchBarTransformAndAlpha:0];
  [(SBHLibrarySearchController *)self bs_endAppearanceTransitionForChildViewController:self->_searchResultsController toVisible:0];
  double v9 = objc_msgSend(MEMORY[0x1E4F28EB8], "sbh_defaultPPTNotificationCenter");
  [v9 postNotificationName:@"SBHLibraryViewControllerDidDismissSearchPPTNotification" object:self];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained didDismissSearchController:self];
  }
  double v11 = objc_msgSend(MEMORY[0x1E4FB1790], "focusSystemForEnvironment:", self, (void)v12);
  [v11 _focusEnvironmentWillDisappear:self];
}

- (void)resetSearchController:(BOOL)a3 clearSearchResults:(BOOL)a4 resetSearchBarTransformAndAlpha:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  BOOL v7 = a3;
  [(SBHSearchTextField *)self->_searchField setAlignmentBehavior:0 animated:a3];
  [(UISearchTextField *)self->_searchField setText:0];
  if (v6)
  {
    double v9 = [(SBHLibrarySearchController *)self searchResultsUpdater];
    [v9 updateSearchResultsForSearchController:self];
  }
  [(SBHSearchBar *)self->_searchBar endEditing:1];
  [(SBHSearchBar *)self->_searchBar setShowsCancelButton:0 animated:v7];
  if (v5)
  {
    searchBar = self->_searchBar;
    long long v11 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    v12[0] = *MEMORY[0x1E4F1DAB8];
    v12[1] = v11;
    void v12[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    [(SBHSearchBar *)searchBar setTransform:v12];
    [(SBHSearchBar *)self->_searchBar setAlpha:1.0];
  }
}

- (void)_searchBackgroundContentReplacedWithSnapshot:(BOOL)a3
{
  if (self->_searchBackgroundView)
  {
    BOOL v3 = a3;
    if (![(UIView *)self->_searchResultsContainerView isHidden])
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        searchBackgroundView = self->_searchBackgroundView;
        [(UIView *)searchBackgroundView setContentReplacedWithSnapshot:v3];
      }
    }
  }
}

- (UIEdgeInsets)_windowSafeAreaInsets
{
  double v2 = [(SBHLibrarySearchController *)self view];
  BOOL v3 = [v2 window];
  [v3 safeAreaInsets];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.right = v15;
  result.bottom = v14;
  result.left = v13;
  result.top = v12;
  return result;
}

- (BOOL)needsToManageTopInset
{
  double v2 = [(SBHLibrarySearchController *)self containingIconLocation];
  char v3 = [v2 isEqualToString:@"SBIconLocationAppLibraryOverlay"];

  return v3;
}

- (SBHLibrarySearchControllerContentViewControllerScrollViewProvider)contentViewController
{
  return self->_contentViewController;
}

- (SBHIconLibraryTableViewController)searchResultsController
{
  return self->_searchResultsController;
}

- (SBHSearchBar)searchBar
{
  return self->_searchBar;
}

- (unint64_t)searchBarAppearance
{
  return self->_searchBarAppearance;
}

- (BOOL)usesPlatterAppearance
{
  return self->_usesPlatterAppearance;
}

- (SBHSearchResultsUpdating)searchResultsUpdater
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_searchResultsUpdater);
  return (SBHSearchResultsUpdating *)WeakRetained;
}

- (SBHLibrarySearchControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBHLibrarySearchControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIView)searchDimmingView
{
  return self->_searchDimmingView;
}

- (void)setSearchDimmingView:(id)a3
{
}

- (SBIconListLayoutProvider)listLayoutProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_listLayoutProvider);
  return (SBIconListLayoutProvider *)WeakRetained;
}

- (BOOL)forcedSearchTextFieldNoneditable
{
  return self->_forcedSearchTextFieldNoneditable;
}

- (void)setForcedSearchTextFieldNoneditable:(BOOL)a3
{
  self->_forcedSearchTextFieldNoneditable = a3;
}

- (NSString)containingIconLocation
{
  return self->_containingIconLocation;
}

- (void)setContainingIconLocation:(id)a3
{
}

- (SBHSearchTextField)searchField
{
  return self->_searchField;
}

- (SBFFluidBehaviorSettings)searchAnimationSettings
{
  return self->_searchAnimationSettings;
}

- (void)setSearchAnimationSettings:(id)a3
{
}

- (BOOL)scrollViewBeganScrollingFromTop
{
  return self->_scrollViewBeganScrollingFromTop;
}

- (void)setScrollViewBeganScrollingFromTop:(BOOL)a3
{
  self->_scrollViewBeganScrollingFromTop = a3;
}

- (NSArray)contentViewGradientMaskLayers
{
  return self->_contentViewGradientMaskLayers;
}

- (NSArray)searchResultsGradientMaskLayers
{
  return self->_searchResultsGradientMaskLayers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchResultsGradientMaskLayers, 0);
  objc_storeStrong((id *)&self->_contentViewGradientMaskLayers, 0);
  objc_storeStrong((id *)&self->_searchAnimationSettings, 0);
  objc_storeStrong((id *)&self->_searchField, 0);
  objc_storeStrong((id *)&self->_containingIconLocation, 0);
  objc_destroyWeak((id *)&self->_listLayoutProvider);
  objc_storeStrong((id *)&self->_searchDimmingView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_searchResultsUpdater);
  objc_storeStrong((id *)&self->_searchBar, 0);
  objc_storeStrong((id *)&self->_searchResultsController, 0);
  objc_storeStrong((id *)&self->_contentViewController, 0);
  objc_storeStrong((id *)&self->_libraryVisualConfiguration, 0);
  objc_storeStrong((id *)&self->_searchVisualConfiguration, 0);
  objc_storeStrong((id *)&self->_pullToSearchSettings, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_searchResultsPlatterView, 0);
  objc_storeStrong((id *)&self->_searchBackgroundView, 0);
  objc_storeStrong((id *)&self->_searchResultsContainerView, 0);
  objc_storeStrong((id *)&self->_contentContainerView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
}

@end