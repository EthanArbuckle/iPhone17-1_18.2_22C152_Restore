@interface SBLocalDefaults
- (SBAccessibilityDefaults)accessibilityDefaults;
- (SBAlwaysOnDefaults)alwaysOnDefaults;
- (SBAmbientDefaults)ambientDefaults;
- (SBAnalyticsDefaults)analyticsDefaults;
- (SBAppSwitcherDefaults)appSwitcherDefaults;
- (SBApplicationDefaults)applicationDefaults;
- (SBBiometricAuthenticationDefaults)biometricAuthenticationDefaults;
- (SBBootDefaults)bootDefaults;
- (SBCameraHardwareButtonDefaults)cameraHardwareButtonDefaults;
- (SBCaptureApplicationDefaults)captureApplicationDefaults;
- (SBCaptureButtonDefaults)captureButtonDefaults;
- (SBCornerGestureDefaults)cornerGestureDefaults;
- (SBDemoDefaults)demoDefaults;
- (SBExternalDisplayDefaults)externalDisplayDefaults;
- (SBFloatingDockDefaults)floatingDockDefaults;
- (SBGestureDefaults)gestureDefaults;
- (SBHardwareDefaults)hardwareDefaults;
- (SBHomeScreenDefaults)homeScreenDefaults;
- (SBIconDefaults)iconDefaults;
- (SBIdleTimerDefaults)idleTimerDefaults;
- (SBInCallPresentationDefaults)inCallPresentationDefaults;
- (SBLockScreenDefaults)lockScreenDefaults;
- (SBMiscellaneousDefaults)miscellaneousDefaults;
- (SBMultiUserDefaults)multiUserDefaults;
- (SBNotificationCenterDefaults)notificationCenterDefaults;
- (SBNotificationDefaults)notificationDefaults;
- (SBPIPDefaults)pipDefaults;
- (SBPencilDefaults)pencilDefaults;
- (SBPowerDefaults)powerDefaults;
- (SBRecentDisplayItemsDefaults)recentDisplayItemsDefaults;
- (SBRotationDefaults)rotationDefaults;
- (SBSOSDefaults)sosDefaults;
- (SBScreenLongevityDefaults)screenLongevityDefaults;
- (SBSecurityDefaults)securityDefaults;
- (SBSetupDefaults)setupDefaults;
- (SBSoftwareUpdateDefaults)softwareUpdateDefaults;
- (SBSoundDefaults)soundDefaults;
- (SBStateDumpDefaults)stateDumpDefaults;
- (SBStatusBarDefaults)statusBarDefaults;
- (SBSystemActionDefaults)systemActionDefaults;
- (SBSystemApertureDefaults)systemApertureDefaults;
- (SBTestingDefaults)testingDefaults;
- (SBThermalDefaults)thermalDefaults;
- (SBUsageDefaults)usageDefaults;
- (SBVoiceControlDefaults)voiceControlDefaults;
- (SBWorkspaceDefaults)workspaceDefaults;
- (void)migrateAndRemoveOldDefaults;
@end

@implementation SBLocalDefaults

- (SBMiscellaneousDefaults)miscellaneousDefaults
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__SBLocalDefaults_miscellaneousDefaults__block_invoke;
  block[3] = &unk_1E548CA88;
  block[4] = self;
  if (miscellaneousDefaults___once != -1) {
    dispatch_once(&miscellaneousDefaults___once, block);
  }
  return self->_lazy_miscellaneousDefaults;
}

- (SBHomeScreenDefaults)homeScreenDefaults
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__SBLocalDefaults_homeScreenDefaults__block_invoke;
  block[3] = &unk_1E548CA88;
  block[4] = self;
  if (homeScreenDefaults___once != -1) {
    dispatch_once(&homeScreenDefaults___once, block);
  }
  return self->_lazy_homeScreenDefaults;
}

- (SBPIPDefaults)pipDefaults
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __30__SBLocalDefaults_pipDefaults__block_invoke;
  block[3] = &unk_1E548CA88;
  block[4] = self;
  if (pipDefaults___once != -1) {
    dispatch_once(&pipDefaults___once, block);
  }
  return self->_lazy_pipDefaults;
}

- (SBAppSwitcherDefaults)appSwitcherDefaults
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__SBLocalDefaults_appSwitcherDefaults__block_invoke;
  block[3] = &unk_1E548CA88;
  block[4] = self;
  if (appSwitcherDefaults___once != -1) {
    dispatch_once(&appSwitcherDefaults___once, block);
  }
  return self->_lazy_appSwitcherDefaults;
}

- (SBApplicationDefaults)applicationDefaults
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__SBLocalDefaults_applicationDefaults__block_invoke;
  block[3] = &unk_1E548CA88;
  block[4] = self;
  if (applicationDefaults___once != -1) {
    dispatch_once(&applicationDefaults___once, block);
  }
  return self->_lazy_applicationDefaults;
}

- (SBWorkspaceDefaults)workspaceDefaults
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__SBLocalDefaults_workspaceDefaults__block_invoke;
  block[3] = &unk_1E548CA88;
  block[4] = self;
  if (workspaceDefaults___once != -1) {
    dispatch_once(&workspaceDefaults___once, block);
  }
  return self->_lazy_workspaceDefaults;
}

- (SBPowerDefaults)powerDefaults
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__SBLocalDefaults_powerDefaults__block_invoke;
  block[3] = &unk_1E548CA88;
  block[4] = self;
  if (powerDefaults___once != -1) {
    dispatch_once(&powerDefaults___once, block);
  }
  return self->_lazy_powerDefaults;
}

- (SBAccessibilityDefaults)accessibilityDefaults
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__SBLocalDefaults_accessibilityDefaults__block_invoke;
  block[3] = &unk_1E548CA88;
  block[4] = self;
  if (accessibilityDefaults___once != -1) {
    dispatch_once(&accessibilityDefaults___once, block);
  }
  return self->_lazy_accessibilityDefaults;
}

uint64_t __40__SBLocalDefaults_accessibilityDefaults__block_invoke(uint64_t a1)
{
  v2 = objc_alloc_init(SBAccessibilityDefaults);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 8);
  *(void *)(v3 + 8) = v2;
  return MEMORY[0x1F41817F8](v2, v4);
}

- (SBAlwaysOnDefaults)alwaysOnDefaults
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__SBLocalDefaults_alwaysOnDefaults__block_invoke;
  block[3] = &unk_1E548CA88;
  block[4] = self;
  if (alwaysOnDefaults___once != -1) {
    dispatch_once(&alwaysOnDefaults___once, block);
  }
  return self->_lazy_alwaysOnDefaults;
}

uint64_t __35__SBLocalDefaults_alwaysOnDefaults__block_invoke(uint64_t a1)
{
  v2 = objc_alloc_init(SBAlwaysOnDefaults);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 16);
  *(void *)(v3 + 16) = v2;
  return MEMORY[0x1F41817F8](v2, v4);
}

- (SBAmbientDefaults)ambientDefaults
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__SBLocalDefaults_ambientDefaults__block_invoke;
  block[3] = &unk_1E548CA88;
  block[4] = self;
  if (ambientDefaults___once != -1) {
    dispatch_once(&ambientDefaults___once, block);
  }
  return self->_lazy_ambientDefaults;
}

uint64_t __34__SBLocalDefaults_ambientDefaults__block_invoke(uint64_t a1)
{
  v2 = objc_alloc_init(SBAmbientDefaults);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 24);
  *(void *)(v3 + 24) = v2;
  return MEMORY[0x1F41817F8](v2, v4);
}

- (SBAnalyticsDefaults)analyticsDefaults
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__SBLocalDefaults_analyticsDefaults__block_invoke;
  block[3] = &unk_1E548CA88;
  block[4] = self;
  if (analyticsDefaults___once != -1) {
    dispatch_once(&analyticsDefaults___once, block);
  }
  return self->_lazy_analyticsDefaults;
}

uint64_t __36__SBLocalDefaults_analyticsDefaults__block_invoke(uint64_t a1)
{
  v2 = objc_alloc_init(SBAnalyticsDefaults);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 32);
  *(void *)(v3 + 32) = v2;
  return MEMORY[0x1F41817F8](v2, v4);
}

uint64_t __38__SBLocalDefaults_appSwitcherDefaults__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 40) = objc_alloc_init(SBAppSwitcherDefaults);
  return MEMORY[0x1F41817F8]();
}

uint64_t __38__SBLocalDefaults_applicationDefaults__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 48) = objc_alloc_init(SBApplicationDefaults);
  return MEMORY[0x1F41817F8]();
}

- (SBBiometricAuthenticationDefaults)biometricAuthenticationDefaults
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__SBLocalDefaults_biometricAuthenticationDefaults__block_invoke;
  block[3] = &unk_1E548CA88;
  block[4] = self;
  if (biometricAuthenticationDefaults___once != -1) {
    dispatch_once(&biometricAuthenticationDefaults___once, block);
  }
  return self->_lazy_biometricAuthenticationDefaults;
}

uint64_t __50__SBLocalDefaults_biometricAuthenticationDefaults__block_invoke(uint64_t a1)
{
  v2 = objc_alloc_init(SBBiometricAuthenticationDefaults);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 56);
  *(void *)(v3 + 56) = v2;
  return MEMORY[0x1F41817F8](v2, v4);
}

- (SBBootDefaults)bootDefaults
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__SBLocalDefaults_bootDefaults__block_invoke;
  block[3] = &unk_1E548CA88;
  block[4] = self;
  if (bootDefaults___once != -1) {
    dispatch_once(&bootDefaults___once, block);
  }
  return self->_lazy_bootDefaults;
}

uint64_t __31__SBLocalDefaults_bootDefaults__block_invoke(uint64_t a1)
{
  v2 = objc_alloc_init(SBBootDefaults);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 64);
  *(void *)(v3 + 64) = v2;
  return MEMORY[0x1F41817F8](v2, v4);
}

- (SBCameraHardwareButtonDefaults)cameraHardwareButtonDefaults
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__SBLocalDefaults_cameraHardwareButtonDefaults__block_invoke;
  block[3] = &unk_1E548CA88;
  block[4] = self;
  if (cameraHardwareButtonDefaults___once != -1) {
    dispatch_once(&cameraHardwareButtonDefaults___once, block);
  }
  return self->_lazy_cameraHardwareButtonDefaults;
}

uint64_t __47__SBLocalDefaults_cameraHardwareButtonDefaults__block_invoke(uint64_t a1)
{
  v2 = objc_alloc_init(SBCameraHardwareButtonDefaults);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 72);
  *(void *)(v3 + 72) = v2;
  return MEMORY[0x1F41817F8](v2, v4);
}

- (SBCaptureButtonDefaults)captureButtonDefaults
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__SBLocalDefaults_captureButtonDefaults__block_invoke;
  block[3] = &unk_1E548CA88;
  block[4] = self;
  if (captureButtonDefaults___once != -1) {
    dispatch_once(&captureButtonDefaults___once, block);
  }
  return self->_lazy_captureButtonDefaults;
}

uint64_t __40__SBLocalDefaults_captureButtonDefaults__block_invoke(uint64_t a1)
{
  v2 = objc_alloc_init(SBCaptureButtonDefaults);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 80);
  *(void *)(v3 + 80) = v2;
  return MEMORY[0x1F41817F8](v2, v4);
}

- (SBCornerGestureDefaults)cornerGestureDefaults
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__SBLocalDefaults_cornerGestureDefaults__block_invoke;
  block[3] = &unk_1E548CA88;
  block[4] = self;
  if (cornerGestureDefaults___once != -1) {
    dispatch_once(&cornerGestureDefaults___once, block);
  }
  return self->_lazy_cornerGestureDefaults;
}

uint64_t __40__SBLocalDefaults_cornerGestureDefaults__block_invoke(uint64_t a1)
{
  v2 = objc_alloc_init(SBCornerGestureDefaults);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 88);
  *(void *)(v3 + 88) = v2;
  return MEMORY[0x1F41817F8](v2, v4);
}

- (SBDemoDefaults)demoDefaults
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__SBLocalDefaults_demoDefaults__block_invoke;
  block[3] = &unk_1E548CA88;
  block[4] = self;
  if (demoDefaults___once != -1) {
    dispatch_once(&demoDefaults___once, block);
  }
  return self->_lazy_demoDefaults;
}

uint64_t __31__SBLocalDefaults_demoDefaults__block_invoke(uint64_t a1)
{
  v2 = objc_alloc_init(SBDemoDefaults);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 96);
  *(void *)(v3 + 96) = v2;
  return MEMORY[0x1F41817F8](v2, v4);
}

- (SBExternalDisplayDefaults)externalDisplayDefaults
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__SBLocalDefaults_externalDisplayDefaults__block_invoke;
  block[3] = &unk_1E548CA88;
  block[4] = self;
  if (externalDisplayDefaults___once != -1) {
    dispatch_once(&externalDisplayDefaults___once, block);
  }
  return self->_lazy_externalDisplayDefaults;
}

uint64_t __42__SBLocalDefaults_externalDisplayDefaults__block_invoke(uint64_t a1)
{
  v2 = objc_alloc_init(SBExternalDisplayDefaults);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 104);
  *(void *)(v3 + 104) = v2;
  return MEMORY[0x1F41817F8](v2, v4);
}

- (SBFloatingDockDefaults)floatingDockDefaults
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__SBLocalDefaults_floatingDockDefaults__block_invoke;
  block[3] = &unk_1E548CA88;
  block[4] = self;
  if (floatingDockDefaults___once != -1) {
    dispatch_once(&floatingDockDefaults___once, block);
  }
  return self->_lazy_floatingDockDefaults;
}

uint64_t __39__SBLocalDefaults_floatingDockDefaults__block_invoke(uint64_t a1)
{
  v2 = objc_alloc_init(SBFloatingDockDefaults);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 112);
  *(void *)(v3 + 112) = v2;
  return MEMORY[0x1F41817F8](v2, v4);
}

- (SBGestureDefaults)gestureDefaults
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__SBLocalDefaults_gestureDefaults__block_invoke;
  block[3] = &unk_1E548CA88;
  block[4] = self;
  if (gestureDefaults___once != -1) {
    dispatch_once(&gestureDefaults___once, block);
  }
  return self->_lazy_gestureDefaults;
}

uint64_t __34__SBLocalDefaults_gestureDefaults__block_invoke(uint64_t a1)
{
  v2 = objc_alloc_init(SBGestureDefaults);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 120);
  *(void *)(v3 + 120) = v2;
  return MEMORY[0x1F41817F8](v2, v4);
}

- (SBHardwareDefaults)hardwareDefaults
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__SBLocalDefaults_hardwareDefaults__block_invoke;
  block[3] = &unk_1E548CA88;
  block[4] = self;
  if (hardwareDefaults___once != -1) {
    dispatch_once(&hardwareDefaults___once, block);
  }
  return self->_lazy_hardwareDefaults;
}

uint64_t __35__SBLocalDefaults_hardwareDefaults__block_invoke(uint64_t a1)
{
  v2 = objc_alloc_init(SBHardwareDefaults);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 128);
  *(void *)(v3 + 128) = v2;
  return MEMORY[0x1F41817F8](v2, v4);
}

uint64_t __37__SBLocalDefaults_homeScreenDefaults__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 136) = objc_alloc_init(SBHomeScreenDefaults);
  return MEMORY[0x1F41817F8]();
}

- (SBIconDefaults)iconDefaults
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__SBLocalDefaults_iconDefaults__block_invoke;
  block[3] = &unk_1E548CA88;
  block[4] = self;
  if (iconDefaults___once != -1) {
    dispatch_once(&iconDefaults___once, block);
  }
  return self->_lazy_iconDefaults;
}

uint64_t __31__SBLocalDefaults_iconDefaults__block_invoke(uint64_t a1)
{
  v2 = objc_alloc_init(SBIconDefaults);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 144);
  *(void *)(v3 + 144) = v2;
  return MEMORY[0x1F41817F8](v2, v4);
}

- (SBIdleTimerDefaults)idleTimerDefaults
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__SBLocalDefaults_idleTimerDefaults__block_invoke;
  block[3] = &unk_1E548CA88;
  block[4] = self;
  if (idleTimerDefaults___once != -1) {
    dispatch_once(&idleTimerDefaults___once, block);
  }
  return self->_lazy_idleTimerDefaults;
}

uint64_t __36__SBLocalDefaults_idleTimerDefaults__block_invoke(uint64_t a1)
{
  v2 = objc_alloc_init(SBIdleTimerDefaults);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 152);
  *(void *)(v3 + 152) = v2;
  return MEMORY[0x1F41817F8](v2, v4);
}

- (SBInCallPresentationDefaults)inCallPresentationDefaults
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__SBLocalDefaults_inCallPresentationDefaults__block_invoke;
  block[3] = &unk_1E548CA88;
  block[4] = self;
  if (inCallPresentationDefaults___once != -1) {
    dispatch_once(&inCallPresentationDefaults___once, block);
  }
  return self->_lazy_inCallPresentationDefaults;
}

uint64_t __45__SBLocalDefaults_inCallPresentationDefaults__block_invoke(uint64_t a1)
{
  v2 = objc_alloc_init(SBInCallPresentationDefaults);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 160);
  *(void *)(v3 + 160) = v2;
  return MEMORY[0x1F41817F8](v2, v4);
}

- (SBLockScreenDefaults)lockScreenDefaults
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__SBLocalDefaults_lockScreenDefaults__block_invoke;
  block[3] = &unk_1E548CA88;
  block[4] = self;
  if (lockScreenDefaults___once != -1) {
    dispatch_once(&lockScreenDefaults___once, block);
  }
  return self->_lazy_lockScreenDefaults;
}

uint64_t __37__SBLocalDefaults_lockScreenDefaults__block_invoke(uint64_t a1)
{
  v2 = objc_alloc_init(SBLockScreenDefaults);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 168);
  *(void *)(v3 + 168) = v2;
  return MEMORY[0x1F41817F8](v2, v4);
}

uint64_t __40__SBLocalDefaults_miscellaneousDefaults__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 176) = objc_alloc_init(SBMiscellaneousDefaults);
  return MEMORY[0x1F41817F8]();
}

- (SBMultiUserDefaults)multiUserDefaults
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__SBLocalDefaults_multiUserDefaults__block_invoke;
  block[3] = &unk_1E548CA88;
  block[4] = self;
  if (multiUserDefaults___once != -1) {
    dispatch_once(&multiUserDefaults___once, block);
  }
  return self->_lazy_multiUserDefaults;
}

uint64_t __36__SBLocalDefaults_multiUserDefaults__block_invoke(uint64_t a1)
{
  v2 = objc_alloc_init(SBMultiUserDefaults);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 184);
  *(void *)(v3 + 184) = v2;
  return MEMORY[0x1F41817F8](v2, v4);
}

- (SBNotificationCenterDefaults)notificationCenterDefaults
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__SBLocalDefaults_notificationCenterDefaults__block_invoke;
  block[3] = &unk_1E548CA88;
  block[4] = self;
  if (notificationCenterDefaults___once != -1) {
    dispatch_once(&notificationCenterDefaults___once, block);
  }
  return self->_lazy_notificationCenterDefaults;
}

uint64_t __45__SBLocalDefaults_notificationCenterDefaults__block_invoke(uint64_t a1)
{
  v2 = objc_alloc_init(SBNotificationCenterDefaults);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 192);
  *(void *)(v3 + 192) = v2;
  return MEMORY[0x1F41817F8](v2, v4);
}

- (SBNotificationDefaults)notificationDefaults
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__SBLocalDefaults_notificationDefaults__block_invoke;
  block[3] = &unk_1E548CA88;
  block[4] = self;
  if (notificationDefaults___once != -1) {
    dispatch_once(&notificationDefaults___once, block);
  }
  return self->_lazy_notificationDefaults;
}

uint64_t __39__SBLocalDefaults_notificationDefaults__block_invoke(uint64_t a1)
{
  v2 = objc_alloc_init(SBNotificationDefaults);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 200);
  *(void *)(v3 + 200) = v2;
  return MEMORY[0x1F41817F8](v2, v4);
}

- (SBPencilDefaults)pencilDefaults
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__SBLocalDefaults_pencilDefaults__block_invoke;
  block[3] = &unk_1E548CA88;
  block[4] = self;
  if (pencilDefaults___once != -1) {
    dispatch_once(&pencilDefaults___once, block);
  }
  return self->_lazy_pencilDefaults;
}

uint64_t __33__SBLocalDefaults_pencilDefaults__block_invoke(uint64_t a1)
{
  v2 = objc_alloc_init(SBPencilDefaults);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 208);
  *(void *)(v3 + 208) = v2;
  return MEMORY[0x1F41817F8](v2, v4);
}

uint64_t __30__SBLocalDefaults_pipDefaults__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 216) = objc_alloc_init(SBPIPDefaults);
  return MEMORY[0x1F41817F8]();
}

uint64_t __32__SBLocalDefaults_powerDefaults__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 224) = objc_alloc_init(SBPowerDefaults);
  return MEMORY[0x1F41817F8]();
}

- (SBRecentDisplayItemsDefaults)recentDisplayItemsDefaults
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__SBLocalDefaults_recentDisplayItemsDefaults__block_invoke;
  block[3] = &unk_1E548CA88;
  block[4] = self;
  if (recentDisplayItemsDefaults___once != -1) {
    dispatch_once(&recentDisplayItemsDefaults___once, block);
  }
  return self->_lazy_recentDisplayItemsDefaults;
}

uint64_t __45__SBLocalDefaults_recentDisplayItemsDefaults__block_invoke(uint64_t a1)
{
  v2 = objc_alloc_init(SBRecentDisplayItemsDefaults);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 232);
  *(void *)(v3 + 232) = v2;
  return MEMORY[0x1F41817F8](v2, v4);
}

- (SBRotationDefaults)rotationDefaults
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__SBLocalDefaults_rotationDefaults__block_invoke;
  block[3] = &unk_1E548CA88;
  block[4] = self;
  if (rotationDefaults___once != -1) {
    dispatch_once(&rotationDefaults___once, block);
  }
  return self->_lazy_rotationDefaults;
}

uint64_t __35__SBLocalDefaults_rotationDefaults__block_invoke(uint64_t a1)
{
  v2 = objc_alloc_init(SBRotationDefaults);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 240);
  *(void *)(v3 + 240) = v2;
  return MEMORY[0x1F41817F8](v2, v4);
}

- (SBScreenLongevityDefaults)screenLongevityDefaults
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__SBLocalDefaults_screenLongevityDefaults__block_invoke;
  block[3] = &unk_1E548CA88;
  block[4] = self;
  if (screenLongevityDefaults___once != -1) {
    dispatch_once(&screenLongevityDefaults___once, block);
  }
  return self->_lazy_screenLongevityDefaults;
}

uint64_t __42__SBLocalDefaults_screenLongevityDefaults__block_invoke(uint64_t a1)
{
  v2 = objc_alloc_init(SBScreenLongevityDefaults);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 248);
  *(void *)(v3 + 248) = v2;
  return MEMORY[0x1F41817F8](v2, v4);
}

- (SBSOSDefaults)sosDefaults
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __30__SBLocalDefaults_sosDefaults__block_invoke;
  block[3] = &unk_1E548CA88;
  block[4] = self;
  if (sosDefaults___once != -1) {
    dispatch_once(&sosDefaults___once, block);
  }
  return self->_lazy_sosDefaults;
}

uint64_t __30__SBLocalDefaults_sosDefaults__block_invoke(uint64_t a1)
{
  v2 = objc_alloc_init(SBSOSDefaults);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 256);
  *(void *)(v3 + 256) = v2;
  return MEMORY[0x1F41817F8](v2, v4);
}

- (SBSecurityDefaults)securityDefaults
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__SBLocalDefaults_securityDefaults__block_invoke;
  block[3] = &unk_1E548CA88;
  block[4] = self;
  if (securityDefaults___once != -1) {
    dispatch_once(&securityDefaults___once, block);
  }
  return self->_lazy_securityDefaults;
}

uint64_t __35__SBLocalDefaults_securityDefaults__block_invoke(uint64_t a1)
{
  v2 = objc_alloc_init(SBSecurityDefaults);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 264);
  *(void *)(v3 + 264) = v2;
  return MEMORY[0x1F41817F8](v2, v4);
}

- (SBSetupDefaults)setupDefaults
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__SBLocalDefaults_setupDefaults__block_invoke;
  block[3] = &unk_1E548CA88;
  block[4] = self;
  if (setupDefaults___once != -1) {
    dispatch_once(&setupDefaults___once, block);
  }
  return self->_lazy_setupDefaults;
}

uint64_t __32__SBLocalDefaults_setupDefaults__block_invoke(uint64_t a1)
{
  v2 = objc_alloc_init(SBSetupDefaults);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 272);
  *(void *)(v3 + 272) = v2;
  return MEMORY[0x1F41817F8](v2, v4);
}

- (SBSoftwareUpdateDefaults)softwareUpdateDefaults
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__SBLocalDefaults_softwareUpdateDefaults__block_invoke;
  block[3] = &unk_1E548CA88;
  block[4] = self;
  if (softwareUpdateDefaults___once != -1) {
    dispatch_once(&softwareUpdateDefaults___once, block);
  }
  return self->_lazy_softwareUpdateDefaults;
}

uint64_t __41__SBLocalDefaults_softwareUpdateDefaults__block_invoke(uint64_t a1)
{
  v2 = objc_alloc_init(SBSoftwareUpdateDefaults);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 280);
  *(void *)(v3 + 280) = v2;
  return MEMORY[0x1F41817F8](v2, v4);
}

- (SBSoundDefaults)soundDefaults
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__SBLocalDefaults_soundDefaults__block_invoke;
  block[3] = &unk_1E548CA88;
  block[4] = self;
  if (soundDefaults___once != -1) {
    dispatch_once(&soundDefaults___once, block);
  }
  return self->_lazy_soundDefaults;
}

uint64_t __32__SBLocalDefaults_soundDefaults__block_invoke(uint64_t a1)
{
  v2 = objc_alloc_init(SBSoundDefaults);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 288);
  *(void *)(v3 + 288) = v2;
  return MEMORY[0x1F41817F8](v2, v4);
}

- (SBStateDumpDefaults)stateDumpDefaults
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__SBLocalDefaults_stateDumpDefaults__block_invoke;
  block[3] = &unk_1E548CA88;
  block[4] = self;
  if (stateDumpDefaults___once != -1) {
    dispatch_once(&stateDumpDefaults___once, block);
  }
  return self->_lazy_stateDumpDefaults;
}

uint64_t __36__SBLocalDefaults_stateDumpDefaults__block_invoke(uint64_t a1)
{
  v2 = objc_alloc_init(SBStateDumpDefaults);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 296);
  *(void *)(v3 + 296) = v2;
  return MEMORY[0x1F41817F8](v2, v4);
}

- (SBStatusBarDefaults)statusBarDefaults
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__SBLocalDefaults_statusBarDefaults__block_invoke;
  block[3] = &unk_1E548CA88;
  block[4] = self;
  if (statusBarDefaults___once != -1) {
    dispatch_once(&statusBarDefaults___once, block);
  }
  return self->_lazy_statusBarDefaults;
}

uint64_t __36__SBLocalDefaults_statusBarDefaults__block_invoke(uint64_t a1)
{
  v2 = objc_alloc_init(SBStatusBarDefaults);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 304);
  *(void *)(v3 + 304) = v2;
  return MEMORY[0x1F41817F8](v2, v4);
}

- (SBSystemActionDefaults)systemActionDefaults
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__SBLocalDefaults_systemActionDefaults__block_invoke;
  block[3] = &unk_1E548CA88;
  block[4] = self;
  if (systemActionDefaults___once != -1) {
    dispatch_once(&systemActionDefaults___once, block);
  }
  return self->_lazy_systemActionDefaults;
}

uint64_t __39__SBLocalDefaults_systemActionDefaults__block_invoke(uint64_t a1)
{
  v2 = objc_alloc_init(SBSystemActionDefaults);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 312);
  *(void *)(v3 + 312) = v2;
  return MEMORY[0x1F41817F8](v2, v4);
}

- (SBSystemApertureDefaults)systemApertureDefaults
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__SBLocalDefaults_systemApertureDefaults__block_invoke;
  block[3] = &unk_1E548CA88;
  block[4] = self;
  if (systemApertureDefaults___once != -1) {
    dispatch_once(&systemApertureDefaults___once, block);
  }
  return self->_lazy_systemApertureDefaults;
}

uint64_t __41__SBLocalDefaults_systemApertureDefaults__block_invoke(uint64_t a1)
{
  v2 = objc_alloc_init(SBSystemApertureDefaults);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 320);
  *(void *)(v3 + 320) = v2;
  return MEMORY[0x1F41817F8](v2, v4);
}

- (SBTestingDefaults)testingDefaults
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__SBLocalDefaults_testingDefaults__block_invoke;
  block[3] = &unk_1E548CA88;
  block[4] = self;
  if (testingDefaults___once != -1) {
    dispatch_once(&testingDefaults___once, block);
  }
  return self->_lazy_testingDefaults;
}

uint64_t __34__SBLocalDefaults_testingDefaults__block_invoke(uint64_t a1)
{
  v2 = objc_alloc_init(SBTestingDefaults);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 328);
  *(void *)(v3 + 328) = v2;
  return MEMORY[0x1F41817F8](v2, v4);
}

- (SBThermalDefaults)thermalDefaults
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__SBLocalDefaults_thermalDefaults__block_invoke;
  block[3] = &unk_1E548CA88;
  block[4] = self;
  if (thermalDefaults___once != -1) {
    dispatch_once(&thermalDefaults___once, block);
  }
  return self->_lazy_thermalDefaults;
}

uint64_t __34__SBLocalDefaults_thermalDefaults__block_invoke(uint64_t a1)
{
  v2 = objc_alloc_init(SBThermalDefaults);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 336);
  *(void *)(v3 + 336) = v2;
  return MEMORY[0x1F41817F8](v2, v4);
}

- (SBVoiceControlDefaults)voiceControlDefaults
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__SBLocalDefaults_voiceControlDefaults__block_invoke;
  block[3] = &unk_1E548CA88;
  block[4] = self;
  if (voiceControlDefaults___once != -1) {
    dispatch_once(&voiceControlDefaults___once, block);
  }
  return self->_lazy_voiceControlDefaults;
}

uint64_t __39__SBLocalDefaults_voiceControlDefaults__block_invoke(uint64_t a1)
{
  v2 = objc_alloc_init(SBVoiceControlDefaults);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 352);
  *(void *)(v3 + 352) = v2;
  return MEMORY[0x1F41817F8](v2, v4);
}

- (SBUsageDefaults)usageDefaults
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__SBLocalDefaults_usageDefaults__block_invoke;
  block[3] = &unk_1E548CA88;
  block[4] = self;
  if (usageDefaults___once != -1) {
    dispatch_once(&usageDefaults___once, block);
  }
  return self->_lazy_usageDefaults;
}

uint64_t __32__SBLocalDefaults_usageDefaults__block_invoke(uint64_t a1)
{
  id v2 = [(BSAbstractDefaultDomain *)[SBUsageDefaults alloc] _initWithDomain:@"com.apple.springboard.usage"];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 344);
  *(void *)(v3 + 344) = v2;
  return MEMORY[0x1F41817F8](v2, v4);
}

uint64_t __36__SBLocalDefaults_workspaceDefaults__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 360) = objc_alloc_init(SBWorkspaceDefaults);
  return MEMORY[0x1F41817F8]();
}

- (SBCaptureApplicationDefaults)captureApplicationDefaults
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__SBLocalDefaults_captureApplicationDefaults__block_invoke;
  block[3] = &unk_1E548CA88;
  block[4] = self;
  if (captureApplicationDefaults___once != -1) {
    dispatch_once(&captureApplicationDefaults___once, block);
  }
  return self->_lazy_captureApplicationDefaults;
}

uint64_t __45__SBLocalDefaults_captureApplicationDefaults__block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(SBCaptureApplicationDefaults);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 368);
  *(void *)(v3 + 368) = v2;
  return MEMORY[0x1F41817F8](v2, v4);
}

- (void)migrateAndRemoveOldDefaults
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v2 removeObjectForKey:@"SBShowVictoria"];
  [v2 removeObjectForKey:@"SBHasAttemptedToSynchronizeCloudCriticalData"];
  [v2 removePersistentDomainForName:@"com.apple.springboard.bkgndids"];
  [v2 removeObjectForKey:@"SBCarrierDebuggingAlertVersion"];
  [v2 removeObjectForKey:@"SBStackshotUIFeedback"];
  [v2 removeObjectForKey:@"SBMostRecentFloatingApplicationState"];
  [v2 removeObjectForKey:@"SBShouldShowAppLibraryOnBoardingAlert"];
  [v2 removeObjectForKey:@"SBShouldShowAvocadoWidgetsOnBoardingAlert"];
  [v2 removeObjectForKey:@"SBShouldShowPageHidingOnBoardingAlert"];
  [v2 removeObjectForKey:@"SBHomeScreenPageHidingUIHasEverBeenShown"];
  uint64_t v3 = [v2 objectForKey:@"SBShowInternalWidgets"];
  if (v3)
  {
    uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.chronod"];
    [v4 setObject:v3 forKey:@"showInternalWidgets"];
    [v2 removeObjectForKey:@"SBShowInternalWidgets"];
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = objc_msgSend(v2, "dictionaryRepresentation", 0);
  v6 = [v5 allKeys];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v11 containsString:@"SBOrientationActuation"]) {
          [v2 removeObjectForKey:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lazy_captureApplicationDefaults, 0);
  objc_storeStrong((id *)&self->_lazy_workspaceDefaults, 0);
  objc_storeStrong((id *)&self->_lazy_voiceControlDefaults, 0);
  objc_storeStrong((id *)&self->_lazy_usageDefaults, 0);
  objc_storeStrong((id *)&self->_lazy_thermalDefaults, 0);
  objc_storeStrong((id *)&self->_lazy_testingDefaults, 0);
  objc_storeStrong((id *)&self->_lazy_systemApertureDefaults, 0);
  objc_storeStrong((id *)&self->_lazy_systemActionDefaults, 0);
  objc_storeStrong((id *)&self->_lazy_statusBarDefaults, 0);
  objc_storeStrong((id *)&self->_lazy_stateDumpDefaults, 0);
  objc_storeStrong((id *)&self->_lazy_soundDefaults, 0);
  objc_storeStrong((id *)&self->_lazy_softwareUpdateDefaults, 0);
  objc_storeStrong((id *)&self->_lazy_setupDefaults, 0);
  objc_storeStrong((id *)&self->_lazy_securityDefaults, 0);
  objc_storeStrong((id *)&self->_lazy_sosDefaults, 0);
  objc_storeStrong((id *)&self->_lazy_screenLongevityDefaults, 0);
  objc_storeStrong((id *)&self->_lazy_rotationDefaults, 0);
  objc_storeStrong((id *)&self->_lazy_recentDisplayItemsDefaults, 0);
  objc_storeStrong((id *)&self->_lazy_powerDefaults, 0);
  objc_storeStrong((id *)&self->_lazy_pipDefaults, 0);
  objc_storeStrong((id *)&self->_lazy_pencilDefaults, 0);
  objc_storeStrong((id *)&self->_lazy_notificationDefaults, 0);
  objc_storeStrong((id *)&self->_lazy_notificationCenterDefaults, 0);
  objc_storeStrong((id *)&self->_lazy_multiUserDefaults, 0);
  objc_storeStrong((id *)&self->_lazy_miscellaneousDefaults, 0);
  objc_storeStrong((id *)&self->_lazy_lockScreenDefaults, 0);
  objc_storeStrong((id *)&self->_lazy_inCallPresentationDefaults, 0);
  objc_storeStrong((id *)&self->_lazy_idleTimerDefaults, 0);
  objc_storeStrong((id *)&self->_lazy_iconDefaults, 0);
  objc_storeStrong((id *)&self->_lazy_homeScreenDefaults, 0);
  objc_storeStrong((id *)&self->_lazy_hardwareDefaults, 0);
  objc_storeStrong((id *)&self->_lazy_gestureDefaults, 0);
  objc_storeStrong((id *)&self->_lazy_floatingDockDefaults, 0);
  objc_storeStrong((id *)&self->_lazy_externalDisplayDefaults, 0);
  objc_storeStrong((id *)&self->_lazy_demoDefaults, 0);
  objc_storeStrong((id *)&self->_lazy_cornerGestureDefaults, 0);
  objc_storeStrong((id *)&self->_lazy_captureButtonDefaults, 0);
  objc_storeStrong((id *)&self->_lazy_cameraHardwareButtonDefaults, 0);
  objc_storeStrong((id *)&self->_lazy_bootDefaults, 0);
  objc_storeStrong((id *)&self->_lazy_biometricAuthenticationDefaults, 0);
  objc_storeStrong((id *)&self->_lazy_applicationDefaults, 0);
  objc_storeStrong((id *)&self->_lazy_appSwitcherDefaults, 0);
  objc_storeStrong((id *)&self->_lazy_analyticsDefaults, 0);
  objc_storeStrong((id *)&self->_lazy_ambientDefaults, 0);
  objc_storeStrong((id *)&self->_lazy_alwaysOnDefaults, 0);
  objc_storeStrong((id *)&self->_lazy_accessibilityDefaults, 0);
}

@end