@interface TSDTextSelectionRect
- (BOOL)containsEnd;
- (BOOL)containsStart;
- (BOOL)isVertical;
- (CGRect)rect;
- (TSDTextSelectionRect)initWithRect:(CGRect)a3 direction:(int64_t)a4 range:(id)a5 containsStart:(BOOL)a6 containsEnd:(BOOL)a7 isVertical:(BOOL)a8;
- (UITextRange)range;
- (int64_t)writingDirection;
- (void)dealloc;
- (void)setRange:(id)a3;
@end

@implementation TSDTextSelectionRect

- (TSDTextSelectionRect)initWithRect:(CGRect)a3 direction:(int64_t)a4 range:(id)a5 containsStart:(BOOL)a6 containsEnd:(BOOL)a7 isVertical:(BOOL)a8
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v20.receiver = self;
  v20.super_class = (Class)TSDTextSelectionRect;
  v17 = [(TSDTextSelectionRect *)&v20 init];
  v18 = v17;
  if (v17)
  {
    v17->_rect.origin.CGFloat x = x;
    v17->_rect.origin.CGFloat y = y;
    v17->_rect.size.CGFloat width = width;
    v17->_rect.size.CGFloat height = height;
    v17->_writingDirection = a4;
    v17->_range = (UITextRange *)a5;
    v18->_containsStart = a6;
    v18->_containsEnd = a7;
    v18->_isVertical = a8;
  }
  return v18;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSDTextSelectionRect;
  [(TSDTextSelectionRect *)&v3 dealloc];
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
  return self->_writingDirection;
}

- (UITextRange)range
{
  return self->_range;
}

- (void)setRange:(id)a3
{
}

- (BOOL)containsStart
{
  return self->_containsStart;
}

- (BOOL)containsEnd
{
  return self->_containsEnd;
}

- (BOOL)isVertical
{
  return self->_isVertical;
}

@end