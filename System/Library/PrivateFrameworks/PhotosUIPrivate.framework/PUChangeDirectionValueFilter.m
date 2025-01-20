@interface PUChangeDirectionValueFilter
- (double)minimumChangeValue;
- (double)updatedValue:(double)a3 withTargetValue:(double)a4;
- (void)setMinimumChangeValue:(double)a3;
@end

@implementation PUChangeDirectionValueFilter

- (void)setMinimumChangeValue:(double)a3
{
  self->_minimumChangeValue = a3;
}

- (double)minimumChangeValue
{
  return self->_minimumChangeValue;
}

- (double)updatedValue:(double)a3 withTargetValue:(double)a4
{
  [(PUChangeDirectionValueFilter *)self minimumChangeValue];
  double v8 = fabs(a4);
  if (a3 != 0.0 || v8 <= v7)
  {
    if (a3 >= 0.0)
    {
      if (a3 <= 0.0) {
        return a3;
      }
      double threshold = self->_threshold;
    }
    else
    {
      double threshold = self->_threshold;
      if (threshold < a4)
      {
        a3 = 1.0;
        goto LABEL_16;
      }
      if (a3 <= 0.0)
      {
        double v11 = a3;
        goto LABEL_20;
      }
    }
    double v11 = -1.0;
    if (threshold > a4) {
      goto LABEL_20;
    }
LABEL_16:
    double v13 = a4 - v7;
    if (threshold >= v13) {
      double v13 = threshold;
    }
    self->_double threshold = v13;
    return a3;
  }
  double threshold = self->_threshold;
  double v11 = -1.0;
  BOOL v12 = a4 < a3;
  a3 = 1.0;
  if (!v12) {
    goto LABEL_16;
  }
LABEL_20:
  double v14 = v7 + a4;
  if (threshold < v14) {
    double v14 = threshold;
  }
  self->_double threshold = v14;
  return v11;
}

@end