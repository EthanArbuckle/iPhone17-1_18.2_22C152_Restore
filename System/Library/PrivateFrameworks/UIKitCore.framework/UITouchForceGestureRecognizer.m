@interface UITouchForceGestureRecognizer
- (BOOL)_hasExceededAllowableMovement;
- (BOOL)_hasExceededMaximumNumberOfTouches;
- (BOOL)_shouldReceiveTouch:(id)a3 forEvent:(id)a4 recognizerView:(id)a5;
- (BOOL)_validateHysteresis;
- (BOOL)canPreventGestureRecognizer:(id)a3;
- (BOOL)isSteady;
- (UITouchForceGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (double)_evaluateAutomaticTouchForceForTimeInterval:(double)a3 actualTouchForce:(double)a4;
- (double)allowableMovement;
- (double)automaticTouchForce;
- (double)automaticTouchForceDuration;
- (double)minimumRequiredTouchForce;
- (double)touchDuration;
- (double)touchForce;
- (double)velocity;
- (id)configurationBlock;
- (unint64_t)maximumNumberOfTouches;
- (void)_beginForContinuousEvaluationForTouches:(id)a3;
- (void)_endContinuousEvaluation;
- (void)_endIfNeeded:(BOOL)a3;
- (void)_evaluateTouches:(id)a3 withEvent:(id)a4;
- (void)_evaluateWithTouchForce:(double)a3 centroidAtLocation:(CGPoint)a4;
- (void)_updateForContinuousEvaluation:(id)a3;
- (void)_updateTouchForce:(double)a3;
- (void)reset;
- (void)setAllowableMovement:(double)a3;
- (void)setAutomaticTouchForce:(double)a3;
- (void)setAutomaticTouchForceDuration:(double)a3;
- (void)setConfigurationBlock:(id)a3;
- (void)setMaximumNumberOfTouches:(unint64_t)a3;
- (void)setMinimumRequiredTouchForce:(double)a3;
- (void)setSteady:(BOOL)a3;
- (void)setTouchForce:(double)a3;
- (void)setVelocity:(double)a3;
- (void)setView:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation UITouchForceGestureRecognizer

- (UITouchForceGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  v10.receiver = self;
  v10.super_class = (Class)UITouchForceGestureRecognizer;
  v4 = [(UIGestureRecognizer *)&v10 initWithTarget:a3 action:a4];
  v5 = v4;
  if (v4)
  {
    v4->_touchForce = 0.0;
    v4->_minimumRequiredTouchForce = 0.0;
    v4->_allowableMovement = 10.0;
    v4->_maximumNumberOfTouches = 0;
    v6 = objc_alloc_init(_UIVelocityIntegrator);
    [(_UIVelocityIntegrator *)v6 setMinimumRequiredMovement:0.0];
    velocityIntegrator = v5->_velocityIntegrator;
    v5->_velocityIntegrator = v6;

    v5->_velocity = 0.0;
    v5->_steady = 1;
    v5->_automaticTouchForce = 0.0;
    v5->_automaticTouchForceDuration = 0.5;
    [(UIGestureRecognizer *)v5 setAllowedTouchTypes:&unk_1ED3EFCE0];
    [(UIGestureRecognizer *)v5 setAllowedPressTypes:MEMORY[0x1E4F1CBF0]];
    [(UIGestureRecognizer *)v5 setCancelsTouchesInView:0];
    v8 = v5;
  }

  return v5;
}

- (void)setView:(id)a3
{
  if (!a3)
  {
    [(CADisplayLink *)self->_continuousEvaluationDisplayLink invalidate];
    continuousEvaluationDisplayLink = self->_continuousEvaluationDisplayLink;
    self->_continuousEvaluationDisplayLink = 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)UITouchForceGestureRecognizer;
  [(UIGestureRecognizer *)&v6 setView:a3];
}

- (void)reset
{
  v5.receiver = self;
  v5.super_class = (Class)UITouchForceGestureRecognizer;
  [(UIGestureRecognizer *)&v5 reset];
  currentTouches = self->_currentTouches;
  self->_currentTouches = 0;

  self->_touchForce = 0.0;
  self->_currentTouchForce = 0.0;
  self->_eventTouchCount = 0;
  self->_touchesBeganTimestamp = 0.0;
  CGPoint v4 = (CGPoint)vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
  self->_initialCentroidOfTouches = v4;
  self->_currentCentroidOfTouches = v4;
  [(_UIVelocityIntegrator *)self->_velocityIntegrator reset];
  self->_velocity = 0.0;
  self->_steady = 1;
  [(UITouchForceGestureRecognizer *)self _endContinuousEvaluation];
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  currentTouches = self->_currentTouches;
  if (currentTouches)
  {
    [(NSMutableSet *)currentTouches unionSet:a3];
  }
  else
  {
    v8 = (NSMutableSet *)[a3 mutableCopy];
    v9 = self->_currentTouches;
    self->_currentTouches = v8;

    objc_super v10 = [a3 anyObject];
    [v10 timestamp];
    self->_touchesBeganTimestamp = v11;

    self->_currentCentroidOfTouches.x = _CentroidOfTouches(a3, 0);
    self->_currentCentroidOfTouches.y = v12;
    self->_initialCentroidOfTouches = self->_currentCentroidOfTouches;
    [(UITouchForceGestureRecognizer *)self _beginForContinuousEvaluationForTouches:a3];
  }
  [(UITouchForceGestureRecognizer *)self _evaluateTouches:a3 withEvent:a4];
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v6 = a3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v21;
    while (2)
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        if (-[UITouch _mightBeConsideredForForceSystemGesture](*(void **)(*((void *)&v20 + 1) + 8 * v10)))
        {
          long long v18 = 0u;
          long long v19 = 0u;
          long long v16 = 0u;
          long long v17 = 0u;
          double v11 = self->_currentTouches;
          uint64_t v12 = [(NSMutableSet *)v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
          if (v12)
          {
            uint64_t v13 = v12;
            uint64_t v14 = *(void *)v17;
            do
            {
              uint64_t v15 = 0;
              do
              {
                if (*(void *)v17 != v14) {
                  objc_enumerationMutation(v11);
                }
                -[UIGestureRecognizer ignoreTouch:forEvent:](self, "ignoreTouch:forEvent:", *(void *)(*((void *)&v16 + 1) + 8 * v15++), a4, (void)v16);
              }
              while (v13 != v15);
              uint64_t v13 = [(NSMutableSet *)v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
            }
            while (v13);
          }

          [(NSMutableSet *)self->_currentTouches removeAllObjects];
          [(UITouchForceGestureRecognizer *)self _endIfNeeded:1];

          return;
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  [(UITouchForceGestureRecognizer *)self _evaluateTouches:v6 withEvent:a4];
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  -[NSMutableSet minusSet:](self->_currentTouches, "minusSet:", a3, a4);
  if (![(NSMutableSet *)self->_currentTouches count])
  {
    BOOL v5 = [(UITouchForceGestureRecognizer *)self _validateHysteresis];
    [(UITouchForceGestureRecognizer *)self _endIfNeeded:v5];
  }
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  -[NSMutableSet minusSet:](self->_currentTouches, "minusSet:", a3, a4);
  if (![(NSMutableSet *)self->_currentTouches count])
  {
    [(UITouchForceGestureRecognizer *)self _endIfNeeded:1];
  }
}

- (BOOL)canPreventGestureRecognizer:(id)a3
{
  return 0;
}

- (BOOL)_shouldReceiveTouch:(id)a3 forEvent:(id)a4 recognizerView:(id)a5
{
  if (-[UITouch _mightBeConsideredForForceSystemGesture](a3)) {
    return 0;
  }
  configurationBlock = (void (**)(id, UITouchForceGestureRecognizer *))self->_configurationBlock;
  if (configurationBlock) {
    configurationBlock[2](configurationBlock, self);
  }
  [(UITouchForceGestureRecognizer *)self automaticTouchForce];
  if (v10 == 0.0)
  {
    double v11 = [a3 view];
    uint64_t v12 = [v11 traitCollection];
    uint64_t v13 = [v12 forceTouchCapability];

    if (v13 != 2) {
      return 0;
    }
  }
  v15.receiver = self;
  v15.super_class = (Class)UITouchForceGestureRecognizer;
  return [(UIGestureRecognizer *)&v15 _shouldReceiveTouch:a3 forEvent:a4 recognizerView:a5];
}

- (void)_evaluateTouches:(id)a3 withEvent:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if ([a3 count])
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v7 = a3;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v19;
      double v11 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v7);
          }
          objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "force", (void)v18);
          double v11 = v11 + v13;
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v9);
    }
    else
    {
      double v11 = 0.0;
    }

    double v14 = v11 / (double)(unint64_t)[v7 count];
  }
  else
  {
    double v14 = 0.0;
  }
  self->_currentCentroidOfTouches.x = _CentroidOfTouches(a3, 0);
  self->_currentCentroidOfTouches.y = v15;
  self->_currentTouchForce = v14;
  long long v16 = [a4 allTouches];
  self->_eventTouchCount = [v16 count];

  long long v17 = [a3 anyObject];
  [v17 timestamp];
  -[UITouchForceGestureRecognizer _evaluateAutomaticTouchForceForTimeInterval:actualTouchForce:](self, "_evaluateAutomaticTouchForceForTimeInterval:actualTouchForce:");
  -[UITouchForceGestureRecognizer _evaluateWithTouchForce:centroidAtLocation:](self, "_evaluateWithTouchForce:centroidAtLocation:");
}

- (void)_evaluateWithTouchForce:(double)a3 centroidAtLocation:(CGPoint)a4
{
  if ([(UITouchForceGestureRecognizer *)self _validateHysteresis])
  {
    [(UITouchForceGestureRecognizer *)self _updateTouchForce:a3];
    [(UITouchForceGestureRecognizer *)self _endIfNeeded:1];
  }
  else
  {
    UIGestureRecognizerState v6 = [(UIGestureRecognizer *)self state];
    if ((unint64_t)(v6 - 3) < 3)
    {
      double v9 = 0.0;
      uint64_t v10 = self;
    }
    else
    {
      if ((unint64_t)(v6 - 1) >= 2)
      {
        if (v6 || self->_minimumRequiredTouchForce > a3) {
          return;
        }
        id v7 = self;
        uint64_t v8 = 1;
      }
      else
      {
        id v7 = self;
        uint64_t v8 = 2;
      }
      [(UIGestureRecognizer *)v7 setState:v8];
      uint64_t v10 = self;
      double v9 = a3;
    }
    [(UITouchForceGestureRecognizer *)v10 _updateTouchForce:v9];
  }
}

- (void)_endIfNeeded:(BOOL)a3
{
  BOOL v3 = a3;
  UIGestureRecognizerState v5 = [(UIGestureRecognizer *)self state];
  if ((unint64_t)(v5 - 3) < 3)
  {
LABEL_7:
    [(UITouchForceGestureRecognizer *)self _updateTouchForce:0.0];
    goto LABEL_8;
  }
  if ((unint64_t)(v5 - 1) < 2)
  {
    if (v3) {
      uint64_t v6 = 4;
    }
    else {
      uint64_t v6 = 3;
    }
    [(UIGestureRecognizer *)self setState:v6];
    goto LABEL_7;
  }
  if (v5 == UIGestureRecognizerStatePossible) {
    [(UIGestureRecognizer *)self setState:5];
  }
LABEL_8:
  [(UITouchForceGestureRecognizer *)self _endContinuousEvaluation];
}

- (void)_updateTouchForce:(double)a3
{
  -[UITouchForceGestureRecognizer setTouchForce:](self, "setTouchForce:");
  double v5 = 0.0;
  -[_UIVelocityIntegrator addSample:](self->_velocityIntegrator, "addSample:", 0.0, a3);
  if ([(_UIVelocityIntegrator *)self->_velocityIntegrator hasVelocity])
  {
    [(_UIVelocityIntegrator *)self->_velocityIntegrator velocity];
    double v5 = v6;
  }
  [(UITouchForceGestureRecognizer *)self setVelocity:v5];
  [(UITouchForceGestureRecognizer *)self velocity];
  if (v7 != 0.0)
  {
    float v8 = v7 * 100.0;
    double v7 = roundf(v8) / 100.0;
  }
  [(UITouchForceGestureRecognizer *)self setSteady:v7 == 0.0];
}

- (BOOL)_hasExceededAllowableMovement
{
  double allowableMovement = self->_allowableMovement;
  if (allowableMovement <= 0.0) {
    return 0;
  }
  float64x2_t v3 = vsubq_f64((float64x2_t)self->_currentCentroidOfTouches, (float64x2_t)self->_initialCentroidOfTouches);
  double v4 = sqrt(vaddvq_f64(vmulq_f64(v3, v3)));
  if (v4 >= allowableMovement) {
    double v4 = self->_allowableMovement;
  }
  return v4 / allowableMovement >= 1.0;
}

- (BOOL)_hasExceededMaximumNumberOfTouches
{
  unint64_t v3 = [(UITouchForceGestureRecognizer *)self maximumNumberOfTouches];
  if (v3) {
    LOBYTE(v3) = self->_eventTouchCount > v3;
  }
  return v3;
}

- (BOOL)_validateHysteresis
{
  if ([(UITouchForceGestureRecognizer *)self _hasExceededAllowableMovement]) {
    return 1;
  }
  return [(UITouchForceGestureRecognizer *)self _hasExceededMaximumNumberOfTouches];
}

- (void)_beginForContinuousEvaluationForTouches:(id)a3
{
  continuousEvaluationDisplayLink = self->_continuousEvaluationDisplayLink;
  if (!continuousEvaluationDisplayLink)
  {
    double v5 = [a3 anyObject];
    double v6 = [v5 view];
    double v7 = [v6 window];
    float v8 = [v7 screen];

    if (!v8)
    {
      float v8 = +[UIScreen mainScreen];
    }
    double v9 = [v8 displayLinkWithTarget:self selector:sel__updateForContinuousEvaluation_];
    uint64_t v10 = self->_continuousEvaluationDisplayLink;
    self->_continuousEvaluationDisplayLink = v9;

    double v11 = self->_continuousEvaluationDisplayLink;
    uint64_t v12 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
    [(CADisplayLink *)v11 addToRunLoop:v12 forMode:*MEMORY[0x1E4F1C4B0]];

    continuousEvaluationDisplayLink = self->_continuousEvaluationDisplayLink;
  }
  [(CADisplayLink *)continuousEvaluationDisplayLink setPaused:0];
}

- (void)_updateForContinuousEvaluation:(id)a3
{
  [(UITouchForceGestureRecognizer *)self _evaluateAutomaticTouchForceForTimeInterval:CACurrentMediaTime() actualTouchForce:self->_currentTouchForce];
  -[UITouchForceGestureRecognizer _evaluateWithTouchForce:centroidAtLocation:](self, "_evaluateWithTouchForce:centroidAtLocation:");
}

- (void)_endContinuousEvaluation
{
}

- (double)_evaluateAutomaticTouchForceForTimeInterval:(double)a3 actualTouchForce:(double)a4
{
  double automaticTouchForce = self->_automaticTouchForce;
  if (automaticTouchForce > 0.0)
  {
    double v5 = automaticTouchForce * ((a3 - self->_touchesBeganTimestamp) / self->_automaticTouchForceDuration);
    if (v5 >= a4) {
      return v5;
    }
  }
  return a4;
}

- (double)touchDuration
{
  double result = 0.0;
  if (self->_touchesBeganTimestamp < 978307200.0)
  {
    objc_msgSend(MEMORY[0x1E4F1C9C8], "timeIntervalSinceReferenceDate", 0.0);
    return v4 - self->_touchesBeganTimestamp;
  }
  return result;
}

- (double)touchForce
{
  return self->_touchForce;
}

- (void)setTouchForce:(double)a3
{
  self->_touchForce = a3;
}

- (double)minimumRequiredTouchForce
{
  return self->_minimumRequiredTouchForce;
}

- (void)setMinimumRequiredTouchForce:(double)a3
{
  self->_minimumRequiredTouchForce = a3;
}

- (double)velocity
{
  return self->_velocity;
}

- (void)setVelocity:(double)a3
{
  self->_velocity = a3;
}

- (BOOL)isSteady
{
  return self->_steady;
}

- (void)setSteady:(BOOL)a3
{
  self->_steady = a3;
}

- (double)allowableMovement
{
  return self->_allowableMovement;
}

- (void)setAllowableMovement:(double)a3
{
  self->_double allowableMovement = a3;
}

- (unint64_t)maximumNumberOfTouches
{
  return self->_maximumNumberOfTouches;
}

- (void)setMaximumNumberOfTouches:(unint64_t)a3
{
  self->_maximumNumberOfTouches = a3;
}

- (double)automaticTouchForce
{
  return self->_automaticTouchForce;
}

- (void)setAutomaticTouchForce:(double)a3
{
  self->_double automaticTouchForce = a3;
}

- (double)automaticTouchForceDuration
{
  return self->_automaticTouchForceDuration;
}

- (void)setAutomaticTouchForceDuration:(double)a3
{
  self->_automaticTouchForceDuration = a3;
}

- (id)configurationBlock
{
  return self->_configurationBlock;
}

- (void)setConfigurationBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_configurationBlock, 0);
  objc_storeStrong((id *)&self->_velocityIntegrator, 0);
  objc_storeStrong((id *)&self->_currentTouches, 0);
  objc_storeStrong((id *)&self->_continuousEvaluationDisplayLink, 0);
}

@end