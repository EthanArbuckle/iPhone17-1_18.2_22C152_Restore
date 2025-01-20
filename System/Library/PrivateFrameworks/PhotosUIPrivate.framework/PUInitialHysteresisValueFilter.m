@interface PUInitialHysteresisValueFilter
- (double)outputValueDerivative;
- (double)thresholdValue;
- (double)updatedValue:(double)a3 withTargetValue:(double)a4;
- (void)setThresholdValue:(double)a3;
@end

@implementation PUInitialHysteresisValueFilter

- (void)setThresholdValue:(double)a3
{
  self->_thresholdValue = a3;
}

- (double)thresholdValue
{
  return self->_thresholdValue;
}

- (double)outputValueDerivative
{
  double result = 1.0;
  if (!self->_didReachThreshold) {
    return 0.0;
  }
  return result;
}

- (double)updatedValue:(double)a3 withTargetValue:(double)a4
{
  if (!self->_didReachThreshold)
  {
    [(PUInitialHysteresisValueFilter *)self thresholdValue];
    if (v6 <= a4 || (double v6 = -v6, v6 >= a4))
    {
      self->_initialHysteresis = v6;
      self->_didReachThreshold = 1;
    }
    else if (!self->_didReachThreshold)
    {
      return 0.0;
    }
  }
  return a4 - self->_initialHysteresis;
}

@end