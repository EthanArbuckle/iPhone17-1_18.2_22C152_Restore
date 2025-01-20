@interface SBSetupPIPMorphingSwitcherEventResponse
- (CGRect)appLayoutBoundingBox;
- (int64_t)type;
- (void)setAppLayoutBoundingBox:(CGRect)a3;
@end

@implementation SBSetupPIPMorphingSwitcherEventResponse

- (int64_t)type
{
  return 25;
}

- (CGRect)appLayoutBoundingBox
{
  double x = self->_appLayoutBoundingBox.origin.x;
  double y = self->_appLayoutBoundingBox.origin.y;
  double width = self->_appLayoutBoundingBox.size.width;
  double height = self->_appLayoutBoundingBox.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setAppLayoutBoundingBox:(CGRect)a3
{
  self->_appLayoutBoundingBodouble x = a3;
}

@end