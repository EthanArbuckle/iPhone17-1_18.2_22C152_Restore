@interface UIInterfaceOrientationFromCATransform3D
@end

@implementation UIInterfaceOrientationFromCATransform3D

CGFloat ___UIInterfaceOrientationFromCATransform3D_block_invoke()
{
  CATransform3DMakeRotation(&v1, 0.0, 0.0, 0.0, 1.0);
  *(CATransform3D *)_UIInterfaceOrientationFromCATransform3D_canonicalPortraitTransform = v1;
  CATransform3DMakeRotation(&v1, -1.57079633, 0.0, 0.0, 1.0);
  *(CATransform3D *)_UIInterfaceOrientationFromCATransform3D_canonicalLandscapeLeftTransform = v1;
  CATransform3DMakeRotation(&v1, 1.57079633, 0.0, 0.0, 1.0);
  *(CATransform3D *)_UIInterfaceOrientationFromCATransform3D_canonicalLandscapeRightTransform = v1;
  CATransform3DMakeRotation(&v1, 3.14159265, 0.0, 0.0, 1.0);
  *(CATransform3D *)_UIInterfaceOrientationFromCATransform3D_canonicalPortraitUpsideDownTransform = v1;
  return v1.m21;
}

@end