@interface _UIStatusBarFadeAnimationParameters
- (BOOL)itemAppearing;
- (CGRect)frame;
- (unint64_t)options;
- (void)setFrame:(CGRect)a3;
- (void)setItemAppearing:(BOOL)a3;
- (void)setOptions:(unint64_t)a3;
@end

@implementation _UIStatusBarFadeAnimationParameters

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (CGRect)frame
{
  double x = self->_frame.origin.x;
  double y = self->_frame.origin.y;
  double width = self->_frame.size.width;
  double height = self->_frame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  self->_frame = a3;
}

- (BOOL)itemAppearing
{
  return self->_itemAppearing;
}

- (void)setItemAppearing:(BOOL)a3
{
  self->_itemAppearing = a3;
}

@end