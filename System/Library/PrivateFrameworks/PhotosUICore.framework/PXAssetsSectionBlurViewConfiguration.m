@interface PXAssetsSectionBlurViewConfiguration
- (PXAssetsSectionBlurViewConfiguration)init;
- (PXAssetsSectionBlurViewConfiguration)initWithIntensity:(double)a3 maximumBlurRadius:(double)a4 maximumDimmingFraction:(double)a5;
- (double)intensity;
- (double)maximumBlurRadius;
- (double)maximumDimmingFraction;
@end

@implementation PXAssetsSectionBlurViewConfiguration

- (double)maximumDimmingFraction
{
  return self->_maximumDimmingFraction;
}

- (double)maximumBlurRadius
{
  return self->_maximumBlurRadius;
}

- (double)intensity
{
  return self->_intensity;
}

- (PXAssetsSectionBlurViewConfiguration)initWithIntensity:(double)a3 maximumBlurRadius:(double)a4 maximumDimmingFraction:(double)a5
{
  v9.receiver = self;
  v9.super_class = (Class)PXAssetsSectionBlurViewConfiguration;
  result = [(PXAssetsSectionBlurViewConfiguration *)&v9 init];
  if (result)
  {
    result->_intensity = a3;
    result->_maximumBlurRadius = a4;
    result->_maximumDimmingFraction = a5;
  }
  return result;
}

- (PXAssetsSectionBlurViewConfiguration)init
{
  return [(PXAssetsSectionBlurViewConfiguration *)self initWithIntensity:0.0 maximumBlurRadius:0.0 maximumDimmingFraction:0.0];
}

@end