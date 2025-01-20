@interface _UISteadyTouchForceGestureRecognizer
- (_UISteadyTouchForceGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (double)minimumSteadyTouchForceDuration;
- (void)_adjustSteadyForceDurationIfNeeded:(id)a3 event:(id)a4;
- (void)_beginForContinuousEvaluationForTouches:(id)a3;
- (void)_endContinuousEvaluation;
- (void)_evaluateTouches:(id)a3;
- (void)_evaluateWithTouchForce:(double)a3;
- (void)_updateForContinuousEvaluation:(id)a3;
- (void)cancel;
- (void)recognize;
- (void)reset;
- (void)setMinimumSteadyTouchForceDuration:(double)a3;
- (void)setView:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
@end

@implementation _UISteadyTouchForceGestureRecognizer

- (_UISteadyTouchForceGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  v11.receiver = self;
  v11.super_class = (Class)_UISteadyTouchForceGestureRecognizer;
  v4 = [(UIGestureRecognizer *)&v11 initWithTarget:a3 action:a4];
  v5 = v4;
  if (v4)
  {
    v4->_minimumSteadyTouchForceDuration = 0.4;
    v6 = v4;
    v7 = objc_alloc_init(_UIVelocityIntegrator);
    [(_UIVelocityIntegrator *)v7 setMinimumRequiredMovement:0.0];
    velocityIntegrator = v6->_velocityIntegrator;
    v6->_velocityIntegrator = v7;

    [(UIGestureRecognizer *)v6 setAllowedTouchTypes:&unk_1ED3F0CA0];
    [(UIGestureRecognizer *)v6 setAllowedPressTypes:MEMORY[0x1E4F1CBF0]];

    v9 = v6;
  }

  return v5;
}

- (void)setView:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    [(CADisplayLink *)self->_continuousEvaluationDisplayLink invalidate];
    continuousEvaluationDisplayLink = self->_continuousEvaluationDisplayLink;
    self->_continuousEvaluationDisplayLink = 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)_UISteadyTouchForceGestureRecognizer;
  [(UIGestureRecognizer *)&v6 setView:v4];
}

- (void)recognize
{
  if ([(UIGestureRecognizer *)self state] == UIGestureRecognizerStatePossible) {
    [(UIGestureRecognizer *)self setState:3];
  }
  [(_UISteadyTouchForceGestureRecognizer *)self _endContinuousEvaluation];
}

- (void)cancel
{
  UIGestureRecognizerState v3 = [(UIGestureRecognizer *)self state];
  if ((unint64_t)v3 <= UIGestureRecognizerStateChanged) {
    [(UIGestureRecognizer *)self setState:qword_186B9B508[v3]];
  }
  [(_UISteadyTouchForceGestureRecognizer *)self _endContinuousEvaluation];
}

- (double)minimumSteadyTouchForceDuration
{
  uint64_t v2 = 2;
  if (!self->_useOverridingMinimumDuration) {
    uint64_t v2 = 3;
  }
  return *(double *)((char *)&self->super.super.isa
                   + OBJC_IVAR____UISteadyTouchForceGestureRecognizer__continuousEvaluationDisplayLink[v2]);
}

- (void)reset
{
  v4.receiver = self;
  v4.super_class = (Class)_UISteadyTouchForceGestureRecognizer;
  [(UIGestureRecognizer *)&v4 reset];
  [(_UIVelocityIntegrator *)self->_velocityIntegrator reset];
  self->_currentTouchForce = 0.0;
  steadyTimestamp = self->_steadyTimestamp;
  self->_steadyTimestamp = 0;

  self->_useOverridingMinimumDuration = 0;
  [(_UISteadyTouchForceGestureRecognizer *)self _endContinuousEvaluation];
}

- (void)_adjustSteadyForceDurationIfNeeded:(id)a3 event:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v7 = [a3 valueForKey:@"window"];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        v13 = objc_msgSend(v6, "_gestureRecognizersForWindow:", v12, 0);
        uint64_t v14 = [v13 countByEnumeratingWithState:&v18 objects:v26 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v19;
          while (2)
          {
            for (uint64_t j = 0; j != v15; ++j)
            {
              if (*(void *)v19 != v16) {
                objc_enumerationMutation(v13);
              }
              if (_isDragInteractionGestureRecognizer(*(void **)(*((void *)&v18 + 1) + 8 * j)))
              {
                self->_overrideMinimumSteadyTouchForceDuration = 0.125;
                self->_useOverridingMinimumDuration = 1;

                goto LABEL_18;
              }
            }
            uint64_t v15 = [v13 countByEnumeratingWithState:&v18 objects:v26 count:16];
            if (v15) {
              continue;
            }
            break;
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v9);
  }
LABEL_18:
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  [(_UISteadyTouchForceGestureRecognizer *)self _adjustSteadyForceDurationIfNeeded:v6 event:a4];
  [(_UISteadyTouchForceGestureRecognizer *)self _evaluateTouches:v6];
  [(_UISteadyTouchForceGestureRecognizer *)self _beginForContinuousEvaluationForTouches:v6];
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = [(UIGestureRecognizer *)self _allActiveTouches];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    while (2)
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        if ([*(id *)(*((void *)&v10 + 1) + 8 * v9) phase] < 3)
        {

          return;
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  [(_UISteadyTouchForceGestureRecognizer *)self cancel];
}

- (void)_evaluateTouches:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      double v9 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "force", (void)v13);
          double v9 = v9 + v11;
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }
    else
    {
      double v9 = 0.0;
    }

    double v12 = v9 / (double)(unint64_t)[v5 count];
  }
  else
  {
    double v12 = 0.0;
  }

  [(_UISteadyTouchForceGestureRecognizer *)self _evaluateWithTouchForce:v12];
  self->_currentTouchForce = v12;
}

- (void)_evaluateWithTouchForce:(double)a3
{
  -[_UIVelocityIntegrator addSample:](self->_velocityIntegrator, "addSample:", 0.0, a3);
  if (![(_UIVelocityIntegrator *)self->_velocityIntegrator hasVelocity]) {
    goto LABEL_6;
  }
  [(_UIVelocityIntegrator *)self->_velocityIntegrator velocity];
  if (v4 != 0.0)
  {
    float v5 = fabs(v4) * 100.0;
    double v4 = roundf(v5) / 100.0;
  }
  if (v4 > 0.5)
  {
    steadyTimestamp = self->_steadyTimestamp;
    self->_steadyTimestamp = 0;
  }
  else
  {
LABEL_6:
    uint64_t v7 = [MEMORY[0x1E4F1C9C8] date];
    obuint64_t j = v7;
    if (self->_steadyTimestamp)
    {
      -[NSDate timeIntervalSinceDate:](v7, "timeIntervalSinceDate:");
      double v9 = v8;
      [(_UISteadyTouchForceGestureRecognizer *)self minimumSteadyTouchForceDuration];
      if (v9 >= v10) {
        [(_UISteadyTouchForceGestureRecognizer *)self recognize];
      }
    }
    else
    {
      objc_storeStrong((id *)&self->_steadyTimestamp, v7);
    }
    steadyTimestamp = obj;
  }
}

- (void)_beginForContinuousEvaluationForTouches:(id)a3
{
  continuousEvaluationDisplayLink = self->_continuousEvaluationDisplayLink;
  if (!continuousEvaluationDisplayLink)
  {
    float v5 = [a3 anyObject];
    uint64_t v6 = [v5 view];
    uint64_t v7 = [v6 window];
    double v8 = [v7 screen];

    if (!v8)
    {
      double v8 = +[UIScreen mainScreen];
    }
    double v9 = [v8 displayLinkWithTarget:self selector:sel__updateForContinuousEvaluation_];
    double v10 = self->_continuousEvaluationDisplayLink;
    self->_continuousEvaluationDisplayLink = v9;

    double v11 = self->_continuousEvaluationDisplayLink;
    double v12 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
    [(CADisplayLink *)v11 addToRunLoop:v12 forMode:*MEMORY[0x1E4F1C4B0]];

    continuousEvaluationDisplayLink = self->_continuousEvaluationDisplayLink;
  }
  [(CADisplayLink *)continuousEvaluationDisplayLink setPaused:0];
}

- (void)_updateForContinuousEvaluation:(id)a3
{
}

- (void)_endContinuousEvaluation
{
}

- (void)setMinimumSteadyTouchForceDuration:(double)a3
{
  self->_minimumSteadyTouchForceDuration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_steadyTimestamp, 0);
  objc_storeStrong((id *)&self->_velocityIntegrator, 0);
  objc_storeStrong((id *)&self->_continuousEvaluationDisplayLink, 0);
}

@end