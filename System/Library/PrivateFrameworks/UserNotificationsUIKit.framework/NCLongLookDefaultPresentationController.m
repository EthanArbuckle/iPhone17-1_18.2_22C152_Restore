@interface NCLongLookDefaultPresentationController
- (BOOL)_shouldPresentInCurrentContext;
- (BOOL)_shouldRespectDefinesPresentationContext;
- (BOOL)isPresenting;
- (BOOL)shouldPresentInFullscreen;
- (BOOL)shouldRemovePresentersView;
- (CGRect)_frameForTransitionViewInPresentationSuperview:(id)a3;
- (NCLongLookDefaultPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5 sourceView:(id)a6;
- (void)dismissalTransitionDidEnd:(BOOL)a3;
- (void)presentationTransitionWillBegin;
- (void)setPresenting:(BOOL)a3;
- (void)viewControllerAnimator:(id)a3 willBeginDismissalAnimationWithTransitionContext:(id)a4;
- (void)viewControllerAnimator:(id)a3 willBeginPresentationAnimationWithTransitionContext:(id)a4;
@end

@implementation NCLongLookDefaultPresentationController

- (NCLongLookDefaultPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5 sourceView:(id)a6
{
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)NCLongLookDefaultPresentationController;
  v11 = [(PLExpandedPlatterPresentationController *)&v14 initWithPresentedViewController:a3 presentingViewController:a4 sourceViewController:v10 sourceView:a6];
  v12 = v11;
  if (v11) {
    objc_storeWeak((id *)&v11->_sourceViewController, v10);
  }

  return v12;
}

- (BOOL)shouldPresentInFullscreen
{
  return ![(NCLongLookDefaultPresentationController *)self _shouldPresentInCurrentContext];
}

- (BOOL)shouldRemovePresentersView
{
  return 0;
}

- (BOOL)_shouldRespectDefinesPresentationContext
{
  return 1;
}

- (CGRect)_frameForTransitionViewInPresentationSuperview:(id)a3
{
  id v4 = a3;
  v5 = [(PLExpandedPlatterPresentationController *)self presentationControllerDelegate];
  [v5 expandedPlatterPresentationController:self frameForTransitionViewInPresentationSuperview:v4];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;

  v23.origin.x = v7;
  v23.origin.y = v9;
  v23.size.width = v11;
  v23.size.height = v13;
  if (CGRectIsEmpty(v23))
  {
    v22.receiver = self;
    v22.super_class = (Class)NCLongLookDefaultPresentationController;
    [(NCLongLookDefaultPresentationController *)&v22 _frameForTransitionViewInPresentationSuperview:v4];
    CGFloat v7 = v14;
    CGFloat v9 = v15;
    CGFloat v11 = v16;
    CGFloat v13 = v17;
  }

  double v18 = v7;
  double v19 = v9;
  double v20 = v11;
  double v21 = v13;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (void)presentationTransitionWillBegin
{
  v8.receiver = self;
  v8.super_class = (Class)NCLongLookDefaultPresentationController;
  [(PLExpandedPlatterPresentationController *)&v8 presentationTransitionWillBegin];
  v3 = [(PLExpandedPlatterPresentationController *)self presentationControllerDelegate];
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ([v3 customBackgroundContainerViewForExpandedPlatterPresentationController:self],
        (id v4 = objc_claimAutoreleasedReturnValue()) != 0)
    || ([(NCLongLookDefaultPresentationController *)self containerView],
        (id v4 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    if ((objc_opt_respondsToSelector() & 1) == 0
      || [v3 expandedPlatterPresentationControllerShouldProvideBackground:self])
    {
      v5 = [MEMORY[0x1E4F743C8] materialViewWithRecipe:6 options:0 initialWeighting:0.0];
      backgroundMaterialView = self->_backgroundMaterialView;
      self->_backgroundMaterialView = v5;

      CGFloat v7 = self->_backgroundMaterialView;
      [v4 bounds];
      -[MTMaterialView setFrame:](v7, "setFrame:");
      [(MTMaterialView *)self->_backgroundMaterialView setAutoresizingMask:18];
      [v4 addSubview:self->_backgroundMaterialView];
      [v4 sendSubviewToBack:self->_backgroundMaterialView];
    }
  }
}

- (void)dismissalTransitionDidEnd:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)NCLongLookDefaultPresentationController;
  -[NCLongLookDefaultPresentationController dismissalTransitionDidEnd:](&v6, sel_dismissalTransitionDidEnd_);
  if (v3)
  {
    [(MTMaterialView *)self->_backgroundMaterialView removeFromSuperview];
    backgroundMaterialView = self->_backgroundMaterialView;
    self->_backgroundMaterialView = 0;
  }
}

- (void)viewControllerAnimator:(id)a3 willBeginPresentationAnimationWithTransitionContext:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)NCLongLookDefaultPresentationController;
  [(PLExpandedPlatterPresentationController *)&v12 viewControllerAnimator:a3 willBeginPresentationAnimationWithTransitionContext:a4];
  backgroundMaterialView = self->_backgroundMaterialView;
  if (backgroundMaterialView)
  {
    objc_super v6 = backgroundMaterialView;
    CGFloat v7 = [(NCLongLookDefaultPresentationController *)self presentedViewController];
    objc_super v8 = [v7 transitionCoordinator];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __118__NCLongLookDefaultPresentationController_viewControllerAnimator_willBeginPresentationAnimationWithTransitionContext___block_invoke;
    v10[3] = &unk_1E6A941D8;
    CGFloat v11 = v6;
    CGFloat v9 = v6;
    [v8 animateAlongsideTransition:v10 completion:0];
  }
}

uint64_t __118__NCLongLookDefaultPresentationController_viewControllerAnimator_willBeginPresentationAnimationWithTransitionContext___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setWeighting:1.0];
}

- (void)viewControllerAnimator:(id)a3 willBeginDismissalAnimationWithTransitionContext:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)NCLongLookDefaultPresentationController;
  [(PLExpandedPlatterPresentationController *)&v12 viewControllerAnimator:a3 willBeginDismissalAnimationWithTransitionContext:a4];
  backgroundMaterialView = self->_backgroundMaterialView;
  if (backgroundMaterialView)
  {
    objc_super v6 = backgroundMaterialView;
    CGFloat v7 = [(NCLongLookDefaultPresentationController *)self presentedViewController];
    objc_super v8 = [v7 transitionCoordinator];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __115__NCLongLookDefaultPresentationController_viewControllerAnimator_willBeginDismissalAnimationWithTransitionContext___block_invoke;
    v10[3] = &unk_1E6A941D8;
    CGFloat v11 = v6;
    CGFloat v9 = v6;
    [v8 animateAlongsideTransition:v10 completion:0];
  }
}

uint64_t __115__NCLongLookDefaultPresentationController_viewControllerAnimator_willBeginDismissalAnimationWithTransitionContext___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setWeighting:0.0];
}

- (BOOL)_shouldPresentInCurrentContext
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sourceViewController);
  char v3 = [WeakRetained definesPresentationContext];

  return v3;
}

- (BOOL)isPresenting
{
  return self->_presenting;
}

- (void)setPresenting:(BOOL)a3
{
  self->_presenting = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundMaterialView, 0);

  objc_destroyWeak((id *)&self->_sourceViewController);
}

@end