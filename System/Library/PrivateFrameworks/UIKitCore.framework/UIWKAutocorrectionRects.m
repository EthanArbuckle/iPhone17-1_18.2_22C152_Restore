@interface UIWKAutocorrectionRects
- (CGRect)firstRect;
- (CGRect)lastRect;
- (void)setFirstRect:(CGRect)a3;
- (void)setLastRect:(CGRect)a3;
@end

@implementation UIWKAutocorrectionRects

- (CGRect)firstRect
{
  double x = self->_firstRect.origin.x;
  double y = self->_firstRect.origin.y;
  double width = self->_firstRect.size.width;
  double height = self->_firstRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setFirstRect:(CGRect)a3
{
  self->_firstRect = a3;
}

- (CGRect)lastRect
{
  double x = self->_lastRect.origin.x;
  double y = self->_lastRect.origin.y;
  double width = self->_lastRect.size.width;
  double height = self->_lastRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setLastRect:(CGRect)a3
{
  self->_lastRect = a3;
}

@end