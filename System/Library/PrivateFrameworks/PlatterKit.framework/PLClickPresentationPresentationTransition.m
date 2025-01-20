@interface PLClickPresentationPresentationTransition
- (CGAffineTransform)targetTransform;
- (PLClickPresentationPresentationTransition)initWithTransitionDelegate:(id)a3 presentingViewController:(id)a4 presentedViewController:(id)a5 completion:(id)a6;
- (id)_newAnimator;
- (void)_configureTransitionContextWithFromView:(id)a3 toView:(id)a4 containerView:(id)a5;
- (void)updateBackgroundViewForTransition;
@end

@implementation PLClickPresentationPresentationTransition

- (PLClickPresentationPresentationTransition)initWithTransitionDelegate:(id)a3 presentingViewController:(id)a4 presentedViewController:(id)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PLClickPresentationPresentationTransition;
  v12 = [(PLClickPresentationTransition *)&v15 initWithTransitionDelegate:a3 presentingViewController:v10 presentedViewController:v11 completion:a6];
  v13 = v12;
  if (v12)
  {
    [(_UIViewControllerOneToOneTransitionContext *)v12->super._transitionContext _setFromViewController:v10];
    [(_UIViewControllerOneToOneTransitionContext *)v13->super._transitionContext _setToViewController:v11];
  }

  return v13;
}

- (void)updateBackgroundViewForTransition
{
  id v2 = [(PLClickPresentationTransition *)self backgroundView];
  [v2 setWeighting:1.0];
}

- (CGAffineTransform)targetTransform
{
  result = (CGAffineTransform *)self->super._transitionContext;
  if (result) {
    return (CGAffineTransform *)[(CGAffineTransform *)result targetTransform];
  }
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  return result;
}

- (id)_newAnimator
{
  transitionDelegate = self->super._transitionDelegate;
  v4 = [(_UIViewControllerOneToOneTransitionContext *)self->super._transitionContext toViewController];
  v5 = [(_UIViewControllerOneToOneTransitionContext *)self->super._transitionContext fromViewController];
  v6 = [(_UIViewControllerOneToOneTransitionContext *)self->super._transitionContext fromViewController];
  v7 = [(UIViewControllerTransitioningDelegate *)transitionDelegate animationControllerForPresentedController:v4 presentingController:v5 sourceController:v6];

  return v7;
}

- (void)_configureTransitionContextWithFromView:(id)a3 toView:(id)a4 containerView:(id)a5
{
  id v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PLClickPresentationPresentationTransition;
  id v9 = a5;
  [(PLClickPresentationTransition *)&v13 _configureTransitionContextWithFromView:v8 toView:a4 containerView:v9];
  id v10 = [MEMORY[0x1E4F743C8] materialViewWithRecipe:6 options:0 initialWeighting:0.0];
  [v10 setUseBuiltInAlphaTransformerAndBackdropScaleAdjustmentIfNecessary:1];
  [v9 bounds];
  objc_msgSend(v10, "setFrame:");
  [v10 setAutoresizingMask:18];
  [v9 insertSubview:v10 atIndex:0];

  [(PLClickPresentationTransition *)self setBackgroundView:v10];
  if ([(PLClickPresentationTransition *)self propagatesPresentingViewTransform])
  {
    transitionContext = self->super._transitionContext;
    if (v8) {
      [v8 transform];
    }
    else {
      memset(v12, 0, sizeof(v12));
    }
    [(_PLViewControllerOneToOneTransitionContext *)transitionContext setTargetTransform:v12];
  }
}

@end