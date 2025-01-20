@interface SBFSteppedAnimationTimingFunctionCalculator
- (SBFSteppedAnimationTimingFunctionCalculator)init;
- (double)percentComplete;
- (double)valueForFunctionWithName:(id)a3;
- (id)timingFunctionNames;
- (void)addTimingFunction:(id)a3 withName:(id)a4;
- (void)addTimingFunction:(id)a3 withName:(id)a4 constrainedToIntervalBetween:(double)a5 and:(double)a6;
- (void)addTimingFunctionWithName:(id)a3 fromNormalizedAnimationSettings:(id)a4;
- (void)setPercentComplete:(double)a3;
@end

@implementation SBFSteppedAnimationTimingFunctionCalculator

- (double)valueForFunctionWithName:(id)a3
{
  v4 = [(NSMutableDictionary *)self->_functionsByName objectForKey:a3];
  [v4 valueAtPercentage:self->_percentComplete];
  double v6 = v5;

  return v6;
}

- (void)setPercentComplete:(double)a3
{
  self->_percentComplete = fmin(fmax(a3, 0.0), 1.0);
}

- (SBFSteppedAnimationTimingFunctionCalculator)init
{
  v6.receiver = self;
  v6.super_class = (Class)SBFSteppedAnimationTimingFunctionCalculator;
  v2 = [(SBFSteppedAnimationTimingFunctionCalculator *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    functionsByName = v2->_functionsByName;
    v2->_functionsByName = v3;
  }
  return v2;
}

- (void)addTimingFunction:(id)a3 withName:(id)a4
{
}

- (void)addTimingFunction:(id)a3 withName:(id)a4 constrainedToIntervalBetween:(double)a5 and:(double)a6
{
  id v10 = a4;
  id v11 = +[_SBSteppedAnimationTimingFunction timingFunctionWithTimingFunction:a3 constrainedToIntervalBetween:a5 and:a6];
  [(NSMutableDictionary *)self->_functionsByName setObject:v11 forKey:v10];
}

- (void)addTimingFunctionWithName:(id)a3 fromNormalizedAnimationSettings:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v12 = [v6 timingFunction];
  [v6 delay];
  double v9 = v8;
  [v6 duration];
  double v11 = v10;

  [(SBFSteppedAnimationTimingFunctionCalculator *)self addTimingFunction:v12 withName:v7 constrainedToIntervalBetween:v9 and:v11];
}

- (id)timingFunctionNames
{
  return (id)[(NSMutableDictionary *)self->_functionsByName allKeys];
}

- (double)percentComplete
{
  return self->_percentComplete;
}

- (void).cxx_destruct
{
}

@end