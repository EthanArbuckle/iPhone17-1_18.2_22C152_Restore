@interface SBReverseCountedSemaphore
- (BOOL)waitWithTimeout:(double)a3;
- (SBReverseCountedSemaphore)init;
- (void)decrement;
- (void)increment;
@end

@implementation SBReverseCountedSemaphore

- (SBReverseCountedSemaphore)init
{
  v6.receiver = self;
  v6.super_class = (Class)SBReverseCountedSemaphore;
  v2 = [(SBReverseCountedSemaphore *)&v6 init];
  if (v2)
  {
    dispatch_group_t v3 = dispatch_group_create();
    group = v2->_group;
    v2->_group = (OS_dispatch_group *)v3;
  }
  return v2;
}

- (void)increment
{
}

- (void)decrement
{
}

- (BOOL)waitWithTimeout:(double)a3
{
  if (a3 <= 0.0) {
    dispatch_time_t v4 = -1;
  }
  else {
    dispatch_time_t v4 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  }
  return dispatch_group_wait((dispatch_group_t)self->_group, v4) == 0;
}

- (void).cxx_destruct
{
}

@end