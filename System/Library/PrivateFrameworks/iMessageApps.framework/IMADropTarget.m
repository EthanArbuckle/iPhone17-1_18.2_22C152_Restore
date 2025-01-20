@interface IMADropTarget
- (CGPoint)screenCoordinate;
- (CGSize)initialSize;
- (IMADropTarget)initWithScreenCoordinate:(CGPoint)a3 initialSize:(CGSize)a4 scale:(double)a5 meshScaleFactor:(double)a6 rotation:(double)a7;
- (double)meshScaleFactor;
- (double)rotation;
- (double)scale;
- (id)description;
@end

@implementation IMADropTarget

- (IMADropTarget)initWithScreenCoordinate:(CGPoint)a3 initialSize:(CGSize)a4 scale:(double)a5 meshScaleFactor:(double)a6 rotation:(double)a7
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  v15.receiver = self;
  v15.super_class = (Class)IMADropTarget;
  result = [(IMADropTarget *)&v15 init];
  if (result)
  {
    result->_screenCoordinate.CGFloat y = y;
    result->_initialSize.CGFloat width = width;
    result->_initialSize.CGFloat height = height;
    result->_scale = a5;
    result->_meshScaleFactor = a6;
    result->_rotation = a7;
    result->_screenCoordinate.CGFloat x = x;
  }
  return result;
}

- (id)description
{
  v3 = NSString;
  [(IMADropTarget *)self screenCoordinate];
  v4 = NSStringFromCGPoint(v12);
  [(IMADropTarget *)self initialSize];
  v5 = NSStringFromCGSize(v13);
  [(IMADropTarget *)self scale];
  uint64_t v7 = v6;
  [(IMADropTarget *)self rotation];
  v9 = [v3 stringWithFormat:@"IMADropTarget coord: %@ size %@ scale %f rotation %f", v4, v5, v7, v8];

  return v9;
}

- (CGPoint)screenCoordinate
{
  double x = self->_screenCoordinate.x;
  double y = self->_screenCoordinate.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGSize)initialSize
{
  double width = self->_initialSize.width;
  double height = self->_initialSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (double)scale
{
  return self->_scale;
}

- (double)meshScaleFactor
{
  return self->_meshScaleFactor;
}

- (double)rotation
{
  return self->_rotation;
}

@end