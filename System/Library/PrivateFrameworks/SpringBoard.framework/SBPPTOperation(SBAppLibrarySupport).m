@interface SBPPTOperation(SBAppLibrarySupport)
+ (id)_mainDisplayWindowScene;
@end

@implementation SBPPTOperation(SBAppLibrarySupport)

+ (id)_mainDisplayWindowScene
{
  v2 = [(id)SBApp windowSceneManager];
  v3 = [v2 connectedWindowScenes];
  v4 = objc_msgSend(v3, "bs_firstObjectPassingTest:", &__block_literal_global_105_0);

  return v4;
}

@end