@interface SBUIKitSafeAreaSceneHostComponent
- (void)scene:(id)a3 willUpdateSettings:(id)a4 withTransitionContext:(id)a5;
@end

@implementation SBUIKitSafeAreaSceneHostComponent

- (void)scene:(id)a3 willUpdateSettings:(id)a4 withTransitionContext:(id)a5
{
  id v11 = a4;
  if ([v11 isUISubclass])
  {
    v5 = [v11 displayConfiguration];
    if ([v5 isMainRootDisplay])
    {
      v6 = objc_msgSend(MEMORY[0x1E4FB33B0], "sb_thisDeviceDisplayEdgeInfo");
      objc_msgSend(v6, "sb_applyDisplayEdgeInfoToSceneSettings:", v11);
    }
    else
    {
      double v7 = *MEMORY[0x1E4FB2848];
      double v8 = *(double *)(MEMORY[0x1E4FB2848] + 8);
      double v9 = *(double *)(MEMORY[0x1E4FB2848] + 16);
      double v10 = *(double *)(MEMORY[0x1E4FB2848] + 24);
      objc_msgSend(v11, "setSafeAreaInsetsPortrait:", *MEMORY[0x1E4FB2848], v8, v9, v10);
      objc_msgSend(v11, "setPeripheryInsets:", v7, v8, v9, v10);
      [v11 setHomeAffordanceOverlayAllowance:0.0];
    }
  }
}

@end