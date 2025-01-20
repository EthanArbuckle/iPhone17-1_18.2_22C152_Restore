@interface FBSSceneSettings(UIApplicationSceneSettings)
- (uint64_t)isUISubclass;
@end

@implementation FBSSceneSettings(UIApplicationSceneSettings)

- (uint64_t)isUISubclass
{
  return 0;
}

@end