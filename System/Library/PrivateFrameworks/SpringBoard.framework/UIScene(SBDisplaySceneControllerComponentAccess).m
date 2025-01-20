@interface UIScene(SBDisplaySceneControllerComponentAccess)
- (uint64_t)sb_displaySceneControllerComponent;
@end

@implementation UIScene(SBDisplaySceneControllerComponentAccess)

- (uint64_t)sb_displaySceneControllerComponent
{
  return [a1 _sceneComponentForKey:@"SBDisplaySceneControllerComponentKey"];
}

@end