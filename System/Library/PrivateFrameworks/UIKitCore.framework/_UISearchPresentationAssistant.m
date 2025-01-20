@interface _UISearchPresentationAssistant
- (BOOL)_currentTransitionIsRotating;
- (BOOL)_statusBarPreferredHidden;
- (BOOL)_statusBarPreferredHiddenForInterfaceOrientation:(int64_t)a3;
- (BOOL)presentationIsPopoverToOverFullScreenAdaptation;
- (BOOL)presentationWasAnimated;
- (BOOL)searchBarToBecomeTopAttached;
- (BOOL)searchBarWillResizeForScopeBar;
- (BOOL)shouldAccountForStatusBar;
- (CGRect)_containerFrame;
- (CGRect)optimalFrameForSearchBar:(id)a3;
- (CGSize)updateSearchBarContainerFrame;
- (UIViewControllerTransitionCoordinator)transitioningToSizeCoordinator;
- (_UISearchControllerPresenting)adaptivePresentationController;
- (_UISearchPresentationAssistant)initWithSearchPresentationController:(id)a3;
- (double)_statusBarHeightChangeDueToRotation;
- (double)resultsControllerContentOffset;
- (double)statusBarAdjustment;
- (id)_searchBarContainerSuperview;
- (id)_searchControllerPresenting;
- (id)dimmingView;
- (id)locateNavigationController;
- (id)searchBarContainerView;
- (void)dealloc;
- (void)dimmingViewWasTapped:(id)a3;
- (void)ensureAppropriatelySizedSearchBar:(id)a3;
- (void)removeContainerViewFromSuperview;
- (void)setAdaptivePresentationController:(id)a3;
- (void)setPresentationWasAnimated:(BOOL)a3;
- (void)setTransitioningToSizeCoordinator:(id)a3;
@end

@implementation _UISearchPresentationAssistant

- (_UISearchPresentationAssistant)initWithSearchPresentationController:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_UISearchPresentationAssistant;
  v4 = [(_UISearchPresentationAssistant *)&v7 init];
  v5 = v4;
  if (v4)
  {
    v4->_searchPresentationController = (UIPresentationController *)a3;
    objc_opt_class();
    v5->_isFormSheetPresentation = objc_opt_isKindOfClass() & 1;
  }
  return v5;
}

- (void)dealloc
{
  self->_searchBarContainerView = 0;
  self->_dimmingView = 0;

  v3.receiver = self;
  v3.super_class = (Class)_UISearchPresentationAssistant;
  [(_UISearchPresentationAssistant *)&v3 dealloc];
}

- (id)_searchControllerPresenting
{
  if ([(UIPresentationController *)self->_searchPresentationController conformsToProtocol:&unk_1ED62C668])return self->_searchPresentationController; {
  else
  }
    return 0;
}

- (BOOL)presentationIsPopoverToOverFullScreenAdaptation
{
  v2 = [[(UIViewController *)[(UIPresentationController *)self->_searchPresentationController presentedViewController] presentingViewController] _originalPresentationController];
  if (v2)
  {
    objc_opt_class();
    LOBYTE(v2) = objc_opt_isKindOfClass();
  }
  return v2 & 1;
}

- (CGRect)optimalFrameForSearchBar:(id)a3
{
  if ([(_UISearchPresentationAssistant *)self presentationIsPopoverToOverFullScreenAdaptation])
  {
    [a3 frame];
    double v8 = v7;
    double v10 = v9;
  }
  else
  {
    id v11 = [(_UISearchPresentationAssistant *)self _searchBarContainerSuperview];
    if (!v11) {
      id v11 = +[UIWindow _applicationKeyWindow];
    }
    [v11 bounds];
    double Width = CGRectGetWidth(v17);
    [a3 bounds];
    objc_msgSend(a3, "sizeThatFits:", Width, CGRectGetHeight(v18));
    double v8 = v13;
    double v10 = v14;
    [a3 frame];
  }
  double v15 = v8;
  double v16 = v10;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (void)ensureAppropriatelySizedSearchBar:(id)a3
{
  -[_UISearchPresentationAssistant optimalFrameForSearchBar:](self, "optimalFrameForSearchBar:");
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  objc_msgSend(a3, "_defaultHeightForOrientation:", objc_msgSend(a3, "_expectedInterfaceOrientation"));
  double v11 = v10;
  [a3 frame];
  v18.origin.x = v12;
  v18.origin.y = v13;
  v18.size.width = v14;
  v18.size.height = v15;
  v17.origin.x = v5;
  v17.origin.y = v7;
  v17.size.width = v9;
  v17.size.height = v11;
  if (!CGRectEqualToRect(v17, v18))
  {
    objc_msgSend(a3, "setFrame:", v5, v7, v9, v11);
    [a3 layoutIfNeeded];
  }
}

- (CGRect)_containerFrame
{
  objc_super v3 = [(_UISearchPresentationAssistant *)self _searchBarContainerSuperview];
  double v4 = (void *)[(UIViewController *)[(UIPresentationController *)self->_searchPresentationController presentedViewController] searchBar];
  CGFloat v6 = *MEMORY[0x1E4F1DB28];
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  CGFloat v7 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  CGFloat v8 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  CGFloat v39 = v8;
  CGFloat v41 = v7;
  double v43 = v5;
  uint64_t v45 = *MEMORY[0x1E4F1DB28];
  if ([v4 window])
  {
    if (![(UIView *)v3 window]) {
      objc_super v3 = [[(UIViewController *)[(UIPresentationController *)self->_searchPresentationController presentingViewController] view] superview];
    }
    objc_msgSend(v4, "bounds", *(void *)&v8, *(void *)&v7, *(void *)&v5, v45);
    objc_msgSend(v4, "convertRect:toView:", v3);
    CGFloat v6 = v9;
    double v5 = v10;
    CGFloat v7 = v11;
    CGFloat v8 = v12;
  }
  objc_msgSend(v4, "frame", *(void *)&v39, *(void *)&v41, *(void *)&v43, v45);
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  [(_UISearchPresentationAssistant *)self ensureAppropriatelySizedSearchBar:v4];
  [v4 frame];
  v50.origin.x = v21;
  v50.origin.y = v22;
  v50.size.width = v23;
  v50.size.height = v24;
  v47.origin.x = v14;
  v47.origin.y = v16;
  v47.size.width = v18;
  v47.size.height = v20;
  BOOL v25 = CGRectEqualToRect(v47, v50);
  v48.origin.x = v6;
  v48.origin.y = v5;
  v48.size.width = v7;
  v48.size.height = v8;
  v51.origin.y = v44;
  v51.origin.x = v46;
  v51.size.height = v40;
  v51.size.width = v42;
  if (CGRectEqualToRect(v48, v51) || !v25)
  {
    CGFloat v6 = *MEMORY[0x1E4F1DAD8];
    double v5 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    [v4 bounds];
    CGFloat v7 = v30;
    double v29 = v31;
  }
  else
  {
    v26 = [[(UIViewController *)[(UIPresentationController *)self->_searchPresentationController presentedViewController] view] window];
    uint64_t v27 = [(UIWindow *)v26 interfaceOrientation];
    if ([(_UISearchPresentationAssistant *)self _currentTransitionIsRotating]) {
      uint64_t v27 = [(UIWindow *)v26 _toWindowOrientation];
    }
    objc_msgSend(v4, "_barHeightForBarMetrics:", objc_msgSend(v4, "_barMetricsForOrientation:", v27));
    double v29 = v28;
  }
  if ([(_UISearchPresentationAssistant *)self searchBarWillResizeForScopeBar])
  {
    [v4 _scopeBarHeight];
    double v29 = v29 + v32;
  }
  if ([v4 barPosition] == 3)
  {
    [(_UISearchPresentationAssistant *)self statusBarAdjustment];
    double v34 = v33;
    if (fabs(v33) >= 2.22044605e-16) {
      double v34 = (double)((int)(v5 - v33) & ~((int)(v5 - v33) >> 31));
    }
    double v29 = v29 + v33;
    double v5 = v34;
  }
  double v35 = v6;
  double v36 = v5;
  double v37 = v7;
  double v38 = v29;
  result.size.height = v38;
  result.size.width = v37;
  result.origin.y = v36;
  result.origin.x = v35;
  return result;
}

- (id)_searchBarContainerSuperview
{
  BOOL isFormSheetPresentation = self->_isFormSheetPresentation;
  searchPresentationController = self->_searchPresentationController;
  if (isFormSheetPresentation)
  {
    double v4 = [(UIPresentationController *)searchPresentationController containerView];
    return [(UIView *)v4 superview];
  }
  else
  {
    CGFloat v6 = [(UIPresentationController *)searchPresentationController presentedViewController];
    return [(UIViewController *)v6 view];
  }
}

- (id)searchBarContainerView
{
  objc_super v3 = [(_UISearchPresentationAssistant *)self _searchBarContainerSuperview];
  id v4 = [(_UISearchPresentationAssistant *)self _searchControllerPresenting];
  if (!self->_searchBarContainerView)
  {
    [(_UISearchPresentationAssistant *)self _containerFrame];
    double v9 = -[UIView initWithFrame:]([_UISearchBarContainerView alloc], "initWithFrame:", v5, v6, v7, v8);
    self->_searchBarContainerView = &v9->super;
    [(UIView *)v9 setAutoresizingMask:2];
    if (!v4 || [v4 searchBarShouldClipToBounds]) {
      [(UIView *)self->_searchBarContainerView setClipsToBounds:1];
    }
  }
  double v10 = (void *)[(UIViewController *)[(UIPresentationController *)self->_searchPresentationController presentedViewController] _viewToInsertSearchBarContainerViewUnder];
  if (v10 && (double v11 = v10, (UIView *)[v10 superview] == v3))
  {
    double v15 = [(UIView *)v3 subviews];
    uint64_t v16 = [(NSArray *)v15 indexOfObject:self->_searchBarContainerView];
    if (v16 != [(NSArray *)v15 indexOfObject:v11] - 1) {
      [(UIView *)v3 insertSubview:self->_searchBarContainerView belowSubview:v11];
    }
  }
  else
  {
    double v12 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v4, "presentedViewController"), "presentedViewController"), "presentationController"), "containerView");
    if (v12 && (double v13 = v12, (UIView *)[v12 superview] == v3))
    {
      CGFloat v18 = [(UIView *)v3 subviews];
      uint64_t v19 = [(NSArray *)v18 indexOfObject:v13];
      if (v3 != [(UIView *)self->_searchBarContainerView superview]
        || v19 && [(NSArray *)v18 indexOfObject:self->_searchBarContainerView] < v19 - 1)
      {
        [(UIView *)v3 insertSubview:self->_searchBarContainerView below:v13];
      }
    }
    else
    {
      if (v3 != [(UIView *)self->_searchBarContainerView superview])
      {
        searchBarContainerView = self->_searchBarContainerView;
LABEL_14:
        [(UIView *)v3 addSubview:searchBarContainerView];
        return self->_searchBarContainerView;
      }
      uint64_t v17 = [(NSArray *)[(UIView *)v3 subviews] lastObject];
      searchBarContainerView = self->_searchBarContainerView;
      if ((UIView *)v17 != searchBarContainerView) {
        goto LABEL_14;
      }
    }
  }
  return self->_searchBarContainerView;
}

- (void)removeContainerViewFromSuperview
{
}

- (BOOL)_currentTransitionIsRotating
{
  transitioningToSizeCoordinator = self->_transitioningToSizeCoordinator;
  if (transitioningToSizeCoordinator)
  {
    [(UIViewControllerTransitionCoordinator *)transitioningToSizeCoordinator targetTransform];
    LOBYTE(transitioningToSizeCoordinator) = !CGAffineTransformIsIdentity(&v4);
  }
  return (char)transitioningToSizeCoordinator;
}

- (double)_statusBarHeightChangeDueToRotation
{
  double v3 = 0.0;
  if (![(_UISearchPresentationAssistant *)self _currentTransitionIsRotating]) {
    return v3;
  }
  CGAffineTransform v4 = [[(UIViewController *)[(UIPresentationController *)self->_searchPresentationController presentedViewController] view] window];
  uint64_t v5 = [(UIWindow *)v4 _toWindowOrientation];
  uint64_t v6 = [(UIWindow *)v4 interfaceOrientation];
  BOOL v7 = [(_UISearchPresentationAssistant *)self _statusBarPreferredHiddenForInterfaceOrientation:v5];
  BOOL v8 = [(_UISearchPresentationAssistant *)self _statusBarPreferredHiddenForInterfaceOrientation:v6];
  if (!v8 || v7)
  {
    if (!v8 && v7)
    {
      [__UIStatusBarManagerForWindow(v4) defaultStatusBarHeightInOrientation:v6];
      return -v11;
    }
    return v3;
  }
  id v9 = __UIStatusBarManagerForWindow(v4);
  [v9 defaultStatusBarHeightInOrientation:v5];
  return result;
}

- (CGSize)updateSearchBarContainerFrame
{
  double v2 = *MEMORY[0x1E4F1DB30];
  if (self->_searchBarContainerView)
  {
    id v4 = [(_UISearchPresentationAssistant *)self locateNavigationController];
    uint64_t v5 = [v4 navigationBar];
    if (v4)
    {
      uint64_t v6 = (void *)v5;
      if ((-[UIViewController _hidesNavigationBarDuringPresentationRespectingInlineSearch](-[UIPresentationController presentedViewController](self->_searchPresentationController, "presentedViewController"), "_hidesNavigationBarDuringPresentationRespectingInlineSearch") & 1) == 0&& ([v6 forceFullHeightInLandscape] & 1) == 0)
      {
        [v6 bounds];
        objc_msgSend(v6, "convertRect:toView:", 0);
        CGFloat v8 = v7;
        CGFloat v10 = v9;
        CGFloat v36 = v11;
        CGFloat v13 = v12;
        searchBarContainerView = self->_searchBarContainerView;
        [(UIView *)searchBarContainerView bounds];
        -[UIView convertRect:toView:](searchBarContainerView, "convertRect:toView:", 0);
        CGFloat v16 = v15;
        CGFloat v18 = v17;
        CGFloat v20 = v19;
        CGFloat v22 = v21;
        CGFloat v34 = v10;
        CGFloat v35 = v8;
        v38.origin.x = v8;
        v38.origin.y = v10;
        v38.size.width = v36;
        v38.size.height = v13;
        double MaxY = CGRectGetMaxY(v38);
        v39.origin.x = v16;
        v39.origin.y = v18;
        v39.size.width = v20;
        v39.size.height = v22;
        if (vabdd_f64(MaxY, CGRectGetMinY(v39)) <= 1.0
          || [(UIViewController *)[(UIPresentationController *)self->_searchPresentationController presentedViewController] _searchbarWasTableHeaderView])
        {
          BOOL v24 = [(_UISearchPresentationAssistant *)self _currentTransitionIsRotating];
          BOOL v25 = [[(UIViewController *)[(UIPresentationController *)self->_searchPresentationController presentedViewController] view] window];
          uint64_t v26 = v24
              ? [(UIWindow *)v25 _toWindowOrientation]
              : [(UIWindow *)v25 interfaceOrientation];
          uint64_t v28 = v26;
          double v29 = (void *)[v4 navigationBar];
          if ([v29 _heightDependentOnOrientation])
          {
            [v29 defaultSizeForOrientation:v28];
            v40.origin.y = v34;
            v40.origin.x = v35;
            v40.size.width = v36;
            v40.size.height = v13;
            CGRectGetHeight(v40);
          }
        }
      }
    }
    if (([(UIViewController *)[(UIPresentationController *)self->_searchPresentationController presentingViewController] edgesForExtendedLayout] & 1) == 0|| v4&& ([(UIViewController *)[(UIPresentationController *)self->_searchPresentationController presentedViewController] _hidesNavigationBarDuringPresentationRespectingInlineSearch] & 1) == 0)
    {
      [(_UISearchPresentationAssistant *)self _statusBarHeightChangeDueToRotation];
    }
    [(_UISearchPresentationAssistant *)self _containerFrame];
    double v30 = CGRectGetMaxY(v41);
    [(UIView *)self->_searchBarContainerView frame];
    double v31 = CGRectGetMaxY(v42);
    double v27 = v30 - v31;
    [(UIView *)self->_searchBarContainerView frame];
    -[UIView setFrame:](self->_searchBarContainerView, "setFrame:");
    if (vabdd_f64(v30, v31) >= 2.22044605e-16) {
      objc_msgSend((id)-[UIViewController searchBar](-[UIPresentationController presentedViewController](self->_searchPresentationController, "presentedViewController"), "searchBar"), "setNeedsLayout");
    }
  }
  else
  {
    double v27 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  double v32 = v2;
  double v33 = v27;
  result.height = v33;
  result.width = v32;
  return result;
}

- (id)dimmingView
{
  if (!self->_dimmingView)
  {
    double v3 = [UIDimmingView alloc];
    [(UIView *)[(UIPresentationController *)self->_searchPresentationController containerView] bounds];
    id v4 = -[UIDimmingView initWithFrame:](v3, "initWithFrame:");
    self->_dimmingView = v4;
    [(UIView *)v4 setAutoresizingMask:18];
    [(UIDimmingView *)self->_dimmingView setDelegate:self];
    if ([(UITraitCollection *)[(UIPresentationController *)self->_searchPresentationController traitCollection] userInterfaceIdiom] != UIUserInterfaceIdiomVision)[(UIDimmingView *)self->_dimmingView setDimmingColor:+[UIColor colorWithWhite:0.0 alpha:0.15]]; {
  }
    }
  return self->_dimmingView;
}

- (BOOL)_statusBarPreferredHidden
{
  int64_t v3 = [(UIWindow *)[[(UIViewController *)[(UIPresentationController *)self->_searchPresentationController presentedViewController] view] window] _toWindowOrientation];
  return [(_UISearchPresentationAssistant *)self _statusBarPreferredHiddenForInterfaceOrientation:v3];
}

- (BOOL)_statusBarPreferredHiddenForInterfaceOrientation:(int64_t)a3
{
  id v4 = [[(UIWindow *)[[(UIViewController *)[(UIPresentationController *)self->_searchPresentationController presentedViewController] view] window] rootViewController] _effectiveStatusBarHiddenViewController];
  if (!v4) {
    return objc_msgSend(-[UIScreen _defaultTraitCollectionForInterfaceOrientation:](+[UIScreen mainScreen](UIScreen, "mainScreen"), "_defaultTraitCollectionForInterfaceOrientation:", a3), "verticalSizeClass") == 1;
  }
  uint64_t v5 = v4;
  if ([(id)objc_opt_class() doesOverrideViewControllerMethod:sel__preferredStatusBarVisibility])return objc_msgSend(v5, "_preferredStatusBarVisibility") == 1; {
  if (![(id)objc_opt_class() doesOverrideViewControllerMethod:sel_prefersStatusBarHidden])return objc_msgSend(-[UIScreen _defaultTraitCollectionForInterfaceOrientation:](+[UIScreen mainScreen](UIScreen, "mainScreen"), "_defaultTraitCollectionForInterfaceOrientation:", a3), "verticalSizeClass") == 1;
  }
  return [v5 prefersStatusBarHidden];
}

- (double)statusBarAdjustment
{
  if (![(UIViewController *)[(UIPresentationController *)self->_searchPresentationController presentingViewController] _viewControllerUnderlapsStatusBar]|| ([(UIViewController *)[(UIPresentationController *)self->_searchPresentationController presentingViewController] edgesForExtendedLayout] & 1) == 0)
  {
    return 0.0;
  }
  BOOL v4 = [(_UISearchPresentationAssistant *)self _currentTransitionIsRotating];
  searchPresentationController = self->_searchPresentationController;
  if (v4)
  {
    uint64_t v6 = [(UIViewController *)[(UIPresentationController *)searchPresentationController presentedViewController] _window];
    uint64_t v7 = [(UIWindow *)v6 _toWindowOrientation];
    if ([__UIStatusBarManagerForWindow(v6) isStatusBarHidden]) {
      return 0.0;
    }
    [__UIStatusBarManagerForWindow(v6) defaultStatusBarHeightInOrientation:v7];
    if (v8 == 0.0 || [(_UISearchPresentationAssistant *)self _statusBarPreferredHidden]) {
      return 0.0;
    }
    id v9 = __UIStatusBarManagerForWindow(v6);
    [v9 defaultStatusBarHeightInOrientation:v7];
  }
  else
  {
    CGFloat v10 = [(UIPresentationController *)searchPresentationController presentingViewController];
    [(UIViewController *)v10 _statusBarHeightAdjustmentForCurrentOrientation];
  }
  return result;
}

- (BOOL)shouldAccountForStatusBar
{
  [(_UISearchPresentationAssistant *)self statusBarAdjustment];
  return v2 != 0.0;
}

- (id)locateNavigationController
{
  [(UIPresentationController *)self->_searchPresentationController presentingViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  BOOL v4 = [(UIPresentationController *)self->_searchPresentationController presentingViewController];
  if ((isKindOfClass & 1) == 0) {
    BOOL v4 = [(UIViewController *)v4 navigationController];
  }
  return (id)[(UIViewController *)v4 _outermostNavigationController];
}

- (BOOL)searchBarToBecomeTopAttached
{
  int64_t v3 = [(UIViewController *)[(UIPresentationController *)self->_searchPresentationController presentedViewController] _window];
  if (v3)
  {
    if ((unint64_t)([(id)UIApp _sceneInterfaceOrientationFromWindow:v3] - 3) <= 1
      && [__UIStatusBarManagerForWindow(v3) isStatusBarHidden]
      && ([__UIStatusBarManagerForWindow(v3) isStatusBarHidden] & 1) == 0)
    {
      [__UIStatusBarManagerForWindow(v3) defaultStatusBarHeightInOrientation:1];
      LODWORD(v3) = v6 != 0.0;
    }
    else
    {
      LODWORD(v3) = 0;
    }
  }
  if (![(_UISearchPresentationAssistant *)self shouldAccountForStatusBar] && !v3
    || objc_msgSend((id)-[UIViewController searchBar](-[UIPresentationController presentedViewController](self->_searchPresentationController, "presentedViewController"), "searchBar"), "barPosition")&& objc_msgSend((id)-[UIViewController searchBar](-[UIPresentationController presentedViewController](self->_searchPresentationController, "presentedViewController"), "searchBar"), "barPosition") != 2)
  {
    LOBYTE(v4) = 0;
    return v4 & 1;
  }
  if ([(UIViewController *)[(UIPresentationController *)self->_searchPresentationController presentedViewController] _barPresentationStyle] != 1&& [(UIViewController *)[(UIPresentationController *)self->_searchPresentationController presentedViewController] _barPresentationStyle] != 2)
  {
    goto LABEL_14;
  }
  int v4 = [(UIViewController *)[(UIPresentationController *)self->_searchPresentationController presentedViewController] _hidesNavigationBarDuringPresentationRespectingInlineSearch];
  if (v4)
  {
    if (![(UIViewController *)[(UIPresentationController *)self->_searchPresentationController presentingViewController] navigationController])
    {
      [(UIPresentationController *)self->_searchPresentationController presentingViewController];
      objc_opt_class();
      LOBYTE(v4) = objc_opt_isKindOfClass();
      return v4 & 1;
    }
LABEL_14:
    LOBYTE(v4) = 1;
  }
  return v4 & 1;
}

- (double)resultsControllerContentOffset
{
  int64_t v3 = (void *)[(UIViewController *)[(UIPresentationController *)self->_searchPresentationController presentedViewController] searchResultsController];
  uint64_t v4 = [v3 _contentOrObservableScrollViewForEdge:1];
  double Height = 0.0;
  if (v3) {
    BOOL v6 = v4 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6
    && [v3 automaticallyAdjustsScrollViewInsets]
    && [(UIViewController *)[(UIPresentationController *)self->_searchPresentationController presentedViewController] _resultsControllerWillLayoutVisibleUnderContainerView])
  {
    if ([(UIViewController *)[(UIPresentationController *)self->_searchPresentationController presentedViewController] _barPresentationStyle] == 3)
    {
      objc_msgSend(-[_UISearchPresentationAssistant searchBarContainerView](self, "searchBarContainerView"), "frame");
      double Height = CGRectGetHeight(v23);
      [(UIViewController *)[(UIPresentationController *)self->_searchPresentationController presentedViewController] set_resultsContentScrollViewPresentationOffset:Height];
    }
    else
    {
      uint64_t v7 = (void *)[(UIViewController *)[(UIPresentationController *)self->_searchPresentationController presentedViewController] searchBar];
      [v7 bounds];
      objc_msgSend(v7, "convertRect:toView:", -[UIViewController view](-[UIPresentationController presentedViewController](self->_searchPresentationController, "presentedViewController"), "view"), v8, v9, v10, v11);
      CGFloat v13 = v12;
      double v15 = v14;
      CGFloat v17 = v16;
      double v19 = v18;
      if ([(UIViewController *)[(UIPresentationController *)self->_searchPresentationController presentedViewController] _hidesNavigationBarDuringPresentationRespectingInlineSearch]&& [(UIViewController *)[(UIPresentationController *)self->_searchPresentationController presentingViewController] navigationController])
      {
        [[(UINavigationController *)[(UIViewController *)[(UIPresentationController *)self->_searchPresentationController presentingViewController] navigationController] navigationBar] frame];
        double v15 = v15 - CGRectGetHeight(v24);
      }
      v25.origin.x = v13;
      v25.origin.y = v15;
      v25.size.width = v17;
      v25.size.height = v19;
      [(UIViewController *)[(UIPresentationController *)self->_searchPresentationController presentedViewController] set_resultsContentScrollViewPresentationOffset:CGRectGetHeight(v25)];
      if ([(_UISearchPresentationAssistant *)self searchBarToBecomeTopAttached])
      {
        [(_UISearchPresentationAssistant *)self statusBarAdjustment];
        double v15 = v15 - v20;
        double v19 = v19 + v20;
      }
      v26.origin.x = v13;
      v26.origin.y = v15;
      v26.size.width = v17;
      v26.size.height = v19;
      double Height = CGRectGetMaxY(v26);
      if ([(_UISearchPresentationAssistant *)self searchBarWillResizeForScopeBar])
      {
        [v7 _scopeBarHeight];
        return Height + v21;
      }
    }
  }
  return Height;
}

- (BOOL)searchBarWillResizeForScopeBar
{
  id v3 = [(_UISearchPresentationAssistant *)self _searchControllerPresenting];
  if (!v3 || (LODWORD(v4) = [v3 searchBarCanContainScopeBar], v4))
  {
    uint64_t v5 = (void *)[(UIViewController *)[(UIPresentationController *)self->_searchPresentationController presentedViewController] searchBar];
    uint64_t v4 = objc_msgSend((id)objc_msgSend(v5, "scopeButtonTitles"), "count");
    if (v4) {
      LOBYTE(v4) = [v5 _shouldCombineLandscapeBars] ^ 1;
    }
  }
  return v4;
}

- (void)dimmingViewWasTapped:(id)a3
{
  uint64_t v4 = [(UIPresentationController *)self->_searchPresentationController presentedViewController];
  BOOL presentationWasAnimated = self->_presentationWasAnimated;
  [(UIViewController *)v4 _dismissPresentation:presentationWasAnimated];
}

- (BOOL)presentationWasAnimated
{
  return self->_presentationWasAnimated;
}

- (void)setPresentationWasAnimated:(BOOL)a3
{
  self->_BOOL presentationWasAnimated = a3;
}

- (_UISearchControllerPresenting)adaptivePresentationController
{
  return self->_adaptivePresentationController;
}

- (void)setAdaptivePresentationController:(id)a3
{
  self->_adaptivePresentationController = (_UISearchControllerPresenting *)a3;
}

- (UIViewControllerTransitionCoordinator)transitioningToSizeCoordinator
{
  return self->_transitioningToSizeCoordinator;
}

- (void)setTransitioningToSizeCoordinator:(id)a3
{
}

@end