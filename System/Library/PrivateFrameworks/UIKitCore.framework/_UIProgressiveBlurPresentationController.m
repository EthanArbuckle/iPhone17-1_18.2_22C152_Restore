@interface _UIProgressiveBlurPresentationController
- (BOOL)_forcesPreferredAnimationControllers;
- (BOOL)_mayChildGrabPresentedViewControllerView;
- (UIVisualEffectView)visualEffectView;
- (_UIProgressiveBlurPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4;
- (id)_preferredAnimationControllerForDismissal;
- (id)_preferredAnimationControllerForPresentation;
- (int64_t)blurStyle;
- (int64_t)presentationStyle;
- (void)_animateWithCoordinator:(id)a3 isPresenting:(BOOL)a4;
- (void)_configureSubviews;
- (void)dismissalTransitionWillBegin;
- (void)presentationTransitionWillBegin;
- (void)setBlurStyle:(int64_t)a3;
@end

@implementation _UIProgressiveBlurPresentationController

- (int64_t)presentationStyle
{
  return 8;
}

- (_UIProgressiveBlurPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)_UIProgressiveBlurPresentationController;
  result = [(UIPresentationController *)&v5 initWithPresentedViewController:a3 presentingViewController:a4];
  if (result) {
    result->_blurStyle = 4005;
  }
  return result;
}

- (void)presentationTransitionWillBegin
{
  [(_UIProgressiveBlurPresentationController *)self _configureSubviews];
  id v4 = [(UIPresentationController *)self presentedViewController];
  v3 = [v4 transitionCoordinator];
  [(_UIProgressiveBlurPresentationController *)self _animateWithCoordinator:v3 isPresenting:1];
}

- (void)dismissalTransitionWillBegin
{
  [(_UIProgressiveBlurPresentationController *)self _configureSubviews];
  id v4 = [(UIPresentationController *)self presentedViewController];
  v3 = [v4 transitionCoordinator];
  [(_UIProgressiveBlurPresentationController *)self _animateWithCoordinator:v3 isPresenting:0];
}

- (BOOL)_mayChildGrabPresentedViewControllerView
{
  return 1;
}

- (void)_configureSubviews
{
  if (!self->_visualEffectView)
  {
    v3 = [(UIPresentationController *)self containerView];

    if (v3)
    {
      id v4 = [UIVisualEffectView alloc];
      objc_super v5 = [(UIPresentationController *)self containerView];
      [v5 bounds];
      v6 = -[UIVisualEffectView initWithFrame:](v4, "initWithFrame:");
      visualEffectView = self->_visualEffectView;
      self->_visualEffectView = v6;

      [(UIVisualEffectView *)self->_visualEffectView setEffect:0];
      id v8 = [(UIPresentationController *)self containerView];
      [v8 addSubview:self->_visualEffectView];
    }
  }
}

- (void)_animateWithCoordinator:(id)a3 isPresenting:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [(_UIProgressiveBlurPresentationController *)self visualEffectView];
  uint64_t v8 = +[UIBlurEffect effectWithStyle:self->_blurStyle];
  BOOL v9 = !v4;
  if (v4) {
    v10 = (void *)v8;
  }
  else {
    v10 = 0;
  }
  if (v4) {
    v11 = 0;
  }
  else {
    v11 = (void *)v8;
  }
  if (v9) {
    double v12 = 0.0;
  }
  else {
    double v12 = 0.2;
  }
  v13 = +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.5);
  [v7 setBackgroundColor:v13];

  [v7 setEffect:v11];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __81___UIProgressiveBlurPresentationController__animateWithCoordinator_isPresenting___block_invoke;
  aBlock[3] = &unk_1E52DA070;
  id v14 = v7;
  id v26 = v14;
  id v15 = v10;
  id v27 = v15;
  double v28 = v12;
  v16 = _Block_copy(aBlock);
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __81___UIProgressiveBlurPresentationController__animateWithCoordinator_isPresenting___block_invoke_2;
  v23[3] = &unk_1E52DA110;
  id v17 = v16;
  id v24 = v17;
  if (([v6 animateAlongsideTransition:v23 completion:0] & 1) == 0)
  {
    v18 = +[_UIProgressiveBlurPresentationAnimator alphaAnimationFactory];
    [v6 transitionDuration];
    double v20 = v19;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __81___UIProgressiveBlurPresentationController__animateWithCoordinator_isPresenting___block_invoke_3;
    v21[3] = &unk_1E52DA040;
    id v22 = v17;
    +[UIView _animateWithDuration:393248 delay:v18 options:v21 factory:0 animations:v20 completion:0.0];
  }
}

- (BOOL)_forcesPreferredAnimationControllers
{
  return 1;
}

- (id)_preferredAnimationControllerForPresentation
{
  id v2 = [[_UIProgressiveBlurPresentationAnimator alloc] initForPresenting:1];
  return v2;
}

- (id)_preferredAnimationControllerForDismissal
{
  id v2 = [[_UIProgressiveBlurPresentationAnimator alloc] initForPresenting:0];
  return v2;
}

- (int64_t)blurStyle
{
  return self->_blurStyle;
}

- (void)setBlurStyle:(int64_t)a3
{
  self->_blurStyle = a3;
}

- (UIVisualEffectView)visualEffectView
{
  return self->_visualEffectView;
}

- (void).cxx_destruct
{
}

@end