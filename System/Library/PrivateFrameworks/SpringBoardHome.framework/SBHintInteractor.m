@interface SBHintInteractor
- (BOOL)supportsRestarting;
- (SBHintInteractor)initWithInteractionProgress:(id)a3 maxHintProgress:(double)a4;
- (UIInteractionProgress)interactionProgress;
- (double)maxHintProgress;
- (void)_updateInteractionPercentComplete:(double)a3;
- (void)cancelTransition;
- (void)finishInteractiveTransition;
- (void)interactionProgress:(id)a3 didEnd:(BOOL)a4;
- (void)interactionProgressDidUpdate:(id)a3;
- (void)startInteractiveTransition:(id)a3;
- (void)updateTransition:(double)a3;
@end

@implementation SBHintInteractor

- (SBHintInteractor)initWithInteractionProgress:(id)a3 maxHintProgress:(double)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBHintInteractor;
  v8 = [(SBHintInteractor *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_interactionProgress, a3);
    v9->_hintInterval.start.value = 0.0;
    v9->_hintInterval.start.inclusive = 1;
    *(_DWORD *)(&v9->_hintInterval.start.inclusive + 1) = 0;
    *((_DWORD *)&v9->_hintInterval.start.inclusive + 1) = 0;
    v9->_hintInterval.end.value = a4;
    v9->_hintInterval.end.inclusive = 1;
    *(_DWORD *)(&v9->_hintInterval.end.inclusive + 1) = 0;
    *((_DWORD *)&v9->_hintInterval.end.inclusive + 1) = 0;
  }

  return v9;
}

- (double)maxHintProgress
{
  BSIntervalMax();
  return result;
}

- (void)startInteractiveTransition:(id)a3
{
  objc_storeStrong((id *)&self->_transitionContext, a3);
  id v4 = [(SBHintInteractor *)self interactionProgress];
  [v4 addProgressObserver:self];
  [v4 percentComplete];
  -[SBHintInteractor _updateInteractionPercentComplete:](self, "_updateInteractionPercentComplete:");
}

- (void)updateTransition:(double)a3
{
}

- (void)cancelTransition
{
}

- (void)finishInteractiveTransition
{
}

- (BOOL)supportsRestarting
{
  return 1;
}

- (void)interactionProgressDidUpdate:(id)a3
{
  [a3 percentComplete];
  -[SBHintInteractor _updateInteractionPercentComplete:](self, "_updateInteractionPercentComplete:");
}

- (void)interactionProgress:(id)a3 didEnd:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([(SBViewControllerContextTransitioning *)self->_transitionContext isInteractive])
  {
    [v6 removeProgressObserver:self];
    if (v4) {
      [(SBHintInteractor *)self finishInteractiveTransition];
    }
    else {
      [(SBHintInteractor *)self cancelTransition];
    }
  }
}

- (void)_updateInteractionPercentComplete:(double)a3
{
  $7E91319A363487CF65E71AD37A9CF470 hintInterval = self->_hintInterval;
  BSIntervalValueForFraction();
  double v5 = v4;
  [(SBViewControllerContextTransitioning *)self->_transitionContext percentComplete];
  if ((BSFloatEqualToFloat() & 1) == 0)
  {
    if ([(SBViewControllerContextTransitioning *)self->_transitionContext isInteractive]) {
      [(SBHintInteractor *)self updateTransition:v5];
    }
  }
}

- (UIInteractionProgress)interactionProgress
{
  return self->_interactionProgress;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interactionProgress, 0);
  objc_storeStrong((id *)&self->_transitionContext, 0);
}

@end