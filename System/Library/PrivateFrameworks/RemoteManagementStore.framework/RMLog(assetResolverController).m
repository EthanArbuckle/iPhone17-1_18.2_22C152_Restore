@interface RMLog(assetResolverController)
+ (id)assetResolverController;
@end

@implementation RMLog(assetResolverController)

+ (id)assetResolverController
{
  if (assetResolverController_onceToken != -1) {
    dispatch_once(&assetResolverController_onceToken, &__block_literal_global);
  }
  v0 = (void *)assetResolverController_result;
  return v0;
}

@end