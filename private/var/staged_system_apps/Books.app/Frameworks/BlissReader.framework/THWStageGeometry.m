@interface THWStageGeometry
- (CGRect)frame;
- (THWStageGeometry)initWithFrame:(CGRect)a3 cornerRadius:(double)a4;
- (double)cornerRadius;
@end

@implementation THWStageGeometry

- (THWStageGeometry)initWithFrame:(CGRect)a3 cornerRadius:(double)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v10.receiver = self;
  v10.super_class = (Class)THWStageGeometry;
  result = [(THWStageGeometry *)&v10 init];
  if (result)
  {
    result->_frame.origin.CGFloat y = y;
    result->_frame.size.CGFloat width = width;
    result->_frame.size.CGFloat height = height;
    result->_cornerRadius = a4;
    result->_frame.origin.CGFloat x = x;
  }
  return result;
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

- (double)cornerRadius
{
  return self->_cornerRadius;
}

@end