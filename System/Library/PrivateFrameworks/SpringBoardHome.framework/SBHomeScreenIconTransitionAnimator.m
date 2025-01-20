@interface SBHomeScreenIconTransitionAnimator
- (BOOL)iconAnimator:(id)a3 canAlterViewHierarchyDuringCleanupUsingBlock:(id)a4;
- (BOOL)isCancelled;
- (BOOL)supportsRestarting;
- (BOOL)wasRestarted;
- (SBHIconAnimationSettings)currentSettings;
- (SBHomeScreenIconTransitionAnimator)initWithIconAnimator:(id)a3 childViewController:(id)a4 operation:(unint64_t)a5;
- (SBHomeScreenIconTransitionAnimatorDelegate)delegate;
- (SBIconAnimator)iconAnimator;
- (SBNestingViewController)childViewController;
- (double)initialDelay;
- (double)percentComplete;
- (double)transitionDuration:(id)a3;
- (id)transitionAnimationFactory:(id)a3;
- (unint64_t)currentOperation;
- (unint64_t)operation;
- (void)animateTransition:(id)a3;
- (void)animationEnded:(BOOL)a3;
- (void)cancel;
- (void)cancelTransition:(id)a3 withCompletionSpeed:(double)a4 completionCurve:(int64_t)a5;
- (void)completeImmediately;
- (void)finishInteractiveTransition:(id)a3 withCompletionSpeed:(double)a4 completionCurve:(int64_t)a5;
- (void)iconAnimatorWasInvalidated:(id)a3;
- (void)restart;
- (void)reverse;
- (void)setDelegate:(id)a3;
- (void)setInitialDelay:(double)a3;
- (void)updateTransition:(id)a3 withPercentComplete:(double)a4;
@end

@implementation SBHomeScreenIconTransitionAnimator

- (SBHomeScreenIconTransitionAnimator)initWithIconAnimator:(id)a3 childViewController:(id)a4 operation:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SBHomeScreenIconTransitionAnimator;
  v11 = [(SBHomeScreenIconTransitionAnimator *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_iconAnimator, a3);
    [v9 setDelegate:v12];
    objc_storeStrong((id *)&v12->_childViewController, a4);
    v12->_operation = a5;
  }

  return v12;
}

- (BOOL)isCancelled
{
  return [(SBViewControllerContextTransitioning *)self->_transitionContext transitionWasCancelled];
}

- (BOOL)wasRestarted
{
  return [(SBViewControllerContextTransitioning *)self->_transitionContext transitionWasRestarted];
}

- (unint64_t)currentOperation
{
  unint64_t v3 = [(SBHomeScreenIconTransitionAnimator *)self operation];
  if ([(SBHomeScreenIconTransitionAnimator *)self isCancelled]) {
    return v3 == 0;
  }
  else {
    return v3;
  }
}

- (void)cancel
{
  if (![(SBHomeScreenIconTransitionAnimator *)self isCancelled])
  {
    transitionContext = self->_transitionContext;
    [(SBViewControllerContextTransitioning *)transitionContext cancelTransition];
  }
}

- (void)restart
{
  if ([(SBHomeScreenIconTransitionAnimator *)self isCancelled])
  {
    self->_needsTransitionTokenIncrementOnNextUpdate = 1;
    transitionContext = self->_transitionContext;
    [(SBViewControllerContextTransitioning *)transitionContext restartTransition];
  }
}

- (void)reverse
{
  if ([(SBHomeScreenIconTransitionAnimator *)self isCancelled])
  {
    [(SBHomeScreenIconTransitionAnimator *)self restart];
  }
  else
  {
    [(SBHomeScreenIconTransitionAnimator *)self cancel];
  }
}

- (void)completeImmediately
{
  unint64_t v3 = [(SBHomeScreenIconTransitionAnimator *)self iconAnimator];
  v4 = v3;
  if (v3 && ([v3 invalidated] & 1) == 0)
  {
    unint64_t v5 = self->_transitionToken + 1;
    self->_transitionToken = v5;
    [v4 setSettings:0];
    unint64_t v6 = [(SBHomeScreenIconTransitionAnimator *)self currentOperation];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __57__SBHomeScreenIconTransitionAnimator_completeImmediately__block_invoke;
    v9[3] = &unk_1E6AB4940;
    v9[4] = self;
    v9[5] = v5;
    v7 = _Block_copy(v9);
    double v8 = 0.0;
    if (!v6) {
      double v8 = 1.0;
    }
    [v4 animateToFraction:v7 afterDelay:v8 withCompletion:0.0];
  }
  else
  {
    [(SBViewControllerContextTransitioning *)self->_transitionContext completeTransition:[(SBHomeScreenIconTransitionAnimator *)self isCancelled] ^ 1];
  }
}

void *__57__SBHomeScreenIconTransitionAnimator_completeImmediately__block_invoke(uint64_t a1)
{
  uint64_t v2 = a1 + 32;
  result = *(void **)(a1 + 32);
  if (*(void *)(v2 + 8) == result[2])
  {
    unint64_t v3 = (void *)result[1];
    uint64_t v4 = [result isCancelled] ^ 1;
    return (void *)[v3 completeTransition:v4];
  }
  return result;
}

- (double)transitionDuration:(id)a3
{
  uint64_t v4 = [(SBHomeScreenIconTransitionAnimator *)self iconAnimator];
  double v5 = 0.0;
  if (([v4 invalidated] & 1) == 0)
  {
    unint64_t v6 = [(SBHomeScreenIconTransitionAnimator *)self currentSettings];
    v7 = [v6 centralAnimationSettings];
    [v7 duration];
    double v5 = v8;
  }
  return v5;
}

- (id)transitionAnimationFactory:(id)a3
{
  id v4 = a3;
  double v5 = [(SBHomeScreenIconTransitionAnimator *)self iconAnimator];
  if ([v5 invalidated])
  {
    unint64_t v6 = [MEMORY[0x1E4F4F898] factoryWithDuration:0.0];
    goto LABEL_19;
  }
  v7 = [(SBHomeScreenIconTransitionAnimator *)self currentSettings];
  double v8 = [v7 centralAnimationSettings];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [v7 crossfadeSettings];

    double v8 = (void *)v9;
  }
  id v10 = [v8 BSAnimationSettings];
  v11 = (void *)[v10 mutableCopy];

  char v12 = [v4 transitionWasCancelled];
  if ([(SBHomeScreenIconTransitionAnimator *)self operation] == 1) {
    char v13 = v12;
  }
  else {
    char v13 = 0;
  }
  double v14 = 0.0;
  if ((v13 & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_13;
    }
    [v7 appHeadStart];
    double v16 = v15;
    if (!BSFloatGreaterThanFloat()) {
      goto LABEL_13;
    }
    [v11 delay];
    double v14 = v16 + v17;
  }
  [v11 setDelay:v14];
LABEL_13:
  if ((v12 & 1) == 0 && ([v4 transitionWasRestarted] & 1) == 0)
  {
    [v11 delay];
    double v19 = v18;
    [(SBHomeScreenIconTransitionAnimator *)self initialDelay];
    [v11 setDelay:v19 + v20];
  }
  v21 = [MEMORY[0x1E4F4F898] factoryWithSettings:v11];
  unint64_t v6 = v21;
  if ((v13 & 1) == 0) {
    [v21 setAllowsAdditiveAnimations:1];
  }

LABEL_19:
  return v6;
}

- (void)animateTransition:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_transitionContext, a3);
  unint64_t v6 = [(SBHomeScreenIconTransitionAnimator *)self iconAnimator];
  int v7 = [v6 invalidated];
  if (!v6 || (v7 & 1) != 0)
  {
    if (v7) {
      [(SBHomeScreenIconTransitionAnimator *)self cancel];
    }
    else {
      [v5 completeTransition:1];
    }
  }
  else
  {
    unint64_t v8 = self->_transitionToken + 1;
    self->_transitionToken = v8;
    uint64_t v9 = [(SBHomeScreenIconTransitionAnimator *)self currentSettings];
    [v6 setSettings:v9];

    unint64_t v10 = [(SBHomeScreenIconTransitionAnimator *)self operation];
    double v11 = 0.0;
    double v12 = 0.0;
    if (([v5 transitionWasRestarted] & 1) == 0)
    {
      [v6 prepare];
      double v13 = 1.0;
      if (!v10) {
        double v13 = 0.0;
      }
      [v6 setFraction:v13];
      [(SBHomeScreenIconTransitionAnimator *)self initialDelay];
      double v12 = v14;
    }
    v15[1] = 3221225472;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[2] = __56__SBHomeScreenIconTransitionAnimator_animateTransition___block_invoke;
    v15[3] = &unk_1E6AB4968;
    if (!v10) {
      double v11 = 1.0;
    }
    unint64_t v17 = v8;
    v15[4] = self;
    id v16 = v5;
    [v6 animateToFraction:v15 afterDelay:v11 withCompletion:v12];
  }
}

uint64_t __56__SBHomeScreenIconTransitionAnimator_animateTransition___block_invoke(uint64_t result)
{
  if (*(void *)(result + 48) == *(void *)(*(void *)(result + 32) + 16)) {
    return [*(id *)(result + 40) completeTransition:1];
  }
  return result;
}

- (void)cancelTransition:(id)a3 withCompletionSpeed:(double)a4 completionCurve:(int64_t)a5
{
  id v6 = a3;
  int v7 = [(SBHomeScreenIconTransitionAnimator *)self iconAnimator];
  unint64_t v8 = v7;
  if (v7 && ([v7 invalidated] & 1) == 0)
  {
    unint64_t v9 = self->_transitionToken + 1;
    self->_transitionToken = v9;
    unint64_t v10 = [(SBHomeScreenIconTransitionAnimator *)self currentSettings];
    [v8 setSettings:v10];
    unint64_t v11 = [(SBHomeScreenIconTransitionAnimator *)self currentOperation];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __91__SBHomeScreenIconTransitionAnimator_cancelTransition_withCompletionSpeed_completionCurve___block_invoke;
    aBlock[3] = &unk_1E6AB4968;
    unint64_t v17 = v9;
    aBlock[4] = self;
    id v12 = v6;
    id v16 = v12;
    double v13 = _Block_copy(aBlock);
    if (([v12 wasPreviousPhaseInteractive] & 1) == 0)
    {
      double v14 = 0.0;
      if (!v11) {
        double v14 = 1.0;
      }
      [v8 animateToFraction:v13 afterDelay:v14 withCompletion:0.0];
    }
  }
  else
  {
    [v6 completeTransition:0];
  }
}

uint64_t __91__SBHomeScreenIconTransitionAnimator_cancelTransition_withCompletionSpeed_completionCurve___block_invoke(uint64_t result)
{
  if (*(void *)(result + 48) == *(void *)(*(void *)(result + 32) + 16)) {
    return [*(id *)(result + 40) completeTransition:0];
  }
  return result;
}

- (void)updateTransition:(id)a3 withPercentComplete:(double)a4
{
  id v11 = a3;
  id v6 = [(SBHomeScreenIconTransitionAnimator *)self iconAnimator];
  if ([v6 invalidated])
  {
    [(SBHomeScreenIconTransitionAnimator *)self cancel];
  }
  else
  {
    if (self->_needsTransitionTokenIncrementOnNextUpdate)
    {
      self->_needsTransitionTokenIncrementOnNextUpdate = 0;
      ++self->_transitionToken;
    }
    unint64_t v7 = [(SBHomeScreenIconTransitionAnimator *)self currentOperation];
    if (!self->_receivedFirstInteractiveUpdate)
    {
      self->_receivedFirstInteractiveUpdate = 1;
      objc_storeStrong((id *)&self->_transitionContext, a3);
      if (([v11 transitionWasRestarted] & 1) == 0)
      {
        unint64_t v8 = [(SBHomeScreenIconTransitionAnimator *)self currentSettings];
        [v6 setSettings:v8];

        [v6 prepare];
        double v9 = 1.0;
        if (!v7) {
          double v9 = 0.0;
        }
        [v6 setFraction:v9];
      }
    }
    if (v7)
    {
      unint64_t v10 = [v6 backgroundDarkeningView];
      [v10 setAlpha:1.0];
    }
  }
}

- (void)finishInteractiveTransition:(id)a3 withCompletionSpeed:(double)a4 completionCurve:(int64_t)a5
{
  id v6 = a3;
  unint64_t v7 = [(SBHomeScreenIconTransitionAnimator *)self iconAnimator];
  if ([v7 invalidated])
  {
    [(SBHomeScreenIconTransitionAnimator *)self cancel];
  }
  else
  {
    unint64_t v8 = self->_transitionToken + 1;
    self->_transitionToken = v8;
    double v9 = [(SBHomeScreenIconTransitionAnimator *)self currentSettings];
    [v7 setSettings:v9];

    unint64_t v10 = [(SBHomeScreenIconTransitionAnimator *)self operation];
    v12[1] = 3221225472;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[2] = __102__SBHomeScreenIconTransitionAnimator_finishInteractiveTransition_withCompletionSpeed_completionCurve___block_invoke;
    v12[3] = &unk_1E6AB4968;
    if (v10) {
      double v11 = 0.0;
    }
    else {
      double v11 = 1.0;
    }
    unint64_t v14 = v8;
    v12[4] = self;
    id v13 = v6;
    [v7 animateToFraction:v12 afterDelay:v11 withCompletion:0.0];
  }
}

uint64_t __102__SBHomeScreenIconTransitionAnimator_finishInteractiveTransition_withCompletionSpeed_completionCurve___block_invoke(uint64_t result)
{
  if (*(void *)(result + 48) == *(void *)(*(void *)(result + 32) + 16)) {
    return [*(id *)(result + 40) completeTransition:1];
  }
  return result;
}

- (double)percentComplete
{
  uint64_t v2 = [(SBHomeScreenIconTransitionAnimator *)self iconAnimator];
  [v2 fraction];
  double v4 = v3;

  return v4;
}

- (BOOL)supportsRestarting
{
  return 1;
}

- (void)animationEnded:(BOOL)a3
{
  id v5 = [(SBHomeScreenIconTransitionAnimator *)self iconAnimator];
  [v5 setDelegate:0];
  [v5 cleanup];
  transitionContext = self->_transitionContext;
  self->_transitionContext = 0;
}

- (void)iconAnimatorWasInvalidated:(id)a3
{
  ++self->_transitionToken;
  if ([(SBHomeScreenIconTransitionAnimator *)self isCancelled])
  {
    transitionContext = self->_transitionContext;
    [(SBViewControllerContextTransitioning *)transitionContext completeTransition:0];
  }
  else
  {
    [(SBHomeScreenIconTransitionAnimator *)self cancel];
  }
}

- (BOOL)iconAnimator:(id)a3 canAlterViewHierarchyDuringCleanupUsingBlock:(id)a4
{
  id v5 = a4;
  id v6 = [(SBHomeScreenIconTransitionAnimator *)self delegate];
  if (objc_opt_respondsToSelector()) {
    char v7 = [v6 animator:self canAlterViewHierarchyDuringCleanupUsingBlock:v5];
  }
  else {
    char v7 = 1;
  }

  return v7;
}

- (SBHIconAnimationSettings)currentSettings
{
  unint64_t currentOperation = self->_currentOperation;
  if (currentOperation != [(SBHomeScreenIconTransitionAnimator *)self currentOperation])
  {
    currentSettings = self->_currentSettings;
    self->_currentSettings = 0;
  }
  id v5 = self->_currentSettings;
  if (!v5)
  {
    id v6 = [(SBHomeScreenIconTransitionAnimator *)self delegate];
    if (v6)
    {
      unint64_t v7 = [(SBHomeScreenIconTransitionAnimator *)self currentOperation];
      self->_unint64_t currentOperation = v7;
      unint64_t v8 = [(SBHomeScreenIconTransitionAnimator *)self childViewController];
      double v9 = [v6 animator:self animationSettingsForOperation:v7 childViewController:v8];
      unint64_t v10 = self->_currentSettings;
      self->_currentSettings = v9;
    }
    id v5 = self->_currentSettings;
  }
  return v5;
}

- (SBIconAnimator)iconAnimator
{
  return self->_iconAnimator;
}

- (SBNestingViewController)childViewController
{
  return self->_childViewController;
}

- (unint64_t)operation
{
  return self->_operation;
}

- (double)initialDelay
{
  return self->_initialDelay;
}

- (void)setInitialDelay:(double)a3
{
  self->_initialDelay = a3;
}

- (SBHomeScreenIconTransitionAnimatorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBHomeScreenIconTransitionAnimatorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_childViewController, 0);
  objc_storeStrong((id *)&self->_iconAnimator, 0);
  objc_storeStrong((id *)&self->_currentSettings, 0);
  objc_storeStrong((id *)&self->_transitionContext, 0);
}

@end