@interface FBScene(_UIPhysicalButtonConfigurationHostSceneComponent)
- (uint64_t)_physicalButtonConfigurationHostSceneComponent;
@end

@implementation FBScene(_UIPhysicalButtonConfigurationHostSceneComponent)

- (uint64_t)_physicalButtonConfigurationHostSceneComponent
{
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  return [a1 componentForExtension:v2 ofClass:v3];
}

@end