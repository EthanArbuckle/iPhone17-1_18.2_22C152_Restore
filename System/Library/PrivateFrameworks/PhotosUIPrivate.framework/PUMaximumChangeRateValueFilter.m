@interface PUMaximumChangeRateValueFilter
- (double)maximumChangeRate;
- (double)updatedValue:(double)a3 withTargetValue:(double)a4 timeInterval:(double)a5;
- (void)setMaximumChangeRate:(double)a3;
@end

@implementation PUMaximumChangeRateValueFilter

- (void)setMaximumChangeRate:(double)a3
{
  self->_maximumChangeRate = a3;
}

- (double)maximumChangeRate
{
  return self->_maximumChangeRate;
}

- (double)updatedValue:(double)a3 withTargetValue:(double)a4 timeInterval:(double)a5
{
  [(PUMaximumChangeRateValueFilter *)self maximumChangeRate];
  double v9 = a3 - v8 * a5;
  if (v9 < a4) {
    double v9 = a4;
  }
  double result = a3 + v8 * a5;
  if (result >= a4) {
    double result = a4;
  }
  if (a3 >= a4) {
    return v9;
  }
  return result;
}

@end