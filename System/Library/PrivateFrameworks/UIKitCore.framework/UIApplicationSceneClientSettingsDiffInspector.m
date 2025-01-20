@interface UIApplicationSceneClientSettingsDiffInspector
- (void)_observeOtherSetting:(unint64_t)a3 withBlock:(id)a4;
- (void)observeActivationConditionsDataWithBlock:(id)a3;
- (void)observeAudioCategoriesDisablingVolumeHUDWithBlock:(id)a3;
- (void)observeBackgroundStyleWithBlock:(id)a3;
- (void)observeBrightnessLevelWithBlock:(id)a3;
- (void)observeCanvasTitleWithBlock:(id)a3;
- (void)observeCompatibilityModeWithBlock:(id)a3;
- (void)observeControlCenterAmbiguousActivationMargin:(id)a3;
- (void)observeControlCenterRevealModeWithBlock:(id)a3;
- (void)observeDefaultPNGExpirationTimeWithBlock:(id)a3;
- (void)observeDefaultPNGNameWithBlock:(id)a3;
- (void)observeDefaultStatusBarHiddenWithBlock:(id)a3;
- (void)observeDefaultStatusBarStyleWithBlock:(id)a3;
- (void)observeDeviceOrientationEventsEnabledWithBlock:(id)a3;
- (void)observeEditingInteractionConfigurationWithBlock:(id)a3;
- (void)observeHomeIndicatorAutoHiddenWithBlock:(id)a3;
- (void)observeIdleModeVisualEffectsEnabledWithBlock:(id)a3;
- (void)observeIdleTimerDisabledWithBlock:(id)a3;
- (void)observeInterfaceOrientationChangesDisabledWithBlock:(id)a3;
- (void)observeInterfaceOrientationWithBlock:(id)a3;
- (void)observeNotificationCenterRevealModeWithBlock:(id)a3;
- (void)observePhysicalButtonConfigurationsWithBlock:(id)a3;
- (void)observePreferredPointerLockStateWithBlock:(id)a3;
- (void)observeProximityDetectionModesWithBlock:(id)a3;
- (void)observeReachabilitySupportedWithBlock:(id)a3;
- (void)observeSceneActivationBiasWithBlock:(id)a3;
- (void)observeScreenEdgesDeferringSystemGesturesWithBlock:(id)a3;
- (void)observeStatusBarAlphaWithBlock:(id)a3;
- (void)observeStatusBarContextIDWithBlock:(id)a3;
- (void)observeStatusBarHiddenWithBlock:(id)a3;
- (void)observeStatusBarModernStyleWithBlock:(id)a3;
- (void)observeStatusBarPartStylesWithBlock:(id)a3;
- (void)observeStatusBarStyleWithBlock:(id)a3;
- (void)observeSupportedInterfaceOrientationsWithBlock:(id)a3;
- (void)observeUserInterfaceStyleWithBlock:(id)a3;
- (void)observeVisibleMiniAlertCountWithBlock:(id)a3;
- (void)observeWantsExclusiveForegroundWithBlock:(id)a3;
- (void)observeWhitePointAdaptivityStyleWithBlock:(id)a3;
- (void)observeWindowFocusedFrameWithBlock:(id)a3;
- (void)observeWindowOverlayInsetsWithBlock:(id)a3;
@end

@implementation UIApplicationSceneClientSettingsDiffInspector

uint64_t __80__UIApplicationSceneClientSettingsDiffInspector__observeOtherSetting_withBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_observeOtherSetting:(unint64_t)a3 withBlock:(id)a4
{
  id v6 = a4;
  v7 = v6;
  if (v6)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __80__UIApplicationSceneClientSettingsDiffInspector__observeOtherSetting_withBlock___block_invoke;
    v8[3] = &unk_1E52EFCC0;
    id v9 = v6;
    [(FBSSettingsDiffInspector *)self observeOtherSetting:a3 withBlock:v8];
  }
}

- (void)observeScreenEdgesDeferringSystemGesturesWithBlock:(id)a3
{
}

- (void)observeHomeIndicatorAutoHiddenWithBlock:(id)a3
{
}

- (void)observeSupportedInterfaceOrientationsWithBlock:(id)a3
{
}

- (void)observeStatusBarContextIDWithBlock:(id)a3
{
}

- (void)observeInterfaceOrientationWithBlock:(id)a3
{
}

- (void)observeBackgroundStyleWithBlock:(id)a3
{
}

- (void)observeStatusBarStyleWithBlock:(id)a3
{
}

- (void)observeStatusBarModernStyleWithBlock:(id)a3
{
}

- (void)observeStatusBarPartStylesWithBlock:(id)a3
{
}

- (void)observeStatusBarAlphaWithBlock:(id)a3
{
}

- (void)observeStatusBarHiddenWithBlock:(id)a3
{
}

- (void)observeDefaultStatusBarStyleWithBlock:(id)a3
{
}

- (void)observeDefaultStatusBarHiddenWithBlock:(id)a3
{
}

- (void)observeDefaultPNGNameWithBlock:(id)a3
{
}

- (void)observeDefaultPNGExpirationTimeWithBlock:(id)a3
{
}

- (void)observeCompatibilityModeWithBlock:(id)a3
{
}

- (void)observeDeviceOrientationEventsEnabledWithBlock:(id)a3
{
}

- (void)observeInterfaceOrientationChangesDisabledWithBlock:(id)a3
{
}

- (void)observeIdleTimerDisabledWithBlock:(id)a3
{
}

- (void)observeProximityDetectionModesWithBlock:(id)a3
{
}

- (void)observeControlCenterAmbiguousActivationMargin:(id)a3
{
}

- (void)observeControlCenterRevealModeWithBlock:(id)a3
{
}

- (void)observeNotificationCenterRevealModeWithBlock:(id)a3
{
}

- (void)observeEditingInteractionConfigurationWithBlock:(id)a3
{
}

- (void)observeWindowOverlayInsetsWithBlock:(id)a3
{
}

- (void)observeIdleModeVisualEffectsEnabledWithBlock:(id)a3
{
}

- (void)observeWhitePointAdaptivityStyleWithBlock:(id)a3
{
}

- (void)observeReachabilitySupportedWithBlock:(id)a3
{
}

- (void)observeCanvasTitleWithBlock:(id)a3
{
}

- (void)observeSceneActivationBiasWithBlock:(id)a3
{
}

- (void)observeActivationConditionsDataWithBlock:(id)a3
{
}

- (void)observeWindowFocusedFrameWithBlock:(id)a3
{
}

- (void)observeWantsExclusiveForegroundWithBlock:(id)a3
{
}

- (void)observeUserInterfaceStyleWithBlock:(id)a3
{
}

- (void)observeVisibleMiniAlertCountWithBlock:(id)a3
{
}

- (void)observeAudioCategoriesDisablingVolumeHUDWithBlock:(id)a3
{
}

- (void)observeBrightnessLevelWithBlock:(id)a3
{
}

- (void)observePreferredPointerLockStateWithBlock:(id)a3
{
}

- (void)observePhysicalButtonConfigurationsWithBlock:(id)a3
{
}

@end