@interface SBMutableBannerUnfurlSourceContext
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (void)setCornerRadius:(double)a3;
- (void)setReferenceCoordinateSpaceBounds:(CGRect)a3;
- (void)setReferenceFrame:(CGRect)a3;
- (void)setReferenceVelocity:(CGPoint)a3;
@end

@implementation SBMutableBannerUnfurlSourceContext

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_opt_class();
  return [(SBBannerUnfurlSourceContext *)self _copyWithClass:v4];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_opt_class();
  return [(SBBannerUnfurlSourceContext *)self _copyWithClass:v4];
}

- (void)setCornerRadius:(double)a3
{
  self->super._cornerRadius = a3;
}

- (void)setReferenceCoordinateSpaceBounds:(CGRect)a3
{
  self->super._referenceCoordinateSpaceBounds = a3;
}

- (void)setReferenceFrame:(CGRect)a3
{
  self->super._referenceFrame = a3;
}

- (void)setReferenceVelocity:(CGPoint)a3
{
  self->super._referenceVelocity = a3;
}

@end