@interface FBSSceneClientSettings(UIApplicationSceneClientSettings)
- (uint64_t)isUISubclass;
@end

@implementation FBSSceneClientSettings(UIApplicationSceneClientSettings)

- (uint64_t)isUISubclass
{
  return 0;
}

@end