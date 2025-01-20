@interface UIInterfaceOrientationFromCATransform3D
@end

@implementation UIInterfaceOrientationFromCATransform3D

CGFloat ___UIInterfaceOrientationFromCATransform3D_block_invoke()
{
  CATransform3DMakeRotation(&v1, 0.0, 0.0, 0.0, 1.0);
  *(CATransform3D *)byte_1EB265178 = v1;
  CATransform3DMakeRotation(&v1, -1.57079633, 0.0, 0.0, 1.0);
  *(CATransform3D *)byte_1EB265278 = v1;
  CATransform3DMakeRotation(&v1, 1.57079633, 0.0, 0.0, 1.0);
  *(CATransform3D *)byte_1EB2652F8 = v1;
  CATransform3DMakeRotation(&v1, 3.14159265, 0.0, 0.0, 1.0);
  *(CATransform3D *)byte_1EB2651F8 = v1;
  return v1.m21;
}

@end