@interface _UIPreviewInteractionStateRecognizer
- (BOOL)shouldDelayReveal;
- (_UIPreviewInteractionStateRecognizer)init;
- (double)_currentTouchForceMultiplier;
- (double)_denormalizedTouchForceValue:(double)a3;
- (double)_normalizedTouchForceValue:(double)a3;
- (double)_thresholdForForceLevel:(int64_t)a3;
- (double)currentProgressToState:(int64_t)a3;
- (double)currentTouchForce;
- (double)minimumPreviewDuration;
- (double)velocity;
- (id)description;
- (int64_t)currentState;
- (void)dealloc;
- (void)evaluateWithTouchForce:(double)a3 atTimestamp:(double)a4 withCentroidAtLocation:(CGPoint)a5;
- (void)reset;
- (void)setCurrentState:(int64_t)a3;
- (void)setCurrentTouchForce:(double)a3;
- (void)setMinimumPreviewDuration:(double)a3;
- (void)setShouldDelayReveal:(BOOL)a3;
@end

@implementation _UIPreviewInteractionStateRecognizer

- (_UIPreviewInteractionStateRecognizer)init
{
  v7.receiver = self;
  v7.super_class = (Class)_UIPreviewInteractionStateRecognizer;
  v2 = [(_UIPreviewInteractionStateRecognizer *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_shouldDelayReveal = 1;
    *(_OWORD *)&v2->_standardThreshold = xmmword_186B9B4D0;
    v2->_minimumPreviewDuration = 0.075;
    *(_OWORD *)&v2->_popOffsetInitial = xmmword_186B9B4E0;
    *(_OWORD *)&v2->_popOffsetDecayAlpha = xmmword_186B9B4F0;
    v2->_popReductionForce = 60.0;
    v2->_popAlwaysThreshold = 5000.0;
    [(_UIPreviewInteractionStateRecognizer *)v2 reset];
    v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 addObserver:v3 selector:sel__accessibilityForceSensitivityChanged_ name:@"UIAccessibilityForceTouchSensitivityChangedNotification" object:0];

    v5 = v3;
  }

  return v3;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:@"UIAccessibilityForceTouchSensitivityChangedNotification" object:0];

  v4.receiver = self;
  v4.super_class = (Class)_UIPreviewInteractionStateRecognizer;
  [(_UIPreviewInteractionStateRecognizer *)&v4 dealloc];
}

- (id)description
{
  v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)_UIPreviewInteractionStateRecognizer;
  objc_super v4 = [(_UIPreviewInteractionStateRecognizer *)&v9 description];
  int64_t v5 = [(_UIPreviewInteractionStateRecognizer *)self currentState];
  if ((unint64_t)(v5 - 1) > 2) {
    v6 = @"_UILegacyPreviewInteractionStateInactive";
  }
  else {
    v6 = off_1E5300420[v5 - 1];
  }
  objc_super v7 = [v3 stringWithFormat:@"%@ {currentState = %@}", v4, v6];

  return v7;
}

- (void)setShouldDelayReveal:(BOOL)a3
{
  if (self->_shouldDelayReveal != a3)
  {
    self->_shouldDelayReveal = a3;
    [(_UIPreviewInteractionStateRecognizer *)self reset];
  }
}

- (double)currentProgressToState:(int64_t)a3
{
  double result = 0.0;
  if ((unint64_t)a3 >= 2)
  {
    if (a3 == 3)
    {
      return self->_progressToStrongThreshold;
    }
    else
    {
      [(_UIPreviewInteractionStateRecognizer *)self _thresholdForForceLevel:0.0];
      double v6 = v5;
      [(_UIPreviewInteractionStateRecognizer *)self currentTouchForce];
      double v8 = v7;
      [(_UIPreviewInteractionStateRecognizer *)self _thresholdForForceLevel:1];
      double v10 = v6 - v9;
      double result = 1.0;
      if (v10 > 0.0) {
        return 1.0 - (v6 - v8) / v10;
      }
    }
  }
  return result;
}

- (double)velocity
{
  double v2 = self->_currentTime - self->_previousTime;
  double result = 0.0;
  if (v2 > 0.00000011920929)
  {
    [(_UIPreviewInteractionStateRecognizer *)self currentTouchForce];
    double v6 = v5;
    [(_UIPreviewInteractionStateRecognizer *)self _normalizedTouchForceValue:self->_previousEffectiveTouchForce];
    return (v6 * 0.25 + v7 * 0.75) / v2;
  }
  return result;
}

- (void)evaluateWithTouchForce:(double)a3 atTimestamp:(double)a4 withCentroidAtLocation:(CGPoint)a5
{
  -[_UIPreviewInteractionStateRecognizer _denormalizedTouchForceValue:](self, "_denormalizedTouchForceValue:", a3, a4, a5.x, a5.y);
  if (v7 <= self->_saturationForce) {
    double saturationForce = v7;
  }
  else {
    double saturationForce = self->_saturationForce;
  }
  double timeMark = self->_timeMark;
  if (timeMark == 0.0)
  {
    self->_double timeMark = a4;
    double timeMark = a4;
    double currentTime = a4;
  }
  else
  {
    double currentTime = self->_currentTime;
  }
  self->_double currentTime = a4;
  self->_previousTime = currentTime;
  double v11 = a4 - currentTime;
  double smoothedForce = self->_smoothedForce;
  double maximumForce = self->_maximumForce;
  if (saturationForce >= maximumForce) {
    double v14 = saturationForce;
  }
  else {
    double v14 = self->_maximumForce;
  }
  self->_double maximumForce = v14;
  self->_previousEffectiveTouchForce = saturationForce;
  double v15 = saturationForce;
  if (saturationForce > smoothedForce)
  {
    float lowpassForceAlpha = self->_lowpassForceAlpha;
    float v17 = v11 / 0.00800000038;
    double v18 = powf(lowpassForceAlpha, v17);
    double v15 = smoothedForce * v18 + saturationForce * (1.0 - v18);
  }
  self->_double smoothedForce = v15;
  [(_UIPreviewInteractionStateRecognizer *)self _normalizedTouchForceValue:saturationForce];
  -[_UIPreviewInteractionStateRecognizer setCurrentTouchForce:](self, "setCurrentTouchForce:");
  unint64_t deepPressCount = self->_deepPressCount;
  if (deepPressCount)
  {
    double actualPeekTime = self->_actualPeekTime;
    if (actualPeekTime < self->_actualPopTime) {
      double actualPeekTime = self->_actualPopTime;
    }
    double v21 = self->_minimumPreviewDuration + actualPeekTime;
    double v22 = self->_currentTime;
    if (self->_allowsPopOffsetDecay
      || (v21 >= v22 ? (BOOL v23 = saturationForce + self->_popReductionForce < self->_maximumForce) : (BOOL v23 = 1), v23))
    {
      self->_allowsPopOffsetDecay = 1;
    }
    else
    {
      self->_popDecayingOffset = self->_popOffsetInitial;
    }
    if (v21 >= v22)
    {
      double highPopThreshold = self->_highPopThreshold;
      if (self->_strongThreshold >= highPopThreshold) {
        double highPopThreshold = self->_strongThreshold;
      }
    }
    else
    {
      float popOffsetDecayAlpha = self->_popOffsetDecayAlpha;
      float v26 = v11 / 0.00800000038;
      double v27 = powf(popOffsetDecayAlpha, v26);
      double previousPopThreshold = self->_previousPopThreshold;
      double popOffsetLongterm = self->_popOffsetLongterm;
      double v30 = self->_smoothedForce;
      double v31 = self->_saturationForce + -15.0 + popOffsetLongterm * -0.5 - v30;
      if (v31 > popOffsetLongterm) {
        double v31 = self->_popOffsetLongterm;
      }
      double v32 = self->_popDecayingOffset * v27 + (1.0 - v27) * v31;
      self->_popDecayingOffset = v32;
      double highPopThreshold = self->_strongThreshold;
      double v34 = previousPopThreshold * 0.6 + (v30 + v32) * 0.4;
      if (highPopThreshold < v34) {
        double highPopThreshold = v34;
      }
    }
    self->_double previousPopThreshold = highPopThreshold;
    double v35 = saturationForce / highPopThreshold;
    self->_progressToStrongThreshold = saturationForce / highPopThreshold;
    if (saturationForce > highPopThreshold)
    {
      self->_double timeMark = v22;
      self->_unint64_t deepPressCount = deepPressCount + 1;
      self->_actualPopTime = v22;
      self->_actualPopForce = saturationForce;
      if (v35 < 1.0) {
        double v35 = 1.0;
      }
      self->_progressToStrongThreshold = v35;
      v36 = self;
      uint64_t v37 = 3;
LABEL_37:
      [(_UIPreviewInteractionStateRecognizer *)v36 setCurrentState:v37];
    }
  }
  else
  {
    int64_t v24 = [(_UIPreviewInteractionStateRecognizer *)self currentState];
    if (a4 - timeMark >= self->_hintAndPeekInterval)
    {
      if (saturationForce - maximumForce < -self->_hintReductionForce)
      {
        self->_double maximumForce = saturationForce;
        self->_double timeMark = self->_currentTime;
        return;
      }
      if (!v24 && saturationForce >= self->_revealThreshold)
      {
        self->_actualHintTime = self->_currentTime;
        self->_actualHintForce = saturationForce;
        [(_UIPreviewInteractionStateRecognizer *)self setCurrentState:1];
      }
      double standardThreshold = self->_standardThreshold;
      if (saturationForce >= standardThreshold)
      {
        double v39 = self->_currentTime;
        self->_double timeMark = v39;
        self->_unint64_t deepPressCount = 1;
        self->_double actualPeekTime = v39;
        self->_actualPeekForce = saturationForce;
        if (self->_hintAndPeekInterval <= 0.05) {
          double standardThreshold = saturationForce;
        }
        self->_double highPopThreshold = self->_popOffsetInitial + standardThreshold;
        v36 = self;
        uint64_t v37 = 2;
        goto LABEL_37;
      }
    }
  }
}

- (void)reset
{
  BOOL v3 = [(_UIPreviewInteractionStateRecognizer *)self shouldDelayReveal];
  double v4 = 70.0;
  if (!v3) {
    double v4 = 0.0;
  }
  double v5 = 0.2;
  if (!v3) {
    double v5 = 0.0;
  }
  self->_revealThreshold = v4;
  if (v3) {
    double v6 = 30.0;
  }
  else {
    double v6 = 0.0;
  }
  self->_hintAndPeekInterval = v5;
  self->_hintReductionForce = v6;
  [(_UIPreviewInteractionStateRecognizer *)self setCurrentState:0];
  [(_UIPreviewInteractionStateRecognizer *)self setCurrentTouchForce:0.0];
  self->_unint64_t deepPressCount = 0;
  self->_double smoothedForce = 0.0;
  self->_double maximumForce = 0.0;
  *(_OWORD *)&self->_actualHintForce = 0u;
  *(_OWORD *)&self->_actualPopForce = 0u;
  *(_OWORD *)&self->_double actualPeekTime = 0u;
  self->_popDecayingOffset = self->_popOffsetInitial;
  self->_allowsPopOffsetDecay = 0;
  self->_progressToStrongThreshold = 0.0;
  self->_double currentTime = 0.0;
  self->_previousTime = 0.0;
  self->_double timeMark = 0.0;
  double v7 = (void *)UIApp;
  double v8 = +[UIScreen mainScreen];
  double v9 = [v7 _keyWindowForScreen:v8];
  id v10 = (id)[v7 _touchesEventForWindow:v9];

  double v11 = [v10 allTouches];
  double v15 = [v11 anyObject];

  if (v15)
  {
    if (fabs(v15[36]) >= 2.22044605e-16) {
      double v12 = v15[36];
    }
    else {
      double v12 = 600.0;
    }
  }
  else
  {
    double v12 = 600.0;
  }
  [(_UIPreviewInteractionStateRecognizer *)self _currentTouchForceMultiplier];
  double v14 = v12 * v13;
  if (v14 >= v12) {
    double v14 = v12;
  }
  self->_double saturationForce = v14;
}

- (double)_thresholdForForceLevel:(int64_t)a3
{
  switch(a3)
  {
    case 3:
      double strongThreshold = self->_strongThreshold;
LABEL_6:
      [(_UIPreviewInteractionStateRecognizer *)self _normalizedTouchForceValue:strongThreshold];
      return result;
    case 2:
      double strongThreshold = self->_actualPeekForce;
      if (strongThreshold <= 0.0) {
        double strongThreshold = self->_standardThreshold;
      }
      goto LABEL_6;
    case 1:
      double strongThreshold = self->_actualHintForce;
      if (strongThreshold <= 0.0) {
        double strongThreshold = self->_revealThreshold;
      }
      goto LABEL_6;
  }
  return 0.0;
}

- (double)_denormalizedTouchForceValue:(double)a3
{
  [(_UIPreviewInteractionStateRecognizer *)self _currentTouchForceMultiplier];
  return a3 * 60.0 * v4;
}

- (double)_normalizedTouchForceValue:(double)a3
{
  [(_UIPreviewInteractionStateRecognizer *)self _currentTouchForceMultiplier];
  return v4 * a3 / 60.0;
}

- (double)_currentTouchForceMultiplier
{
  _AXSForceTouchSensitivity();
  return v2;
}

- (int64_t)currentState
{
  return self->_currentState;
}

- (void)setCurrentState:(int64_t)a3
{
  self->_currentState = a3;
}

- (double)minimumPreviewDuration
{
  return self->_minimumPreviewDuration;
}

- (void)setMinimumPreviewDuration:(double)a3
{
  self->_minimumPreviewDuration = a3;
}

- (BOOL)shouldDelayReveal
{
  return self->_shouldDelayReveal;
}

- (double)currentTouchForce
{
  return self->_currentTouchForce;
}

- (void)setCurrentTouchForce:(double)a3
{
  self->_currentTouchForce = a3;
}

@end