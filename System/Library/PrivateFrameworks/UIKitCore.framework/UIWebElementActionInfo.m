@interface UIWebElementActionInfo
- (CGPoint)interactionLocation;
- (void)_setInteractionLocation:(CGPoint)a3;
@end

@implementation UIWebElementActionInfo

- (void)_setInteractionLocation:(CGPoint)a3
{
  self->_interactionLocation = a3;
}

- (CGPoint)interactionLocation
{
  double x = self->_interactionLocation.x;
  double y = self->_interactionLocation.y;
  result.double y = y;
  result.double x = x;
  return result;
}

@end