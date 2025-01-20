@interface PXTitleLegibilityDimmingViewConfiguration
- (NSString)gradientImageName;
- (PXTitleLegibilityDimmingViewConfiguration)initWithGradientImageName:(id)a3;
@end

@implementation PXTitleLegibilityDimmingViewConfiguration

- (void).cxx_destruct
{
}

- (NSString)gradientImageName
{
  return self->_gradientImageName;
}

- (PXTitleLegibilityDimmingViewConfiguration)initWithGradientImageName:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXTitleLegibilityDimmingViewConfiguration;
  v6 = [(PXTitleLegibilityDimmingViewConfiguration *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_gradientImageName, a3);
  }

  return v7;
}

@end