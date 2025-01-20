@interface SBSpotlightTransitionAnimator
- (BOOL)shouldMoveIntoSearch;
- (BOOL)shouldMoveIntoSearchOnCancel;
- (BOOL)supportsRestarting;
- (SBSpotlightTransitionAnimator)init;
- (double)_percentVisibleForPercentComplete:(double)a3;
- (double)percentComplete;
- (double)transitionDuration:(id)a3;
- (void)_animateInteractiveTransition:(id)a3;
- (void)_animateIntoSearch:(BOOL)a3;
- (void)_cancelInteractiveTransition:(id)a3 withCompletionSpeed:(double)a4 completionCurve:(int64_t)a5;
- (void)_cleanupAfterAnimating:(BOOL)a3;
- (void)_finishInteractiveTransition:(id)a3 withCompletionSpeed:(double)a4 completionCurve:(int64_t)a5;
- (void)_prepareToAnimate;
- (void)_prototypeSettingsChanged;
- (void)_restoreSpotlightHeaderToInitiatingViewController;
- (void)_restoreSpotlightHeaderToInitiatingViewControllerForCancellation:(BOOL)a3;
- (void)_updateTransitionIntoSearch:(BOOL)a3 percentComplete:(double)a4;
- (void)animateTransition:(id)a3;
- (void)cancelTransition:(id)a3 withCompletionSpeed:(double)a4 completionCurve:(int64_t)a5;
- (void)finishInteractiveTransition:(id)a3 withCompletionSpeed:(double)a4 completionCurve:(int64_t)a5;
- (void)settings:(id)a3 changedValueForKey:(id)a4;
- (void)updateTransition:(id)a3 withPercentComplete:(double)a4;
@end

@implementation SBSpotlightTransitionAnimator

- (SBSpotlightTransitionAnimator)init
{
  v6.receiver = self;
  v6.super_class = (Class)SBSpotlightTransitionAnimator;
  v2 = [(SBSpotlightTransitionAnimator *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[SBSystemAnimationDomain rootSettings];
    settings = v2->_settings;
    v2->_settings = (SBSystemAnimationSettings *)v3;

    [(PTSettings *)v2->_settings addKeyObserver:v2];
    [(SBSpotlightTransitionAnimator *)v2 _prototypeSettingsChanged];
  }
  return v2;
}

- (BOOL)shouldMoveIntoSearch
{
  return self->_operation == 0;
}

- (BOOL)shouldMoveIntoSearchOnCancel
{
  return self->_operation != 0;
}

- (double)transitionDuration:(id)a3
{
  return self->_transitionDuration;
}

- (void)animateTransition:(id)a3
{
  id v6 = a3;
  objc_storeStrong((id *)&self->_transitionContext, a3);
  v7 = [v6 containerView];
  containerView = self->_containerView;
  self->_containerView = v7;

  if (!self->_containerView)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"SBSpotlightTransitionAnimator.m", 89, @"Invalid parameter not satisfying: %@", @"_containerView" object file lineNumber description];
  }
  if ([v6 isInteractive])
  {
    [(SBSpotlightTransitionAnimator *)self _animateInteractiveTransition:v6];
  }
  else
  {
    unint64_t v9 = self->_transitionToken + 1;
    self->_transitionToken = v9;
    if (([v6 transitionWasRestarted] & 1) == 0)
    {
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __51__SBSpotlightTransitionAnimator_animateTransition___block_invoke;
      v20[3] = &unk_1E6AF4AC0;
      v20[4] = self;
      [MEMORY[0x1E4F42FF0] performWithoutAnimation:v20];
    }
    BOOL v10 = [(SBSpotlightTransitionAnimator *)self shouldMoveIntoSearch];
    [(SBSpotlightTransitionAnimator *)self transitionDuration:v6];
    double v12 = v11;
    v13 = (void *)MEMORY[0x1E4F42FF0];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __51__SBSpotlightTransitionAnimator_animateTransition___block_invoke_2;
    v18[3] = &unk_1E6AF5D38;
    v18[4] = self;
    BOOL v19 = v10;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __51__SBSpotlightTransitionAnimator_animateTransition___block_invoke_3;
    v15[3] = &unk_1E6B017F0;
    unint64_t v17 = v9;
    v15[4] = self;
    id v16 = v6;
    [v13 animateKeyframesWithDuration:0 delay:v18 options:v15 animations:v12 completion:0.0];
  }
}

uint64_t __51__SBSpotlightTransitionAnimator_animateTransition___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _prepareToAnimate];
}

uint64_t __51__SBSpotlightTransitionAnimator_animateTransition___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _animateIntoSearch:*(unsigned __int8 *)(a1 + 40)];
}

void *__51__SBSpotlightTransitionAnimator_animateTransition___block_invoke_3(void *a1)
{
  uint64_t v2 = a1[6];
  result = (void *)a1[4];
  if (v2 == result[5])
  {
    [result _cleanupAfterAnimating:1];
    v4 = (void *)a1[5];
    return (void *)[v4 completeTransition:1];
  }
  return result;
}

- (void)updateTransition:(id)a3 withPercentComplete:(double)a4
{
  if (([(SBViewControllerContextTransitioning *)self->_transitionContext isAnimated] & 1) == 0)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"SBSpotlightTransitionAnimator.m", 122, @"Invalid parameter not satisfying: %@", @"[_transitionContext isAnimated]" object file lineNumber description];
  }
  [(SBSpotlightTransitionAnimator *)self _updateTransitionIntoSearch:[(SBSpotlightTransitionAnimator *)self shouldMoveIntoSearch] percentComplete:a4];
  if ([(SBSpotlightTransitionAnimator *)self shouldMoveIntoSearch])
  {
    spotlightViewController = self->_spotlightViewController;
    [(SPUIRemoteSearchViewController *)spotlightViewController setRevealProgress:a4];
  }
}

- (void)cancelTransition:(id)a3 withCompletionSpeed:(double)a4 completionCurve:(int64_t)a5
{
  id v8 = a3;
  uint64_t v9 = objc_opt_class();
  BOOL v10 = SBSafeCast(v9, v8);
  if ([v10 initiallyInteractive])
  {
    [(SBSpotlightTransitionAnimator *)self _cancelInteractiveTransition:v8 withCompletionSpeed:a5 completionCurve:a4];
  }
  else
  {
    unint64_t v11 = self->_transitionToken + 1;
    self->_transitionToken = v11;
    BOOL v12 = [(SBSpotlightTransitionAnimator *)self shouldMoveIntoSearchOnCancel];
    [(SBSpotlightTransitionAnimator *)self transitionDuration:v8];
    double v14 = v13;
    v15 = (void *)MEMORY[0x1E4F42FF0];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __86__SBSpotlightTransitionAnimator_cancelTransition_withCompletionSpeed_completionCurve___block_invoke;
    v19[3] = &unk_1E6AF5D38;
    v19[4] = self;
    BOOL v20 = v12;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __86__SBSpotlightTransitionAnimator_cancelTransition_withCompletionSpeed_completionCurve___block_invoke_2;
    v16[3] = &unk_1E6B017F0;
    unint64_t v18 = v11;
    v16[4] = self;
    id v17 = v8;
    [v15 animateKeyframesWithDuration:0 delay:v19 options:v16 animations:v14 completion:0.0];
  }
}

uint64_t __86__SBSpotlightTransitionAnimator_cancelTransition_withCompletionSpeed_completionCurve___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _animateIntoSearch:*(unsigned __int8 *)(a1 + 40)];
}

void *__86__SBSpotlightTransitionAnimator_cancelTransition_withCompletionSpeed_completionCurve___block_invoke_2(void *a1)
{
  uint64_t v2 = a1[6];
  result = (void *)a1[4];
  if (v2 == result[5])
  {
    [result _cleanupAfterAnimating:0];
    v4 = (void *)a1[5];
    return (void *)[v4 completeTransition:0];
  }
  return result;
}

- (void)finishInteractiveTransition:(id)a3 withCompletionSpeed:(double)a4 completionCurve:(int64_t)a5
{
  id v10 = a3;
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = SBSafeCast(v8, v10);
  if ([v9 initiallyInteractive]) {
    [(SBSpotlightTransitionAnimator *)self _finishInteractiveTransition:v10 withCompletionSpeed:a5 completionCurve:a4];
  }
}

- (double)percentComplete
{
  return self->_percentComplete;
}

- (BOOL)supportsRestarting
{
  return 1;
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  if ([a4 isEqualToString:@"spotlightNoninteractiveAnimationDuration"])
  {
    [(SBSpotlightTransitionAnimator *)self _prototypeSettingsChanged];
  }
}

- (void)_prepareToAnimate
{
  if (([(SBViewControllerContextTransitioning *)self->_transitionContext isAnimated] & 1) == 0)
  {
    v40 = [MEMORY[0x1E4F28B00] currentHandler];
    [v40 handleFailureInMethod:a2, self, @"SBSpotlightTransitionAnimator.m", 178, @"Invalid parameter not satisfying: %@", @"[_transitionContext isAnimated]" object file lineNumber description];
  }
  v4 = [(SBViewControllerContextTransitioning *)self->_transitionContext viewControllerForKey:@"SBSpotlightInitiatingViewControllerKey"];
  initiatingViewController = self->_initiatingViewController;
  self->_initiatingViewController = v4;

  id v6 = +[SBSpotlightMultiplexingViewController sharedRemoteSearchViewController];
  spotlightViewController = self->_spotlightViewController;
  self->_spotlightViewController = v6;

  self->_pulldownInterval.start.value = -141.0;
  self->_pulldownInterval.start.inclusive = 1;
  *(void *)(&self->_pulldownInterval.start.inclusive + 1) = 0;
  self->_pulldownInterval.end.value = 0.0;
  self->_pulldownInterval.end.inclusive = 1;
  *(_DWORD *)(&self->_pulldownInterval.end.inclusive + 1) = 0;
  *((_DWORD *)&self->_pulldownInterval.end.inclusive + 1) = 0;
  uint64_t v8 = [(SBViewControllerContextTransitioning *)self->_transitionContext viewControllerForKey:*MEMORY[0x1E4F43EC0]];

  if (v8)
  {
    self->_unint64_t operation = 0;
    uint64_t v9 = [(SBViewControllerContextTransitioning *)self->_transitionContext viewForKey:*MEMORY[0x1E4F43EC8]];
    [v9 setAlpha:1.0];
    id v10 = [(SPUIRemoteSearchViewController *)self->_spotlightViewController view];
    searchView = self->_searchView;
    self->_searchView = v10;

    [(SPUIRemoteSearchViewController *)self->_spotlightViewController setEdgesForExtendedLayout:[(SPUIRemoteSearchViewController *)self->_spotlightViewController edgesForExtendedLayout] & 0xFFFFFFFFFFFFFFFELL];
  }
  else
  {
    BOOL v12 = [(SBViewControllerContextTransitioning *)self->_transitionContext viewControllerForKey:*MEMORY[0x1E4F43EB0]];

    if (v12)
    {
      self->_unint64_t operation = 1;
      uint64_t v9 = [(SBViewControllerContextTransitioning *)self->_transitionContext viewForKey:*MEMORY[0x1E4F43EB8]];
      [v9 setAlpha:1.0];
      double v13 = [(SPUIRemoteSearchViewController *)self->_spotlightViewController view];
      double v14 = self->_searchView;
      self->_searchView = v13;
    }
    else
    {
      v15 = [MEMORY[0x1E4F28B00] currentHandler];
      [v15 handleFailureInMethod:a2 object:self file:@"SBSpotlightTransitionAnimator.m" lineNumber:200 description:@"Can only transition in or out of search."];

      uint64_t v9 = 0;
    }
  }
  id v16 = self->_searchView;
  id v17 = [(SPUIRemoteSearchViewController *)self->_spotlightViewController view];
  [v17 center];
  -[UIView setCenter:](v16, "setCenter:");

  unint64_t v18 = [(UIView *)self->_searchView layer];
  long long v19 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v41[0] = *MEMORY[0x1E4F1DAB8];
  v41[1] = v19;
  v41[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [v18 setAffineTransform:v41];

  [(UIView *)self->_searchView _setIgnoresLayerTransformForSafeAreaInsets:1];
  unint64_t operation = self->_operation;
  if (operation)
  {
    if (operation != 1) {
      goto LABEL_13;
    }
    double v21 = 1.0;
  }
  else
  {
    double v21 = 0.0;
  }
  [(UIView *)self->_searchView setAlpha:v21];
LABEL_13:
  [(UIView *)self->_containerView bounds];
  double v26 = v22;
  double v27 = v23;
  double v28 = v24;
  double v29 = v25;
  if (!self->_operation)
  {
    v30 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", v22, v23, v24, v25);
    touchSwallowingView = self->_touchSwallowingView;
    self->_touchSwallowingView = v30;

    [(UIView *)self->_touchSwallowingView setUserInteractionEnabled:1];
    [(UIView *)self->_containerView addSubview:self->_touchSwallowingView];
    [(UIView *)self->_containerView bringSubviewToFront:self->_touchSwallowingView];
    v32 = [(SPUIRemoteSearchViewController *)self->_spotlightViewController navigationController];
    v33 = [v32 view];
    [v33 setUserInteractionEnabled:0];
  }
  v34 = [(SBViewControllerContextTransitioning *)self->_transitionContext viewForKey:@"SBSpotlightSearchBackdropViewKey"];
  backdropView = self->_backdropView;
  if (backdropView && self->_ownsBackdropView)
  {
    [(SBSearchBackdropView *)backdropView removeFromSuperview];
    v36 = self->_backdropView;
    self->_backdropView = 0;
  }
  if (v34)
  {
    v37 = v34;
    BOOL v38 = 0;
  }
  else
  {
    v37 = (SBSearchBackdropView *)objc_msgSend(objc_alloc(MEMORY[0x1E4FA6470]), "initWithFrame:", v26, v27, v28, v29);
    BOOL v38 = 1;
  }
  v39 = self->_backdropView;
  self->_backdropView = v37;

  self->_ownsBackdropView = v38;
  [(SBSearchBackdropView *)self->_backdropView prepareForTransitionToBlurred:self->_operation == 0];
  if (!v34) {
    [(UIView *)self->_containerView insertSubview:self->_backdropView belowSubview:v9];
  }
}

- (void)_animateInteractiveTransition:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __63__SBSpotlightTransitionAnimator__animateInteractiveTransition___block_invoke;
  v3[3] = &unk_1E6AF4AC0;
  v3[4] = self;
  [MEMORY[0x1E4F42FF0] performWithoutAnimation:v3];
}

uint64_t __63__SBSpotlightTransitionAnimator__animateInteractiveTransition___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _prepareToAnimate];
}

- (void)_updateTransitionIntoSearch:(BOOL)a3 percentComplete:(double)a4
{
  BOOL v5 = a3;
  self->_percentComplete = a4;
  double v7 = 1.0 - a4;
  [(SBSpotlightTransitionAnimator *)self _percentVisibleForPercentComplete:a4];
  double v9 = v8;
  [(SBSpotlightTransitionAnimator *)self _percentVisibleForPercentComplete:v7];
  searchView = self->_searchView;
  if (v5)
  {
    [(UIView *)searchView setAlpha:v9];
    if (([(SBViewControllerContextTransitioning *)self->_transitionContext isInteractive] & 1) == 0) {
      return;
    }
  }
  else
  {
    -[UIView setAlpha:](searchView, "setAlpha:");
    if (![(SBViewControllerContextTransitioning *)self->_transitionContext isInteractive]) {
      return;
    }
  }
  backdropView = self->_backdropView;
  [(SBSearchBackdropView *)backdropView setTransitionProgress:a4];
}

- (void)_cancelInteractiveTransition:(id)a3 withCompletionSpeed:(double)a4 completionCurve:(int64_t)a5
{
  id v6 = a3;
  [(SBSpotlightTransitionAnimator *)self _cleanupAfterAnimating:0];
  [v6 completeTransition:0];
}

- (void)_finishInteractiveTransition:(id)a3 withCompletionSpeed:(double)a4 completionCurve:(int64_t)a5
{
  id v6 = a3;
  [(SBSpotlightTransitionAnimator *)self _cleanupAfterAnimating:1];
  [v6 completeTransition:1];
}

- (void)_animateIntoSearch:(BOOL)a3
{
  BOOL v3 = a3;
  if (([(SBViewControllerContextTransitioning *)self->_transitionContext isAnimated] & 1) == 0)
  {
    double v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"SBSpotlightTransitionAnimator.m", 283, @"Invalid parameter not satisfying: %@", @"[_transitionContext isAnimated]" object file lineNumber description];
  }
  if (v3) {
    double v6 = 0.75;
  }
  else {
    double v6 = 0.25;
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __52__SBSpotlightTransitionAnimator__animateIntoSearch___block_invoke;
  v11[3] = &unk_1E6AFB0E8;
  v11[4] = self;
  BOOL v12 = v3;
  *(double *)&v11[5] = v6;
  [MEMORY[0x1E4F42FF0] addKeyframeWithRelativeStartTime:v11 relativeDuration:0.0 animations:v6];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __52__SBSpotlightTransitionAnimator__animateIntoSearch___block_invoke_2;
  v9[3] = &unk_1E6AF5D38;
  v9[4] = self;
  BOOL v10 = v3;
  [MEMORY[0x1E4F42FF0] addKeyframeWithRelativeStartTime:v9 relativeDuration:v6 animations:1.0 - v6];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __52__SBSpotlightTransitionAnimator__animateIntoSearch___block_invoke_3;
  v8[3] = &unk_1E6AF4AC0;
  v8[4] = self;
  [MEMORY[0x1E4F42FF0] addKeyframeWithRelativeStartTime:v8 relativeDuration:0.0 animations:1.0];
}

uint64_t __52__SBSpotlightTransitionAnimator__animateIntoSearch___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateTransitionIntoSearch:*(unsigned __int8 *)(a1 + 48) percentComplete:*(double *)(a1 + 40)];
}

uint64_t __52__SBSpotlightTransitionAnimator__animateIntoSearch___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateTransitionIntoSearch:*(unsigned __int8 *)(a1 + 40) percentComplete:1.0];
}

uint64_t __52__SBSpotlightTransitionAnimator__animateIntoSearch___block_invoke_3(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 80) setTransitionProgress:1.0];
}

- (void)_cleanupAfterAnimating:(BOOL)a3
{
  BOOL v3 = a3;
  if (([(SBViewControllerContextTransitioning *)self->_transitionContext isAnimated] & 1) == 0)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"SBSpotlightTransitionAnimator.m", 303, @"Invalid parameter not satisfying: %@", @"[_transitionContext isAnimated]" object file lineNumber description];
  }
  double v6 = [(UIView *)self->_searchView layer];
  long long v7 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v16[0] = *MEMORY[0x1E4F1DAB8];
  v16[1] = v7;
  v16[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [v6 setAffineTransform:v16];

  [(UIView *)self->_searchView setAlpha:1.0];
  [(SBSearchBackdropView *)self->_backdropView completeTransitionSuccessfully:v3];
  [(SBSearchBackdropView *)self->_backdropView completeIncrementalTransitionSuccessfully:v3];
  if (self->_ownsBackdropView)
  {
    [(SBSearchBackdropView *)self->_backdropView setAlpha:0.0];
    [(SBSearchBackdropView *)self->_backdropView removeFromSuperview];
  }
  unint64_t operation = self->_operation;
  if (operation == 1)
  {
    if (v3) {
      [(SBSpotlightTransitionAnimator *)self _restoreSpotlightHeaderToInitiatingViewController];
    }
  }
  else if (!operation)
  {
    touchSwallowingView = self->_touchSwallowingView;
    if (touchSwallowingView)
    {
      [(UIView *)touchSwallowingView removeFromSuperview];
      BOOL v10 = self->_touchSwallowingView;
      self->_touchSwallowingView = 0;

      unint64_t v11 = [(SPUIRemoteSearchViewController *)self->_spotlightViewController navigationController];
      BOOL v12 = [v11 view];
      [v12 setUserInteractionEnabled:1];
    }
    if (!v3) {
      [(SBSpotlightTransitionAnimator *)self _restoreSpotlightHeaderToInitiatingViewControllerForCancellation:1];
    }
  }
  searchView = self->_searchView;
  self->_searchView = 0;

  backdropView = self->_backdropView;
  self->_backdropView = 0;
}

- (void)_restoreSpotlightHeaderToInitiatingViewController
{
}

- (void)_restoreSpotlightHeaderToInitiatingViewControllerForCancellation:(BOOL)a3
{
  v4 = [(SBUISpotlightInitiating *)self->_initiatingViewController spotlightHeaderAcquiringViewController];
  BOOL v5 = v4;
  if (v4)
  {
    double v6 = [v4 navigationItem];
    id v7 = [v6 _canvasView];
  }
  else
  {
    id v7 = [(SBViewControllerContextTransitioning *)self->_transitionContext viewForKey:@"SBSpotlightSearchHeaderViewKey"];
  }
  [v7 setAlpha:1.0];
}

- (void)_prototypeSettingsChanged
{
  [(SBSystemAnimationSettings *)self->_settings spotlightNoninteractiveAnimationDuration];
  self->_transitionDuration = v3;
}

- (double)_percentVisibleForPercentComplete:(double)a3
{
  return a3 * 4.0 + -3.0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spotlightViewController, 0);
  objc_storeStrong((id *)&self->_initiatingViewController, 0);
  objc_storeStrong((id *)&self->_backdropView, 0);
  objc_storeStrong((id *)&self->_searchView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_touchSwallowingView, 0);
  objc_storeStrong((id *)&self->_transitionContext, 0);
  objc_storeStrong((id *)&self->_settings, 0);
}

@end