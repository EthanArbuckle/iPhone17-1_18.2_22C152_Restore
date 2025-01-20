@interface SBWindowDragSwitcherModifierEvent
- (BOOL)isDraggingFromContinuousExposeStrips;
- (BOOL)isWindowDragGestureEvent;
- (CGPoint)locationInSelectedDisplayItem;
- (CGSize)sizeOfSelectedDisplayItem;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setDraggingFromContinuousExposeStrips:(BOOL)a3;
- (void)setLocationInSelectedDisplayItem:(CGPoint)a3;
- (void)setSizeOfSelectedDisplayItem:(CGSize)a3;
@end

@implementation SBWindowDragSwitcherModifierEvent

- (id)copyWithZone:(_NSZone *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBWindowDragSwitcherModifierEvent;
  id result = [(SBGestureSwitcherModifierEvent *)&v5 copyWithZone:a3];
  *((unsigned char *)result + 152) = self->_draggingFromContinuousExposeStrips;
  *((_OWORD *)result + 10) = self->_locationInSelectedDisplayItem;
  *((_OWORD *)result + 11) = self->_sizeOfSelectedDisplayItem;
  return result;
}

- (BOOL)isWindowDragGestureEvent
{
  return 1;
}

- (BOOL)isDraggingFromContinuousExposeStrips
{
  return self->_draggingFromContinuousExposeStrips;
}

- (void)setDraggingFromContinuousExposeStrips:(BOOL)a3
{
  self->_draggingFromContinuousExposeStrips = a3;
}

- (CGPoint)locationInSelectedDisplayItem
{
  double x = self->_locationInSelectedDisplayItem.x;
  double y = self->_locationInSelectedDisplayItem.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setLocationInSelectedDisplayItem:(CGPoint)a3
{
  self->_locationInSelectedDisplayItem = a3;
}

- (CGSize)sizeOfSelectedDisplayItem
{
  double width = self->_sizeOfSelectedDisplayItem.width;
  double height = self->_sizeOfSelectedDisplayItem.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setSizeOfSelectedDisplayItem:(CGSize)a3
{
  self->_sizeOfSelectedDisplayItem = a3;
}

@end