@interface SBBannerUnfurlSourceContext
- (CGPoint)referenceVelocity;
- (CGRect)referenceCoordinateSpaceBounds;
- (CGRect)referenceFrame;
- (double)cornerRadius;
- (id)_copyWithClass:(Class)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
@end

@implementation SBBannerUnfurlSourceContext

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_opt_class();
  return [(SBBannerUnfurlSourceContext *)self _copyWithClass:v4];
}

- (id)_copyWithClass:(Class)a3
{
  id result = objc_alloc_init(a3);
  if (result)
  {
    *((void *)result + 1) = *(void *)&self->_cornerRadius;
    CGSize size = self->_referenceCoordinateSpaceBounds.size;
    *((_OWORD *)result + 1) = self->_referenceCoordinateSpaceBounds.origin;
    *((CGSize *)result + 2) = size;
    CGSize v6 = self->_referenceFrame.size;
    *((_OWORD *)result + 3) = self->_referenceFrame.origin;
    *((CGSize *)result + 4) = v6;
    *((_OWORD *)result + 5) = self->_referenceVelocity;
  }
  return result;
}

- (CGRect)referenceCoordinateSpaceBounds
{
  double x = self->_referenceCoordinateSpaceBounds.origin.x;
  double y = self->_referenceCoordinateSpaceBounds.origin.y;
  double width = self->_referenceCoordinateSpaceBounds.size.width;
  double height = self->_referenceCoordinateSpaceBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)referenceFrame
{
  double x = self->_referenceFrame.origin.x;
  double y = self->_referenceFrame.origin.y;
  double width = self->_referenceFrame.size.width;
  double height = self->_referenceFrame.size.height;
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

- (CGPoint)referenceVelocity
{
  double x = self->_referenceVelocity.x;
  double y = self->_referenceVelocity.y;
  result.double y = y;
  result.double x = x;
  return result;
}

@end