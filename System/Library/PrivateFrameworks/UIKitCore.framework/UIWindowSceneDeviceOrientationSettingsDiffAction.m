@interface UIWindowSceneDeviceOrientationSettingsDiffAction
@end

@implementation UIWindowSceneDeviceOrientationSettingsDiffAction

void __96___UIWindowSceneDeviceOrientationSettingsDiffAction_sceneSettingsDeviceOrientationDiffInspector__block_invoke(uint64_t a1, unsigned char *a2)
{
  *a2 |= 1u;
}

void __134___UIWindowSceneDeviceOrientationSettingsDiffAction__updateDeviceOrientationWithSettingObserverContext_windowScene_transitionContext___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = +[UIScene _mostActiveScene];
  uint64_t v4 = [v2 isEqual:v3];

  id v5 = +[UIDevice currentDevice];
  [v5 setOrientation:*(void *)(a1 + 40) animated:v4];
}

@end