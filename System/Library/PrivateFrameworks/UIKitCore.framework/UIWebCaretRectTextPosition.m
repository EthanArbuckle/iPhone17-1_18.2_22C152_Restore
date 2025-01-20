@interface UIWebCaretRectTextPosition
+ (id)textPositionWithCaretRect:(CGRect)a3;
- (CGRect)caretRect;
- (UIWebCaretRectTextPosition)initWithCaretRect:(CGRect)a3;
@end

@implementation UIWebCaretRectTextPosition

+ (id)textPositionWithCaretRect:(CGRect)a3
{
  v3 = objc_msgSend(objc_alloc((Class)a1), "initWithCaretRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return v3;
}

- (UIWebCaretRectTextPosition)initWithCaretRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)UIWebCaretRectTextPosition;
  result = [(UIWebCaretRectTextPosition *)&v8 init];
  if (result)
  {
    result->_caretRect.origin.CGFloat x = x;
    result->_caretRect.origin.CGFloat y = y;
    result->_caretRect.size.CGFloat width = width;
    result->_caretRect.size.CGFloat height = height;
  }
  return result;
}

- (CGRect)caretRect
{
  double x = self->_caretRect.origin.x;
  double y = self->_caretRect.origin.y;
  double width = self->_caretRect.size.width;
  double height = self->_caretRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

@end