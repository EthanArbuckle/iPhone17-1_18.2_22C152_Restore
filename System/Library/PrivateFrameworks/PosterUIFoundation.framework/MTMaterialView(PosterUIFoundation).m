@interface MTMaterialView(PosterUIFoundation)
+ (id)pui_homeScreenLegibilityMaterialView;
@end

@implementation MTMaterialView(PosterUIFoundation)

+ (id)pui_homeScreenLegibilityMaterialView
{
  v0 = (void *)MEMORY[0x263F53FE8];
  v1 = PUIHomeScreenLegibilityMaterialRecipeBundle();
  v2 = [v0 materialViewWithRecipeNamed:@"homeScreenLegibility" inBundle:v1 options:0 initialWeighting:PUIHomeScreenLegibilityMaterialRecipeScaleAdjustment scaleAdjustment:0.9];

  [v2 setUseBuiltInAlphaTransformerAndBackdropScaleAdjustment:PUIHomeScreenLegibilityMaterialShouldAdjustAlphaForWeighting()];
  [v2 setWeighting:1.0];
  return v2;
}

@end