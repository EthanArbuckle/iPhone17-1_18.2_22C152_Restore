@interface UIForceStageInteractionProgress
- (BOOL)completesAtTargetState;
- (UIForceStageInteractionProgress)init;
- (void)_reset;
- (void)dealloc;
- (void)receiveObservedValue:(id)a3;
- (void)setCompletesAtTargetState:(BOOL)a3;
@end

@implementation UIForceStageInteractionProgress

- (UIForceStageInteractionProgress)init
{
  v7.receiver = self;
  v7.super_class = (Class)UIForceStageInteractionProgress;
  v2 = [(UIInteractionProgress *)&v7 init];
  if (v2)
  {
    v3 = [(id)UIApp _forceStageObservable];
    uint64_t v4 = [v3 addObserver:v2];
    observation = v2->_observation;
    v2->_observation = (NSObservation *)v4;
  }
  return v2;
}

- (void)dealloc
{
  v3 = [(id)UIApp _forceStageObservable];
  [v3 removeObservation:self->_observation];

  v4.receiver = self;
  v4.super_class = (Class)UIForceStageInteractionProgress;
  [(UIForceStageInteractionProgress *)&v4 dealloc];
}

- (void)receiveObservedValue:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 stage];
  [v4 touchForce];
  double v7 = v6;
  char v8 = [v4 isReset];

  if ((v8 & 1) != 0
    || ((double v9 = fabs(v7), self->_started) ? (v10 = v5 == 0) : (v10 = 0), v10 ? (v11 = v9 < 2.22044605e-16) : (v11 = 0), v11))
  {
    if (!self->_completed) {
      [(UIInteractionProgress *)self endInteraction:0];
    }
    [(UIForceStageInteractionProgress *)self _reset];
  }
  else if (v9 >= 2.22044605e-16)
  {
    self->_started = 1;
    if (!self->_completed)
    {
      if (!self->_completesAtTargetState || v5 == 0)
      {
        [(UIInteractionProgress *)self setPercentComplete:v7 + (double)v5];
      }
      else
      {
        [(UIInteractionProgress *)self percentComplete];
        if (v13 < 1.0) {
          [(UIInteractionProgress *)self setPercentComplete:1.0];
        }
        self->_completed = 1;
        [(UIInteractionProgress *)self endInteraction:1];
      }
    }
  }
}

- (void)_reset
{
  self->_started = 0;
  self->_completed = 0;
}

- (BOOL)completesAtTargetState
{
  return self->_completesAtTargetState;
}

- (void)setCompletesAtTargetState:(BOOL)a3
{
  self->_completesAtTargetState = a3;
}

- (void).cxx_destruct
{
}

@end