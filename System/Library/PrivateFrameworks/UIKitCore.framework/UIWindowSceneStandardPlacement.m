@interface UIWindowSceneStandardPlacement
+ (UIWindowSceneStandardPlacement)standardPlacement;
+ (unint64_t)_placementType;
- (id)_createConfigurationWithError:(id *)a3;
@end

@implementation UIWindowSceneStandardPlacement

+ (unint64_t)_placementType
{
  return 1;
}

+ (UIWindowSceneStandardPlacement)standardPlacement
{
  v2 = (void *)[objc_alloc((Class)a1) _init];
  return (UIWindowSceneStandardPlacement *)v2;
}

- (id)_createConfigurationWithError:(id *)a3
{
  id v3 = objc_alloc_init(MEMORY[0x1E4FB3470]);
  return v3;
}

@end