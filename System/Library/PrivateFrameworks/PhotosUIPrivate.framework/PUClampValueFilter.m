@interface PUClampValueFilter
- (double)maximumValue;
- (double)minimumValue;
- (double)updatedValue:(double)a3 withTargetValue:(double)a4;
- (void)setMaximumValue:(double)a3;
- (void)setMinimumValue:(double)a3;
@end

@implementation PUClampValueFilter

- (void)setMaximumValue:(double)a3
{
  self->_maximumValue = a3;
}

- (double)maximumValue
{
  return self->_maximumValue;
}

- (void)setMinimumValue:(double)a3
{
  self->_minimumValue = a3;
}

- (double)minimumValue
{
  return self->_minimumValue;
}

- (double)updatedValue:(double)a3 withTargetValue:(double)a4
{
  [(PUClampValueFilter *)self minimumValue];
  if (v6 > a4) {
    a4 = v6;
  }
  [(PUClampValueFilter *)self maximumValue];
  if (a4 < result) {
    return a4;
  }
  return result;
}

@end