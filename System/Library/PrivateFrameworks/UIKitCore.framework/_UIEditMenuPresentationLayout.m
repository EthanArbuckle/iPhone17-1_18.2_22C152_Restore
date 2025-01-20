@interface _UIEditMenuPresentationLayout
- (CGPoint)anchorPoint;
- (CGPoint)menuPosition;
- (CGRect)containerBounds;
- (CGRect)menuSourceRect;
- (id)description;
- (int64_t)arrowDirection;
- (void)setAnchorPoint:(CGPoint)a3;
- (void)setArrowDirection:(int64_t)a3;
- (void)setContainerBounds:(CGRect)a3;
- (void)setMenuPosition:(CGPoint)a3;
- (void)setMenuSourceRect:(CGRect)a3;
@end

@implementation _UIEditMenuPresentationLayout

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithString:@"UIEditMenuPresentationLayout:\n"];
  v4 = NSStringFromCGRect(self->_containerBounds);
  [v3 appendFormat:@"\t containerBounds: %@,\n", v4];

  v5 = NSStringFromCGPoint(self->_anchorPoint);
  [v3 appendFormat:@"\t anchorPoint: %@,\n", v5];

  v6 = NSStringFromCGPoint(self->_menuPosition);
  [v3 appendFormat:@"\t menuPosition: %@,\n", v6];

  objc_msgSend(v3, "appendFormat:", @"\t arrowDirection: %ld,\n", self->_arrowDirection);
  v7 = NSStringFromCGRect(self->_menuSourceRect);
  [v3 appendFormat:@"\t menuSourceRect: %@,\n", v7];

  v8 = (void *)[v3 copy];
  return v8;
}

- (CGRect)containerBounds
{
  double x = self->_containerBounds.origin.x;
  double y = self->_containerBounds.origin.y;
  double width = self->_containerBounds.size.width;
  double height = self->_containerBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setContainerBounds:(CGRect)a3
{
  self->_containerBounds = a3;
}

- (CGPoint)anchorPoint
{
  double x = self->_anchorPoint.x;
  double y = self->_anchorPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setAnchorPoint:(CGPoint)a3
{
  self->_anchorPoint = a3;
}

- (CGPoint)menuPosition
{
  double x = self->_menuPosition.x;
  double y = self->_menuPosition.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setMenuPosition:(CGPoint)a3
{
  self->_menuPosition = a3;
}

- (int64_t)arrowDirection
{
  return self->_arrowDirection;
}

- (void)setArrowDirection:(int64_t)a3
{
  self->_arrowDirection = a3;
}

- (CGRect)menuSourceRect
{
  double x = self->_menuSourceRect.origin.x;
  double y = self->_menuSourceRect.origin.y;
  double width = self->_menuSourceRect.size.width;
  double height = self->_menuSourceRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setMenuSourceRect:(CGRect)a3
{
  self->_menuSourceRect = a3;
}

@end