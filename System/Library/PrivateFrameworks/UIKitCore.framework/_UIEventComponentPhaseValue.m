@interface _UIEventComponentPhaseValue
- (_UIEventComponentPhaseValue)initWithValue:(int64_t)a3 underlyingValue:(int64_t)a4;
- (int64_t)underlyingValue;
- (int64_t)value;
@end

@implementation _UIEventComponentPhaseValue

- (int64_t)underlyingValue
{
  return self->_underlyingValue;
}

- (int64_t)value
{
  return self->_value;
}

- (_UIEventComponentPhaseValue)initWithValue:(int64_t)a3 underlyingValue:(int64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)_UIEventComponentPhaseValue;
  result = [(_UIEventComponentPhaseValue *)&v7 init];
  if (result)
  {
    result->_value = a3;
    result->_underlyingValue = a4;
  }
  return result;
}

@end