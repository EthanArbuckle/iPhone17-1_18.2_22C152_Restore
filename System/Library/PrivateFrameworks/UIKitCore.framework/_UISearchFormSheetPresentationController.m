@interface _UISearchFormSheetPresentationController
- (BOOL)_shouldKeepCurrentFirstResponder;
- (BOOL)_shouldRespectDefinesPresentationContext;
- (BOOL)_shouldSubscribeToKeyboardNotifications;
- (BOOL)animatorShouldLayoutPresentationViews;
- (BOOL)forceObeyNavigationBarInsets;
- (BOOL)resultsUnderlapsSearchBar;
- (BOOL)searchBarCanContainScopeBar;
- (BOOL)searchBarShouldClipToBounds;
- (BOOL)searchBarToBecomeTopAttached;
- (BOOL)shouldAccountForStatusBar;
- (CGRect)_frameOfPresentedViewControllerViewInSuperview;
- (CGRect)finalFrameForContainerView;
- (CGRect)frameOfPresentedViewInContainerView;
- (UIView)searchBarContainerView;
- (_UISearchControllerPresenting)adaptivePresentationController;
- (_UISearchFormSheetPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4;
- (double)resultsControllerContentOffset;
- (double)statusBarAdjustment;
- (id)_presentationControllerForTraitCollection:(id)a3;
- (id)presentedView;
- (int64_t)adaptivePresentationStyle;
- (unint64_t)edgeForHidingNavigationBar;
- (void)_horizontalSizeClassChanged;
- (void)_presentedView:(id)a3 enableFormSheetAccoutrements:(BOOL)a4;
- (void)_transitionFromDidEnd;
- (void)_transitionToDidEnd;
- (void)_transitionToPresentationController:(id)a3 withTransitionCoordinator:(id)a4;
- (void)_transitionToWillBegin;
- (void)containerViewWillLayoutSubviews;
- (void)dealloc;
- (void)dismissalTransitionDidEnd:(BOOL)a3;
- (void)dismissalTransitionWillBegin;
- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3;
- (void)presentationTransitionDidEnd:(BOOL)a3;
- (void)presentationTransitionWillBegin;
- (void)setContentVisible:(BOOL)a3;
@end

@implementation _UISearchFormSheetPresentationController

- (_UISearchFormSheetPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4
{
  v11[1] = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"_UISearchFormSheetPresentationController.m", 37, @"_UISearchFormSheetPresentationController must present a UISearchController");
  }
  v10.receiver = self;
  v10.super_class = (Class)_UISearchFormSheetPresentationController;
  v8 = [(UIPresentationController *)&v10 initWithPresentedViewController:a3 presentingViewController:a4];
  if (v8)
  {
    v8->_assistant = [[_UISearchPresentationAssistant alloc] initWithSearchPresentationController:v8];
    v11[0] = 0x1ED3F5A90;
    -[UIPresentationController _registerForTraitTokenChanges:withTarget:action:](v8, "_registerForTraitTokenChanges:withTarget:action:", [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1], v8, sel__horizontalSizeClassChanged);
  }
  return v8;
}

- (void)dealloc
{
  self->_assistant = 0;
  v3.receiver = self;
  v3.super_class = (Class)_UISearchFormSheetPresentationController;
  [(UIPresentationController *)&v3 dealloc];
}

- (void)presentationTransitionWillBegin
{
  id v3 = [(UIViewController *)[(UIPresentationController *)self presentingViewController] transitionCoordinator];
  -[_UISearchPresentationAssistant setPresentationWasAnimated:](self->_assistant, "setPresentationWasAnimated:", [v3 isAnimated]);
  [(_UISearchPresentationAssistant *)self->_assistant ensureAppropriatelySizedSearchBar:[(UIViewController *)[(UIPresentationController *)self presentedViewController] searchBar]];
  v4 = [(_UISearchFormSheetPresentationController *)self searchBarContainerView];
  if ([(_UISearchFormSheetPresentationController *)self searchBarToBecomeTopAttached])
  {
    [(UIView *)v4 frame];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    [(_UISearchFormSheetPresentationController *)self statusBarAdjustment];
    -[UIView setFrame:](v4, "setFrame:", v6, v8, v10, v13 + v12);
  }
  if ([(UIViewController *)[(UIPresentationController *)self presentedViewController] obscuresBackgroundDuringPresentation])
  {
    [(UIView *)[(UIPresentationController *)self containerView] addSubview:[(_UISearchPresentationAssistant *)self->_assistant dimmingView]];
    if ([v3 isAnimated])
    {
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __75___UISearchFormSheetPresentationController_presentationTransitionWillBegin__block_invoke;
      v21[3] = &unk_1E5303BB0;
      v21[4] = self;
      [v3 animateAlongsideTransition:v21 completion:0];
    }
    else
    {
      objc_msgSend(-[_UISearchPresentationAssistant dimmingView](self->_assistant, "dimmingView"), "display:", 1);
    }
  }
  v14 = [UIView alloc];
  double v15 = *MEMORY[0x1E4F1DB28];
  double v16 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v17 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v18 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  self->_wrapperView = -[UIView initWithFrame:](v14, "initWithFrame:", *MEMORY[0x1E4F1DB28], v16, v17, v18);
  -[UIView setFrame:]([(UIViewController *)[(UIPresentationController *)self presentedViewController] view], "setFrame:", v15, v16, v17, v18);
  [[(UIViewController *)[(UIPresentationController *)self presentedViewController] view] setAutoresizingMask:18];
  [(UIView *)self->_wrapperView addSubview:[(UIViewController *)[(UIPresentationController *)self presentedViewController] view]];
  [(_UISearchFormSheetPresentationController *)self _presentedView:self->_wrapperView enableFormSheetAccoutrements:1];
  if ([v3 isAnimated])
  {
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __75___UISearchFormSheetPresentationController_presentationTransitionWillBegin__block_invoke_2;
    v20[3] = &unk_1E5303BB0;
    v20[4] = self;
    [v3 animateAlongsideTransition:v20 completion:0];
  }
  else
  {
    [[(UIViewController *)[(UIPresentationController *)self presentingViewController] view] _beginOcclusion:self];
  }
  [(_UISearchFormSheetPresentationController *)self setContentVisible:[(UIViewController *)[(UIPresentationController *)self presentedViewController] _showsSearchResultsController]];
  if ([(_UISearchFormSheetPresentationController *)self _shouldSubscribeToKeyboardNotifications])
  {
    v19 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
    objc_msgSend(v19, "addObserver:selector:name:object:", -[UIPresentationController presentedViewController](self, "presentedViewController"), sel__keyboardWillShow_, @"UIKeyboardPrivateWillShowNotification", 0);
    objc_msgSend(v19, "addObserver:selector:name:object:", -[UIPresentationController presentedViewController](self, "presentedViewController"), sel__keyboardWillHide_, @"UIKeyboardPrivateWillHideNotification", 0);
  }
}

- (void)presentationTransitionDidEnd:(BOOL)a3
{
  if (!a3)
  {
    if (-[UIViewController obscuresBackgroundDuringPresentation](-[UIPresentationController presentedViewController](self, "presentedViewController"), "obscuresBackgroundDuringPresentation"))objc_msgSend(-[_UISearchPresentationAssistant dimmingView](self->_assistant, "dimmingView"), "removeFromSuperview"); {
    double v5 = [(UIViewController *)[(UIPresentationController *)self presentingViewController] view];
    }
    [(UIView *)v5 _endOcclusion:self];
  }
}

- (void)dismissalTransitionWillBegin
{
  id v3 = [(UIViewController *)[(UIPresentationController *)self presentingViewController] transitionCoordinator];
  if ([(UIViewController *)[(UIPresentationController *)self presentedViewController] obscuresBackgroundDuringPresentation])
  {
    if ([v3 isAnimated])
    {
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      v5[2] = __72___UISearchFormSheetPresentationController_dismissalTransitionWillBegin__block_invoke;
      v5[3] = &unk_1E5303BB0;
      v5[4] = self;
      [v3 animateAlongsideTransition:v5 completion:0];
    }
    else
    {
      objc_msgSend(-[_UISearchPresentationAssistant dimmingView](self->_assistant, "dimmingView"), "display:", 0);
    }
  }
  if ([v3 isAnimated])
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __72___UISearchFormSheetPresentationController_dismissalTransitionWillBegin__block_invoke_2;
    v4[3] = &unk_1E5303BB0;
    v4[4] = self;
    [v3 animateAlongsideTransition:v4 completion:0];
  }
  else
  {
    [[(UIViewController *)[(UIPresentationController *)self presentingViewController] view] _endOcclusion:self];
  }
}

- (void)dismissalTransitionDidEnd:(BOOL)a3
{
  if (a3)
  {
    if (-[UIViewController obscuresBackgroundDuringPresentation](-[UIPresentationController presentedViewController](self, "presentedViewController"), "obscuresBackgroundDuringPresentation"))objc_msgSend(-[_UISearchPresentationAssistant dimmingView](self->_assistant, "dimmingView"), "removeFromSuperview"); {
    [(UIView *)[(_UISearchFormSheetPresentationController *)self searchBarContainerView] removeFromSuperview];
    }
    if ([(_UISearchFormSheetPresentationController *)self _shouldSubscribeToKeyboardNotifications])
    {
      v4 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
      objc_msgSend(v4, "removeObserver:name:object:", -[UIPresentationController presentingViewController](self, "presentingViewController"), @"UIKeyboardPrivateWillShowNotification", 0);
      objc_msgSend(v4, "removeObserver:name:object:", -[UIPresentationController presentingViewController](self, "presentingViewController"), @"UIKeyboardPrivateWillHideNotification", 0);
    }

    self->_wrapperView = 0;
    double v5 = [(UIViewController *)[(UIPresentationController *)self presentedViewController] view];
    [(_UISearchFormSheetPresentationController *)self _presentedView:v5 enableFormSheetAccoutrements:0];
  }
}

- (id)presentedView
{
  return self->_wrapperView;
}

- (CGRect)frameOfPresentedViewInContainerView
{
  id v3 = (UIView *)[(UIViewController *)[(UIPresentationController *)self presentedViewController] searchBar];
  v4 = [(UIPresentationController *)self containerView];
  objc_msgSend((id)-[UIView searchField](v3, "searchField"), "frame");
  double v6 = v5;
  objc_msgSend((id)-[UIView searchField](v3, "searchField"), "frame");
  CGFloat Width = CGRectGetWidth(v20);
  if ([(UIViewController *)[(UIPresentationController *)self presentedViewController] _barPresentationStyle] == 3)
  {
    double v8 = [(_UISearchFormSheetPresentationController *)self searchBarContainerView];
    id v3 = v8;
    goto LABEL_3;
  }
  double MaxY = 0.0;
  if ([(UIViewController *)[(UIPresentationController *)self presentedViewController] _barPresentationStyle] == 2)
  {
    objc_opt_class();
    if (v3)
    {
      double v11 = v3;
      while ((objc_opt_isKindOfClass() & 1) == 0)
      {
        double v11 = [(UIView *)v11 superview];
        if (!v11)
        {
          objc_opt_class();
          double v11 = v3;
          while ((objc_opt_isKindOfClass() & 1) == 0)
          {
            double v11 = [(UIView *)v11 superview];
            if (!v11)
            {
              objc_opt_class();
              double v12 = v3;
              while ((objc_opt_isKindOfClass() & 1) == 0)
              {
                double v12 = [(UIView *)v12 superview];
                if (!v12) {
                  goto LABEL_19;
                }
              }
              [(UIView *)v12 bounds];
              -[UIView convertRect:toView:](v12, "convertRect:toView:", v4);
              double MaxY = CGRectGetMaxY(v22);
              if ([(UIViewController *)[(UIPresentationController *)self presentedViewController] _hidesNavigationBarDuringPresentationRespectingInlineSearch])
              {
                objc_msgSend((id)objc_msgSend((id)-[UIView navController](v12, "navController"), "navigationBar"), "frame");
                double MaxY = MaxY - CGRectGetHeight(v23);
              }
              goto LABEL_22;
            }
          }
          break;
        }
      }
      [(UIView *)v11 bounds];
      double v9 = v11;
      goto LABEL_4;
    }
    objc_opt_class();
    objc_opt_class();
LABEL_19:
    double v8 = v3;
LABEL_3:
    [(UIView *)v8 bounds];
    double v9 = v3;
LABEL_4:
    -[UIView convertRect:toView:](v9, "convertRect:toView:", v4);
    double MaxY = CGRectGetMaxY(v21);
  }
LABEL_22:
  [[(UIView *)v4 window] bounds];
  double v13 = CGRectGetHeight(v24) - MaxY + -25.0;
  if ([(UIViewController *)[(UIPresentationController *)self presentedViewController] _shouldRespectPreferredContentSize])
  {
    [(UIViewController *)[(UIPresentationController *)self presentedViewController] preferredContentSize];
    if (v14 != 0.0 && v14 <= v13) {
      double v13 = v14;
    }
  }
  double v16 = MaxY + 1.0;
  double v17 = v6;
  double v18 = Width;
  double v19 = v13;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v16;
  result.origin.x = v17;
  return result;
}

- (void)containerViewWillLayoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)_UISearchFormSheetPresentationController;
  [(UIPresentationController *)&v7 containerViewWillLayoutSubviews];
  [(_UISearchFormSheetPresentationController *)self frameOfPresentedViewInContainerView];
  objc_msgSend(-[_UISearchFormSheetPresentationController presentedView](self, "presentedView"), "setFrame:", v3, v4, v5, v6);
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  [(UIView *)[(UIPresentationController *)self containerView] setNeedsLayout];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __98___UISearchFormSheetPresentationController_preferredContentSizeDidChangeForChildContentContainer___block_invoke;
  v4[3] = &unk_1E52DC580;
  v4[4] = self;
  +[UIView animateWithDuration:v4 animations:0 completion:0.4];
}

- (CGRect)_frameOfPresentedViewControllerViewInSuperview
{
  [(UIView *)self->_wrapperView bounds];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (BOOL)_shouldRespectDefinesPresentationContext
{
  return 0;
}

- (BOOL)_shouldSubscribeToKeyboardNotifications
{
  return 1;
}

- (BOOL)_shouldKeepCurrentFirstResponder
{
  return 0;
}

- (void)_presentedView:(id)a3 enableFormSheetAccoutrements:(BOOL)a4
{
  BOOL v4 = a4;
  if (a4) {
    double v6 = 5.0;
  }
  else {
    double v6 = 0.0;
  }
  objc_msgSend((id)objc_msgSend(a3, "layer"), "setCornerRadius:", v6);
  [a3 setClipsToBounds:v4];
}

- (void)_horizontalSizeClassChanged
{
  if ([(UIPresentationController *)self containerView]
    && [(UITraitCollection *)[(UIPresentationController *)self traitCollection] horizontalSizeClass] == UIUserInterfaceSizeClassRegular)
  {
    [(_UISearchFormSheetPresentationController *)self frameOfPresentedViewInContainerView];
    double v4 = v3;
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    id v11 = [(_UISearchFormSheetPresentationController *)self presentedView];
    objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);
  }
}

- (void)_transitionToWillBegin
{
  [(_UISearchPresentationAssistant *)self->_assistant setAdaptivePresentationController:0];
  [(_UISearchFormSheetPresentationController *)self presentationTransitionWillBegin];
}

- (void)_transitionToDidEnd
{
}

- (void)_transitionFromDidEnd
{
}

- (void)_transitionToPresentationController:(id)a3 withTransitionCoordinator:(id)a4
{
  v15.receiver = self;
  v15.super_class = (Class)_UISearchFormSheetPresentationController;
  [(UIPresentationController *)&v15 _transitionToPresentationController:a3 withTransitionCoordinator:a4];
  objc_msgSend((id)objc_msgSend(a3, "searchBarContainerView"), "addSubview:", -[UIViewController searchBar](-[UIPresentationController presentedViewController](self, "presentedViewController"), "searchBar"));
  [a3 resultsControllerContentOffset];
  double v7 = v6;
  double v8 = (void *)[(UIViewController *)[(UIPresentationController *)self presentedViewController] searchResultsController];
  uint64_t v9 = [v8 _contentOrObservableScrollViewForEdge:1];
  if (v8)
  {
    double v10 = (void *)v9;
    if (v9)
    {
      if ([v8 automaticallyAdjustsScrollViewInsets])
      {
        [v10 contentOffset];
        double v12 = v11;
        double v14 = v13 - v7;
        objc_msgSend(v10, "setContentInset:", v7, 0.0, 0.0, 0.0);
        objc_msgSend(v10, "setContentOffset:", v12, v14);
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
  if ([a3 horizontalSizeClass] == 1)
  {
    double v4 = [[_UISearchPresentationController alloc] initWithPresentedViewController:[(UIPresentationController *)self presentedViewController] presentingViewController:[(UIPresentationController *)self presentingViewController]];
    [(_UISearchPresentationAssistant *)self->_assistant setAdaptivePresentationController:v4];
    return v4;
  }
  return self;
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

- (void)setContentVisible:(BOOL)a3
{
  BOOL v4 = !a3;
  objc_msgSend(-[_UISearchPresentationAssistant dimmingView](self->_assistant, "dimmingView"), "setHidden:", v4);
  id v5 = [(_UISearchFormSheetPresentationController *)self presentedView];
  [v5 setHidden:v4];
}

- (BOOL)searchBarToBecomeTopAttached
{
  return [(_UISearchPresentationAssistant *)self->_assistant searchBarToBecomeTopAttached];
}

- (double)resultsControllerContentOffset
{
  if ([(UIViewController *)[(UIPresentationController *)self presentedViewController] _barPresentationStyle] == 3)return 0.0; {
  assistant = self->_assistant;
  }
  [(_UISearchPresentationAssistant *)assistant resultsControllerContentOffset];
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
  double x = self->finalFrameForContainerView.origin.x;
  double y = self->finalFrameForContainerView.origin.y;
  double width = self->finalFrameForContainerView.size.width;
  double height = self->finalFrameForContainerView.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

@end