@interface PUThresholdCrossingCountValueFilter
- (double)thresholdValue;
- (double)updatedValue:(double)a3 withTargetValue:(double)a4;
- (int64_t)maximumCrossingCount;
- (void)setMaximumCrossingCount:(int64_t)a3;
- (void)setThresholdValue:(double)a3;
@end

@implementation PUThresholdCrossingCountValueFilter

- (void)setMaximumCrossingCount:(int64_t)a3
{
  self->_maximumCrossingCount = a3;
}

- (int64_t)maximumCrossingCount
{
  return self->_maximumCrossingCount;
}

- (void)setThresholdValue:(double)a3
{
  self->_thresholdValue = a3;
}

- (double)thresholdValue
{
  return self->_thresholdValue;
}

- (double)updatedValue:(double)a3 withTargetValue:(double)a4
{
  [(PUThresholdCrossingCountValueFilter *)self thresholdValue];
  double v8 = v7;
  int64_t crossingCount = self->_crossingCount;
  if (v7 <= a3 != v7 <= a4) {
    self->_int64_t crossingCount = ++crossingCount;
  }
  if (crossingCount >= [(PUThresholdCrossingCountValueFilter *)self maximumCrossingCount]) {
    return v8;
  }
  else {
    return a4;
  }
}

@end