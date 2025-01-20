@interface _VUIDecoratorRequest
- (BOOL)statusCancelled;
- (void)setStatusCancelled:(BOOL)a3;
@end

@implementation _VUIDecoratorRequest

- (BOOL)statusCancelled
{
  return self->_statusCancelled;
}

- (void)setStatusCancelled:(BOOL)a3
{
  self->_statusCancelled = a3;
}

@end