@interface SBTraitsExternalDisplayRolesAndDefaultPoliciesProvider
- (id)defaultActiveOrientationBelowDrivenRoles;
- (id)defaultDeviceOrientationDrivenRoles;
- (id)defaultIsolationDrivenRoles;
- (id)defaultKeyboardFocusDrivenRoles;
- (id)defaultOtherParticipantDrivenRoles;
- (id)orientationStageRoles;
@end

@implementation SBTraitsExternalDisplayRolesAndDefaultPoliciesProvider

- (id)defaultDeviceOrientationDrivenRoles
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __93__SBTraitsExternalDisplayRolesAndDefaultPoliciesProvider_defaultDeviceOrientationDrivenRoles__block_invoke;
  block[3] = &unk_1E6AF4AC0;
  block[4] = self;
  if (defaultDeviceOrientationDrivenRoles_onceToken_0 != -1) {
    dispatch_once(&defaultDeviceOrientationDrivenRoles_onceToken_0, block);
  }
  return (id)defaultDeviceOrientationDrivenRoles__defaultDeviceOrientationDrivenRoles_0;
}

void __93__SBTraitsExternalDisplayRolesAndDefaultPoliciesProvider_defaultDeviceOrientationDrivenRoles__block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F1CA48];
  v3 = [*(id *)(a1 + 32) orientationStageRoles];
  v4 = [v3 allObjects];
  id v10 = [v2 arrayWithArray:v4];

  v5 = [*(id *)(a1 + 32) defaultIsolationDrivenRoles];
  [v10 removeObjectsInArray:v5];

  v6 = [*(id *)(a1 + 32) defaultOtherParticipantDrivenRoles];
  v7 = [v6 allKeys];
  [v10 removeObjectsInArray:v7];

  uint64_t v8 = [v10 copy];
  v9 = (void *)defaultDeviceOrientationDrivenRoles__defaultDeviceOrientationDrivenRoles_0;
  defaultDeviceOrientationDrivenRoles__defaultDeviceOrientationDrivenRoles_0 = v8;
}

- (id)defaultActiveOrientationBelowDrivenRoles
{
  return 0;
}

- (id)defaultOtherParticipantDrivenRoles
{
  if (defaultOtherParticipantDrivenRoles_onceToken_0 != -1) {
    dispatch_once(&defaultOtherParticipantDrivenRoles_onceToken_0, &__block_literal_global_326);
  }
  return 0;
}

void __92__SBTraitsExternalDisplayRolesAndDefaultPoliciesProvider_defaultOtherParticipantDrivenRoles__block_invoke()
{
  v6[6] = *MEMORY[0x1E4F143B8];
  id v0 = objc_alloc(MEMORY[0x1E4F1CA60]);
  v5[0] = @"SBTraitsParticipantRoleWallpaperExternal";
  v5[1] = @"SBTraitsParticipantRoleHomeScreenDimming";
  v6[0] = @"SBTraitsParticipantRoleHomeScreen";
  v6[1] = @"SBTraitsParticipantRoleHomeScreen";
  v5[2] = @"SBTraitsParticipantRoleCoverSheetHomeScreenOverlay";
  v5[3] = @"SBTraitsParticipantRoleCoverSheetPosterSwitcher";
  v6[2] = @"SBTraitsParticipantRoleCoverSheet";
  v6[3] = @"SBTraitsParticipantRoleCoverSheet";
  v5[4] = @"SBTraitsParticipantRoleSwitcherPublisher";
  v5[5] = @"SBTraitsParticipantRoleSubterraneanOverlayUI";
  v6[4] = @"SBTraitsParticipantRoleSwitcherRaw";
  v6[5] = @"SBTraitsParticipantRoleOverlayUI";
  v1 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:6];
  v2 = (void *)[v0 initWithDictionary:v1];

  v3 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) == 1 && _os_feature_enabled_impl()) {
    [v2 setObject:@"SBTraitsParticipantRoleHomeScreen" forKey:@"SBTraitsParticipantRoleWallpaper"];
  }
}

- (id)defaultKeyboardFocusDrivenRoles
{
  return 0;
}

- (id)defaultIsolationDrivenRoles
{
  v4[2] = *MEMORY[0x1E4F143B8];
  v4[0] = @"SBTraitsParticipantRoleAssistantAccessory";
  v4[1] = @"SBTraitsParticipantRoleDeviceApplicationSceneViewOverlay";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];
  return v2;
}

- (id)orientationStageRoles
{
  if (orientationStageRoles_onceToken_0 != -1) {
    dispatch_once(&orientationStageRoles_onceToken_0, &__block_literal_global_7_6);
  }
  v2 = (void *)orientationStageRoles_orientationStageRoles_0;
  return v2;
}

void __79__SBTraitsExternalDisplayRolesAndDefaultPoliciesProvider_orientationStageRoles__block_invoke()
{
  v7[63] = *MEMORY[0x1E4F143B8];
  id v0 = (void *)MEMORY[0x1E4F1CAD0];
  v7[0] = @"SBTraitsParticipantRoleAlert";
  v7[1] = @"SBTraitsParticipantRoleAmbient";
  v7[2] = @"SBTraitsParticipantRoleAssistant";
  v7[3] = @"SBTraitsParticipantRoleAssistantAccessory";
  v7[4] = @"SBTraitsParticipantRoleAXAssistiveTouchUI";
  v7[5] = @"SBTraitsParticipantRoleAXFullKeyboardUI";
  v7[6] = @"SBTraitsParticipantRoleAXUIServer";
  v7[7] = @"SBTraitsParticipantRoleAXVoiceControlUI";
  v7[8] = @"SBTraitsParticipantRoleBanner";
  v7[9] = @"SBTraitsParticipantRoleBiometricMonitorUI";
  v7[10] = @"SBTraitsParticipantRoleCommandTab";
  v7[11] = @"SBTraitsParticipantRoleControlCenter";
  v7[12] = @"SBTraitsParticipantRoleCoverSheet";
  v7[13] = @"SBTraitsParticipantRoleCoverSheetCamera";
  v7[14] = @"SBTraitsParticipantRoleCoverSheetHomeScreenOverlay";
  v7[15] = @"SBTraitsParticipantRoleDeviceApplicationSceneViewOverlay";
  v7[16] = @"SBTraitsParticipantRoleDruid";
  v7[17] = @"SBTraitsParticipantRoleEnsembleUI";
  v7[18] = @"SBTraitsParticipantRoleEyedropperUI";
  v7[19] = @"SBTraitsParticipantRoleFloatingDock";
  v7[20] = @"SBTraitsParticipantRoleFloatingKeyboard";
  v7[21] = @"SBTraitsParticipantRoleHomeScreen";
  v7[22] = @"SBTraitsParticipantRoleHomeScreenDimming";
  v7[23] = @"SBTraitsParticipantRoleHUD";
  v7[24] = @"SBTraitsParticipantRoleInputUI";
  v7[25] = @"SBTraitsParticipantRoleInteractiveScreenshotGesture";
  v7[26] = @"SBTraitsParticipantRoleInternalPerfPowerHUD";
  v7[27] = @"SBTraitsParticipantRoleLiveTranscriptionUI";
  v7[28] = @"SBTraitsParticipantRoleLoginBootToSetupAppZoomInAnimation";
  v7[29] = @"SBTraitsParticipantRoleLogWindowRecipe";
  v7[30] = @"SBTraitsParticipantRoleMedusaDrag";
  v7[31] = @"SBTraitsParticipantRoleModifierTimeline";
  v7[32] = @"SBTraitsParticipantRoleMomentsUI";
  v7[33] = @"SBTraitsParticipantRoleOverlayUI";
  v7[34] = @"SBTraitsParticipantRolePerfPowerHUD";
  v7[35] = @"SBTraitsParticipantRolePictureInPicture";
  v7[36] = @"SBTraitsParticipantRolePipelineManager";
  v7[37] = @"SBTraitsParticipantRolePrototypeTools";
  v7[38] = @"SBTraitsParticipantRoleReachability";
  v7[39] = @"SBTraitsParticipantRoleRecordingIndicator";
  v7[40] = @"SBTraitsParticipantRoleRenderOverlayRecipe";
  v7[41] = @"SBTraitsParticipantRoleScreenFlash";
  v7[42] = @"SBTraitsParticipantRoleSecureApp";
  v7[43] = @"SBTraitsParticipantRoleStartupFadeAnimation";
  v7[44] = @"SBTraitsParticipantRoleStatusBar";
  v7[45] = @"SBTraitsParticipantRoleSubterraneanOverlayUI";
  v7[46] = @"SBTraitsParticipantRoleSwitcherLiveOverlay";
  v7[47] = @"SBTraitsParticipantRoleSwitcherPublisher";
  v7[48] = @"SBTraitsParticipantRoleSwitcherRaw";
  v7[49] = @"SBTraitsParticipantRoleSystemAperture";
  v7[50] = @"SBTraitsParticipantRoleSystemUIScene";
  v7[51] = @"SBTraitsParticipantRoleTransientOverlay";
  v7[52] = @"SBTraitsParticipantRoleTransientOverlayBackground";
  v7[53] = @"SBTraitsParticipantRoleWallpaper";
  v7[54] = @"SBTraitsParticipantRoleWallpaperExternal";
  v7[55] = @"SBTraitsParticipantRoleWindowedAccessory";
  uint64_t v1 = *MEMORY[0x1E4F44260];
  v7[56] = *MEMORY[0x1E4F44258];
  v7[57] = v1;
  uint64_t v2 = *MEMORY[0x1E4F44278];
  v7[58] = *MEMORY[0x1E4F44268];
  v7[59] = v2;
  uint64_t v3 = *MEMORY[0x1E4F44280];
  v7[60] = *MEMORY[0x1E4F44270];
  v7[61] = v3;
  v7[62] = *MEMORY[0x1E4F44288];
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:63];
  uint64_t v5 = [v0 setWithArray:v4];
  v6 = (void *)orientationStageRoles_orientationStageRoles_0;
  orientationStageRoles_orientationStageRoles_0 = v5;
}

@end