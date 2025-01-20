@interface _RSCamera
- (CGSize)imageResolution;
- (__n128)intrinsics;
- (__n128)pose;
- (__n128)setIntrinsics:(__n128)a3;
- (__n128)setPose:(__n128)a3;
- (__n128)setTransform:(__n128)a3;
- (__n128)transform;
- (int64_t)trackingState;
- (void)setImageResolution:(CGSize)a3;
- (void)setTrackingState:(int64_t)a3;
@end

@implementation _RSCamera

- (void)setTrackingState:(int64_t)a3
{
  self->_trackingState = a3;
}

- (int64_t)trackingState
{
  return self->_trackingState;
}

- (void)setImageResolution:(CGSize)a3
{
  self->_imageResolution = a3;
}

- (CGSize)imageResolution
{
  double width = self->_imageResolution.width;
  double height = self->_imageResolution.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (__n128)setIntrinsics:(__n128)a3
{
  result[2] = a2;
  result[3] = a3;
  result[4] = a4;
  return result;
}

- (__n128)intrinsics
{
  return a1[2];
}

- (__n128)setPose:(__n128)a3
{
  result[9] = a2;
  result[10] = a3;
  result[11] = a4;
  result[12] = a5;
  return result;
}

- (__n128)pose
{
  return a1[9];
}

- (__n128)setTransform:(__n128)a3
{
  result[5] = a2;
  result[6] = a3;
  result[7] = a4;
  result[8] = a5;
  return result;
}

- (__n128)transform
{
  return a1[5];
}

@end