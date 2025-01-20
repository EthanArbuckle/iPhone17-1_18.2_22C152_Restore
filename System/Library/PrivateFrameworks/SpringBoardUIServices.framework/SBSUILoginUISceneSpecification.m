@interface SBSUILoginUISceneSpecification
- (Class)clientSettingsClass;
@end

@implementation SBSUILoginUISceneSpecification

- (Class)clientSettingsClass
{
  return (Class)objc_opt_class();
}

@end