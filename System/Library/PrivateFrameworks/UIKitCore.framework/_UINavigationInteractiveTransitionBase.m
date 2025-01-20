@interface _UINavigationInteractiveTransitionBase
- (BOOL)_completesTransitionOnEnd;
- (BOOL)_gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4;
- (BOOL)_shouldPauseRunningTransition;
- (BOOL)_shouldReverseLayoutDirection;
- (BOOL)_stoppedTransitionWasCancelled;
- (BOOL)_supportsCoordinatedPresentationDismissal;
- (BOOL)_transitionWasStopped;
- (BOOL)_useAugmentedShouldPopDecisionProcedure;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)popGesture:(id)a3 withRemainingDuration:(double)a4 shouldPopWithVelocity:(double *)a5;
- (BOOL)shouldReverseTranslation;
- (BOOL)wantsInteractiveStart;
- (UIPanGestureRecognizer)gestureRecognizer;
- (UIViewController)_parent;
- (_UINavigationInteractiveTransitionBase)initWithGestureRecognizerView:(id)a3 animator:(id)a4 delegate:(id)a5;
- (_UINavigationInteractiveTransitionBaseDelegate)delegate;
- (_UINavigationParallaxTransition)animationController;
- (double)_translationCoefficient;
- (double)averageAcceleration;
- (double)averageVelocity;
- (double)previousAcceleration;
- (double)previousDisplacement;
- (double)previousTimeStamp;
- (double)previousVelocity;
- (double)skipTimeStamp;
- (double)totalDistance;
- (id)gestureRecognizerView;
- (int64_t)_interactionState;
- (unint64_t)sampleCount;
- (void)_completeStoppedInteractiveTransition;
- (void)_resetInteractionController;
- (void)_setCompletesTransitionOnEnd:(BOOL)a3;
- (void)_setInteractionState:(int64_t)a3;
- (void)_setParent:(id)a3;
- (void)_setShouldReverseLayoutDirection:(BOOL)a3;
- (void)_setStoppedTransitionWasCancelled:(BOOL)a3;
- (void)_setTransitionWasStopped:(BOOL)a3;
- (void)_setUseAugmentedShouldPopDecisionProcedure:(BOOL)a3;
- (void)_stopInteractiveTransition;
- (void)_updateStatistics:(id)a3 firstSample:(BOOL)a4 finalSample:(BOOL)a5;
- (void)cancelInteractiveTransition;
- (void)dealloc;
- (void)finishInteractiveTransition;
- (void)handleNavigationTransition:(id)a3;
- (void)setAnimationController:(id)a3;
- (void)setAverageAcceleration:(double)a3;
- (void)setAverageVelocity:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setGestureRecognizer:(id)a3;
- (void)setPreviousAcceleration:(double)a3;
- (void)setPreviousDisplacement:(double)a3;
- (void)setPreviousTimeStamp:(double)a3;
- (void)setPreviousVelocity:(double)a3;
- (void)setSampleCount:(unint64_t)a3;
- (void)setShouldReverseTranslation:(BOOL)a3;
- (void)setSkipTimeStamp:(double)a3;
- (void)setTotalDistance:(double)a3;
- (void)startInteractiveTransition;
@end

@implementation _UINavigationInteractiveTransitionBase

- (void)setAnimationController:(id)a3
{
  p_animationController = &self->_animationController;
  objc_storeStrong((id *)&self->_animationController, a3);
  id v6 = a3;
  [(_UINavigationParallaxTransition *)*p_animationController setInteractionController:self];
}

- (void)_setShouldReverseLayoutDirection:(BOOL)a3
{
  self->__shouldReverseLayoutDirection = a3;
}

- (BOOL)_shouldReverseLayoutDirection
{
  return self->__shouldReverseLayoutDirection;
}

- (_UINavigationInteractiveTransitionBase)initWithGestureRecognizerView:(id)a3 animator:(id)a4 delegate:(id)a5
{
  v13.receiver = self;
  v13.super_class = (Class)_UINavigationInteractiveTransitionBase;
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [(UIPercentDrivenInteractiveTransition *)&v13 init];
  -[_UINavigationInteractiveTransitionBase setDelegate:](v10, "setDelegate:", v7, v13.receiver, v13.super_class);
  v10->__useAugmentedShouldPopDecisionProcedure = _UINavigationControllerUseAugmentedPopGesture();
  [(_UINavigationInteractiveTransitionBase *)v10 _setInteractionState:0];
  objc_storeWeak((id *)&v10->_gestureRecognizerView, v9);
  -[_UINavigationInteractiveTransitionBase _setShouldReverseLayoutDirection:](v10, "_setShouldReverseLayoutDirection:", [v9 _shouldReverseLayoutDirection]);
  [(_UINavigationInteractiveTransitionBase *)v10 _setCompletesTransitionOnEnd:1];
  [(_UINavigationInteractiveTransitionBase *)v10 setAnimationController:v8];

  v11 = [v7 gestureRecognizerForInteractiveTransition:v10 WithTarget:v10 action:sel_handleNavigationTransition_];

  [(_UINavigationInteractiveTransitionBase *)v10 setGestureRecognizer:v11];
  [v11 setDelaysTouchesBegan:0];
  [v11 setMaximumNumberOfTouches:1];
  [v11 setDelegate:v10];
  [v9 addGestureRecognizer:v11];

  return v10;
}

- (void)setGestureRecognizer:(id)a3
{
}

- (void)setDelegate:(id)a3
{
}

- (void)_setInteractionState:(int64_t)a3
{
  self->__interactionState = a3;
}

- (void)_setCompletesTransitionOnEnd:(BOOL)a3
{
  self->__completesTransitionOnEnd = a3;
}

- (void)setShouldReverseTranslation:(BOOL)a3
{
  self->_shouldReverseTranslation = a3;
}

- (void)dealloc
{
  v3 = [(_UINavigationInteractiveTransitionBase *)self gestureRecognizer];
  v4 = v3;
  if (v3)
  {
    v5 = [v3 view];
    id v6 = v5;
    if (v5) {
      [v5 removeGestureRecognizer:v4];
    }
  }
  if (self->__updateRequestActive)
  {
    id v7 = *(NSObject **)(__UILogGetCategoryCachedImpl("_UINavigationParallaxTransition", &dealloc___s_category_10) + 8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_ERROR, "UIUpdateRequest still active during navigation transition dealloc. Should completeTransition: have been called on the interaction context earlier?", buf, 2u);
    }
    _UIUpdateRequestRegistryRemoveRecord((uint64_t)&mainRegistry, __interactiveNavigationUpdateRequest, 0x100029u);
    self->__updateRequestActive = 0;
  }
  objc_storeWeak((id *)&self->__parent, 0);

  v8.receiver = self;
  v8.super_class = (Class)_UINavigationInteractiveTransitionBase;
  [(_UINavigationInteractiveTransitionBase *)&v8 dealloc];
}

- (UIPanGestureRecognizer)gestureRecognizer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_gestureRecognizer);
  return (UIPanGestureRecognizer *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_animationController, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_destroyWeak((id *)&self->__parent);
  objc_destroyWeak((id *)&self->_gestureRecognizer);
  objc_destroyWeak((id *)&self->_gestureRecognizerView);
}

- (id)gestureRecognizerView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_gestureRecognizerView);
  return WeakRetained;
}

- (void)_resetInteractionController
{
  [(_UINavigationInteractiveTransitionBase *)self _setInteractionState:0];
  [(_UINavigationInteractiveTransitionBase *)self setAnimationController:0];
}

- (void)cancelInteractiveTransition
{
  v3.receiver = self;
  v3.super_class = (Class)_UINavigationInteractiveTransitionBase;
  [(UIPercentDrivenInteractiveTransition *)&v3 cancelInteractiveTransition];
  [(_UINavigationInteractiveTransitionBase *)self setAnimationController:0];
}

- (void)finishInteractiveTransition
{
  v3.receiver = self;
  v3.super_class = (Class)_UINavigationInteractiveTransitionBase;
  [(UIPercentDrivenInteractiveTransition *)&v3 finishInteractiveTransition];
  [(_UINavigationInteractiveTransitionBase *)self setAnimationController:0];
}

- (void)_stopInteractiveTransition
{
  self->__transitionWasStopped = 1;
  v2.receiver = self;
  v2.super_class = (Class)_UINavigationInteractiveTransitionBase;
  [(UIPercentDrivenInteractiveTransition *)&v2 _stopInteractiveTransition];
}

- (void)_completeStoppedInteractiveTransition
{
  if (self->__stoppedTransitionWasCancelled) {
    [(_UINavigationInteractiveTransitionBase *)self cancelInteractiveTransition];
  }
  else {
    [(_UINavigationInteractiveTransitionBase *)self finishInteractiveTransition];
  }
  self->__transitionWasStopped = 0;
}

- (BOOL)_gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  return [a4 _isGestureType:9];
}

- (void)_updateStatistics:(id)a3 firstSample:(BOOL)a4 finalSample:(BOOL)a5
{
  BOOL v5 = a4;
  id v7 = a3;
  if (self->__useAugmentedShouldPopDecisionProcedure)
  {
    id v36 = v7;
    objc_super v8 = [v7 _activeEvents];
    id v9 = [v8 anyObject];
    [v9 timestamp];
    double v11 = v10;

    [(_UINavigationInteractiveTransitionBase *)self _translationCoefficient];
    double v13 = v12;
    v14 = [v36 view];
    [v36 translationInView:v14];
    double v16 = v15;

    double v17 = v13 * v16;
    v18 = [v36 view];
    [v36 velocityInView:v18];
    double v20 = v19;

    double totalDistance = self->_totalDistance;
    double v22 = v17 / totalDistance;
    if (v17 < 0.0) {
      double v22 = 0.0;
    }
    double v23 = v13 * v20 / totalDistance;
    if (v5)
    {
      self->_double previousTimeStamp = v11;
      self->_skipTimeStamp = v11;
      self->_previousDisplacement = v22;
      self->_previousVelocity = v23;
      self->_double previousAcceleration = 0.0;
      self->_averageVelocity = v23;
      self->_averageAcceleration = 0.0;
      self->_timestamps[0] = 0.0;
      self->_velocities[0] = v23;
      self->_accelerations[0] = 0.0;
      self->_unint64_t sampleCount = 1;
      id v7 = v36;
    }
    else
    {
      double previousTimeStamp = self->_previousTimeStamp;
      double v25 = v11 - self->_skipTimeStamp;
      self->_skipTimeStamp = v11;
      id v7 = v36;
      if (v25 >= 0.01 || v25 > 0.001 && self->_previousDisplacement != v22)
      {
        double v26 = v11 - previousTimeStamp;
        unint64_t sampleCount = self->_sampleCount;
        unint64_t v28 = sampleCount % 3;
        if (sampleCount > 2) {
          self->_averageVelocity = (v23 + self->_averageVelocity * 3.0 - self->_velocities[v28]) / 3.0;
        }
        else {
          self->_averageVelocity = (v23 + self->_averageVelocity * (double)sampleCount) / (double)(sampleCount + 1);
        }
        self->_velocities[v28] = v23;
        self->_timestamps[v28] = v26;
        double v29 = (v23 - self->_previousVelocity) / v26;
        double previousAcceleration = self->_previousAcceleration;
        double v31 = vabdd_f64(v29, previousAcceleration);
        double v32 = -5.0;
        if (v29 - previousAcceleration > 0.0) {
          double v32 = 5.0;
        }
        double v33 = previousAcceleration + v32;
        if (v31 > 5.0) {
          double v29 = v33;
        }
        if (sampleCount > 2)
        {
          self->_averageAcceleration = (v29 + self->_averageAcceleration * 3.0 - self->_accelerations[v28]) / 3.0;
          unint64_t v35 = sampleCount + 1;
        }
        else
        {
          double v34 = v29 + self->_averageAcceleration * (double)sampleCount;
          unint64_t v35 = sampleCount + 1;
          self->_averageAcceleration = v34 / (double)v35;
        }
        self->_accelerations[v28] = v29;
        self->_double previousAcceleration = v29;
        self->_previousVelocity = v23;
        self->_previousDisplacement = v22;
        self->_double previousTimeStamp = v11;
        self->_unint64_t sampleCount = v35;
      }
    }
  }
}

- (BOOL)popGesture:(id)a3 withRemainingDuration:(double)a4 shouldPopWithVelocity:(double *)a5
{
  id v8 = a3;
  id v9 = v8;
  if (self->__useAugmentedShouldPopDecisionProcedure)
  {
    if (self->_sampleCount >= 3 && self->__interactionState == 2)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->__parent);
      [(UIPercentDrivenInteractiveTransition *)self percentComplete];
      double v12 = v11;
      uint64_t v13 = [WeakRetained lastOperation];
      double v14 = 1.0 - v12;
      if (v13 != 1) {
        double v14 = v12;
      }
      double totalDistance = self->_totalDistance;
      BOOL v16 = v14 + self->_averageAcceleration * 0.5 * a4 * a4 + self->_averageVelocity * a4 > fmin(187.5 / totalDistance, 0.5);
      *a5 = totalDistance * self->_previousVelocity;
    }
    else
    {
      double v17 = [v8 view];
      [v9 velocityInView:v17];
      uint64_t v19 = v18;

      BOOL v16 = self->_averageVelocity > 0.0 && self->__interactionState != 1;
      *(void *)a5 = v19;
    }
  }
  else
  {
    double v20 = [v8 view];
    [v9 velocityInView:v20];
    double v22 = v21;

    BOOL v16 = v22 >= 0.0;
  }

  return v16;
}

- (void)startInteractiveTransition
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained startInteractiveTransition:self];
}

- (double)_translationCoefficient
{
  BOOL v3 = [(_UINavigationInteractiveTransitionBase *)self _shouldReverseLayoutDirection];
  BOOL shouldReverseTranslation = self->_shouldReverseTranslation;
  if (!v3) {
    BOOL shouldReverseTranslation = !self->_shouldReverseTranslation;
  }
  double result = -1.0;
  if (shouldReverseTranslation) {
    return 1.0;
  }
  return result;
}

- (BOOL)_shouldPauseRunningTransition
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__parent);
  BOOL v3 = WeakRetained;
  if (WeakRetained && [WeakRetained lastOperation] == 2)
  {
    v4 = [v3 _transitionConductor];
    BOOL v5 = [v4 transitionContext];
    char v6 = [v5 transitionWasCancelled];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (void)handleNavigationTransition:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->__parent);
  char v6 = [v4 view];
  [v4 translationInView:v6];
  double v8 = v7;

  id v9 = [v4 view];
  [v9 bounds];
  double v11 = v10;

  switch([v4 state])
  {
    case 1:
      self->_double totalDistance = v11;
      self->__interactionState = 1;
      if ([WeakRetained _isTransitioning]
        && [(_UINavigationInteractiveTransitionBase *)self _shouldPauseRunningTransition])
      {
        [(UIPercentDrivenInteractiveTransition *)self pauseInteractiveTransition];
        [(UIPercentDrivenInteractiveTransition *)self percentComplete];
      }
      else
      {
        self->_wantsInteractiveStart = 1;
        [(_UINavigationInteractiveTransitionBase *)self startInteractiveTransition];
        self->_wantsInteractiveStart = 0;
        double v12 = 0.0;
      }
      self->_percentCompleteWhenPaused = v12;
      [(_UINavigationInteractiveTransitionBase *)self _updateStatistics:v4 firstSample:1 finalSample:0];
      if (!self->__updateRequestActive)
      {
        _UIUpdateRequestRegistryAddRecord((uint64_t)&mainRegistry, __interactiveNavigationUpdateRequest, 0x100029u);
        self->__updateRequestActive = 1;
      }
      break;
    case 2:
      [(_UINavigationInteractiveTransitionBase *)self _translationCoefficient];
      double v24 = v8 * v23 / v11;
      uint64_t v25 = [WeakRetained lastOperation];
      double v26 = -v24;
      if (v25 != 1) {
        double v26 = v24;
      }
      double v27 = self->_percentCompleteWhenPaused + v26;
      unint64_t v28 = [WeakRetained traitCollection];
      BOOL v29 = +[UIView _fluidParallaxTransitionsEnabledWithTraitCollection:]((uint64_t)UIView, v28);

      if (v29)
      {
        uint64_t v30 = -[UIPanGestureRecognizer _scrollDeviceCategory](v4);
        _UIScrollViewRubberBandCoefficient(v30);
        double v31 = +[_UIFluidNavigationTransitionsDomain parallaxSettings];
        [v31 rubberBandExtent];
        _UIScrollViewRubberBandOffsetWithoutDecorationForOffset(0, v27, 1.0, 0.0, v32);
        double v27 = v33;
      }
      else if (v27 >= 1.0)
      {
        double v27 = 0.999;
      }
      [(UIPercentDrivenInteractiveTransition *)self updateInteractiveTransition:v27];
      [(_UINavigationInteractiveTransitionBase *)self _updateStatistics:v4 firstSample:0 finalSample:0];
      self->__interactionState = 2;
      break;
    case 3:
      [(_UINavigationInteractiveTransitionBase *)self _updateStatistics:v4 firstSample:0 finalSample:1];
      [(UIPercentDrivenInteractiveTransition *)self duration];
      double v14 = v13;
      [(UIPercentDrivenInteractiveTransition *)self percentComplete];
      double v16 = v15;
      double v34 = 0.0;
      BOOL v17 = [(_UINavigationInteractiveTransitionBase *)self popGesture:v4 withRemainingDuration:&v34 shouldPopWithVelocity:v14];
      self->__interactionState = 3;
      int v18 = v17 ^ ([WeakRetained lastOperation] == 1);
      double v19 = 1.0 - v16;
      if (!v18) {
        double v19 = v16;
      }
      double v20 = v34;
      if (v34 != 0.0)
      {
        double v20 = v14 / (v11 / fabs(v34));
        if (v19 < v20) {
          double v19 = v20;
        }
      }
      -[UIPercentDrivenInteractiveTransition setCompletionSpeed:](self, "setCompletionSpeed:", v19, v20);
      double v21 = [[UICubicTimingParameters alloc] initWithAnimationCurve:[(UIPercentDrivenInteractiveTransition *)self completionCurve]];
      [(UIPercentDrivenInteractiveTransition *)self setTimingCurve:v21];

      BOOL v22 = [(_UINavigationInteractiveTransitionBase *)self _completesTransitionOnEnd];
      if (v18)
      {
        if (v22)
        {
          [(_UINavigationInteractiveTransitionBase *)self finishInteractiveTransition];
          goto LABEL_30;
        }
        self->__stoppedTransitionWasCancelled = 0;
      }
      else
      {
        if (v22) {
          goto LABEL_23;
        }
        self->__stoppedTransitionWasCancelled = 1;
      }
      [(_UINavigationInteractiveTransitionBase *)self _stopInteractiveTransition];
      goto LABEL_30;
    case 4:
      self->__interactionState = 0;
LABEL_23:
      [(_UINavigationInteractiveTransitionBase *)self cancelInteractiveTransition];
LABEL_30:
      if (self->__updateRequestActive)
      {
        _UIUpdateRequestRegistryRemoveRecord((uint64_t)&mainRegistry, __interactiveNavigationUpdateRequest, 0x100029u);
        self->__updateRequestActive = 0;
      }
      break;
    default:
      self->__interactionState = 0;
      [(_UINavigationInteractiveTransitionBase *)self setNotInteractiveTransition];
      break;
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  BOOL v5 = self;
  p_delegate = &self->_delegate;
  id v7 = a4;
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  LOBYTE(v5) = [WeakRetained interactiveTransition:v5 gestureRecognizer:v8 shouldRecognizeSimultaneouslyWithGestureRecognizer:v7];

  return (char)v5;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__parent);
  if (([WeakRetained _isTransitioning] & 1) != 0
    || ([WeakRetained needsDeferredTransition] & 1) != 0
    || self->__transitionWasStopped)
  {
    char v5 = 0;
  }
  else
  {
    id v7 = objc_loadWeakRetained((id *)&self->_delegate);
    char v5 = [v7 shouldBeginInteractiveTransition:self];
  }
  return v5;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    char v9 = [WeakRetained interactiveTransition:self gestureRecognizer:v6 shouldReceiveTouch:v7];
  }
  else {
    char v9 = 1;
  }

  return v9;
}

- (BOOL)wantsInteractiveStart
{
  return self->_wantsInteractiveStart;
}

- (BOOL)_supportsCoordinatedPresentationDismissal
{
  return 1;
}

- (BOOL)shouldReverseTranslation
{
  return self->_shouldReverseTranslation;
}

- (_UINavigationParallaxTransition)animationController
{
  return self->_animationController;
}

- (int64_t)_interactionState
{
  return self->__interactionState;
}

- (BOOL)_transitionWasStopped
{
  return self->__transitionWasStopped;
}

- (void)_setTransitionWasStopped:(BOOL)a3
{
  self->__transitionWasStopped = a3;
}

- (BOOL)_stoppedTransitionWasCancelled
{
  return self->__stoppedTransitionWasCancelled;
}

- (void)_setStoppedTransitionWasCancelled:(BOOL)a3
{
  self->__stoppedTransitionWasCancelled = a3;
}

- (UIViewController)_parent
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__parent);
  return (UIViewController *)WeakRetained;
}

- (void)_setParent:(id)a3
{
}

- (BOOL)_useAugmentedShouldPopDecisionProcedure
{
  return self->__useAugmentedShouldPopDecisionProcedure;
}

- (void)_setUseAugmentedShouldPopDecisionProcedure:(BOOL)a3
{
  self->__useAugmentedShouldPopDecisionProcedure = a3;
}

- (BOOL)_completesTransitionOnEnd
{
  return self->__completesTransitionOnEnd;
}

- (_UINavigationInteractiveTransitionBaseDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_UINavigationInteractiveTransitionBaseDelegate *)WeakRetained;
}

- (unint64_t)sampleCount
{
  return self->_sampleCount;
}

- (void)setSampleCount:(unint64_t)a3
{
  self->_unint64_t sampleCount = a3;
}

- (double)totalDistance
{
  return self->_totalDistance;
}

- (void)setTotalDistance:(double)a3
{
  self->_double totalDistance = a3;
}

- (double)skipTimeStamp
{
  return self->_skipTimeStamp;
}

- (void)setSkipTimeStamp:(double)a3
{
  self->_skipTimeStamp = a3;
}

- (double)previousTimeStamp
{
  return self->_previousTimeStamp;
}

- (void)setPreviousTimeStamp:(double)a3
{
  self->_double previousTimeStamp = a3;
}

- (double)previousDisplacement
{
  return self->_previousDisplacement;
}

- (void)setPreviousDisplacement:(double)a3
{
  self->_previousDisplacement = a3;
}

- (double)previousVelocity
{
  return self->_previousVelocity;
}

- (void)setPreviousVelocity:(double)a3
{
  self->_previousVelocity = a3;
}

- (double)previousAcceleration
{
  return self->_previousAcceleration;
}

- (void)setPreviousAcceleration:(double)a3
{
  self->_double previousAcceleration = a3;
}

- (double)averageVelocity
{
  return self->_averageVelocity;
}

- (void)setAverageVelocity:(double)a3
{
  self->_averageVelocity = a3;
}

- (double)averageAcceleration
{
  return self->_averageAcceleration;
}

- (void)setAverageAcceleration:(double)a3
{
  self->_averageAcceleration = a3;
}

@end