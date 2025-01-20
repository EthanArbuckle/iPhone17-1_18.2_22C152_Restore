@interface _UISceneRenderingEnvironmentSettings
+ (id)protocol;
+ (void)configureSetting:(id)a3;
@end

@implementation _UISceneRenderingEnvironmentSettings

+ (id)protocol
{
  return &unk_1ED701240;
}

+ (void)configureSetting:(id)a3
{
  id v3 = a3;
  if (([v3 matchesProperty:sel_modern_isCapturingContentForAdditionalRenderingDestination] & 1) != 0
    || [v3 matchesProperty:sel_systemDisplayIdentifier])
  {
    [v3 setPropagating:1];
    [v3 setNullPreserving:1];
  }
}

@end