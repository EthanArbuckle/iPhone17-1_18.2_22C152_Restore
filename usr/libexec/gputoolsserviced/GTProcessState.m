@interface GTProcessState
- (BOOL)isSuspended;
- (void)setIsSuspended:(BOOL)a3;
@end

@implementation GTProcessState

- (BOOL)isSuspended
{
  return self->_isSuspended;
}

- (void)setIsSuspended:(BOOL)a3
{
  self->_isSuspended = a3;
}

@end