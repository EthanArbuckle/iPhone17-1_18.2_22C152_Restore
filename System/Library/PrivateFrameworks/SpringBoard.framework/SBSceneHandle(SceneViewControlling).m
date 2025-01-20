@interface SBSceneHandle(SceneViewControlling)
- (uint64_t)newScenePlaceholderContentContextWithActivationSettings:()SceneViewControlling;
- (uint64_t)newSceneViewController;
- (uint64_t)newSceneViewWithReferenceSize:()SceneViewControlling contentOrientation:containerOrientation:hostRequester:;
@end

@implementation SBSceneHandle(SceneViewControlling)

- (uint64_t)newSceneViewWithReferenceSize:()SceneViewControlling contentOrientation:containerOrientation:hostRequester:
{
  v12 = (objc_class *)MEMORY[0x1E4FA7980];
  id v13 = a7;
  uint64_t v14 = objc_msgSend([v12 alloc], "initWithSceneHandle:referenceSize:contentOrientation:containerOrientation:hostRequester:", a1, a5, a6, v13, a2, a3);

  return v14;
}

- (uint64_t)newScenePlaceholderContentContextWithActivationSettings:()SceneViewControlling
{
  return 0;
}

- (uint64_t)newSceneViewController
{
  v2 = [SBSceneViewController alloc];
  return (uint64_t)[(SBSceneViewController *)v2 initWithSceneHandle:a1];
}

@end