@interface SBViewControllerTransitionContext
- (BOOL)_animatorIsInteractive;
- (BOOL)_animatorIsReversible;
- (BOOL)_animatorSupportsRestarting;
- (BOOL)_interactorSupportsRestarting;
- (BOOL)_objectSupportsRestarting:(id)a3;
- (BOOL)animateAlongsideTransition:(id)a3 completion:(id)a4;
- (BOOL)animateAlongsideTransitionInView:(id)a3 animation:(id)a4 completion:(id)a5;
- (BOOL)initiallyInteractive;
- (BOOL)isAnimated;
- (BOOL)isInteractive;
- (BOOL)isTransitioning;
- (BOOL)requiresCancellableAnimations;
- (BOOL)supportsRestarting;
- (BOOL)transitionWasCancelled;
- (BOOL)transitionWasRestarted;
- (BOOL)wantsAnimation;
- (BOOL)wasPreviousPhaseInteractive;
- (CGAffineTransform)targetTransform;
- (CGRect)finalFrameForViewController:(id)a3;
- (CGRect)initialFrameForViewController:(id)a3;
- (NSString)description;
- (SBViewControllerTransitionContext)init;
- (SBViewControllerTransitionContextDelegate)delegate;
- (UIView)containerView;
- (UIViewControllerAnimatedTransitioning)animator;
- (UIViewControllerInteractiveTransitioning)interactor;
- (double)completionVelocity;
- (double)percentComplete;
- (double)transitionDuration;
- (id)_acquireTransitionCompletion;
- (id)_interactiveAnimator;
- (id)_reversibleAnimator;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (id)transitionAnimationFactory;
- (id)userInfo;
- (id)viewControllerForKey:(id)a3;
- (id)viewForKey:(id)a3;
- (int64_t)completionCurve;
- (int64_t)presentationStyle;
- (unint64_t)transitionAnimationOptions;
- (void)_completeTransition;
- (void)_completeTransitionIfPossible;
- (void)_runAlongsideAnimationBlocksInEnclosingAnimationContext;
- (void)_runAlongsideAnimationBlocksWithFactory:(id)a3 options:(unint64_t)a4;
- (void)_runInteractionEndedHandlers;
- (void)_startInteractiveTransition;
- (void)_updateTransitionAnimationFactoryAndOptions;
- (void)addTransitionContinuation:(id)a3;
- (void)cancelInteractiveTransition;
- (void)cancelTransition;
- (void)completeTransition:(BOOL)a3;
- (void)dealloc;
- (void)finishInteractiveTransition;
- (void)notifyWhenInteractionEndsUsingBlock:(id)a3;
- (void)restartTransition;
- (void)setAnimator:(id)a3;
- (void)setContainerView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFinalFrame:(CGRect)a3 forViewController:(id)a4;
- (void)setInitialFrame:(CGRect)a3 forViewController:(id)a4;
- (void)setInteractor:(id)a3;
- (void)setPresentationStyle:(int64_t)a3;
- (void)setTargetTransform:(CGAffineTransform *)a3;
- (void)setUserInfo:(id)a3;
- (void)setView:(id)a3 forKey:(id)a4;
- (void)setViewController:(id)a3 forKey:(id)a4;
- (void)setWantsAnimation:(BOOL)a3;
- (void)startTransition;
- (void)updateInteractiveTransition:(double)a3;
@end

@implementation SBViewControllerTransitionContext

void __85__SBViewControllerTransitionContext__runAlongsideAnimationBlocksWithFactory_options___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v1 = *(id *)(*(void *)(a1 + 32) + 152);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v1);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v6 + 1) + 8 * v5) + 16))(*(void *)(*((void *)&v6 + 1) + 8 * v5));
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

- (BOOL)isTransitioning
{
  return self->_transitionStarted && !self->_transitionFinished;
}

- (BOOL)isInteractive
{
  return self->_interactor != 0;
}

- (SBViewControllerTransitionContext)init
{
  v25.receiver = self;
  v25.super_class = (Class)SBViewControllerTransitionContext;
  uint64_t v2 = [(SBViewControllerTransitionContext *)&v25 init];
  uint64_t v3 = v2;
  if (v2)
  {
    v2->_presentationStyle = -1;
    uint64_t v4 = MEMORY[0x1E4F1DAB8];
    long long v5 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v2->_targetTransform.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v2->_targetTransform.c = v5;
    *(_OWORD *)&v2->_targetTransform.tx = *(_OWORD *)(v4 + 32);
    long long v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    viewControllersByKey = v3->_viewControllersByKey;
    v3->_viewControllersByKey = v6;

    long long v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    viewsByKey = v3->_viewsByKey;
    v3->_viewsByKey = v8;

    uint64_t v10 = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:512 valueOptions:512 capacity:2];
    initialFramesByViewController = v3->_initialFramesByViewController;
    v3->_initialFramesByViewController = (NSMapTable *)v10;

    uint64_t v12 = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:512 valueOptions:512 capacity:2];
    finalFramesByViewController = v3->_finalFramesByViewController;
    v3->_finalFramesByViewController = (NSMapTable *)v12;

    uint64_t v14 = [MEMORY[0x1E4F1CA48] array];
    alongsideAnimations = v3->_alongsideAnimations;
    v3->_alongsideAnimations = (NSMutableArray *)v14;

    uint64_t v16 = [MEMORY[0x1E4F1CA48] array];
    alongsideCompletions = v3->_alongsideCompletions;
    v3->_alongsideCompletions = (NSMutableArray *)v16;

    uint64_t v18 = [MEMORY[0x1E4F1CA48] array];
    alongsideInteractionEndedHandlers = v3->_alongsideInteractionEndedHandlers;
    v3->_alongsideInteractionEndedHandlers = (NSMutableArray *)v18;

    uint64_t v20 = [MEMORY[0x1E4F1CA80] set];
    alongsideAnimationViews = v3->_alongsideAnimationViews;
    v3->_alongsideAnimationViews = (NSMutableSet *)v20;

    v3->_wantsAnimation = 1;
    uint64_t v22 = [MEMORY[0x1E4F1CA48] array];
    transitionContinuations = v3->_transitionContinuations;
    v3->_transitionContinuations = (NSMutableArray *)v22;
  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_transitionContinuations, 0);
  objc_storeStrong((id *)&self->_alongsideAnimationViews, 0);
  objc_storeStrong((id *)&self->_alongsideInteractionEndedHandlers, 0);
  objc_storeStrong((id *)&self->_alongsideCompletions, 0);
  objc_storeStrong((id *)&self->_alongsideAnimations, 0);
  objc_storeStrong((id *)&self->_interactor, 0);
  objc_storeStrong((id *)&self->_animator, 0);
  objc_storeStrong((id *)&self->_transitionAnimationFactory, 0);
  objc_storeStrong((id *)&self->_finalFramesByViewController, 0);
  objc_storeStrong((id *)&self->_initialFramesByViewController, 0);
  objc_storeStrong((id *)&self->_viewsByKey, 0);
  objc_storeStrong((id *)&self->_viewControllersByKey, 0);
}

- (void)completeTransition:(BOOL)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [(SBViewControllerTransitionContext *)self delegate];
  if (!self->_transitionDidBeginCalled && (objc_opt_respondsToSelector() & 1) != 0)
  {
    self->_transitionDidBeginCalled = 1;
    [v4 transitionDidBegin:self];
  }
  self->_animationFinished = 1;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v5 = self->_transitionContinuations;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * v9);
        uint64_t v11 = [(SBViewControllerTransitionContext *)self _acquireTransitionCompletion];
        (*(void (**)(uint64_t, SBViewControllerTransitionContext *, void *))(v10 + 16))(v10, self, v11);

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  [(SBViewControllerTransitionContext *)self _completeTransitionIfPossible];
}

- (void)_completeTransition
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = self;
  uint64_t v3 = [(SBViewControllerTransitionContext *)v2 delegate];
  if (objc_opt_respondsToSelector()) {
    [v3 transitionWillFinish:v2];
  }
  v2->_transitionFinished = 1;
  if (v2->_animator && (objc_opt_respondsToSelector() & 1) != 0) {
    [(UIViewControllerAnimatedTransitioning *)v2->_animator animationEnded:!v2->_transitionIsCancelled];
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = v2->_alongsideCompletions;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v12 + 1) + 8 * v8) + 16))(*(void *)(*((void *)&v12 + 1) + 8 * v8));
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  [(NSMutableArray *)v2->_alongsideAnimations removeAllObjects];
  [(NSMutableArray *)v2->_alongsideCompletions removeAllObjects];
  [(NSMutableArray *)v2->_alongsideInteractionEndedHandlers removeAllObjects];
  [(NSMutableSet *)v2->_alongsideAnimationViews removeAllObjects];
  [(NSMutableArray *)v2->_transitionContinuations removeAllObjects];
  if (objc_opt_respondsToSelector()) {
    [v3 transitionDidFinish:v2];
  }
  [(NSMutableDictionary *)v2->_viewControllersByKey removeAllObjects];
  [(NSMutableDictionary *)v2->_viewsByKey removeAllObjects];
  [(NSMapTable *)v2->_initialFramesByViewController removeAllObjects];
  [(NSMapTable *)v2->_finalFramesByViewController removeAllObjects];
  transitionAnimationFactory = v2->_transitionAnimationFactory;
  v2->_transitionAnimationFactory = 0;

  animator = v2->_animator;
  v2->_animator = 0;

  interactor = v2->_interactor;
  v2->_interactor = 0;

  v2->_transitionPercentComplete = 1.0;
  v2->_transitionAnimationOptions = 0;
}

- (void)startTransition
{
  uint64_t v2 = self;
  uint64_t v8 = v2;
  if (v2->_interactor)
  {
    [(SBViewControllerTransitionContext *)v2 _interactorSupportsRestarting];
    uint64_t v2 = v8;
  }
  uint64_t v3 = [(SBViewControllerTransitionContext *)v2 delegate];
  if (objc_opt_respondsToSelector()) {
    [v3 transitionWillBegin:v8];
  }
  v8->_transitionStarted = 1;
  if (!v8->_interactor)
  {
    if ([(SBViewControllerTransitionContext *)v8 isAnimated])
    {
      [(SBViewControllerTransitionContext *)v8 _updateTransitionAnimationFactoryAndOptions];
      uint64_t v6 = [(SBViewControllerTransitionContext *)v8 transitionAnimationFactory];
      [(SBViewControllerTransitionContext *)v8 _runAlongsideAnimationBlocksWithFactory:v6 options:[(SBViewControllerTransitionContext *)v8 transitionAnimationOptions]];
    }
    else
    {
      animator = v8->_animator;
      [(SBViewControllerTransitionContext *)v8 _runAlongsideAnimationBlocksInEnclosingAnimationContext];
      if (!animator)
      {
        int v5 = 1;
        goto LABEL_12;
      }
    }
    -[UIViewControllerAnimatedTransitioning animateTransition:](v8->_animator, "animateTransition:");
    int v5 = 0;
LABEL_12:
    uint64_t v4 = v8;
    goto LABEL_13;
  }
  [(SBViewControllerTransitionContext *)v8 _startInteractiveTransition];
  uint64_t v4 = v8;
  int v5 = 0;
LABEL_13:
  if (!v4->_transitionDidBeginCalled && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v8->_transitionDidBeginCalled = 1;
    objc_msgSend(v3, "transitionDidBegin:");
  }
  if (v5) {
    [(SBViewControllerTransitionContext *)v8 completeTransition:1];
  }
}

- (SBViewControllerTransitionContextDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBViewControllerTransitionContextDelegate *)WeakRetained;
}

- (id)transitionAnimationFactory
{
  return self->_transitionAnimationFactory;
}

- (BOOL)isAnimated
{
  return self->_animator && self->_wantsAnimation;
}

- (unint64_t)transitionAnimationOptions
{
  return self->_transitionAnimationOptions;
}

- (void)_updateTransitionAnimationFactoryAndOptions
{
  if (objc_opt_respondsToSelector())
  {
    [(UIViewControllerAnimatedTransitioning *)self->_animator transitionAnimationFactory:self];
  }
  else
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F4F898];
    [(SBViewControllerTransitionContext *)self transitionDuration];
    objc_msgSend(v4, "factoryWithDuration:");
  }
  uint64_t v3 = (BSUIAnimationFactory *)objc_claimAutoreleasedReturnValue();
  transitionAnimationFactory = self->_transitionAnimationFactory;
  self->_transitionAnimationFactory = v3;

  if (objc_opt_respondsToSelector()) {
    unint64_t v6 = [(UIViewControllerAnimatedTransitioning *)self->_animator transitionAnimationOptions:self];
  }
  else {
    unint64_t v6 = 0;
  }
  self->_transitionAnimationOptions = v6;
}

- (void)_runAlongsideAnimationBlocksWithFactory:(id)a3 options:(unint64_t)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __85__SBViewControllerTransitionContext__runAlongsideAnimationBlocksWithFactory_options___block_invoke;
  v4[3] = &unk_1E6AAC810;
  v4[4] = self;
  [MEMORY[0x1E4F4F898] animateWithFactory:a3 options:a4 actions:v4];
}

- (void)_completeTransitionIfPossible
{
  if (self->_animationFinished && !self->_outstandingClientCompletionCount) {
    [(SBViewControllerTransitionContext *)self _completeTransition];
  }
}

- (BOOL)animateAlongsideTransition:(id)a3 completion:(id)a4
{
  unint64_t v6 = (unint64_t)a3;
  unint64_t v7 = (unint64_t)a4;
  if (v6 | v7)
  {
    if (v6)
    {
      alongsideAnimations = self->_alongsideAnimations;
      uint64_t v9 = (void *)[(id)v6 copy];
      uint64_t v10 = _Block_copy(v9);
      [(NSMutableArray *)alongsideAnimations addObject:v10];
    }
    if (v7)
    {
      alongsideCompletions = self->_alongsideCompletions;
      long long v12 = (void *)[(id)v7 copy];
      long long v13 = _Block_copy(v12);
      [(NSMutableArray *)alongsideCompletions addObject:v13];
    }
  }

  return (v6 | v7) != 0;
}

- (void)_runAlongsideAnimationBlocksInEnclosingAnimationContext
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v2 = self->_alongsideAnimations;
  uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v7 + 1) + 8 * v6) + 16))(*(void *)(*((void *)&v7 + 1) + 8 * v6));
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (BOOL)transitionWasRestarted
{
  return ![(SBViewControllerTransitionContext *)self transitionWasCancelled]
      && self->_transitionWasEverCancelled;
}

- (BOOL)transitionWasCancelled
{
  return self->_transitionIsCancelled;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)SBViewControllerTransitionContext;
  [(SBViewControllerTransitionContext *)&v2 dealloc];
}

- (void)setAnimator:(id)a3
{
}

- (void)setViewController:(id)a3 forKey:(id)a4
{
}

- (void)setInitialFrame:(CGRect)a3 forViewController:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  initialFramesByViewController = self->_initialFramesByViewController;
  long long v9 = (void *)MEMORY[0x1E4F29238];
  id v10 = a4;
  objc_msgSend(v9, "valueWithCGRect:", x, y, width, height);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  [(NSMapTable *)initialFramesByViewController setObject:v11 forKey:v10];
}

- (void)setFinalFrame:(CGRect)a3 forViewController:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  finalFramesByViewController = self->_finalFramesByViewController;
  long long v9 = (void *)MEMORY[0x1E4F29238];
  id v10 = a4;
  objc_msgSend(v9, "valueWithCGRect:", x, y, width, height);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  [(NSMapTable *)finalFramesByViewController setObject:v11 forKey:v10];
}

- (CGRect)finalFrameForViewController:(id)a3
{
  uint64_t v3 = [(NSMapTable *)self->_finalFramesByViewController objectForKey:a3];
  [v3 CGRectValue];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.double height = v15;
  result.size.double width = v14;
  result.origin.double y = v13;
  result.origin.double x = v12;
  return result;
}

- (void)setWantsAnimation:(BOOL)a3
{
  self->_wantsAnimation = a3;
}

- (void)setView:(id)a3 forKey:(id)a4
{
}

- (void)setInteractor:(id)a3
{
}

- (void)setContainerView:(id)a3
{
}

- (void)setDelegate:(id)a3
{
}

- (UIViewControllerAnimatedTransitioning)animator
{
  return self->_animator;
}

- (UIViewControllerInteractiveTransitioning)interactor
{
  return self->_interactor;
}

- (void)updateInteractiveTransition:(double)a3
{
  id v5 = [(SBViewControllerTransitionContext *)self _interactiveAnimator];
  self->_transitionPercentComplete = a3;
  [(SBViewControllerTransitionContext *)self _runAlongsideAnimationBlocksInEnclosingAnimationContext];
  [v5 updateTransition:self withPercentComplete:a3];
}

- (void)finishInteractiveTransition
{
  self->_transitionWasInteractive = 1;
  id v8 = [(SBViewControllerTransitionContext *)self _interactiveAnimator];
  [(SBViewControllerTransitionContext *)self completionVelocity];
  double v4 = v3;
  int64_t v5 = [(SBViewControllerTransitionContext *)self completionCurve];
  interactor = self->_interactor;
  self->_interactor = 0;

  [(SBViewControllerTransitionContext *)self _runInteractionEndedHandlers];
  [(SBViewControllerTransitionContext *)self _updateTransitionAnimationFactoryAndOptions];
  double v7 = [(SBViewControllerTransitionContext *)self transitionAnimationFactory];
  [(SBViewControllerTransitionContext *)self _runAlongsideAnimationBlocksWithFactory:v7 options:[(SBViewControllerTransitionContext *)self transitionAnimationOptions]];

  [v8 finishInteractiveTransition:self withCompletionSpeed:v5 completionCurve:v4];
}

- (void)cancelInteractiveTransition
{
  id v3 = [(SBViewControllerTransitionContext *)self _interactiveAnimator];
  [(SBViewControllerTransitionContext *)self cancelTransition];
}

- (id)viewControllerForKey:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_viewControllersByKey objectForKey:a3];
}

- (id)viewForKey:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_viewsByKey objectForKey:a3];
}

- (CGRect)initialFrameForViewController:(id)a3
{
  id v3 = [(NSMapTable *)self->_initialFramesByViewController objectForKey:a3];
  [v3 CGRectValue];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.double height = v15;
  result.size.double width = v14;
  result.origin.double y = v13;
  result.origin.double x = v12;
  return result;
}

- (void)cancelTransition
{
  self->_transitionWasInteractive = [(SBViewControllerTransitionContext *)self isInteractive];
  id v9 = [(SBViewControllerTransitionContext *)self _reversibleAnimator];
  id v3 = [(SBViewControllerTransitionContext *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v3 transitionWillReverse:self];
  }
  [(SBViewControllerTransitionContext *)self completionVelocity];
  double v5 = v4;
  int64_t v6 = [(SBViewControllerTransitionContext *)self completionCurve];
  self->_animationFinished = 0;
  *(_WORD *)&self->_transitionIsCancelled = 257;
  interactor = self->_interactor;
  self->_interactor = 0;

  if (self->_transitionWasInteractive) {
    [(SBViewControllerTransitionContext *)self _runInteractionEndedHandlers];
  }
  if (objc_opt_respondsToSelector()) {
    [v3 transitionDidReverse:self];
  }
  if ([(SBViewControllerTransitionContext *)self isAnimated])
  {
    [(SBViewControllerTransitionContext *)self _updateTransitionAnimationFactoryAndOptions];
    double v8 = [(SBViewControllerTransitionContext *)self transitionAnimationFactory];
    [(SBViewControllerTransitionContext *)self _runAlongsideAnimationBlocksWithFactory:v8 options:[(SBViewControllerTransitionContext *)self transitionAnimationOptions]];
  }
  else
  {
    [(SBViewControllerTransitionContext *)self _runAlongsideAnimationBlocksInEnclosingAnimationContext];
  }
  [v9 cancelTransition:self withCompletionSpeed:v6 completionCurve:v5];
}

- (BOOL)supportsRestarting
{
  BOOL v3 = [(SBViewControllerTransitionContext *)self _animatorSupportsRestarting];
  if (v3)
  {
    if (self->_interactor)
    {
      LOBYTE(v3) = [(SBViewControllerTransitionContext *)self _interactorSupportsRestarting];
    }
    else
    {
      LOBYTE(v3) = 1;
    }
  }
  return v3;
}

- (void)restartTransition
{
  id v6 = [(SBViewControllerTransitionContext *)self _reversibleAnimator];
  BOOL v3 = [(SBViewControllerTransitionContext *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v3 transitionWillReverse:self];
  }
  self->_animationFinished = 0;
  self->_transitionIsCancelled = 0;
  self->_transitionWasInteractive = 0;
  if (objc_opt_respondsToSelector()) {
    [v3 transitionDidReverse:self];
  }
  if (self->_interactor)
  {
    double v4 = [(SBViewControllerTransitionContext *)self _interactiveAnimator];
    [v4 percentComplete];
    self->_transitionBeganInteractiveldouble y = 1;
    -[SBViewControllerTransitionContext updateInteractiveTransition:](self, "updateInteractiveTransition:");
    [(UIViewControllerInteractiveTransitioning *)self->_interactor startInteractiveTransition:self];
  }
  else
  {
    self->_transitionBeganInteractiveldouble y = 0;
    if ([(SBViewControllerTransitionContext *)self isAnimated])
    {
      [(SBViewControllerTransitionContext *)self _updateTransitionAnimationFactoryAndOptions];
      double v5 = [(SBViewControllerTransitionContext *)self transitionAnimationFactory];
      [(SBViewControllerTransitionContext *)self _runAlongsideAnimationBlocksWithFactory:v5 options:[(SBViewControllerTransitionContext *)self transitionAnimationOptions]];
    }
    else
    {
      [(SBViewControllerTransitionContext *)self _runAlongsideAnimationBlocksInEnclosingAnimationContext];
    }
    [v6 animateTransition:self];
  }
}

- (BOOL)initiallyInteractive
{
  return self->_transitionBeganInteractively;
}

- (BOOL)wasPreviousPhaseInteractive
{
  return self->_transitionWasInteractive;
}

- (double)transitionDuration
{
  [(UIViewControllerAnimatedTransitioning *)self->_animator transitionDuration:self];
  return result;
}

- (double)percentComplete
{
  return self->_transitionPercentComplete;
}

- (double)completionVelocity
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 1.0;
  }
  interactor = self->_interactor;
  [(UIViewControllerInteractiveTransitioning *)interactor completionSpeed];
  return result;
}

- (int64_t)completionCurve
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  interactor = self->_interactor;
  return [(UIViewControllerInteractiveTransitioning *)interactor completionCurve];
}

- (BOOL)animateAlongsideTransitionInView:(id)a3 animation:(id)a4 completion:(id)a5
{
  id v8 = a3;
  BOOL v9 = [(SBViewControllerTransitionContext *)self animateAlongsideTransition:a4 completion:a5];
  if (v9)
  {
    id v10 = [(SBViewControllerTransitionContext *)self containerView];

    if (v10 != v8) {
      [(NSMutableSet *)self->_alongsideAnimationViews addObject:v8];
    }
  }

  return v9;
}

- (void)notifyWhenInteractionEndsUsingBlock:(id)a3
{
  alongsideInteractionEndedHandlers = self->_alongsideInteractionEndedHandlers;
  id v5 = (id)[a3 copy];
  double v4 = _Block_copy(v5);
  [(NSMutableArray *)alongsideInteractionEndedHandlers addObject:v4];
}

- (BOOL)requiresCancellableAnimations
{
  if ([(SBViewControllerTransitionContext *)self initiallyInteractive]) {
    return 1;
  }
  return [(SBViewControllerTransitionContext *)self _animatorIsReversible];
}

- (void)addTransitionContinuation:(id)a3
{
  transitionContinuations = self->_transitionContinuations;
  id v5 = (id)[a3 copy];
  double v4 = _Block_copy(v5);
  [(NSMutableArray *)transitionContinuations addObject:v4];
}

- (id)_acquireTransitionCompletion
{
  ++self->_outstandingClientCompletionCount;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __65__SBViewControllerTransitionContext__acquireTransitionCompletion__block_invoke;
  aBlock[3] = &unk_1E6AAC810;
  aBlock[4] = self;
  objc_super v2 = _Block_copy(aBlock);
  BOOL v3 = _Block_copy(v2);

  return v3;
}

uint64_t __65__SBViewControllerTransitionContext__acquireTransitionCompletion__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _completeTransitionIfPossible];
}

- (BOOL)_animatorIsReversible
{
  return objc_opt_respondsToSelector() & 1;
}

- (id)_reversibleAnimator
{
  if ([(SBViewControllerTransitionContext *)self _animatorIsReversible]) {
    BOOL v3 = self->_animator;
  }
  else {
    BOOL v3 = 0;
  }
  return v3;
}

- (BOOL)_animatorSupportsRestarting
{
  BOOL v3 = [(SBViewControllerTransitionContext *)self _animatorIsReversible];
  if (v3)
  {
    animator = self->_animator;
    LOBYTE(v3) = [(SBViewControllerTransitionContext *)self _objectSupportsRestarting:animator];
  }
  return v3;
}

- (BOOL)_interactorSupportsRestarting
{
  return [(SBViewControllerTransitionContext *)self _objectSupportsRestarting:self->_interactor];
}

- (BOOL)_objectSupportsRestarting:(id)a3
{
  id v3 = a3;
  if (objc_opt_respondsToSelector()) {
    char v4 = [v3 supportsRestarting];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (BOOL)_animatorIsInteractive
{
  int v2 = [(SBViewControllerTransitionContext *)self _animatorIsReversible];
  if (v2) {
    LOBYTE(v2) = objc_opt_respondsToSelector();
  }
  return v2 & 1;
}

- (id)_interactiveAnimator
{
  if ([(SBViewControllerTransitionContext *)self _animatorIsInteractive]) {
    id v3 = self->_animator;
  }
  else {
    id v3 = 0;
  }
  return v3;
}

- (void)_startInteractiveTransition
{
  self->_transitionBeganInteractiveldouble y = 1;
  [(UIViewControllerInteractiveTransitioning *)self->_interactor startInteractiveTransition:self];
}

- (void)_runInteractionEndedHandlers
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  int v2 = self->_alongsideInteractionEndedHandlers;
  uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v7 + 1) + 8 * v6) + 16))(*(void *)(*((void *)&v7 + 1) + 8 * v6));
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (NSString)description
{
  return (NSString *)[(SBViewControllerTransitionContext *)self descriptionWithMultilinePrefix:@"\t"];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  uint64_t v3 = [(SBViewControllerTransitionContext *)self descriptionBuilderWithMultilinePrefix:a3];
  uint64_t v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v6 = (id)objc_msgSend(v5, "appendBool:withName:", -[SBViewControllerTransitionContext isInteractive](self, "isInteractive"), @"isInteractive");
  id v7 = (id)objc_msgSend(v5, "appendBool:withName:", -[SBViewControllerTransitionContext isInterruptible](self, "isInterruptible"), @"isInterruptible");
  id v8 = (id)objc_msgSend(v5, "appendBool:withName:", -[SBViewControllerTransitionContext isAnimated](self, "isAnimated"), @"isAnimated");
  id v9 = (id)objc_msgSend(v5, "appendBool:withName:", -[SBViewControllerTransitionContext supportsRestarting](self, "supportsRestarting"), @"supportsRestarting");
  id v10 = (id)objc_msgSend(v5, "appendBool:withName:", -[SBViewControllerTransitionContext wantsAnimation](self, "wantsAnimation"), @"wantsAnimation");
  id v11 = (id)objc_msgSend(v5, "appendBool:withName:", -[SBViewControllerTransitionContext isCancelled](self, "isCancelled"), @"isCancelled");
  id v12 = (id)objc_msgSend(v5, "appendBool:withName:", -[SBViewControllerTransitionContext isTransitioning](self, "isTransitioning"), @"isTransitioning");
  [(SBViewControllerTransitionContext *)self percentComplete];
  id v13 = (id)objc_msgSend(v5, "appendFloat:withName:", @"percentComplete");
  double v14 = [(SBViewControllerTransitionContext *)self containerView];
  id v15 = (id)[v5 appendPointer:v14 withName:@"containerView"];

  uint64_t v16 = [(SBViewControllerTransitionContext *)self delegate];
  id v17 = (id)[v5 appendPointer:v16 withName:@"delegate"];

  uint64_t v18 = [(SBViewControllerTransitionContext *)self viewControllerForKey:*MEMORY[0x1E4FB30B8]];
  if (v18)
  {
  }
  else
  {
    v19 = [(SBViewControllerTransitionContext *)self viewControllerForKey:*MEMORY[0x1E4FB30C8]];

    if (!v19) {
      goto LABEL_5;
    }
  }
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __75__SBViewControllerTransitionContext_descriptionBuilderWithMultilinePrefix___block_invoke;
  v21[3] = &unk_1E6AACDE0;
  v21[4] = self;
  id v22 = v5;
  id v23 = v4;
  [v22 appendBodySectionWithName:@"ViewControllers" multilinePrefix:v23 block:v21];

LABEL_5:
  return v5;
}

void __75__SBViewControllerTransitionContext_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  uint64_t v2 = *MEMORY[0x1E4FB30B8];
  uint64_t v3 = [*(id *)(a1 + 32) viewControllerForKey:*MEMORY[0x1E4FB30B8]];

  if (v3)
  {
    id v4 = *(void **)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __75__SBViewControllerTransitionContext_descriptionBuilderWithMultilinePrefix___block_invoke_2;
    v12[3] = &unk_1E6AACA90;
    v12[4] = *(void *)(a1 + 32);
    id v13 = v4;
    [v13 appendBodySectionWithName:v2 multilinePrefix:v5 block:v12];
  }
  uint64_t v6 = *MEMORY[0x1E4FB30C8];
  id v7 = [*(id *)(a1 + 32) viewControllerForKey:*MEMORY[0x1E4FB30C8]];

  if (v7)
  {
    id v8 = *(void **)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 48);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __75__SBViewControllerTransitionContext_descriptionBuilderWithMultilinePrefix___block_invoke_3;
    v10[3] = &unk_1E6AACA90;
    v10[4] = *(void *)(a1 + 32);
    id v11 = v8;
    [v11 appendBodySectionWithName:v6 multilinePrefix:v9 block:v10];
  }
}

void __75__SBViewControllerTransitionContext_descriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *MEMORY[0x1E4FB30B8];
  id v8 = [*(id *)(a1 + 32) viewControllerForKey:*MEMORY[0x1E4FB30B8]];
  id v3 = (id)[*(id *)(a1 + 40) appendPointer:v8 withName:v2];
  id v4 = *(void **)(a1 + 40);
  [*(id *)(a1 + 32) initialFrameForViewController:v8];
  id v5 = (id)objc_msgSend(v4, "appendRect:withName:", @"initialFrameForViewController");
  uint64_t v6 = *(void **)(a1 + 40);
  [*(id *)(a1 + 32) finalFrameForViewController:v8];
  id v7 = (id)objc_msgSend(v6, "appendRect:withName:", @"finalFrameForViewController");
}

void __75__SBViewControllerTransitionContext_descriptionBuilderWithMultilinePrefix___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *MEMORY[0x1E4FB30C8];
  id v8 = [*(id *)(a1 + 32) viewControllerForKey:*MEMORY[0x1E4FB30C8]];
  id v3 = (id)[*(id *)(a1 + 40) appendPointer:v8 withName:v2];
  id v4 = *(void **)(a1 + 40);
  [*(id *)(a1 + 32) initialFrameForViewController:v8];
  id v5 = (id)objc_msgSend(v4, "appendRect:withName:", @"initialFrameForViewController");
  uint64_t v6 = *(void **)(a1 + 40);
  [*(id *)(a1 + 32) finalFrameForViewController:v8];
  id v7 = (id)objc_msgSend(v6, "appendRect:withName:", @"finalFrameForViewController");
}

- (id)succinctDescription
{
  uint64_t v2 = [(SBViewControllerTransitionContext *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (int64_t)presentationStyle
{
  return self->_presentationStyle;
}

- (void)setPresentationStyle:(int64_t)a3
{
  self->_presentationStyle = a3;
}

- (CGAffineTransform)targetTransform
{
  long long v3 = *(_OWORD *)&self->tx;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self->c;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&self[1].a;
  return self;
}

- (void)setTargetTransform:(CGAffineTransform *)a3
{
  long long v3 = *(_OWORD *)&a3->a;
  long long v4 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_targetTransform.c = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_targetTransform.tdouble x = v4;
  *(_OWORD *)&self->_targetTransform.a = v3;
}

- (UIView)containerView
{
  return self->_containerView;
}

- (BOOL)wantsAnimation
{
  return self->_wantsAnimation;
}

- (id)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
}

@end