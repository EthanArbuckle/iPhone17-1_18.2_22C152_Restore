@interface VKCQuickActionLayoutInfo
- (BOOL)hidden;
- (CGRect)desiredFrame;
- (CGRect)frame;
- (UIView)view;
- (void)setDesiredFrame:(CGRect)a3;
- (void)setFrame:(CGRect)a3;
- (void)setHidden:(BOOL)a3;
- (void)setView:(id)a3;
@end

@implementation VKCQuickActionLayoutInfo

- (UIView)view
{
  return self->_view;
}

- (void)setView:(id)a3
{
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

- (CGRect)desiredFrame
{
  double x = self->_desiredFrame.origin.x;
  double y = self->_desiredFrame.origin.y;
  double width = self->_desiredFrame.size.width;
  double height = self->_desiredFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setDesiredFrame:(CGRect)a3
{
  self->_desiredFrame = a3;
}

- (BOOL)hidden
{
  return self->_hidden;
}

- (void)setHidden:(BOOL)a3
{
  self->_hidden = a3;
}

- (void).cxx_destruct
{
}

@end