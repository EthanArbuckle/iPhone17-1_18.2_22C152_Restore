@interface PUValueFilter
- (PUValueFilter)init;
- (PUValueFilter)initWithValue:(double)a3;
- (double)currentValue;
- (double)updatedValue:(double)a3 withTargetValue:(double)a4;
- (void)setCurrentValue:(double)a3;
- (void)setInputValue:(double)a3;
@end

@implementation PUValueFilter

- (void)setCurrentValue:(double)a3
{
  self->_currentValue = a3;
}

- (double)currentValue
{
  return self->_currentValue;
}

- (double)updatedValue:(double)a3 withTargetValue:(double)a4
{
  return a4;
}

- (void)setInputValue:(double)a3
{
  [(PUValueFilter *)self currentValue];
  -[PUValueFilter updatedValue:withTargetValue:](self, "updatedValue:withTargetValue:");
  -[PUValueFilter setCurrentValue:](self, "setCurrentValue:");
}

- (PUValueFilter)initWithValue:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PUValueFilter;
  result = [(PUValueFilter *)&v5 init];
  if (result) {
    result->_currentValue = a3;
  }
  return result;
}

- (PUValueFilter)init
{
  return [(PUValueFilter *)self initWithValue:0.0];
}

@end