@interface _UIDynamicValueAnimation
+ (id)_dynamicValueAnimationMatchingCASpringAnimationWithMass:(double)a3 stiffness:(double)a4 damping:(float)a5 velocity:(float)a6 fromValue:(double)a7 toValue:(double)a8;
- (BOOL)_animateForInterval:(double)a3;
- (NSArray)activeValues;
- (_UIDynamicValueAnimation)init;
- (_UIDynamicValueAnimation)initWithValue:(double)a3 velocity:(double)a4 unitSize:(double)a5;
- (double)_multiplier;
- (double)friction;
- (double)settlingDuration;
- (double)value;
- (double)velocity;
- (void)_appendSubclassDescription:(id)a3 atLevel:(int)a4;
- (void)_setDecelerationFactor:(double)a3;
- (void)_setMultiplier:(double)a3;
- (void)_setVelocity:(double)a3;
- (void)_stopAnimation;
- (void)_updateStepFunction;
- (void)addActiveValue:(id)a3;
- (void)dealloc;
- (void)removeActiveValue:(id)a3;
- (void)runWithCompletion:(id)a3;
- (void)runWithValueApplier:(id)a3 completion:(id)a4;
- (void)runWithValueApplier:(id)a3 completion:(id)a4 forScreen:(id)a5 runLoopMode:(id)a6;
- (void)setActiveValues:(id)a3;
- (void)setFriction:(double)a3;
- (void)setValue:(double)a3;
- (void)setVelocity:(double)a3;
@end

@implementation _UIDynamicValueAnimation

+ (id)_dynamicValueAnimationMatchingCASpringAnimationWithMass:(double)a3 stiffness:(double)a4 damping:(float)a5 velocity:(float)a6 fromValue:(double)a7 toValue:(double)a8
{
  v12 = [[_UIDynamicValueAnimation alloc] initWithValue:a7 velocity:(a8 - a7) * a6 unitSize:0.001];
  id v13 = +[_UIDynamicAnimationActiveValue activeValue:0 ofType:a8];
  [v13 _setBoundaryPull:a4 / 1000.0 / a3];
  [(_UIDynamicValueAnimation *)v12 _setDecelerationFactor:1.0 - a5 / a3 * 0.001];
  [(_UIDynamicValueAnimation *)v12 addActiveValue:v13];
  return v12;
}

- (_UIDynamicValueAnimation)initWithValue:(double)a3 velocity:(double)a4 unitSize:(double)a5
{
  if (a5 <= 0.0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"unit size must be > 0"];
  }
  v10.receiver = self;
  v10.super_class = (Class)_UIDynamicValueAnimation;
  result = [(_UIDynamicAnimation *)&v10 init];
  if (result)
  {
    result->_value = a3;
    result->_velocity = a4 / 1000.0;
    result->_unitSize = a5;
    result->_friction = 0.08;
    result->_decelerationFactor = 0.998;
    result->_decelerationLnFactor = -0.00200200267;
    result->_multiplier = 1.0;
    result->_stepFunction = _UIDynamicAnimationStepFrictionOnly;
  }
  return result;
}

- (_UIDynamicValueAnimation)init
{
  return [(_UIDynamicValueAnimation *)self initWithValue:0.0 velocity:0.0 unitSize:1.0];
}

- (double)settlingDuration
{
  double value = self->_value;
  double velocity = self->_velocity;
  uint64_t v5 = [+[UIScreen mainScreen] maximumFramesPerSecond];
  double v6 = 0.0;
  if (!_UIDynamicAnimationIsAtRest((uint64_t)self))
  {
    double v7 = 1.0 / (double)v5 * 1000.0;
    do
    {
      ((void (*)(_UIDynamicValueAnimation *, uint64_t))self->_stepFunction)(self, (uint64_t)v7);
      double v6 = v7 + v6;
    }
    while (!_UIDynamicAnimationIsAtRest((uint64_t)self));
  }
  double result = v6 / 1000.0;
  self->_double value = value;
  self->_double velocity = velocity;
  return result;
}

- (void)dealloc
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  activeValues = self->_activeValues;
  uint64_t v4 = [(NSMutableArray *)activeValues countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(activeValues);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * i) removeObserver:self forKeyPath:@"type"];
      }
      uint64_t v5 = [(NSMutableArray *)activeValues countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)_UIDynamicValueAnimation;
  [(_UIDynamicAnimation *)&v8 dealloc];
}

- (void)_stopAnimation
{
  self->_applier = 0;
  self->_viewApplier = 0;
  v3.receiver = self;
  v3.super_class = (Class)_UIDynamicValueAnimation;
  [(_UIDynamicAnimation *)&v3 _stopAnimation];
}

- (void)_updateStepFunction
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  activeValues = self->_activeValues;
  uint64_t v4 = [(NSMutableArray *)activeValues countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    int v6 = 0;
    int v7 = 0;
    char v8 = 0;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(activeValues);
        }
        long long v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if ([v11 type] == 1)
        {
          if ([v11 _isLowerBoundary])
          {
            ++v7;
          }
          else
          {
            int v12 = [v11 _isUpperBoundary];
            v6 += v12;
            v8 |= v12 ^ 1;
          }
        }
        else
        {
          char v8 = 1;
        }
      }
      uint64_t v5 = [(NSMutableArray *)activeValues countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v5);
  }
  else
  {
    int v6 = 0;
    int v7 = 0;
    char v8 = 0;
  }
  if ([(NSMutableArray *)self->_activeValues count])
  {
    BOOL v14 = v7 > 1 || v6 > 1;
    if ((v14 | v8)) {
      v15 = _UIDynamicAnimationStep;
    }
    else {
      v15 = _UIDynamicAnimationStepFrictionAndSoftStopOnly;
    }
  }
  else
  {
    v15 = _UIDynamicAnimationStepFrictionOnly;
  }
  self->_stepFunction = v15;
}

- (void)addActiveValue:(id)a3
{
  if (a3)
  {
    activeValues = self->_activeValues;
    if (!activeValues)
    {
      activeValues = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:0];
      self->_activeValues = activeValues;
    }
    [(NSMutableArray *)activeValues addObject:a3];
    [a3 addObserver:self forKeyPath:@"type" options:0 context:0];
    [(_UIDynamicValueAnimation *)self _updateStepFunction];
  }
}

- (void)removeActiveValue:(id)a3
{
  if (-[NSMutableArray containsObject:](self->_activeValues, "containsObject:"))
  {
    [a3 removeObserver:self forKeyPath:@"type"];
    [(NSMutableArray *)self->_activeValues removeObject:a3];
    [(_UIDynamicValueAnimation *)self _updateStepFunction];
  }
}

- (void)setActiveValues:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  activeValues = self->_activeValues;
  if (activeValues != a3)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v6 = [(NSMutableArray *)activeValues countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v20;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v20 != v8) {
            objc_enumerationMutation(activeValues);
          }
          [*(id *)(*((void *)&v19 + 1) + 8 * v9++) removeObserver:self forKeyPath:@"type"];
        }
        while (v7 != v9);
        uint64_t v7 = [(NSMutableArray *)activeValues countByEnumeratingWithState:&v19 objects:v24 count:16];
      }
      while (v7);
    }

    long long v10 = (NSMutableArray *)[a3 mutableCopy];
    self->_activeValues = v10;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v16;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v16 != v13) {
            objc_enumerationMutation(v10);
          }
          [*(id *)(*((void *)&v15 + 1) + 8 * v14++) addObserver:self forKeyPath:@"type" options:0 context:0];
        }
        while (v12 != v14);
        uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
      }
      while (v12);
    }
    [(_UIDynamicValueAnimation *)self _updateStepFunction];
  }
}

- (BOOL)_animateForInterval:(double)a3
{
  if ((uint64_t)(a3 * 1000.0) < 1)
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    double value = self->_value;
    ((void (*)(void))self->_stepFunction)();
    BOOL v5 = _UIDynamicAnimationIsAtRest((uint64_t)self);
    v7[4] = self;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __48___UIDynamicValueAnimation__animateForInterval___block_invoke;
    v8[3] = &unk_1E52DC530;
    v8[4] = self;
    *(double *)&v8[5] = value;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __48___UIDynamicValueAnimation__animateForInterval___block_invoke_2;
    v7[3] = &unk_1E52DC558;
    [(_UIDynamicAnimation *)self _callAppliers:v8 additionalEndAppliers:v7 done:v5];
  }
  return v5;
}

- (void)runWithValueApplier:(id)a3 completion:(id)a4 forScreen:(id)a5 runLoopMode:(id)a6
{
  if (a3)
  {
    if ((*((unsigned char *)&self->super + 20) & 2) != 0) {
      return;
    }

    self->_applier = (id)[a3 copy];
    goto LABEL_8;
  }
  if (!self->_applier && !self->_viewApplier) {
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3C8], @"valueApplier must be non-nil", a5, a6);
  }
  if ((*((unsigned char *)&self->super + 20) & 2) == 0)
  {
LABEL_8:
    v9.receiver = self;
    v9.super_class = (Class)_UIDynamicValueAnimation;
    [(_UIDynamicAnimation *)&v9 runWithCompletion:a4];
  }
}

- (void)runWithValueApplier:(id)a3 completion:(id)a4
{
}

- (void)runWithCompletion:(id)a3
{
  if (*(_OWORD *)&self->_applier == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Dynamic animations without pre-set appliers must be run with an explicit applier. Use runWithValueApplier:completion:"];
  }
  [(_UIDynamicValueAnimation *)self runWithValueApplier:0 completion:a3];
}

- (void)setFriction:(double)a3
{
  if (a3 > 1.0) {
    a3 = 1.0;
  }
  double v3 = fmax(a3, 0.0);
  self->_friction = v3;
  double v4 = v3 * -0.025 + 1.0;
  self->_decelerationFactor = v4;
  self->_decelerationLnFactor = log(v4);
}

- (void)_setDecelerationFactor:(double)a3
{
  double v3 = 1.0;
  if ((1.0 - a3) / 0.025 <= 1.0) {
    double v3 = (1.0 - a3) / 0.025;
  }
  self->_friction = fmax(v3, 0.0);
  self->_decelerationFactor = a3;
  self->_decelerationLnFactor = log(a3);
}

- (double)_multiplier
{
  return self->_multiplier;
}

- (void)_setMultiplier:(double)a3
{
  self->_multiplier = a3;
}

- (double)velocity
{
  return self->_velocity * 1000.0;
}

- (void)_setVelocity:(double)a3
{
  self->_double velocity = a3 / 1000.0;
}

- (void)_appendSubclassDescription:(id)a3 atLevel:(int)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  [(_UIDynamicValueAnimation *)self value];
  objc_msgSend(a3, "appendFormat:", @"; double value = %f", v7);
  [(_UIDynamicValueAnimation *)self velocity];
  objc_msgSend(a3, "appendFormat:", @"; double velocity = %f", v8);
  [(_UIDynamicValueAnimation *)self friction];
  if (v9 != 0.002)
  {
    [(_UIDynamicValueAnimation *)self friction];
    objc_msgSend(a3, "appendFormat:", @"; friction = %f", v10);
  }
  if ([(NSMutableArray *)self->_activeValues count])
  {
    [a3 appendString:@"; active values = {"];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    activeValues = self->_activeValues;
    uint64_t v12 = [(NSMutableArray *)activeValues countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v20;
      char v15 = 1;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v20 != v14) {
            objc_enumerationMutation(activeValues);
          }
          long long v17 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          if ((v15 & 1) == 0) {
            [a3 appendString:@","];
          }
          [v17 _appendDescriptionToString:a3 atLevel:(a4 + 1)];
          char v15 = 0;
        }
        uint64_t v13 = [(NSMutableArray *)activeValues countByEnumeratingWithState:&v19 objects:v23 count:16];
        char v15 = 0;
      }
      while (v13);
    }
    [a3 appendString:@"\n"];
    if (a4)
    {
      unint64_t v18 = 1;
      do
      {
        [a3 appendString:@"    "];
        ++v18;
      }
      while (v18 <= a4);
    }
    [a3 appendString:@"}"];
  }
}

- (void)setVelocity:(double)a3
{
  self->_double velocity = a3;
}

- (double)value
{
  return self->_value;
}

- (void)setValue:(double)a3
{
  self->_double value = a3;
}

- (double)friction
{
  return self->_friction;
}

- (NSArray)activeValues
{
  return &self->_activeValues->super;
}

@end