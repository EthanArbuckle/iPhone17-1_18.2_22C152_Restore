@interface SBTraitsEmbeddedDisplayRolesAndDefaultPoliciesProvider
- (id)defaultActiveOrientationBelowDrivenRoles;
- (id)defaultDeviceOrientationDrivenRoles;
- (id)defaultIsolationDrivenRoles;
- (id)defaultKeyboardFocusDrivenRoles;
- (id)defaultOtherParticipantDrivenRoles;
- (id)orientationStageRoles;
@end

@implementation SBTraitsEmbeddedDisplayRolesAndDefaultPoliciesProvider

- (id)defaultOtherParticipantDrivenRoles
{
  if (defaultOtherParticipantDrivenRoles_onceToken != -1) {
    dispatch_once(&defaultOtherParticipantDrivenRoles_onceToken, &__block_literal_global_5);
  }
  v2 = (void *)defaultOtherParticipantDrivenRoles__defaultOtherParticipantDrivenRoles;
  return v2;
}

- (id)defaultKeyboardFocusDrivenRoles
{
  if (defaultKeyboardFocusDrivenRoles_onceToken != -1) {
    dispatch_once(&defaultKeyboardFocusDrivenRoles_onceToken, &__block_literal_global_11_0);
  }
  v2 = (void *)defaultKeyboardFocusDrivenRoles___defaultKeyboardDrivenRoles;
  return v2;
}

- (id)defaultDeviceOrientationDrivenRoles
{
  if (defaultDeviceOrientationDrivenRoles_onceToken != -1) {
    dispatch_once(&defaultDeviceOrientationDrivenRoles_onceToken, &__block_literal_global_2);
  }
  v2 = (void *)defaultDeviceOrientationDrivenRoles__defaultDeviceOrientationDrivenRoles;
  return v2;
}

- (id)defaultActiveOrientationBelowDrivenRoles
{
  if (defaultActiveOrientationBelowDrivenRoles_onceToken != -1) {
    dispatch_once(&defaultActiveOrientationBelowDrivenRoles_onceToken, &__block_literal_global_64);
  }
  v2 = (void *)defaultActiveOrientationBelowDrivenRoles__defaultActiveOrientationBelowRoles;
  return v2;
}

void __98__SBTraitsEmbeddedDisplayRolesAndDefaultPoliciesProvider_defaultActiveOrientationBelowDrivenRoles__block_invoke()
{
  v6[50] = *MEMORY[0x1E4F143B8];
  v6[0] = @"SBTraitsParticipantRoleAlert";
  v6[1] = @"SBTraitsParticipantRoleAmbient";
  v6[2] = @"SBTraitsParticipantRoleAssistant";
  v6[3] = @"SBTraitsParticipantRoleAXAssistiveTouchUI";
  v6[4] = @"SBTraitsParticipantRoleAXFullKeyboardUI";
  v6[5] = @"SBTraitsParticipantRoleAXVoiceControlUI";
  v6[6] = @"SBTraitsParticipantRoleAXUIServer";
  v6[7] = @"SBTraitsParticipantRoleBanner";
  v6[8] = @"SBTraitsParticipantRoleBiometricMonitorUI";
  v6[9] = @"SBTraitsParticipantRoleCommandTab";
  v6[10] = @"SBTraitsParticipantRoleControlCenter";
  v6[11] = @"SBTraitsParticipantRoleCoverSheet";
  v6[12] = @"SBTraitsParticipantRoleEnsembleUI";
  v6[13] = @"SBTraitsParticipantRoleEyedropperUI";
  v6[14] = @"SBTraitsParticipantRoleFloatingDock";
  v6[15] = @"SBTraitsParticipantRoleHUD";
  v6[16] = @"SBTraitsParticipantRoleInteractiveScreenshotGesture";
  v6[17] = @"SBTraitsParticipantRoleInternalPerfPowerHUD";
  v6[18] = @"SBTraitsParticipantRoleLiveTranscriptionUI";
  v6[19] = @"SBTraitsParticipantRoleLoginBootToSetupAppZoomInAnimation";
  v6[20] = @"SBTraitsParticipantRoleLogWindowRecipe";
  v6[21] = @"SBTraitsParticipantRoleMedusaDrag";
  v6[22] = @"SBTraitsParticipantRoleModifierTimeline";
  v6[23] = @"SBTraitsParticipantRoleMomentsUI";
  v6[24] = @"SBTraitsParticipantRoleOverlayUI";
  v6[25] = @"SBTraitsParticipantRolePerfPowerHUD";
  v6[26] = @"SBTraitsParticipantRolePictureInPicture";
  v6[27] = @"SBTraitsParticipantRolePipelineManager";
  v6[28] = @"SBTraitsParticipantRolePrototypeTools";
  v6[29] = @"SBTraitsParticipantRoleReachability";
  v6[30] = @"SBTraitsParticipantRoleRecordingIndicator";
  v6[31] = @"SBTraitsParticipantRoleRenderOverlayRecipe";
  v6[32] = @"SBTraitsParticipantRoleScreenFlash";
  v6[33] = @"SBTraitsParticipantRoleStartupFadeAnimation";
  v6[34] = @"SBTraitsParticipantRoleStatusBar";
  v6[35] = @"SBTraitsParticipantRoleSwitcherRaw";
  v6[36] = @"SBTraitsParticipantRoleSystemUIScene";
  v6[37] = @"SBTraitsParticipantRoleTransientOverlay";
  v6[38] = @"SBTraitsParticipantRoleTransientOverlayBackground";
  v6[39] = @"SBTraitsParticipantRoleWindowedAccessory";
  v6[40] = @"SBTraitsParticipantRoleSystemAperture";
  v6[41] = @"SBTraitsParticipantRoleHardwareButtonBezelEffectsCoordinator";
  uint64_t v0 = *MEMORY[0x1E4F44258];
  v6[42] = @"SBTraitsParticipantRoleHardwareButtonBezelEffectsCoordinatorHinting";
  v6[43] = v0;
  uint64_t v1 = *MEMORY[0x1E4F44268];
  v6[44] = *MEMORY[0x1E4F44260];
  v6[45] = v1;
  uint64_t v2 = *MEMORY[0x1E4F44270];
  v6[46] = *MEMORY[0x1E4F44278];
  v6[47] = v2;
  uint64_t v3 = *MEMORY[0x1E4F44288];
  v6[48] = *MEMORY[0x1E4F44280];
  v6[49] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:50];
  v5 = (void *)defaultActiveOrientationBelowDrivenRoles__defaultActiveOrientationBelowRoles;
  defaultActiveOrientationBelowDrivenRoles__defaultActiveOrientationBelowRoles = v4;
}

void __93__SBTraitsEmbeddedDisplayRolesAndDefaultPoliciesProvider_defaultDeviceOrientationDrivenRoles__block_invoke()
{
  v5[4] = *MEMORY[0x1E4F143B8];
  id v0 = objc_alloc(MEMORY[0x1E4F1CA48]);
  v5[0] = @"SBTraitsParticipantRoleHomeScreen";
  v5[1] = @"SBTraitsParticipantRoleSwitcherLiveOverlay";
  v5[2] = @"SBTraitsParticipantRoleCoverSheetCamera";
  v5[3] = @"SBTraitsParticipantRoleSecureApp";
  uint64_t v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:4];
  uint64_t v2 = (void *)[v0 initWithArray:v1];

  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithArray:v2];
  uint64_t v4 = (void *)defaultDeviceOrientationDrivenRoles__defaultDeviceOrientationDrivenRoles;
  defaultDeviceOrientationDrivenRoles__defaultDeviceOrientationDrivenRoles = v3;
}

void __92__SBTraitsEmbeddedDisplayRolesAndDefaultPoliciesProvider_defaultOtherParticipantDrivenRoles__block_invoke()
{
  v8[6] = *MEMORY[0x1E4F143B8];
  id v0 = objc_alloc(MEMORY[0x1E4F1CA60]);
  v7[0] = @"SBTraitsParticipantRoleWallpaperExternal";
  v7[1] = @"SBTraitsParticipantRoleHomeScreenDimming";
  v8[0] = @"SBTraitsParticipantRoleHomeScreen";
  v8[1] = @"SBTraitsParticipantRoleHomeScreen";
  v7[2] = @"SBTraitsParticipantRoleCoverSheetHomeScreenOverlay";
  v7[3] = @"SBTraitsParticipantRoleCoverSheetPosterSwitcher";
  v8[2] = @"SBTraitsParticipantRoleCoverSheet";
  v8[3] = @"SBTraitsParticipantRoleCoverSheet";
  v7[4] = @"SBTraitsParticipantRoleSwitcherPublisher";
  v7[5] = @"SBTraitsParticipantRoleSubterraneanOverlayUI";
  v8[4] = @"SBTraitsParticipantRoleSwitcherRaw";
  v8[5] = @"SBTraitsParticipantRoleOverlayUI";
  uint64_t v1 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:6];
  uint64_t v2 = (void *)[v0 initWithDictionary:v1];

  uint64_t v3 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) == 1 && _os_feature_enabled_impl()) {
    [v2 setObject:@"SBTraitsParticipantRoleHomeScreen" forKey:@"SBTraitsParticipantRoleWallpaper"];
  }
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v2];
  v6 = (void *)defaultOtherParticipantDrivenRoles__defaultOtherParticipantDrivenRoles;
  defaultOtherParticipantDrivenRoles__defaultOtherParticipantDrivenRoles = v5;
}

void __89__SBTraitsEmbeddedDisplayRolesAndDefaultPoliciesProvider_defaultKeyboardFocusDrivenRoles__block_invoke()
{
  v2[2] = *MEMORY[0x1E4F143B8];
  v2[0] = @"SBTraitsParticipantRoleFloatingKeyboard";
  v2[1] = @"SBTraitsParticipantRoleInputUI";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:2];
  uint64_t v1 = (void *)defaultKeyboardFocusDrivenRoles___defaultKeyboardDrivenRoles;
  defaultKeyboardFocusDrivenRoles___defaultKeyboardDrivenRoles = v0;
}

- (id)defaultIsolationDrivenRoles
{
  v4[3] = *MEMORY[0x1E4F143B8];
  v4[0] = @"SBTraitsParticipantRoleAssistantAccessory";
  v4[1] = @"SBTraitsParticipantRoleDeviceApplicationSceneViewOverlay";
  v4[2] = @"SBTraitsParticipantRoleDruid";
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:3];
  return v2;
}

- (id)orientationStageRoles
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__SBTraitsEmbeddedDisplayRolesAndDefaultPoliciesProvider_orientationStageRoles__block_invoke;
  block[3] = &unk_1E6AF4AC0;
  block[4] = self;
  if (orientationStageRoles_onceToken != -1) {
    dispatch_once(&orientationStageRoles_onceToken, block);
  }
  return (id)orientationStageRoles_orientationStageRoles;
}

void __79__SBTraitsEmbeddedDisplayRolesAndDefaultPoliciesProvider_orientationStageRoles__block_invoke(uint64_t a1)
{
  id v10 = [*(id *)(a1 + 32) defaultDeviceOrientationDrivenRoles];
  uint64_t v2 = [*(id *)(a1 + 32) defaultActiveOrientationBelowDrivenRoles];
  uint64_t v3 = [*(id *)(a1 + 32) defaultKeyboardFocusDrivenRoles];
  uint64_t v4 = [*(id *)(a1 + 32) defaultIsolationDrivenRoles];
  uint64_t v5 = [*(id *)(a1 + 32) defaultOtherParticipantDrivenRoles];
  v6 = [v5 allKeys];

  v7 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v2, "count")+ objc_msgSend(v10, "count")+ objc_msgSend(v3, "count")+ objc_msgSend(v4, "count")+ objc_msgSend(v6, "count"));
  [v7 addObjectsFromArray:v10];
  [v7 addObjectsFromArray:v2];
  [v7 addObjectsFromArray:v3];
  [v7 addObjectsFromArray:v4];
  [v7 addObjectsFromArray:v6];
  uint64_t v8 = [MEMORY[0x1E4F1CAD0] setWithSet:v7];
  v9 = (void *)orientationStageRoles_orientationStageRoles;
  orientationStageRoles_orientationStageRoles = v8;
}

@end