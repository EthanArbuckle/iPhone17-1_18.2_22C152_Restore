@interface _UISearchPopoverPresentationController
- (BOOL)_forcePresentationInPresenterScene;
- (BOOL)animatorShouldLayoutPresentationViews;
- (BOOL)forceObeyNavigationBarInsets;
- (BOOL)resultsUnderlapsSearchBar;
- (BOOL)searchBarCanContainScopeBar;
- (BOOL)searchBarShouldClipToBounds;
- (BOOL)searchBarToBecomeTopAttached;
- (BOOL)shouldAccountForStatusBar;
- (CGRect)finalFrameForContainerView;
- (UIView)searchBarContainerView;
- (_UISearchControllerPresenting)adaptivePresentationController;
- (_UISearchPopoverPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4;
- (double)resultsControllerContentOffset;
- (double)statusBarAdjustment;
- (id)_popoverHostingWindow;
- (id)_presentationControllerForTraitCollection:(id)a3;
- (int64_t)adaptivePresentationStyle;
- (unint64_t)edgeForHidingNavigationBar;
- (void)_transitionFromDidEnd;
- (void)_transitionToDidEnd;
- (void)_transitionToWillBegin;
- (void)presentationTransitionWillBegin;
- (void)setContentVisible:(BOOL)a3;
@end

@implementation _UISearchPopoverPresentationController

- (_UISearchPopoverPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"_UISearchPopoverPresentationController.m" lineNumber:35 description:@"_UISearchPopoverPresentationController must present a UISearchController"];
  }
  v14.receiver = self;
  v14.super_class = (Class)_UISearchPopoverPresentationController;
  v9 = [(UIPopoverPresentationController *)&v14 initWithPresentedViewController:v7 presentingViewController:v8];
  if (v9)
  {
    v10 = [[_UISearchPresentationAssistant alloc] initWithSearchPresentationController:v9];
    assistant = v9->_assistant;
    v9->_assistant = v10;
  }
  return v9;
}

- (id)_popoverHostingWindow
{
  v3 = [(UIPresentationController *)self sourceView];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v5 = [(UIPresentationController *)self sourceView];
  v6 = v5;
  if ((isKindOfClass & 1) == 0)
  {
    uint64_t v7 = [v5 window];

    v6 = (void *)v7;
  }

  if (!v6)
  {
    id v8 = [(UIPresentationController *)self presentingViewController];
    v9 = [v8 view];
    v6 = [v9 window];
  }
  return v6;
}

- (void)presentationTransitionWillBegin
{
  v4.receiver = self;
  v4.super_class = (Class)_UISearchPopoverPresentationController;
  [(UIPopoverPresentationController *)&v4 presentationTransitionWillBegin];
  v3 = [(UIPresentationController *)self presentedViewController];
  -[_UISearchPopoverPresentationController setContentVisible:](self, "setContentVisible:", [v3 _showsSearchResultsController]);
}

- (void)_transitionToWillBegin
{
  [(_UISearchPresentationAssistant *)self->_assistant setAdaptivePresentationController:0];
  [(_UISearchPopoverPresentationController *)self presentationTransitionWillBegin];
}

- (void)_transitionToDidEnd
{
}

- (void)_transitionFromDidEnd
{
}

- (int64_t)adaptivePresentationStyle
{
  return 4;
}

- (id)_presentationControllerForTraitCollection:(id)a3
{
  objc_super v4 = self;
  if ([a3 horizontalSizeClass] == 1)
  {
    v5 = [_UISearchPresentationController alloc];
    v6 = [(UIPresentationController *)v4 presentedViewController];
    uint64_t v7 = [(UIPresentationController *)v4 presentingViewController];
    uint64_t v8 = [(_UISearchPresentationController *)v5 initWithPresentedViewController:v6 presentingViewController:v7];

    objc_super v4 = (_UISearchPopoverPresentationController *)v8;
  }
  return v4;
}

- (BOOL)_forcePresentationInPresenterScene
{
  return 1;
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
  BOOL v3 = !a3;
  id v4 = [(UIPopoverPresentationController *)self presentedView];
  [v4 setHidden:v3];
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

- (void).cxx_destruct
{
}

@end