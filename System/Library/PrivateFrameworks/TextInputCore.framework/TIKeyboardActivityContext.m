@interface TIKeyboardActivityContext
+ (id)contextFromState:(unint64_t)a3 toState:(unint64_t)a4;
- (unint64_t)excessMemoryInBytes;
- (unint64_t)fromState;
- (unint64_t)toState;
- (void)setExcessMemoryInBytes:(unint64_t)a3;
- (void)setFromState:(unint64_t)a3;
- (void)setToState:(unint64_t)a3;
@end

@implementation TIKeyboardActivityContext

+ (id)contextFromState:(unint64_t)a3 toState:(unint64_t)a4
{
  id v6 = objc_alloc_init((Class)a1);
  [v6 setFromState:a3];
  [v6 setToState:a4];

  return v6;
}

- (void)setExcessMemoryInBytes:(unint64_t)a3
{
  self->_excessMemoryInBytes = a3;
}

- (unint64_t)excessMemoryInBytes
{
  return self->_excessMemoryInBytes;
}

- (void)setToState:(unint64_t)a3
{
  self->_toState = a3;
}

- (unint64_t)toState
{
  return self->_toState;
}

- (void)setFromState:(unint64_t)a3
{
  self->_fromState = a3;
}

- (unint64_t)fromState
{
  return self->_fromState;
}

@end