@interface CounterObj
- (unint64_t)count;
- (void)increment;
- (void)setCount:(unint64_t)a3;
@end

@implementation CounterObj

- (void)increment
{
}

- (unint64_t)count
{
  return self->_count;
}

- (void)setCount:(unint64_t)a3
{
  self->_count = a3;
}

@end