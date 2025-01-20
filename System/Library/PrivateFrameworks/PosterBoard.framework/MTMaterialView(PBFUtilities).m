@interface MTMaterialView(PBFUtilities)
+ (id)pbf_materialView;
+ (uint64_t)pbf_dockView;
+ (uint64_t)pbf_iconView;
- (void)pbf_scaleBlurRadiusByAmount:()PBFUtilities;
@end

@implementation MTMaterialView(PBFUtilities)

+ (id)pbf_materialView
{
  v0 = [MEMORY[0x1E4F743C8] materialViewWithRecipe:54];
  [v0 setBackdropScaleAdjustment:&__block_literal_global_51];
  return v0;
}

+ (uint64_t)pbf_dockView
{
  return [MEMORY[0x1E4F743C8] materialViewWithRecipe:19];
}

+ (uint64_t)pbf_iconView
{
  return [MEMORY[0x1E4F743C8] materialViewWithRecipe:3];
}

- (void)pbf_scaleBlurRadiusByAmount:()PBFUtilities
{
  if ((BSFloatIsOne() & 1) == 0)
  {
    id v8 = [a1 layer];
    v4 = [v8 valueForKeyPath:@"filters.gaussianBlur.inputRadius"];
    [v4 doubleValue];
    double v6 = v5;

    v7 = [NSNumber numberWithDouble:v6 * a2];
    [v8 setValue:v7 forKeyPath:@"filters.gaussianBlur.inputRadius"];
  }
}

@end