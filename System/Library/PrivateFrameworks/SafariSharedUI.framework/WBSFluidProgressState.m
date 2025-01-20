@interface WBSFluidProgressState
+ (double)_estimatedLoadTimeRemainingFromProgressValue:(double)a3;
- (BOOL)hasCanceledLoad;
- (BOOL)hasCommittedLoad;
- (BOOL)hasCompletedLoad;
- (BOOL)isFluidProgressStalled;
- (BOOL)shouldAnimateUsingInitialPosition;
- (NSString)loadURL;
- (WBSFluidProgressAnimation)nextFluidProgressAnimation;
- (WBSFluidProgressState)initWithType:(int64_t)a3;
- (double)_adjustProgressPosition:(double)minProgressPosition;
- (double)_animationDuration;
- (double)_estimatedLoadTimeRemaining;
- (double)_fractionCompleteAtElapsedTime:(double)a3;
- (double)_nextProgressPosition:(double)a3;
- (double)fluidProgressValue;
- (double)minProgressPosition;
- (double)secondsElapsedSinceLoadBegan;
- (id)description;
- (int64_t)fluidProgressAnimationPhase;
- (int64_t)fluidProgressType;
- (void)_updateLinearFunction;
- (void)setFluidProgressAnimationPhase:(int64_t)a3;
- (void)setFluidProgressType:(int64_t)a3;
- (void)setHasCanceledLoad:(BOOL)a3;
- (void)setHasCommittedLoad:(BOOL)a3;
- (void)setHasCompletedLoad:(BOOL)a3;
- (void)setLoadURL:(id)a3;
- (void)setMinProgressPosition:(double)a3;
- (void)setShouldAnimateUsingInitialPosition:(BOOL)a3;
- (void)setWebKitProgressValue:(double)a3;
- (void)updateFluidProgressValue;
- (void)updateNextFluidProgressAnimation;
@end

@implementation WBSFluidProgressState

- (WBSFluidProgressState)initWithType:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)WBSFluidProgressState;
  v4 = [(WBSFluidProgressState *)&v8 init];
  v5 = v4;
  if (v4)
  {
    v4->_fluidProgressType = a3;
    v4->_startTimeForFluidProgress = CFAbsoluteTimeGetCurrent();
    [(WBSFluidProgressState *)v5 setMinProgressPosition:0.1];
    v5->_fluidProgressAnimationPhase = 1;
    v5->_shouldAnimateUsingInitialPosition = 1;
    v6 = v5;
  }

  return v5;
}

- (id)description
{
  unint64_t fluidProgressAnimationPhase = self->_fluidProgressAnimationPhase;
  if (fluidProgressAnimationPhase > 5) {
    v3 = 0;
  }
  else {
    v3 = off_1E5E42598[fluidProgressAnimationPhase];
  }
  v4 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)WBSFluidProgressState;
  v5 = [(WBSFluidProgressState *)&v8 description];
  v6 = [v4 stringWithFormat:@"%@, animation phase: %@", v5, v3];

  return v6;
}

- (int64_t)fluidProgressAnimationPhase
{
  return self->_fluidProgressAnimationPhase;
}

- (void)setFluidProgressAnimationPhase:(int64_t)a3
{
  self->_unint64_t fluidProgressAnimationPhase = a3;
}

- (void)setWebKitProgressValue:(double)a3
{
  if (self->_minProgressPosition <= a3
    && self->_webKitProgressValue != a3
    && (self->_fluidProgressAnimationPhase & 0xFFFFFFFFFFFFFFFELL) != 4
    && !self->_hasCompletedLoad
    && self->_previousDestinationPosition != 0.4)
  {
    self->_unint64_t fluidProgressAnimationPhase = 1;
    self->_webKitProgressValue = a3;
    self->_lastTimeProgressValueWasUpdated = CFAbsoluteTimeGetCurrent();
    [(WBSFluidProgressState *)self _updateLinearFunction];
  }
}

- (void)setMinProgressPosition:(double)a3
{
  double v3 = a3 / 0.4;
  BOOL v4 = a3 <= 0.4;
  double v5 = 1.0;
  if (v4) {
    double v5 = v3;
  }
  self->_minProgressPosition = v5;
}

- (double)minProgressPosition
{
  return self->_minProgressPosition;
}

- (void)updateFluidProgressValue
{
  int64_t fluidProgressAnimationPhase = self->_fluidProgressAnimationPhase;
  BOOL v4 = 0;
  if (fluidProgressAnimationPhase
    && (fluidProgressAnimationPhase != 5 ? (BOOL v5 = !self->_hasCompletedLoad) : (BOOL v5 = 0), v5))
  {
    if (self->_fluidProgressType)
    {
      double webKitProgressValue = self->_webKitProgressValue;
    }
    else
    {
      [(WBSFluidProgressState *)self secondsElapsedSinceLoadBegan];
      -[WBSFluidProgressState _fractionCompleteAtElapsedTime:](self, "_fractionCompleteAtElapsedTime:");
    }
    [(WBSFluidProgressState *)self _adjustProgressPosition:webKitProgressValue];
    *(void *)&self->_fluidProgressValue = v4;
    uint64_t v6 = 56;
  }
  else
  {
    uint64_t v6 = 88;
  }
  *(Class *)((char *)&self->super.isa + v6) = v4;
}

- (void)updateNextFluidProgressAnimation
{
  double v3 = objc_alloc_init(WBSFluidProgressAnimation);
  if (self->_fluidProgressType) {
    goto LABEL_2;
  }
  BOOL v6 = [(WBSFluidProgressState *)self isFluidProgressStalled];
  if (self->_previousDestinationPosition > 0.37 && self->_fluidProgressAnimationPhase == 1)
  {
    self->_int64_t fluidProgressAnimationPhase = 3;
    self->_double previousDestinationPosition = 0.4;
    if (v6) {
      goto LABEL_20;
    }
LABEL_2:
    BOOL v4 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A4A0]];
    goto LABEL_3;
  }
  if (!v6) {
    goto LABEL_2;
  }
  self->_int64_t fluidProgressAnimationPhase = 3;
LABEL_20:
  BOOL v4 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A498]];
LABEL_3:
  [(WBSFluidProgressAnimation *)v3 setTimingFunction:v4];

  [(WBSFluidProgressState *)self _animationDuration];
  -[WBSFluidProgressAnimation setAnimationDuration:](v3, "setAnimationDuration:");
  if (self->_shouldAnimateUsingInitialPosition) {
    [(WBSFluidProgressState *)self fluidProgressValue];
  }
  else {
    double v5 = 0.0;
  }
  [(WBSFluidProgressAnimation *)v3 setInitialPosition:v5];
  [(WBSFluidProgressAnimation *)v3 animationDuration];
  -[WBSFluidProgressState _nextProgressPosition:](self, "_nextProgressPosition:");
  -[WBSFluidProgressAnimation setDestinationPosition:](v3, "setDestinationPosition:");
  if (self->_fluidProgressType == 1)
  {
    double previousDestinationPosition = self->_previousDestinationPosition;
    [(WBSFluidProgressAnimation *)v3 destinationPosition];
    if (previousDestinationPosition == v8) {
      self->_int64_t fluidProgressAnimationPhase = 2;
    }
  }
  [(WBSFluidProgressAnimation *)v3 destinationPosition];
  self->_double previousDestinationPosition = v9;
  if (!self->_fluidProgressAnimationPhase) {
    self->_int64_t fluidProgressAnimationPhase = 1;
  }
  nextFluidProgressAnimation = self->_nextFluidProgressAnimation;
  self->_nextFluidProgressAnimation = v3;
}

- (BOOL)isFluidProgressStalled
{
  return (self->_fluidProgressAnimationPhase & 0xFFFFFFFFFFFFFFFELL) != 4
      && CFAbsoluteTimeGetCurrent() - self->_lastTimeProgressValueWasUpdated > 1.5
      && (self->_fluidProgressAnimationPhase & 0xFFFFFFFFFFFFFFFBLL) != 0;
}

- (double)secondsElapsedSinceLoadBegan
{
  return CFAbsoluteTimeGetCurrent() - self->_startTimeForFluidProgress;
}

- (double)fluidProgressValue
{
  return self->_fluidProgressValue;
}

- (WBSFluidProgressAnimation)nextFluidProgressAnimation
{
  return self->_nextFluidProgressAnimation;
}

- (int64_t)fluidProgressType
{
  return self->_fluidProgressType;
}

- (void)setFluidProgressType:(int64_t)a3
{
  self->_fluidProgressType = a3;
}

- (NSString)loadURL
{
  return self->_loadURL;
}

- (void)setLoadURL:(id)a3
{
}

- (BOOL)hasCompletedLoad
{
  return self->_hasCompletedLoad;
}

- (void)setHasCompletedLoad:(BOOL)a3
{
  self->_hasCompletedLoad = a3;
}

- (BOOL)hasCanceledLoad
{
  return self->_hasCanceledLoad;
}

- (void)setHasCanceledLoad:(BOOL)a3
{
  self->_hasCanceledLoad = a3;
}

- (BOOL)hasCommittedLoad
{
  return self->_hasCommittedLoad;
}

- (void)setHasCommittedLoad:(BOOL)a3
{
  self->_hasCommittedLoad = a3;
}

- (BOOL)shouldAnimateUsingInitialPosition
{
  return self->_shouldAnimateUsingInitialPosition;
}

- (void)setShouldAnimateUsingInitialPosition:(BOOL)a3
{
  self->_shouldAnimateUsingInitialPosition = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadURL, 0);
  objc_storeStrong((id *)&self->_nextFluidProgressAnimation, 0);
}

- (double)_adjustProgressPosition:(double)minProgressPosition
{
  if (self->_minProgressPosition > minProgressPosition) {
    minProgressPosition = self->_minProgressPosition;
  }
  double v3 = 0.4;
  if (self->_fluidProgressType == 1) {
    double v3 = 1.0;
  }
  return minProgressPosition * v3;
}

- (double)_animationDuration
{
  int64_t fluidProgressAnimationPhase = self->_fluidProgressAnimationPhase;
  if (fluidProgressAnimationPhase == 3) {
    return 0.7;
  }
  if (fluidProgressAnimationPhase == 4) {
    return (1.0 - self->_previousDestinationPosition) * 0.2;
  }
  return 0.2;
}

+ (double)_estimatedLoadTimeRemainingFromProgressValue:(double)a3
{
  double v3 = 2.5;
  if (a3 <= 0.85)
  {
    double v3 = 3.0;
    if (a3 <= 0.8)
    {
      double v3 = 5.0;
      if (a3 <= 0.5) {
        return 30.0;
      }
    }
  }
  return v3;
}

- (double)_estimatedLoadTimeRemaining
{
  +[WBSFluidProgressState _estimatedLoadTimeRemainingFromProgressValue:self->_webKitProgressValue];
  return result;
}

- (double)_fractionCompleteAtElapsedTime:(double)a3
{
  double v3 = 1.0;
  if (self->_fluidProgressAnimationPhase != 4)
  {
    double v4 = self->_linearFunctionB + self->_linearFunctionM * a3;
    if (v4 < 0.0) {
      double v4 = 0.0;
    }
    double v3 = 1.0;
    if (v4 <= 1.0) {
      return v4;
    }
  }
  return v3;
}

- (double)_nextProgressPosition:(double)a3
{
  int64_t fluidProgressAnimationPhase = self->_fluidProgressAnimationPhase;
  if (fluidProgressAnimationPhase == 4) {
    return 1.0;
  }
  if (fluidProgressAnimationPhase == 3)
  {
    double result = self->_previousDestinationPosition + 0.02;
    if (result > 0.4) {
      return 0.4;
    }
  }
  else
  {
    if (self->_fluidProgressType)
    {
      double webKitProgressValue = self->_webKitProgressValue;
    }
    else
    {
      [(WBSFluidProgressState *)self secondsElapsedSinceLoadBegan];
      [(WBSFluidProgressState *)self _fractionCompleteAtElapsedTime:v8 + a3];
    }
    [(WBSFluidProgressState *)self _adjustProgressPosition:webKitProgressValue];
  }
  return result;
}

- (void)_updateLinearFunction
{
  [(WBSFluidProgressState *)self secondsElapsedSinceLoadBegan];
  double v4 = v3;
  [(WBSFluidProgressState *)self _estimatedLoadTimeRemaining];
  double v6 = v5;
  [(WBSFluidProgressState *)self secondsElapsedSinceLoadBegan];
  -[WBSFluidProgressState _fractionCompleteAtElapsedTime:](self, "_fractionCompleteAtElapsedTime:");
  if (minProgressPosition < self->_minProgressPosition) {
    double minProgressPosition = self->_minProgressPosition;
  }
  if (minProgressPosition < self->_previousDestinationPosition / 0.4) {
    double minProgressPosition = self->_previousDestinationPosition / 0.4;
  }
  double v8 = (minProgressPosition + -1.0) / (v4 - (v4 + v6));
  self->_linearFunctionM = v8;
  self->_linearFunctionB = 1.0 - v8 * (v4 + v6);
}

@end