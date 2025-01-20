@interface _UINavigationBarTransitionAssistant
+ (id)popTransitionAssistantForNavigationBar:(id)a3 delegate:(id)a4 crossfade:(BOOL)a5;
+ (id)pushTransitionAssistantForNavigationBar:(id)a3 delegate:(id)a4 crossfade:(BOOL)a5;
- (BOOL)cancelledTransition;
- (BOOL)interactive;
- (BOOL)interruptable;
- (BOOL)needsLifetimeExtended;
- (BOOL)shouldAnimateAlongside;
- (BOOL)shouldCrossfade;
- (BOOL)shouldHideBackButtonDuringTransition;
- (BOOL)shouldUpdatePromptAfterTransition;
- (NSArray)animationIDs;
- (UINavigationBar)navigationBar;
- (UIViewControllerTransitionCoordinator)transitionCoordinator;
- (_UINavigationBarDelegatePrivate)delegate;
- (_UINavigationBarTransitionAssistant)initWithNavigationBar:(id)a3 delegate:(id)a4;
- (double)duration;
- (int64_t)_transitionOverrideFrom:(id)a3 defaultingTo:(int64_t)a4;
- (int64_t)transition;
- (void)_clearAnimationsWithDuration:(double)a3 curve:(int64_t)a4 reverse:(BOOL)a5;
- (void)_finishTrackingAnimations;
- (void)_getInteractive;
- (void)_getPopDurationAndTransitionAlwaysCrossfade:(BOOL)a3;
- (void)_getPushDurationAndTransitionAlwaysCrossfade:(BOOL)a3;
- (void)_getTransitionCoordinator;
- (void)_startTrackingAnimations;
- (void)cancelInteractiveTransitionPercent:(double)a3 completionSpeed:(double)a4 completionCurve:(int64_t)a5;
- (void)decrementAnimationCount;
- (void)finishInteractiveTransitionPercent:(double)a3 completionSpeed:(double)a4 completionCurve:(int64_t)a5;
- (void)finishTrackingInteractiveTransition;
- (void)incrementAnimationCount;
- (void)setNeedsLifetimeExtended:(BOOL)a3;
- (void)setShouldHideBackButtonDuringTransition:(BOOL)a3;
- (void)setShouldUpdatePromptAfterTransition:(BOOL)a3;
- (void)startInteractiveTransition;
- (void)updateInteractiveTransitionPercent:(double)a3;
@end

@implementation _UINavigationBarTransitionAssistant

- (_UINavigationBarTransitionAssistant)initWithNavigationBar:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_UINavigationBarTransitionAssistant;
  v8 = [(_UINavigationBarTransitionAssistant *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_navigationBar, v6);
    objc_storeWeak((id *)&v9->_delegate, v7);
  }

  return v9;
}

+ (id)pushTransitionAssistantForNavigationBar:(id)a3 delegate:(id)a4 crossfade:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = (void *)[objc_alloc((Class)a1) initWithNavigationBar:v9 delegate:v8];

  [v10 _getTransitionCoordinator];
  [v10 _getPushDurationAndTransitionAlwaysCrossfade:v5];
  [v10 _getInteractive];
  return v10;
}

+ (id)popTransitionAssistantForNavigationBar:(id)a3 delegate:(id)a4 crossfade:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = (void *)[objc_alloc((Class)a1) initWithNavigationBar:v9 delegate:v8];

  [v10 _getTransitionCoordinator];
  [v10 _getPopDurationAndTransitionAlwaysCrossfade:v5];
  [v10 _getInteractive];
  return v10;
}

- (BOOL)shouldAnimateAlongside
{
  if (!self->_interruptable) {
    return 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_transitionCoordinator);
  BOOL v3 = WeakRetained != 0;

  return v3;
}

- (BOOL)shouldCrossfade
{
  return self->_transition == 3;
}

- (void)startInteractiveTransition
{
  if (self->_interactive && !self->_interruptable)
  {
    BOOL v3 = [MEMORY[0x1E4F1CA48] array];
    animationIDs = self->_animationIDs;
    self->_animationIDs = v3;

    [(_UINavigationBarTransitionAssistant *)self _startTrackingAnimations];
    if (!+[UIViewPropertyAnimator _canEnableTrackingAnimationsWithAnimators])
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationBar);
      id v6 = [WeakRetained layer];

      [v6 setSpeed:0.0];
      [v6 setTimeOffset:0.0];
    }
  }
}

- (void)updateInteractiveTransitionPercent:(double)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (!self->_interruptable)
  {
    if (+[UIViewPropertyAnimator _canEnableTrackingAnimationsWithAnimators])
    {
      long long v16 = 0u;
      long long v17 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      BOOL v5 = self->_animationIDs;
      uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v15;
        do
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v15 != v8) {
              objc_enumerationMutation(v5);
            }
            v10 = +[UIViewPropertyAnimator _animatorForTrackedAnimationsUUID:*(void *)(*((void *)&v14 + 1) + 8 * i)];
            [v10 pauseAnimation];
            [v10 setFractionComplete:a3];
          }
          uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
        }
        while (v7);
      }
    }
    else
    {
      double v11 = self->_duration * a3;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationBar);
      v12 = [WeakRetained layer];
      [v12 setTimeOffset:v11];
    }
  }
}

- (void)_clearAnimationsWithDuration:(double)a3 curve:(int64_t)a4 reverse:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (+[UIViewPropertyAnimator _canEnableTrackingAnimationsWithAnimators])
  {
    long long v27 = 0uLL;
    long long v28 = 0uLL;
    long long v25 = 0uLL;
    long long v26 = 0uLL;
    id v9 = self->_animationIDs;
    uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v26 != v12) {
            objc_enumerationMutation(v9);
          }
          long long v14 = +[UIViewPropertyAnimator _animatorForTrackedAnimationsUUID:*(void *)(*((void *)&v25 + 1) + 8 * i)];
          long long v15 = [[UICubicTimingParameters alloc] initWithAnimationCurve:a4];
          [v14 setReversed:v5];
          [v14 continueAnimationWithTimingParameters:v15 durationFactor:a3 / self->_duration];
        }
        uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v25 objects:v30 count:16];
      }
      while (v11);
    }
  }
  else
  {
    long long v23 = 0uLL;
    long long v24 = 0uLL;
    long long v21 = 0uLL;
    long long v22 = 0uLL;
    id v9 = self->_animationIDs;
    uint64_t v16 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v21 objects:v29 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v22;
      do
      {
        for (uint64_t j = 0; j != v17; ++j)
        {
          if (*(void *)v22 != v18) {
            objc_enumerationMutation(v9);
          }
          +[UIView _completeAnimationWithUUID:duration:curve:reverse:](UIView, "_completeAnimationWithUUID:duration:curve:reverse:", *(void *)(*((void *)&v21 + 1) + 8 * j), a4, v5, a3, (void)v21);
        }
        uint64_t v17 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v21 objects:v29 count:16];
      }
      while (v17);
    }
  }

  animationIDs = self->_animationIDs;
  self->_animationIDs = 0;
}

- (void)finishInteractiveTransitionPercent:(double)a3 completionSpeed:(double)a4 completionCurve:(int64_t)a5
{
  self->_cancelledTransition = 0;
  if (!self->_interruptable)
  {
    if (+[UIViewPropertyAnimator _canEnableTrackingAnimationsWithAnimators])
    {
      double v9 = (1.0 - a3) * self->_duration / a4;
      [(_UINavigationBarTransitionAssistant *)self _clearAnimationsWithDuration:a5 curve:0 reverse:v9];
    }
    else
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationBar);
      id v14 = [WeakRetained layer];

      double duration = self->_duration;
      [v14 timeOffset];
      [(_UINavigationBarTransitionAssistant *)self _clearAnimationsWithDuration:a5 curve:0 reverse:duration - v12];
      *(float *)&double v13 = a4;
      [v14 setSpeed:v13];
    }
  }
}

- (void)cancelInteractiveTransitionPercent:(double)a3 completionSpeed:(double)a4 completionCurve:(int64_t)a5
{
  self->_cancelledTransition = 1;
  if (!self->_interruptable)
  {
    if (+[UIViewPropertyAnimator _canEnableTrackingAnimationsWithAnimators])
    {
      double v9 = self->_duration * a3 / a4;
      [(_UINavigationBarTransitionAssistant *)self _clearAnimationsWithDuration:a5 curve:1 reverse:v9];
    }
    else
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationBar);
      id v12 = [WeakRetained layer];

      [v12 timeOffset];
      -[_UINavigationBarTransitionAssistant _clearAnimationsWithDuration:curve:reverse:](self, "_clearAnimationsWithDuration:curve:reverse:", a5, 1);
      *(float *)&double v11 = a4;
      [v12 setSpeed:v11];
    }
  }
}

- (void)finishTrackingInteractiveTransition
{
  if (self->_interactive && !self->_interruptable) {
    [(_UINavigationBarTransitionAssistant *)self _finishTrackingAnimations];
  }
}

- (void)_startTrackingAnimations
{
  if (+[UIViewPropertyAnimator _canEnableTrackingAnimationsWithAnimators])
  {
    id v6 = +[UIViewPropertyAnimator _startTrackingAnimations];
    +[UIViewPropertyAnimator _setTrackedAnimationsStartPaused:1];
    animationIDs = self->_animationIDs;
    uint64_t v4 = (uint64_t)v6;
  }
  else
  {
    BOOL v5 = self->_animationIDs;
    uint64_t v4 = +[UIView _startAnimationTracking];
    animationIDs = v5;
    id v6 = (id)v4;
  }
  [(NSMutableArray *)animationIDs addObject:v4];
}

- (void)_finishTrackingAnimations
{
  if (+[UIViewPropertyAnimator _canEnableTrackingAnimationsWithAnimators])
  {
    +[UIViewPropertyAnimator _finishTrackingAnimations];
  }
  else
  {
    +[UIView _finishAnimationTracking];
  }
}

- (void)incrementAnimationCount
{
  if (self->_interactive && !self->_interruptable) {
    ++self->_animationCount;
  }
}

- (void)decrementAnimationCount
{
  if (!self->_interruptable)
  {
    int64_t animationCount = self->_animationCount;
    BOOL v4 = animationCount == 1;
    BOOL v5 = animationCount < 1;
    int64_t v6 = animationCount - 1;
    if (!v5)
    {
      self->_int64_t animationCount = v6;
      if (v4
        && !+[UIViewPropertyAnimator _canEnableTrackingAnimationsWithAnimators])
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationBar);
        id v9 = [WeakRetained layer];

        LODWORD(v8) = 1.0;
        [v9 setSpeed:v8];
        [v9 setBeginTime:0.0];
        [v9 setTimeOffset:0.0];
      }
    }
  }
}

- (void)_getTransitionCoordinator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    char v3 = [WeakRetained _hasInterruptibleNavigationTransition];
  }
  else {
    char v3 = 0;
  }
  self->_interruptable = v3;
  if (objc_opt_respondsToSelector())
  {
    BOOL v4 = [WeakRetained _transitionCoordinator];
    objc_storeWeak((id *)&self->_transitionCoordinator, v4);
  }
}

- (int64_t)_transitionOverrideFrom:(id)a3 defaultingTo:(int64_t)a4
{
  uint64_t v5 = [a3 _navigationBarTransitionVariant];
  int64_t v6 = 4;
  if (v5 != 2) {
    int64_t v6 = a4;
  }
  if (v5 == 1) {
    return 3;
  }
  else {
    return v6;
  }
}

- (void)_getPushDurationAndTransitionAlwaysCrossfade:(BOOL)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0
    && [WeakRetained _willPerformCustomNavigationTransitionForPush])
  {
    if (a3) {
      int64_t v5 = 3;
    }
    else {
      int64_t v5 = [(_UINavigationBarTransitionAssistant *)self _transitionOverrideFrom:WeakRetained defaultingTo:1];
    }
    self->_transition = v5;
    [WeakRetained _customNavigationTransitionDuration];
    self->_double duration = v6;
  }
  if (self->_duration == 0.0)
  {
    +[UINavigationBar defaultAnimationDuration];
    self->_double duration = v7;
  }
}

- (void)_getPopDurationAndTransitionAlwaysCrossfade:(BOOL)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0
    && [WeakRetained _willPerformCustomNavigationTransitionForPop])
  {
    if (a3) {
      int64_t v5 = 3;
    }
    else {
      int64_t v5 = [(_UINavigationBarTransitionAssistant *)self _transitionOverrideFrom:WeakRetained defaultingTo:2];
    }
    self->_transition = v5;
    [WeakRetained _customNavigationTransitionDuration];
    self->_double duration = v6;
  }
  if (self->_duration == 0.0)
  {
    +[UINavigationBar defaultAnimationDuration];
    self->_double duration = v7;
  }
}

- (void)_getInteractive
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_transitionCoordinator);
  self->_interactive = [WeakRetained isInteractive];

  self->_int64_t animationCount = 0;
}

- (UIViewControllerTransitionCoordinator)transitionCoordinator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_transitionCoordinator);
  return (UIViewControllerTransitionCoordinator *)WeakRetained;
}

- (UINavigationBar)navigationBar
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationBar);
  return (UINavigationBar *)WeakRetained;
}

- (_UINavigationBarDelegatePrivate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_UINavigationBarDelegatePrivate *)WeakRetained;
}

- (int64_t)transition
{
  return self->_transition;
}

- (double)duration
{
  return self->_duration;
}

- (BOOL)interruptable
{
  return self->_interruptable;
}

- (BOOL)interactive
{
  return self->_interactive;
}

- (BOOL)needsLifetimeExtended
{
  return self->_needsLifetimeExtended;
}

- (void)setNeedsLifetimeExtended:(BOOL)a3
{
  self->_needsLifetimeExtended = a3;
}

- (BOOL)cancelledTransition
{
  return self->_cancelledTransition;
}

- (BOOL)shouldHideBackButtonDuringTransition
{
  return self->_shouldHideBackButtonDuringTransition;
}

- (void)setShouldHideBackButtonDuringTransition:(BOOL)a3
{
  self->_shouldHideBackButtonDuringTransition = a3;
}

- (BOOL)shouldUpdatePromptAfterTransition
{
  return self->_shouldUpdatePromptAfterTransition;
}

- (void)setShouldUpdatePromptAfterTransition:(BOOL)a3
{
  self->_shouldUpdatePromptAfterTransition = a3;
}

- (NSArray)animationIDs
{
  return &self->_animationIDs->super;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_navigationBar);
  objc_destroyWeak((id *)&self->_transitionCoordinator);
  objc_storeStrong((id *)&self->_animationIDs, 0);
}

@end