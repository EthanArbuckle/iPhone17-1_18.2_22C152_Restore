@interface UITextDragFinishState
- (BOOL)dragTearoffOccured;
- (CGPoint)location;
- (void)setDragTearoffOccured:(BOOL)a3;
- (void)setLocation:(CGPoint)a3;
@end

@implementation UITextDragFinishState

- (BOOL)dragTearoffOccured
{
  return self->_dragTearoffOccured;
}

- (void)setDragTearoffOccured:(BOOL)a3
{
  self->_dragTearoffOccured = a3;
}

- (CGPoint)location
{
  double x = self->_location.x;
  double y = self->_location.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setLocation:(CGPoint)a3
{
  self->_location = a3;
}

@end