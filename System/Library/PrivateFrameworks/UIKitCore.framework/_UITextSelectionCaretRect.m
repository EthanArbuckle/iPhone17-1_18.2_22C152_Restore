@interface _UITextSelectionCaretRect
+ (id)selectionRectWithRect:(CGRect)a3;
- (BOOL)containsEnd;
- (BOOL)containsStart;
- (BOOL)isVertical;
- (CGRect)rect;
- (int64_t)writingDirection;
@end

@implementation _UITextSelectionCaretRect

+ (id)selectionRectWithRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v7 = (CGFloat *)objc_alloc_init((Class)objc_opt_class());
  v7[3] = x;
  v7[4] = y;
  v7[5] = width;
  v7[6] = height;
  return v7;
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

- (int64_t)writingDirection
{
  return -1;
}

- (BOOL)containsStart
{
  return 1;
}

- (BOOL)containsEnd
{
  return 1;
}

- (BOOL)isVertical
{
  return 0;
}

@end