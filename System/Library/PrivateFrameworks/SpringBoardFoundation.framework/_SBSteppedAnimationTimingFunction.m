@interface _SBSteppedAnimationTimingFunction
+ (id)timingFunctionWithTimingFunction:(id)a3 constrainedToIntervalBetween:(double)a4 and:(double)a5;
- (CAMediaTimingFunction)timingFunction;
- (SBNormalizedTransitionInterval)constrainedRange;
- (_SBSteppedAnimationTimingFunction)initWithTimingFunction:(id)a3 constrainedToIntervalBetween:(double)a4 and:(double)a5;
- (double)valueAtPercentage:(double)a3;
@end

@implementation _SBSteppedAnimationTimingFunction

- (double)valueAtPercentage:(double)a3
{
  timingFunction = self->_timingFunction;
  double start = self->_constrainedRange.start;
  float v6 = 0.0;
  if (start <= a3)
  {
    double duration = self->_constrainedRange.duration;
    float v6 = 1.0;
    if (start + duration >= a3)
    {
      a3 = (fmin(fmax(a3, 0.0), 1.0) - start) / duration;
      float v6 = a3;
    }
  }
  *(float *)&a3 = v6;
  [(CAMediaTimingFunction *)timingFunction _solveForInput:a3];
  return v8;
}

+ (id)timingFunctionWithTimingFunction:(id)a3 constrainedToIntervalBetween:(double)a4 and:(double)a5
{
  id v8 = a3;
  v9 = (void *)[objc_alloc((Class)a1) initWithTimingFunction:v8 constrainedToIntervalBetween:a4 and:a5];

  return v9;
}

- (_SBSteppedAnimationTimingFunction)initWithTimingFunction:(id)a3 constrainedToIntervalBetween:(double)a4 and:(double)a5
{
  id v10 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_SBSteppedAnimationTimingFunction;
  v11 = [(_SBSteppedAnimationTimingFunction *)&v15 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_timingFunction, a3);
    if (a4 >= a5)
    {
      v14 = [MEMORY[0x1E4F28B00] currentHandler];
      [v14 handleFailureInMethod:a2, v12, @"SBFSteppedAnimationTimingFunctionCalculator.m", 91, @"Invalid timing interval for function (%f, %f)", *(void *)&a4, *(void *)&a5 object file lineNumber description];
    }
    v12->_constrainedRange.double start = fmin(fmax(a4, 0.0), 1.0);
    v12->_constrainedRange.double duration = fmin(fmax(a5, 0.0), 1.0) - a4;
  }

  return v12;
}

- (CAMediaTimingFunction)timingFunction
{
  return self->_timingFunction;
}

- (SBNormalizedTransitionInterval)constrainedRange
{
  double start = self->_constrainedRange.start;
  double duration = self->_constrainedRange.duration;
  result.double duration = duration;
  result.double start = start;
  return result;
}

- (void).cxx_destruct
{
}

@end