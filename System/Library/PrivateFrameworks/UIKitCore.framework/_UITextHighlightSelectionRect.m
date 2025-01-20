@interface _UITextHighlightSelectionRect
+ (id)endingSelectionRectWithRect:(CGRect)a3;
+ (id)selectionRectWithRect:(CGRect)a3;
+ (id)startingSelectionRectWithRect:(CGRect)a3;
- (BOOL)containsEnd;
- (BOOL)containsStart;
- (CGRect)rect;
- (void)setContainsEnd:(BOOL)a3;
- (void)setContainsStart:(BOOL)a3;
- (void)setRect:(CGRect)a3;
@end

@implementation _UITextHighlightSelectionRect

+ (id)selectionRectWithRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v7 = objc_alloc_init(_UITextHighlightSelectionRect);
  v7->_rect.origin.CGFloat x = x;
  v7->_rect.origin.CGFloat y = y;
  v7->_rect.size.CGFloat width = width;
  v7->_rect.size.CGFloat height = height;
  return v7;
}

+ (id)startingSelectionRectWithRect:(CGRect)a3
{
  id result = +[_UITextHighlightSelectionRect selectionRectWithRect:](_UITextHighlightSelectionRect, "selectionRectWithRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  *((unsigned char *)result + 24) = 1;
  return result;
}

+ (id)endingSelectionRectWithRect:(CGRect)a3
{
  id result = +[_UITextHighlightSelectionRect selectionRectWithRect:](_UITextHighlightSelectionRect, "selectionRectWithRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  *((unsigned char *)result + 25) = 1;
  return result;
}

- (CGRect)rect
{
  double x = self->_rect.origin.x;
  double y = self->_rect.origin.y;
  double width = self->_rect.size.width;
  double height = self->_rect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setRect:(CGRect)a3
{
  self->_rect = a3;
}

- (BOOL)containsStart
{
  return self->_containsStart;
}

- (void)setContainsStart:(BOOL)a3
{
  self->_containsStart = a3;
}

- (BOOL)containsEnd
{
  return self->_containsEnd;
}

- (void)setContainsEnd:(BOOL)a3
{
  self->_containsEnd = a3;
}

@end