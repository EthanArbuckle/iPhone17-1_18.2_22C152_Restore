@interface IMViewControllerTransitionContext
+ (id)_associatedTransitionContextForObject:(id)a3;
- (BOOL)_transitionIsCompleting;
- (BOOL)_transitionIsInFlight;
- (BOOL)initiallyInteractive;
- (BOOL)isAnimated;
- (BOOL)isCurrentlyInteractive;
- (BOOL)transitionWasCancelled;
- (CGAffineTransform)targetTransform;
- (CGRect)finalFrameForViewController:(id)a3;
- (CGRect)initialFrameForViewController:(id)a3;
- (IMViewControllerTransitionContext)init;
- (NSArray)_containerViews;
- (NSMapTable)trackedAnimations;
- (UIView)bk_containerView;
- (UIView)containerView;
- (UIViewControllerAnimatedTransitioning)animator;
- (UIViewControllerInteractiveTransitioning)interactor;
- (double)_completionVelocity;
- (double)_percentOffset;
- (double)_previousPercentComplete;
- (double)duration;
- (id)_auxContext;
- (id)_completionHandler;
- (id)_interactiveUpdateHandler;
- (id)_postInteractiveCompletionHandler;
- (id)_transitionCoordinator;
- (id)_willCompleteHandler;
- (id)viewControllerForKey:(id)a3;
- (id)viewForKey:(id)a3;
- (int64_t)_completionCurve;
- (int64_t)_state;
- (int64_t)presentationStyle;
- (void)__runAlongsideAnimations;
- (void)_disableInteractionForViews:(id)a3;
- (void)_enableInteractionForDisabledViews;
- (void)_interactivityDidChange:(BOOL)a3;
- (void)_runAlongsideCompletions;
- (void)_setAnimator:(id)a3;
- (void)_setAuxContext:(id)a3;
- (void)_setCompletionCurve:(int64_t)a3;
- (void)_setCompletionHandler:(id)a3;
- (void)_setCompletionVelocity:(double)a3;
- (void)_setContainerViews:(id)a3;
- (void)_setDuration:(double)a3;
- (void)_setInitiallyInteractive:(BOOL)a3;
- (void)_setInteractiveUpdateHandler:(id)a3;
- (void)_setInteractor:(id)a3;
- (void)_setIsAnimated:(BOOL)a3;
- (void)_setIsCurrentlyInteractive:(BOOL)a3;
- (void)_setPercentOffset:(double)a3;
- (void)_setPostInteractiveCompletionHandler:(id)a3;
- (void)_setPreviousPercentComplete:(double)a3;
- (void)_setState:(int64_t)a3;
- (void)_setTransitionIsCompleting:(BOOL)a3;
- (void)_setTransitionIsInFlight:(BOOL)a3;
- (void)_setWillCompleteHandler:(id)a3;
- (void)_updateInteractiveTransitionWithoutTrackingPercentComplete:(double)a3;
- (void)cancelInteractiveTransition;
- (void)completeTransition:(BOOL)a3;
- (void)dealloc;
- (void)finishInteractiveTransition;
- (void)setBk_containerView:(id)a3;
- (void)setTrackedAnimations:(id)a3;
- (void)trackAnimation:(id)a3 withLayer:(id)a4;
- (void)updateInteractiveTransition:(double)a3;
@end

@implementation IMViewControllerTransitionContext

+ (id)_associatedTransitionContextForObject:(id)a3
{
  return objc_getAssociatedObject(a3, &unk_3456E8);
}

- (IMViewControllerTransitionContext)init
{
  self->_previousPercentComplete = 0.0;
  self->__completionCurve = 0;
  self->__completionVelocity = 1.0;
  self->_presentationStyle = -1;
  *(unsigned char *)&self->_transitionContextFlags |= 8u;
  v3 = +[NSMapTable strongToStrongObjectsMapTable];
  trackedAnimations = self->_trackedAnimations;
  self->_trackedAnimations = v3;

  v6.receiver = self;
  v6.super_class = (Class)IMViewControllerTransitionContext;
  return [(IMViewControllerTransitionContext *)&v6 init];
}

- (void)dealloc
{
  [(IMViewControllerTransitionContext *)self setBk_containerView:0];
  [(IMViewControllerTransitionContext *)self _setInteractiveUpdateHandler:0];
  [(IMViewControllerTransitionContext *)self _setPostInteractiveCompletionHandler:0];
  [(IMViewControllerTransitionContext *)self _setWillCompleteHandler:0];
  [(IMViewControllerTransitionContext *)self _setCompletionHandler:0];
  [(IMViewControllerTransitionContext *)self _setAuxContext:0];
  v3.receiver = self;
  v3.super_class = (Class)IMViewControllerTransitionContext;
  [(IMViewControllerTransitionContext *)&v3 dealloc];
}

- (UIView)containerView
{
  return [(IMViewControllerTransitionContext *)self bk_containerView];
}

- (void)_setAnimator:(id)a3
{
  v4 = (UIViewControllerAnimatedTransitioning *)a3;
  animator = self->_animator;
  if (animator != v4)
  {
    objc_super v6 = v4;
    if (animator)
    {
      objc_setAssociatedObject(animator, &unk_3456E8, 0, (char *)&def_7D91C + 1);
      v4 = v6;
    }
    self->_animator = v4;
    if (v4) {
      objc_setAssociatedObject(v4, &unk_3456E8, self, (char *)&def_7D91C + 1);
    }
  }

  _objc_release_x2();
}

- (void)_setInteractor:(id)a3
{
  v4 = (UIViewControllerInteractiveTransitioning *)a3;
  interactor = self->_interactor;
  if (interactor != v4)
  {
    object = v4;
    if (interactor)
    {
      objc_setAssociatedObject(interactor, &unk_3456E8, 0, (char *)&def_7D91C + 1);
      v4 = object;
    }
    self->_interactor = v4;
    if (v4)
    {
      *(unsigned char *)&self->_transitionContextFlags = *(unsigned char *)&self->_transitionContextFlags & 0xFE | objc_opt_respondsToSelector() & 1;
      if (objc_opt_respondsToSelector()) {
        char v6 = 2;
      }
      else {
        char v6 = 0;
      }
      *(unsigned char *)&self->_transitionContextFlags = *(unsigned char *)&self->_transitionContextFlags & 0xFD | v6;
      [(IMViewControllerTransitionContext *)self _setInitiallyInteractive:1];
      [(IMViewControllerTransitionContext *)self _setIsCurrentlyInteractive:1];
      objc_setAssociatedObject(object, &unk_3456E8, self, (char *)&def_7D91C + 1);
    }
  }

  _objc_release_x2();
}

- (id)_transitionCoordinator
{
  id auxContext = self->__auxContext;
  if (auxContext) {
    objc_super v3 = (IMViewControllerTransitionCoordinator *)auxContext;
  }
  else {
    objc_super v3 = [[IMViewControllerTransitionCoordinator alloc] initWithMainContext:self];
  }

  return v3;
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
  if ([(IMViewControllerTransitionContext *)self initiallyInteractive])
  {
    v5 = [(IMViewControllerTransitionContext *)self _interactiveUpdateHandler];

    if (v5)
    {
      *(unsigned char *)&self->_transitionContextFlags &= ~8u;
      v7 = (void (*)(__n128))*((void *)self->__interactiveUpdateHandler + 2);
      v6.n128_f64[0] = a3;
      v7(v6);
    }
  }
}

- (void)updateInteractiveTransition:(double)a3
{
  if ((char *)[(IMViewControllerTransitionContext *)self _state] == (char *)&def_7D91C + 1)
  {
    if ([(IMViewControllerTransitionContext *)self isCurrentlyInteractive])
    {
      v5 = [(IMViewControllerTransitionContext *)self _interactiveUpdateHandler];
      if (v5)
      {
        double previousPercentComplete = self->_previousPercentComplete;

        if (previousPercentComplete != a3)
        {
          *(unsigned char *)&self->_transitionContextFlags &= ~8u;
          self->_double previousPercentComplete = a3;
          interactiveUpdateHandler = self->__interactiveUpdateHandler;
          [(IMViewControllerTransitionContext *)self _percentOffset];
          v8 = (void (*)(void *, void, void, IMViewControllerTransitionContext *, __n128))interactiveUpdateHandler[2];
          v9.n128_f64[0] = v9.n128_f64[0] + a3;
          v8(interactiveUpdateHandler, 0, 0, self, v9);
        }
      }
    }
  }
}

- (void)finishInteractiveTransition
{
  if ((char *)[(IMViewControllerTransitionContext *)self _state] == (char *)&def_7D91C + 1)
  {
    char transitionContextFlags = (char)self->_transitionContextFlags;
    *(unsigned char *)&self->_char transitionContextFlags = transitionContextFlags & 0xF3 | 8;
    if (transitionContextFlags)
    {
      [(UIViewControllerInteractiveTransitioning *)self->_interactor completionSpeed];
      self->__completionVelocity = v4;
      if (v4 < 0.0) {
        self->__completionVelocity = 1.0;
      }
    }
    if ((*(unsigned char *)&self->_transitionContextFlags & 2) != 0) {
      self->__completionCurve = (int64_t)[(UIViewControllerInteractiveTransitioning *)self->_interactor completionCurve];
    }
    if ([(IMViewControllerTransitionContext *)self isCurrentlyInteractive])
    {
      v5 = [(IMViewControllerTransitionContext *)self _interactiveUpdateHandler];

      if (v5) {
        (*((void (**)(double))self->__interactiveUpdateHandler + 2))(self->_previousPercentComplete);
      }
    }
    [(IMViewControllerTransitionContext *)self _interactivityDidChange:0];
  }
  else
  {
    [(IMViewControllerTransitionContext *)self _setState:3];
  }
}

- (void)cancelInteractiveTransition
{
  if ((char *)[(IMViewControllerTransitionContext *)self _state] == (char *)&def_7D91C + 1)
  {
    char transitionContextFlags = (char)self->_transitionContextFlags;
    *(unsigned char *)&self->_char transitionContextFlags = transitionContextFlags | 0xC;
    if (transitionContextFlags)
    {
      [(UIViewControllerInteractiveTransitioning *)self->_interactor completionSpeed];
      double v5 = -v4;
      BOOL v6 = v4 < 0.0;
      double v7 = -1.0;
      if (!v6) {
        double v7 = v5;
      }
      self->__completionVelocity = v7;
    }
    if ((*(unsigned char *)&self->_transitionContextFlags & 2) != 0) {
      self->__completionCurve = (int64_t)[(UIViewControllerInteractiveTransitioning *)self->_interactor completionCurve];
    }
    if ([(IMViewControllerTransitionContext *)self isCurrentlyInteractive])
    {
      v8 = [(IMViewControllerTransitionContext *)self _interactiveUpdateHandler];

      if (v8) {
        (*((void (**)(double))self->__interactiveUpdateHandler + 2))(self->_previousPercentComplete);
      }
    }
    [(IMViewControllerTransitionContext *)self _interactivityDidChange:0];
  }
  else
  {
    [(IMViewControllerTransitionContext *)self _setState:2];
  }
}

- (void)completeTransition:(BOOL)a3
{
  BOOL v3 = a3;
  willCompleteHandler = (void (**)(id, IMViewControllerTransitionContext *, BOOL))self->__willCompleteHandler;
  if (willCompleteHandler) {
    willCompleteHandler[2](willCompleteHandler, self, a3);
  }
  completionHandler = (void (**)(id, IMViewControllerTransitionContext *, BOOL))self->__completionHandler;
  if (completionHandler) {
    completionHandler[2](completionHandler, self, v3);
  }

  [(IMViewControllerTransitionContext *)self _runAlongsideCompletions];
}

- (id)viewControllerForKey:(id)a3
{
  return 0;
}

- (id)viewForKey:(id)a3
{
  return 0;
}

- (CGAffineTransform)targetTransform
{
  long long v3 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
  return self;
}

- (CGRect)initialFrameForViewController:(id)a3
{
  double x = CGRectZero.origin.x;
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)finalFrameForViewController:(id)a3
{
  double x = CGRectZero.origin.x;
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (BOOL)transitionWasCancelled
{
  return (*(unsigned char *)&self->_transitionContextFlags >> 2) & 1;
}

- (BOOL)_transitionIsInFlight
{
  return (char *)[(IMViewControllerTransitionContext *)self _state] == (char *)&def_7D91C + 1;
}

- (void)_setTransitionIsInFlight:(BOOL)a3
{
}

- (BOOL)_transitionIsCompleting
{
  return (*(unsigned char *)&self->_transitionContextFlags >> 3) & 1;
}

- (void)_setTransitionIsCompleting:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char transitionContextFlags = *(unsigned char *)&self->_transitionContextFlags & 0xF7 | v3;
}

- (void)_runAlongsideCompletions
{
  id auxContext = self->__auxContext;
  if (auxContext)
  {
    double v4 = [self->__auxContext _alongsideCompletions];
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_6ABB8;
    v5[3] = &unk_2C3C50;
    v5[4] = self;
    [auxContext _applyBlocks:v4 releaseBlocks:v5];
  }
}

- (void)_interactivityDidChange:(BOOL)a3
{
  [(IMViewControllerTransitionContext *)self _setIsCurrentlyInteractive:a3];
  id auxContext = self->__auxContext;
  if (auxContext)
  {
    double v5 = [auxContext _interactiveChangeHandlers];
    if (v5)
    {
      id v6 = self->__auxContext;
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_6AC68;
      v7[3] = &unk_2C3C50;
      v7[4] = self;
      [v6 _applyBlocks:v5 releaseBlocks:v7];
    }
  }
}

- (void)__runAlongsideAnimations
{
  if (self->__auxContext)
  {
    char v3 = 0;
    uint64_t v4 = -2;
    do
    {
      double v5 = v3;
      char v3 = [self->__auxContext _alongsideAnimations];

      if (!v3) {
        break;
      }
      id auxContext = self->__auxContext;
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_6AD5C;
      v8[3] = &unk_2C3C50;
      v8[4] = self;
      [auxContext _applyBlocks:v3 releaseBlocks:v8];
    }
    while (!__CFADD__(v4++, 1));
    [self->__auxContext _setAlongsideAnimations:0];
  }
}

- (void)_disableInteractionForViews:(id)a3
{
  id v5 = a3;
  [(IMViewControllerTransitionContext *)self _enableInteractionForDisabledViews];
  objc_storeStrong((id *)&self->_disabledViews, a3);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = self->_disabledViews;
  id v7 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * (void)v10) setUserInteractionEnabled:0 v11];
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)_enableInteractionForDisabledViews
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  char v3 = self->_disabledViews;
  id v4 = [(NSArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * (void)v7) setUserInteractionEnabled:1 v9];
        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [(NSArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  disabledViews = self->_disabledViews;
  self->_disabledViews = 0;
}

- (void)trackAnimation:(id)a3 withLayer:(id)a4
{
  id v6 = a4;
  id v8 = [a3 copy];
  id v7 = [(IMViewControllerTransitionContext *)self trackedAnimations];
  [v7 setObject:v6 forKey:v8];
}

- (BOOL)isAnimated
{
  return self->_animated;
}

- (int64_t)_completionCurve
{
  return self->__completionCurve;
}

- (void)_setCompletionCurve:(int64_t)a3
{
  self->__completionCurve = a3;
}

- (double)duration
{
  return self->_duration;
}

- (void)_setDuration:(double)a3
{
  self->_duration = a3;
}

- (double)_completionVelocity
{
  return self->__completionVelocity;
}

- (void)_setCompletionVelocity:(double)a3
{
  self->__completionVelocitdouble y = a3;
}

- (int64_t)presentationStyle
{
  return self->_presentationStyle;
}

- (int64_t)_state
{
  return self->__state;
}

- (void)_setState:(int64_t)a3
{
  self->__state = a3;
}

- (BOOL)isCurrentlyInteractive
{
  return self->_isCurrentlyInteractive;
}

- (void)_setIsCurrentlyInteractive:(BOOL)a3
{
  self->_isCurrentlyInteractive = a3;
}

- (BOOL)initiallyInteractive
{
  return self->_initiallyInteractive;
}

- (void)_setInitiallyInteractive:(BOOL)a3
{
  self->_initiallyInteractive = a3;
}

- (void)_setIsAnimated:(BOOL)a3
{
  self->_isAnimated = a3;
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

- (UIViewControllerAnimatedTransitioning)animator
{
  return self->_animator;
}

- (UIViewControllerInteractiveTransitioning)interactor
{
  return self->_interactor;
}

- (UIView)bk_containerView
{
  return self->_bk_containerView;
}

- (void)setBk_containerView:(id)a3
{
  self->_bk_containerView = (UIView *)a3;
}

- (id)_interactiveUpdateHandler
{
  return self->__interactiveUpdateHandler;
}

- (void)_setInteractiveUpdateHandler:(id)a3
{
}

- (id)_postInteractiveCompletionHandler
{
  return self->__postInteractiveCompletionHandler;
}

- (void)_setPostInteractiveCompletionHandler:(id)a3
{
}

- (id)_willCompleteHandler
{
  return self->__willCompleteHandler;
}

- (void)_setWillCompleteHandler:(id)a3
{
}

- (id)_completionHandler
{
  return self->__completionHandler;
}

- (void)_setCompletionHandler:(id)a3
{
}

- (id)_auxContext
{
  return self->__auxContext;
}

- (void)_setAuxContext:(id)a3
{
}

- (NSMapTable)trackedAnimations
{
  return self->_trackedAnimations;
}

- (void)setTrackedAnimations:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackedAnimations, 0);
  objc_storeStrong(&self->__auxContext, 0);
  objc_storeStrong(&self->__completionHandler, 0);
  objc_storeStrong(&self->__willCompleteHandler, 0);
  objc_storeStrong(&self->__postInteractiveCompletionHandler, 0);
  objc_storeStrong(&self->__interactiveUpdateHandler, 0);
  objc_storeStrong((id *)&self->__containerViews, 0);

  objc_storeStrong((id *)&self->_disabledViews, 0);
}

@end