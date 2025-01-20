@interface CRLBasicProgressStorage
- (BOOL)isIndeterminate;
- (double)maxValue;
- (double)value;
- (void)setIndeterminate:(BOOL)a3;
- (void)setMaxValue:(double)a3;
- (void)setValue:(double)a3;
@end

@implementation CRLBasicProgressStorage

- (double)value
{
  return self->_value;
}

- (void)setValue:(double)a3
{
  self->_value = a3;
}

- (double)maxValue
{
  return self->_maxValue;
}

- (void)setMaxValue:(double)a3
{
  self->_maxValue = a3;
}

- (BOOL)isIndeterminate
{
  return self->_indeterminate;
}

- (void)setIndeterminate:(BOOL)a3
{
  self->_indeterminate = a3;
}

@end