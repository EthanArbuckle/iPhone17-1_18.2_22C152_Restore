@interface UIApplicationSceneSettingsDiffInspector
- (void)_observeOtherSetting:(unint64_t)a3 withBlock:(id)a4;
- (void)observeAccessibilityContrastWithBlock:(id)a3;
- (void)observeAngleFromHostReferenceUprightDirectionWithBlock:(id)a3;
- (void)observeCanShowAlertsWithBlock:(id)a3;
- (void)observeCarPlayBlackWallpaperModeEnabledWithBlock:(id)a3;
- (void)observeCarPlayDisableFiveRowKeyboardsWithBlock:(id)a3;
- (void)observeDeactivationReasonsWithBlock:(id)a3;
- (void)observeDeviceOrientationEventsEnabledWithBlock:(id)a3;
- (void)observeDeviceOrientationWithBlock:(id)a3;
- (void)observeEnhancedWindowingEnabledWithBlock:(id)a3;
- (void)observeForcedStatusBarForegroundTransparentWithBlock:(id)a3;
- (void)observeForcedStatusBarStyleWithBlock:(id)a3;
- (void)observeHostReferenceAngleModeWithBlock:(id)a3;
- (void)observeIdleModeEnabledWithBlock:(id)a3;
- (void)observeInLiveResizeWithBlock:(id)a3;
- (void)observeInterfaceOrientationMapResolverWithBlock:(id)a3;
- (void)observeInterfaceOrientationModeWithBlock:(id)a3;
- (void)observePersistenceIdentifierWithBlock:(id)a3;
- (void)observePointerLockStatusWithBlock:(id)a3;
- (void)observeSafeAreaInsetsLandscapeLeftWithBlock:(id)a3;
- (void)observeSafeAreaInsetsLandscapeRightWithBlock:(id)a3;
- (void)observeSafeAreaInsetsPortraitUpsideDownWithBlock:(id)a3;
- (void)observeSafeAreaInsetsPortraitWithBlock:(id)a3;
- (void)observeScreenBoundsIgnoresSceneOrientation:(id)a3;
- (void)observeScreenReferenceDisplayModeStatus:(id)a3;
- (void)observeStatusBarAvoidanceFrameWithBlock:(id)a3;
- (void)observeStatusBarHeightWithBlock:(id)a3;
- (void)observeStatusBarPartsWithBlock:(id)a3;
- (void)observeStatusBarStyleOverridesToSuppressWithBlock:(id)a3;
- (void)observeTargetOfEventDeferringEnvironmentsWithBlock:(id)a3;
- (void)observeUnderLockWithBlock:(id)a3;
- (void)observeUserInterfaceStyleWithBlock:(id)a3;
@end

@implementation UIApplicationSceneSettingsDiffInspector

uint64_t __74__UIApplicationSceneSettingsDiffInspector__observeOtherSetting_withBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)observeIdleModeEnabledWithBlock:(id)a3
{
}

- (void)observeCanShowAlertsWithBlock:(id)a3
{
}

- (void)_observeOtherSetting:(unint64_t)a3 withBlock:(id)a4
{
  id v6 = a4;
  v7 = v6;
  if (v6)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __74__UIApplicationSceneSettingsDiffInspector__observeOtherSetting_withBlock___block_invoke;
    v8[3] = &unk_1E52EFCC0;
    id v9 = v6;
    [(FBSSettingsDiffInspector *)self observeOtherSetting:a3 withBlock:v8];
  }
}

- (void)observeStatusBarStyleOverridesToSuppressWithBlock:(id)a3
{
}

- (void)observeStatusBarPartsWithBlock:(id)a3
{
}

- (void)observeStatusBarHeightWithBlock:(id)a3
{
}

- (void)observeStatusBarAvoidanceFrameWithBlock:(id)a3
{
}

- (void)observeForcedStatusBarStyleWithBlock:(id)a3
{
}

- (void)observeForcedStatusBarForegroundTransparentWithBlock:(id)a3
{
}

- (void)observeUserInterfaceStyleWithBlock:(id)a3
{
}

- (void)observeScreenReferenceDisplayModeStatus:(id)a3
{
}

- (void)observeSafeAreaInsetsPortraitWithBlock:(id)a3
{
}

- (void)observeSafeAreaInsetsPortraitUpsideDownWithBlock:(id)a3
{
}

- (void)observeSafeAreaInsetsLandscapeRightWithBlock:(id)a3
{
}

- (void)observeSafeAreaInsetsLandscapeLeftWithBlock:(id)a3
{
}

- (void)observeInterfaceOrientationModeWithBlock:(id)a3
{
}

- (void)observeInterfaceOrientationMapResolverWithBlock:(id)a3
{
}

- (void)observeInLiveResizeWithBlock:(id)a3
{
}

- (void)observeHostReferenceAngleModeWithBlock:(id)a3
{
}

- (void)observeEnhancedWindowingEnabledWithBlock:(id)a3
{
}

- (void)observeDeviceOrientationWithBlock:(id)a3
{
}

- (void)observeAngleFromHostReferenceUprightDirectionWithBlock:(id)a3
{
}

- (void)observeDeactivationReasonsWithBlock:(id)a3
{
}

- (void)observePersistenceIdentifierWithBlock:(id)a3
{
}

- (void)observeUnderLockWithBlock:(id)a3
{
}

- (void)observeDeviceOrientationEventsEnabledWithBlock:(id)a3
{
}

- (void)observeAccessibilityContrastWithBlock:(id)a3
{
}

- (void)observePointerLockStatusWithBlock:(id)a3
{
}

- (void)observeCarPlayDisableFiveRowKeyboardsWithBlock:(id)a3
{
}

- (void)observeCarPlayBlackWallpaperModeEnabledWithBlock:(id)a3
{
}

- (void)observeTargetOfEventDeferringEnvironmentsWithBlock:(id)a3
{
}

- (void)observeScreenBoundsIgnoresSceneOrientation:(id)a3
{
}

@end