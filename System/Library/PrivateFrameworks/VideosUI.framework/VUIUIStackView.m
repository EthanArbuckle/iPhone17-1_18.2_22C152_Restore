@interface VUIUIStackView
- (BOOL)alignmentFollowsDeviceOrientation;
- (BOOL)axisFollowsDeviceOrientation;
- (VUIUIStackView)initWithFrame:(CGRect)a3;
- (int64_t)lastOrientation;
- (void)setAlignmentFollowsDeviceOrientation:(BOOL)a3;
- (void)setAxisFollowsDeviceOrientation:(BOOL)a3;
- (void)setLastOrientation:(int64_t)a3;
@end

@implementation VUIUIStackView

- (VUIUIStackView)initWithFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VUIUIStackView;
  result = -[VUIUIStackView initWithFrame:](&v4, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result)
  {
    result->_axisFollowsDeviceOrientation = 1;
    result->_alignmentFollowsDeviceOrientation = 0;
    result->_lastOrientation = 0;
  }
  return result;
}

- (BOOL)axisFollowsDeviceOrientation
{
  return self->_axisFollowsDeviceOrientation;
}

- (void)setAxisFollowsDeviceOrientation:(BOOL)a3
{
  self->_axisFollowsDeviceOrientation = a3;
}

- (BOOL)alignmentFollowsDeviceOrientation
{
  return self->_alignmentFollowsDeviceOrientation;
}

- (void)setAlignmentFollowsDeviceOrientation:(BOOL)a3
{
  self->_alignmentFollowsDeviceOrientation = a3;
}

- (int64_t)lastOrientation
{
  return self->_lastOrientation;
}

- (void)setLastOrientation:(int64_t)a3
{
  self->_lastOrientation = a3;
}

@end