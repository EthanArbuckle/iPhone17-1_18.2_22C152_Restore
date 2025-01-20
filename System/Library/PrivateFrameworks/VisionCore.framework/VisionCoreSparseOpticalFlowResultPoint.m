@interface VisionCoreSparseOpticalFlowResultPoint
- (BOOL)isInlier;
- (CGPoint)point;
- (VisionCoreSparseOpticalFlowResultPoint)initWithX:(double)a3 Y:(double)a4 inlier:(BOOL)a5 reprojError:(float)a6;
- (float)reprojError;
@end

@implementation VisionCoreSparseOpticalFlowResultPoint

- (CGPoint)point
{
  double x = self->_point.x;
  double y = self->_point.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (BOOL)isInlier
{
  return self->_isInlier;
}

- (float)reprojError
{
  return self->_reprojError;
}

- (VisionCoreSparseOpticalFlowResultPoint)initWithX:(double)a3 Y:(double)a4 inlier:(BOOL)a5 reprojError:(float)a6
{
  v11.receiver = self;
  v11.super_class = (Class)VisionCoreSparseOpticalFlowResultPoint;
  CGPoint result = [(VisionCoreSparseOpticalFlowResultPoint *)&v11 init];
  if (result)
  {
    result->_reprojError = a6;
    result->_point.double x = a3;
    result->_point.double y = a4;
    result->_isInlier = a5;
  }
  return result;
}

@end