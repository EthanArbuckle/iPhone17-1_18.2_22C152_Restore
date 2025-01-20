@interface _UIViewControllerTransitionContext
+ (id)_associatedTransitionContextForAnimationController:(id)a3;
+ (id)_associatedTransitionContextsForInteractionController:(id)a3;
- (BOOL)_allowUserInteraction;
- (BOOL)_initiallyInteractive;
- (BOOL)_isPerformingLayoutToLayoutTransition;
- (BOOL)_isPresentation;
- (BOOL)_isRotating;
- (BOOL)_needsBottomBarCrossfade;
- (BOOL)_ranAlongsideAnimations;
- (BOOL)_transitionHasCompleted;
- (BOOL)_transitionIsCompleting;
- (BOOL)_transitionIsInFlight;
- (BOOL)_transitioningBottomBarIsTabBar;
- (BOOL)isAnimated;
- (BOOL)isCurrentlyInteractive;
- (BOOL)isInterruptible;
- (BOOL)transitionWasCancelled;
- (CGAffineTransform)_affineTransform;
- (CGRect)finalFrameForViewController:(id)a3;
- (CGRect)initialFrameForViewController:(id)a3;
- (NSArray)_containerViews;
- (UIView)containerView;
- (UIViewControllerAnimatedTransitioning)_animator;
- (UIViewControllerInteractiveTransitioning)_interactor;
- (_UIViewControllerTransitionContext)init;
- (_UIViewControllerTransitionCoordinator)_auxContext;
- (double)_completionVelocity;
- (double)_duration;
- (double)_percentOffset;
- (double)_previousPercentComplete;
- (id)_completionHandler;
- (id)_didCompleteHandler;
- (id)_interactiveUpdateHandler;
- (id)_postInteractiveCompletionHandler;
- (id)_transitionCoordinator;
- (id)_willCompleteHandler;
- (id)viewControllerForKey:(id)a3;
- (id)viewForKey:(id)a3;
- (int64_t)_alongsideAnimationsCount;
- (int64_t)_completionCurve;
- (int64_t)_state;
- (int64_t)presentationStyle;
- (void)__runAlongsideAnimations;
- (void)_disableInteractionForViews:(id)a3;
- (void)_enableInteractionForDisabledViews;
- (void)_interactivityDidChange:(BOOL)a3;
- (void)_runAlongsideCompletions;
- (void)_runInvalidationHandlers;
- (void)_setAllowUserInteraction:(BOOL)a3;
- (void)_setAnimator:(id)a3;
- (void)_setAuxContext:(id)a3;
- (void)_setCompletionCurve:(int64_t)a3;
- (void)_setCompletionHandler:(id)a3;
- (void)_setCompletionVelocity:(double)a3;
- (void)_setContainerView:(id)a3;
- (void)_setContainerViews:(id)a3;
- (void)_setCurrentlyInteractive:(BOOL)a3;
- (void)_setDidCompleteHandler:(id)a3;
- (void)_setDuration:(double)a3;
- (void)_setInitiallyInteractive:(BOOL)a3;
- (void)_setInteractiveUpdateHandler:(id)a3;
- (void)_setInteractor:(id)a3;
- (void)_setInterruptible:(BOOL)a3;
- (void)_setIsAnimated:(BOOL)a3;
- (void)_setIsPresentation:(BOOL)a3;
- (void)_setNeedsBottomBarCrossfade:(BOOL)a3;
- (void)_setPercentOffset:(double)a3;
- (void)_setPerformingLayoutToLayoutTransition:(BOOL)a3;
- (void)_setPostInteractiveCompletionHandler:(id)a3;
- (void)_setPresentationStyle:(int64_t)a3;
- (void)_setPreviousPercentComplete:(double)a3;
- (void)_setRotating:(BOOL)a3;
- (void)_setState:(int64_t)a3;
- (void)_setTransitionIsCompleting:(BOOL)a3;
- (void)_setTransitionIsInFlight:(BOOL)a3;
- (void)_setTransitioningBottomBarIsTabBar:(BOOL)a3;
- (void)_setWillCompleteHandler:(id)a3;
- (void)_stopInteractiveTransition;
- (void)_updateInteractiveTransitionWithoutTrackingPercentComplete:(double)a3;
- (void)cancelInteractiveTransition;
- (void)completeTransition:(BOOL)a3;
- (void)dealloc;
- (void)finishInteractiveTransition;
- (void)pauseInteractiveTransition;
- (void)setTransitionWasCancelled:(BOOL)a3;
- (void)updateInteractiveTransition:(double)a3;
@end

@implementation _UIViewControllerTransitionContext

- (void)_setInteractor:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->__interactor);

  v5 = obj;
  if (WeakRetained != obj)
  {
    id v6 = objc_loadWeakRetained((id *)&self->__interactor);

    if (v6)
    {
      id v7 = objc_loadWeakRetained((id *)&self->__interactor);
      v8 = objc_getAssociatedObject(v7, &_UIInteractionControllerAssociatedTransitionContextsKey);

      [v8 removeObject:self];
    }
    objc_storeWeak((id *)&self->__interactor, obj);
    v5 = obj;
    if (obj)
    {
      *(unsigned char *)&self->_transitionContextFlags = *(unsigned char *)&self->_transitionContextFlags & 0xFE | objc_opt_respondsToSelector() & 1;
      if (objc_opt_respondsToSelector()) {
        char v9 = 2;
      }
      else {
        char v9 = 0;
      }
      *(unsigned char *)&self->_transitionContextFlags = *(unsigned char *)&self->_transitionContextFlags & 0xFD | v9;
      if (objc_opt_respondsToSelector()) {
        uint64_t v10 = [obj wantsInteractiveStart];
      }
      else {
        uint64_t v10 = 1;
      }
      [(_UIViewControllerTransitionContext *)self _setInitiallyInteractive:v10];
      [(_UIViewControllerTransitionContext *)self _setCurrentlyInteractive:v10];
      objc_getAssociatedObject(obj, &_UIInteractionControllerAssociatedTransitionContextsKey);
      id v11 = (id)objc_claimAutoreleasedReturnValue();
      if (!v11)
      {
        id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        objc_setAssociatedObject(obj, &_UIInteractionControllerAssociatedTransitionContextsKey, v11, (void *)1);
      }
      [v11 addObject:self];

      v5 = obj;
    }
  }
}

- (void)dealloc
{
  [(_UIViewControllerTransitionContext *)self _enableInteractionForDisabledViews];
  [(_UIViewControllerTransitionContext *)self _runInvalidationHandlers];
  v3.receiver = self;
  v3.super_class = (Class)_UIViewControllerTransitionContext;
  [(_UIViewControllerTransitionContext *)&v3 dealloc];
}

- (void)_enableInteractionForDisabledViews
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  objc_super v3 = self->_disabledViews;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v7++), "setUserInteractionEnabled:", 1, (void)v9);
      }
      while (v5 != v7);
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  disabledViews = self->_disabledViews;
  self->_disabledViews = 0;
}

- (void)completeTransition:(BOOL)a3
{
  if ((*(unsigned char *)&self->_transitionContextFlags & 0x20) == 0)
  {
    BOOL v3 = a3;
    *(unsigned char *)&self->_transitionContextFlags |= 0x20u;
    _UIQOSExcludeCommitFromGlitchTrackingIfUnmanaged();
    long long v12 = self;
    uint64_t v5 = [(_UIViewControllerTransitionContext *)v12 _animator];
    [(_UIViewControllerTransitionContext *)v12 _runInvalidationHandlers];
    if (objc_opt_respondsToSelector()) {
      [v5 _animationWillEnd:v12 didComplete:v3];
    }
    uint64_t v6 = v12;
    id willCompleteHandler = v12->__willCompleteHandler;
    if (willCompleteHandler)
    {
      v8 = (void (**)(void *, _UIViewControllerTransitionContext *, BOOL))_Block_copy(willCompleteHandler);
      v8[2](v8, v12, v3);

      uint64_t v6 = v12;
    }
    completionHandler = (void (**)(id, _UIViewControllerTransitionContext *, BOOL))v6->__completionHandler;
    if (completionHandler)
    {
      completionHandler[2](completionHandler, v12, v3);
      uint64_t v6 = v12;
    }
    [(_UIViewControllerTransitionContext *)v6 _runAlongsideCompletions];
    didCompleteHandler = (void (**)(id, _UIViewControllerTransitionContext *, BOOL))v12->__didCompleteHandler;
    if (didCompleteHandler) {
      didCompleteHandler[2](didCompleteHandler, v12, v3);
    }
    if (v5 && (objc_opt_respondsToSelector() & 1) != 0) {
      [v5 animationEnded:v3];
    }
    id v11 = self;
  }
}

- (void)_setAnimator:(id)a3
{
  id obj = a3;
  id v4 = [(_UIViewControllerTransitionContext *)self _animator];
  if (v4 != obj)
  {
    objc_storeWeak((id *)&self->__animator, obj);
    if (v4)
    {
      uint64_t v5 = +[_UIViewControllerTransitionContext _associatedTransitionContextForAnimationController:v4];
      if (v5 == self) {
        objc_setAssociatedObject(v4, &_UIAnimationControllerAssociatedTransitionContextKey, 0, (void *)1);
      }
    }
    if (obj) {
      objc_setAssociatedObject(obj, &_UIAnimationControllerAssociatedTransitionContextKey, self, (void *)1);
    }
  }
}

- (UIViewControllerAnimatedTransitioning)_animator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__animator);
  return (UIViewControllerAnimatedTransitioning *)WeakRetained;
}

- (void)_runInvalidationHandlers
{
  auxContext = self->__auxContext;
  if (auxContext)
  {
    id v4 = [(_UIViewControllerTransitionCoordinator *)self->__auxContext _invalidationHandlers];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __62___UIViewControllerTransitionContext__runInvalidationHandlers__block_invoke;
    v5[3] = &unk_1E52D9F70;
    v5[4] = self;
    [(_UIViewControllerTransitionCoordinator *)auxContext _applyVoidBlocks:v4 releaseBlocks:v5];
  }
}

- (void)_runAlongsideCompletions
{
  auxContext = self->__auxContext;
  if (auxContext)
  {
    id v4 = [(_UIViewControllerTransitionCoordinator *)self->__auxContext _alongsideCompletions];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __62___UIViewControllerTransitionContext__runAlongsideCompletions__block_invoke;
    v5[3] = &unk_1E52D9F70;
    v5[4] = self;
    [(_UIViewControllerTransitionCoordinator *)auxContext _applyBlocks:v4 releaseBlocks:v5];

    [(_UIViewControllerTransitionCoordinator *)self->__auxContext _setInteractiveChangeHandlers:0];
  }
}

+ (id)_associatedTransitionContextForAnimationController:(id)a3
{
  return objc_getAssociatedObject(a3, &_UIAnimationControllerAssociatedTransitionContextKey);
}

- (void)__runAlongsideAnimations
{
  _UIQOSExcludeCommitFromGlitchTrackingIfUnmanaged();
  auxContext = self->__auxContext;
  if (auxContext)
  {
    id v4 = [(_UIViewControllerTransitionCoordinator *)self->__auxContext _systemAlongsideAnimations];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __62___UIViewControllerTransitionContext___runAlongsideAnimations__block_invoke;
    v11[3] = &unk_1E52D9F70;
    v11[4] = self;
    [(_UIViewControllerTransitionCoordinator *)auxContext _applyBlocks:v4 releaseBlocks:v11];

    char v5 = 0;
    uint64_t v6 = 0;
    do
    {
      uint64_t v7 = v6;
      char v8 = v5;
      uint64_t v6 = [(_UIViewControllerTransitionCoordinator *)self->__auxContext _alongsideAnimations];

      if (!v6) {
        break;
      }
      long long v9 = self->__auxContext;
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __62___UIViewControllerTransitionContext___runAlongsideAnimations__block_invoke_2;
      v10[3] = &unk_1E52D9F70;
      v10[4] = self;
      [(_UIViewControllerTransitionCoordinator *)v9 _applyBlocks:v6 releaseBlocks:v10];
      char v5 = 1;
    }
    while ((v8 & 1) == 0);
    [(_UIViewControllerTransitionCoordinator *)self->__auxContext _setAlongsideAnimations:0];
  }
  *(unsigned char *)&self->_transitionContextFlags |= 4u;
}

- (void)_setState:(int64_t)a3
{
  self->__state = a3;
}

- (id)_postInteractiveCompletionHandler
{
  return self->__postInteractiveCompletionHandler;
}

- (BOOL)_transitionIsInFlight
{
  return [(_UIViewControllerTransitionContext *)self _state] == 1;
}

- (id)_transitionCoordinator
{
  auxContext = self->__auxContext;
  if (auxContext) {
    BOOL v3 = auxContext;
  }
  else {
    BOOL v3 = [[_UIViewControllerTransitionCoordinator alloc] initWithMainContext:self];
  }
  return v3;
}

- (void)_setAuxContext:(id)a3
{
}

- (_UIViewControllerTransitionCoordinator)_auxContext
{
  return self->__auxContext;
}

- (void)_setContainerView:(id)a3
{
}

- (_UIViewControllerTransitionContext)init
{
  self->_previousPercentComplete = 0.0;
  self->__completionVelocity = 1.0;
  self->__completionCurve = 0;
  self->_presentationStyle = -1;
  *(unsigned char *)&self->_transitionContextFlags |= 0x10u;
  self->__allowUserInteraction = 0;
  v3.receiver = self;
  v3.super_class = (Class)_UIViewControllerTransitionContext;
  return [(_UIViewControllerTransitionContext *)&v3 init];
}

- (void)_setIsAnimated:(BOOL)a3
{
  self->_animated = a3;
}

- (void)_setDuration:(double)a3
{
  self->__duration = a3;
}

- (void)_setRotating:(BOOL)a3
{
  self->_rotating = a3;
}

- (void)_setCompletionHandler:(id)a3
{
}

- (BOOL)isAnimated
{
  return self->_animated;
}

- (void)_setDidCompleteHandler:(id)a3
{
}

- (void)_setCompletionCurve:(int64_t)a3
{
  self->__completionCurve = a3;
}

- (void)_setTransitionIsInFlight:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(_UIViewControllerTransitionContext *)self _state] != 4)
  {
    [(_UIViewControllerTransitionContext *)self _setState:v3];
  }
}

- (int64_t)_state
{
  return self->__state;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->__postInteractiveCompletionHandler, 0);
  objc_storeStrong(&self->__interactiveUpdateHandler, 0);
  objc_storeStrong((id *)&self->__auxContext, 0);
  objc_storeStrong(&self->__didCompleteHandler, 0);
  objc_storeStrong(&self->__completionHandler, 0);
  objc_storeStrong(&self->__willCompleteHandler, 0);
  objc_destroyWeak((id *)&self->__interactor);
  objc_storeStrong((id *)&self->__containerViews, 0);
  objc_storeStrong((id *)&self->_disabledViews, 0);
  objc_destroyWeak((id *)&self->_containerView);
  objc_destroyWeak((id *)&self->__animator);
}

- (UIView)containerView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerView);
  return (UIView *)WeakRetained;
}

- (BOOL)transitionWasCancelled
{
  return (*(unsigned char *)&self->_transitionContextFlags >> 3) & 1;
}

- (void)_setPresentationStyle:(int64_t)a3
{
  self->_presentationStyle = a3;
}

- (BOOL)isInterruptible
{
  return (*(unsigned char *)&self->_transitionContextFlags >> 6) & 1;
}

- (BOOL)_ranAlongsideAnimations
{
  return (*(unsigned char *)&self->_transitionContextFlags >> 2) & 1;
}

- (BOOL)isCurrentlyInteractive
{
  return self->_currentlyInteractive;
}

- (void)_setWillCompleteHandler:(id)a3
{
}

- (id)_willCompleteHandler
{
  return self->__willCompleteHandler;
}

+ (id)_associatedTransitionContextsForInteractionController:(id)a3
{
  return objc_getAssociatedObject(a3, &_UIInteractionControllerAssociatedTransitionContextsKey);
}

- (CGAffineTransform)_affineTransform
{
  id v4 = [(_UIViewControllerTransitionContext *)self _animator];
  if (v4
    && (objc_opt_respondsToSelector() & 1) != 0
    && ([v4 window], (char v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v6 = v5;
    uint64_t v7 = [v5 _fromWindowOrientation];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = [v6 _toWindowOrientation];
      double v10 = 0.0;
      double v11 = 0.0;
      if (v9 != 1)
      {
        if (v9 == 3)
        {
          double v11 = 1.57079633;
        }
        else if (v9 == 4)
        {
          double v11 = -1.57079633;
        }
        else
        {
          double v11 = 3.14159265;
          if (v9 != 2) {
            double v11 = 0.0;
          }
        }
      }
      if (v8 != 1)
      {
        if (v8 == 3)
        {
          double v10 = 1.57079633;
        }
        else if (v8 == 4)
        {
          double v10 = -1.57079633;
        }
        else
        {
          double v10 = 3.14159265;
          if (v8 != 2) {
            double v10 = 0.0;
          }
        }
      }
      long long v18 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
      *(_OWORD *)&v20.a = *MEMORY[0x1E4F1DAB8];
      *(_OWORD *)&v20.c = v18;
      *(_OWORD *)&v20.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
      CGAffineTransformRotate(&v21, &v20, v11 - v10);
      float64x2_t v19 = vrndaq_f64(*(float64x2_t *)&v21.c);
      *(float64x2_t *)&v21.a = vrndaq_f64(*(float64x2_t *)&v21.a);
      *(float64x2_t *)&v21.c = v19;
      *(float64x2_t *)&v21.tx = vrndaq_f64(*(float64x2_t *)&v21.tx);
      *(_OWORD *)&retstr->a = *(_OWORD *)&v21.a;
      *(float64x2_t *)&retstr->c = v19;
      long long v17 = *(_OWORD *)&v21.tx;
    }
    else
    {
      uint64_t v15 = MEMORY[0x1E4F1DAB8];
      long long v16 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
      *(_OWORD *)&retstr->a = *MEMORY[0x1E4F1DAB8];
      *(_OWORD *)&retstr->c = v16;
      long long v17 = *(_OWORD *)(v15 + 32);
    }
    *(_OWORD *)&retstr->tx = v17;
  }
  else
  {
    uint64_t v12 = MEMORY[0x1E4F1DAB8];
    long long v13 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&retstr->a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&retstr->c = v13;
    *(_OWORD *)&retstr->tx = *(_OWORD *)(v12 + 32);
  }

  return result;
}

- (double)_previousPercentComplete
{
  return self->_previousPercentComplete;
}

- (void)_setPreviousPercentComplete:(double)a3
{
  self->_previousPercentComplete = a3;
}

- (void)_updateInteractiveTransitionWithoutTrackingPercentComplete:(double)a3
{
  if ([(_UIViewControllerTransitionContext *)self _initiallyInteractive])
  {
    char v5 = [(_UIViewControllerTransitionContext *)self _interactiveUpdateHandler];

    if (v5)
    {
      *(unsigned char *)&self->_transitionContextFlags &= ~0x10u;
      uint64_t v7 = (void (*)(__n128))*((void *)self->__interactiveUpdateHandler + 2);
      v6.n128_f64[0] = a3;
      v7(v6);
    }
  }
}

- (void)pauseInteractiveTransition
{
  if ([(_UIViewControllerTransitionContext *)self isInterruptible]
    && [(_UIViewControllerTransitionContext *)self _state] == 1
    && ![(_UIViewControllerTransitionContext *)self isCurrentlyInteractive])
  {
    id interactiveUpdateHandler = self->__interactiveUpdateHandler;
    if (interactiveUpdateHandler)
    {
      *(unsigned char *)&self->_transitionContextFlags &= ~0x10u;
      (*((void (**)(id, void, void, _UIViewControllerTransitionContext *, double))interactiveUpdateHandler
       + 2))(interactiveUpdateHandler, 0, 0, self, self->_previousPercentComplete);
    }
    [(_UIViewControllerTransitionContext *)self _interactivityDidChange:1];
  }
}

- (void)updateInteractiveTransition:(double)a3
{
  if (a3 < 0.0) {
    a3 = 0.0;
  }
  if (a3 <= 1.0) {
    double v4 = a3;
  }
  else {
    double v4 = 1.0;
  }
  if ([(_UIViewControllerTransitionContext *)self _state] == 1)
  {
    if ([(_UIViewControllerTransitionContext *)self isCurrentlyInteractive])
    {
      char v5 = [(_UIViewControllerTransitionContext *)self _interactiveUpdateHandler];
      if (v5)
      {
        double previousPercentComplete = self->_previousPercentComplete;

        if (previousPercentComplete != v4)
        {
          *(unsigned char *)&self->_transitionContextFlags &= ~0x10u;
          self->_double previousPercentComplete = v4;
          id interactiveUpdateHandler = self->__interactiveUpdateHandler;
          [(_UIViewControllerTransitionContext *)self _percentOffset];
          uint64_t v8 = (void (*)(void *, void, void, _UIViewControllerTransitionContext *, __n128))interactiveUpdateHandler[2];
          v9.n128_f64[0] = v4 + v9.n128_f64[0];
          v8(interactiveUpdateHandler, 0, 0, self, v9);
        }
      }
    }
  }
}

- (void)finishInteractiveTransition
{
  if ([(_UIViewControllerTransitionContext *)self _state] != 1
    && [(_UIViewControllerTransitionContext *)self _state] != 4)
  {
    __n128 v9 = self;
    uint64_t v10 = 3;
    goto LABEL_16;
  }
  char transitionContextFlags = (char)self->_transitionContextFlags;
  *(unsigned char *)&self->_char transitionContextFlags = transitionContextFlags & 0xE7 | 0x10;
  if (transitionContextFlags)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->__interactor);
    [WeakRetained completionSpeed];
    self->__completionVelocity = v5;

    if (self->__completionVelocity <= 0.0) {
      self->__completionVelocity = 1.0;
    }
  }
  if ((*(unsigned char *)&self->_transitionContextFlags & 2) != 0)
  {
    id v6 = objc_loadWeakRetained((id *)&self->__interactor);
    self->__completionCurve = [v6 completionCurve];
  }
  BOOL v7 = [(_UIViewControllerTransitionContext *)self isCurrentlyInteractive];
  if (!v7 && [(_UIViewControllerTransitionContext *)self _state] != 4) {
    goto LABEL_14;
  }
  uint64_t v8 = [(_UIViewControllerTransitionContext *)self _interactiveUpdateHandler];

  if (v8) {
    (*((void (**)(double))self->__interactiveUpdateHandler + 2))(self->_previousPercentComplete);
  }
  if (!v7 || [(_UIViewControllerTransitionContext *)self _state] == 4)
  {
LABEL_14:
    __n128 v9 = self;
    uint64_t v10 = 0;
LABEL_16:
    [(_UIViewControllerTransitionContext *)v9 _setState:v10];
    return;
  }
  [(_UIViewControllerTransitionContext *)self _interactivityDidChange:0];
}

- (void)cancelInteractiveTransition
{
  if ([(_UIViewControllerTransitionContext *)self _state] != 1
    && [(_UIViewControllerTransitionContext *)self _state] != 4)
  {
    long long v13 = self;
    uint64_t v14 = 2;
    goto LABEL_19;
  }
  char transitionContextFlags = (char)self->_transitionContextFlags;
  char v4 = transitionContextFlags | 0x18;
  *(unsigned char *)&self->_char transitionContextFlags = transitionContextFlags | 0x18;
  if (transitionContextFlags)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->__interactor);
    [WeakRetained completionSpeed];
    self->__double completionVelocity = v6;

    double completionVelocity = self->__completionVelocity;
    double v8 = -completionVelocity;
    BOOL v9 = completionVelocity > 0.0;
    double v10 = -1.0;
    if (v9) {
      double v10 = v8;
    }
    self->__double completionVelocity = v10;
    char v4 = (char)self->_transitionContextFlags;
  }
  if ((v4 & 2) != 0)
  {
    id v11 = objc_loadWeakRetained((id *)&self->__interactor);
    self->__completionCurve = [v11 completionCurve];
  }
  if ([(_UIViewControllerTransitionContext *)self isCurrentlyInteractive]
    || [(_UIViewControllerTransitionContext *)self _state] == 4)
  {
    uint64_t v12 = [(_UIViewControllerTransitionContext *)self _interactiveUpdateHandler];

    if (v12) {
      (*((void (**)(double))self->__interactiveUpdateHandler + 2))(self->_previousPercentComplete);
    }
  }
  if ([(_UIViewControllerTransitionContext *)self _state] == 4)
  {
    long long v13 = self;
    uint64_t v14 = 0;
LABEL_19:
    [(_UIViewControllerTransitionContext *)v13 _setState:v14];
    return;
  }
  [(_UIViewControllerTransitionContext *)self _interactivityDidChange:0];
}

- (void)_stopInteractiveTransition
{
}

- (id)viewControllerForKey:(id)a3
{
  return 0;
}

- (id)viewForKey:(id)a3
{
  return 0;
}

- (CGRect)initialFrameForViewController:(id)a3
{
  double v3 = *MEMORY[0x1E4F1DB28];
  double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)finalFrameForViewController:(id)a3
{
  double v3 = *MEMORY[0x1E4F1DB28];
  double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (void)setTransitionWasCancelled:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char transitionContextFlags = *(unsigned char *)&self->_transitionContextFlags & 0xF7 | v3;
}

- (BOOL)_transitionIsCompleting
{
  return (*(unsigned char *)&self->_transitionContextFlags >> 4) & 1;
}

- (void)_setTransitionIsCompleting:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char transitionContextFlags = *(unsigned char *)&self->_transitionContextFlags & 0xEF | v3;
}

- (void)_setInterruptible:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char transitionContextFlags = *(unsigned char *)&self->_transitionContextFlags & 0xBF | v3;
}

- (void)_setPerformingLayoutToLayoutTransition:(BOOL)a3
{
  if (a3) {
    char v3 = 0x80;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char transitionContextFlags = v3 & 0x80 | *(unsigned char *)&self->_transitionContextFlags & 0x7F;
}

- (BOOL)_isPerformingLayoutToLayoutTransition
{
  return *(unsigned char *)&self->_transitionContextFlags >> 7;
}

- (void)_interactivityDidChange:(BOOL)a3
{
  [(_UIViewControllerTransitionContext *)self _setCurrentlyInteractive:a3];
  auxContext = self->__auxContext;
  if (auxContext)
  {
    double v5 = [(_UIViewControllerTransitionCoordinator *)auxContext _interactiveChangeHandlers];
    if (v5)
    {
      double v6 = self->__auxContext;
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __62___UIViewControllerTransitionContext__interactivityDidChange___block_invoke;
      v7[3] = &unk_1E52D9F70;
      v7[4] = self;
      [(_UIViewControllerTransitionCoordinator *)v6 _applyBlocks:v5 releaseBlocks:v7];
    }
  }
}

- (int64_t)_alongsideAnimationsCount
{
  int64_t result = (int64_t)self->__auxContext;
  if (result)
  {
    char v3 = [(id)result _alongsideAnimations];
    int64_t v4 = [v3 count];

    return v4;
  }
  return result;
}

- (BOOL)_transitionHasCompleted
{
  return (*(unsigned char *)&self->_transitionContextFlags >> 5) & 1;
}

- (void)_disableInteractionForViews:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  [(_UIViewControllerTransitionContext *)self _enableInteractionForDisabledViews];
  objc_storeStrong((id *)&self->_disabledViews, a3);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  double v6 = self->_disabledViews;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v10++), "setUserInteractionEnabled:", 0, (void)v11);
      }
      while (v8 != v10);
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (NSArray)_containerViews
{
  return self->__containerViews;
}

- (void)_setContainerViews:(id)a3
{
}

- (double)_percentOffset
{
  return self->__percentOffset;
}

- (void)_setPercentOffset:(double)a3
{
  self->__percentOffset = a3;
}

- (UIViewControllerInteractiveTransitioning)_interactor
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__interactor);
  return (UIViewControllerInteractiveTransitioning *)WeakRetained;
}

- (BOOL)_allowUserInteraction
{
  return self->__allowUserInteraction;
}

- (void)_setAllowUserInteraction:(BOOL)a3
{
  self->__allowUserInteraction = a3;
}

- (BOOL)_isRotating
{
  return self->_rotating;
}

- (double)_duration
{
  return self->__duration;
}

- (BOOL)_needsBottomBarCrossfade
{
  return self->__needsBottomBarCrossfade;
}

- (void)_setNeedsBottomBarCrossfade:(BOOL)a3
{
  self->__needsBottomBarCrossfade = a3;
}

- (BOOL)_transitioningBottomBarIsTabBar
{
  return self->__transitioningBottomBarIsTabBar;
}

- (void)_setTransitioningBottomBarIsTabBar:(BOOL)a3
{
  self->__transitioningBottomBarIsTabBar = a3;
}

- (id)_completionHandler
{
  return self->__completionHandler;
}

- (id)_didCompleteHandler
{
  return self->__didCompleteHandler;
}

- (BOOL)_initiallyInteractive
{
  return self->_initiallyInteractive;
}

- (void)_setInitiallyInteractive:(BOOL)a3
{
  self->_initiallyInteractive = a3;
}

- (void)_setCurrentlyInteractive:(BOOL)a3
{
  self->_currentlyInteractive = a3;
}

- (double)_completionVelocity
{
  return self->__completionVelocity;
}

- (void)_setCompletionVelocity:(double)a3
{
  self->__double completionVelocity = a3;
}

- (int64_t)_completionCurve
{
  return self->__completionCurve;
}

- (id)_interactiveUpdateHandler
{
  return self->__interactiveUpdateHandler;
}

- (void)_setInteractiveUpdateHandler:(id)a3
{
}

- (void)_setPostInteractiveCompletionHandler:(id)a3
{
}

- (int64_t)presentationStyle
{
  return self->_presentationStyle;
}

- (BOOL)_isPresentation
{
  return self->__isPresentation;
}

- (void)_setIsPresentation:(BOOL)a3
{
  self->__isPresentation = a3;
}

@end