@interface _UISearchPresentationController
+ (BOOL)shouldExciseSearchBar:(id)a3 duringPresentationWithPresenter:(id)a4;
- (BOOL)_inheritsPresentingViewControllerThemeLevel;
- (BOOL)_requiresDeferralToCoordinateWithNavigationTransitionAnimated:(BOOL)a3;
- (BOOL)_shouldDisableInteractionDuringTransitions;
- (BOOL)_shouldKeepCurrentFirstResponder;
- (BOOL)_shouldRespectDefinesPresentationContext;
- (BOOL)animatorShouldLayoutPresentationViews;
- (BOOL)forceObeyNavigationBarInsets;
- (BOOL)resultsUnderlapsSearchBar;
- (BOOL)searchBarCanContainScopeBar;
- (BOOL)searchBarShouldClipToBounds;
- (BOOL)searchBarToBecomeTopAttached;
- (BOOL)shouldAccountForStatusBar;
- (BOOL)shouldPresentInFullscreen;
- (CGRect)finalFrameForContainerView;
- (CGRect)frameOfPresentedViewInContainerView;
- (UIView)backgroundObscuringView;
- (UIView)searchBarContainerView;
- (_UISearchControllerPresenting)adaptivePresentationController;
- (_UISearchPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4;
- (double)_visibleRefreshControlHeightForTableView:(id)a3;
- (double)resultsControllerContentOffset;
- (double)statusBarAdjustment;
- (id)_constraintCopyOfConstraint:(id)a3 replaceItem:(id)a4 withItem:(id)a5;
- (id)_createVisualStyleForProvider:(id)a3;
- (id)_presentationControllerForTraitCollection:(id)a3;
- (int64_t)adaptivePresentationStyle;
- (unint64_t)edgeForHidingNavigationBar;
- (void)_dismissalTransitionWithSearchBarHostedByNavBarDidEnd:(BOOL)a3;
- (void)_dismissalTransitionWithSearchBarHostedByNavBarWillBegin;
- (void)_dismissalTransitionWithSearchBarNotHostedByNavBarDidEnd:(BOOL)a3;
- (void)_dismissalTransitionWithSearchBarNotHostedByNavBarWillBegin;
- (void)_exciseSearchBarFromCurrentContext;
- (void)_layoutPresentationWithSize:(CGSize)a3 transitionCoordinator:(id)a4;
- (void)_placeSearchBarBackIntoOriginalContext;
- (void)_presentationTransitionWithSearchBarHostedByNavBarDidEnd:(BOOL)a3;
- (void)_presentationTransitionWithSearchBarHostedByNavBarWillBegin;
- (void)_presentationTransitionWithSearchBarNotHostedByNavBarDidEnd:(BOOL)a3;
- (void)_presentationTransitionWithSearchBarNotHostedByNavBarWillBegin;
- (void)_transitionFromDidEnd;
- (void)_transitionToDidEnd;
- (void)_transitionToPresentationController:(id)a3 withTransitionCoordinator:(id)a4;
- (void)_updateContainerFinalFrameForNonExcisedSearchBar;
- (void)_updatePresentingViewControllerContentScrollViewWithOffsets:(CGSize)a3 transitionCoordinator:(id)a4;
- (void)containerViewWillLayoutSubviews;
- (void)contentSizeCategoryOrLegibilityWeightChanged;
- (void)dealloc;
- (void)dismissalTransitionDidEnd:(BOOL)a3;
- (void)dismissalTransitionWillBegin;
- (void)hideBackgroundObscuringView;
- (void)presentationTransitionDidEnd:(BOOL)a3;
- (void)presentationTransitionWillBegin;
- (void)showBackgroundObscuringView;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation _UISearchPresentationController

- (_UISearchPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4
{
  v11[2] = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"_UISearchPresentationController.m", 62, @"_UISearchPresentationController must present a UISearchController");
  }
  v10.receiver = self;
  v10.super_class = (Class)_UISearchPresentationController;
  v8 = [(UIPresentationController *)&v10 initWithPresentedViewController:a3 presentingViewController:a4];
  if (v8)
  {
    v8->_assistant = [[_UISearchPresentationAssistant alloc] initWithSearchPresentationController:v8];
    v11[0] = 0x1ED3F5AD8;
    v11[1] = 0x1ED3F5B38;
    -[UIPresentationController _registerForTraitTokenChanges:withTarget:action:](v8, "_registerForTraitTokenChanges:withTarget:action:", [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2], v8, sel_contentSizeCategoryOrLegibilityWeightChanged);
  }
  return v8;
}

- (void)dealloc
{
  self->_placeholderView = 0;
  self->_assistant = 0;

  self->_excisedSearchBarConstraitMap = 0;
  self->_placeholderConstraitMap = 0;
  v3.receiver = self;
  v3.super_class = (Class)_UISearchPresentationController;
  [(UIPresentationController *)&v3 dealloc];
}

+ (BOOL)shouldExciseSearchBar:(id)a3 duringPresentationWithPresenter:(id)a4
{
  uint64_t v6 = [a3 window];
  if (v6)
  {
    objc_opt_class();
    if (!a3)
    {
      objc_opt_class();
      objc_opt_class();
      if (a4)
      {
LABEL_16:
        LODWORD(v6) = objc_msgSend((id)objc_msgSend(a4, "_existingView"), "containsView:", a3);
        if (!v6) {
          return v6;
        }
      }
LABEL_17:
      LOBYTE(v6) = 1;
      return v6;
    }
    id v7 = a3;
    while ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v7 = (id)[v7 superview];
      if (!v7)
      {
        objc_opt_class();
        id v8 = a3;
        while ((objc_opt_isKindOfClass() & 1) == 0)
        {
          id v8 = (id)[v8 superview];
          if (!v8)
          {
            objc_opt_class();
            id v9 = a3;
            while ((objc_opt_isKindOfClass() & 1) == 0)
            {
              id v9 = (id)[v9 superview];
              if (!v9)
              {
                if (a4) {
                  goto LABEL_16;
                }
                goto LABEL_17;
              }
            }
            goto LABEL_14;
          }
        }
        break;
      }
    }
LABEL_14:
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (void)_updateContainerFinalFrameForNonExcisedSearchBar
{
  objc_super v3 = (void *)[(UIViewController *)[(UIPresentationController *)self presentedViewController] searchBar];
  objc_opt_class();
  if (v3)
  {
    v4 = v3;
    while ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v4 = (void *)[v4 superview];
      if (!v4) {
        goto LABEL_5;
      }
    }
    v5 = v4;
  }
  else
  {
LABEL_5:
    if (![v3 _containedInNavigationPalette]) {
      return;
    }
    v5 = objc_msgSend(-[_UISearchPresentationAssistant locateNavigationController](self->_assistant, "locateNavigationController"), "existingPaletteForEdge:", 2);
  }
  [v5 frame];
  self->_finalFrameForContainerView.origin.x = v6;
  self->_finalFrameForContainerView.origin.y = v7;
  self->_finalFrameForContainerView.size.width = v8;
  self->_finalFrameForContainerView.size.height = v9;
}

- (UIView)backgroundObscuringView
{
  return (UIView *)[(_UISearchPresentationAssistant *)self->_assistant dimmingView];
}

- (void)showBackgroundObscuringView
{
  id v2 = [(_UISearchPresentationAssistant *)self->_assistant dimmingView];
  [v2 display:1];
}

- (void)hideBackgroundObscuringView
{
  id v2 = [(_UISearchPresentationAssistant *)self->_assistant dimmingView];
  [v2 display:0];
}

- (void)_presentationTransitionWithSearchBarNotHostedByNavBarWillBegin
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  [(UIPresentationController *)self _setContainerIgnoresDirectTouchEvents:1];
  if ((objc_msgSend((id)-[UIViewController _managedPalette](-[UIPresentationController presentedViewController](self, "presentedViewController"), "_managedPalette"), "_supportsSpecialSearchBarTransitions") & 1) == 0)-[_UISearchPresentationAssistant ensureAppropriatelySizedSearchBar:](self->_assistant, "ensureAppropriatelySizedSearchBar:", -[UIViewController searchBar](-[UIPresentationController presentedViewController](self, "presentedViewController"), "searchBar")); {
  BOOL v3 = +[_UISearchPresentationController shouldExciseSearchBar:[(UIViewController *)[(UIPresentationController *)self presentedViewController] searchBar] duringPresentationWithPresenter:[(UIPresentationController *)self presentingViewController]];
  }
  BOOL v4 = [(_UISearchPresentationAssistant *)self->_assistant searchBarWillResizeForScopeBar];
  uint64_t v5 = 0;
  double v6 = 0.0;
  CGFloat v7 = &OBJC_IVAR___UIAction_stateObservers;
  if (objc_msgSend((id)-[UIViewController searchBar](-[UIPresentationController presentedViewController](self, "presentedViewController"), "searchBar"), "window")&& v3)
  {
    CGFloat v8 = (void *)[(UIViewController *)[(UIPresentationController *)self presentedViewController] searchBar];
    objc_opt_class();
    if (v8)
    {
      CGFloat v9 = v8;
      do
      {
        if (objc_opt_isKindOfClass()) {
          break;
        }
        CGFloat v9 = (void *)[v9 superview];
      }
      while (v9);
    }
    else
    {
      CGFloat v9 = 0;
    }
    [(_UISearchPresentationController *)self _visibleRefreshControlHeightForTableView:v9];
    double v6 = v10;
    BOOL v47 = v3;
    if (fabs(v10) >= 2.22044605e-16) {
      uint64_t v11 = [v9 _refreshControl];
    }
    else {
      uint64_t v11 = 0;
    }
    v12 = (void *)[v8 superview];
    v13 = [(_UISearchPresentationController *)self searchBarContainerView];
    v14 = [(UIViewController *)[(UIPresentationController *)self presentingViewController] view];
    if ([(UIViewController *)[(UIPresentationController *)self presentedViewController] _searchbarWasTableHeaderView])
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v8 _setMaskActive:0];
        [(UIView *)v14 adjustedContentInset];
        [(UIView *)v13 frame];
        -[UIView setFrame:](v13, "setFrame:");
      }
    }
    uint64_t v46 = v11;
    if ([v8 isFirstResponder]) {
      +[UIView _setIsResponderAncestorOfFirstResponder:startingAtFirstResponder:]((uint64_t)UIView, 0, v12);
    }
    [(_UISearchPresentationController *)self _exciseSearchBarFromCurrentContext];
    [v8 _setTransplanting:1];
    [v8 removeFromSuperview];
    [v12 addSubview:self->_placeholderView];
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    placeholderConstraitMap = self->_placeholderConstraitMap;
    uint64_t v16 = [(NSMapTable *)placeholderConstraitMap countByEnumeratingWithState:&v51 objects:v55 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v52;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v52 != v18) {
            objc_enumerationMutation(placeholderConstraitMap);
          }
          objc_msgSend(*(id *)(*((void *)&v51 + 1) + 8 * i), "addConstraints:", -[NSMapTable objectForKey:](self->_placeholderConstraitMap, "objectForKey:", *(void *)(*((void *)&v51 + 1) + 8 * i)));
        }
        uint64_t v17 = [(NSMapTable *)placeholderConstraitMap countByEnumeratingWithState:&v51 objects:v55 count:16];
      }
      while (v17);
    }

    self->_placeholderConstraitMap = 0;
    if (v9)
    {
      BOOL v3 = v47;
      CGFloat v7 = &OBJC_IVAR___UIAction_stateObservers;
      uint64_t v5 = v46;
      if ((void *)[v9 tableHeaderView] == v8)
      {
        *(unsigned char *)&self->_controllerFlags |= 1u;
        [v9 setTableHeaderView:self->_placeholderView];
      }
    }
    else
    {
      BOOL v3 = v47;
      CGFloat v7 = &OBJC_IVAR___UIAction_stateObservers;
      uint64_t v5 = v46;
    }
  }
  id v20 = [(UIViewController *)[(UIPresentationController *)self presentingViewController] transitionCoordinator];
  -[_UISearchPresentationAssistant setPresentationWasAnimated:](self->_assistant, "setPresentationWasAnimated:", [v20 isAnimated]);
  if ([(UIViewController *)[(UIPresentationController *)self presentedViewController] obscuresBackgroundDuringPresentation]&& ![(_UISearchPresentationAssistant *)self->_assistant presentationIsPopoverToOverFullScreenAdaptation])
  {
    [(UIView *)[(UIPresentationController *)self containerView] addSubview:[(_UISearchPresentationController *)self backgroundObscuringView]];
    if ([v20 isAnimated])
    {
      v50[0] = MEMORY[0x1E4F143A8];
      v50[1] = 3221225472;
      v50[2] = __97___UISearchPresentationController__presentationTransitionWithSearchBarNotHostedByNavBarWillBegin__block_invoke;
      v50[3] = &unk_1E5303BB0;
      v50[4] = self;
      [v20 animateAlongsideTransition:v50 completion:0];
    }
    else
    {
      [(_UISearchPresentationController *)self showBackgroundObscuringView];
    }
  }
  if ([(UIViewController *)[(UIPresentationController *)self presentedViewController] _hidesNavigationBarDuringPresentationRespectingInlineSearch])
  {
    id v21 = [(_UISearchPresentationAssistant *)self->_assistant locateNavigationController];
    if (v21)
    {
      v22 = v21;
      if (([v21 isNavigationBarHidden] & 1) == 0)
      {
        [v22 _setNavigationBarHidesCompletelyOffscreen:1];
        [v22 _setSearchHidNavigationBar:1];
        if (objc_msgSend((id)-[UIViewController searchBar](-[UIPresentationController presentedViewController](self, "presentedViewController"), "searchBar"), "_containedInNavigationPalette"))
        {
          v23 = (void *)[v22 existingPaletteForEdge:2];
          [v23 setVisibleWhenPinningBarIsHidden:1];
          [v23 frame];
          self->_finalFrameForContainerView.origin.x = v24;
          self->_finalFrameForContainerView.origin.y = v25;
          self->_finalFrameForContainerView.size.width = v26;
          self->_finalFrameForContainerView.size.height = v27;
          if ([v23 _supportsSpecialSearchBarTransitions])
          {
            v28 = (void *)[v23 _searchBar];
            objc_msgSend(v28, "_barHeightForBarMetrics:barPosition:", objc_msgSend(v28, "_barMetricsForOrientation:", objc_msgSend(v28, "_expectedInterfaceOrientation")), 3);
            self->_finalFrameForContainerView.size.height = v29;
          }
          objc_msgSend((id)objc_msgSend(v22, "navigationBar"), "frame");
          self->_finalFrameForContainerView.origin.y = self->_finalFrameForContainerView.origin.y - CGRectGetHeight(v57);
        }
        double v30 = *MEMORY[0x1E4F1DB28];
        double v31 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
        double v32 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
        double v33 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
        if (v3
          && ![(_UISearchPresentationController *)self animatorShouldLayoutPresentationViews])
        {
          objc_msgSend((id)objc_msgSend(v22, "navigationBar"), "frame");
          double v38 = v37;
          [(UIView *)[(_UISearchPresentationController *)self searchBarContainerView] frame];
          double v30 = v39;
          double v32 = v40;
          double v33 = v41;
          double v43 = v42 - v38;
          if (objc_msgSend((id)objc_msgSend(v22, "navigationBar"), "barPosition") == 3)
          {
            [(_UISearchPresentationAssistant *)self->_assistant statusBarAdjustment];
            double v43 = v43 - v44;
            double v33 = v33 + v44;
          }
          double v45 = 0.0;
          if (fabs(v6) >= 2.22044605e-16) {
            double v45 = v6;
          }
          double v31 = v43 - v45;
          self->_finalFrameForContainerView.origin.x = v30;
          self->_finalFrameForContainerView.origin.y = v31;
          self->_finalFrameForContainerView.size.width = v32;
          self->_finalFrameForContainerView.size.height = v33;
          int v34 = 1;
        }
        else
        {
          int v34 = 0;
        }
        if ([v20 isAnimated])
        {
          v48[0] = MEMORY[0x1E4F143A8];
          v48[1] = 3221225472;
          v48[2] = __97___UISearchPresentationController__presentationTransitionWithSearchBarNotHostedByNavBarWillBegin__block_invoke_2;
          v48[3] = &unk_1E5303BD8;
          v48[4] = v22;
          v48[5] = self;
          char v49 = v34;
          *(double *)&v48[7] = v30;
          *(double *)&v48[8] = v31;
          *(double *)&v48[9] = v32;
          *(double *)&v48[10] = v33;
          v48[6] = v5;
          [v20 animateAlongsideTransition:v48 completion:0];
        }
        else
        {
          [v22 setNavigationBarHidden:1 animated:0];
          if (v34) {
            -[UIView setFrame:]([(_UISearchPresentationController *)self searchBarContainerView], "setFrame:", v30, v31, v32, v33);
          }
        }
      }
    }
  }
  else
  {
    [(_UISearchPresentationController *)self _updateContainerFinalFrameForNonExcisedSearchBar];
  }
  if (v4)
  {
    objc_msgSend((id)-[UIViewController searchBar](-[UIPresentationController presentedViewController](self, "presentedViewController"), "searchBar"), "_scopeBarHeight");
    -[_UISearchPresentationController _updatePresentingViewControllerContentScrollViewWithOffsets:transitionCoordinator:](self, "_updatePresentingViewControllerContentScrollViewWithOffsets:transitionCoordinator:", v20, 0.0, v35);
  }
  if (v3) {
    char v36 = 2;
  }
  else {
    char v36 = 0;
  }
  *((unsigned char *)&self->super.super.isa + v7[528]) = *((unsigned char *)&self->super.super.isa + v7[528]) & 0xFD | v36;
}

- (void)_presentationTransitionWithSearchBarNotHostedByNavBarDidEnd:(BOOL)a3
{
  if (!a3)
  {
    [(_UISearchPresentationController *)self _placeSearchBarBackIntoOriginalContext];
    if ([(UIViewController *)[(UIPresentationController *)self presentedViewController] obscuresBackgroundDuringPresentation]&& ![(_UISearchPresentationAssistant *)self->_assistant presentationIsPopoverToOverFullScreenAdaptation])
    {
      [(UIView *)[(_UISearchPresentationController *)self backgroundObscuringView] removeFromSuperview];
    }
    if ([(UIViewController *)[(UIPresentationController *)self presentedViewController] _hidesNavigationBarDuringPresentationRespectingInlineSearch])
    {
      id v4 = [(_UISearchPresentationAssistant *)self->_assistant locateNavigationController];
      if (v4)
      {
        uint64_t v5 = v4;
        if ([v4 _searchHidNavigationBar]) {
          [v5 setNavigationBarHidden:0 animated:0];
        }
      }
    }
  }
  CGSize v6 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
  self->_finalFrameForContainerView.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
  self->_finalFrameForContainerView.size = v6;
}

- (void)_dismissalTransitionWithSearchBarNotHostedByNavBarWillBegin
{
  id v3 = [(UIViewController *)[(UIPresentationController *)self presentingViewController] transitionCoordinator];
  if (objc_msgSend((id)-[UIViewController searchBar](-[UIPresentationController presentedViewController](self, "presentedViewController"), "searchBar"), "_scopeBarIsVisible"))int v4 = objc_msgSend((id)-[UIViewController searchBar](-[UIPresentationController presentedViewController](self, "presentedViewController"), "searchBar"), "_shouldCombineLandscapeBars") ^ 1; {
  else
  }
    int v4 = 0;
  if ([(UIViewController *)[(UIPresentationController *)self presentedViewController] obscuresBackgroundDuringPresentation]&& ![(_UISearchPresentationAssistant *)self->_assistant presentationIsPopoverToOverFullScreenAdaptation])
  {
    if ([v3 isAnimated])
    {
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __94___UISearchPresentationController__dismissalTransitionWithSearchBarNotHostedByNavBarWillBegin__block_invoke;
      v28[3] = &unk_1E5303BB0;
      v28[4] = self;
      [v3 animateAlongsideTransition:v28 completion:0];
    }
    else
    {
      [(_UISearchPresentationController *)self hideBackgroundObscuringView];
    }
  }
  if ([(UIViewController *)[(UIPresentationController *)self presentedViewController] _hidesNavigationBarDuringPresentationRespectingInlineSearch])
  {
    id v5 = [(_UISearchPresentationAssistant *)self->_assistant locateNavigationController];
    if (v5)
    {
      CGSize v6 = v5;
      if ([v5 _searchHidNavigationBar])
      {
        if (objc_msgSend((id)-[UIViewController searchBar](-[UIPresentationController presentedViewController](self, "presentedViewController"), "searchBar"), "_containedInNavigationPalette"))
        {
          CGFloat v7 = (void *)[v6 existingPaletteForEdge:2];
          [v7 frame];
          self->_finalFrameForContainerView.origin.x = v8;
          self->_finalFrameForContainerView.origin.y = v9;
          self->_finalFrameForContainerView.size.width = v10;
          self->_finalFrameForContainerView.size.height = v11;
          if ([v7 _supportsSpecialSearchBarTransitions])
          {
            v12 = (void *)[v7 _searchBar];
            objc_msgSend(v12, "_barHeightForBarMetrics:barPosition:", objc_msgSend(v12, "_barMetricsForOrientation:", objc_msgSend(v12, "_expectedInterfaceOrientation")), 2);
            self->_finalFrameForContainerView.size.height = v13;
          }
          objc_msgSend((id)objc_msgSend(v6, "navigationBar"), "frame");
          self->_finalFrameForContainerView.origin.y = CGRectGetHeight(v29) + self->_finalFrameForContainerView.origin.y;
        }
        if ((*(unsigned char *)&self->_controllerFlags & 2) != 0)
        {
          objc_msgSend((id)objc_msgSend(v6, "navigationBar"), "frame");
          double v20 = v19;
          [(UIView *)[(_UISearchPresentationController *)self searchBarContainerView] frame];
          double v14 = v21;
          double v17 = v22;
          double v16 = v23;
          double v15 = v20 + v24;
          if (objc_msgSend((id)objc_msgSend(v6, "navigationBar"), "barPosition") == 3)
          {
            [(_UISearchPresentationAssistant *)self->_assistant statusBarAdjustment];
            double v15 = v15 + v25;
            double v16 = v16 - v25;
          }
          self->_finalFrameForContainerView.origin.x = v14;
          self->_finalFrameForContainerView.origin.y = v15;
          self->_finalFrameForContainerView.size.width = v17;
          self->_finalFrameForContainerView.size.height = v16;
        }
        else
        {
          double v14 = *MEMORY[0x1E4F1DB28];
          double v15 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
          double v17 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
          double v16 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
        }
        if ([v3 isAnimated])
        {
          v27[0] = MEMORY[0x1E4F143A8];
          v27[1] = 3221225472;
          v27[2] = __94___UISearchPresentationController__dismissalTransitionWithSearchBarNotHostedByNavBarWillBegin__block_invoke_2;
          v27[3] = &unk_1E5303C00;
          v27[4] = v6;
          v27[5] = self;
          *(double *)&v27[6] = v14;
          *(double *)&v27[7] = v15;
          *(double *)&v27[8] = v17;
          *(double *)&v27[9] = v16;
          v26[0] = MEMORY[0x1E4F143A8];
          v26[1] = 3221225472;
          v26[2] = __94___UISearchPresentationController__dismissalTransitionWithSearchBarNotHostedByNavBarWillBegin__block_invoke_3;
          v26[3] = &unk_1E5303BB0;
          v26[4] = v6;
          [v3 animateAlongsideTransition:v27 completion:v26];
        }
        else
        {
          [v6 setNavigationBarHidden:0 animated:0];
          if ((*(unsigned char *)&self->_controllerFlags & 2) != 0) {
            -[UIView setFrame:]([(_UISearchPresentationController *)self searchBarContainerView], "setFrame:", v14, v15, v17, v16);
          }
          [v6 _setNavigationBarHidesCompletelyOffscreen:0];
          [v6 _setSearchHidNavigationBar:0];
        }
      }
    }
  }
  else
  {
    [(_UISearchPresentationController *)self _updateContainerFinalFrameForNonExcisedSearchBar];
  }
  if (v4)
  {
    objc_msgSend((id)-[UIViewController searchBar](-[UIPresentationController presentedViewController](self, "presentedViewController"), "searchBar"), "_scopeBarHeight");
    -[_UISearchPresentationController _updatePresentingViewControllerContentScrollViewWithOffsets:transitionCoordinator:](self, "_updatePresentingViewControllerContentScrollViewWithOffsets:transitionCoordinator:", v3, 0.0, -v18);
  }
}

- (void)_dismissalTransitionWithSearchBarNotHostedByNavBarDidEnd:(BOOL)a3
{
  if (a3)
  {
    id v4 = [(UIViewController *)[(UIPresentationController *)self presentingViewController] transitionCoordinator];
    id v5 = [(UIPresentationController *)self presentedViewController];
    CGSize v6 = (void *)[(UIViewController *)v5 searchBar];
    [(UIPresentationController *)self _setContainerIgnoresDirectTouchEvents:0];
    [(_UISearchPresentationController *)self _placeSearchBarBackIntoOriginalContext];
    if ([(UIViewController *)v5 obscuresBackgroundDuringPresentation]&& ![(_UISearchPresentationAssistant *)self->_assistant presentationIsPopoverToOverFullScreenAdaptation])
    {
      [(UIView *)[(_UISearchPresentationController *)self backgroundObscuringView] removeFromSuperview];
    }
    [(_UISearchPresentationAssistant *)self->_assistant removeContainerViewFromSuperview];
    if ([v6 _containedInNavigationPalette]
      && [(UIViewController *)v5 _hidesNavigationBarDuringPresentationRespectingInlineSearch])
    {
      objc_msgSend((id)objc_msgSend(-[_UISearchPresentationAssistant locateNavigationController](self->_assistant, "locateNavigationController"), "existingPaletteForEdge:", 2), "setVisibleWhenPinningBarIsHidden:", 0);
    }
    if (([v4 isAnimated] & 1) == 0)
    {
      if ([(UIViewController *)v5 _previousSearchBarPosition] != -1)
      {
        objc_msgSend(v6, "_setBarPosition:", -[UIViewController _previousSearchBarPosition](v5, "_previousSearchBarPosition"));
        BOOL v7 = [v6 barPosition] == 3
          && [(UIViewController *)v5 _previousSearchBarPosition] != 3;
        [v6 _setMaskActive:v7];
        [(UIViewController *)v5 set_previousSearchBarPosition:-1];
      }
      [v6 _setScopeBarHidden:1];
    }
  }
  CGSize v8 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
  self->_finalFrameForContainerView.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
  self->_finalFrameForContainerView.size = v8;
}

- (void)_presentationTransitionWithSearchBarHostedByNavBarWillBegin
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  [(UIPresentationController *)self _setContainerIgnoresDirectTouchEvents:1];
  [(_UISearchPresentationAssistant *)self->_assistant searchBarWillResizeForScopeBar];
  id v3 = [(UIViewController *)[(UIPresentationController *)self presentingViewController] transitionCoordinator];
  -[_UISearchPresentationAssistant setPresentationWasAnimated:](self->_assistant, "setPresentationWasAnimated:", [v3 isAnimated]);
  if ([(UIViewController *)[(UIPresentationController *)self presentedViewController] obscuresBackgroundDuringPresentation]&& ![(_UISearchPresentationAssistant *)self->_assistant presentationIsPopoverToOverFullScreenAdaptation])
  {
    [(UIView *)[(UIPresentationController *)self containerView] addSubview:[(_UISearchPresentationController *)self backgroundObscuringView]];
    if ([v3 isAnimated])
    {
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __94___UISearchPresentationController__presentationTransitionWithSearchBarHostedByNavBarWillBegin__block_invoke;
      v27[3] = &unk_1E5303BB0;
      v27[4] = self;
      [v3 animateAlongsideTransition:v27 completion:0];
    }
    else
    {
      [(_UISearchPresentationController *)self showBackgroundObscuringView];
    }
  }
  id v4 = [(_UISearchPresentationAssistant *)self->_assistant locateNavigationController];
  id v5 = (void *)[v4 navigationBar];
  CGSize v6 = (void *)[v5 topItem];
  BOOL v7 = (UIViewController *)[v6 _searchControllerIfAllowed];
  if (v7 == [(UIPresentationController *)self presentedViewController]
    && (objc_msgSend((id)objc_msgSend(v6, "_stackEntry"), "isSearchActive") & 1) == 0)
  {
    [v5 _presentHostedSearchWithTransitionCoordinator:v3];
    int has_internal_diagnostics = os_variant_has_internal_diagnostics();
    char v11 = objc_msgSend((id)objc_msgSend(v6, "_stackEntry"), "isSearchActive");
    if (has_internal_diagnostics)
    {
      if ((v11 & 1) == 0)
      {
        double v20 = __UIFaultDebugAssertLog();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
        {
          uint64_t v21 = [v6 _stackEntry];
          *(_DWORD *)buf = 138412290;
          uint64_t v29 = v21;
          _os_log_fault_impl(&dword_1853B0000, v20, OS_LOG_TYPE_FAULT, "stackEntry should register searchActive. %@", buf, 0xCu);
        }
      }
    }
    else if ((v11 & 1) == 0)
    {
      double v22 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_MergedGlobals_19_9) + 8);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        uint64_t v23 = [v6 _stackEntry];
        *(_DWORD *)buf = 138412290;
        uint64_t v29 = v23;
        _os_log_impl(&dword_1853B0000, v22, OS_LOG_TYPE_ERROR, "stackEntry should register searchActive. %@", buf, 0xCu);
      }
    }
    [v5 frame];
    self->_finalFrameForContainerView.origin.x = v12;
    self->_finalFrameForContainerView.origin.y = v13;
    self->_finalFrameForContainerView.size.width = v14;
    self->_finalFrameForContainerView.size.height = v15;
    double v16 = -[_UINavigationBarLayout layoutHeights](objc_msgSend((id)objc_msgSend(v6, "_stackEntry"), "activeLayout"));
    self->_finalFrameForContainerView.size.height = v17;
    if (objc_msgSend(v3, "isAnimated", v16))
    {
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __94___UISearchPresentationController__presentationTransitionWithSearchBarHostedByNavBarWillBegin__block_invoke_21;
      v26[3] = &unk_1E5303BB0;
      v26[4] = v4;
      [v3 animateAlongsideTransition:v26 completion:0];
    }
    else
    {
      [v4 _layoutTopViewController];
    }
  }
  else
  {
    uint64_t v8 = [(UIViewController *)[(UIPresentationController *)self presentedViewController] _navigationItemCurrentlyDisplayingSearchController];
    CGFloat v9 = (void *)v8;
    if (v8 && (void *)v8 == v6) {
      goto LABEL_10;
    }
    if (os_variant_has_internal_diagnostics())
    {
      double v24 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
      {
        uint64_t v25 = [v5 items];
        *(_DWORD *)buf = 138412546;
        uint64_t v29 = v25;
        __int16 v30 = 2112;
        double v31 = v9;
        _os_log_fault_impl(&dword_1853B0000, v24, OS_LOG_TYPE_FAULT, "Surprise! Activating a search controller whose navigation item is not at the top of the stack. This case needs examination in UIKit. items = %@,\nsearch hosting item = %@", buf, 0x16u);
      }
    }
    else
    {
      double v18 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB25E4E8) + 8);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        uint64_t v19 = [v5 items];
        *(_DWORD *)buf = 138412546;
        uint64_t v29 = v19;
        __int16 v30 = 2112;
        double v31 = v9;
        _os_log_impl(&dword_1853B0000, v18, OS_LOG_TYPE_ERROR, "Surprise! Activating a search controller whose navigation item is not at the top of the stack. This case needs examination in UIKit. items = %@,\nsearch hosting item = %@", buf, 0x16u);
      }
    }
    if (v9)
    {
LABEL_10:
      objc_msgSend((id)objc_msgSend(v9, "_stackEntry"), "setSearchActive:", 1);
      objc_msgSend((id)-[UIViewController searchBar](-[UIPresentationController presentedViewController](self, "presentedViewController"), "searchBar"), "_driveTransitionToSearchLayoutState:", 3);
    }
  }
  *(unsigned char *)&self->_controllerFlags &= ~2u;
}

- (void)_presentationTransitionWithSearchBarHostedByNavBarDidEnd:(BOOL)a3
{
  if (!a3
    && [(UIViewController *)[(UIPresentationController *)self presentedViewController] obscuresBackgroundDuringPresentation]&& ![(_UISearchPresentationAssistant *)self->_assistant presentationIsPopoverToOverFullScreenAdaptation])
  {
    [(UIView *)[(_UISearchPresentationController *)self backgroundObscuringView] removeFromSuperview];
  }
  CGSize v4 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
  self->_finalFrameForContainerView.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
  self->_finalFrameForContainerView.size = v4;
}

- (void)_dismissalTransitionWithSearchBarHostedByNavBarWillBegin
{
  id v3 = [(UIViewController *)[(UIPresentationController *)self presentingViewController] transitionCoordinator];
  if ([(UIViewController *)[(UIPresentationController *)self presentedViewController] obscuresBackgroundDuringPresentation]&& ![(_UISearchPresentationAssistant *)self->_assistant presentationIsPopoverToOverFullScreenAdaptation])
  {
    if ([v3 isAnimated])
    {
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __91___UISearchPresentationController__dismissalTransitionWithSearchBarHostedByNavBarWillBegin__block_invoke;
      v10[3] = &unk_1E5303BB0;
      v10[4] = self;
      [v3 animateAlongsideTransition:v10 completion:0];
    }
    else
    {
      [(_UISearchPresentationController *)self hideBackgroundObscuringView];
    }
  }
  id v4 = [(_UISearchPresentationAssistant *)self->_assistant locateNavigationController];
  id v5 = (void *)[v4 navigationBar];
  CGSize v6 = (void *)[v5 topItem];
  BOOL v7 = (UIViewController *)[v6 _searchControllerIfAllowed];
  if (v7 == [(UIPresentationController *)self presentedViewController]
    && objc_msgSend((id)objc_msgSend(v6, "_stackEntry"), "isSearchActive"))
  {
    [v5 _dismissHostedSearchWithTransitionCoordinator:v3];
    if ([v3 isAnimated])
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __91___UISearchPresentationController__dismissalTransitionWithSearchBarHostedByNavBarWillBegin__block_invoke_2;
      v9[3] = &unk_1E5303BB0;
      v9[4] = v4;
      [v3 animateAlongsideTransition:v9 completion:0];
    }
    else
    {
      [v4 _layoutTopViewController];
    }
  }
  else
  {
    uint64_t v8 = (void *)[(UIViewController *)[(UIPresentationController *)self presentedViewController] _navigationItemCurrentlyDisplayingSearchController];
    if (objc_msgSend((id)objc_msgSend(v8, "_stackEntry"), "isSearchActive"))
    {
      objc_msgSend((id)objc_msgSend(v8, "_stackEntry"), "setSearchActive:", 0);
      objc_msgSend((id)-[UIViewController searchBar](-[UIPresentationController presentedViewController](self, "presentedViewController"), "searchBar"), "_driveTransitionToSearchLayoutState:", 2);
    }
  }
}

- (void)_dismissalTransitionWithSearchBarHostedByNavBarDidEnd:(BOOL)a3
{
  if (a3)
  {
    id v4 = [(UIViewController *)[(UIPresentationController *)self presentingViewController] transitionCoordinator];
    id v5 = [(UIPresentationController *)self presentedViewController];
    CGSize v6 = (void *)[(UIViewController *)v5 searchBar];
    [(UIPresentationController *)self _setContainerIgnoresDirectTouchEvents:0];
    [(_UISearchPresentationController *)self _placeSearchBarBackIntoOriginalContext];
    if ([(UIViewController *)v5 obscuresBackgroundDuringPresentation]&& ![(_UISearchPresentationAssistant *)self->_assistant presentationIsPopoverToOverFullScreenAdaptation])
    {
      [(UIView *)[(_UISearchPresentationController *)self backgroundObscuringView] removeFromSuperview];
    }
    [(_UISearchPresentationAssistant *)self->_assistant removeContainerViewFromSuperview];
    if (([v4 isAnimated] & 1) == 0)
    {
      if ([(UIViewController *)v5 _previousSearchBarPosition] != -1)
      {
        objc_msgSend(v6, "_setBarPosition:", -[UIViewController _previousSearchBarPosition](v5, "_previousSearchBarPosition"));
        BOOL v7 = [v6 barPosition] == 3
          && [(UIViewController *)v5 _previousSearchBarPosition] != 3;
        [v6 _setMaskActive:v7];
        [(UIViewController *)v5 set_previousSearchBarPosition:-1];
      }
      if (!v5) {
        goto LABEL_15;
      }
      int v8 = (HIDWORD(v5[1]._toolbarItems) >> 5) & 3;
      if (v8 != 1)
      {
        if (!v8) {
          dyld_program_sdk_at_least();
        }
LABEL_15:
        [v6 _setScopeBarHidden:1];
      }
    }
  }
  CGSize v9 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
  self->_finalFrameForContainerView.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
  self->_finalFrameForContainerView.size = v9;
}

- (BOOL)_requiresDeferralToCoordinateWithNavigationTransitionAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if (![(UIViewController *)[(UIPresentationController *)self presentedViewController] _navigationItemCurrentlyDisplayingSearchController])
  {
    v6.receiver = self;
    v6.super_class = (Class)_UISearchPresentationController;
    LOBYTE(v3) = [(UIPresentationController *)&v6 _requiresDeferralToCoordinateWithNavigationTransitionAnimated:v3];
  }
  return v3;
}

- (void)presentationTransitionWillBegin
{
  if ([(UIViewController *)[(UIPresentationController *)self presentedViewController] _navigationItemCurrentlyDisplayingSearchController])
  {
    [(_UISearchPresentationController *)self _presentationTransitionWithSearchBarHostedByNavBarWillBegin];
  }
  else
  {
    [(_UISearchPresentationController *)self _presentationTransitionWithSearchBarNotHostedByNavBarWillBegin];
  }
}

- (void)presentationTransitionDidEnd:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(UIViewController *)[(UIPresentationController *)self presentedViewController] _navigationItemCurrentlyDisplayingSearchController])
  {
    [(_UISearchPresentationController *)self _presentationTransitionWithSearchBarHostedByNavBarDidEnd:v3];
  }
  else
  {
    [(_UISearchPresentationController *)self _presentationTransitionWithSearchBarNotHostedByNavBarDidEnd:v3];
  }
}

- (void)dismissalTransitionWillBegin
{
  if ([(UIViewController *)[(UIPresentationController *)self presentedViewController] _navigationItemCurrentlyDisplayingSearchController])
  {
    [(_UISearchPresentationController *)self _dismissalTransitionWithSearchBarHostedByNavBarWillBegin];
  }
  else
  {
    [(_UISearchPresentationController *)self _dismissalTransitionWithSearchBarNotHostedByNavBarWillBegin];
  }
}

- (void)dismissalTransitionDidEnd:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(UIViewController *)[(UIPresentationController *)self presentedViewController] _navigationItemCurrentlyDisplayingSearchController])
  {
    [(_UISearchPresentationController *)self _dismissalTransitionWithSearchBarHostedByNavBarDidEnd:v3];
  }
  else
  {
    [(_UISearchPresentationController *)self _dismissalTransitionWithSearchBarNotHostedByNavBarDidEnd:v3];
  }
}

- (void)_transitionToDidEnd
{
}

- (void)_transitionFromDidEnd
{
}

- (void)_transitionToPresentationController:(id)a3 withTransitionCoordinator:(id)a4
{
  v17.receiver = self;
  v17.super_class = (Class)_UISearchPresentationController;
  [(UIPresentationController *)&v17 _transitionToPresentationController:a3 withTransitionCoordinator:a4];
  if ([(UIViewController *)[(UIPresentationController *)self presentedViewController] modalPresentationStyle] != UIModalPresentationPopover)
  {
    objc_msgSend((id)objc_msgSend(a3, "searchBarContainerView"), "addSubview:", -[UIViewController searchBar](-[UIPresentationController presentedViewController](self, "presentedViewController"), "searchBar"));
    [a3 resultsControllerContentOffset];
    double v7 = v6;
    int v8 = (void *)[(UIViewController *)[(UIPresentationController *)self presentedViewController] searchResultsController];
    uint64_t v9 = [v8 _contentOrObservableScrollViewForEdge:1];
    if (v8)
    {
      CGFloat v10 = (void *)v9;
      if (v9)
      {
        if ([v8 automaticallyAdjustsScrollViewInsets])
        {
          [v10 contentOffset];
          double v12 = v11;
          double v14 = v13;
          [v10 contentInset];
          double v16 = v14 + v15;
          objc_msgSend(v10, "setContentInset:", v7, 0.0, 0.0, 0.0);
          objc_msgSend(v10, "setContentOffset:", v12, v16);
        }
      }
    }
  }
}

- (id)_constraintCopyOfConstraint:(id)a3 replaceItem:(id)a4 withItem:(id)a5
{
  id v8 = (id)[a3 firstItem];
  id v9 = (id)[a3 secondItem];
  if (v8 == a4) {
    id v8 = a5;
  }
  if (v9 != a4) {
    a5 = v9;
  }
  CGFloat v10 = (void *)MEMORY[0x1E4F5B268];
  uint64_t v11 = [a3 firstAttribute];
  uint64_t v12 = [a3 relation];
  uint64_t v13 = [a3 secondAttribute];
  [a3 multiplier];
  double v15 = v14;
  [a3 constant];
  objc_super v17 = (void *)[v10 constraintWithItem:v8 attribute:v11 relatedBy:v12 toItem:a5 attribute:v13 multiplier:v15 constant:v16];
  [a3 priority];
  objc_msgSend(v17, "setPriority:");
  return v17;
}

- (void)_exciseSearchBarFromCurrentContext
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  BOOL v3 = (unsigned char *)[(UIViewController *)[(UIPresentationController *)self presentedViewController] searchBar];
  *(unsigned char *)&self->_controllerFlags = *(unsigned char *)&self->_controllerFlags & 0xFB | v3[103] & 4;
  id v4 = [UIView alloc];
  [v3 frame];
  id v5 = -[UIView initWithFrame:](v4, "initWithFrame:");
  self->_placeholderView = v5;
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v5, "setTranslatesAutoresizingMaskIntoConstraints:", [v3 translatesAutoresizingMaskIntoConstraints]);
  if ([v3 translatesAutoresizingMaskIntoConstraints])
  {
    uint64_t v6 = [v3 autoresizingMask];
    placeholderView = self->_placeholderView;
    [(UIView *)placeholderView setAutoresizingMask:v6];
  }
  else
  {
    self->_excisedSearchBarConstraitMap = (NSMapTable *)[objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:517 valueOptions:512 capacity:0];
    id v8 = [_UIViewBlockVisitor alloc];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __69___UISearchPresentationController__exciseSearchBarFromCurrentContext__block_invoke;
    v31[3] = &unk_1E5303C28;
    v31[4] = v3;
    v31[5] = self;
    id v9 = [(_UIViewBlockVisitor *)v8 initWithTraversalDirection:1 visitorBlock:v31];
    [v3 _receiveVisitor:v9];

    self->_placeholderConstraitMap = (NSMapTable *)[objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:517 valueOptions:512 capacity:0];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    obj = self->_excisedSearchBarConstraitMap;
    uint64_t v21 = [(NSMapTable *)obj countByEnumeratingWithState:&v27 objects:v33 count:16];
    if (v21)
    {
      uint64_t v20 = *(void *)v28;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v28 != v20) {
            objc_enumerationMutation(obj);
          }
          uint64_t v22 = v10;
          uint64_t v11 = *(void *)(*((void *)&v27 + 1) + 8 * v10);
          long long v23 = 0u;
          long long v24 = 0u;
          long long v25 = 0u;
          long long v26 = 0u;
          id v12 = [(NSMapTable *)self->_excisedSearchBarConstraitMap objectForKey:v11];
          uint64_t v13 = [v12 countByEnumeratingWithState:&v23 objects:v32 count:16];
          if (v13)
          {
            uint64_t v14 = v13;
            uint64_t v15 = *(void *)v24;
            do
            {
              for (uint64_t i = 0; i != v14; ++i)
              {
                if (*(void *)v24 != v15) {
                  objc_enumerationMutation(v12);
                }
                uint64_t v17 = *(void *)(*((void *)&v23 + 1) + 8 * i);
                id v18 = [(NSMapTable *)self->_placeholderConstraitMap objectForKey:v11];
                if (!v18)
                {
                  id v18 = (id)[MEMORY[0x1E4F1CA48] array];
                  [(NSMapTable *)self->_placeholderConstraitMap setObject:v18 forKey:v11];
                }
                objc_msgSend(v18, "addObject:", -[_UISearchPresentationController _constraintCopyOfConstraint:replaceItem:withItem:](self, "_constraintCopyOfConstraint:replaceItem:withItem:", v17, v3, self->_placeholderView));
              }
              uint64_t v14 = [v12 countByEnumeratingWithState:&v23 objects:v32 count:16];
            }
            while (v14);
          }
          uint64_t v10 = v22 + 1;
        }
        while (v22 + 1 != v21);
        uint64_t v21 = [(NSMapTable *)obj countByEnumeratingWithState:&v27 objects:v33 count:16];
      }
      while (v21);
    }
  }
}

- (void)_placeSearchBarBackIntoOriginalContext
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  placeholderView = self->_placeholderView;
  if (placeholderView)
  {
    id v4 = [(UIView *)placeholderView superview];
    id v5 = (void *)[(UIViewController *)[(UIPresentationController *)self presentedViewController] searchBar];
    if (*(unsigned char *)&self->_controllerFlags)
    {
      uint64_t v6 = self->_placeholderView;
      objc_opt_class();
      for (; v6; uint64_t v6 = [(UIView *)v6 superview])
      {
        if (objc_opt_isKindOfClass()) {
          break;
        }
      }
    }
    else
    {
      uint64_t v6 = 0;
    }
    [(UIView *)self->_placeholderView removeFromSuperview];
    char controllerFlags = (char)self->_controllerFlags;
    if ((controllerFlags & 4) == 0)
    {
      [v5 removeFromSuperview];
      v5[12] &= ~0x400000000000000uLL;
      char controllerFlags = (char)self->_controllerFlags;
    }
    if (controllerFlags)
    {
      [(UIView *)v6 setTableHeaderView:v5];
      *(unsigned char *)&self->_controllerFlags &= ~1u;
    }
    else
    {
      [(UIView *)v4 addSubview:v5];
    }
    if ([(UIView *)self->_placeholderView translatesAutoresizingMaskIntoConstraints])
    {
      [(UIView *)self->_placeholderView frame];
      objc_msgSend(v5, "setFrame:");
    }
    else
    {
      long long v15 = 0u;
      long long v16 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      excisedSearchBarConstraitMap = self->_excisedSearchBarConstraitMap;
      uint64_t v9 = [(NSMapTable *)excisedSearchBarConstraitMap countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v14;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v14 != v11) {
              objc_enumerationMutation(excisedSearchBarConstraitMap);
            }
            objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "addConstraints:", -[NSMapTable objectForKey:](self->_excisedSearchBarConstraitMap, "objectForKey:", *(void *)(*((void *)&v13 + 1) + 8 * i)));
          }
          uint64_t v10 = [(NSMapTable *)excisedSearchBarConstraitMap countByEnumeratingWithState:&v13 objects:v17 count:16];
        }
        while (v10);
      }
    }

    self->_placeholderView = 0;
    self->_excisedSearchBarConstraitMap = 0;
  }
}

- (double)_visibleRefreshControlHeightForTableView:(id)a3
{
  if (!a3
    || ![a3 _refreshControl]
    || objc_msgSend((id)objc_msgSend(a3, "_refreshControl"), "refreshControlState") != 2
    && objc_msgSend((id)objc_msgSend(a3, "_refreshControl"), "refreshControlState") != 3)
  {
    return 0.0;
  }
  id v4 = (void *)[a3 _refreshControl];
  [v4 _visibleHeight];
  return result;
}

- (BOOL)_shouldDisableInteractionDuringTransitions
{
  return 0;
}

- (BOOL)_shouldRespectDefinesPresentationContext
{
  return 1;
}

- (BOOL)shouldPresentInFullscreen
{
  return 0;
}

- (BOOL)_shouldKeepCurrentFirstResponder
{
  return 0;
}

- (CGRect)frameOfPresentedViewInContainerView
{
  CGFloat v3 = *MEMORY[0x1E4F1DB28];
  CGFloat v4 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  CGFloat v5 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  CGFloat v6 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  double v7 = v6;
  CGFloat v8 = v5;
  double MaxY = v4;
  CGFloat v10 = *MEMORY[0x1E4F1DB28];
  if ([(_UISearchPresentationAssistant *)self->_assistant presentationIsPopoverToOverFullScreenAdaptation])
  {
    uint64_t v11 = [(UIPresentationController *)self presentingViewController];
    objc_opt_class();
    double v7 = v6;
    CGFloat v8 = v5;
    double MaxY = v4;
    CGFloat v10 = v3;
    if (objc_opt_isKindOfClass())
    {
      [[(UIViewController *)v11 view] frame];
      CGFloat v10 = v12;
      CGFloat v8 = v13;
      double v15 = v14;
      objc_msgSend((id)-[UIViewController navigationBar](v11, "navigationBar"), "frame");
      double MaxY = CGRectGetMaxY(v32);
      objc_msgSend((id)-[UIViewController navigationBar](v11, "navigationBar"), "frame");
      double v7 = v15 - CGRectGetHeight(v33);
    }
  }
  v34.origin.x = v10;
  v34.origin.y = MaxY;
  v34.size.width = v8;
  v34.size.height = v7;
  v36.origin.x = v3;
  v36.origin.y = v4;
  v36.size.width = v5;
  v36.size.height = v6;
  if (CGRectEqualToRect(v34, v36))
  {
    id v16 = [(_UISearchPresentationAssistant *)self->_assistant locateNavigationController];
    [[(UIViewController *)[(UIPresentationController *)self presentingViewController] view] frame];
    CGFloat v10 = v17;
    double MaxY = v18;
    CGFloat v8 = v19;
    double v7 = v20;
    int v21 = objc_msgSend(v16, "_shouldNavigationBarInsetViewController:", -[UIPresentationController presentingViewController](self, "presentingViewController"));
    if (-[UIViewController _hidesNavigationBarDuringPresentationRespectingInlineSearch](-[UIPresentationController presentedViewController](self, "presentedViewController"), "_hidesNavigationBarDuringPresentationRespectingInlineSearch")&& [v16 _searchHidNavigationBar]&& ((-[UIViewController edgesForExtendedLayout](-[UIPresentationController presentingViewController](self, "presentingViewController"), "edgesForExtendedLayout") & 1) == 0? (int v22 = 1): (int v22 = v21), v22 == 1))
    {
      objc_msgSend(v16, "_frameForViewController:", -[UIPresentationController presentingViewController](self, "presentingViewController"));
      double MaxY = MaxY - v23;
      double v7 = v7 + v23;
    }
    else if (([(UIViewController *)[(UIPresentationController *)self presentedViewController] _hidesNavigationBarDuringPresentationRespectingInlineSearch] & 1) == 0&& [(_UISearchPresentationController *)self forceObeyNavigationBarInsets]&& v21)
    {
      objc_msgSend(v16, "_frameForViewController:", -[UIPresentationController presentingViewController](self, "presentingViewController"));
      CGFloat v10 = v24;
      double MaxY = v25;
      CGFloat v8 = v26;
      double v7 = v27;
    }
  }
  double v28 = v10;
  double v29 = MaxY;
  double v30 = v8;
  double v31 = v7;
  result.size.height = v31;
  result.size.width = v30;
  result.origin.y = v29;
  result.origin.x = v28;
  return result;
}

- (void)containerViewWillLayoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)_UISearchPresentationController;
  [(UIPresentationController *)&v5 containerViewWillLayoutSubviews];
  [(UIView *)[(UIPresentationController *)self containerView] bounds];
  -[_UISearchPresentationController _layoutPresentationWithSize:transitionCoordinator:](self, "_layoutPresentationWithSize:transitionCoordinator:", 0, v3, v4);
}

- (void)contentSizeCategoryOrLegibilityWeightChanged
{
  objc_msgSend((id)-[UIViewController searchBar](-[UIPresentationController presentedViewController](self, "presentedViewController"), "searchBar"), "layoutIfNeeded");
  double v3 = [(UIPresentationController *)self containerView];
  [(UIView *)v3 setNeedsLayout];
}

- (void)_layoutPresentationWithSize:(CGSize)a3 transitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  -[_UISearchPresentationAssistant setTransitioningToSizeCoordinator:](self->_assistant, "setTransitioningToSizeCoordinator:");
  CGFloat v8 = (void *)[(UIViewController *)[(UIPresentationController *)self presentedViewController] searchBar];
  int v9 = [v8 _scopeBarIsVisible];
  if (v9)
  {
    [v8 _setScopeBarPosition:0];
    if (objc_msgSend(v8, "_wouldCombineLandscapeBarsForSize:", width, height))
    {
      if (objc_msgSend(v8, "_shouldCombineLandscapeBarsForOrientation:", -[UIWindow _toWindowOrientation](-[UIView window](-[UIPresentationController containerView](self, "containerView"), "window"), "_toWindowOrientation")))uint64_t v10 = 1; {
      else
      }
        uint64_t v10 = 2;
    }
    else
    {
      uint64_t v10 = 2;
    }
    [v8 _setScopeBarPosition:v10];
  }
  if ([(_UISearchPresentationController *)self searchBarToBecomeTopAttached])
  {
    -[UIViewController set_previousSearchBarPosition:](-[UIPresentationController presentedViewController](self, "presentedViewController"), "set_previousSearchBarPosition:", [v8 barPosition]);
    [v8 _setBarPosition:3];
  }
  [(_UISearchPresentationAssistant *)self->_assistant updateSearchBarContainerFrame];
  double v13 = v12;
  double v14 = v11;
  if (v12 != *MEMORY[0x1E4F1DB30] || v11 != *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    [(_UISearchPresentationAssistant *)self->_assistant statusBarAdjustment];
    double v17 = v16;
    if (v9)
    {
      [v8 sizeToFit];
      [v8 frame];
      double v19 = v18;
      double v21 = v20;
      double v23 = v22;
      if ([(UIViewController *)[(UIPresentationController *)self presentedViewController] _hidesNavigationBarDuringPresentationRespectingInlineSearch])double v24 = v17; {
      else
      }
        double v24 = 0.0;
      objc_msgSend(v8, "setFrame:", v19, v24, v21, v23);
    }
    -[UIViewController _updateSearchResultsControllerWithDelta:]([(UIPresentationController *)self presentedViewController], "_updateSearchResultsControllerWithDelta:", v13, v14);
    if ([(UIViewController *)[(UIPresentationController *)self presentedViewController] _hidesNavigationBarDuringPresentationRespectingInlineSearch])
    {
      objc_msgSend(__UIStatusBarManagerForWindow(-[UIViewController _window](-[UIPresentationController presentedViewController](self, "presentedViewController"), "_window")), "defaultStatusBarHeightInOrientation:", -[UIWindowScene interfaceOrientation](-[UIWindow windowScene](-[UIViewController _window](-[UIPresentationController presentedViewController](self, "presentedViewController"), "_window"), "windowScene"), "interfaceOrientation"));
      double v14 = v14 + v25 - v17;
    }
    -[_UISearchPresentationController _updatePresentingViewControllerContentScrollViewWithOffsets:transitionCoordinator:](self, "_updatePresentingViewControllerContentScrollViewWithOffsets:transitionCoordinator:", a4, v13, v14);
    if (self->_placeholderView)
    {
      [v8 frame];
      double v26 = CGRectGetHeight(v46);
      [(UIView *)self->_placeholderView frame];
      double x = v47.origin.x;
      double y = v47.origin.y;
      double v29 = v47.size.width;
      if (CGRectGetHeight(v47) != v26) {
        -[UIView setFrame:](self->_placeholderView, "setFrame:", x, y, v29, v26);
      }
    }
  }
  if ([(UIViewController *)[(UIPresentationController *)self presentedViewController] _barPresentationStyle] == 2)
  {
    double v30 = (void *)[(UIViewController *)[(UIPresentationController *)self presentedViewController] searchBar];
    objc_opt_class();
    if (v30)
    {
      while ((objc_opt_isKindOfClass() & 1) == 0)
      {
        double v30 = (void *)[v30 superview];
        if (!v30) {
          goto LABEL_43;
        }
      }
      double v31 = [(UIView *)[(UIPresentationController *)self containerView] window];
      if (!v31) {
        double v31 = [(UIViewController *)[(UIPresentationController *)self presentingViewController] _window];
      }
      uint64_t v32 = [(UIWindow *)v31 _fromWindowOrientation];
      uint64_t v33 = [(UIWindow *)v31 _toWindowOrientation];
      +[UINavigationBar defaultSizeForOrientation:v33];
      double v35 = v34;
      [v30 frame];
      double v36 = v35 - CGRectGetHeight(v48);
      if ((([__UIStatusBarManagerForWindow(v31) isStatusBarHidden] & 1) != 0
         || ([__UIStatusBarManagerForWindow(v31) defaultStatusBarHeightInOrientation:v33], v37 == 0.0))
        && ([__UIStatusBarManagerForWindow(v31) isStatusBarHidden] & 1) == 0
        && ([__UIStatusBarManagerForWindow(v31) defaultStatusBarHeightInOrientation:v32], v38 != 0.0))
      {
        [__UIStatusBarManagerForWindow(v31) defaultStatusBarHeightInOrientation:v32];
        double v36 = v36 - v42;
      }
      else if (([__UIStatusBarManagerForWindow(v31) isStatusBarHidden] & 1) == 0)
      {
        [__UIStatusBarManagerForWindow(v31) defaultStatusBarHeightInOrientation:v33];
        if (v39 != 0.0)
        {
          if (([__UIStatusBarManagerForWindow(v31) isStatusBarHidden] & 1) != 0
            || ([__UIStatusBarManagerForWindow(v31) defaultStatusBarHeightInOrientation:v32], v40 == 0.0))
          {
            [__UIStatusBarManagerForWindow(v31) defaultStatusBarHeightInOrientation:v33];
            double v36 = v36 + v41;
          }
        }
      }
      if (fabs(v36) >= 2.22044605e-16) {
        -[UIViewController _updateSearchResultsControllerWithDelta:]([(UIPresentationController *)self presentedViewController], "_updateSearchResultsControllerWithDelta:", 0.0, v36);
      }
    }
  }
LABEL_43:
  [(UIViewController *)[(UIPresentationController *)self presentedViewController] _resultsContentScrollViewPresentationOffset];
  if (fabs(v43) >= 2.22044605e-16) {
    [(_UISearchPresentationAssistant *)self->_assistant resultsControllerContentOffset];
  }
  assistant = self->_assistant;
  [(_UISearchPresentationAssistant *)assistant setTransitioningToSizeCoordinator:0];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  -[_UISearchPresentationController _layoutPresentationWithSize:transitionCoordinator:](self, "_layoutPresentationWithSize:transitionCoordinator:");
  v8.receiver = self;
  v8.super_class = (Class)_UISearchPresentationController;
  -[UIPresentationController viewWillTransitionToSize:withTransitionCoordinator:](&v8, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, width, height);
}

- (void)_updatePresentingViewControllerContentScrollViewWithOffsets:(CGSize)a3 transitionCoordinator:(id)a4
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  id v7 = [(UIViewController *)[(UIPresentationController *)self presentingViewController] _contentOrObservableScrollViewForEdge:1];
  if (v7)
  {
    id v8 = v7;
    if ([v7 _compatibleContentInsetAdjustmentBehavior] == 101)
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      uint64_t v10 = __117___UISearchPresentationController__updatePresentingViewControllerContentScrollViewWithOffsets_transitionCoordinator___block_invoke;
      double v11 = &unk_1E5303C50;
      id v12 = v8;
      CGFloat v13 = width;
      CGFloat v14 = height;
      if ([a4 isAnimated]) {
        [a4 animateAlongsideTransition:v9 completion:0];
      }
      else {
        ((void (*)(void *, void))v10)(v9, 0);
      }
    }
  }
}

- (int64_t)adaptivePresentationStyle
{
  return 4;
}

- (id)_presentationControllerForTraitCollection:(id)a3
{
  if (-[UIViewController modalPresentationStyle](-[UIPresentationController presentedViewController](self, "presentedViewController"), "modalPresentationStyle") != UIModalPresentationPopover|| [a3 horizontalSizeClass] != 2)
  {
    return self;
  }
  objc_super v5 = [[_UISearchPopoverPresentationController alloc] initWithPresentedViewController:[(UIPresentationController *)self presentedViewController] presentingViewController:[(UIPresentationController *)self presentingViewController]];
  return v5;
}

- (BOOL)_inheritsPresentingViewControllerThemeLevel
{
  return 0;
}

- (id)_createVisualStyleForProvider:(id)a3
{
  id result = (id)[a3 styleForSearchPresentationController:self];
  if (!result)
  {
    v6.receiver = self;
    v6.super_class = (Class)_UISearchPresentationController;
    return [(UIPresentationController *)&v6 _createVisualStyleForProvider:a3];
  }
  return result;
}

- (UIView)searchBarContainerView
{
  return (UIView *)[(_UISearchPresentationAssistant *)self->_assistant searchBarContainerView];
}

- (BOOL)shouldAccountForStatusBar
{
  return [(_UISearchPresentationAssistant *)self->_assistant shouldAccountForStatusBar];
}

- (BOOL)resultsUnderlapsSearchBar
{
  return 1;
}

- (BOOL)searchBarCanContainScopeBar
{
  return 1;
}

- (BOOL)searchBarShouldClipToBounds
{
  return 1;
}

- (double)statusBarAdjustment
{
  [(_UISearchPresentationAssistant *)self->_assistant statusBarAdjustment];
  return result;
}

- (BOOL)searchBarToBecomeTopAttached
{
  return [(_UISearchPresentationAssistant *)self->_assistant searchBarToBecomeTopAttached];
}

- (double)resultsControllerContentOffset
{
  [(_UISearchPresentationAssistant *)self->_assistant resultsControllerContentOffset];
  return result;
}

- (_UISearchControllerPresenting)adaptivePresentationController
{
  return [(_UISearchPresentationAssistant *)self->_assistant adaptivePresentationController];
}

- (BOOL)animatorShouldLayoutPresentationViews
{
  return 0;
}

- (BOOL)forceObeyNavigationBarInsets
{
  return 0;
}

- (unint64_t)edgeForHidingNavigationBar
{
  return 1;
}

- (CGRect)finalFrameForContainerView
{
  double x = self->_finalFrameForContainerView.origin.x;
  double y = self->_finalFrameForContainerView.origin.y;
  double width = self->_finalFrameForContainerView.size.width;
  double height = self->_finalFrameForContainerView.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

@end