@interface _UISearchCarPlayPresentationController
- (BOOL)animatorShouldLayoutPresentationViews;
- (BOOL)forceObeyNavigationBarInsets;
- (BOOL)resultsUnderlapsSearchBar;
- (BOOL)searchBarCanContainScopeBar;
- (BOOL)searchBarShouldClipToBounds;
- (BOOL)searchBarToBecomeTopAttached;
- (BOOL)shouldAccountForStatusBar;
- (CGRect)finalFrameForContainerView;
- (UIVisualEffectView)blurView;
- (double)resultsControllerContentOffset;
- (double)statusBarAdjustment;
- (id)adaptivePresentationController;
- (id)backgroundObscuringView;
- (int64_t)adaptivePresentationStyle;
- (unint64_t)edgeForHidingNavigationBar;
- (void)containerViewWillLayoutSubviews;
- (void)hideBackgroundObscuringView;
- (void)setBlurView:(id)a3;
- (void)setContentVisible:(BOOL)a3;
- (void)showBackgroundObscuringView;
@end

@implementation _UISearchCarPlayPresentationController

- (id)backgroundObscuringView
{
  blurView = self->_blurView;
  if (!blurView)
  {
    v4 = [UIVisualEffectView alloc];
    v5 = [(UIPresentationController *)self presentedViewController];
    v6 = [v5 searchBar];
    v7 = [(UIPresentationController *)self traitCollection];
    v8 = [v6 _presentationBackgroundBlurEffectForTraitCollection:v7];
    v9 = [(UIVisualEffectView *)v4 initWithEffect:v8];
    v10 = self->_blurView;
    self->_blurView = v9;

    v11 = [(UIPresentationController *)self presentedViewController];
    v12 = [v11 view];
    [v12 bounds];
    -[UIView setFrame:](self->_blurView, "setFrame:");

    [(UIView *)self->_blurView setAutoresizingMask:26];
    blurView = self->_blurView;
  }
  return blurView;
}

- (void)showBackgroundObscuringView
{
}

- (void)hideBackgroundObscuringView
{
}

- (int64_t)adaptivePresentationStyle
{
  return 4;
}

- (BOOL)shouldAccountForStatusBar
{
  return 0;
}

- (BOOL)resultsUnderlapsSearchBar
{
  return 0;
}

- (BOOL)searchBarCanContainScopeBar
{
  return 0;
}

- (BOOL)searchBarShouldClipToBounds
{
  return 0;
}

- (double)statusBarAdjustment
{
  return 0.0;
}

- (BOOL)searchBarToBecomeTopAttached
{
  return 0;
}

- (double)resultsControllerContentOffset
{
  return 0.0;
}

- (id)adaptivePresentationController
{
  return 0;
}

- (CGRect)finalFrameForContainerView
{
  double v2 = *MEMORY[0x1E4F1DB28];
  double v3 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setContentVisible:(BOOL)a3
{
  BOOL v3 = !a3;
  id v4 = [(UIPresentationController *)self presentedView];
  [v4 setHidden:v3];
}

- (BOOL)animatorShouldLayoutPresentationViews
{
  return 1;
}

- (BOOL)forceObeyNavigationBarInsets
{
  return 1;
}

- (unint64_t)edgeForHidingNavigationBar
{
  return 0;
}

- (void)containerViewWillLayoutSubviews
{
  id v7 = [(_UISearchCarPlayPresentationController *)self blurView];
  BOOL v3 = [(UIPresentationController *)self presentedViewController];
  id v4 = [v3 searchBar];
  double v5 = [(UIPresentationController *)self traitCollection];
  v6 = [v4 _presentationBackgroundBlurEffectForTraitCollection:v5];
  [v7 setEffect:v6];
}

- (UIVisualEffectView)blurView
{
  return self->_blurView;
}

- (void)setBlurView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end