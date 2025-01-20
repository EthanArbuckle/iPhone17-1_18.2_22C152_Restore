@interface _PUIKitSafeAreaSceneHostComponent
- (void)scene:(id)a3 willUpdateSettings:(id)a4 withTransitionContext:(id)a5;
@end

@implementation _PUIKitSafeAreaSceneHostComponent

- (void)scene:(id)a3 willUpdateSettings:(id)a4 withTransitionContext:(id)a5
{
  id v11 = a4;
  if ([v11 isUISubclass])
  {
    v5 = [v11 displayConfiguration];
    if ([v5 isMainRootDisplay])
    {
      v6 = objc_msgSend(MEMORY[0x263F83E58], "sb_thisDeviceDisplayEdgeInfo");
      objc_msgSend(v6, "sb_applyDisplayEdgeInfoToSceneSettings:", v11);
    }
    else
    {
      double v7 = *MEMORY[0x263F1D1C0];
      double v8 = *(double *)(MEMORY[0x263F1D1C0] + 8);
      double v9 = *(double *)(MEMORY[0x263F1D1C0] + 16);
      double v10 = *(double *)(MEMORY[0x263F1D1C0] + 24);
      objc_msgSend(v11, "setSafeAreaInsetsPortrait:", *MEMORY[0x263F1D1C0], v8, v9, v10);
      objc_msgSend(v11, "setPeripheryInsets:", v7, v8, v9, v10);
      [v11 setHomeAffordanceOverlayAllowance:0.0];
    }
  }
}

@end