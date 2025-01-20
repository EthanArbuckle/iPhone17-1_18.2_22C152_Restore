@interface SBIconDraggingEditContext
- (BOOL)enteredScreenLocationNeedsUpdate;
- (CGPoint)enteredScreenLocation;
- (id)draggingUniqueIdentifier;
- (void)setDraggingUniqueIdentifier:(id)a3;
- (void)setEnteredScreenLocation:(CGPoint)a3;
- (void)setEnteredScreenLocationNeedsUpdate:(BOOL)a3;
@end

@implementation SBIconDraggingEditContext

- (id)draggingUniqueIdentifier
{
  return self->_draggingUniqueIdentifier;
}

- (void)setDraggingUniqueIdentifier:(id)a3
{
}

- (CGPoint)enteredScreenLocation
{
  double x = self->_enteredScreenLocation.x;
  double y = self->_enteredScreenLocation.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setEnteredScreenLocation:(CGPoint)a3
{
  self->_enteredScreenLocation = a3;
}

- (BOOL)enteredScreenLocationNeedsUpdate
{
  return self->_enteredScreenLocationNeedsUpdate;
}

- (void)setEnteredScreenLocationNeedsUpdate:(BOOL)a3
{
  self->_enteredScreenLocationNeedsUpdate = a3;
}

- (void).cxx_destruct
{
}

@end