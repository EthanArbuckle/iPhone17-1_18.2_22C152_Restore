@interface SBUIController
+ (CGAffineTransform)_transformAndFrame:(SEL)a3 forLaunchImageHostViewWithOrientation:(CGRect *)a4 statusBarHeight:(int64_t)a5 inJailRect:(double)a6;
+ (CGAffineTransform)_transformForStatusBarWithOrientation:(SEL)a3 scaleFactor:(int64_t)a4;
+ (CGRect)statusBarFrameForDeviceApplicationSceneHandle:(id)a3 displayConfiguration:(id)a4 interfaceOrientation:(int64_t)a5 statusBarStyleRequest:(id)a6 withinBounds:(CGRect)a7 inReferenceSpace:(BOOL)a8;
+ (CGRect)statusBarFrameForSnapshotFrame:(CGRect)a3 orientation:(int64_t)a4 statusBarStyleRequest:(id)a5 hidden:(BOOL)a6;
+ (CGRect)statusBarFrameForSnapshotFrame:(CGRect)a3 remainderFrame:(CGRect *)a4 orientation:(int64_t)a5 statusBarStyleRequest:(id)a6 hidden:(BOOL)a7;
+ (id)_effectiveStatusBarSettingsForSnapshot:(id)a3 sceneHandle:(id)a4;
+ (id)sharedInstance;
+ (id)sharedInstanceIfExists;
+ (id)zoomViewForDeviceApplicationSceneHandle:(id)a3 displayConfiguration:(id)a4 interfaceOrientation:(int64_t)a5 snapshot:(id)a6 snapshotSize:(CGSize)a7 statusBarDescriptor:(id)a8 decodeImage:(BOOL)a9 hasOrientationMismatchForClassicApp:(BOOL)a10 customContainerBounds:(CGRect)a11;
- (BOOL)_isAppropriateToReactToAccessoryEvent;
- (BOOL)_isConnectedToWirelessCharging;
- (BOOL)_powerSourceWantsToPlayChime;
- (BOOL)_shouldInitiateAnimationForAccessory:(id)a3;
- (BOOL)_shouldShowAnimationForAccessory:(id)a3;
- (BOOL)_treatsAccessoryAsSupported:(id)a3;
- (BOOL)chargingChimeEnabled;
- (BOOL)disableAppSwitchForcePressDueToHomeButtonForce;
- (BOOL)dissmissAlertItemsAndSheetsIfPossible;
- (BOOL)handleHomeButtonDoublePressDown;
- (BOOL)handleHomeButtonSinglePressUpForWindowScene:(id)a3;
- (BOOL)handleHomeButtonSinglePressUpForWindowScene:(id)a3 withSourceType:(unint64_t)a4;
- (BOOL)hasVisibleAlertItemOrSheet:(BOOL *)a3;
- (BOOL)homeScreenAutorotatesEvenWhenIconIsDragging;
- (BOOL)isAccessoryAnimationAllowed;
- (BOOL)isBackdropVisible;
- (BOOL)isBatteryCharging;
- (BOOL)isConnectedToChargeIncapablePowerSource;
- (BOOL)isConnectedToExternalChargingSource;
- (BOOL)isConnectedToQiPower;
- (BOOL)isConnectedToUnsupportedChargingAccessory;
- (BOOL)isConnectedToWindowedAccessory;
- (BOOL)isConnectedToWirelessInternalAccessory;
- (BOOL)isConnectedToWirelessInternalCharger;
- (BOOL)isConnectedToWirelessInternalChargingAccessory;
- (BOOL)isFullyCharged;
- (BOOL)isHeadsetBatteryCharging;
- (BOOL)isHeadsetDocked;
- (BOOL)isIconListViewTornDown;
- (BOOL)isOnAC;
- (BOOL)supportsDetailedBatteryCapacity;
- (CGRect)visibleScreenCoordinatesForWindowedAccessory;
- (CSMagSafeAccessory)lastAttachedAccessory;
- (CSMagSafeAccessory)lastDetachedAccessory;
- (NSString)description;
- (SBIconController)iconController;
- (SBUIController)init;
- (SBWindow)window;
- (SBWindowScene)windowScene;
- (UIView)homeScreenContentView;
- (UIView)homeScreenScalingView;
- (float)batteryCapacity;
- (id)_currentHomeScreenLegibilitySettings;
- (id)_legibilitySettings;
- (id)connectedWirelessChargerIdentifier;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (id)workflowClientFromWebClip:(id)a3 appToLaunch:(id)a4;
- (int)batteryCapacityAsPercentage;
- (int64_t)interfaceOrientationForWallpaperController:(id)a3;
- (int64_t)transitionSourceForIcon:(id)a3 iconLocation:(id)a4;
- (unsigned)headsetBatteryCapacity;
- (void)ACPowerChanged;
- (void)_accessoryEndpointAttached:(id)a3;
- (void)_accessoryEndpointDetached:(id)a3;
- (void)_activateApplicationFromAccessibility:(id)a3;
- (void)_activateWorkspaceEntity:(id)a3 fromIcon:(id)a4 location:(id)a5 validator:(id)a6;
- (void)_animationBlockingTimerFired;
- (void)_backgroundContrastDidChange:(id)a3;
- (void)_cancelDebounceWirelessChargingTimer;
- (void)_closeOpenFolderIfNecessary;
- (void)_debounceWirelessChargingTimerFired;
- (void)_disableWirelessChargingChimeAndScreenWakeForDuration:(double)a3;
- (void)_disableWirelessChargingChimeAndScreenWakeForDuration:(double)a3 withMotionAlarm:(BOOL)a4;
- (void)_dismissAccessory:(id)a3 playChime:(BOOL)a4;
- (void)_enumeratePowerSourcesWithBlock:(id)a3;
- (void)_hideKeyboard;
- (void)_playAccessoryChimeIfAppropriateForAccessory:(id)a3 attaching:(BOOL)a4 withDelay:(double)a5;
- (void)_reduceMotionStatusDidChange:(id)a3;
- (void)_removeReachabilityEffectViewIfNecessary;
- (void)_removeSuppressedAccessory:(id)a3;
- (void)_resetWirelessChargingState;
- (void)_setAccessoryAttachmentAnimationBlockingTimerWithDuration:(double)a3;
- (void)_setConnectedToWindowedAccessory:(BOOL)a3;
- (void)_setDebounceWirelessChargingTimerWithDuration:(double)a3;
- (void)_setupHomeScreenContentBackdropView;
- (void)_setupHomeScreenDimmingWindow;
- (void)_storeSuppressedAccessory:(id)a3;
- (void)_switchToHomeScreenWallpaperAnimated:(BOOL)a3;
- (void)_updateLegibility;
- (void)_updateRequireWallpaperRasterization;
- (void)_willRevealOrHideContentView;
- (void)accessoryConnectionInfoProvider:(id)a3 accessoryEndpointAttached:(id)a4 transportType:(int)a5 protocol:(int)a6 properties:(id)a7 forConnection:(id)a8;
- (void)accessoryConnectionInfoProvider:(id)a3 accessoryEndpointDetached:(id)a4 forConnection:(id)a5;
- (void)accessoryConnectionInfoProvider:(id)a3 accessoryEndpointInfoPropertyChanged:(id)a4 properties:(id)a5 forConnection:(id)a6;
- (void)activateApplication:(id)a3 fromIcon:(id)a4 location:(id)a5 activationSettings:(id)a6 actions:(id)a7;
- (void)beginRequiringBackdropViewForReason:(id)a3;
- (void)beginRequiringContentForReason:(id)a3;
- (void)beginRequiringContentForReason:(id)a3 options:(unint64_t)a4;
- (void)beginRequiringLiveBackdropViewForReason:(id)a3;
- (void)cancelInProcessAnimations;
- (void)cancelVolumeEvent;
- (void)connectedDevicesDidChange:(id)a3;
- (void)dealloc;
- (void)didDetectDeviceMotion;
- (void)disableAnimationForNextIconRotation;
- (void)endRequiringBackdropViewForReason:(id)a3;
- (void)endRequiringContentForReason:(id)a3;
- (void)endRequiringLiveBackdropViewForReason:(id)a3;
- (void)getRotationContentSettings:(id *)a3 forWindow:(id)a4;
- (void)handleDidEndReachabilityAnimation;
- (void)handleVolumeButtonWithType:(int64_t)a3 down:(BOOL)a4;
- (void)handleWillBeginReachabilityAnimation;
- (void)homeScreenBackdropView:(id)a3 opaquenessDidChange:(BOOL)a4;
- (void)interactionProgress:(id)a3 didEnd:(BOOL)a4;
- (void)interactionProgressDidUpdate:(id)a3;
- (void)noteStatusBarHeightChanged:(id)a3;
- (void)nudgeIconInterfaceOrientation:(int64_t)a3 duration:(double)a4;
- (void)playChargingChimeIfAppropriate;
- (void)possiblyWakeForPowerStatusChangeWithUnlockSource:(int)a3;
- (void)removeDetachedAccessory:(id)a3;
- (void)restoreContent;
- (void)restoreContentAndUnscatterIconsAnimated:(BOOL)a3;
- (void)restoreContentAndUnscatterIconsAnimated:(BOOL)a3 afterDelay:(double)a4 withCompletion:(id)a5;
- (void)restoreContentAndUnscatterIconsAnimated:(BOOL)a3 withCompletion:(id)a4;
- (void)restoreContentWithOptions:(unint64_t)a3;
- (void)setAllowIconRotation:(BOOL)a3 forReason:(id)a4;
- (void)setChargingChimeEnabled:(BOOL)a3;
- (void)setHomeScreenAlpha:(double)a3 behaviorMode:(int64_t)a4 completion:(id)a5;
- (void)setHomeScreenAutorotatesEvenWhenIconIsDragging:(BOOL)a3;
- (void)setHomeScreenBackdropBlurMaterialRecipeName:(id)a3 behaviorMode:(int64_t)a4 completion:(id)a5;
- (void)setHomeScreenBlurProgress:(double)a3 behaviorMode:(int64_t)a4 completion:(id)a5;
- (void)setHomeScreenDimmingAlpha:(double)a3 behaviorMode:(int64_t)a4 completion:(id)a5;
- (void)setHomeScreenScale:(double)a3 behaviorMode:(int64_t)a4 completion:(id)a5;
- (void)setIsAccessoryAnimationAllowed:(BOOL)a3;
- (void)setIsConnectedToUnsupportedChargingAccessory:(BOOL)a3;
- (void)setLastAttachedAccessory:(id)a3;
- (void)setLastDetachedAccessory:(id)a3;
- (void)setLockScreenScale:(double)a3 withDuration:(double)a4 behaviorMode:(int64_t)a5 completion:(id)a6;
- (void)setPointerInteractionsEnabled:(BOOL)a3;
- (void)setWindowScene:(id)a3;
- (void)settings:(id)a3 changedValueForKey:(id)a4;
- (void)storeAttachedAccessory:(id)a3;
- (void)suppressChimeForConnectedPowerSources;
- (void)tearDownIconListAndBar;
- (void)updateBatteryState:(id)a3;
- (void)updateStatusBarLegibilityForWindowScene:(id)a3;
- (void)wallpaperDidChangeForVariant:(int64_t)a3;
- (void)wallpaperLegibilitySettingsDidChange:(id)a3 forVariant:(int64_t)a4;
- (void)windowedAccessoryDismissed;
- (void)windowedAccessoryPresented;
- (void)zStackParticipant:(id)a3 updatePreferences:(id)a4;
@end

@implementation SBUIController

+ (id)sharedInstance
{
  if ([MEMORY[0x1E4F73138] inUserSessionLoginUI])
  {
    id v2 = 0;
  }
  else
  {
    v3 = (void *)__controllerInstance;
    if (!__controllerInstance)
    {
      kdebug_trace();
      v4 = [SBUIController alloc];
      v5 = (void *)__controllerInstance;
      __controllerInstance = (uint64_t)v4;

      kdebug_trace();
      v3 = (void *)__controllerInstance;
    }
    id v2 = v3;
  }
  return v2;
}

- (SBIconController)iconController
{
  return self->_iconController;
}

- (void)setHomeScreenDimmingAlpha:(double)a3 behaviorMode:(int64_t)a4 completion:(id)a5
{
  v8 = (void (**)(id, uint64_t, void))a5;
  v9 = [(SBWindow *)self->_homeScreenDimmingWindow rootViewController];
  v10 = [v9 view];

  [v10 alpha];
  if (v11 == a3)
  {
    if (v8) {
      v8[2](v8, 1, 0);
    }
  }
  else
  {
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __68__SBUIController_setHomeScreenDimmingAlpha_behaviorMode_completion___block_invoke;
    v22[3] = &unk_1E6AF5580;
    v22[4] = self;
    id v12 = v10;
    id v23 = v12;
    v13 = v8;
    id v24 = v13;
    v14 = (void (**)(void, void, void))MEMORY[0x1D948C7A0](v22);
    [(SBWindow *)self->_homeScreenDimmingWindow setHidden:0];
    uint64_t v15 = [(NSMutableSet *)self->_contentRequiringReasons count];
    if (a4 != 5 || v15)
    {
      v16 = (void *)MEMORY[0x1E4F42FF0];
      v17 = [(SBAppSwitcherSettings *)self->_switcherSettings animationSettings];
      v18 = [v17 opacitySettings];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __68__SBUIController_setHomeScreenDimmingAlpha_behaviorMode_completion___block_invoke_2;
      v19[3] = &unk_1E6AF4A70;
      id v20 = v12;
      double v21 = a3;
      objc_msgSend(v16, "sb_animateWithSettings:mode:animations:completion:", v18, a4, v19, v14);
    }
    else
    {
      [v12 setAlpha:a3];
      if (v13) {
        v14[2](v14, 1, 0);
      }
    }
  }
}

- (void)setHomeScreenBlurProgress:(double)a3 behaviorMode:(int64_t)a4 completion:(id)a5
{
}

- (void)setHomeScreenAlpha:(double)a3 behaviorMode:(int64_t)a4 completion:(id)a5
{
  v8 = (void (**)(id, uint64_t, void))a5;
  v9 = [(SBUIController *)self homeScreenScalingView];
  if ([(NSMutableSet *)self->_contentRequiringReasons count])
  {
    v10 = (void *)MEMORY[0x1E4F42FF0];
    double v11 = [(SBAppSwitcherSettings *)self->_switcherSettings animationSettings];
    id v12 = [v11 homeScreenOpacitySettings];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __61__SBUIController_setHomeScreenAlpha_behaviorMode_completion___block_invoke;
    v13[3] = &unk_1E6AF4A70;
    id v14 = v9;
    double v15 = a3;
    objc_msgSend(v10, "sb_animateWithSettings:mode:animations:completion:", v12, a4, v13, v8);
  }
  else
  {
    [v9 setAlpha:a3];
    if (v8) {
      v8[2](v8, 1, 0);
    }
  }
}

- (void)setHomeScreenScale:(double)a3 behaviorMode:(int64_t)a4 completion:(id)a5
{
  v8 = (void (**)(id, uint64_t, void))a5;
  v9 = [(SBUIController *)self homeScreenScalingView];
  if ([(NSMutableSet *)self->_contentRequiringReasons count])
  {
    v10 = (void *)MEMORY[0x1E4F42FF0];
    double v11 = [(SBAppSwitcherSettings *)self->_switcherSettings animationSettings];
    id v12 = [v11 homeScreenScaleSettings];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __61__SBUIController_setHomeScreenScale_behaviorMode_completion___block_invoke;
    v13[3] = &unk_1E6AF4A70;
    id v14 = v9;
    double v15 = a3;
    objc_msgSend(v10, "sb_animateWithSettings:mode:animations:completion:", v12, a4, v13, v8);
  }
  else
  {
    CGAffineTransformMakeScale(&v16, a3, a3);
    [v9 setTransform:&v16];
    if (v8) {
      v8[2](v8, 1, 0);
    }
  }
}

- (UIView)homeScreenScalingView
{
  return self->_iconsView;
}

- (void)setHomeScreenBackdropBlurMaterialRecipeName:(id)a3 behaviorMode:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  v9 = (void *)MEMORY[0x1E4F42FF0];
  switcherSettings = self->_switcherSettings;
  id v11 = a5;
  id v12 = [(SBAppSwitcherSettings *)switcherSettings animationSettings];
  v13 = [v12 homeScreenScaleSettings];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __86__SBUIController_setHomeScreenBackdropBlurMaterialRecipeName_behaviorMode_completion___block_invoke;
  v15[3] = &unk_1E6AF5290;
  v15[4] = self;
  id v16 = v8;
  id v14 = v8;
  objc_msgSend(v9, "sb_animateWithSettings:mode:animations:completion:", v13, a4, v15, v11);
}

uint64_t __61__SBUIController_setHomeScreenAlpha_behaviorMode_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:*(double *)(a1 + 40)];
}

+ (id)sharedInstanceIfExists
{
  return (id)__controllerInstance;
}

- (void)setPointerInteractionsEnabled:(BOOL)a3
{
  if (self->_disallowsPointerInteraction != !a3)
  {
    self->_disallowsPointerInteraction = !a3;
    v4 = [(SBUIController *)self iconController];
    v5 = [v4 iconManager];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __48__SBUIController_setPointerInteractionsEnabled___block_invoke;
    v6[3] = &unk_1E6AF5798;
    v6[4] = self;
    [v5 enumerateDisplayedIconViewsUsingBlock:v6];
  }
}

- (void)_updateRequireWallpaperRasterization
{
  BOOL v3 = [(SBUIController *)self isBackdropVisible];
  wallpaperRasterizationAssertion = self->_wallpaperRasterizationAssertion;
  if (v3)
  {
    if (wallpaperRasterizationAssertion) {
      return;
    }
    id v8 = +[SBWallpaperController sharedInstance];
    v5 = [v8 requireWallpaperRasterizationWithReason:@"SBUIControllerWallpaperRasterizationReason"];
    v6 = self->_wallpaperRasterizationAssertion;
    self->_wallpaperRasterizationAssertion = v5;

    v7 = (BSInvalidatable *)v8;
  }
  else
  {
    if (!wallpaperRasterizationAssertion) {
      return;
    }
    [(BSInvalidatable *)wallpaperRasterizationAssertion invalidate];
    v7 = self->_wallpaperRasterizationAssertion;
    self->_wallpaperRasterizationAssertion = 0;
  }
}

- (BOOL)isBackdropVisible
{
  if ([(SBHomeScreenBackdropViewBase *)self->_homeScreenBackdropView requiresBackdropView]) {
    return 1;
  }
  homeScreenBackdropView = self->_homeScreenBackdropView;
  return [(SBHomeScreenBackdropViewBase *)homeScreenBackdropView requiresLiveBackdropView];
}

- (void)beginRequiringLiveBackdropViewForReason:(id)a3
{
  [(SBHomeScreenBackdropViewBase *)self->_homeScreenBackdropView beginRequiringLiveBackdropViewForReason:a3];
  [(SBUIController *)self _updateRequireWallpaperRasterization];
}

- (void)beginRequiringBackdropViewForReason:(id)a3
{
  [(SBHomeScreenBackdropViewBase *)self->_homeScreenBackdropView beginRequiringBackdropViewForReason:a3];
  [(SBUIController *)self _updateRequireWallpaperRasterization];
}

- (void)endRequiringLiveBackdropViewForReason:(id)a3
{
  [(SBHomeScreenBackdropViewBase *)self->_homeScreenBackdropView endRequiringLiveBackdropViewForReason:a3];
  [(SBUIController *)self _removeReachabilityEffectViewIfNecessary];
  [(SBUIController *)self _updateRequireWallpaperRasterization];
}

- (void)_removeReachabilityEffectViewIfNecessary
{
  if ([(SBHomeScreenBackdropViewBase *)self->_homeScreenBackdropView requiresBackdropView]) {
    char v3 = 0;
  }
  else {
    char v3 = ![(SBHomeScreenBackdropViewBase *)self->_homeScreenBackdropView requiresLiveBackdropView];
  }
  BOOL v4 = [(SBHomeScreenBackdropViewBase *)self->_homeScreenBackdropView isOpaque];
  if ((v3 & 1) != 0 || v4)
  {
    reachabilityWallpaperEffectView = self->_reachabilityWallpaperEffectView;
    if (reachabilityWallpaperEffectView)
    {
      [(SBWallpaperEffectView *)reachabilityWallpaperEffectView removeFromSuperview];
      v6 = self->_reachabilityWallpaperEffectView;
      self->_reachabilityWallpaperEffectView = 0;
    }
  }
}

- (void)endRequiringBackdropViewForReason:(id)a3
{
  [(SBHomeScreenBackdropViewBase *)self->_homeScreenBackdropView endRequiringBackdropViewForReason:a3];
  [(SBUIController *)self _removeReachabilityEffectViewIfNecessary];
  [(SBUIController *)self _updateRequireWallpaperRasterization];
}

void __46__SBUIController__powerSourceWantsToPlayChime__block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  char v3 = [v9 objectForKeyedSubscript:@"Power Source ID"];
  if (v3)
  {
    BOOL v4 = [v9 objectForKeyedSubscript:@"Play Charging Chime"];
    int v5 = [v4 BOOLValue];

    v6 = [*(id *)(*(void *)(a1 + 32) + 176) objectForKeyedSubscript:v3];
    char v7 = [v6 BOOLValue];

    if (!v5 || (v7 & 1) != 0)
    {
      if (v5) {
        goto LABEL_8;
      }
      uint64_t v8 = MEMORY[0x1E4F1CC28];
    }
    else
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
      uint64_t v8 = MEMORY[0x1E4F1CC38];
    }
    [*(id *)(*(void *)(a1 + 32) + 176) setObject:v8 forKeyedSubscript:v3];
  }
LABEL_8:
}

void __86__SBUIController_setHomeScreenBackdropBlurMaterialRecipeName_behaviorMode_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_opt_class();
  char v3 = SBSafeCast(v2, *(void **)(*(void *)(a1 + 32) + 32));
  if (v3)
  {
    id v4 = v3;
    [v3 setMaterialRecipeName:*(void *)(a1 + 40)];
    char v3 = v4;
  }
}

- (int64_t)interfaceOrientationForWallpaperController:(id)a3
{
  char v3 = [(SBUIController *)self window];
  int64_t v4 = [v3 interfaceOrientation];

  return v4;
}

- (SBWindow)window
{
  return (SBWindow *)self->_window;
}

- (void)setHomeScreenAutorotatesEvenWhenIconIsDragging:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(SBUIController *)self iconController];
  int64_t v4 = [v5 homeScreenViewController];
  [v4 setHomeScreenAutorotatesEvenWhenIconIsDragging:v3];
  if (SBTraitsArbiterOrientationActuationEnabledForRole(@"SBTraitsParticipantRoleHomeScreen")) {
    [v4 _setNeedsUpdateOfSupportedInterfaceOrientations];
  }
}

uint64_t __71__SBUIController__activateWorkspaceEntity_fromIcon_location_validator___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    return (*(uint64_t (**)(void))(v1 + 16))();
  }
  else {
    return 1;
  }
}

void __71__SBUIController__activateWorkspaceEntity_fromIcon_location_validator___block_invoke_2(uint64_t a1, void *a2)
{
  id v6 = a2;
  BOOL v3 = *(void **)(a1 + 32);
  if (v3)
  {
    int64_t v4 = *(void **)(a1 + 40);
    id v5 = [v3 leafIdentifier];
    [v4 setObject:v5 forActivationSetting:46];
  }
  [v6 setActivatingEntity:*(void *)(a1 + 40)];
}

uint64_t __61__SBUIController_setHomeScreenScale_behaviorMode_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  CGAffineTransformMakeScale(&v3, *(CGFloat *)(a1 + 40), *(CGFloat *)(a1 + 40));
  return [v1 setTransform:&v3];
}

- (void)cancelInProcessAnimations
{
  CGAffineTransform v3 = [(SBUIController *)self window];
  [v3 _removeAllRetargetableAnimations:1];

  [(SBWindow *)self->_homeScreenDimmingWindow _removeAllRetargetableAnimations:1];
  homeScreenBackdropView = self->_homeScreenBackdropView;
  [(SBHomeScreenBackdropViewBase *)homeScreenBackdropView cancelInProcessAnimations];
}

- (void)beginRequiringContentForReason:(id)a3
{
}

- (void)endRequiringContentForReason:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"SBUIController.m", 1054, @"Invalid parameter not satisfying: %@", @"reason" object file lineNumber description];
  }
  id v6 = SBLogUIController();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v11 = v5;
    _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "End requiring home screen content for reason '%{public}@'", buf, 0xCu);
  }

  uint64_t v7 = [(NSMutableSet *)self->_contentRequiringReasons count];
  [(NSMutableSet *)self->_contentRequiringReasons removeObject:v5];
  uint64_t v8 = [(NSMutableSet *)self->_contentRequiringReasons count];
  if (v7 && !v8) {
    [(SBUIController *)self tearDownIconListAndBar];
  }
}

- (void)beginRequiringContentForReason:(id)a3 options:(unint64_t)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (!v7)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"SBUIController.m", 1037, @"Invalid parameter not satisfying: %@", @"reason" object file lineNumber description];
  }
  uint64_t v8 = SBLogUIController();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v15 = v7;
    _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "Begin requiring home screen content for reason '%{public}@'", buf, 0xCu);
  }

  contentRequiringReasons = self->_contentRequiringReasons;
  if (!contentRequiringReasons)
  {
    v10 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    id v11 = self->_contentRequiringReasons;
    self->_contentRequiringReasons = v10;

    contentRequiringReasons = self->_contentRequiringReasons;
  }
  uint64_t v12 = [(NSMutableSet *)contentRequiringReasons count];
  [(NSMutableSet *)self->_contentRequiringReasons addObject:v7];
  if (!v12 || [(SBUIController *)self isIconListViewTornDown]) {
    [(SBUIController *)self restoreContentWithOptions:a4];
  }
}

- (BOOL)isIconListViewTornDown
{
  return [(UIView *)self->_iconsView isHidden];
}

- (void)tearDownIconListAndBar
{
  if (![(NSMutableSet *)self->_contentRequiringReasons count]
    || [(SBHomeScreenBackdropViewBase *)self->_homeScreenBackdropView isOpaque])
  {
    CGAffineTransform v3 = SBLogUIController();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "Tearing down home screen", v7, 2u);
    }

    int64_t v4 = [(SBUIController *)self iconController];
    id v5 = [v4 homeScreenViewController];
    [v5 setIconContentHidden:1];
    id v6 = +[SBWallpaperController sharedInstance];
    [v6 deactivateOrientationSource:2];
  }
}

+ (id)_effectiveStatusBarSettingsForSnapshot:(id)a3 sceneHandle:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 statusBarSettings];
  if (v7 && ![v5 contentType])
  {
    id v8 = v7;
  }
  else
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4FA58F0]);
    objc_msgSend(v8, "setHidden:", objc_msgSend(v6, "defaultStatusBarHiddenForOrientation:", objc_msgSend(v5, "interfaceOrientation")));
    objc_msgSend(v8, "setStyle:", _SBStatusBarLegacyStyleFromStyle(objc_msgSend(v6, "defaultStatusBarStyle")));
  }

  return v8;
}

void __48__SBUIController_setPointerInteractionsEnabled___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  CGAffineTransform v3 = [v5 location];
  char v4 = SBIconLocationGroupContainsLocation();

  if ((v4 & 1) == 0) {
    [v5 setDisallowCursorInteraction:*(unsigned __int8 *)(*(void *)(a1 + 32) + 224)];
  }
}

uint64_t __68__SBUIController_setHomeScreenDimmingAlpha_behaviorMode_completion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:*(double *)(a1 + 40)];
}

- (void)setAllowIconRotation:(BOOL)a3 forReason:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v8 = [(SBUIController *)self iconController];
  id v7 = [v8 homeScreenViewController];
  [v7 setAllowIconRotation:v4 forReason:v6];
}

- (void)activateApplication:(id)a3 fromIcon:(id)a4 location:(id)a5 activationSettings:(id)a6 actions:(id)a7
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v17 = SBLogUIController();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v69 = v12;
    __int16 v70 = 2112;
    id v71 = v13;
    __int16 v72 = 2114;
    id v73 = v14;
    _os_log_impl(&dword_1D85BA000, v17, OS_LOG_TYPE_DEFAULT, "Activate application %@ from icon %@ location %{public}@", buf, 0x20u);
  }

  v65[0] = MEMORY[0x1E4F143A8];
  v65[1] = 3221225472;
  v65[2] = __83__SBUIController_activateApplication_fromIcon_location_activationSettings_actions___block_invoke;
  v65[3] = &unk_1E6AF55C8;
  id v18 = v16;
  id v66 = v18;
  id v19 = v15;
  id v67 = v19;
  id v20 = (void (**)(void, void))MEMORY[0x1D948C7A0](v65);
  if ([v13 isBookmarkIcon])
  {
    double v21 = (SBRegionallyRestrictedAlertItem *)v13;
    id v22 = [(SBRegionallyRestrictedAlertItem *)v21 webClip];
    if ([v22 eligibilityStatus] == 1)
    {
      id v23 = [[SBWebClipEligibilityAlertItem alloc] initWithWebClip:v22];
      id v24 = +[SBAlertItemsController sharedInstance];
      [v24 activateAlertItem:v23];

LABEL_11:
      goto LABEL_24;
    }
    v54 = v20;
    v27 = [(SBRegionallyRestrictedAlertItem *)v21 bookmark];
    if ([v27 isShortcutsWebClip])
    {
      [(SBRegionallyRestrictedAlertItem *)v21 bookmark];
      id v51 = v13;
      id v28 = v12;
      id v29 = v18;
      v31 = v30 = self;
      char v32 = [v31 isSingleStepShortcutWebClip];

      self = v30;
      id v18 = v29;
      id v12 = v28;
      id v13 = v51;

      if ((v32 & 1) == 0)
      {
        id v23 = [(SBUIController *)self workflowClientFromWebClip:v22 appToLaunch:v12];
        [(SBWebClipEligibilityAlertItem *)v23 start];
        id v20 = v54;
        goto LABEL_11;
      }
    }
    else
    {
    }
    v40 = +[SBMainSwitcherControllerCoordinator _shim_activeSwitcherController];
    [v40 layoutStateApplicationSceneHandles];
    v41 = v53 = v14;
    uint64_t v49 = [v22 identifier];
    v42 = [(id)SBApp webClipService];
    v56[0] = MEMORY[0x1E4F143A8];
    v56[1] = 3221225472;
    v56[2] = __83__SBUIController_activateApplication_fromIcon_location_activationSettings_actions___block_invoke_2;
    v56[3] = &unk_1E6AF5610;
    v64 = v54;
    v56[4] = self;
    v57 = v21;
    id v58 = v53;
    id v59 = v41;
    id v60 = v40;
    v61 = v57;
    id v62 = v22;
    id v63 = v12;
    id v43 = v22;
    id v44 = v40;
    id v45 = v41;
    id v14 = v53;
    id v22 = v45;
    [v42 prepareToLaunchWebClipWithIdentifier:v49 handler:v56];

    id v20 = v54;
    double v21 = (SBRegionallyRestrictedAlertItem *)v49;
    goto LABEL_24;
  }
  v50 = self;
  v25 = [v12 info];
  int v26 = [v25 isRegionallyRestricted];

  if (v26)
  {
    double v21 = objc_alloc_init(SBRegionallyRestrictedAlertItem);
    id v22 = +[SBAlertItemsController sharedInstance];
    [v22 activateAlertItem:v21];
  }
  else
  {
    v33 = +[SBWorkspace mainWorkspace];
    id v22 = [v33 inCallPresentationManager];

    if ([v18 count]
      || ![v22 hasOverrideAppSceneEntityForLaunchingApplication:v12])
    {
      id v52 = v14;
      v55 = v20;
      v34 = [v19 objectForActivationSetting:69];
      v48 = [v34 sceneManager];
      v35 = [SBDeviceApplicationSceneEntity alloc];
      int v36 = __sb__runningInSpringBoard();
      char v37 = v36;
      id v38 = v12;
      if (v36)
      {
        BOOL v39 = SBFEffectiveDeviceClass() == 2;
      }
      else
      {
        v47 = [MEMORY[0x1E4F42948] currentDevice];
        BOOL v39 = [v47 userInterfaceIdiom] == 1;
      }
      v46 = [v34 _fbsDisplayIdentity];
      double v21 = [(SBDeviceApplicationSceneEntity *)v35 initWithApplication:v38 generatingNewPrimarySceneIfRequired:v39 sceneHandleProvider:v48 displayIdentity:v46];

      if ((v37 & 1) == 0) {
      id v12 = v38;
      }
      id v14 = v52;
      id v20 = v55;
    }
    else
    {
      double v21 = [v22 overrideAppSceneEntityForLaunchingApplication:v12];
    }
    ((void (**)(void, SBRegionallyRestrictedAlertItem *))v20)[2](v20, v21);
    [(SBUIController *)v50 _activateWorkspaceEntity:v21 fromIcon:v13 location:v14 validator:0];
  }
LABEL_24:
}

void __83__SBUIController_activateApplication_fromIcon_location_activationSettings_actions___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 addActions:v3];
  [v4 applyActivationSettings:*(void *)(a1 + 40)];
}

- (void)_activateWorkspaceEntity:(id)a3 fromIcon:(id)a4 location:(id)a5 validator:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [v10 deviceApplicationSceneEntity];
  id v15 = [v14 activationSettings];

  id v16 = [v15 objectForActivationSetting:69];
  v17 = [v16 _fbsDisplayIdentity];
  id v18 = [v17 currentConfiguration];

  char v19 = [v15 BOOLForActivationSetting:73];
  id v20 = +[SBWorkspace mainWorkspace];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __71__SBUIController__activateWorkspaceEntity_fromIcon_location_validator___block_invoke;
  v27[3] = &unk_1E6AF5660;
  v27[4] = self;
  id v28 = v11;
  id v29 = v12;
  id v30 = v10;
  char v31 = v19;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __71__SBUIController__activateWorkspaceEntity_fromIcon_location_validator___block_invoke_3;
  v25[3] = &unk_1E6AF5688;
  id v26 = v13;
  id v21 = v13;
  id v22 = v10;
  id v23 = v12;
  id v24 = v11;
  [v20 requestTransitionWithOptions:0 displayConfiguration:v18 builder:v27 validator:v25];
}

void __71__SBUIController__activateWorkspaceEntity_fromIcon_location_validator___block_invoke(uint64_t a1, void *a2)
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) transitionSourceForIcon:*(void *)(a1 + 40) iconLocation:*(void *)(a1 + 48)];
  if (v4 == 1) {
    [*(id *)(a1 + 56) setFlag:1 forActivationSetting:39];
  }
  [v3 setSource:v4];
  [v3 setEventLabel:@"SBUIApplicationIconLaunchEventLabel"];
  if (*(unsigned char *)(a1 + 64))
  {
    id v5 = *(void **)(a1 + 40);
    if (v5)
    {
      id v6 = *(void **)(a1 + 56);
      id v7 = [v5 leafIdentifier];
      [v6 setObject:v7 forActivationSetting:46];
    }
    id v8 = objc_alloc_init(SBWorkspaceApplicationSceneTransitionContext);
    v15[0] = *(void *)(a1 + 56);
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
    id v10 = +[SBWorkspaceEntity entity];
    id v11 = +[SBWorkspaceEntity entity];
    [(SBWorkspaceApplicationSceneTransitionContext *)v8 setEntities:v9 startingAtLayoutRole:1 withPolicy:1 centerEntity:v10 floatingEntity:v11];

    [(SBWorkspaceApplicationSceneTransitionContext *)v8 _setRequestedFrontmostEntity:*(void *)(a1 + 56)];
    [v3 setApplicationContext:v8];
  }
  else
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __71__SBUIController__activateWorkspaceEntity_fromIcon_location_validator___block_invoke_2;
    v12[3] = &unk_1E6AF5638;
    id v13 = (SBWorkspaceApplicationSceneTransitionContext *)*(id *)(a1 + 40);
    id v14 = *(id *)(a1 + 56);
    [v3 modifyApplicationContext:v12];

    id v8 = v13;
  }
}

- (int64_t)transitionSourceForIcon:(id)a3 iconLocation:(id)a4
{
  id v5 = a4;
  if ([a3 isWidgetIcon])
  {
    int64_t v6 = 19;
  }
  else if ((SBIconLocationGroupContainsLocation() & 1) != 0 {
         || ([v5 isEqualToString:*MEMORY[0x1E4FA6688]] & 1) != 0
  }
         || ([v5 isEqualToString:*MEMORY[0x1E4FA6698]] & 1) != 0)
  {
    int64_t v6 = 1;
  }
  else
  {
    uint64_t v8 = *MEMORY[0x1E4FA6680];
    if ([v5 isEqualToString:*MEMORY[0x1E4FA6680]]) {
      goto LABEL_9;
    }
    if ([v5 isEqualToString:*MEMORY[0x1E4FA6670]])
    {
      int64_t v6 = 42;
      goto LABEL_7;
    }
    if ([v5 isEqualToString:*MEMORY[0x1E4FA6668]])
    {
      int64_t v6 = 41;
      goto LABEL_7;
    }
    if ([v5 isEqualToString:*MEMORY[0x1E4FA6650]])
    {
      int64_t v6 = 38;
      goto LABEL_7;
    }
    if ([v5 isEqualToString:*MEMORY[0x1E4FA6660]])
    {
      int64_t v6 = 40;
      goto LABEL_7;
    }
    if ([v5 isEqualToString:v8])
    {
LABEL_9:
      int64_t v6 = 39;
    }
    else if ([v5 isEqualToString:*MEMORY[0x1E4FA6690]])
    {
      int64_t v6 = 24;
    }
    else if ([v5 isEqualToString:@"SBIconLocationFloatingDockSuggestions"])
    {
      int64_t v6 = 25;
    }
    else if (SBIconLocationGroupContainsLocation())
    {
      int64_t v6 = 46;
    }
    else
    {
      int64_t v6 = 0;
    }
  }
LABEL_7:

  return v6;
}

+ (id)zoomViewForDeviceApplicationSceneHandle:(id)a3 displayConfiguration:(id)a4 interfaceOrientation:(int64_t)a5 snapshot:(id)a6 snapshotSize:(CGSize)a7 statusBarDescriptor:(id)a8 decodeImage:(BOOL)a9 hasOrientationMismatchForClassicApp:(BOOL)a10 customContainerBounds:(CGRect)a11
{
  CGFloat height = a11.size.height;
  CGFloat width = a11.size.width;
  CGFloat y = a11.origin.y;
  CGFloat x = a11.origin.x;
  double v20 = a7.height;
  double v21 = a7.width;
  BOOL v109 = a10;
  id v24 = a3;
  id v25 = a4;
  id v26 = a6;
  id v27 = a8;
  if (v26)
  {
    [v26 referenceSize];
    if (v29 != v21 || v28 != v20)
    {
      v93 = [MEMORY[0x1E4F28B00] currentHandler];
      [v93 handleFailureInMethod:a2, a1, @"SBUIController+SBUIAnimationController.m", 297, @"Invalid parameter not satisfying: %@", @"!snapshot || CGSizeEqualToSize([snapshot referenceSize], snapshotSize)" object file lineNumber description];
    }
  }
  char v31 = [v24 application];
  int v32 = [v31 isClassic];
  if (v32) {
    [v25 bounds];
  }
  else {
    BSRectWithSize();
  }
  double v113 = v33;
  double v114 = v34;
  double v111 = v35;
  double v112 = v36;
  v118.origin.CGFloat x = *(CGFloat *)MEMORY[0x1E4F1DB28];
  v118.origin.CGFloat y = *(CGFloat *)(MEMORY[0x1E4F1DB28] + 8);
  CGFloat v37 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  CGFloat v38 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v117.origin.CGFloat x = x;
  v117.origin.CGFloat y = y;
  v117.size.CGFloat width = width;
  v117.size.CGFloat height = height;
  CGFloat v95 = v118.origin.y;
  uint64_t v97 = *MEMORY[0x1E4F1DB28];
  v118.size.CGFloat width = v37;
  v118.size.CGFloat height = v38;
  BOOL v39 = CGRectEqualToRect(v117, v118);
  if (!v39)
  {
    double v111 = width;
    double v112 = height;
    double v113 = x;
    double v114 = y;
  }
  if (!v26)
  {
    v61 = -[SBZoomView _initWithFrame:]([SBZoomView alloc], "_initWithFrame:", v113, v114, v111, v112);
    id v62 = [MEMORY[0x1E4F428B8] blackColor];
    [(SBFullscreenZoomView *)v61 setBackgroundColor:v62];

    goto LABEL_45;
  }
  BOOL v100 = a9;
  id v101 = v27;
  uint64_t v40 = [v26 interfaceOrientation];
  if (v39) {
    int64_t v41 = a5;
  }
  else {
    int64_t v41 = 0;
  }
  if ((unint64_t)(a5 - 1) < 2 != (unint64_t)(v40 - 1) < 2) {
    uint64_t v42 = v40;
  }
  else {
    uint64_t v42 = v41;
  }
  int64_t v110 = v42;
  id v43 = [a1 _effectiveStatusBarSettingsForSnapshot:v26 sceneHandle:v24];
  id v44 = objc_msgSend(v24, "statusBarEffectiveStyleRequestWithStyle:", _SBStatusBarStyleFromLegacyStyle(objc_msgSend(v43, "style")));
  BSRectWithSize();
  double v46 = v45;
  double v48 = v47;
  double v50 = v49;
  double v52 = v51;
  [v26 contentFrame];
  double v54 = v53;
  double v105 = v55;
  double v106 = v56;
  double v58 = v57;
  int64_t v107 = a5;
  v99 = v43;
  if (v32 && ![v31 includesStatusBarInClassicJailForInterfaceOrientation:a5])
  {
    uint64_t v59 = 0;
    int v60 = 1;
  }
  else
  {
    uint64_t v59 = [v43 isHidden];
    int v60 = 0;
  }
  objc_msgSend(a1, "statusBarFrameForSnapshotFrame:orientation:statusBarStyleRequest:hidden:", v110, v44, v59, v46, v48, v50, v52);
  uint64_t v103 = v63;
  double v104 = v64;
  double v66 = v65;
  CGFloat v108 = v67;
  long long v115 = SBUICUnitScaleFactor;
  v68 = [v26 name];
  char v69 = [v68 isEqualToString:@"SBSuspendSnapshot"];

  id v102 = v25;
  if ((v69 & 1) == 0 && v39)
  {
    if (v60) {
      int64_t v70 = v107;
    }
    else {
      int64_t v70 = v110;
    }
    double v72 = v111;
    double v71 = v112;
    double v73 = v58;
    if (v32)
    {
      if ([v31 classicAppZoomedInOrRequiresHiDPI]) {
        LOBYTE(v32) = [v31 classicAppZoomedIn];
      }
      else {
        LOBYTE(v32) = 0;
      }
      objc_msgSend(v31, "snapshotFrameForClassicInsideBounds:forOrientation:scaleFactor:inReferenceSpace:", v70, &v115, 1, v113, v114, v111, v112);
      SBUICScaledRectWithOffset();
      double v96 = v80;
      double v105 = v81;
      double v106 = v82;
      double v73 = v83;
      SBUICScaledRectWithOffset();
      uint64_t v103 = v84;
      double v104 = v85;
      CGFloat v98 = v86;
      CGFloat v108 = v87;
      if (SBFEffectiveHomeButtonType() == 2
        && ![v31 classicAppNonFullScreenWithHomeAffordance])
      {
        char v74 = 0;
      }
      else
      {
        char v74 = [v31 classicAppPhoneAppRunningOnPad] ^ 1;
      }
      double v72 = v111;
      double v71 = v112;
      double v54 = v96;
    }
    else
    {
      CGFloat v98 = v66;
      char v74 = 0;
    }
    double v75 = v105;
    double v76 = v106;
    goto LABEL_43;
  }
  double v72 = v111;
  double v71 = v112;
  if (!v32)
  {
    CGFloat v98 = v66;
    char v74 = 0;
    double v75 = v105;
    double v76 = v106;
    double v73 = v58;
LABEL_43:
    uint64_t v78 = v103;
    CGFloat v79 = v104;
    goto LABEL_44;
  }
  LOBYTE(v32) = 0;
  char v74 = 0;
  BOOL v109 = v39 && a10;
  double v54 = v113;
  double v75 = v114;
  double v76 = v111;
  CGFloat v77 = v37;
  CGFloat v79 = v95;
  uint64_t v78 = v97;
  CGFloat v98 = v77;
  CGFloat v108 = v38;
  double v73 = v112;
LABEL_44:
  uint64_t v88 = [v44 isDoubleHeight];
  v89 = [v31 info];
  char v90 = [v89 preventsLaunchInterfaceSplitting];

  BYTE4(v94) = v109;
  BYTE3(v94) = v74;
  BYTE2(v94) = v100;
  BYTE1(v94) = v32;
  LOBYTE(v94) = v90;
  v61 = -[SBFullscreenZoomView initWithContainingBounds:contentFrame:statusBarFrame:snapshot:snapshotOrientation:interfaceOrientation:doubleHeightStatusBar:allowStatusBarToOverlap:useLargerCornerRadii:preventSplit:needsZoomFilter:asyncDecodeImage:forJail:hasOrientationMismatchForClassicApp:]([SBFullscreenZoomView alloc], "initWithContainingBounds:contentFrame:statusBarFrame:snapshot:snapshotOrientation:interfaceOrientation:doubleHeightStatusBar:allowStatusBarToOverlap:useLargerCornerRadii:preventSplit:needsZoomFilter:asyncDecodeImage:forJail:hasOrientationMismatchForClassicApp:", v26, v110, v107, v88, v60 ^ 1u, [v31 classicAppWithRoundedCorners], v113, v114, v72, v71, v54, v75, v76, v73, v78,
          *(void *)&v79,
          *(void *)&v98,
          *(void *)&v108,
          v94);
  v91 = [(SBFullscreenZoomView *)v61 layer];
  [v91 setAllowsGroupOpacity:0];

  id v27 = v101;
  id v25 = v102;
LABEL_45:

  return v61;
}

+ (CGRect)statusBarFrameForSnapshotFrame:(CGRect)a3 remainderFrame:(CGRect *)a4 orientation:(int64_t)a5 statusBarStyleRequest:(id)a6 hidden:(BOOL)a7
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v14 = a6;
  id v15 = v14;
  CGFloat v16 = 0.0;
  if (!a7)
  {
    objc_msgSend(MEMORY[0x1E4F42E28], "heightForStyle:orientation:", objc_msgSend(v14, "style"), a5);
    CGFloat v16 = v17;
  }
  CGPoint v18 = (CGPoint)*MEMORY[0x1E4F1DB28];
  CGSize v19 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
  if (a5 == 1) {
    int v20 = 1;
  }
  else {
    int v20 = 3;
  }
  if ((unint64_t)(a5 - 1) >= 2) {
    CGRectEdge v21 = 2 * (a5 != 4);
  }
  else {
    CGRectEdge v21 = v20;
  }
  v27.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
  v27.CGSize size = v19;
  slice.origin = v18;
  slice.CGSize size = v19;
  v29.origin.CGFloat x = x;
  v29.origin.CGFloat y = y;
  v29.size.CGFloat width = width;
  v29.size.CGFloat height = height;
  CGRectDivide(v29, &slice, &v27, v16, v21);
  if (a4)
  {
    CGSize size = v27.size;
    a4->origin = v27.origin;
    a4->CGSize size = size;
  }

  double v23 = slice.origin.x;
  double v24 = slice.origin.y;
  double v25 = slice.size.width;
  double v26 = slice.size.height;
  result.size.CGFloat height = v26;
  result.size.CGFloat width = v25;
  result.origin.CGFloat y = v24;
  result.origin.CGFloat x = v23;
  return result;
}

+ (CGRect)statusBarFrameForSnapshotFrame:(CGRect)a3 orientation:(int64_t)a4 statusBarStyleRequest:(id)a5 hidden:(BOOL)a6
{
  objc_msgSend(a1, "statusBarFrameForSnapshotFrame:remainderFrame:orientation:statusBarStyleRequest:hidden:", 0, a4, a5, a6, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  result.size.CGFloat height = v9;
  result.size.CGFloat width = v8;
  result.origin.CGFloat y = v7;
  result.origin.CGFloat x = v6;
  return result;
}

uint64_t __68__SBUIController_setHomeScreenDimmingAlpha_behaviorMode_completion___block_invoke(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) == 0)
  {
    uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 40);
    [*(id *)(a1 + 40) alpha];
    [v4 setHidden:BSFloatIsZero()];
  }
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    double v6 = *(uint64_t (**)(void))(result + 16);
    return v6();
  }
  return result;
}

- (void)updateBatteryState:(id)a3
{
  uint64_t v92 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = *((unsigned char *)self + 80);
  int v6 = *((unsigned __int8 *)self + 81);
  double v7 = +[SBDefaults localDefaults];
  double v8 = [v7 powerDefaults];
  __hideACPower = [v8 hideACPower];

  double v9 = [v4 objectForKey:@"CurrentCapacity"];
  LODWORD(v7) = [v9 intValue];

  id v10 = [v4 objectForKey:@"MaxCapacity"];
  int v11 = [v10 intValue];

  float v12 = fmax(fmin((float)((float)(int)v7 / (float)v11), 1.0), 0.0);
  self->_batteryCapacitCGFloat y = v12;
  id v13 = [v4 objectForKey:@"Voltage"];
  unsigned int v71 = [v13 intValue];

  if (__hideACPower)
  {
    *((unsigned char *)self + 80) &= ~0x10u;
  }
  else
  {
    id v14 = [v4 objectForKey:@"ExternalConnected"];
    if ([v14 BOOLValue]) {
      char v15 = 16;
    }
    else {
      char v15 = 0;
    }
    *((unsigned char *)self + 80) = *((unsigned char *)self + 80) & 0xEF | v15;
  }
  CGFloat v16 = [v4 objectForKey:@"FullyCharged"];
  if ([v16 BOOLValue])
  {
    char v17 = *((unsigned char *)self + 80);
  }
  else
  {
    char v17 = *((unsigned char *)self + 80);
    if (self->_batteryCapacity <= 0.999)
    {
      char v18 = 0;
      goto LABEL_12;
    }
  }
  char v18 = 4;
LABEL_12:
  *((unsigned char *)self + 80) = v17 & 0xFB | v18;

  if (__hideACPower || (*((unsigned char *)self + 80) & 4) != 0)
  {
    *((unsigned char *)self + 80) &= ~2u;
  }
  else
  {
    CGSize v19 = [v4 objectForKey:@"IsCharging"];
    if ([v19 BOOLValue]) {
      char v20 = 2;
    }
    else {
      char v20 = 0;
    }
    *((unsigned char *)self + 80) = *((unsigned char *)self + 80) & 0xFD | v20;
  }
  uint64_t v78 = 0;
  CGFloat v79 = &v78;
  uint64_t v80 = 0x2020000000;
  char v81 = 0;
  v77[0] = MEMORY[0x1E4F143A8];
  v77[1] = 3221225472;
  v77[2] = __37__SBUIController_updateBatteryState___block_invoke;
  v77[3] = &unk_1E6AF56B0;
  v77[4] = &v78;
  if (updateBatteryState__onceToken != -1) {
    dispatch_once(&updateBatteryState__onceToken, v77);
  }
  CGRectEdge v21 = [v4 objectForKey:@"ExternalConnected"];
  if ([v21 BOOLValue])
  {
    BOOL v22 = 0;
  }
  else
  {
    double v23 = [v4 objectForKey:@"ExternalChargeCapable"];
    if ([v23 BOOLValue])
    {
      BOOL v22 = 0;
    }
    else
    {
      double v24 = [v4 objectForKey:@"AdapterInfo"];
      BOOL v22 = [v24 intValue] == -536870201;
    }
  }

  if ((BKSDisplayServicesDisplayIsTethered() & 1) == 0) {
    [(SBUIController *)self setIsConnectedToUnsupportedChargingAccessory:v22];
  }
  if ((*((unsigned char *)self + 80) & 0x10) != 0)
  {
    double v26 = [v4 objectForKey:@"ExternalChargeCapable"];
    *((unsigned char *)self + 81) = *((unsigned char *)self + 81) & 0xFE | [v26 BOOLValue] ^ 1;

    int v25 = *((unsigned __int8 *)self + 81);
  }
  else
  {
    int v25 = *((unsigned char *)self + 81) & 0xFE;
    *((unsigned char *)self + 81) = v25;
  }
  if ((v25 ^ v6))
  {
    CGRect v27 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v27 postNotificationName:@"SBUIBatteryNotChargingStatusChangedNotification" object:0 userInfo:0];
  }
  double v28 = [v4 objectForKey:@"AdapterDetails"];
  CGRect v29 = [v28 objectForKey:@"FamilyCode"];
  int v30 = [v29 intValue];
  char v31 = *((unsigned char *)self + 136);
  *((unsigned char *)self + 136) = v31 & 0xFE | (v30 == -536723453);
  if ((v30 == -536723453) == ((v31 & 1) == 0))
  {
    int v32 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v32 postNotificationName:@"SBUIQiPowerStatusChangedNotification" object:0 userInfo:0];
  }
  if (v30 == -536723448 || v30 == -536723450) {
    char v34 = 4;
  }
  else {
    char v34 = 0;
  }
  *((unsigned char *)self + 81) = v34 | (8 * (v30 == -536723449)) | *((unsigned char *)self + 81) & 0xF3;
  if (v30 == -536723449 || v30 == -536723448 || v30 == -536723450) {
    kdebug_trace();
  }
  if ((*((unsigned char *)self + 81) & 4) != 0)
  {
    double v36 = [v28 objectForKey:@"Source"];
    connectedWirelessChargerId = self->_connectedWirelessChargerId;
    self->_connectedWirelessChargerId = v36;
  }
  else
  {
    connectedWirelessChargerId = self->_connectedWirelessChargerId;
    self->_connectedWirelessChargerId = 0;
  }

  unsigned int v37 = *((unsigned __int8 *)self + 80);
  int v38 = (v37 >> 4) & 1;
  if (v38 != (v5 & 0x10) >> 4)
  {
    int v39 = 0;
    if ((v5 & 0x10) != 0 && (v6 & 8) != 0) {
      int v39 = (*((unsigned __int8 *)self + 81) >> 3) & 1;
    }
    SBWorkspaceLogUsage(v38);
    BOOL v40 = [(SBUIController *)self _isConnectedToWirelessCharging];
    int64_t v41 = +[SBBacklightController sharedInstance];
    int v42 = [v41 screenIsOn];

    id v43 = SBLogCharging();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      int v44 = (*((unsigned __int8 *)self + 80) >> 4) & 1;
      int v45 = (*((unsigned __int8 *)self + 81) >> 1) & 1;
      *(_DWORD *)buf = 67110144;
      int v83 = v44;
      __int16 v84 = 1024;
      int v85 = (v5 & 0x10) >> 4;
      __int16 v86 = 1024;
      BOOL v87 = v40;
      __int16 v88 = 1024;
      int v89 = v45;
      __int16 v90 = 1024;
      int v91 = v42;
      _os_log_impl(&dword_1D85BA000, v43, OS_LOG_TYPE_DEFAULT, "AC status changed (isOnAC: %{BOOL}u, wasOnAC: %{BOOL}u, isConnectedToWirelessCharging: %{BOOL}u, wasConnectedToWirelessCharging: %{BOOL}u, isScreenOn: %{BOOL}u) ䷼", buf, 0x20u);
    }

    int v46 = (*((unsigned char *)self + 81) & 2) == 0 || v40;
    if ((v46 | v42))
    {
      if (((!v40 | ((*((unsigned char *)self + 81) & 2) >> 1)) & 1) == 0)
      {
        double v47 = SBLogCharging();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D85BA000, v47, OS_LOG_TYPE_DEFAULT, "Connected to wireless charging accessory", buf, 2u);
        }

        [(SBFMotionAlarmController *)self->_motionAlarmController unregisterMotionAlarm];
        [(SBUIController *)self _cancelDebounceWirelessChargingTimer];
      }
    }
    else
    {
      double v48 = SBLogCharging();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D85BA000, v48, OS_LOG_TYPE_DEFAULT, "Wireless charging disconnection detected when screen was off", buf, 2u);
      }

      double v49 = [MEMORY[0x1E4F5E408] rootSettings];
      double v50 = [v49 chargingSettings];

      [v50 wirelessChargingDebounceDurationInSeconds];
      -[SBUIController _disableWirelessChargingChimeAndScreenWakeForDuration:](self, "_disableWirelessChargingChimeAndScreenWakeForDuration:");
    }
    if (v40) {
      char v51 = 2;
    }
    else {
      char v51 = 0;
    }
    *((unsigned char *)self + 81) = *((unsigned char *)self + 81) & 0xFD | v51;
    double v52 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v52 postNotificationName:@"SBUIACStatusChangedNotification" object:0 userInfo:v4];

    if (v39) {
      [(SBUIController *)self _disableWirelessChargingChimeAndScreenWakeForDuration:0 withMotionAlarm:0.1];
    }
    [(SBUIController *)self ACPowerChanged];
    unsigned int v37 = *((unsigned __int8 *)self + 80);
  }
  double v53 = [v4 objectForKey:@"AtCriticalLevel"];
  double v54 = (char *)self + 80;
  if ([v53 BOOLValue]) {
    char v55 = 8;
  }
  else {
    char v55 = 0;
  }
  *double v54 = *((unsigned char *)self + 80) & 0xF7 | v55;

  int v56 = (*v54 >> 3) & 1;
  if (v56 != ((v37 >> 3) & 1))
  {
    if (v56)
    {
      double v58 = SBLogCharging();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR)) {
        -[SBUIController updateBatteryState:](v58, v59, v60, v61, v62, v63, v64, v65);
      }

      uint64_t v66 = [(SBUIController *)self batteryCapacityAsPercentage];
      v76[0] = MEMORY[0x1E4F143A8];
      v76[1] = 3221225472;
      v76[2] = __37__SBUIController_updateBatteryState___block_invoke_260;
      v76[3] = &unk_1E6AF4AC0;
      v76[4] = self;
      +[SBBatteryLogger saveLowBatteryLogWithCapacity:v66 voltage:v71 completion:v76];
    }
    else
    {
      double v57 = SBLogCharging();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D85BA000, v57, OS_LOG_TYPE_DEFAULT, "Battery is no longer at critical level", buf, 2u);
      }
    }
  }
  double v67 = [v4 objectForKey:@"CapacityEstimated"];
  v68 = v67;
  if ((*((unsigned char *)self + 80) & 8) == 0 && (!v67 || ([v67 BOOLValue] & 1) == 0)) {
    +[SBLowPowerAlertItem setBatteryLevel:[(SBUIController *)self batteryCapacityAsPercentage]];
  }
  int v69 = [(SBUIController *)self batteryCapacityAsPercentage];
  if (updateBatteryState___prevIsFullyCharged != v69 > 89)
  {
    updateBatteryState___prevIsFullyCharged = v69 > 89;
    if (updateBatteryState__fullPowerToken != -1)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __37__SBUIController_updateBatteryState___block_invoke_268;
      block[3] = &__block_descriptor_33_e5_v8__0l;
      BOOL v75 = v69 > 89;
      dispatch_async((dispatch_queue_t)updateBatteryState__notificationQueue, block);
    }
  }
  if (v69 < 90)
  {
    if ((*((unsigned char *)self + 80) & 0x12) != 0 && (v5 & 0x10) == 0 && (v5 & 2) == 0)
    {
      _SBWorkspaceStartUsageTimesIfNecessary();
      _SBWorkspaceSetHavePartiallyCharged(1);
      goto LABEL_100;
    }
LABEL_99:
    _SBWorkspaceStartUsageTimesIfNecessary();
    goto LABEL_100;
  }
  if ((*((unsigned char *)self + 80) & 0x12) == 0)
  {
    if ((v5 & 0x12) != 0)
    {
      self->_batteryLoggingStartCapacitCGFloat y = [(SBUIController *)self batteryCapacityAsPercentage];
      _SBWorkspaceResetBatteryUsageTimes();
    }
    goto LABEL_99;
  }
  _SBWorkspaceResetBatteryUsageTimes();
LABEL_100:
  int v70 = (*((unsigned char *)self + 80) & 0x12) != 0;
  if (updateBatteryState___prevIsPluggedIn != v70 || *((unsigned char *)v79 + 24))
  {
    kdebug_trace();
    updateBatteryState___prevIsPluggedIn = v70;
    if (updateBatteryState__pluggedInToken != -1)
    {
      v72[0] = MEMORY[0x1E4F143A8];
      v72[1] = 3221225472;
      v72[2] = __37__SBUIController_updateBatteryState___block_invoke_2_270;
      v72[3] = &__block_descriptor_33_e5_v8__0l;
      char v73 = v70;
      dispatch_async((dispatch_queue_t)updateBatteryState__notificationQueue, v72);
    }
  }

  _Block_object_dispose(&v78, 8);
}

- (int)batteryCapacityAsPercentage
{
  return (int)fminf(ceilf(self->_batteryCapacity * 100.0), 100.0);
}

- (void)setIsConnectedToUnsupportedChargingAccessory:(BOOL)a3
{
  v22[1] = *MEMORY[0x1E4F143B8];
  unsigned int v3 = *((unsigned __int8 *)self + 80);
  if (a3 != v3 >> 7)
  {
    if (a3) {
      char v5 = 0x80;
    }
    else {
      char v5 = 0;
    }
    *((unsigned char *)self + 80) = v5 & 0x80 | v3 & 0x7F;
    int IsSystemBootComplete = SBWorkspaceIsSystemBootComplete();
    int v7 = *((char *)self + 80);
    if (IsSystemBootComplete)
    {
      if (v7 < 0)
      {
        double v8 = +[SBLockScreenManager sharedInstance];
        if ([v8 isUILocked])
        {
          CGRectEdge v21 = @"SBUIUnlockOptionsTurnOnScreenFirstKey";
          double v9 = [NSNumber numberWithBool:1];
          v22[0] = v9;
          id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
          [v8 unlockUIFromSource:21 withOptions:v10];
        }
        else
        {
          id v13 = +[SBIdleTimerGlobalCoordinator sharedInstance];
          [v13 resetIdleTimerForReason:@"SBUIConnectToUnsupportedChargingAccessory"];

          id v14 = [SBDismissOnlyAlertItem alloc];
          char v15 = [MEMORY[0x1E4F28B50] mainBundle];
          CGFloat v16 = [v15 localizedStringForKey:@"UNSUPPORTED_CHARGING_ACCESSORY" value:&stru_1F3084718 table:@"SpringBoard"];
          char v17 = [(SBDismissOnlyAlertItem *)v14 initWithTitle:v16 body:0];
          unsupportedChargerAlert = self->_unsupportedChargerAlert;
          self->_unsupportedChargerAlert = v17;

          CGSize v19 = +[SBAlertItemsController sharedInstance];
          [v19 activateAlertItem:self->_unsupportedChargerAlert];
        }
        goto LABEL_14;
      }
    }
    else if (v7 < 0)
    {
LABEL_14:
      char v20 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v20 postNotificationName:@"SBUIUnsupportedChargingAccessoryStatusChangedNotification" object:0];

      return;
    }
    if (self->_unsupportedChargerAlert)
    {
      int v11 = +[SBAlertItemsController sharedInstance];
      [v11 deactivateAlertItem:self->_unsupportedChargerAlert];

      float v12 = self->_unsupportedChargerAlert;
      self->_unsupportedChargerAlert = 0;
    }
    goto LABEL_14;
  }
}

- (BOOL)isBatteryCharging
{
  return (*((unsigned __int8 *)self + 80) >> 1) & 1;
}

- (void)connectedDevicesDidChange:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v18;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v18 != v7) {
        objc_enumerationMutation(v4);
      }
      double v9 = *(void **)(*((void *)&v17 + 1) + 8 * v8);
      if ((objc_msgSend(v9, "isInternal", (void)v17) & 1) == 0)
      {
        if ([v9 isPowerSource]) {
          break;
        }
      }
      if (v6 == ++v8)
      {
        uint64_t v6 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_10;
      }
    }
    if ([v9 percentCharge]) {
      int v11 = 1;
    }
    else {
      int v11 = [v9 isCharging];
    }

    id v10 = (char *)self + 80;
    if ((*((unsigned char *)self + 80) & 0x20) == 0)
    {
      int v12 = 1;
      kdebug_trace();
      char v13 = 32;
      goto LABEL_20;
    }
    int v12 = 0;
    int v14 = 1;
LABEL_23:
    if (((v11 ^ ((*v10 & 0x40) == 0)) & 1) == 0)
    {
      kdebug_trace();
      char v16 = v11 ? 64 : 0;
      unsigned char *v10 = *v10 & 0xBF | v16;
      if (((v14 | v12) & 1) == 0) {
        goto LABEL_28;
      }
    }
    goto LABEL_29;
  }
LABEL_10:

  id v10 = (char *)self + 80;
  if ((*((unsigned char *)self + 80) & 0x20) != 0)
  {
    kdebug_trace();
    int v11 = 0;
    int v12 = 0;
    char v13 = 0;
LABEL_20:
    unsigned char *v10 = *v10 & 0xDF | v13;
    char v15 = objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", (void)v17);
    [v15 postNotificationName:@"SBUIExternalChargeAccessoryConnectedStatusChangedNotification" object:0];

    if (v12)
    {
      [(SBUIController *)self possiblyWakeForPowerStatusChangeWithUnlockSource:22];
      int v14 = 1;
      int v12 = 1;
    }
    else
    {
      int v14 = 0;
    }
    goto LABEL_23;
  }
  if ((*((unsigned char *)self + 80) & 0x40) != 0)
  {
    kdebug_trace();
    *v10 &= ~0x40u;
LABEL_28:
    -[SBUIController possiblyWakeForPowerStatusChangeWithUnlockSource:](self, "possiblyWakeForPowerStatusChangeWithUnlockSource:", 22, (void)v17);
  }
LABEL_29:
}

- (void)playChargingChimeIfAppropriate
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  unsigned int v3 = [(id)SBApp restartManager];
  id v4 = [v3 startupTransition];
  uint64_t v5 = [v4 context];

  if (v3)
  {
    uint64_t v6 = [v5 overlay];
    if (v6) {
      int v7 = 0;
    }
    else {
      int v7 = [v5 isDark] ^ 1;
    }
  }
  else
  {
    int v7 = 0;
  }
  BOOL v8 = [(SBUIController *)self _powerSourceWantsToPlayChime];
  int v9 = [(SBUIController *)self chargingChimeEnabled] & v7 & v8;
  id v10 = SBLogCharging();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v15[0] = 67109632;
    v15[1] = v9;
    __int16 v16 = 1024;
    BOOL v17 = [(SBUIController *)self chargingChimeEnabled];
    __int16 v18 = 1024;
    BOOL v19 = v8;
    _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_DEFAULT, "Should chime: %{BOOL}u, charging enabled: %{BOOL}u, _powerSourceWantsToPlayChime: %{BOOL}u", (uint8_t *)v15, 0x14u);
  }

  [(SBUIController *)self chargingChimeEnabled];
  kdebug_trace();
  if (v9)
  {
    int v11 = [MEMORY[0x1E4FA79C8] soundWithFeedbackEventType:1003];
    if ((*((unsigned char *)self + 81) & 0xC) != 0)
    {
      int v12 = SBLogAccessory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v15[0]) = 0;
        _os_log_impl(&dword_1D85BA000, v12, OS_LOG_TYPE_DEFAULT, "Play chime for internal charging accessory", (uint8_t *)v15, 2u);
      }

      uint64_t v13 = [MEMORY[0x1E4FA79C8] soundWithFeedbackEventType:1020];

      int v11 = (void *)v13;
    }
    int v14 = +[SBSoundController sharedInstance];
    [v14 playSoundWithDefaultEnvironment:v11];
  }
}

- (BOOL)chargingChimeEnabled
{
  return self->_chargingChimeEnabled;
}

unsigned char *__22__SBUIController_init__block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  int v2 = [*(id *)(a1 + 32) _isConnectedToWirelessCharging];
  unsigned int v3 = SBLogCharging();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v5 = *(unsigned __int8 *)(v4 + 280);
    LODWORD(v4) = (*(unsigned __int8 *)(v4 + 80) >> 4) & 1;
    v7[0] = 67109632;
    v7[1] = v5;
    __int16 v8 = 1024;
    int v9 = v4;
    __int16 v10 = 1024;
    int v11 = v2;
    _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "isChimeDisabled: %{BOOL}u, isOnAC: %{BOOL}u, isConnectedToWirelessCharging: %{BOOL}u", (uint8_t *)v7, 0x14u);
  }

  uint64_t result = *(unsigned char **)(a1 + 32);
  if (!result[280]) {
    return (unsigned char *)[result playChargingChimeIfAppropriate];
  }
  if (v2) {
    return (unsigned char *)[result _resetWirelessChargingState];
  }
  return result;
}

- (BOOL)_powerSourceWantsToPlayChime
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __46__SBUIController__powerSourceWantsToPlayChime__block_invoke;
  v4[3] = &unk_1E6AF56F8;
  v4[4] = self;
  v4[5] = &v5;
  [(SBUIController *)self _enumeratePowerSourcesWithBlock:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (BOOL)_isConnectedToWirelessCharging
{
  if ((*((unsigned char *)self + 81) & 0xC) != 0) {
    return 1;
  }
  else {
    return *((unsigned char *)self + 136) & 1;
  }
}

- (void)_enumeratePowerSourcesWithBlock:(id)a3
{
  uint64_t v12 = (void (**)(id, CFDictionaryRef))a3;
  unsigned int v3 = (const void *)IOPSCopyPowerSourcesByType();
  if (v3)
  {
    uint64_t v4 = v3;
    CFArrayRef v5 = IOPSCopyPowerSourcesList(v3);
    if (v5)
    {
      CFArrayRef v6 = v5;
      CFIndex Count = CFArrayGetCount(v5);
      if (Count >= 1)
      {
        CFIndex v8 = Count;
        for (CFIndex i = 0; i != v8; ++i)
        {
          ValueAtIndeCGFloat x = CFArrayGetValueAtIndex(v6, i);
          CFDictionaryRef v11 = IOPSGetPowerSourceDescription(v4, ValueAtIndex);
          v12[2](v12, v11);
        }
      }
      CFRelease(v4);
    }
    else
    {
      CFArrayRef v6 = (const __CFArray *)v4;
    }
    CFRelease(v6);
  }
}

- (void)dealloc
{
  unsigned int v3 = [MEMORY[0x1E4FA5F38] rootSettings];
  [v3 removeKeyObserver:self];

  uint64_t v4 = +[SBWallpaperController sharedInstance];
  [v4 removeObserver:self forVariant:1];

  CFArrayRef v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 removeObserver:self];

  CFArrayRef v6 = +[SBReachabilityManager sharedInstance];
  [v6 removeObserver:self];

  uint64_t v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v7 removeObserver:self name:*MEMORY[0x1E4F436D8] object:0];
  [v7 removeObserver:self name:*MEMORY[0x1E4F43478] object:0];
  [v7 removeObserver:self name:*MEMORY[0x1E4F43480] object:0];
  notify_cancel(self->_powerStateUpdateToken);
  notify_cancel(self->_firmwareUpdateStateToken);
  [(BSAbsoluteMachTimer *)self->_accessoryAttachmentAnimationBlockingTimer invalidate];

  v8.receiver = self;
  v8.super_class = (Class)SBUIController;
  [(SBUIController *)&v8 dealloc];
}

- (SBUIController)init
{
  v56.receiver = self;
  v56.super_class = (Class)SBUIController;
  char v2 = [(SBUIController *)&v56 init];
  if (v2)
  {
    v2->_supportsDetailedBatteryCapacitCGFloat y = MGGetBoolAnswer();
    char v51 = +[SBApplicationController sharedInstance];
    unsigned int v3 = [v51 restrictionController];
    [v3 beginPostingChanges];

    double v50 = [(id)SBApp windowSceneManager];
    double v49 = [v50 connectedWindowScenes];
    uint64_t v4 = objc_msgSend(v49, "bs_firstObjectPassingTest:", &__block_literal_global_9);
    CFArrayRef v5 = [(id)SBApp userSessionController];
    int v6 = [v5 isLoginSession];

    if (v6)
    {
      uint64_t v7 = 0;
    }
    else
    {
      uint64_t v7 = [[SBIconController alloc] initWithMainDisplayWindowScene:v4];
      objc_storeStrong((id *)&v2->_iconController, v7);
    }
    objc_super v8 = [MEMORY[0x1E4F42948] currentDevice];
    [v8 setBatteryMonitoringEnabled:1];

    if ((SBFIsOnenessHomeScreenOnEmbeddedAvailable() & 1) == 0)
    {
      if (v6)
      {
        int v9 = [[SBHomeScreenViewController alloc] initWithWindowScene:v4 iconController:0 iconManager:0 userInterfaceController:v2];
      }
      else
      {
        int v9 = [(SBIconController *)v7 homeScreenViewController];
        uint64_t v10 = [(SBHomeScreenViewController *)v9 iconContentView];
        iconsView = v2->_iconsView;
        v2->_iconsView = (UIView *)v10;
      }
      uint64_t v12 = [(SBHomeScreenViewController *)v9 view];
      contentView = v2->_contentView;
      v2->_contentView = (UIView *)v12;

      int v14 = [(SBWindow *)[SBHomeScreenWindow alloc] initWithWindowScene:v4 rootViewController:v9 role:@"SBTraitsParticipantRoleHomeScreen" debugName:@"HomeScreen"];
      window = v2->_window;
      v2->_window = v14;

      [(SBHomeScreenWindow *)v2->_window setOpaque:0];
      [(SBHomeScreenWindow *)v2->_window setWindowLevel:*MEMORY[0x1E4F43F20] + -2.0];
      [(SBWindow *)v2->_window makeKeyAndVisible];
      __int16 v16 = [v4 statusBarManager];
      BOOL v17 = [v16 layoutManager];
      [v17 setOrientationWindow:v2->_window forStatusBarLayoutLayer:0];
      uint64_t v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithObjects:", @"SBUIHomeScreenActiveContentRequirementReason", 0);
      contentRequiringReasons = v2->_contentRequiringReasons;
      v2->_contentRequiringReasons = (NSMutableSet *)v18;

      [(SBUIController *)v2 _setupHomeScreenContentBackdropView];
      [(SBUIController *)v2 _setupHomeScreenDimmingWindow];
    }
    uint64_t v20 = +[SBAppSwitcherDomain rootSettings];
    switcherSettings = v2->_switcherSettings;
    v2->_switcherSettings = (SBAppSwitcherSettings *)v20;

    [(PTSettings *)v2->_switcherSettings addKeyObserver:v2];
    uint64_t v22 = (BCBatteryDeviceController *)objc_alloc_init(MEMORY[0x1E4F4F9D0]);
    batteryDeviceController = v2->_batteryDeviceController;
    v2->_batteryDeviceController = v22;

    double v24 = MEMORY[0x1E4F14428];
    [(BCBatteryDeviceController *)v2->_batteryDeviceController addBatteryDeviceObserver:v2 queue:MEMORY[0x1E4F14428]];
    int v25 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v25 addObserver:v2 selector:sel_noteStatusBarHeightChanged_ name:*MEMORY[0x1E4F436D8] object:0];
    [v25 addObserver:v2 selector:sel__reduceMotionStatusDidChange_ name:*MEMORY[0x1E4F43478] object:0];
    [v25 addObserver:v2 selector:sel__backgroundContrastDidChange_ name:*MEMORY[0x1E4F43480] object:0];
    [v25 addObserver:v2 selector:sel__deviceUILocked name:@"SBLockScreenUIDidLockNotification" object:0];
    [v25 addObserver:v2 selector:sel__preferredContentSizeDidChange_ name:*MEMORY[0x1E4F43788] object:0];
    v2->_chargingChimeEnabled = 1;
    double v26 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    powerSourceHasChimed = v2->_powerSourceHasChimed;
    v2->_powerSourceHasChimed = v26;

    v2->_powerStateUpdateToken = -1;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __22__SBUIController_init__block_invoke_2;
    handler[3] = &unk_1E6AF5558;
    double v28 = v2;
    char v55 = v28;
    notify_register_dispatch("com.apple.system.powersources.timeremaining", &v2->_powerStateUpdateToken, v24, handler);

    v28[63] = -1;
    v52[0] = MEMORY[0x1E4F143A8];
    v52[1] = 3221225472;
    v52[2] = __22__SBUIController_init__block_invoke_151;
    v52[3] = &unk_1E6AF5558;
    CGRect v29 = v28;
    double v53 = v29;
    notify_register_dispatch("com.apple.accessoryUpdater.uarp.firmareUpdateApplied", v28 + 63, v24, v52);

    int v30 = +[SBModelessSyncController sharedInstance];
    [v30 beginMonitoring];

    char v31 = [MEMORY[0x1E4FA5F38] rootSettings];
    [v31 addKeyObserver:v29];

    int v32 = +[SBWallpaperController sharedInstance];
    [v32 setWindowScene:v4];
    [v32 addObserver:v29 forVariant:1];
    [v32 setOrientationProvider:v29 forSource:2];
    [v32 activateOrientationSource:2];
    [v29 _updateLegibility];
    [MEMORY[0x1E4FA61E8] warmupIfNecessary];
    [MEMORY[0x1E4FA61B8] warmupIfNecessary];
    uint64_t v33 = [(id)SBApp volumeControl];
    char v34 = (void *)*((void *)v29 + 19);
    *((void *)v29 + 19) = v33;

    uint64_t v35 = [(id)SBApp HUDController];
    double v36 = (void *)*((void *)v29 + 18);
    *((void *)v29 + 18) = v35;

    if (SBFEffectiveHomeButtonType() == 1)
    {
      id v37 = objc_alloc_init(MEMORY[0x1E4F42A48]);
      int v38 = (void *)*((void *)v29 + 8);
      *((void *)v29 + 8) = v37;

      [*((id *)v29 + 8) addProgressObserver:v29];
    }
    int v39 = +[SBReachabilityManager sharedInstance];
    [v39 addObserver:v29];

    BOOL v40 = (void *)*((void *)v29 + 38);
    *((void *)v29 + 38) = 0;

    int64_t v41 = (void *)*((void *)v29 + 39);
    *((void *)v29 + 39) = 0;

    uint64_t v42 = objc_opt_new();
    id v43 = (void *)*((void *)v29 + 34);
    *((void *)v29 + 34) = v42;

    [*((id *)v29 + 34) setDelegate:v29];
    int v44 = [MEMORY[0x1E4F5E408] rootSettings];
    int v45 = [v44 chargingSettings];

    [v45 accessoryAnimationBlockingDurationAfterBootInSeconds];
    objc_msgSend(v29, "_setAccessoryAttachmentAnimationBlockingTimerWithDuration:");
    uint64_t v46 = +[SBAccessoryConnectionInfoProvider sharedInstance];
    double v47 = (void *)*((void *)v29 + 32);
    *((void *)v29 + 32) = v46;

    [*((id *)v29 + 32) addObserver:v29];
  }
  return v2;
}

uint64_t __22__SBUIController_init__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isMainDisplayWindowScene];
}

void __22__SBUIController_init__block_invoke_151(uint64_t a1)
{
  *(void *)&v10[5] = *MEMORY[0x1E4F143B8];
  char v2 = SBLogCharging();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v3 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 81);
    int v9 = 67109376;
    v10[0] = (v3 >> 3) & 1;
    LOWORD(v10[1]) = 1024;
    *(_DWORD *)((char *)&v10[1] + 2) = (v3 >> 2) & 1;
    _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_DEFAULT, "kUarpFirmwareUpdateAppliedNotification is received when _isConnectedToWirelessInternalChargingAccessory: %{BOOL}u, _isConnectedToWirelessInternalCharger: %{BOOL}u", (uint8_t *)&v9, 0xEu);
  }

  if ((*(unsigned char *)(*(void *)(a1 + 32) + 81) & 0xC) != 0)
  {
    uint64_t v4 = [MEMORY[0x1E4F5E408] rootSettings];
    CFArrayRef v5 = [v4 chargingSettings];

    [v5 wirelessChargingFirmwareUpdateDebounceDurationInSeconds];
    double v7 = v6;
    objc_super v8 = SBLogCharging();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 134217984;
      *(double *)uint64_t v10 = v7;
      _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "Disabling chime and screen wake for %f seconds", (uint8_t *)&v9, 0xCu);
    }

    [*(id *)(a1 + 32) _disableWirelessChargingChimeAndScreenWakeForDuration:v7];
  }
}

- (void)setWindowScene:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_windowScene, obj);
    [(SBHomeScreenWindow *)self->_window setWindowScene:obj];
    [(SBWindow *)self->_homeScreenDimmingWindow setWindowScene:obj];
    CFArrayRef v5 = +[SBWallpaperController sharedInstance];
    double v6 = [(SBUIController *)self windowScene];
    [v5 setWindowScene:v6];

    double v7 = [obj statusBarManager];
    objc_super v8 = [v7 layoutManager];

    [v8 setOrientationWindow:self->_window forStatusBarLayoutLayer:0];
  }
}

- (void)_willRevealOrHideContentView
{
  id v3 = [(SBUIController *)self iconController];
  char v2 = [v3 iconManager];
  [v2 cancelAllFolderScrolling];
}

- (void)_setupHomeScreenDimmingWindow
{
  id v10 = objc_alloc_init(MEMORY[0x1E4F42FF8]);
  id v3 = [v10 view];
  uint64_t v4 = [MEMORY[0x1E4F428B8] blackColor];
  [v3 setBackgroundColor:v4];

  CFArrayRef v5 = [v10 view];
  [v5 setAlpha:0.0];

  double v6 = [SBWindow alloc];
  double v7 = [(SBUIController *)self windowScene];
  objc_super v8 = [(SBWindow *)v6 initWithWindowScene:v7 rootViewController:v10 role:@"SBTraitsParticipantRoleHomeScreenDimming" debugName:@"HomeScreenDimming"];
  homeScreenDimmingWindow = self->_homeScreenDimmingWindow;
  self->_homeScreenDimmingWindow = v8;

  [(SBWindow *)self->_homeScreenDimmingWindow setWindowLevel:*MEMORY[0x1E4F43F20] + -2.0 + 1.0];
  [(SBWindow *)self->_homeScreenDimmingWindow bs_setHitTestingDisabled:1];
}

- (void)_setupHomeScreenContentBackdropView
{
  BOOL IsReduceTransparencyEnabled = UIAccessibilityIsReduceTransparencyEnabled();
  uint64_t v4 = off_1E6AEEA48;
  if (!IsReduceTransparencyEnabled) {
    uint64_t v4 = off_1E6AEEA50;
  }
  id v5 = objc_alloc(*v4);
  [(UIView *)self->_contentView bounds];
  double v6 = (SBHomeScreenBackdropViewBase *)objc_msgSend(v5, "initWithFrame:");
  homeScreenBackdropView = self->_homeScreenBackdropView;
  self->_homeScreenBackdropView = v6;

  [(SBHomeScreenBackdropViewBase *)self->_homeScreenBackdropView setAutoresizingMask:18];
  [(SBHomeScreenBackdropViewBase *)self->_homeScreenBackdropView bs_setHitTestingDisabled:1];
  [(SBHomeScreenBackdropViewBase *)self->_homeScreenBackdropView setDelegate:self];
  contentView = self->_contentView;
  int v9 = self->_homeScreenBackdropView;
  [(UIView *)contentView addSubview:v9];
}

- (void)setLockScreenScale:(double)a3 withDuration:(double)a4 behaviorMode:(int64_t)a5 completion:(id)a6
{
  int v9 = (void *)MEMORY[0x1E4F42FF0];
  switcherSettings = self->_switcherSettings;
  id v11 = a6;
  uint64_t v12 = [(SBAppSwitcherSettings *)switcherSettings animationSettings];
  uint64_t v13 = [v12 homeScreenScaleSettings];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __74__SBUIController_setLockScreenScale_withDuration_behaviorMode_completion___block_invoke;
  v14[3] = &__block_descriptor_48_e5_v8__0l;
  *(double *)&v14[4] = a3;
  *(double *)&v14[5] = a4;
  objc_msgSend(v9, "sb_animateWithSettings:mode:animations:completion:", v13, a5, v14, v11);
}

void __74__SBUIController_setLockScreenScale_withDuration_behaviorMode_completion___block_invoke(uint64_t a1)
{
  id v4 = +[SBLockScreenManager sharedInstance];
  char v2 = [v4 lockScreenEnvironment];
  id v3 = [v2 spotlightPresenter];
  [v3 updateScaleViewWithScale:*(double *)(a1 + 32) withDuration:*(double *)(a1 + 40)];
}

- (void)getRotationContentSettings:(id *)a3 forWindow:(id)a4
{
  if (a3) {
    a3->var6 = 0;
  }
}

- (id)workflowClientFromWebClip:(id)a3 appToLaunch:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v22 = 0;
  double v23 = &v22;
  uint64_t v24 = 0x2050000000;
  double v7 = (void *)getWFSpringBoardWebClipMetadataClass_softClass;
  uint64_t v25 = getWFSpringBoardWebClipMetadataClass_softClass;
  if (!getWFSpringBoardWebClipMetadataClass_softClass)
  {
    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    BOOL v19 = __getWFSpringBoardWebClipMetadataClass_block_invoke;
    uint64_t v20 = &unk_1E6AF56B0;
    CGRectEdge v21 = &v22;
    __getWFSpringBoardWebClipMetadataClass_block_invoke((uint64_t)&v17);
    double v7 = (void *)v23[3];
  }
  objc_super v8 = v7;
  _Block_object_dispose(&v22, 8);
  id v9 = [v8 alloc];
  id v10 = [v5 shortcutIdentifier];
  id v11 = [v5 applicationBundleIdentifier];
  uint64_t v12 = (void *)[v9 initWithShortcutIdentifier:v10 applicationIdentifier:v11 appIsInstalled:v6 != 0];

  uint64_t v22 = 0;
  double v23 = &v22;
  uint64_t v24 = 0x2050000000;
  uint64_t v13 = (void *)getWFSpringBoardWorkflowRunnerClientClass_softClass;
  uint64_t v25 = getWFSpringBoardWorkflowRunnerClientClass_softClass;
  if (!getWFSpringBoardWorkflowRunnerClientClass_softClass)
  {
    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    BOOL v19 = __getWFSpringBoardWorkflowRunnerClientClass_block_invoke;
    uint64_t v20 = &unk_1E6AF56B0;
    CGRectEdge v21 = &v22;
    __getWFSpringBoardWorkflowRunnerClientClass_block_invoke((uint64_t)&v17);
    uint64_t v13 = (void *)v23[3];
  }
  int v14 = v13;
  _Block_object_dispose(&v22, 8);
  char v15 = (void *)[[v14 alloc] initWithWebClipMetadata:v12];

  return v15;
}

void __83__SBUIController_activateApplication_fromIcon_location_activationSettings_actions___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([v3 isApplicationSceneEntity] & 1) != 0
    || [v3 isAppClipPlaceholderEntity])
  {
    if ([v3 isApplicationSceneEntity]) {
      (*(void (**)(void))(*(void *)(a1 + 96) + 16))();
    }
    id v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    uint64_t v12 = __83__SBUIController_activateApplication_fromIcon_location_activationSettings_actions___block_invoke_3;
    uint64_t v13 = &unk_1E6AF5420;
    uint64_t v6 = *(void *)(a1 + 48);
    id v14 = *(id *)(a1 + 56);
    id v15 = *(id *)(a1 + 64);
    [v4 _activateWorkspaceEntity:v3 fromIcon:v5 location:v6 validator:&v10];
    double v7 = objc_msgSend(*(id *)(a1 + 72), "bookmark", v10, v11, v12, v13);
    if ([v7 isShortcutsWebClip])
    {
      objc_super v8 = [*(id *)(a1 + 72) bookmark];
      int v9 = [v8 isSingleStepShortcutWebClip];

      if (!v9)
      {
LABEL_9:

        goto LABEL_10;
      }
      double v7 = [*(id *)(a1 + 32) workflowClientFromWebClip:*(void *)(a1 + 80) appToLaunch:*(void *)(a1 + 88)];
      [v7 showSingleStepCompletionWithCompletion:&__block_literal_global_178];
    }

    goto LABEL_9;
  }
LABEL_10:
}

uint64_t __83__SBUIController_activateApplication_fromIcon_location_activationSettings_actions___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 40) layoutStateApplicationSceneHandles];
  uint64_t v2 = BSEqualSets();

  return v2;
}

- (void)_hideKeyboard
{
}

- (void)_closeOpenFolderIfNecessary
{
  id v4 = [(SBUIController *)self iconController];
  uint64_t v2 = [v4 iconManager];
  id v3 = [v2 iconToReveal];
  if (v3 && [v2 hasOpenFolder]) {
    [v2 popToCurrentRootIconList];
  }
}

- (void)restoreContent
{
}

- (void)restoreContentWithOptions:(unint64_t)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = +[SBLockScreenManager sharedInstance];
  int v6 = [v5 isUILocked];
  double v7 = SBLogUIController();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v8 = NSStringFromSBUIControllerRequireContentOptions(a3);
    *(_DWORD *)buf = 138412290;
    uint64_t v33 = v8;
    _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "Attempting restoreContentWithOptions:(%@)", buf, 0xCu);
  }
  if ((a3 & 2) != 0) {
    goto LABEL_10;
  }
  int v9 = [(id)SBApp lockOutController];
  if ([v9 isLockedOut])
  {

    goto LABEL_7;
  }
  uint64_t v10 = [v5 lockScreenEnvironment];
  uint64_t v11 = [v10 callController];
  int v12 = [v11 isMakingEmergencyCall];

  if (!v12)
  {
LABEL_10:
    if (v6) {
      goto LABEL_11;
    }
    id v14 = [(id)SBApp restartManager];
    if ([v14 isPendingExit])
    {
      __int16 v16 = SBLogUIController();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        uint64_t v17 = "abort restoreContentWithOptions: restartManager isPendingExit";
LABEL_37:
        _os_log_impl(&dword_1D85BA000, v16, OS_LOG_TYPE_DEFAULT, v17, buf, 2u);
      }
    }
    else
    {
      iconsView = self->_iconsView;
      if (iconsView && ![(UIView *)iconsView isHidden])
      {
        __int16 v16 = SBLogUIController();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          uint64_t v17 = "abort restoreContentWithOptions: _iconsView is already visible";
          goto LABEL_37;
        }
      }
      else
      {
        BOOL v19 = [(SBHomeScreenBackdropViewBase *)self->_homeScreenBackdropView isOpaque];
        __int16 v16 = SBLogUIController();
        BOOL v20 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
        if (!v19)
        {
          if (v20)
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D85BA000, v16, OS_LOG_TYPE_DEFAULT, "Restoring home screen", buf, 2u);
          }

          BOOL v21 = [(SBUIController *)self isIconListViewTornDown];
          [(SBUIController *)self _willRevealOrHideContentView];
          __int16 v16 = [(SBUIController *)self iconController];
          uint64_t v22 = [v16 homeScreenViewController];
          double v23 = SBLogUIController();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D85BA000, v23, OS_LOG_TYPE_DEFAULT, "Setting _iconsView to visible", buf, 2u);
          }

          [v22 setIconContentHidden:0];
          uint64_t v24 = [(SBWindow *)self->_window traitsParticipant];
          [v24 setNeedsUpdatePreferencesWithReason:@"restore icons" animate:0];

          [(SBUIController *)self _closeOpenFolderIfNecessary];
          [v16 updateNumberOfRowsWithDuration:0.0];
          if ((a3 & 1) == 0) {
            [(SBUIController *)self updateStatusBarLegibilityForWindowScene:0];
          }
          [(SBUIController *)self _switchToHomeScreenWallpaperAnimated:1];
          uint64_t v25 = +[SBWallpaperController sharedInstance];
          [v25 activateOrientationSource:2];

          if (v21)
          {
            double v26 = [(SBUIController *)self window];
            if ((SBTraitsArbiterOrientationActuationEnabledForRole(@"SBTraitsParticipantRoleHomeScreen") & 1) == 0) {
              [v26 _updateInterfaceOrientationFromActiveInterfaceOrientationIfRotationEnabled:0];
            }
            [v26 layoutBelowIfNeeded];
          }
          if ((a3 & 4) != 0)
          {
            CGRect v27 = [(SBUIController *)self iconController];
            double v28 = [v27 iconManager];
            CGRect v29 = [v28 rootFolderController];
            [v29 presentSpotlightAnimated:0 completionHandler:&__block_literal_global_194];
          }
          goto LABEL_38;
        }
        if (v20)
        {
          *(_WORD *)buf = 0;
          uint64_t v17 = "abort restoreContentWithOptions: _homeScreenBackdropView is opaque";
          goto LABEL_37;
        }
      }
    }
LABEL_38:

    goto LABEL_39;
  }
LABEL_7:
  if ((v6 & 1) == 0)
  {
    v30[0] = @"SBUILockOptionsUseScreenOffModeKey";
    v30[1] = @"SBUILockOptionsLockAutomaticallyKey";
    v31[0] = MEMORY[0x1E4F1CC28];
    v31[1] = MEMORY[0x1E4F1CC38];
    v30[2] = @"SBUILockOptionsForceLockKey";
    v31[2] = MEMORY[0x1E4F1CC38];
    uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:3];
    [v5 lockUIFromSource:6 withOptions:v13];

    id v14 = SBLogUIController();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v15 = "abort restoreContentWithOptions: Force lock case";
LABEL_13:
      _os_log_impl(&dword_1D85BA000, v14, OS_LOG_TYPE_DEFAULT, v15, buf, 2u);
      goto LABEL_39;
    }
    goto LABEL_39;
  }
LABEL_11:
  id v14 = SBLogUIController();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    id v15 = "abort restoreContentWithOptions: UI is locked";
    goto LABEL_13;
  }
LABEL_39:
}

- (void)restoreContentAndUnscatterIconsAnimated:(BOOL)a3
{
}

- (void)restoreContentAndUnscatterIconsAnimated:(BOOL)a3 withCompletion:(id)a4
{
}

- (void)restoreContentAndUnscatterIconsAnimated:(BOOL)a3 afterDelay:(double)a4 withCompletion:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  [(SBUIController *)self restoreContent];
  id v10 = [(SBUIController *)self iconController];
  int v9 = [v10 iconManager];
  [v9 unscatterAnimated:v6 afterDelay:v8 withCompletion:a4];
}

- (void)_switchToHomeScreenWallpaperAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v14 = +[SBWallpaperController sharedInstance];
  if ([v14 activeVariant] != 1)
  {
    id v4 = [MEMORY[0x1E4F5E408] rootSettings];
    uint64_t v5 = v4;
    if (v3)
    {
      BOOL v6 = (void *)MEMORY[0x1E4F4F898];
      double v7 = [v4 unlockToPhoneWallpaperOutSettings];
      id v8 = [v7 BSAnimationSettings];
      int v9 = [v6 factoryWithSettings:v8];

      id v10 = (void *)MEMORY[0x1E4F4F898];
      uint64_t v11 = [v5 unlockToPhoneWallpaperInSettings];
      int v12 = [v11 BSAnimationSettings];
      uint64_t v13 = [v10 factoryWithSettings:v12];
    }
    else
    {
      uint64_t v13 = 0;
      int v9 = 0;
    }
    [v14 setWindowLevel:*MEMORY[0x1E4F43F20] + -3.0];
    [v14 setActiveVariant:1 withOutAnimationFactory:v9 inAnimationFactory:v13 completion:0];
  }
}

- (BOOL)hasVisibleAlertItemOrSheet:(BOOL *)a3
{
  id v4 = +[SBAlertItemsController sharedInstance];
  if ([v4 hasVisibleAlert])
  {
    char v5 = 1;
    if (!a3) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  BOOL v6 = [(id)SBApp modalAlertPresentationCoordinator];
  char v5 = [v6 isShowingModalAlert];

  if (a3) {
LABEL_5:
  }
    *a3 = [v4 canDeactivateAlertForMenuClickOrSystemGesture];
LABEL_6:

  return v5;
}

- (BOOL)dissmissAlertItemsAndSheetsIfPossible
{
  uint64_t v2 = +[SBAlertItemsController sharedInstance];
  char v3 = [v2 deactivateAlertForMenuClickOrSystemGestureWithAnimation:1];

  return v3;
}

- (BOOL)disableAppSwitchForcePressDueToHomeButtonForce
{
  return self->_disableAppSwitchForcePressDueToHomeButtonForce;
}

- (BOOL)handleHomeButtonSinglePressUpForWindowScene:(id)a3
{
  return [(SBUIController *)self handleHomeButtonSinglePressUpForWindowScene:a3 withSourceType:0];
}

- (BOOL)handleHomeButtonSinglePressUpForWindowScene:(id)a3 withSourceType:(unint64_t)a4
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if ([v7 isExternalDisplayWindowScene])
  {
    id v8 = [v7 floatingDockController];
    if ([v8 isPresentingFolder])
    {
      [v8 dismissPresentedFolderAnimated:1 completion:0];
LABEL_70:

      goto LABEL_71;
    }
    uint64_t v17 = [v8 floatingDockViewController];
    int v18 = [v17 isPresentingLibrary];

    if (v18)
    {
      BOOL v19 = [v8 floatingDockViewController];
      [v19 dismissLibraryAnimated:1 completion:0];
LABEL_9:

      goto LABEL_70;
    }

    goto LABEL_48;
  }
  int v9 = [v7 switcherController];
  if ([v9 unlockedEnvironmentMode] != 3)
  {

    goto LABEL_11;
  }
  id v10 = [(SBUIController *)self iconController];
  uint64_t v11 = [v10 iconManager];
  uint64_t v12 = *MEMORY[0x1E4FA6690];
  int v13 = [v11 hasOpenFolderInLocation:*MEMORY[0x1E4FA6690]];

  if (!v13)
  {
LABEL_11:
    id v8 = [(id)SBApp menuButtonInterceptApp];
    BOOL v20 = [v8 processState];
    BOOL v21 = v20;
    if (v8
      && [v20 isRunning]
      && (![(id)SBApp menuButtonInterceptAppEnabledForever]
       || SBWorkspaceHasApplicationSceneInLockedOrUnlockedEnvironmentLayoutStateMatchingApplication(v8)))
    {
      uint64_t v22 = SBLogButtonsHome();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        double v23 = NSStringFromSelector(a2);
        uint64_t v24 = [v8 bundleIdentifier];
        *(_DWORD *)buf = 138543618;
        uint64_t v60 = v23;
        __int16 v61 = 2114;
        uint64_t v62 = v24;
        _os_log_impl(&dword_1D85BA000, v22, OS_LOG_TYPE_INFO, "%{public}@ result: intercepting menu button event and forwarding to %{public}@", buf, 0x16u);
      }
      uint64_t v25 = [v8 bundleIdentifier];
      SBSendFakeHomeButtonTapEventToApplication(v25, [v21 pid]);

      if (([(id)SBApp menuButtonInterceptAppEnabledForever] & 1) == 0) {
        [(id)SBApp setMenuButtonInterceptApp:0 forever:0];
      }
LABEL_26:

      goto LABEL_70;
    }

    id v8 = +[SBSetupManager sharedInstance];
    double v26 = +[SBApplicationController sharedInstance];
    BOOL v21 = [v26 setupApplication];

    char v27 = [v8 isInSetupModeReadyToExit];
    if (a4 != 1 || (v27 & 1) == 0)
    {
      if (v21 && SBWorkspaceUnlockedEnvironmentLayoutStateHasMatchingApplication(v21))
      {
        double v28 = SBLogButtonsHome();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          CGRect v29 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138543362;
          uint64_t v60 = v29;
          _os_log_impl(&dword_1D85BA000, v28, OS_LOG_TYPE_INFO, "%{public}@ result: ignoring because setup is active", buf, 0xCu);
        }
        goto LABEL_26;
      }
      if ([v8 isInSetupMode]
        && [v8 updateInSetupMode])
      {
        int v30 = [(id)SBApp authenticationController];
        if ([v30 isAuthenticated])
        {
          char v31 = +[SBWorkspace mainWorkspace];
          int v32 = [v31 transientOverlayPresentationManager];
          char v33 = [v32 hasActivePresentation];

          if ((v33 & 1) == 0)
          {
            uint64_t v34 = SBLogButtonsHome();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
            {
              uint64_t v35 = NSStringFromSelector(a2);
              *(_DWORD *)buf = 138543362;
              uint64_t v60 = v35;
              _os_log_impl(&dword_1D85BA000, v34, OS_LOG_TYPE_INFO, "%{public}@ result: activating setup", buf, 0xCu);
            }
            SBWorkspaceActivateApplication(v21);
            goto LABEL_26;
          }
        }
        else
        {
        }
      }
    }

    double v36 = [(id)SBApp remoteTransientOverlaySessionManager];
    int v37 = [v36 hasSessionWithPendingButtonEvents:1 options:0];

    if (v37)
    {
      int v38 = SBLogButtonsHome();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
      {
        int v39 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138543362;
        uint64_t v60 = v39;
        BOOL v40 = "%{public}@ result: ignoring because a session with a pending lock event exists";
LABEL_54:
        _os_log_impl(&dword_1D85BA000, v38, OS_LOG_TYPE_INFO, v40, buf, 0xCu);
      }
LABEL_55:

LABEL_71:
      char v16 = 1;
      goto LABEL_72;
    }
    int64_t v41 = +[SBWorkspace mainWorkspace];
    id v8 = [v41 transientOverlayPresentationManager];

    if ([v8 hasActivePresentation]
      && [v8 handleHomeButtonPress])
    {
      uint64_t v42 = SBLogButtonsHome();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
      {
        id v43 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138543362;
        uint64_t v60 = v43;
        int v44 = "%{public}@ result: transient overlay handled it";
LABEL_68:
        _os_log_impl(&dword_1D85BA000, v42, OS_LOG_TYPE_INFO, v44, buf, 0xCu);
      }
LABEL_69:

      goto LABEL_70;
    }

    unsigned __int8 v58 = 1;
    if ([(SBUIController *)self hasVisibleAlertItemOrSheet:&v58])
    {
      int v45 = v58;
      id v8 = SBLogButtonsHome();
      BOOL v46 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
      if (!v45)
      {
        if (!v46) {
          goto LABEL_70;
        }
        BOOL v19 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138543362;
        uint64_t v60 = v19;
        _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_INFO, "%{public}@ result: ignoring because an alert item or sheet is showing and can't be dismissed", buf, 0xCu);
        goto LABEL_9;
      }
      if (v46)
      {
        double v47 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138543362;
        uint64_t v60 = v47;
        _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_INFO, "%{public}@ result: ignoring because attempting to dismiss alert items or sheets", buf, 0xCu);
      }
      if ([(SBUIController *)self dissmissAlertItemsAndSheetsIfPossible]) {
        goto LABEL_71;
      }
    }
LABEL_48:
    double v48 = [v7 _fbsDisplayConfiguration];
    int v49 = SBWorkspaceSuspendDisplayWithSource(v48, 20);

    if (v49)
    {
      int v38 = SBLogButtonsHome();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
      {
        int v39 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138543362;
        uint64_t v60 = v39;
        BOOL v40 = "%{public}@ result: suspending display";
        goto LABEL_54;
      }
      goto LABEL_55;
    }
    if ([(SBHomeScreenWindow *)self->_window isRotating])
    {
      int v38 = SBLogButtonsHome();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
      {
        int v39 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138543362;
        uint64_t v60 = v39;
        BOOL v40 = "%{public}@ result: ignoring because we're rotating";
        goto LABEL_54;
      }
      goto LABEL_55;
    }
    double v50 = [v7 homeScreenController];
    id v8 = v50;
    if (!v50
      || ([v50 iconManager],
          char v51 = objc_claimAutoreleasedReturnValue(),
          char v52 = [v51 isScrolling],
          v51,
          (v52 & 1) != 0))
    {

      id v14 = [(SBUIController *)self iconController];
      double v53 = [v14 iconManager];
      char v54 = [v53 isScrolling];

      if ((v54 & 1) == 0)
      {
        [v14 handleHomeButtonTap];
        char v55 = SBLogButtonsHome();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
        {
          objc_super v56 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138543362;
          uint64_t v60 = v56;
          _os_log_impl(&dword_1D85BA000, v55, OS_LOG_TYPE_INFO, "%{public}@ result: icon controller handled it", buf, 0xCu);
        }
      }
      char v16 = v54 ^ 1;
      goto LABEL_63;
    }
    [v8 handleHomeButtonTap];
    uint64_t v42 = SBLogButtonsHome();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
    {
      id v43 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138543362;
      uint64_t v60 = v43;
      int v44 = "%{public}@ result: home screen controller handled it";
      goto LABEL_68;
    }
    goto LABEL_69;
  }
  id v14 = [(SBUIController *)self iconController];
  id v15 = [v14 iconManager];
  char v16 = 1;
  [v15 popExpandedIconFromLocation:v12 interactionContext:0 animated:1 completionHandler:0];

LABEL_63:
LABEL_72:

  return v16;
}

- (void)_reduceMotionStatusDidChange:(id)a3
{
  [(SBHomeScreenBackdropViewBase *)self->_homeScreenBackdropView removeFromSuperview];
  [(SBUIController *)self _setupHomeScreenContentBackdropView];
}

- (void)_backgroundContrastDidChange:(id)a3
{
  [(SBHomeScreenBackdropViewBase *)self->_homeScreenBackdropView removeFromSuperview];
  [(SBUIController *)self _setupHomeScreenContentBackdropView];
  [(SBUIController *)self updateStatusBarLegibilityForWindowScene:0];
}

- (BOOL)handleHomeButtonDoublePressDown
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = +[SBMainSwitcherControllerCoordinator _shim_activeSwitcherController];
  [v4 unlockedEnvironmentMode];

  ADClientAddValueForScalarKey();
  char v5 = SBLogButtonsHome();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    BOOL v6 = NSStringFromSelector(a2);
    int v10 = 138543362;
    uint64_t v11 = v6;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_INFO, "%{public}@ result: activating app switcher", (uint8_t *)&v10, 0xCu);
  }
  id v7 = [(SBUIController *)self windowScene];
  id v8 = [v7 switcherController];
  [v8 toggleMainSwitcherWithSource:20 animated:1];

  return 1;
}

- (void)handleVolumeButtonWithType:(int64_t)a3 down:(BOOL)a4
{
}

- (void)cancelVolumeEvent
{
  if (objc_opt_respondsToSelector()) {
    [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self->_volumeControl selector:sel_increaseVolume object:0];
  }
  if (objc_opt_respondsToSelector())
  {
    char v3 = (void *)MEMORY[0x1E4FBA8A8];
    volumeControl = self->_volumeControl;
    [v3 cancelPreviousPerformRequestsWithTarget:volumeControl selector:sel_decreaseVolume object:0];
  }
}

uint64_t __37__SBUIController_updateBatteryState___block_invoke(uint64_t a1)
{
  dispatch_queue_t v2 = dispatch_queue_create("com.apple.SpringBoard.batterynotificationqueue", 0);
  char v3 = (void *)updateBatteryState__notificationQueue;
  updateBatteryState__notificationQueue = (uint64_t)v2;

  notify_register_check("com.apple.springboard.fullycharged", &updateBatteryState__fullPowerToken);
  uint64_t result = notify_register_check("com.apple.springboard.pluggedin", &updateBatteryState__pluggedInToken);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  return result;
}

uint64_t __37__SBUIController_updateBatteryState___block_invoke_260()
{
  return BSDispatchMain();
}

void __37__SBUIController_updateBatteryState___block_invoke_2(uint64_t a1)
{
  char v1 = *(unsigned char *)(*(void *)(a1 + 32) + 80);
  if ((v1 & 8) != 0)
  {
    dispatch_queue_t v2 = SBLogUIController();
    BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_ERROR);
    if ((v1 & 0x10) != 0)
    {
      if (v3) {
        __37__SBUIController_updateBatteryState___block_invoke_2_cold_2(v2, v4, v5, v6, v7, v8, v9, v10);
      }

      uint64_t v11 = [(id)SBApp restartManager];
      [v11 rebootForReason:@"BatteryAtCriticalLevel"];
    }
    else
    {
      if (v3) {
        __37__SBUIController_updateBatteryState___block_invoke_2_cold_1(v2, v4, v5, v6, v7, v8, v9, v10);
      }

      uint64_t v11 = [(id)SBApp restartManager];
      [v11 shutdownForReason:@"BatteryAtCriticalLevel"];
    }
  }
}

uint64_t __37__SBUIController_updateBatteryState___block_invoke_268(uint64_t a1)
{
  notify_set_state(updateBatteryState__fullPowerToken, *(unsigned __int8 *)(a1 + 32));
  return notify_post("com.apple.springboard.fullycharged");
}

uint64_t __37__SBUIController_updateBatteryState___block_invoke_2_270(uint64_t a1)
{
  notify_set_state(updateBatteryState__pluggedInToken, *(unsigned __int8 *)(a1 + 32));
  return notify_post("com.apple.springboard.pluggedin");
}

- (id)connectedWirelessChargerIdentifier
{
  return self->_connectedWirelessChargerId;
}

- (void)_disableWirelessChargingChimeAndScreenWakeForDuration:(double)a3
{
}

- (void)_disableWirelessChargingChimeAndScreenWakeForDuration:(double)a3 withMotionAlarm:(BOOL)a4
{
  *(_WORD *)&self->_disableChimeForWirelessCharging = 257;
  if (a4) {
    [(SBFMotionAlarmController *)self->_motionAlarmController registerMotionAlarm];
  }
  [(SBUIController *)self _setDebounceWirelessChargingTimerWithDuration:a3];
}

- (void)setChargingChimeEnabled:(BOOL)a3
{
  if (self->_chargingChimeEnabled != a3)
  {
    self->_chargingChimeEnabled = a3;
    if (a3) {
      [(SBUIController *)self playChargingChimeIfAppropriate];
    }
    else {
      [(NSMutableDictionary *)self->_powerSourceHasChimed removeAllObjects];
    }
  }
}

- (void)suppressChimeForConnectedPowerSources
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __55__SBUIController_suppressChimeForConnectedPowerSources__block_invoke;
  v2[3] = &unk_1E6AF5720;
  v2[4] = self;
  [(SBUIController *)self _enumeratePowerSourcesWithBlock:v2];
}

void __55__SBUIController_suppressChimeForConnectedPowerSources__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v7 = [v3 objectForKeyedSubscript:@"Power Source ID"];
  uint64_t v4 = [v3 objectForKeyedSubscript:@"Play Charging Chime"];

  int v5 = [v4 BOOLValue];
  uint64_t v6 = v7;
  if (v7 && v5)
  {
    [*(id *)(*(void *)(a1 + 32) + 176) setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:v7];
    uint64_t v6 = v7;
  }
}

- (void)didDetectDeviceMotion
{
  id v3 = SBLogCharging();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "Device motion detected", v4, 2u);
  }

  [(SBUIController *)self _resetWirelessChargingState];
}

- (void)_setDebounceWirelessChargingTimerWithDuration:(double)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  debounceWirelessChargingTimer = self->_debounceWirelessChargingTimer;
  if (!debounceWirelessChargingTimer) {
    goto LABEL_7;
  }
  [(SWWakingTimer *)debounceWirelessChargingTimer timeRemaining];
  if (v6 < a3)
  {
    double v7 = v6;
    uint64_t v8 = SBLogCharging();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      double v19 = v7;
      __int16 v20 = 2048;
      double v21 = a3;
      _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "Overriding debounce wireless charging timer because current time remaining (%f seconds) is less than requested fire interval (%f seconds)", buf, 0x16u);
    }

    [(SWWakingTimer *)self->_debounceWirelessChargingTimer invalidate];
    uint64_t v9 = self->_debounceWirelessChargingTimer;
    self->_debounceWirelessChargingTimer = 0;
  }
  if (!self->_debounceWirelessChargingTimer)
  {
LABEL_7:
    objc_initWeak(&location, self);
    uint64_t v10 = (SWWakingTimer *)[objc_alloc(MEMORY[0x1E4FA99B0]) initWithIdentifier:@"SBUIController-DebounceWirelessCharging"];
    uint64_t v11 = self->_debounceWirelessChargingTimer;
    self->_debounceWirelessChargingTimer = v10;

    uint64_t v12 = self->_debounceWirelessChargingTimer;
    id v13 = MEMORY[0x1E4F14428];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    _DWORD v15[2] = __64__SBUIController__setDebounceWirelessChargingTimerWithDuration___block_invoke;
    v15[3] = &unk_1E6AF5748;
    objc_copyWeak(&v16, &location);
    [(SWWakingTimer *)v12 scheduleWithFireInterval:MEMORY[0x1E4F14428] leewayInterval:v15 queue:a3 handler:1.0];

    id v14 = SBLogCharging();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      double v19 = a3;
      _os_log_impl(&dword_1D85BA000, v14, OS_LOG_TYPE_DEFAULT, "Debounce wireless charging timer scheduled for %f seconds", buf, 0xCu);
    }

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
}

void __64__SBUIController__setDebounceWirelessChargingTimerWithDuration___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _debounceWirelessChargingTimerFired];
}

- (void)_debounceWirelessChargingTimerFired
{
  id v3 = SBLogCharging();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "Debounce wireless charging timer fired", v4, 2u);
  }

  [(SBUIController *)self _resetWirelessChargingState];
}

- (void)_resetWirelessChargingState
{
  id v3 = SBLogCharging();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "Resetting wireless charging state", v4, 2u);
  }

  *(_WORD *)&self->_disableChimeForWirelessCharging = 0;
  if (![(SBUIController *)self _isConnectedToWirelessCharging])
  {
    [(NSMutableDictionary *)self->_powerSourceHasChimed removeAllObjects];
    [(SBUIController *)self possiblyWakeForPowerStatusChangeWithUnlockSource:21];
  }
  [(SBFMotionAlarmController *)self->_motionAlarmController unregisterMotionAlarm];
  [(SBUIController *)self _cancelDebounceWirelessChargingTimer];
}

- (void)_cancelDebounceWirelessChargingTimer
{
  if (self->_debounceWirelessChargingTimer)
  {
    id v3 = SBLogCharging();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v5 = 0;
      _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "Debounce wireless charging timer canceled", v5, 2u);
    }

    [(SWWakingTimer *)self->_debounceWirelessChargingTimer invalidate];
    debounceWirelessChargingTimer = self->_debounceWirelessChargingTimer;
    self->_debounceWirelessChargingTimer = 0;
  }
}

- (void)_playAccessoryChimeIfAppropriateForAccessory:(id)a3 attaching:(BOOL)a4 withDelay:(double)a5
{
  id v8 = a3;
  dispatch_time_t v9 = dispatch_time(0, (uint64_t)(a5 * 1000000000.0));
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __83__SBUIController__playAccessoryChimeIfAppropriateForAccessory_attaching_withDelay___block_invoke;
  block[3] = &unk_1E6AF5770;
  void block[4] = self;
  id v12 = v8;
  BOOL v13 = a4;
  id v10 = v8;
  dispatch_after(v9, MEMORY[0x1E4F14428], block);
}

void __83__SBUIController__playAccessoryChimeIfAppropriateForAccessory_attaching_withDelay___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) _isAppropriateToReactToAccessoryEvent])
  {
    dispatch_queue_t v2 = SBLogAccessory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v7 = 0;
      _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_DEFAULT, "Play chime for internal accessory", v7, 2u);
    }

    if ([*(id *)(a1 + 40) type] == 8 && *(unsigned char *)(a1 + 48) == 0) {
      uint64_t v4 = 1021;
    }
    else {
      uint64_t v4 = 1019;
    }
    int v5 = [MEMORY[0x1E4FA79C8] soundWithFeedbackEventType:v4];
    double v6 = +[SBSoundController sharedInstance];
    [v6 playSoundWithDefaultEnvironment:v5];
  }
}

- (BOOL)_isAppropriateToReactToAccessoryEvent
{
  id v3 = [(id)SBApp restartManager];
  uint64_t v4 = [v3 startupTransition];
  int v5 = [v4 context];

  if (v3)
  {
    double v6 = [v5 overlay];
    if (v6)
    {
    }
    else if (([v5 isDark] & 1) == 0)
    {
      BOOL v7 = [(SBUIController *)self isAccessoryAnimationAllowed];
      goto LABEL_6;
    }
  }
  BOOL v7 = 0;
LABEL_6:

  return v7;
}

- (float)batteryCapacity
{
  return self->_batteryCapacity;
}

- (BOOL)isFullyCharged
{
  return (*((unsigned __int8 *)self + 80) >> 2) & 1;
}

- (BOOL)isOnAC
{
  return (*((unsigned __int8 *)self + 80) >> 4) & 1;
}

- (BOOL)isConnectedToExternalChargingSource
{
  return (*((unsigned char *)self + 80) & 0x30) != 0;
}

- (BOOL)isConnectedToChargeIncapablePowerSource
{
  return *((unsigned char *)self + 81) & 1;
}

- (BOOL)isConnectedToWirelessInternalCharger
{
  return (*((unsigned __int8 *)self + 81) >> 2) & 1;
}

- (BOOL)isConnectedToWirelessInternalChargingAccessory
{
  return (*((unsigned __int8 *)self + 81) >> 3) & 1;
}

- (BOOL)isConnectedToWirelessInternalAccessory
{
  return (*((unsigned __int8 *)self + 81) >> 4) & 1;
}

- (BOOL)isConnectedToWindowedAccessory
{
  return (*((unsigned __int8 *)self + 81) >> 5) & 1;
}

- (CGRect)visibleScreenCoordinatesForWindowedAccessory
{
  double x = self->_visibleScreenCoordinatesForWindowedAccessory.origin.x;
  double y = self->_visibleScreenCoordinatesForWindowedAccessory.origin.y;
  double width = self->_visibleScreenCoordinatesForWindowedAccessory.size.width;
  double height = self->_visibleScreenCoordinatesForWindowedAccessory.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (BOOL)isConnectedToQiPower
{
  return *((unsigned char *)self + 136) & 1;
}

- (void)possiblyWakeForPowerStatusChangeWithUnlockSource:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (([(id)SBApp caseIsEnabledAndLatched] & 1) == 0)
  {
    uint64_t v4 = +[SBLockScreenManager sharedInstanceIfExists];
    if ([v4 isUILocked])
    {
      int v5 = SBLogCharging();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        double v6 = NSStringFromUnlockSource();
        *(_DWORD *)buf = 138412290;
        int v18 = v6;
        _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "Unlock UI for source: %@", buf, 0xCu);
      }
      v15[0] = @"SBUIUnlockOptionsTurnOnScreenFirstKey";
      BOOL v7 = [NSNumber numberWithBool:1];
      v16[0] = v7;
      v15[1] = @"SBUIUnlockOptionsStartFadeInAnimation";
      id v8 = [NSNumber numberWithBool:1];
      v16[1] = v8;
      dispatch_time_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
      [v4 unlockUIFromSource:v3 withOptions:v9];
    }
    else
    {
      BOOL v7 = +[SBIdleTimerGlobalCoordinator sharedInstanceIfExists];
      id v10 = NSString;
      uint64_t v11 = NSStringFromUnlockSource();
      id v12 = [v10 stringWithFormat:@"SBUIPossiblyWake:%@", v11];
      [v7 resetIdleTimerForReason:v12];
    }
    BOOL v13 = +[SBScreenLongevityController sharedInstanceIfExists];
    id v14 = NSStringFromUnlockSource();
    [v13 resetTimerForReason:v14];
  }
}

- (void)ACPowerChanged
{
  if (!self->_disableScreenWakeForWirelessCharging) {
    [(SBUIController *)self possiblyWakeForPowerStatusChangeWithUnlockSource:21];
  }
}

- (BOOL)isConnectedToUnsupportedChargingAccessory
{
  return *((unsigned __int8 *)self + 80) >> 7;
}

- (BOOL)supportsDetailedBatteryCapacity
{
  return self->_supportsDetailedBatteryCapacity;
}

- (void)noteStatusBarHeightChanged:(id)a3
{
  id v4 = a3;
  int v5 = (void *)MEMORY[0x1E4F624D8];
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  uint64_t v11 = __45__SBUIController_noteStatusBarHeightChanged___block_invoke;
  id v12 = &unk_1E6AF5290;
  id v13 = v4;
  id v14 = self;
  id v6 = v4;
  BOOL v7 = [v5 eventWithName:@"updateLayoutForStatusBarHeightChange" handler:&v9];
  id v8 = objc_msgSend(MEMORY[0x1E4F624E0], "sharedInstance", v9, v10, v11, v12);
  [v8 executeOrPrependEvent:v7];
}

void __45__SBUIController_noteStatusBarHeightChanged___block_invoke(uint64_t a1)
{
  if (SBWorkspaceSpringBoardIsActive())
  {
    dispatch_queue_t v2 = [*(id *)(a1 + 32) userInfo];
    id v6 = [v2 objectForKey:*MEMORY[0x1E4F436D0]];

    if (v6)
    {
      [v6 doubleValue];
      double v4 = v3;
    }
    else
    {
      double v4 = 0.0;
    }
    int v5 = [*(id *)(a1 + 40) iconController];
    [v5 updateNumberOfRowsWithDuration:v4];
  }
  else
  {
    id v6 = [*(id *)(a1 + 40) iconController];
    [v6 updateNumberOfRowsWithDuration:0.0];
  }
}

- (NSString)description
{
  return (NSString *)[(SBUIController *)self descriptionWithMultilinePrefix:@"\t"];
}

- (void)nudgeIconInterfaceOrientation:(int64_t)a3 duration:(double)a4
{
  id v7 = [(SBUIController *)self iconController];
  id v6 = [v7 homeScreenViewController];
  [v6 nudgeIconInterfaceOrientation:a3 duration:a4];
}

- (BOOL)homeScreenAutorotatesEvenWhenIconIsDragging
{
  dispatch_queue_t v2 = [(SBUIController *)self iconController];
  double v3 = [v2 homeScreenViewController];
  char v4 = [v3 homeScreenAutorotatesEvenWhenIconIsDragging];

  return v4;
}

- (void)disableAnimationForNextIconRotation
{
  id v3 = [(SBUIController *)self iconController];
  dispatch_queue_t v2 = [v3 homeScreenViewController];
  [v2 disableAnimationForNextIconRotation];
}

- (BOOL)isHeadsetDocked
{
  return 0;
}

- (BOOL)isHeadsetBatteryCharging
{
  return 0;
}

- (unsigned)headsetBatteryCapacity
{
  return 0;
}

- (void)interactionProgressDidUpdate:(id)a3
{
  if (self->_homeButtonForceProgress == a3)
  {
    [a3 percentComplete];
    self->_disableAppSwitchForcePressDueToHomeButtonForce = v4 > 0.001;
  }
}

- (void)interactionProgress:(id)a3 didEnd:(BOOL)a4
{
  if (self->_homeButtonForceProgress == a3) {
    self->_disableAppSwitchForcePressDueToHomeButtonForce = 0;
  }
}

- (void)_activateApplicationFromAccessibility:(id)a3
{
  id v3 = a3;
  double v4 = +[SBMainWorkspace sharedInstance];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __56__SBUIController__activateApplicationFromAccessibility___block_invoke;
  v6[3] = &unk_1E6AF57E8;
  id v7 = v3;
  id v5 = v3;
  [v4 requestTransitionWithBuilder:v6];
}

void __56__SBUIController__activateApplicationFromAccessibility___block_invoke(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __56__SBUIController__activateApplicationFromAccessibility___block_invoke_2;
  v4[3] = &unk_1E6AF57C0;
  id v5 = *(id *)(a1 + 32);
  id v3 = a2;
  [v3 modifyApplicationContext:v4];
  [v3 setSource:18];
}

void __56__SBUIController__activateApplicationFromAccessibility___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  double v4 = [[SBDeviceApplicationSceneEntity alloc] initWithApplicationForMainDisplay:*(void *)(a1 + 32)];
  [v3 setActivatingEntity:v4];
}

- (void)handleWillBeginReachabilityAnimation
{
  if ([(SBHomeScreenBackdropViewBase *)self->_homeScreenBackdropView requiresBackdropView]
    || [(SBHomeScreenBackdropViewBase *)self->_homeScreenBackdropView requiresLiveBackdropView])
  {
    [(SBUIController *)self beginRequiringLiveBackdropViewForReason:@"ReachabilityAnimation"];
    if (!self->_reachabilityWallpaperEffectView)
    {
      id v3 = [[SBWallpaperEffectView alloc] initWithWallpaperVariant:1];
      reachabilityWallpaperEffectView = self->_reachabilityWallpaperEffectView;
      self->_reachabilityWallpaperEffectView = v3;

      [(PBUIWallpaperEffectViewBase *)self->_reachabilityWallpaperEffectView setForcesOpaque:1];
      [(PBUIWallpaperEffectViewBase *)self->_reachabilityWallpaperEffectView setFullscreen:1];
      [(PBUIWallpaperEffectViewBase *)self->_reachabilityWallpaperEffectView setStyle:0];
      [(UIView *)self->_contentView addSubview:self->_reachabilityWallpaperEffectView];
      [(UIView *)self->_contentView sendSubviewToBack:self->_reachabilityWallpaperEffectView];
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      v5[2] = __54__SBUIController_handleWillBeginReachabilityAnimation__block_invoke;
      v5[3] = &unk_1E6AF4AC0;
      v5[4] = self;
      [MEMORY[0x1E4F42FF0] _performWithoutRetargetingAnimations:v5];
    }
  }
}

uint64_t __54__SBUIController_handleWillBeginReachabilityAnimation__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 48);
  [*(id *)(v2 + 24) bounds];
  objc_msgSend(v3, "setFrame:");
  double v4 = *(void **)(*(void *)(a1 + 32) + 48);
  return [v4 layoutIfNeeded];
}

- (void)handleDidEndReachabilityAnimation
{
}

- (void)homeScreenBackdropView:(id)a3 opaquenessDidChange:(BOOL)a4
{
  BOOL v4 = a4;
  id v9 = a3;
  if (v4)
  {
    id v6 = [(SBUIController *)self iconController];
    id v7 = [v6 iconManager];
    self->_isShowingSpotlightUnderOpaqueBackdrop = [v7 isShowingPullDownSearch];

    [(SBUIController *)self tearDownIconListAndBar];
    [(SBUIController *)self _removeReachabilityEffectViewIfNecessary];
  }
  else if ([(NSMutableSet *)self->_contentRequiringReasons count] {
         && [(SBUIController *)self isIconListViewTornDown])
  }
  {
    if (self->_isShowingSpotlightUnderOpaqueBackdrop)
    {
      self->_isShowingSpotlightUnderOpaqueBackdrop = 0;
      uint64_t v8 = 5;
    }
    else
    {
      uint64_t v8 = 1;
    }
    [(SBUIController *)self restoreContentWithOptions:v8];
  }
}

- (void)wallpaperLegibilitySettingsDidChange:(id)a3 forVariant:(int64_t)a4
{
  if (a4 == 1) {
    [(SBUIController *)self _updateLegibility];
  }
}

- (void)wallpaperDidChangeForVariant:(int64_t)a3
{
  if (a3 == 1)
  {
    [(SBUIController *)self _updateLegibility];
    id v5 = (void *)MEMORY[0x1E4FA61B8];
    [v5 warmupIfNecessary];
  }
}

- (void)_updateLegibility
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(SBUIController *)self _legibilitySettings];
  uint64_t v4 = (void *)MEMORY[0x1E4FA6430];
  id v5 = [(id)*MEMORY[0x1E4F43630] preferredContentSizeCategory];
  [v4 labelMaximumHeightForContentSizeCategory:v5];
  double v7 = v6;

  [v3 setMinFillHeight:v7];
  uint64_t v8 = [(SBUIController *)self iconController];
  id v9 = [v8 legibilitySettings];
  char v10 = SBUILegibilitySettingsAreEqual();

  if ((v10 & 1) == 0)
  {
    uint64_t v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v11 postNotificationName:*MEMORY[0x1E4FA7EB0] object:0];
  }
  id v12 = SBLogCommon();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    id v13 = objc_msgSend(v3, "sb_description");
    int v17 = 138412290;
    int v18 = v13;
    _os_log_impl(&dword_1D85BA000, v12, OS_LOG_TYPE_INFO, "Using legibility settings: %@", (uint8_t *)&v17, 0xCu);
  }
  id v14 = [(SBUIController *)self iconController];
  [v14 setLegibilitySettings:v3];

  id v15 = [(SBUIController *)self iconController];
  id v16 = [v15 homeScreenViewController];
  [v16 setLegibilitySettings:v3];

  [(SBUIController *)self updateStatusBarLegibilityForWindowScene:0];
}

- (void)updateStatusBarLegibilityForWindowScene:(id)a3
{
  id v4 = a3;
  id v5 = [(SBUIController *)self _currentHomeScreenLegibilitySettings];
  if (self->_statusBarAssertionsByWindowScene)
  {
    if (v4) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v8 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    statusBarAssertionsByWindowScene = self->_statusBarAssertionsByWindowScene;
    self->_statusBarAssertionsByWindowScene = v8;

    if (v4) {
      goto LABEL_3;
    }
  }
  id v4 = [(UIWindow *)self->_window _sbWindowScene];
LABEL_3:
  uint64_t v6 = [(NSMapTable *)self->_statusBarAssertionsByWindowScene objectForKey:v4];
  if (v6)
  {
    double v7 = (void *)v6;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __58__SBUIController_updateStatusBarLegibilityForWindowScene___block_invoke;
    v13[3] = &unk_1E6AF5810;
    id v14 = v5;
    [v7 modifySettingsWithBlock:v13];
  }
  else
  {
    char v10 = objc_alloc_init(SBMutableStatusBarSettings);
    [(SBMutableStatusBarSettings *)v10 setStyle:SBDefaultStatusBarStyle()];
    [(SBMutableStatusBarSettings *)v10 setLegibilitySettings:v5];
    uint64_t v11 = [v4 statusBarManager];
    id v12 = [v11 assertionManager];

    double v7 = (void *)[v12 newSettingsAssertionWithSettings:v10 atLevel:0 reason:@"SBHomeScreenStatusBar"];
    [v7 acquire];
    [(NSMapTable *)self->_statusBarAssertionsByWindowScene setObject:v7 forKey:v4];
  }
}

void __58__SBUIController_updateStatusBarLegibilityForWindowScene___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setStyle:SBDefaultStatusBarStyle()];
  [v3 setLegibilitySettings:*(void *)(a1 + 32)];
}

- (id)_legibilitySettings
{
  uint64_t v2 = +[SBWallpaperController sharedInstance];
  id v3 = [v2 legibilitySettingsForVariant:1];

  if (v3)
  {
    id v4 = v3;
  }
  else
  {
    id v4 = [MEMORY[0x1E4F43228] sharedInstanceForStyle:1];
  }
  id v5 = v4;

  return v5;
}

- (id)_currentHomeScreenLegibilitySettings
{
  uint64_t v2 = [(SBUIController *)self iconController];
  id v3 = [v2 legibilitySettings];

  return v3;
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  id v5 = (void *)MEMORY[0x1E4FA5F38];
  id v6 = a3;
  id v7 = [v5 rootSettings];

  if (v7 == v6)
  {
    id v9 = [MEMORY[0x1E4F43228] sharedInstanceForStyle:0];
    uint64_t v8 = [(SBUIController *)self iconController];
    [v8 setLegibilitySettings:v9];

    [(SBUIController *)self _updateLegibility];
  }
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(SBUIController *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v5 = (id)[v4 appendObject:self->_contentRequiringReasons withName:@"contentRequiringReasons"];
  id v6 = (id)objc_msgSend(v4, "appendBool:withName:", -[SBUIController isIconListViewTornDown](self, "isIconListViewTornDown"), @"isIconListViewTornDown");
  return v4;
}

- (id)succinctDescription
{
  uint64_t v2 = [(SBUIController *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (CSMagSafeAccessory)lastAttachedAccessory
{
  return self->_lastAttachedAccessory;
}

- (CSMagSafeAccessory)lastDetachedAccessory
{
  return self->_lastDetachedAccessory;
}

- (void)storeAttachedAccessory:(id)a3
{
  id v8 = a3;
  [(SBUIController *)self setLastAttachedAccessory:v8];
  id v4 = [v8 endpointUUID];
  accessoriesAttachedByUUID = self->_accessoriesAttachedByUUID;
  if (accessoriesAttachedByUUID)
  {
    if (!v4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  id v6 = (NSMutableDictionary *)objc_opt_new();
  id v7 = self->_accessoriesAttachedByUUID;
  self->_accessoriesAttachedByUUID = v6;

  accessoriesAttachedByUUID = self->_accessoriesAttachedByUUID;
  if (v4)
  {
LABEL_3:
    [(NSMutableDictionary *)accessoriesAttachedByUUID setObject:v8 forKeyedSubscript:v4];
    [(NSMutableDictionary *)self->_accessoriesSuppressedByUUID removeObjectForKey:v4];
    accessoriesAttachedByUUID = self->_accessoriesAttachedByUUID;
  }
LABEL_4:
  if ([(NSMutableDictionary *)accessoriesAttachedByUUID count]) {
    *((unsigned char *)self + 81) |= 0x10u;
  }
}

- (void)removeDetachedAccessory:(id)a3
{
  id v4 = a3;
  [(SBUIController *)self setLastDetachedAccessory:v4];
  id v5 = [v4 endpointUUID];

  if (v5) {
    [(NSMutableDictionary *)self->_accessoriesAttachedByUUID removeObjectForKey:v5];
  }
  if (![(NSMutableDictionary *)self->_accessoriesAttachedByUUID count]) {
    *((unsigned char *)self + 81) &= ~0x10u;
  }
}

- (void)_storeSuppressedAccessory:(id)a3
{
  id v8 = a3;
  uint64_t v4 = [v8 endpointUUID];
  id v5 = (void *)v4;
  if (self->_accessoriesSuppressedByUUID)
  {
    if (!v4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  id v6 = (NSMutableDictionary *)objc_opt_new();
  accessoriesSuppressedByUUID = self->_accessoriesSuppressedByUUID;
  self->_accessoriesSuppressedByUUID = v6;

  if (v5) {
LABEL_3:
  }
    [(NSMutableDictionary *)self->_accessoriesSuppressedByUUID setObject:v8 forKeyedSubscript:v5];
LABEL_4:
}

- (void)_removeSuppressedAccessory:(id)a3
{
  uint64_t v4 = [a3 endpointUUID];
  if (v4)
  {
    id v5 = v4;
    [(NSMutableDictionary *)self->_accessoriesAttachedByUUID removeObjectForKey:v4];
    uint64_t v4 = v5;
  }
}

- (void)setLastAttachedAccessory:(id)a3
{
  id v5 = (CSMagSafeAccessory *)a3;
  if (self->_lastAttachedAccessory != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_lastAttachedAccessory, a3);
    id v5 = v6;
  }
}

- (void)setLastDetachedAccessory:(id)a3
{
  id v5 = (CSMagSafeAccessory *)a3;
  if (self->_lastDetachedAccessory != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_lastDetachedAccessory, a3);
    id v5 = v6;
  }
}

- (BOOL)isAccessoryAnimationAllowed
{
  return self->_isAccessoryAnimationAllowed;
}

- (void)setIsAccessoryAnimationAllowed:(BOOL)a3
{
  if (self->_isAccessoryAnimationAllowed != a3)
  {
    self->_isAccessoryAnimationAllowed = a3;
    id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 postNotificationName:@"SBUIAccessoryAnimationStatusChangedNotification" object:0 userInfo:0];
  }
}

- (void)windowedAccessoryDismissed
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__SBUIController_windowedAccessoryDismissed__block_invoke;
  block[3] = &unk_1E6AF4AC0;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __44__SBUIController_windowedAccessoryDismissed__block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v2 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 320), "allValues", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if ([v7 isWindowed])
        {
          id v8 = SBLogAccessory();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
          {
            id v9 = [v7 description];
            *(_DWORD *)buf = 138412290;
            id v15 = v9;
            _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "Windowed accessory dismissed: %@", buf, 0xCu);
          }
          [*(id *)(a1 + 32) _dismissAccessory:v7 playChime:0];
          goto LABEL_13;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v16 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_13:
}

- (void)windowedAccessoryPresented
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__SBUIController_windowedAccessoryPresented__block_invoke;
  block[3] = &unk_1E6AF4AC0;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __44__SBUIController_windowedAccessoryPresented__block_invoke(uint64_t a1)
{
  id v3 = +[SBAccessoryController sharedInstance];
  uint64_t v2 = [*(id *)(a1 + 32) windowScene];
  [v3 showWindowedAccessoryWindow:1 forWindowScene:v2];
}

- (void)_dismissAccessory:(id)a3 playChime:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6) {
    [(SBUIController *)self removeDetachedAccessory:v6];
  }
  if ([v6 isWindowed])
  {
    [(SBUIController *)self _setConnectedToWindowedAccessory:0];
    id v7 = +[SBAccessoryController sharedInstance];
    id v8 = [(SBUIController *)self windowScene];
    [v7 showWindowedAccessoryWindow:0 forWindowScene:v8];
  }
  if ([v6 shouldShowAnimation])
  {
    id v9 = SBLogAccessory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      long long v10 = [v6 description];
      int v12 = 138412290;
      long long v13 = v10;
      _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "About to dismiss animation for accessory: %@ ", (uint8_t *)&v12, 0xCu);
    }
    if (v4) {
      [(SBUIController *)self _playAccessoryChimeIfAppropriateForAccessory:v6 attaching:0 withDelay:0.0];
    }
    long long v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v11 postNotificationName:@"SBUIAccessoryDetachedNotification" object:0];
  }
}

- (BOOL)_shouldInitiateAnimationForAccessory:(id)a3
{
  id v4 = a3;
  if ([(SBUIController *)self _shouldShowAnimationForAccessory:v4])
  {
    if ([v4 isWindowed]) {
      LOBYTE(v5) = 1;
    }
    else {
      BOOL v5 = ![(SBUIController *)self _isConnectedToWirelessCharging];
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (BOOL)_shouldShowAnimationForAccessory:(id)a3
{
  id v4 = a3;
  char v5 = [v4 shouldShowAnimation];
  uint64_t v6 = [v4 type];

  if ([(SBUIController *)self _blocksAnimationForAccessoryType:v6])
  {
    id v7 = SBLogAccessory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "Wallet animation is not allowed because Clear Case is attached.", v9, 2u);
    }

    return 0;
  }
  return v5;
}

- (void)_setAccessoryAttachmentAnimationBlockingTimerWithDuration:(double)a3
{
  if (!self->_accessoryAttachmentAnimationBlockingTimer)
  {
    char v5 = SBLogAccessory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "Disable accessory animations", (uint8_t *)buf, 2u);
    }

    [(SBUIController *)self setIsAccessoryAnimationAllowed:0];
    objc_initWeak(buf, self);
    uint64_t v6 = (BSAbsoluteMachTimer *)[objc_alloc(MEMORY[0x1E4F4F660]) initWithIdentifier:@"SBUIController.accessoryAttachmentAnimationBlockingTimer"];
    accessoryAttachmentAnimationBlockingTimer = self->_accessoryAttachmentAnimationBlockingTimer;
    self->_accessoryAttachmentAnimationBlockingTimer = v6;

    id v8 = self->_accessoryAttachmentAnimationBlockingTimer;
    uint64_t v9 = MEMORY[0x1E4F14428];
    id v10 = MEMORY[0x1E4F14428];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __76__SBUIController__setAccessoryAttachmentAnimationBlockingTimerWithDuration___block_invoke;
    v11[3] = &unk_1E6AF5838;
    objc_copyWeak(&v12, buf);
    [(BSAbsoluteMachTimer *)v8 scheduleWithFireInterval:v9 leewayInterval:v11 queue:a3 handler:0.0];

    objc_destroyWeak(&v12);
    objc_destroyWeak(buf);
  }
}

void __76__SBUIController__setAccessoryAttachmentAnimationBlockingTimerWithDuration___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _animationBlockingTimerFired];
}

- (void)_animationBlockingTimerFired
{
  id v3 = SBLogAccessory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)char v5 = 0;
    _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "Enable accessory animations", v5, 2u);
  }

  [(SBUIController *)self setIsAccessoryAnimationAllowed:1];
  [(BSAbsoluteMachTimer *)self->_accessoryAttachmentAnimationBlockingTimer invalidate];
  accessoryAttachmentAnimationBlockingTimer = self->_accessoryAttachmentAnimationBlockingTimer;
  self->_accessoryAttachmentAnimationBlockingTimer = 0;
}

- (void)accessoryConnectionInfoProvider:(id)a3 accessoryEndpointAttached:(id)a4 transportType:(int)a5 protocol:(int)a6 properties:(id)a7 forConnection:(id)a8
{
  id v11 = a4;
  id v12 = a7;
  long long v13 = v12;
  if (a5 == 13)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __124__SBUIController_accessoryConnectionInfoProvider_accessoryEndpointAttached_transportType_protocol_properties_forConnection___block_invoke;
    block[3] = &unk_1E6AF4E00;
    id v15 = v12;
    id v16 = v11;
    uint64_t v17 = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __124__SBUIController_accessoryConnectionInfoProvider_accessoryEndpointAttached_transportType_protocol_properties_forConnection___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)[objc_alloc(MEMORY[0x1E4F5E410]) initWithDictionary:*(void *)(a1 + 32) endpointUUID:*(void *)(a1 + 40)];
  if ([v2 isSupported])
  {
    [*(id *)(a1 + 48) _accessoryEndpointAttached:v2];
  }
  else
  {
    id v3 = SBLogAccessory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = [v2 description];
      uint64_t v5 = *(void *)(a1 + 40);
      int v6 = 138412546;
      id v7 = v4;
      __int16 v8 = 2112;
      uint64_t v9 = v5;
      _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "Suppressing unsupported accessory: %@, endpointUUID: %@", (uint8_t *)&v6, 0x16u);
    }
    if (([*(id *)(a1 + 48) _isAppropriateToReactToAccessoryEvent] & 1) == 0) {
      [*(id *)(a1 + 48) _storeSuppressedAccessory:v2];
    }
  }
}

- (void)_accessoryEndpointAttached:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    int v6 = [v4 endpointUUID];
    [(SBUIController *)self storeAttachedAccessory:v5];
    id v7 = SBLogAccessory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v8 = [v5 description];
      *(_DWORD *)buf = 138412546;
      uint64_t v19 = v8;
      __int16 v20 = 2112;
      double v21 = v6;
      _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "Accessory attached: %@, endpointUUID: %@", buf, 0x16u);
    }
    if ([(SBUIController *)self _shouldInitiateAnimationForAccessory:v5])
    {
      if ((*((unsigned char *)self + 81) & 0x20) == 0 && [v5 isWindowed])
      {
        [v5 visibleScreenCoordinates];
        self->_visibleScreenCoordinatesForWindowedAccessory.origin.double x = v9;
        self->_visibleScreenCoordinatesForWindowedAccessory.origin.double y = v10;
        self->_visibleScreenCoordinatesForWindowedAccessory.size.double width = v11;
        self->_visibleScreenCoordinatesForWindowedAccessory.size.double height = v12;
        [(SBUIController *)self _setConnectedToWindowedAccessory:1];
      }
      long long v13 = +[SBWorkspace mainWorkspace];
      uint64_t v14 = [v13 inCallPresentationManager];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      void v15[2] = __45__SBUIController__accessoryEndpointAttached___block_invoke;
      v15[3] = &unk_1E6AF5860;
      void v15[4] = self;
      id v16 = v6;
      id v17 = v5;
      [v14 handleAccessoryAttachWithCompletion:v15];
    }
  }
}

void __45__SBUIController__accessoryEndpointAttached___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = *(void **)(*(void *)(a1 + 32) + 312);
  if (v4)
  {
    uint64_t v5 = [v4 endpointUUID];
    char v6 = [v5 isEqualToString:*(void *)(a1 + 40)];

    if (v6)
    {
      id v7 = SBLogAccessory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v8 = *(void **)(a1 + 40);
        *(_DWORD *)buf = 138412290;
        uint64_t v24 = v8;
        _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "Accessory already detached: %@", buf, 0xCu);
      }
      goto LABEL_15;
    }
  }
  CGFloat v9 = SBLogAccessory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    CGFloat v10 = [*(id *)(a1 + 48) description];
    *(_DWORD *)buf = 138412290;
    uint64_t v24 = v10;
    _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "About to show animation for accessory: %@ ", buf, 0xCu);
  }
  id v7 = +[SBLockScreenManager sharedInstance];
  if ([v7 isUILocked])
  {
    v21[0] = @"SBUIUnlockOptionsTurnOnScreenFirstKey";
    v21[1] = @"SBUIUnlockOptionsStartFadeInAnimation";
    v22[0] = MEMORY[0x1E4F1CC38];
    v22[1] = MEMORY[0x1E4F1CC38];
    CGFloat v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:2];
    [v7 unlockUIFromSource:31 withOptions:v11];
LABEL_11:

    goto LABEL_12;
  }
  if ([*(id *)(a1 + 48) shouldLockScreenWhenAttached])
  {
    v20[0] = MEMORY[0x1E4F1CC38];
    CGFloat v11 = objc_msgSend(NSNumber, "numberWithBool:", a2, @"SBUILockOptionsLockAutomaticallyKey", @"SBUILockOptionsPreserveTransientOverlaysKey");
    v19[2] = @"SBUILockOptionsUseScreenOffModeKey";
    v20[1] = v11;
    v20[2] = MEMORY[0x1E4F1CC28];
    CGFloat v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:3];
    [v7 lockUIFromSource:24 withOptions:v12];

    goto LABEL_11;
  }
LABEL_12:
  long long v13 = [MEMORY[0x1E4F5E408] rootSettings];
  uint64_t v14 = [v13 chargingSettings];

  [v14 omniAccessoryAnimationDelayInMilliseconds];
  double v16 = v15 / 1000.0;
  if ([*(id *)(a1 + 48) shouldDelayAnimation])
  {
    [*(id *)(a1 + 48) attachAnimationDelay];
    double v16 = v16 + v17;
  }
  [*(id *)(a1 + 32) _playAccessoryChimeIfAppropriateForAccessory:*(void *)(a1 + 48) attaching:1 withDelay:v16];
  [*(id *)(a1 + 32) storeAttachedAccessory:*(void *)(a1 + 48)];
  int v18 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v18 postNotificationName:@"SBUIAccessoryAttachedNotification" object:0 userInfo:0];

LABEL_15:
}

- (void)accessoryConnectionInfoProvider:(id)a3 accessoryEndpointInfoPropertyChanged:(id)a4 properties:(id)a5 forConnection:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  if ([(SBAccessoryConnectionInfoProvider *)self->_accessoryConnectionInfoProvider accessoryEndpointTransportType:v9 connection:a6] == 13)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __112__SBUIController_accessoryConnectionInfoProvider_accessoryEndpointInfoPropertyChanged_properties_forConnection___block_invoke;
    block[3] = &unk_1E6AF4E00;
    void block[4] = self;
    id v12 = v9;
    id v13 = v10;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __112__SBUIController_accessoryConnectionInfoProvider_accessoryEndpointInfoPropertyChanged_properties_forConnection___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 320) objectForKeyedSubscript:*(void *)(a1 + 40)];
  if (!v2)
  {
    id v3 = (id)[objc_alloc(MEMORY[0x1E4F5E410]) initWithDictionary:*(void *)(a1 + 48) endpointUUID:*(void *)(a1 + 40)];
    if (objc_msgSend(*(id *)(a1 + 32), "_treatsAccessoryAsSupported:")) {
      [*(id *)(a1 + 32) _accessoryEndpointAttached:v3];
    }
    uint64_t v2 = v3;
  }
}

- (void)accessoryConnectionInfoProvider:(id)a3 accessoryEndpointDetached:(id)a4 forConnection:(id)a5
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __90__SBUIController_accessoryConnectionInfoProvider_accessoryEndpointDetached_forConnection___block_invoke;
  v8[3] = &unk_1E6AF5290;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  dispatch_async(MEMORY[0x1E4F14428], v8);
}

void __90__SBUIController_accessoryConnectionInfoProvider_accessoryEndpointDetached_forConnection___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(*(void *)(a1 + 32) + 320) objectForKeyedSubscript:*(void *)(a1 + 40)];
  int v2 = objc_msgSend(*(id *)(a1 + 32), "_treatsAccessoryAsSupported:");
  id v3 = *(void **)(a1 + 32);
  if (v2) {
    [v3 _accessoryEndpointDetached:v4];
  }
  else {
    [v3 _removeSuppressedAccessory:v4];
  }
}

- (BOOL)_treatsAccessoryAsSupported:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [v4 isSupported];
  id v6 = [v4 endpointUUID];
  if (v6)
  {
    id v7 = [(NSMutableDictionary *)self->_accessoriesSuppressedByUUID objectForKey:v6];
    BOOL v8 = v7 == 0;

    if (v7 && ((v5 ^ 1) & 1) == 0)
    {
      id v9 = SBLogAccessory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        id v10 = [v4 description];
        CGFloat v11 = [v4 endpointUUID];
        int v13 = 138412546;
        uint64_t v14 = v10;
        __int16 v15 = 2112;
        double v16 = v11;
        _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "Suppressing late-arriving accessory: %@, endpointUUID: %@", (uint8_t *)&v13, 0x16u);
      }
      BOOL v8 = 0;
    }
  }
  else
  {
    BOOL v8 = 1;
  }

  return v5 & v8;
}

- (void)_accessoryEndpointDetached:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [v4 endpointUUID];
  id v6 = SBLogAccessory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [v4 description];
    int v8 = 138412546;
    id v9 = v7;
    __int16 v10 = 2112;
    CGFloat v11 = v5;
    _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "Accessory detached: %@, endpointUUID: %@", (uint8_t *)&v8, 0x16u);
  }
  if (v4) {
    -[SBUIController _dismissAccessory:playChime:](self, "_dismissAccessory:playChime:", v4, [v4 chimeOnDetach]);
  }
}

- (void)_setConnectedToWindowedAccessory:(BOOL)a3
{
  v22[1] = *MEMORY[0x1E4F143B8];
  char v3 = *((unsigned char *)self + 81);
  if (((((v3 & 0x20) == 0) ^ a3) & 1) == 0)
  {
    BOOL v4 = a3;
    if (a3) {
      char v6 = 32;
    }
    else {
      char v6 = 0;
    }
    *((unsigned char *)self + 81) = v3 & 0xDF | v6;
    suspendProximityForAttachedWindowedAccessoryAssertion = self->_suspendProximityForAttachedWindowedAccessoryAssertion;
    if (a3)
    {
      if (!suspendProximityForAttachedWindowedAccessoryAssertion)
      {
        int v8 = [(id)SBApp HIDUISensorController];
        id v9 = [v8 suspendProximityDetectionForSource:36 reason:@"Windowed Accessory Attached"];
        __int16 v10 = self->_suspendProximityForAttachedWindowedAccessoryAssertion;
        self->_suspendProximityForAttachedWindowedAccessoryAssertion = v9;
      }
      if (!self->_zStackParticipant)
      {
        CGFloat v11 = [(SBUIController *)self windowScene];
        uint64_t v12 = [v11 zStackResolver];
        int v13 = [v12 acquireParticipantWithIdentifier:29 delegate:self];
        zStackParticipant = self->_zStackParticipant;
        self->_zStackParticipant = v13;
      }
    }
    else
    {
      if (suspendProximityForAttachedWindowedAccessoryAssertion)
      {
        [(BSInvalidatable *)suspendProximityForAttachedWindowedAccessoryAssertion invalidate];
        __int16 v15 = self->_suspendProximityForAttachedWindowedAccessoryAssertion;
        self->_suspendProximityForAttachedWindowedAccessoryAssertion = 0;
      }
      [(SBFZStackParticipant *)self->_zStackParticipant invalidate];
      double v16 = self->_zStackParticipant;
      self->_zStackParticipant = 0;

      CGSize v17 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
      self->_visibleScreenCoordinatesForWindowedAccessory.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
      self->_visibleScreenCoordinatesForWindowedAccessory.CGSize size = v17;
    }
    int v18 = [MEMORY[0x1E4F28EB8] defaultCenter];
    double v21 = @"SBUIWindowedAccessoryAttachedKey";
    uint64_t v19 = [NSNumber numberWithBool:v4];
    v22[0] = v19;
    __int16 v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
    [v18 postNotificationName:@"SBUIWindowedAccessoryDidAttachOrDetachNotification" object:self userInfo:v20];
  }
}

- (void)zStackParticipant:(id)a3 updatePreferences:(id)a4
{
  id v4 = a4;
  [v4 setActivationPolicyForParticipantsBelow:0];
  [v4 setHomeGestureConsumption:1];
}

- (UIView)homeScreenContentView
{
  return self->_contentView;
}

- (SBWindowScene)windowScene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  return (SBWindowScene *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconController, 0);
  objc_destroyWeak((id *)&self->_windowScene);
  objc_storeStrong((id *)&self->_accessoriesSuppressedByUUID, 0);
  objc_storeStrong((id *)&self->_accessoriesAttachedByUUID, 0);
  objc_storeStrong((id *)&self->_lastDetachedAccessory, 0);
  objc_storeStrong((id *)&self->_lastAttachedAccessory, 0);
  objc_storeStrong((id *)&self->_debounceWirelessChargingTimer, 0);
  objc_storeStrong((id *)&self->_motionAlarmController, 0);
  objc_storeStrong((id *)&self->_accessoryAttachmentAnimationBlockingTimer, 0);
  objc_storeStrong((id *)&self->_accessoryConnectionInfoProvider, 0);
  objc_storeStrong((id *)&self->_connectedWirelessChargerId, 0);
  objc_storeStrong((id *)&self->_wallpaperRasterizationAssertion, 0);
  objc_storeStrong((id *)&self->_appDirectoryClient, 0);
  objc_storeStrong((id *)&self->_contentRequiringReasons, 0);
  objc_storeStrong((id *)&self->_switcherSettings, 0);
  objc_storeStrong((id *)&self->_unsupportedChargerAlert, 0);
  objc_storeStrong((id *)&self->_powerSourceHasChimed, 0);
  objc_storeStrong((id *)&self->_volumeControl, 0);
  objc_storeStrong((id *)&self->_HUDController, 0);
  objc_storeStrong((id *)&self->_zStackParticipant, 0);
  objc_storeStrong((id *)&self->_suspendProximityForAttachedWindowedAccessoryAssertion, 0);
  objc_storeStrong((id *)&self->_batteryDeviceController, 0);
  objc_storeStrong((id *)&self->_homeButtonForceProgress, 0);
  objc_storeStrong((id *)&self->_statusBarAssertionsByWindowScene, 0);
  objc_storeStrong((id *)&self->_reachabilityWallpaperEffectView, 0);
  objc_storeStrong((id *)&self->_homeScreenDimmingWindow, 0);
  objc_storeStrong((id *)&self->_homeScreenBackdropView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_iconsView, 0);
  objc_storeStrong((id *)&self->_window, 0);
}

+ (CGAffineTransform)_transformForStatusBarWithOrientation:(SEL)a3 scaleFactor:(int64_t)a4
{
  uint64_t v7 = MEMORY[0x1E4F1DAB8];
  long long v8 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&retstr->c = v8;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)(v7 + 32);
  if ((unint64_t)(a4 - 2) <= 2) {
    CGAffineTransformMakeRotation(retstr, dbl_1D8FD26E0[a4 - 2]);
  }
  long long v9 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v14.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v14.c = v9;
  *(_OWORD *)&v14.tdouble x = *(_OWORD *)&retstr->tx;
  UIIntegralTransform();
  long long v10 = *(_OWORD *)&v15.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&v15.a;
  *(_OWORD *)&retstr->c = v10;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&v15.tx;
  CGRect result = (CGAffineTransform *)BSFloatEqualToFloat();
  if ((result & 1) == 0)
  {
    long long v12 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&v14.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&v14.c = v12;
    *(_OWORD *)&v14.tdouble x = *(_OWORD *)&retstr->tx;
    CGRect result = CGAffineTransformScale(&v15, &v14, a5, a5);
    long long v13 = *(_OWORD *)&v15.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v15.a;
    *(_OWORD *)&retstr->c = v13;
    *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&v15.tx;
  }
  return result;
}

+ (CGAffineTransform)_transformAndFrame:(SEL)a3 forLaunchImageHostViewWithOrientation:(CGRect *)a4 statusBarHeight:(int64_t)a5 inJailRect:(double)a6
{
  double width = a7.size.width;
  long long v9 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&v16.a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&v16.c = v9;
  *(_OWORD *)&v16.tdouble x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  double height = a7.size.height;
  switch(a5)
  {
    case 1:
      a4->origin.double x = a7.origin.x;
      a4->origin.double y = a7.origin.y + a6;
      a4->size.double width = width;
      a4->size.double height = a7.size.height - a6;
      break;
    case 2:
      a4->origin.double x = a7.origin.x;
      a4->origin.double y = a7.origin.y;
      a4->size.double width = width;
      a4->size.double height = a7.size.height - a6;
      CGAffineTransformMakeRotation(&v16, 3.14159265);
      break;
    case 3:
      a4->origin.double x = a7.origin.x;
      a4->origin.double y = a7.origin.y + a6;
      a4->size.double width = a7.size.height;
      a4->size.double height = width - a6;
      CGAffineTransformMakeRotation(&v16, 1.57079633);
      double v11 = (height - width - a6) * 0.5;
      double v12 = v11 + a6;
      CGAffineTransform v14 = v16;
      goto LABEL_6;
    case 4:
      a4->origin.double x = a7.origin.x;
      a4->origin.double y = a7.origin.y + a6;
      a4->size.double width = a7.size.height;
      a4->size.double height = width - a6;
      CGAffineTransformMakeRotation(&v16, -1.57079633);
      double v11 = (height - width - a6) * -0.5;
      CGAffineTransform v14 = v16;
      double v12 = v11;
LABEL_6:
      CGAffineTransformTranslate(&v15, &v14, v11, v12);
      CGAffineTransform v16 = v15;
      break;
    default:
      break;
  }
  CGAffineTransform v15 = v16;
  return (CGAffineTransform *)UIIntegralTransform();
}

+ (CGRect)statusBarFrameForDeviceApplicationSceneHandle:(id)a3 displayConfiguration:(id)a4 interfaceOrientation:(int64_t)a5 statusBarStyleRequest:(id)a6 withinBounds:(CGRect)a7 inReferenceSpace:(BOOL)a8
{
  BOOL v8 = a8;
  double height = a7.size.height;
  double width = a7.size.width;
  double y = a7.origin.y;
  double x = a7.origin.x;
  id v17 = a4;
  id v18 = a6;
  uint64_t v19 = [a3 application];
  unint64_t v20 = a5 - 3;
  v64.origin.double x = x;
  v64.origin.double y = y;
  v64.size.double width = width;
  v64.size.double height = height;
  double v21 = CGRectGetHeight(v64);
  v65.origin.double x = x;
  v65.origin.double y = y;
  v65.size.double width = width;
  v65.size.double height = height;
  double v22 = CGRectGetWidth(v65);
  if ((unint64_t)(a5 - 3) < 2)
  {
    double v23 = v21;
  }
  else
  {
    double v22 = height;
    double v23 = width;
  }
  double v24 = 0.0;
  if (v20 >= 2) {
    double v25 = y;
  }
  else {
    double v25 = 0.0;
  }
  if (v20 >= 2) {
    double v24 = x;
  }
  if (v8) {
    double v26 = height;
  }
  else {
    double v26 = v22;
  }
  if (v8) {
    double v27 = width;
  }
  else {
    double v27 = v23;
  }
  double v62 = v27;
  double v63 = v26;
  if (v8) {
    double v28 = y;
  }
  else {
    double v28 = v25;
  }
  if (v8) {
    double v29 = x;
  }
  else {
    double v29 = v24;
  }
  double v60 = v28;
  double v61 = v29;
  int v30 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v31 = [v30 userInterfaceIdiom];

  if ((v31 & 0xFFFFFFFFFFFFFFFBLL) == 1
    && SBApplicationClassicModeRepresentsPad([v19 _classicMode])
    && [v19 classicAppNonFullScreenWithHomeAffordance])
  {
    int v32 = [MEMORY[0x1E4F42D90] mainScreen];
    [v19 defaultLaunchingSizeForDisplayConfiguration:v17];
    double v34 = v62;
    double v33 = v63;
    SBClassicUtilitiesScaleFactorForPresentationWithHomeAffordance(v32, a5, [v19 includesStatusBarInClassicJailForInterfaceOrientation:a5], v62, v63, v35, v36, 1.0);
    if ((BSFloatEqualToFloat() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E4F42E28], "heightForStyle:orientation:", objc_msgSend(v18, "style"), a5);
      UIRectCenteredXInRect();
      CGFloat v37 = v66.origin.x;
      if (CGRectGetMinX(v66) >= 16.0)
      {
        double v38 = v37;
      }
      else
      {
        v67.origin.double x = x;
        v67.origin.double y = y;
        v67.size.double width = width;
        v67.size.double height = height;
        double v38 = CGRectGetWidth(v67);
      }
      SBClassicUtilitiesStatusBarInsetsForPadOnRoundedPad((uint64_t)v32, objc_msgSend(v19, "_classicMode", v38));
      char v55 = (id *)MEMORY[0x1E4F43630];
      [(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection];
      [*v55 userInterfaceLayoutDirection];
      UIRectInset();
      double v40 = v56;
      double v42 = v57;
      double v44 = v58;
      double v46 = v59;
      if (v8) {
        goto LABEL_29;
      }
      goto LABEL_30;
    }
  }
  else
  {
    int v32 = 0;
    double v34 = v62;
    double v33 = v63;
  }
  objc_msgSend(a1, "statusBarFrameForSnapshotFrame:orientation:statusBarStyleRequest:hidden:", a5, v18, 0, v61, v60, v34, v33);
  double v40 = v39;
  double v42 = v41;
  double v44 = v43;
  double v46 = v45;
  if (!v8)
  {
LABEL_29:
    _UIWindowConvertRectFromOrientationToOrientation();
    double v40 = v47;
    double v42 = v48;
    double v44 = v49;
    double v46 = v50;
  }
LABEL_30:

  double v51 = v40;
  double v52 = v42;
  double v53 = v44;
  double v54 = v46;
  result.size.double height = v54;
  result.size.double width = v53;
  result.origin.double y = v52;
  result.origin.double x = v51;
  return result;
}

- (void)updateBatteryState:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __37__SBUIController_updateBatteryState___block_invoke_2_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __37__SBUIController_updateBatteryState___block_invoke_2_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end