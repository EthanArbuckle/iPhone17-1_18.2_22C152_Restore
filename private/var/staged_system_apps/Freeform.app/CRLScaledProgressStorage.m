@interface CRLScaledProgressStorage
- (double)maxValue;
- (void)setMaxValue:(double)a3;
@end

@implementation CRLScaledProgressStorage

- (double)maxValue
{
  return self->_maxValue;
}

- (void)setMaxValue:(double)a3
{
  self->_maxValue = a3;
}

@end