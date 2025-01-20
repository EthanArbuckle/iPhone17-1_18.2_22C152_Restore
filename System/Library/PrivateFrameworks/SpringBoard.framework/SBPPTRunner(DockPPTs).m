@interface SBPPTRunner(DockPPTs)
- (id)_mainDisplayWindowScene;
@end

@implementation SBPPTRunner(DockPPTs)

- (id)_mainDisplayWindowScene
{
  v2 = [(id)SBApp windowSceneManager];
  v3 = [v2 connectedWindowScenes];
  v4 = objc_msgSend(v3, "bs_firstObjectPassingTest:", &__block_literal_global_234);

  return v4;
}

@end