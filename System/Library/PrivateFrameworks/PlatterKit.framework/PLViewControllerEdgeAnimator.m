@interface PLViewControllerEdgeAnimator
+ (BOOL)drivesAnimation;
- (id)_newPropertyAnimator;
- (void)_animateTransitionToEdge:(unint64_t)a3 withTransitionContext:(id)a4;
- (void)_performTransitionWithContext:(id)a3;
@end

@implementation PLViewControllerEdgeAnimator

+ (BOOL)drivesAnimation
{
  return 1;
}

- (id)_newPropertyAnimator
{
  id v2 = objc_alloc(MEMORY[0x1E4F43008]);
  v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42E18]), "initWithMass:stiffness:damping:initialVelocity:", 2.0, 300.0, 300.0, 0.0, 0.0);
  v4 = (void *)[v2 initWithDuration:v3 timingParameters:0.0];

  return v4;
}

- (void)_performTransitionWithContext:(id)a3
{
}

- (void)_animateTransitionToEdge:(unint64_t)a3 withTransitionContext:(id)a4
{
  id v5 = a4;
  v6 = [(PLViewControllerAnimator *)self _presentedViewControllerForPresentation:0 withTransitionContext:v5];
  v7 = [v6 expandedPlatterPresentationController];
  [v7 frameOfPresentedViewInContainerView];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  v14 = [v5 containerView];
  [v14 bounds];
  double MaxY = CGRectGetMaxY(v19);
  v16 = [(PLViewControllerAnimator *)self _sourceViewForPresentation:0 withTransitionContext:v5];
  v17 = [(PLViewControllerAnimator *)self _presentedViewForPresentation:0 withTransitionContext:v5];

  [v16 setAlpha:1.0];
  PLSetViewFrameMaintainingTransform(v17, v9, MaxY, v11, v13);
  CGAffineTransformMakeScale(&v18, 0.9, 0.9);
  [v17 setTransform:&v18];
}

@end