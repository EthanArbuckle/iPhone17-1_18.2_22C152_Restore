@interface FBSSceneSpecification(UIOverlaySceneSpecification)
- (uint64_t)overlayAppSceneConfigurationName;
@end

@implementation FBSSceneSpecification(UIOverlaySceneSpecification)

- (uint64_t)overlayAppSceneConfigurationName
{
  return 0;
}

@end