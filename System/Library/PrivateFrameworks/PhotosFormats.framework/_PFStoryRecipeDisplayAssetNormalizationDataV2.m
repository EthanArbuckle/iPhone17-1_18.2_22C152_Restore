@interface _PFStoryRecipeDisplayAssetNormalizationDataV2
+ (id)limits;
- (_PFStoryRecipeDisplayAssetNormalizationDataV2)initWithSliderNetPackedDataV2:(id *)a3;
@end

@implementation _PFStoryRecipeDisplayAssetNormalizationDataV2

- (_PFStoryRecipeDisplayAssetNormalizationDataV2)initWithSliderNetPackedDataV2:(id *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_PFStoryRecipeDisplayAssetNormalizationDataV2;
  return [(_PFStoryRecipeDisplayAssetNormalizationDataV1 *)&v4 initWithSliderNetPackedDataV1:a3];
}

+ (id)limits
{
  if (limits_onceToken_192 != -1) {
    dispatch_once(&limits_onceToken_192, &__block_literal_global_195);
  }
  v2 = (void *)limits_limitsV1_193;

  return v2;
}

@end