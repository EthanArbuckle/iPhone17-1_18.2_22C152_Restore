@interface PUViewControllerTransition
+ (id)interactionControllerForAnimationController:(id)a3;
- (BOOL)isInteractive;
- (BOOL)startedInteractively;
- (CGRect)finalFromViewFrame;
- (CGRect)finalToViewFrame;
- (CGRect)initialFromViewFrame;
- (CGRect)initialToViewFrame;
- (PUViewControllerTransition)initWithDuration:(double)a3;
- (double)duration;
- (double)imageModulationIntensity;
- (double)interactiveProgress;
- (double)visibleInteractiveProgress;
- (id)_newInteractiveTransition;
- (id)containerView;
- (id)fromViewController;
- (id)interactiveTransition;
- (id)toViewController;
- (id)transitionContext;
- (void)_setInteractive:(BOOL)a3;
- (void)_setInteractiveProgress:(double)a3;
- (void)animateTransition:(id)a3;
- (void)animationEnded:(BOOL)a3;
- (void)cancelInteractiveTransition;
- (void)completeTransition:(BOOL)a3;
- (void)finishInteractiveTransition;
- (void)setStartedInteractively:(BOOL)a3;
- (void)setTransitionContext:(id)a3;
- (void)setVisibleInteractiveProgress:(double)a3;
- (void)updateInteractiveTransitionProgress:(double)a3;
- (void)updateInteractiveTransitionProgress:(double)a3 visibleTransitionProgress:(double)a4;
@end

@implementation PUViewControllerTransition

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interactiveTransition, 0);
  objc_storeStrong((id *)&self->_transitionContext, 0);
}

- (BOOL)startedInteractively
{
  return self->_startedInteractively;
}

- (double)visibleInteractiveProgress
{
  return self->_visibleInteractiveProgress;
}

- (void)_setInteractiveProgress:(double)a3
{
  self->_interactiveProgress = a3;
}

- (double)interactiveProgress
{
  return self->_interactiveProgress;
}

- (void)_setInteractive:(BOOL)a3
{
  self->_interactive = a3;
}

- (BOOL)isInteractive
{
  return self->_interactive;
}

- (double)duration
{
  return self->_duration;
}

- (void)animationEnded:(BOOL)a3
{
  transitionContext = self->_transitionContext;
  self->_transitionContext = 0;

  interactiveTransition = self->_interactiveTransition;
  self->_interactiveTransition = 0;

  [(PUViewControllerTransition *)self setStartedInteractively:0];
}

- (void)animateTransition:(id)a3
{
}

- (void)completeTransition:(BOOL)a3
{
}

- (CGRect)finalToViewFrame
{
  transitionContext = self->_transitionContext;
  v3 = [(PUViewControllerTransition *)self toViewController];
  [(UIViewControllerContextTransitioning *)transitionContext finalFrameForViewController:v3];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (CGRect)finalFromViewFrame
{
  transitionContext = self->_transitionContext;
  v3 = [(PUViewControllerTransition *)self fromViewController];
  [(UIViewControllerContextTransitioning *)transitionContext finalFrameForViewController:v3];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (CGRect)initialToViewFrame
{
  transitionContext = self->_transitionContext;
  v3 = [(PUViewControllerTransition *)self toViewController];
  [(UIViewControllerContextTransitioning *)transitionContext initialFrameForViewController:v3];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (CGRect)initialFromViewFrame
{
  transitionContext = self->_transitionContext;
  v3 = [(PUViewControllerTransition *)self fromViewController];
  [(UIViewControllerContextTransitioning *)transitionContext initialFrameForViewController:v3];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (id)containerView
{
  return (id)[(UIViewControllerContextTransitioning *)self->_transitionContext containerView];
}

- (id)toViewController
{
  return (id)[(UIViewControllerContextTransitioning *)self->_transitionContext viewControllerForKey:*MEMORY[0x1E4FB30C8]];
}

- (id)fromViewController
{
  return (id)[(UIViewControllerContextTransitioning *)self->_transitionContext viewControllerForKey:*MEMORY[0x1E4FB30B8]];
}

- (void)setTransitionContext:(id)a3
{
}

- (id)transitionContext
{
  return self->_transitionContext;
}

- (id)interactiveTransition
{
  if ([(PUViewControllerTransition *)self isInteractive] && !self->_interactiveTransition)
  {
    v3 = [(PUViewControllerTransition *)self _newInteractiveTransition];
    interactiveTransition = self->_interactiveTransition;
    self->_interactiveTransition = v3;
  }
  double v5 = self->_interactiveTransition;
  return v5;
}

- (void)cancelInteractiveTransition
{
  if ([(PUViewControllerTransition *)self isInteractive])
  {
    interactiveTransition = self->_interactiveTransition;
    [(UIPercentDrivenInteractiveTransition *)interactiveTransition cancelInteractiveTransition];
  }
}

- (void)finishInteractiveTransition
{
  if ([(PUViewControllerTransition *)self isInteractive])
  {
    interactiveTransition = self->_interactiveTransition;
    [(UIPercentDrivenInteractiveTransition *)interactiveTransition finishInteractiveTransition];
  }
}

- (void)updateInteractiveTransitionProgress:(double)a3 visibleTransitionProgress:(double)a4
{
  if ([(PUViewControllerTransition *)self isInteractive])
  {
    [(PUViewControllerTransition *)self _setInteractiveProgress:a3];
    double v7 = 0.0;
    if (a4 >= 0.0) {
      double v7 = a4;
    }
    [(PUViewControllerTransition *)self setVisibleInteractiveProgress:fmin(v7, 1.0)];
    double v8 = fmin(a3, 0.999000013);
    interactiveTransition = self->_interactiveTransition;
    [(UIPercentDrivenInteractiveTransition *)interactiveTransition updateInteractiveTransition:v8];
  }
}

- (void)updateInteractiveTransitionProgress:(double)a3
{
}

- (double)imageModulationIntensity
{
  double v4 = (double *)MEMORY[0x1E4F90EE0];
  if (![(PUViewControllerTransition *)self isInteractive])
  {
    double v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"PUViewControllerTransition.m" lineNumber:71 description:@"undefined for non-interactive transition"];
  }
  double v5 = *v4;
  [(PUViewControllerTransition *)self visibleInteractiveProgress];
  double v6 = [(PUViewControllerTransition *)self fromViewController];
  uint64_t v7 = [(PUViewControllerTransition *)self toViewController];
  double v8 = (void *)v7;
  if (v6 && v7)
  {
    objc_msgSend(v6, "px_imageModulationIntensity");
    objc_msgSend(v8, "px_imageModulationIntensity");
    PXFloatByLinearlyInterpolatingFloats();
    double v5 = v9;
  }

  return v5;
}

- (void)setVisibleInteractiveProgress:(double)a3
{
  if (self->_visibleInteractiveProgress != a3)
  {
    self->_visibleInteractiveProgress = a3;
    [(PUViewControllerTransition *)self imageModulationIntensityDidChange];
  }
}

- (void)setStartedInteractively:(BOOL)a3
{
  self->_startedInteractively = a3;
  -[PUViewControllerTransition _setInteractive:](self, "_setInteractive:");
}

- (id)_newInteractiveTransition
{
  return objc_alloc_init(MEMORY[0x1E4FB1A88]);
}

- (PUViewControllerTransition)initWithDuration:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PUViewControllerTransition;
  CGRect result = [(PUViewControllerTransition *)&v5 init];
  if (result) {
    result->_duration = a3;
  }
  return result;
}

+ (id)interactionControllerForAnimationController:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v4 = [v3 interactiveTransition];
  }
  else
  {
    double v4 = 0;
  }

  return v4;
}

@end