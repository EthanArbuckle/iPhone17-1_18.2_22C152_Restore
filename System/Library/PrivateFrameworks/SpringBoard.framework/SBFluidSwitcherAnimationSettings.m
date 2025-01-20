@interface SBFluidSwitcherAnimationSettings
+ (id)settingsControllerModule;
- (BOOL)allowIconZoomFromLargeWidgets;
- (BOOL)allowIconZoomFromMediumWidgets;
- (BOOL)performTwoPhaseFullScreenToPeekTransition;
- (SBFFluidBehaviorSettings)alertBarSwipeDismissalSettings;
- (SBFFluidBehaviorSettings)alertCardifiedDismissalSettings;
- (SBFFluidBehaviorSettings)appSelectionSquishSettings;
- (SBFFluidBehaviorSettings)appToSwitcherCornerRadiusSettings;
- (SBFFluidBehaviorSettings)arcSwipeSettings;
- (SBFFluidBehaviorSettings)arcSwipeSwitcherGlancingSettings;
- (SBFFluidBehaviorSettings)backdropBlurSettings;
- (SBFFluidBehaviorSettings)bannerUnfurlSettings;
- (SBFFluidBehaviorSettings)bannerUnfurlWallpaperAlphaSettings;
- (SBFFluidBehaviorSettings)cardFlyInSettings;
- (SBFFluidBehaviorSettings)centerToSlideOverAnimationSettings;
- (SBFFluidBehaviorSettings)centerZoomOpacitySettings;
- (SBFFluidBehaviorSettings)centerZoomSettings;
- (SBFFluidBehaviorSettings)continuityBannerSlideUpSettings;
- (SBFFluidBehaviorSettings)crossblurDosidoSettings;
- (SBFFluidBehaviorSettings)crossfadeDosidoSettings;
- (SBFFluidBehaviorSettings)dosidoScaleDownSettings;
- (SBFFluidBehaviorSettings)dosidoScaleUpSettings;
- (SBFFluidBehaviorSettings)dosidoSettings;
- (SBFFluidBehaviorSettings)floatingDockIconFadeSettings;
- (SBFFluidBehaviorSettings)fullScreenToPeekFirstPhaseAnimationSettings;
- (SBFFluidBehaviorSettings)fullScreenToPeekSecondPhaseAnimationSettings;
- (SBFFluidBehaviorSettings)gestureInitiatedAppToSwitcherSettings;
- (SBFFluidBehaviorSettings)homeGestureBottomRowZoomDownLayoutSettings;
- (SBFFluidBehaviorSettings)homeGestureBottomRowZoomDownPositionSettings;
- (SBFFluidBehaviorSettings)homeGestureBottomRowZoomDownScaleSettings;
- (SBFFluidBehaviorSettings)homeGestureCenterRowZoomUpSettings;
- (SBFFluidBehaviorSettings)homeGestureEdgeRowZoomUpSettings;
- (SBFFluidBehaviorSettings)homeGestureLargeWidgetZoomDownLayoutSettings;
- (SBFFluidBehaviorSettings)homeGestureLargeWidgetZoomDownPositionSettings;
- (SBFFluidBehaviorSettings)homeGestureLargeWidgetZoomDownScaleSettings;
- (SBFFluidBehaviorSettings)homeGestureMediumWidgetZoomDownLayoutSettings;
- (SBFFluidBehaviorSettings)homeGestureMediumWidgetZoomDownPositionSettings;
- (SBFFluidBehaviorSettings)homeGestureMediumWidgetZoomDownScaleSettings;
- (SBFFluidBehaviorSettings)homeGestureSmallWidgetZoomDownLayoutSettings;
- (SBFFluidBehaviorSettings)homeGestureSmallWidgetZoomDownPositionSettings;
- (SBFFluidBehaviorSettings)homeGestureSmallWidgetZoomDownScaleSettings;
- (SBFFluidBehaviorSettings)homeGestureTopRowZoomDownLayoutSettings;
- (SBFFluidBehaviorSettings)homeGestureTopRowZoomDownPositionSettings;
- (SBFFluidBehaviorSettings)homeGestureTopRowZoomDownScaleSettings;
- (SBFFluidBehaviorSettings)homeScreenOpacitySettings;
- (SBFFluidBehaviorSettings)homeScreenScaleSettings;
- (SBFFluidBehaviorSettings)iconFadeInSettings;
- (SBFFluidBehaviorSettings)iconZoomDownSettings;
- (SBFFluidBehaviorSettings)launchAppFromSwitcherSettings;
- (SBFFluidBehaviorSettings)layoutSettings;
- (SBFFluidBehaviorSettings)opacitySettings;
- (SBFFluidBehaviorSettings)pulseScaleSettings;
- (SBFFluidBehaviorSettings)reduceMotionAppToSwitcherSettings;
- (SBFFluidBehaviorSettings)reduceMotionArcSwipeSettings;
- (SBFFluidBehaviorSettings)reopenButtonScaleSettings;
- (SBFFluidBehaviorSettings)siriSwipeDismissalSettings;
- (SBFFluidBehaviorSettings)slideOverSettings;
- (SBFFluidBehaviorSettings)slideOverToFullScreenAnimationSettings;
- (SBFFluidBehaviorSettings)slideUpSettings;
- (SBFFluidBehaviorSettings)splitViewToSlideOverSettings;
- (SBFFluidBehaviorSettings)stackedSwitcherTrackingSettings;
- (SBFFluidBehaviorSettings)statusBarFadeInSettings;
- (SBFFluidBehaviorSettings)statusBarFadeOutSettings;
- (SBFFluidBehaviorSettings)swapAppSidesLayoutAnimationSettings;
- (SBFFluidBehaviorSettings)swapAppSidesOpacityAnimationSettings;
- (SBFFluidBehaviorSettings)swipeToKillOpacitySettings;
- (SBFFluidBehaviorSettings)switcherFadeOutSettings;
- (SBFFluidBehaviorSettings)switcherToHomeOpacitySettings;
- (SBFFluidBehaviorSettings)switcherToHomeSettings;
- (SBFFluidBehaviorSettings)switcherZoomDownIconFadeOutSettings;
- (SBFFluidBehaviorSettings)toggleAppSwitcherSettings;
- (SBFFluidBehaviorSettings)wallpaperScaleSettings;
- (SBFFluidBehaviorSettings)zoomUpSettings;
- (double)alertBarSwipeDismissClientAnimationsDelay;
- (double)alertBarSwipeDismissHapticDelay;
- (double)alertBarSwipeDismissZoomOutDelay;
- (double)alertCardifiedDismissClientAnimationsDelay;
- (double)alertCardifiedDismissHapticDelay;
- (double)alertCardifiedDismissZoomOutDelay;
- (double)appSwitcherTitleAndIconFadeInSlowDownFactor;
- (double)appToSwitcherTransitionMinCardScaleFactor;
- (double)bannerUnfurlWallpaperAlphaDelay;
- (double)cardFlyInAccelerationDipThreshold;
- (double)centerZoomScale;
- (double)crossblurDosidoBlurRadius;
- (double)crossblurDosidoCenterZoomUpSmallScale;
- (double)crossblurDosidoLargeScale;
- (double)crossblurDosidoSmallScale;
- (double)crossblurRasterizationScale;
- (double)dimmingAlphaInApplication;
- (double)dimmingAlphaInSwitcher;
- (double)disableAsyncRenderingTransitionPercentage;
- (double)disableTapDuringMorphFromInAppViewTransitionDelay;
- (double)disallowAcceleratedHomeButtonPressTransitionPercentage;
- (double)dockHurdlingIconZoomDockToBackTiming;
- (double)dockHurdlingIconZoomDockToFrontTiming;
- (double)dockHurdlingIconZoomInitialVelocity;
- (double)dosidoScale;
- (double)dosidoScaleUpDelay;
- (double)emptySwitcherDismissDelay;
- (double)fullScreenToPeekSecondPhaseAnimationDelay;
- (double)homeScreenAlphaForMode:(int64_t)a3;
- (double)homeScreenBlurInApplication;
- (double)homeScreenBlurInAssistant;
- (double)homeScreenBlurInSwitcher;
- (double)homeScreenBlurInSwitcherReduceMotionEnabled;
- (double)homeScreenBlurProgressForMode:(int64_t)a3;
- (double)homeScreenCenterZoomInitialBlur;
- (double)homeScreenCenterZoomInitialOpacity;
- (double)homeScreenCenterZoomInitialScale;
- (double)homeScreenCenterZoomTargetScaleWhenUnblurringIsComplete;
- (double)homeScreenCenterZoomYOffsetPercentOfScreenHeight;
- (double)homeScreenDimmingAlphaForMode:(int64_t)a3;
- (double)homeScreenOpacityInApplication;
- (double)homeScreenOpacityInSwitcher;
- (double)homeScreenScaleForMode:(int64_t)a3;
- (double)homeScreenScaleInApplication;
- (double)homeScreenScaleInAssistant;
- (double)homeScreenScaleInSwitcher;
- (double)iconZoomFloatingDockFadeDelay;
- (double)pulseScale;
- (double)pulseSecondStageDelay;
- (double)reduceMotionCrossfadeDuration;
- (double)reduceMotionTriggerDelay;
- (double)reopenButtonFadeInDelay;
- (double)reopenButtonInitialScale;
- (double)resizeBlurDelay;
- (double)siriSwipeDismissClientAnimationsDelay;
- (double)siriSwipeDismissHapticDelay;
- (double)siriSwipeDismissZoomOutDelay;
- (double)slideOverToFullScreenOutgoingAppScaleBack;
- (double)slideOverToFullScreenOutgoingFinalOpacity;
- (double)statusBarFromApexBounceAnimationDuration;
- (double)statusBarToApexBounceAnimationDuration;
- (double)swapAppSidesShadowFadeOutDelay;
- (double)wallpaperScaleForMode:(int64_t)a3;
- (double)wallpaperScaleInApplication;
- (double)wallpaperScaleInSwitcher;
- (double)zoomDownVelocityXMaximum;
- (double)zoomDownVelocityXMinimum;
- (double)zoomDownVelocityXPositionResponseMultiplier;
- (double)zoomDownVelocityYLayoutResponseMultiplier;
- (double)zoomDownVelocityYMaximum;
- (double)zoomDownVelocityYMinimum;
- (double)zoomDownWidgetScaleOvershootDuration;
- (double)zoomDownWidgetScaleOvershootMaximumMultiplier;
- (double)zoomDownWidgetScaleOvershootMinimumMultiplier;
- (double)zoomDownWidgetScaleVelocityYMaximum;
- (double)zoomDownWidgetScaleVelocityYMinimum;
- (int64_t)minimumTouchSamplesForAccelerationDip;
- (void)_setEntityPresentationDefaultValues;
- (void)_setHomeGestureAnimationDefaultValues;
- (void)_setKeyboardShortcutDefaultValues;
- (void)_setTopAffordanceTransitionDefaultValues;
- (void)setAlertBarSwipeDismissClientAnimationsDelay:(double)a3;
- (void)setAlertBarSwipeDismissHapticDelay:(double)a3;
- (void)setAlertBarSwipeDismissZoomOutDelay:(double)a3;
- (void)setAlertBarSwipeDismissalSettings:(id)a3;
- (void)setAlertCardifiedDismissClientAnimationsDelay:(double)a3;
- (void)setAlertCardifiedDismissHapticDelay:(double)a3;
- (void)setAlertCardifiedDismissZoomOutDelay:(double)a3;
- (void)setAlertCardifiedDismissalSettings:(id)a3;
- (void)setAllowIconZoomFromLargeWidgets:(BOOL)a3;
- (void)setAllowIconZoomFromMediumWidgets:(BOOL)a3;
- (void)setAppSelectionSquishSettings:(id)a3;
- (void)setAppSwitcherTitleAndIconFadeInSlowDownFactor:(double)a3;
- (void)setAppToSwitcherCornerRadiusSettings:(id)a3;
- (void)setAppToSwitcherTransitionMinCardScaleFactor:(double)a3;
- (void)setArcSwipeSettings:(id)a3;
- (void)setArcSwipeSwitcherGlancingSettings:(id)a3;
- (void)setBackdropBlurSettings:(id)a3;
- (void)setBannerUnfurlSettings:(id)a3;
- (void)setBannerUnfurlWallpaperAlphaDelay:(double)a3;
- (void)setBannerUnfurlWallpaperAlphaSettings:(id)a3;
- (void)setCardFlyInAccelerationDipThreshold:(double)a3;
- (void)setCardFlyInSettings:(id)a3;
- (void)setCenterToSlideOverAnimationSettings:(id)a3;
- (void)setCenterZoomOpacitySettings:(id)a3;
- (void)setCenterZoomScale:(double)a3;
- (void)setCenterZoomSettings:(id)a3;
- (void)setContinuityBannerSlideUpSettings:(id)a3;
- (void)setCrossblurDosidoBlurRadius:(double)a3;
- (void)setCrossblurDosidoCenterZoomUpSmallScale:(double)a3;
- (void)setCrossblurDosidoLargeScale:(double)a3;
- (void)setCrossblurDosidoSettings:(id)a3;
- (void)setCrossblurDosidoSmallScale:(double)a3;
- (void)setCrossblurRasterizationScale:(double)a3;
- (void)setCrossfadeDosidoSettings:(id)a3;
- (void)setDefaultValues;
- (void)setDimmingAlphaInApplication:(double)a3;
- (void)setDimmingAlphaInSwitcher:(double)a3;
- (void)setDisableAsyncRenderingTransitionPercentage:(double)a3;
- (void)setDisableTapDuringMorphFromInAppViewTransitionDelay:(double)a3;
- (void)setDisallowAcceleratedHomeButtonPressTransitionPercentage:(double)a3;
- (void)setDockHurdlingIconZoomDockToBackTiming:(double)a3;
- (void)setDockHurdlingIconZoomDockToFrontTiming:(double)a3;
- (void)setDockHurdlingIconZoomInitialVelocity:(double)a3;
- (void)setDosidoScale:(double)a3;
- (void)setDosidoScaleDownSettings:(id)a3;
- (void)setDosidoScaleUpDelay:(double)a3;
- (void)setDosidoScaleUpSettings:(id)a3;
- (void)setDosidoSettings:(id)a3;
- (void)setEmptySwitcherDismissDelay:(double)a3;
- (void)setFloatingDockIconFadeSettings:(id)a3;
- (void)setFullScreenToPeekFirstPhaseAnimationSettings:(id)a3;
- (void)setFullScreenToPeekSecondPhaseAnimationDelay:(double)a3;
- (void)setFullScreenToPeekSecondPhaseAnimationSettings:(id)a3;
- (void)setGestureInitiatedAppToSwitcherSettings:(id)a3;
- (void)setHomeGestureBottomRowZoomDownLayoutSettings:(id)a3;
- (void)setHomeGestureBottomRowZoomDownPositionSettings:(id)a3;
- (void)setHomeGestureBottomRowZoomDownScaleSettings:(id)a3;
- (void)setHomeGestureCenterRowZoomUpSettings:(id)a3;
- (void)setHomeGestureEdgeRowZoomUpSettings:(id)a3;
- (void)setHomeGestureLargeWidgetZoomDownLayoutSettings:(id)a3;
- (void)setHomeGestureLargeWidgetZoomDownPositionSettings:(id)a3;
- (void)setHomeGestureLargeWidgetZoomDownScaleSettings:(id)a3;
- (void)setHomeGestureMediumWidgetZoomDownLayoutSettings:(id)a3;
- (void)setHomeGestureMediumWidgetZoomDownPositionSettings:(id)a3;
- (void)setHomeGestureMediumWidgetZoomDownScaleSettings:(id)a3;
- (void)setHomeGestureSmallWidgetZoomDownLayoutSettings:(id)a3;
- (void)setHomeGestureSmallWidgetZoomDownPositionSettings:(id)a3;
- (void)setHomeGestureSmallWidgetZoomDownScaleSettings:(id)a3;
- (void)setHomeGestureTopRowZoomDownLayoutSettings:(id)a3;
- (void)setHomeGestureTopRowZoomDownPositionSettings:(id)a3;
- (void)setHomeGestureTopRowZoomDownScaleSettings:(id)a3;
- (void)setHomeScreenBlurInApplication:(double)a3;
- (void)setHomeScreenBlurInAssistant:(double)a3;
- (void)setHomeScreenBlurInSwitcher:(double)a3;
- (void)setHomeScreenBlurInSwitcherReduceMotionEnabled:(double)a3;
- (void)setHomeScreenCenterZoomInitialBlur:(double)a3;
- (void)setHomeScreenCenterZoomInitialOpacity:(double)a3;
- (void)setHomeScreenCenterZoomInitialScale:(double)a3;
- (void)setHomeScreenCenterZoomTargetScaleWhenUnblurringIsComplete:(double)a3;
- (void)setHomeScreenCenterZoomYOffsetPercentOfScreenHeight:(double)a3;
- (void)setHomeScreenOpacityInApplication:(double)a3;
- (void)setHomeScreenOpacityInSwitcher:(double)a3;
- (void)setHomeScreenOpacitySettings:(id)a3;
- (void)setHomeScreenScaleInApplication:(double)a3;
- (void)setHomeScreenScaleInAssistant:(double)a3;
- (void)setHomeScreenScaleInSwitcher:(double)a3;
- (void)setHomeScreenScaleSettings:(id)a3;
- (void)setIconFadeInSettings:(id)a3;
- (void)setIconZoomDownSettings:(id)a3;
- (void)setIconZoomFloatingDockFadeDelay:(double)a3;
- (void)setLaunchAppFromSwitcherSettings:(id)a3;
- (void)setLayoutSettings:(id)a3;
- (void)setMinimumTouchSamplesForAccelerationDip:(int64_t)a3;
- (void)setOpacitySettings:(id)a3;
- (void)setPerformTwoPhaseFullScreenToPeekTransition:(BOOL)a3;
- (void)setPulseScale:(double)a3;
- (void)setPulseScaleSettings:(id)a3;
- (void)setPulseSecondStageDelay:(double)a3;
- (void)setReduceMotionAppToSwitcherSettings:(id)a3;
- (void)setReduceMotionArcSwipeSettings:(id)a3;
- (void)setReduceMotionCrossfadeDuration:(double)a3;
- (void)setReduceMotionTriggerDelay:(double)a3;
- (void)setReopenButtonFadeInDelay:(double)a3;
- (void)setReopenButtonInitialScale:(double)a3;
- (void)setReopenButtonScaleSettings:(id)a3;
- (void)setResizeBlurDelay:(double)a3;
- (void)setSiriSwipeDismissClientAnimationsDelay:(double)a3;
- (void)setSiriSwipeDismissHapticDelay:(double)a3;
- (void)setSiriSwipeDismissZoomOutDelay:(double)a3;
- (void)setSiriSwipeDismissalSettings:(id)a3;
- (void)setSlideOverSettings:(id)a3;
- (void)setSlideOverToFullScreenAnimationSettings:(id)a3;
- (void)setSlideOverToFullScreenOutgoingAppScaleBack:(double)a3;
- (void)setSlideOverToFullScreenOutgoingFinalOpacity:(double)a3;
- (void)setSlideUpSettings:(id)a3;
- (void)setSplitViewToSlideOverSettings:(id)a3;
- (void)setStackedSwitcherTrackingSettings:(id)a3;
- (void)setStatusBarFadeInSettings:(id)a3;
- (void)setStatusBarFadeOutSettings:(id)a3;
- (void)setStatusBarFromApexBounceAnimationDuration:(double)a3;
- (void)setStatusBarToApexBounceAnimationDuration:(double)a3;
- (void)setSwapAppSidesLayoutAnimationSettings:(id)a3;
- (void)setSwapAppSidesOpacityAnimationSettings:(id)a3;
- (void)setSwapAppSidesShadowFadeOutDelay:(double)a3;
- (void)setSwipeToKillOpacitySettings:(id)a3;
- (void)setSwitcherFadeOutSettings:(id)a3;
- (void)setSwitcherToHomeOpacitySettings:(id)a3;
- (void)setSwitcherToHomeSettings:(id)a3;
- (void)setSwitcherZoomDownIconFadeOutSettings:(id)a3;
- (void)setToggleAppSwitcherSettings:(id)a3;
- (void)setWallpaperScaleInApplication:(double)a3;
- (void)setWallpaperScaleInSwitcher:(double)a3;
- (void)setWallpaperScaleSettings:(id)a3;
- (void)setZoomDownVelocityXMaximum:(double)a3;
- (void)setZoomDownVelocityXMinimum:(double)a3;
- (void)setZoomDownVelocityXPositionResponseMultiplier:(double)a3;
- (void)setZoomDownVelocityYLayoutResponseMultiplier:(double)a3;
- (void)setZoomDownVelocityYMaximum:(double)a3;
- (void)setZoomDownVelocityYMinimum:(double)a3;
- (void)setZoomDownWidgetScaleOvershootDuration:(double)a3;
- (void)setZoomDownWidgetScaleOvershootMaximumMultiplier:(double)a3;
- (void)setZoomDownWidgetScaleOvershootMinimumMultiplier:(double)a3;
- (void)setZoomDownWidgetScaleVelocityYMaximum:(double)a3;
- (void)setZoomDownWidgetScaleVelocityYMinimum:(double)a3;
- (void)setZoomUpSettings:(id)a3;
@end

@implementation SBFluidSwitcherAnimationSettings

- (SBFFluidBehaviorSettings)layoutSettings
{
  return self->_layoutSettings;
}

- (SBFFluidBehaviorSettings)opacitySettings
{
  return self->_opacitySettings;
}

- (SBFFluidBehaviorSettings)homeGestureEdgeRowZoomUpSettings
{
  return self->_homeGestureEdgeRowZoomUpSettings;
}

- (SBFFluidBehaviorSettings)homeGestureCenterRowZoomUpSettings
{
  return self->_homeGestureCenterRowZoomUpSettings;
}

- (SBFFluidBehaviorSettings)backdropBlurSettings
{
  return self->_backdropBlurSettings;
}

- (SBFFluidBehaviorSettings)homeScreenScaleSettings
{
  return self->_homeScreenScaleSettings;
}

- (SBFFluidBehaviorSettings)wallpaperScaleSettings
{
  return self->_wallpaperScaleSettings;
}

- (SBFFluidBehaviorSettings)homeScreenOpacitySettings
{
  return self->_homeScreenOpacitySettings;
}

- (double)wallpaperScaleInApplication
{
  return self->_wallpaperScaleInApplication;
}

- (double)homeScreenScaleInApplication
{
  return self->_homeScreenScaleInApplication;
}

- (double)homeScreenOpacityInApplication
{
  return self->_homeScreenOpacityInApplication;
}

- (SBFFluidBehaviorSettings)statusBarFadeInSettings
{
  return self->_statusBarFadeInSettings;
}

- (SBFFluidBehaviorSettings)statusBarFadeOutSettings
{
  return self->_statusBarFadeOutSettings;
}

- (double)dimmingAlphaInApplication
{
  return self->_dimmingAlphaInApplication;
}

- (double)homeScreenBlurInApplication
{
  return self->_homeScreenBlurInApplication;
}

- (double)crossblurRasterizationScale
{
  return self->_crossblurRasterizationScale;
}

- (SBFFluidBehaviorSettings)crossblurDosidoSettings
{
  return self->_crossblurDosidoSettings;
}

- (double)crossblurDosidoBlurRadius
{
  return self->_crossblurDosidoBlurRadius;
}

- (double)disallowAcceleratedHomeButtonPressTransitionPercentage
{
  return self->_disallowAcceleratedHomeButtonPressTransitionPercentage;
}

- (double)disableAsyncRenderingTransitionPercentage
{
  return self->_disableAsyncRenderingTransitionPercentage;
}

- (double)homeScreenScaleForMode:(int64_t)a3
{
  if (a3 == 3)
  {
    [(SBFluidSwitcherAnimationSettings *)self homeScreenScaleInApplication];
  }
  else if (a3 == 2 && !UIAccessibilityIsReduceTransparencyEnabled())
  {
    [(SBFluidSwitcherAnimationSettings *)self homeScreenScaleInSwitcher];
  }
  else
  {
    return 1.0;
  }
  return result;
}

- (double)homeScreenScaleInSwitcher
{
  return self->_homeScreenScaleInSwitcher;
}

- (void)setDefaultValues
{
  uint64_t v160 = *MEMORY[0x1E4F143B8];
  v3 = [(SBFluidSwitcherAnimationSettings *)self layoutSettings];
  [v3 setDefaultValues];

  v4 = [(SBFluidSwitcherAnimationSettings *)self layoutSettings];
  CAFrameRateRange v161 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v4, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v161.minimum, *(double *)&v161.maximum, *(double *)&v161.preferred);

  v5 = [(SBFluidSwitcherAnimationSettings *)self zoomUpSettings];
  [v5 setDefaultCriticallyDampedValues];

  v6 = [(SBFluidSwitcherAnimationSettings *)self zoomUpSettings];
  CAFrameRateRange v162 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v6, "setFrameRateRange:highFrameRateReason:", 1114114, *(double *)&v162.minimum, *(double *)&v162.maximum, *(double *)&v162.preferred);

  v7 = [(SBFluidSwitcherAnimationSettings *)self iconZoomDownSettings];
  [v7 setDefaultCriticallyDampedValues];

  v8 = [(SBFluidSwitcherAnimationSettings *)self centerZoomSettings];
  [v8 setDefaultCriticallyDampedValues];

  v9 = [(SBFluidSwitcherAnimationSettings *)self centerZoomSettings];
  CAFrameRateRange v163 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v9, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v163.minimum, *(double *)&v163.maximum, *(double *)&v163.preferred);

  v10 = [(SBFluidSwitcherAnimationSettings *)self slideOverSettings];
  [v10 setDefaultCriticallyDampedValues];

  v11 = [(SBFluidSwitcherAnimationSettings *)self slideOverSettings];
  CAFrameRateRange v164 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v11, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v164.minimum, *(double *)&v164.maximum, *(double *)&v164.preferred);

  v12 = [(SBFluidSwitcherAnimationSettings *)self toggleAppSwitcherSettings];
  [v12 setDefaultCriticallyDampedValues];

  v13 = [(SBFluidSwitcherAnimationSettings *)self toggleAppSwitcherSettings];
  CAFrameRateRange v165 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v13, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v165.minimum, *(double *)&v165.maximum, *(double *)&v165.preferred);

  v14 = [(SBFluidSwitcherAnimationSettings *)self launchAppFromSwitcherSettings];
  [v14 setDefaultCriticallyDampedValues];

  v15 = [(SBFluidSwitcherAnimationSettings *)self launchAppFromSwitcherSettings];
  CAFrameRateRange v166 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v15, "setFrameRateRange:highFrameRateReason:", 1114114, *(double *)&v166.minimum, *(double *)&v166.maximum, *(double *)&v166.preferred);

  v16 = [(SBFluidSwitcherAnimationSettings *)self continuityBannerSlideUpSettings];
  [v16 setDampingRatio:1.0];

  v17 = [(SBFluidSwitcherAnimationSettings *)self continuityBannerSlideUpSettings];
  [v17 setResponse:0.4];

  v18 = [(SBFluidSwitcherAnimationSettings *)self continuityBannerSlideUpSettings];
  CAFrameRateRange v167 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v18, "setFrameRateRange:highFrameRateReason:", 1114114, *(double *)&v167.minimum, *(double *)&v167.maximum, *(double *)&v167.preferred);

  v19 = [(SBFluidSwitcherAnimationSettings *)self stackedSwitcherTrackingSettings];
  objc_msgSend(v19, "setTrackingDampingRatio:");

  v20 = [(SBFluidSwitcherAnimationSettings *)self stackedSwitcherTrackingSettings];
  [v20 setTrackingResponse:0.14];

  v21 = [(SBFluidSwitcherAnimationSettings *)self stackedSwitcherTrackingSettings];
  CAFrameRateRange v168 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v21, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v168.minimum, *(double *)&v168.maximum, *(double *)&v168.preferred);

  [(SBFluidSwitcherAnimationSettings *)self _setTopAffordanceTransitionDefaultValues];
  [(SBFluidSwitcherAnimationSettings *)self _setEntityPresentationDefaultValues];
  [(SBFluidSwitcherAnimationSettings *)self _setKeyboardShortcutDefaultValues];
  [(SBFluidSwitcherAnimationSettings *)self _setHomeGestureAnimationDefaultValues];
  v22 = [(SBFluidSwitcherAnimationSettings *)self dosidoSettings];
  [v22 setDampingRatio:1.0];

  v23 = [(SBFluidSwitcherAnimationSettings *)self dosidoSettings];
  [v23 setResponse:0.442];

  v24 = [(SBFluidSwitcherAnimationSettings *)self dosidoSettings];
  CAFrameRateRange v169 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v24, "setFrameRateRange:highFrameRateReason:", 1114116, *(double *)&v169.minimum, *(double *)&v169.maximum, *(double *)&v169.preferred);

  v25 = [(SBFluidSwitcherAnimationSettings *)self dosidoScaleDownSettings];
  [v25 setDampingRatio:1.0];

  v26 = [(SBFluidSwitcherAnimationSettings *)self dosidoScaleDownSettings];
  [v26 setResponse:0.331];

  v27 = [(SBFluidSwitcherAnimationSettings *)self dosidoScaleDownSettings];
  CAFrameRateRange v170 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v27, "setFrameRateRange:highFrameRateReason:", 1114116, *(double *)&v170.minimum, *(double *)&v170.maximum, *(double *)&v170.preferred);

  v28 = [(SBFluidSwitcherAnimationSettings *)self dosidoScaleUpSettings];
  [v28 setDampingRatio:1.0];

  v29 = [(SBFluidSwitcherAnimationSettings *)self dosidoScaleUpSettings];
  [v29 setResponse:0.491];

  v30 = [(SBFluidSwitcherAnimationSettings *)self dosidoScaleUpSettings];
  CAFrameRateRange v171 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v30, "setFrameRateRange:highFrameRateReason:", 1114116, *(double *)&v171.minimum, *(double *)&v171.maximum, *(double *)&v171.preferred);

  [(SBFluidSwitcherAnimationSettings *)self setDosidoScale:0.8];
  [(SBFluidSwitcherAnimationSettings *)self setDosidoScaleUpDelay:0.137];
  v31 = [(SBFluidSwitcherAnimationSettings *)self crossblurDosidoSettings];
  [v31 setDampingRatio:1.0];

  v32 = [(SBFluidSwitcherAnimationSettings *)self crossblurDosidoSettings];
  [v32 setResponse:0.442];

  v33 = [(SBFluidSwitcherAnimationSettings *)self crossblurDosidoSettings];
  CAFrameRateRange v172 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v33, "setFrameRateRange:highFrameRateReason:", 1114116, *(double *)&v172.minimum, *(double *)&v172.maximum, *(double *)&v172.preferred);

  v34 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v35 = [v34 userInterfaceIdiom];

  [(SBFluidSwitcherAnimationSettings *)self setCrossblurDosidoSmallScale:dbl_1D8FD05C0[(v35 & 0xFFFFFFFFFFFFFFFBLL) == 1]];
  if (__sb__runningInSpringBoard())
  {
    int v36 = SBFEffectiveDeviceClass();
    double v37 = 0.92;
    if (v36 != 2) {
      double v37 = 0.5;
    }
    [(SBFluidSwitcherAnimationSettings *)self setCrossblurDosidoCenterZoomUpSmallScale:v37];
  }
  else
  {
    v38 = [MEMORY[0x1E4F42948] currentDevice];
    uint64_t v39 = [v38 userInterfaceIdiom];
    double v40 = 0.92;
    if (v39 != 1) {
      double v40 = 0.5;
    }
    [(SBFluidSwitcherAnimationSettings *)self setCrossblurDosidoCenterZoomUpSmallScale:v40];
  }
  -[SBFluidSwitcherAnimationSettings setCrossblurDosidoLargeScale:](self, "setCrossblurDosidoLargeScale:");
  [(SBFluidSwitcherAnimationSettings *)self setCrossblurDosidoBlurRadius:6.0];
  [(SBFluidSwitcherAnimationSettings *)self setCrossblurRasterizationScale:0.8];
  v41 = [(SBFluidSwitcherAnimationSettings *)self crossfadeDosidoSettings];
  [v41 setDampingRatio:1.0];

  v42 = [(SBFluidSwitcherAnimationSettings *)self crossfadeDosidoSettings];
  [v42 setResponse:0.24];

  [(SBFluidSwitcherAnimationSettings *)self setAppToSwitcherTransitionMinCardScaleFactor:0.97];
  if (__sb__runningInSpringBoard())
  {
    int v43 = SBFEffectiveDeviceClass();
    double v44 = 0.6;
    if (v43 == 2) {
      double v44 = 1.0;
    }
    [(SBFluidSwitcherAnimationSettings *)self setDisableAsyncRenderingTransitionPercentage:v44];
  }
  else
  {
    v45 = [MEMORY[0x1E4F42948] currentDevice];
    uint64_t v46 = [v45 userInterfaceIdiom];
    double v47 = 0.6;
    if (v46 == 1) {
      double v47 = 1.0;
    }
    [(SBFluidSwitcherAnimationSettings *)self setDisableAsyncRenderingTransitionPercentage:v47];
  }
  [(SBFluidSwitcherAnimationSettings *)self setDisallowAcceleratedHomeButtonPressTransitionPercentage:0.6];
  [(SBFluidSwitcherAnimationSettings *)self setDisableTapDuringMorphFromInAppViewTransitionDelay:0.25];
  [(SBFluidSwitcherAnimationSettings *)self setDockHurdlingIconZoomInitialVelocity:-4500.0];
  [(SBFluidSwitcherAnimationSettings *)self setDockHurdlingIconZoomDockToBackTiming:0.07];
  [(SBFluidSwitcherAnimationSettings *)self setDockHurdlingIconZoomDockToFrontTiming:0.215];
  v48 = [(SBFluidSwitcherAnimationSettings *)self backdropBlurSettings];
  [v48 setBehaviorType:1];

  v49 = [(SBFluidSwitcherAnimationSettings *)self backdropBlurSettings];
  [v49 setDampingRatio:0.776];

  v50 = [(SBFluidSwitcherAnimationSettings *)self backdropBlurSettings];
  [v50 setResponse:0.574];

  v51 = [(SBFluidSwitcherAnimationSettings *)self backdropBlurSettings];
  [v51 setRetargetImpulse:0.006];

  v52 = [(SBFluidSwitcherAnimationSettings *)self homeScreenOpacitySettings];
  [v52 setBehaviorType:1];

  v53 = [(SBFluidSwitcherAnimationSettings *)self homeScreenOpacitySettings];
  [v53 setDampingRatio:0.601];

  v54 = [(SBFluidSwitcherAnimationSettings *)self homeScreenOpacitySettings];
  [v54 setResponse:0.444];

  v55 = [(SBFluidSwitcherAnimationSettings *)self homeScreenScaleSettings];
  [v55 setBehaviorType:2];

  v56 = [(SBFluidSwitcherAnimationSettings *)self homeScreenScaleSettings];
  [v56 setDampingRatio:0.783];

  v57 = [(SBFluidSwitcherAnimationSettings *)self homeScreenScaleSettings];
  [v57 setResponse:0.702];

  v58 = [(SBFluidSwitcherAnimationSettings *)self homeScreenScaleSettings];
  CAFrameRateRange v173 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v58, "setFrameRateRange:highFrameRateReason:", 1114117, *(double *)&v173.minimum, *(double *)&v173.maximum, *(double *)&v173.preferred);

  v59 = [(SBFluidSwitcherAnimationSettings *)self opacitySettings];
  [v59 setBehaviorType:1];

  v60 = [(SBFluidSwitcherAnimationSettings *)self opacitySettings];
  [v60 setDampingRatio:1.0];

  v61 = [(SBFluidSwitcherAnimationSettings *)self opacitySettings];
  [v61 setResponse:0.314];

  v62 = [(SBFluidSwitcherAnimationSettings *)self centerZoomOpacitySettings];
  [v62 setBehaviorType:1];

  v63 = [(SBFluidSwitcherAnimationSettings *)self centerZoomOpacitySettings];
  [v63 setDampingRatio:4.33];

  v64 = [(SBFluidSwitcherAnimationSettings *)self centerZoomOpacitySettings];
  [v64 setResponse:0.1];

  v65 = [(SBFluidSwitcherAnimationSettings *)self swipeToKillOpacitySettings];
  [v65 setBehaviorType:1];

  v66 = [(SBFluidSwitcherAnimationSettings *)self swipeToKillOpacitySettings];
  [v66 setDampingRatio:1.0];

  v67 = [(SBFluidSwitcherAnimationSettings *)self swipeToKillOpacitySettings];
  [v67 setResponse:0.25];

  v68 = [(SBFluidSwitcherAnimationSettings *)self wallpaperScaleSettings];
  [v68 setBehaviorType:1];

  v69 = [(SBFluidSwitcherAnimationSettings *)self wallpaperScaleSettings];
  [v69 setDampingRatio:1.0];

  v70 = [(SBFluidSwitcherAnimationSettings *)self wallpaperScaleSettings];
  [v70 setResponse:0.75];

  v71 = [(SBFluidSwitcherAnimationSettings *)self appSelectionSquishSettings];
  [v71 setBehaviorType:1];

  v72 = [(SBFluidSwitcherAnimationSettings *)self appSelectionSquishSettings];
  [v72 setDampingRatio:0.975];

  v73 = [(SBFluidSwitcherAnimationSettings *)self appSelectionSquishSettings];
  [v73 setResponse:0.35];

  v74 = [(SBFluidSwitcherAnimationSettings *)self appSelectionSquishSettings];
  CAFrameRateRange v174 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v74, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v174.minimum, *(double *)&v174.maximum, *(double *)&v174.preferred);

  v75 = [(SBFluidSwitcherAnimationSettings *)self statusBarFadeInSettings];
  [v75 setDefaultValues];

  v76 = [(SBFluidSwitcherAnimationSettings *)self statusBarFadeInSettings];
  [v76 setDampingRatio:1.0];

  v77 = [(SBFluidSwitcherAnimationSettings *)self statusBarFadeInSettings];
  [v77 setResponse:0.6];

  v78 = [(SBFluidSwitcherAnimationSettings *)self statusBarFadeOutSettings];
  [v78 setDefaultValues];

  v79 = [(SBFluidSwitcherAnimationSettings *)self statusBarFadeOutSettings];
  [v79 setDampingRatio:1.0];

  v80 = [(SBFluidSwitcherAnimationSettings *)self statusBarFadeOutSettings];
  [v80 setResponse:0.4];

  [(SBFluidSwitcherAnimationSettings *)self setStatusBarToApexBounceAnimationDuration:0.2];
  [(SBFluidSwitcherAnimationSettings *)self setStatusBarFromApexBounceAnimationDuration:0.8];
  v81 = [(SBFluidSwitcherAnimationSettings *)self reopenButtonScaleSettings];
  [v81 setDefaultValues];

  v82 = [(SBFluidSwitcherAnimationSettings *)self reopenButtonScaleSettings];
  [v82 setDampingRatio:0.75];

  v83 = [(SBFluidSwitcherAnimationSettings *)self reopenButtonScaleSettings];
  [v83 setResponse:0.375];

  [(SBFluidSwitcherAnimationSettings *)self setReopenButtonInitialScale:0.9];
  [(SBFluidSwitcherAnimationSettings *)self setReopenButtonFadeInDelay:0.3];
  v84 = [(SBFluidSwitcherAnimationSettings *)self alertCardifiedDismissalSettings];
  [v84 setDefaultValues];

  v85 = [(SBFluidSwitcherAnimationSettings *)self alertCardifiedDismissalSettings];
  [v85 setDampingRatio:0.748];

  v86 = [(SBFluidSwitcherAnimationSettings *)self alertCardifiedDismissalSettings];
  [v86 setResponse:0.435];

  v87 = [(SBFluidSwitcherAnimationSettings *)self alertCardifiedDismissalSettings];
  [v87 setSmoothingAndProjectionEnabled:1];

  v88 = [(SBFluidSwitcherAnimationSettings *)self alertCardifiedDismissalSettings];
  [v88 setInertialTargetSmoothingRatio:0.4];

  v89 = [(SBFluidSwitcherAnimationSettings *)self alertCardifiedDismissalSettings];
  [v89 setInertialProjectionDeceleration:0.995];

  [(SBFluidSwitcherAnimationSettings *)self setAlertCardifiedDismissHapticDelay:0.34];
  [(SBFluidSwitcherAnimationSettings *)self setAlertCardifiedDismissZoomOutDelay:0.1];
  [(SBFluidSwitcherAnimationSettings *)self setAlertCardifiedDismissClientAnimationsDelay:0.2];
  v90 = [(SBFluidSwitcherAnimationSettings *)self alertCardifiedDismissalSettings];
  CAFrameRateRange v175 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v90, "setFrameRateRange:highFrameRateReason:", 1114115, *(double *)&v175.minimum, *(double *)&v175.maximum, *(double *)&v175.preferred);

  v91 = [(SBFluidSwitcherAnimationSettings *)self alertBarSwipeDismissalSettings];
  [v91 setDefaultValues];

  v92 = [(SBFluidSwitcherAnimationSettings *)self alertBarSwipeDismissalSettings];
  [v92 setDampingRatio:0.471];

  v93 = [(SBFluidSwitcherAnimationSettings *)self alertBarSwipeDismissalSettings];
  [v93 setResponse:0.299];

  [(SBFluidSwitcherAnimationSettings *)self setAlertBarSwipeDismissHapticDelay:0.0];
  [(SBFluidSwitcherAnimationSettings *)self setAlertBarSwipeDismissZoomOutDelay:0.1];
  [(SBFluidSwitcherAnimationSettings *)self setAlertBarSwipeDismissClientAnimationsDelay:0.0];
  v94 = [(SBFluidSwitcherAnimationSettings *)self alertBarSwipeDismissalSettings];
  CAFrameRateRange v176 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v94, "setFrameRateRange:highFrameRateReason:", 1114115, *(double *)&v176.minimum, *(double *)&v176.maximum, *(double *)&v176.preferred);

  v95 = [(SBFluidSwitcherAnimationSettings *)self siriSwipeDismissalSettings];
  [v95 setDefaultValues];

  v96 = [(SBFluidSwitcherAnimationSettings *)self siriSwipeDismissalSettings];
  [v96 setDampingRatio:1.1];

  v97 = [(SBFluidSwitcherAnimationSettings *)self siriSwipeDismissalSettings];
  [v97 setResponse:0.45];

  [(SBFluidSwitcherAnimationSettings *)self setSiriSwipeDismissHapticDelay:0.25];
  [(SBFluidSwitcherAnimationSettings *)self setSiriSwipeDismissZoomOutDelay:0.06];
  [(SBFluidSwitcherAnimationSettings *)self setSiriSwipeDismissClientAnimationsDelay:0.75];
  v98 = [(SBFluidSwitcherAnimationSettings *)self siriSwipeDismissalSettings];
  CAFrameRateRange v177 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v98, "setFrameRateRange:highFrameRateReason:", 1114115, *(double *)&v177.minimum, *(double *)&v177.maximum, *(double *)&v177.preferred);

  v99 = [(SBFluidSwitcherAnimationSettings *)self bannerUnfurlSettings];
  [v99 setDefaultValues];

  v100 = [(SBFluidSwitcherAnimationSettings *)self bannerUnfurlSettings];
  [v100 setDampingRatio:1.0];

  v101 = [(SBFluidSwitcherAnimationSettings *)self bannerUnfurlSettings];
  [v101 setResponse:0.4];

  v102 = [(SBFluidSwitcherAnimationSettings *)self bannerUnfurlSettings];
  CAFrameRateRange v178 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v102, "setFrameRateRange:highFrameRateReason:", 1114114, *(double *)&v178.minimum, *(double *)&v178.maximum, *(double *)&v178.preferred);

  v103 = [(SBFluidSwitcherAnimationSettings *)self bannerUnfurlWallpaperAlphaSettings];
  [v103 setDefaultValues];

  v104 = [(SBFluidSwitcherAnimationSettings *)self bannerUnfurlWallpaperAlphaSettings];
  [v104 setDampingRatio:1.0];

  v105 = [(SBFluidSwitcherAnimationSettings *)self bannerUnfurlWallpaperAlphaSettings];
  [v105 setResponse:0.39];

  [(SBFluidSwitcherAnimationSettings *)self setBannerUnfurlWallpaperAlphaDelay:0.025];
  v106 = [(SBFluidSwitcherAnimationSettings *)self switcherToHomeSettings];
  [v106 setDampingRatio:1.0];

  v107 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v108 = [v107 userInterfaceIdiom];

  double v109 = dbl_1D8FD05D0[(v108 & 0xFFFFFFFFFFFFFFFBLL) == 1];
  v110 = [(SBFluidSwitcherAnimationSettings *)self switcherToHomeSettings];
  [v110 setResponse:v109];

  v111 = [(SBFluidSwitcherAnimationSettings *)self switcherToHomeSettings];
  CAFrameRateRange v179 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v111, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v179.minimum, *(double *)&v179.maximum, *(double *)&v179.preferred);

  v112 = [(SBFluidSwitcherAnimationSettings *)self switcherToHomeOpacitySettings];
  [v112 setBehaviorType:1];

  v113 = [(SBFluidSwitcherAnimationSettings *)self switcherToHomeOpacitySettings];
  [v113 setResponse:0.0];

  [(SBFluidSwitcherAnimationSettings *)self setReduceMotionCrossfadeDuration:0.3];
  v114 = [(SBFluidSwitcherAnimationSettings *)self floatingDockIconFadeSettings];
  [v114 setResponse:0.21];

  v115 = [(SBFluidSwitcherAnimationSettings *)self floatingDockIconFadeSettings];
  [v115 setDampingRatio:1.0];

  [(SBFluidSwitcherAnimationSettings *)self setIconZoomFloatingDockFadeDelay:0.1];
  v116 = [(SBFluidSwitcherAnimationSettings *)self switcherZoomDownIconFadeOutSettings];
  [v116 setResponse:0.25];

  v117 = [(SBFluidSwitcherAnimationSettings *)self switcherZoomDownIconFadeOutSettings];
  [v117 setDampingRatio:1.0];

  v118 = [(SBFluidSwitcherAnimationSettings *)self iconFadeInSettings];
  [v118 setResponse:0.5];

  v119 = [(SBFluidSwitcherAnimationSettings *)self iconFadeInSettings];
  [v119 setDampingRatio:1.0];

  v120 = [(SBFluidSwitcherAnimationSettings *)self switcherFadeOutSettings];
  [v120 setResponse:0.15];

  v121 = [(SBFluidSwitcherAnimationSettings *)self switcherFadeOutSettings];
  [v121 setDampingRatio:1.0];

  [(SBFluidSwitcherAnimationSettings *)self setEmptySwitcherDismissDelay:0.2];
  [(SBFluidSwitcherAnimationSettings *)self setResizeBlurDelay:0.1];
  [(SBFluidSwitcherAnimationSettings *)self setAppSwitcherTitleAndIconFadeInSlowDownFactor:2.2];
  [(SBFluidSwitcherAnimationSettings *)self setCenterZoomScale:0.02];
  v122 = [(SBFluidSwitcherAnimationSettings *)self pulseScaleSettings];
  [v122 setDefaultValues];

  v123 = [(SBFluidSwitcherAnimationSettings *)self pulseScaleSettings];
  [v123 setDampingRatio:1.0];

  v124 = [(SBFluidSwitcherAnimationSettings *)self pulseScaleSettings];
  [v124 setResponse:0.358];

  v125 = [(SBFluidSwitcherAnimationSettings *)self pulseScaleSettings];
  CAFrameRateRange v180 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v125, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v180.minimum, *(double *)&v180.maximum, *(double *)&v180.preferred);

  [(SBFluidSwitcherAnimationSettings *)self setPulseScale:0.96];
  [(SBFluidSwitcherAnimationSettings *)self setPulseSecondStageDelay:0.07];
  long long v157 = 0u;
  long long v158 = 0u;
  long long v155 = 0u;
  long long v156 = 0u;
  uint64_t v126 = [&unk_1F3347628 countByEnumeratingWithState:&v155 objects:v159 count:16];
  if (v126)
  {
    uint64_t v127 = v126;
    uint64_t v128 = *(void *)v156;
    do
    {
      for (uint64_t i = 0; i != v127; ++i)
      {
        if (*(void *)v156 != v128) {
          objc_enumerationMutation(&unk_1F3347628);
        }
        uint64_t v130 = *(void *)(*((void *)&v155 + 1) + 8 * i);
        v131 = [(SBFluidSwitcherAnimationSettings *)self valueForKey:v130];
        [v131 setName:v130];
      }
      uint64_t v127 = [&unk_1F3347628 countByEnumeratingWithState:&v155 objects:v159 count:16];
    }
    while (v127);
  }
  [(SBFluidSwitcherAnimationSettings *)self setHomeScreenBlurInSwitcher:1.0];
  [(SBFluidSwitcherAnimationSettings *)self setHomeScreenBlurInSwitcherReduceMotionEnabled:1.0];
  [(SBFluidSwitcherAnimationSettings *)self homeScreenBlurInSwitcher];
  -[SBFluidSwitcherAnimationSettings setHomeScreenBlurInApplication:](self, "setHomeScreenBlurInApplication:");
  [(SBFluidSwitcherAnimationSettings *)self homeScreenBlurInSwitcher];
  -[SBFluidSwitcherAnimationSettings setHomeScreenBlurInAssistant:](self, "setHomeScreenBlurInAssistant:");
  [(SBFluidSwitcherAnimationSettings *)self setHomeScreenOpacityInSwitcher:0.5];
  [(SBFluidSwitcherAnimationSettings *)self homeScreenOpacityInSwitcher];
  -[SBFluidSwitcherAnimationSettings setHomeScreenOpacityInApplication:](self, "setHomeScreenOpacityInApplication:");
  [(SBFluidSwitcherAnimationSettings *)self setHomeScreenScaleInSwitcher:0.9];
  [(SBFluidSwitcherAnimationSettings *)self homeScreenScaleInSwitcher];
  -[SBFluidSwitcherAnimationSettings setHomeScreenScaleInApplication:](self, "setHomeScreenScaleInApplication:");
  [(SBFluidSwitcherAnimationSettings *)self setHomeScreenScaleInAssistant:0.92];
  v132 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v133 = [v132 userInterfaceIdiom];

  [(SBFluidSwitcherAnimationSettings *)self setWallpaperScaleInSwitcher:dbl_1D8FD05E0[(v133 & 0xFFFFFFFFFFFFFFFBLL) == 1]];
  [(SBFluidSwitcherAnimationSettings *)self wallpaperScaleInSwitcher];
  -[SBFluidSwitcherAnimationSettings setWallpaperScaleInApplication:](self, "setWallpaperScaleInApplication:");
  [(SBFluidSwitcherAnimationSettings *)self setDimmingAlphaInSwitcher:0.25];
  [(SBFluidSwitcherAnimationSettings *)self setDimmingAlphaInApplication:0.67];
  if (SBIsHomeGestureEnabledByDefault())
  {
    v134 = [(SBFluidSwitcherAnimationSettings *)self layoutSettings];
    [v134 setTrackingDampingRatio:0.577];

    v135 = [(SBFluidSwitcherAnimationSettings *)self layoutSettings];
    [v135 setTrackingResponse:0.145];

    v136 = [(SBFluidSwitcherAnimationSettings *)self layoutSettings];
    [v136 setTrackingRetargetImpulse:0.008];

    v137 = [(SBFluidSwitcherAnimationSettings *)self homeScreenScaleSettings];
    [v137 setDampingRatio:0.88];

    v138 = [(SBFluidSwitcherAnimationSettings *)self homeScreenScaleSettings];
    [v138 setResponse:0.7];

    v139 = [(SBFluidSwitcherAnimationSettings *)self wallpaperScaleSettings];
    [v139 setDampingRatio:1.3];

    v140 = [(SBFluidSwitcherAnimationSettings *)self wallpaperScaleSettings];
    [v140 setResponse:0.75];

    v141 = [(SBFluidSwitcherAnimationSettings *)self wallpaperScaleSettings];
    [v141 setRetargetImpulse:0.028];

    [(SBFluidSwitcherAnimationSettings *)self setHomeScreenBlurInSwitcher:0.6];
    [(SBFluidSwitcherAnimationSettings *)self setHomeScreenBlurInSwitcherReduceMotionEnabled:1.0];
    [(SBFluidSwitcherAnimationSettings *)self setHomeScreenBlurInApplication:1.0];
    [(SBFluidSwitcherAnimationSettings *)self setHomeScreenBlurInAssistant:0.045];
    v142 = [MEMORY[0x1E4F42948] currentDevice];
    uint64_t v143 = [v142 userInterfaceIdiom];

    if ((v143 & 0xFFFFFFFFFFFFFFFBLL) != 1)
    {
      [(SBFluidSwitcherAnimationSettings *)self setHomeScreenOpacityInSwitcher:0.6];
      [(SBFluidSwitcherAnimationSettings *)self setHomeScreenOpacityInApplication:0.95];
      [(SBFluidSwitcherAnimationSettings *)self setHomeScreenScaleInSwitcher:0.95];
      [(SBFluidSwitcherAnimationSettings *)self setHomeScreenScaleInApplication:0.88];
      [(SBFluidSwitcherAnimationSettings *)self setWallpaperScaleInSwitcher:1.1];
      [(SBFluidSwitcherAnimationSettings *)self setWallpaperScaleInApplication:1.2];
    }
    [(SBFluidSwitcherAnimationSettings *)self setDimmingAlphaInApplication:0.5];
  }
  [(SBFluidSwitcherAnimationSettings *)self setAllowIconZoomFromMediumWidgets:1];
  [(SBFluidSwitcherAnimationSettings *)self setAllowIconZoomFromLargeWidgets:1];
  if (__sb__runningInSpringBoard())
  {
    int v144 = SBFEffectiveDeviceClass();
    double v145 = 44.0;
    if (v144 == 2) {
      double v145 = 10.0;
    }
    [(SBFluidSwitcherAnimationSettings *)self setHomeScreenCenterZoomInitialBlur:v145];
  }
  else
  {
    v146 = [MEMORY[0x1E4F42948] currentDevice];
    uint64_t v147 = [v146 userInterfaceIdiom];
    double v148 = 44.0;
    if (v147 == 1) {
      double v148 = 10.0;
    }
    [(SBFluidSwitcherAnimationSettings *)self setHomeScreenCenterZoomInitialBlur:v148];
  }
  if (__sb__runningInSpringBoard())
  {
    int v149 = SBFEffectiveDeviceClass();
    double v150 = 0.86;
    if (v149 != 2) {
      double v150 = 0.5;
    }
    [(SBFluidSwitcherAnimationSettings *)self setHomeScreenCenterZoomInitialScale:v150];
  }
  else
  {
    v151 = [MEMORY[0x1E4F42948] currentDevice];
    uint64_t v152 = [v151 userInterfaceIdiom];
    double v153 = 0.86;
    if (v152 != 1) {
      double v153 = 0.5;
    }
    [(SBFluidSwitcherAnimationSettings *)self setHomeScreenCenterZoomInitialScale:v153];
  }
  [(SBFluidSwitcherAnimationSettings *)self setHomeScreenCenterZoomInitialOpacity:0.0];
  if (__sb__runningInSpringBoard())
  {
    [(SBFluidSwitcherAnimationSettings *)self setHomeScreenCenterZoomTargetScaleWhenUnblurringIsComplete:dbl_1D8FD05F0[SBFEffectiveDeviceClass() == 2]];
  }
  else
  {
    v154 = [MEMORY[0x1E4F42948] currentDevice];
    -[SBFluidSwitcherAnimationSettings setHomeScreenCenterZoomTargetScaleWhenUnblurringIsComplete:](self, "setHomeScreenCenterZoomTargetScaleWhenUnblurringIsComplete:", dbl_1D8FD05F0[[v154 userInterfaceIdiom] == 1]);
  }
  [(SBFluidSwitcherAnimationSettings *)self setHomeScreenCenterZoomYOffsetPercentOfScreenHeight:0.0];
}

- (void)_setTopAffordanceTransitionDefaultValues
{
  [(SBFluidSwitcherAnimationSettings *)self setPerformTwoPhaseFullScreenToPeekTransition:1];
  v3 = [(SBFluidSwitcherAnimationSettings *)self fullScreenToPeekFirstPhaseAnimationSettings];
  [v3 setDefaultValues];

  v4 = [(SBFluidSwitcherAnimationSettings *)self fullScreenToPeekFirstPhaseAnimationSettings];
  [v4 setDampingRatio:1.1];

  v5 = [(SBFluidSwitcherAnimationSettings *)self fullScreenToPeekFirstPhaseAnimationSettings];
  [v5 setResponse:0.45];

  v6 = [(SBFluidSwitcherAnimationSettings *)self fullScreenToPeekSecondPhaseAnimationSettings];
  [v6 setDefaultValues];

  v7 = [(SBFluidSwitcherAnimationSettings *)self fullScreenToPeekSecondPhaseAnimationSettings];
  [v7 setDampingRatio:0.9];

  v8 = [(SBFluidSwitcherAnimationSettings *)self fullScreenToPeekSecondPhaseAnimationSettings];
  [v8 setResponse:0.44];

  [(SBFluidSwitcherAnimationSettings *)self setFullScreenToPeekSecondPhaseAnimationDelay:0.4];
  v9 = [(SBFluidSwitcherAnimationSettings *)self splitViewToSlideOverSettings];
  [v9 setDefaultCriticallyDampedValues];

  v10 = [(SBFluidSwitcherAnimationSettings *)self slideOverToFullScreenAnimationSettings];
  [v10 setDefaultCriticallyDampedValues];

  [(SBFluidSwitcherAnimationSettings *)self setSlideOverToFullScreenOutgoingAppScaleBack:0.9];
  [(SBFluidSwitcherAnimationSettings *)self setSlideOverToFullScreenOutgoingFinalOpacity:0.0];
  id v11 = [(SBFluidSwitcherAnimationSettings *)self centerToSlideOverAnimationSettings];
  [v11 setDefaultCriticallyDampedValues];
}

- (void)_setEntityPresentationDefaultValues
{
  id v2 = [(SBFluidSwitcherAnimationSettings *)self slideUpSettings];
  [v2 setDefaultCriticallyDampedValues];
}

- (void)_setKeyboardShortcutDefaultValues
{
  v3 = [(SBFluidSwitcherAnimationSettings *)self swapAppSidesLayoutAnimationSettings];
  [v3 setDefaultCriticallyDampedValues];

  v4 = [(SBFluidSwitcherAnimationSettings *)self swapAppSidesOpacityAnimationSettings];
  [v4 setDefaultCriticallyDampedValues];

  v5 = [(SBFluidSwitcherAnimationSettings *)self swapAppSidesOpacityAnimationSettings];
  [v5 setResponse:0.15];

  [(SBFluidSwitcherAnimationSettings *)self setSwapAppSidesShadowFadeOutDelay:0.3];
}

- (void)_setHomeGestureAnimationDefaultValues
{
  [(SBFFluidBehaviorSettings *)self->_homeGestureCenterRowZoomUpSettings setDampingRatio:1.1];
  -[SBFFluidBehaviorSettings setResponse:](self->_homeGestureCenterRowZoomUpSettings, "setResponse:");
  [(SBFFluidBehaviorSettings *)self->_homeGestureCenterRowZoomUpSettings setRetargetImpulse:0.016];
  homeGestureCenterRowZoomUpSettings = self->_homeGestureCenterRowZoomUpSettings;
  CAFrameRateRange v43 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  -[SBFFluidBehaviorSettings setFrameRateRange:highFrameRateReason:](homeGestureCenterRowZoomUpSettings, "setFrameRateRange:highFrameRateReason:", 1114114, *(double *)&v43.minimum, *(double *)&v43.maximum, *(double *)&v43.preferred);
  [(SBFFluidBehaviorSettings *)self->_homeGestureEdgeRowZoomUpSettings setDampingRatio:1.1];
  [(SBFFluidBehaviorSettings *)self->_homeGestureEdgeRowZoomUpSettings setResponse:0.34];
  [(SBFFluidBehaviorSettings *)self->_homeGestureEdgeRowZoomUpSettings setRetargetImpulse:0.016];
  homeGestureEdgeRowZoomUpSettings = self->_homeGestureEdgeRowZoomUpSettings;
  CAFrameRateRange v44 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  -[SBFFluidBehaviorSettings setFrameRateRange:highFrameRateReason:](homeGestureEdgeRowZoomUpSettings, "setFrameRateRange:highFrameRateReason:", 1114114, *(double *)&v44.minimum, *(double *)&v44.maximum, *(double *)&v44.preferred);
  [(SBFFluidBehaviorSettings *)self->_homeGestureTopRowZoomDownLayoutSettings setDampingRatio:1.1];
  -[SBFFluidBehaviorSettings setResponse:](self->_homeGestureTopRowZoomDownLayoutSettings, "setResponse:");
  [(SBFFluidBehaviorSettings *)self->_homeGestureTopRowZoomDownLayoutSettings setRetargetImpulse:0.016];
  homeGestureTopRowZoomDownLayoutSettings = self->_homeGestureTopRowZoomDownLayoutSettings;
  CAFrameRateRange v45 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  -[SBFFluidBehaviorSettings setFrameRateRange:highFrameRateReason:](homeGestureTopRowZoomDownLayoutSettings, "setFrameRateRange:highFrameRateReason:", 1114115, *(double *)&v45.minimum, *(double *)&v45.maximum, *(double *)&v45.preferred);
  -[SBFFluidBehaviorSettings setDampingRatio:](self->_homeGestureTopRowZoomDownPositionSettings, "setDampingRatio:");
  -[SBFFluidBehaviorSettings setResponse:](self->_homeGestureTopRowZoomDownPositionSettings, "setResponse:");
  [(SBFFluidBehaviorSettings *)self->_homeGestureTopRowZoomDownPositionSettings setRetargetImpulse:0.02];
  homeGestureTopRowZoomDownPositionSettings = self->_homeGestureTopRowZoomDownPositionSettings;
  CAFrameRateRange v46 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  -[SBFFluidBehaviorSettings setFrameRateRange:highFrameRateReason:](homeGestureTopRowZoomDownPositionSettings, "setFrameRateRange:highFrameRateReason:", 1114115, *(double *)&v46.minimum, *(double *)&v46.maximum, *(double *)&v46.preferred);
  -[SBFFluidBehaviorSettings setDampingRatio:](self->_homeGestureTopRowZoomDownScaleSettings, "setDampingRatio:");
  v7 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v8 = [v7 userInterfaceIdiom];

  double v9 = 0.4;
  if ((v8 & 0xFFFFFFFFFFFFFFFBLL) != 1) {
    double v9 = 0.55;
  }
  [(SBFFluidBehaviorSettings *)self->_homeGestureTopRowZoomDownScaleSettings setResponse:v9];
  -[SBFFluidBehaviorSettings setRetargetImpulse:](self->_homeGestureTopRowZoomDownScaleSettings, "setRetargetImpulse:");
  homeGestureTopRowZoomDownScaleSettings = self->_homeGestureTopRowZoomDownScaleSettings;
  CAFrameRateRange v47 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  -[SBFFluidBehaviorSettings setFrameRateRange:highFrameRateReason:](homeGestureTopRowZoomDownScaleSettings, "setFrameRateRange:highFrameRateReason:", 1114115, *(double *)&v47.minimum, *(double *)&v47.maximum, *(double *)&v47.preferred);
  [(SBFFluidBehaviorSettings *)self->_homeGestureBottomRowZoomDownLayoutSettings setDampingRatio:1.1];
  [(SBFFluidBehaviorSettings *)self->_homeGestureBottomRowZoomDownLayoutSettings setResponse:0.375];
  [(SBFFluidBehaviorSettings *)self->_homeGestureBottomRowZoomDownLayoutSettings setRetargetImpulse:0.016];
  homeGestureBottomRowZoomDownLayoutSettings = self->_homeGestureBottomRowZoomDownLayoutSettings;
  CAFrameRateRange v48 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  -[SBFFluidBehaviorSettings setFrameRateRange:highFrameRateReason:](homeGestureBottomRowZoomDownLayoutSettings, "setFrameRateRange:highFrameRateReason:", 1114115, *(double *)&v48.minimum, *(double *)&v48.maximum, *(double *)&v48.preferred);
  [(SBFFluidBehaviorSettings *)self->_homeGestureBottomRowZoomDownPositionSettings setDampingRatio:0.86];
  v12 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v13 = [v12 userInterfaceIdiom];

  if ((v13 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    double v14 = 0.5;
  }
  else {
    double v14 = 0.55;
  }
  [(SBFFluidBehaviorSettings *)self->_homeGestureBottomRowZoomDownPositionSettings setResponse:v14];
  [(SBFFluidBehaviorSettings *)self->_homeGestureBottomRowZoomDownPositionSettings setRetargetImpulse:0.02];
  homeGestureBottomRowZoomDownPositionSettings = self->_homeGestureBottomRowZoomDownPositionSettings;
  CAFrameRateRange v49 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  -[SBFFluidBehaviorSettings setFrameRateRange:highFrameRateReason:](homeGestureBottomRowZoomDownPositionSettings, "setFrameRateRange:highFrameRateReason:", 1114115, *(double *)&v49.minimum, *(double *)&v49.maximum, *(double *)&v49.preferred);
  v16 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v17 = [v16 userInterfaceIdiom];

  [(SBFFluidBehaviorSettings *)self->_homeGestureBottomRowZoomDownScaleSettings setDampingRatio:dbl_1D8FD0600[(v17 & 0xFFFFFFFFFFFFFFFBLL) == 1]];
  v18 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v19 = [v18 userInterfaceIdiom];

  if ((v19 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    double v20 = 0.5;
  }
  else {
    double v20 = 0.55;
  }
  [(SBFFluidBehaviorSettings *)self->_homeGestureBottomRowZoomDownScaleSettings setResponse:v20];
  [(SBFFluidBehaviorSettings *)self->_homeGestureBottomRowZoomDownScaleSettings setRetargetImpulse:0.018];
  homeGestureBottomRowZoomDownScaleSettings = self->_homeGestureBottomRowZoomDownScaleSettings;
  CAFrameRateRange v50 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  -[SBFFluidBehaviorSettings setFrameRateRange:highFrameRateReason:](homeGestureBottomRowZoomDownScaleSettings, "setFrameRateRange:highFrameRateReason:", 1114115, *(double *)&v50.minimum, *(double *)&v50.maximum, *(double *)&v50.preferred);
  [(SBFFluidBehaviorSettings *)self->_homeGestureSmallWidgetZoomDownLayoutSettings setDampingRatio:1.1];
  [(SBFFluidBehaviorSettings *)self->_homeGestureSmallWidgetZoomDownLayoutSettings setResponse:0.425];
  [(SBFFluidBehaviorSettings *)self->_homeGestureSmallWidgetZoomDownLayoutSettings setRetargetImpulse:0.016];
  homeGestureSmallWidgetZoomDownLayoutSettings = self->_homeGestureSmallWidgetZoomDownLayoutSettings;
  CAFrameRateRange v51 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  -[SBFFluidBehaviorSettings setFrameRateRange:highFrameRateReason:](homeGestureSmallWidgetZoomDownLayoutSettings, "setFrameRateRange:highFrameRateReason:", 1114115, *(double *)&v51.minimum, *(double *)&v51.maximum, *(double *)&v51.preferred);
  [(SBFFluidBehaviorSettings *)self->_homeGestureSmallWidgetZoomDownPositionSettings setDampingRatio:0.88];
  [(SBFFluidBehaviorSettings *)self->_homeGestureSmallWidgetZoomDownPositionSettings setResponse:0.45];
  [(SBFFluidBehaviorSettings *)self->_homeGestureSmallWidgetZoomDownPositionSettings setRetargetImpulse:0.02];
  homeGestureSmallWidgetZoomDownPositionSettings = self->_homeGestureSmallWidgetZoomDownPositionSettings;
  CAFrameRateRange v52 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  -[SBFFluidBehaviorSettings setFrameRateRange:highFrameRateReason:](homeGestureSmallWidgetZoomDownPositionSettings, "setFrameRateRange:highFrameRateReason:", 1114115, *(double *)&v52.minimum, *(double *)&v52.maximum, *(double *)&v52.preferred);
  [(SBFFluidBehaviorSettings *)self->_homeGestureSmallWidgetZoomDownScaleSettings setDampingRatio:0.96];
  [(SBFFluidBehaviorSettings *)self->_homeGestureSmallWidgetZoomDownScaleSettings setResponse:0.54];
  [(SBFFluidBehaviorSettings *)self->_homeGestureSmallWidgetZoomDownScaleSettings setRetargetImpulse:0.018];
  homeGestureSmallWidgetZoomDownScaleSettings = self->_homeGestureSmallWidgetZoomDownScaleSettings;
  CAFrameRateRange v53 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  -[SBFFluidBehaviorSettings setFrameRateRange:highFrameRateReason:](homeGestureSmallWidgetZoomDownScaleSettings, "setFrameRateRange:highFrameRateReason:", 1114115, *(double *)&v53.minimum, *(double *)&v53.maximum, *(double *)&v53.preferred);
  [(SBFFluidBehaviorSettings *)self->_homeGestureMediumWidgetZoomDownLayoutSettings setDampingRatio:0.96];
  [(SBFFluidBehaviorSettings *)self->_homeGestureMediumWidgetZoomDownLayoutSettings setResponse:0.32];
  [(SBFFluidBehaviorSettings *)self->_homeGestureMediumWidgetZoomDownLayoutSettings setRetargetImpulse:0.016];
  homeGestureMediumWidgetZoomDownLayoutSettings = self->_homeGestureMediumWidgetZoomDownLayoutSettings;
  CAFrameRateRange v54 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  -[SBFFluidBehaviorSettings setFrameRateRange:highFrameRateReason:](homeGestureMediumWidgetZoomDownLayoutSettings, "setFrameRateRange:highFrameRateReason:", 1114115, *(double *)&v54.minimum, *(double *)&v54.maximum, *(double *)&v54.preferred);
  [(SBFFluidBehaviorSettings *)self->_homeGestureMediumWidgetZoomDownPositionSettings setDampingRatio:0.88];
  [(SBFFluidBehaviorSettings *)self->_homeGestureMediumWidgetZoomDownPositionSettings setResponse:0.45];
  [(SBFFluidBehaviorSettings *)self->_homeGestureMediumWidgetZoomDownPositionSettings setRetargetImpulse:0.02];
  homeGestureMediumWidgetZoomDownPositionSettings = self->_homeGestureMediumWidgetZoomDownPositionSettings;
  CAFrameRateRange v55 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  -[SBFFluidBehaviorSettings setFrameRateRange:highFrameRateReason:](homeGestureMediumWidgetZoomDownPositionSettings, "setFrameRateRange:highFrameRateReason:", 1114115, *(double *)&v55.minimum, *(double *)&v55.maximum, *(double *)&v55.preferred);
  [(SBFFluidBehaviorSettings *)self->_homeGestureMediumWidgetZoomDownScaleSettings setDampingRatio:0.96];
  [(SBFFluidBehaviorSettings *)self->_homeGestureMediumWidgetZoomDownScaleSettings setResponse:0.54];
  [(SBFFluidBehaviorSettings *)self->_homeGestureMediumWidgetZoomDownScaleSettings setRetargetImpulse:0.0];
  homeGestureMediumWidgetZoomDownScaleSettings = self->_homeGestureMediumWidgetZoomDownScaleSettings;
  CAFrameRateRange v56 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  -[SBFFluidBehaviorSettings setFrameRateRange:highFrameRateReason:](homeGestureMediumWidgetZoomDownScaleSettings, "setFrameRateRange:highFrameRateReason:", 1114115, *(double *)&v56.minimum, *(double *)&v56.maximum, *(double *)&v56.preferred);
  [(SBFFluidBehaviorSettings *)self->_homeGestureLargeWidgetZoomDownLayoutSettings setDampingRatio:0.96];
  [(SBFFluidBehaviorSettings *)self->_homeGestureLargeWidgetZoomDownLayoutSettings setResponse:0.4];
  [(SBFFluidBehaviorSettings *)self->_homeGestureLargeWidgetZoomDownLayoutSettings setRetargetImpulse:0.016];
  homeGestureLargeWidgetZoomDownLayoutSettings = self->_homeGestureLargeWidgetZoomDownLayoutSettings;
  CAFrameRateRange v57 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  -[SBFFluidBehaviorSettings setFrameRateRange:highFrameRateReason:](homeGestureLargeWidgetZoomDownLayoutSettings, "setFrameRateRange:highFrameRateReason:", 1114115, *(double *)&v57.minimum, *(double *)&v57.maximum, *(double *)&v57.preferred);
  [(SBFFluidBehaviorSettings *)self->_homeGestureLargeWidgetZoomDownPositionSettings setDampingRatio:0.88];
  [(SBFFluidBehaviorSettings *)self->_homeGestureLargeWidgetZoomDownPositionSettings setResponse:0.45];
  [(SBFFluidBehaviorSettings *)self->_homeGestureLargeWidgetZoomDownPositionSettings setRetargetImpulse:0.0];
  homeGestureLargeWidgetZoomDownPositionSettings = self->_homeGestureLargeWidgetZoomDownPositionSettings;
  CAFrameRateRange v58 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  -[SBFFluidBehaviorSettings setFrameRateRange:highFrameRateReason:](homeGestureLargeWidgetZoomDownPositionSettings, "setFrameRateRange:highFrameRateReason:", 1114115, *(double *)&v58.minimum, *(double *)&v58.maximum, *(double *)&v58.preferred);
  [(SBFFluidBehaviorSettings *)self->_homeGestureLargeWidgetZoomDownScaleSettings setDampingRatio:0.96];
  [(SBFFluidBehaviorSettings *)self->_homeGestureLargeWidgetZoomDownScaleSettings setResponse:0.54];
  [(SBFFluidBehaviorSettings *)self->_homeGestureLargeWidgetZoomDownScaleSettings setRetargetImpulse:0.0];
  homeGestureLargeWidgetZoomDownScaleSettings = self->_homeGestureLargeWidgetZoomDownScaleSettings;
  CAFrameRateRange v59 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  -[SBFFluidBehaviorSettings setFrameRateRange:highFrameRateReason:](homeGestureLargeWidgetZoomDownScaleSettings, "setFrameRateRange:highFrameRateReason:", 1114115, *(double *)&v59.minimum, *(double *)&v59.maximum, *(double *)&v59.preferred);
  self->_zoomDownWidgetScaleVelocityYMinimum = 3000.0;
  self->_zoomDownWidgetScaleVelocityYMaximum = 5000.0;
  self->_zoomDownWidgetScaleOvershootMinimumMultiplier = 0.8;
  self->_zoomDownWidgetScaleOvershootMaximumMultiplier = 0.7;
  self->_zoomDownWidgetScaleOvershootDuration = 0.1;
  [(SBFFluidBehaviorSettings *)self->_arcSwipeSettings setDefaultValues];
  [(SBFFluidBehaviorSettings *)self->_arcSwipeSettings setRetargetImpulse:0.018];
  arcSwipeSettings = self->_arcSwipeSettings;
  CAFrameRateRange v60 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  -[SBFFluidBehaviorSettings setFrameRateRange:highFrameRateReason:](arcSwipeSettings, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v60.minimum, *(double *)&v60.maximum, *(double *)&v60.preferred);
  [(SBFFluidBehaviorSettings *)self->_arcSwipeSwitcherGlancingSettings setDefaultValues];
  [(SBFFluidBehaviorSettings *)self->_arcSwipeSwitcherGlancingSettings setDampingRatio:1.0];
  [(SBFFluidBehaviorSettings *)self->_arcSwipeSwitcherGlancingSettings setResponse:0.55];
  [(SBFFluidBehaviorSettings *)self->_arcSwipeSwitcherGlancingSettings setTrackingDampingRatio:1.0];
  [(SBFFluidBehaviorSettings *)self->_arcSwipeSwitcherGlancingSettings setTrackingResponse:0.55];
  arcSwipeSwitcherGlancingSettings = self->_arcSwipeSwitcherGlancingSettings;
  CAFrameRateRange v61 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  -[SBFFluidBehaviorSettings setFrameRateRange:highFrameRateReason:](arcSwipeSwitcherGlancingSettings, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v61.minimum, *(double *)&v61.maximum, *(double *)&v61.preferred);
  [(SBFFluidBehaviorSettings *)self->_appToSwitcherCornerRadiusSettings setDefaultValues];
  [(SBFFluidBehaviorSettings *)self->_appToSwitcherCornerRadiusSettings setRetargetImpulse:0.018];
  appToSwitcherCornerRadiusSettings = self->_appToSwitcherCornerRadiusSettings;
  CAFrameRateRange v62 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  -[SBFFluidBehaviorSettings setFrameRateRange:highFrameRateReason:](appToSwitcherCornerRadiusSettings, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v62.minimum, *(double *)&v62.maximum, *(double *)&v62.preferred);
  [(SBFFluidBehaviorSettings *)self->_gestureInitiatedAppToSwitcherSettings setDefaultValues];
  [(SBFFluidBehaviorSettings *)self->_gestureInitiatedAppToSwitcherSettings setDampingRatio:0.94];
  [(SBFFluidBehaviorSettings *)self->_gestureInitiatedAppToSwitcherSettings setRetargetImpulse:0.018];
  gestureInitiatedAppToSwitcherSettings = self->_gestureInitiatedAppToSwitcherSettings;
  CAFrameRateRange v63 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  -[SBFFluidBehaviorSettings setFrameRateRange:highFrameRateReason:](gestureInitiatedAppToSwitcherSettings, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v63.minimum, *(double *)&v63.maximum, *(double *)&v63.preferred);
  [(SBFFluidBehaviorSettings *)self->_cardFlyInSettings setDefaultValues];
  [(SBFFluidBehaviorSettings *)self->_cardFlyInSettings setResponse:0.3];
  cardFlyInSettings = self->_cardFlyInSettings;
  CAFrameRateRange v64 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  -[SBFFluidBehaviorSettings setFrameRateRange:highFrameRateReason:](cardFlyInSettings, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v64.minimum, *(double *)&v64.maximum, *(double *)&v64.preferred);
  self->_cardFlyInAccelerationDipThreshold = 2000.0;
  self->_minimumTouchSamplesForAccelerationDip = 4;
  [(SBFFluidBehaviorSettings *)self->_reduceMotionArcSwipeSettings setDefaultValues];
  reduceMotionArcSwipeSettings = self->_reduceMotionArcSwipeSettings;
  [(SBFFluidBehaviorSettings *)reduceMotionArcSwipeSettings response];
  [(SBFFluidBehaviorSettings *)reduceMotionArcSwipeSettings setResponse:v37 * 0.8];
  [(SBFFluidBehaviorSettings *)self->_reduceMotionArcSwipeSettings setDampingRatio:1.0];
  [(SBFFluidBehaviorSettings *)self->_reduceMotionArcSwipeSettings setRetargetImpulse:0.018];
  [(SBFFluidBehaviorSettings *)self->_reduceMotionAppToSwitcherSettings setDefaultValues];
  reduceMotionAppToSwitcherSettings = self->_reduceMotionAppToSwitcherSettings;
  [(SBFFluidBehaviorSettings *)reduceMotionAppToSwitcherSettings response];
  [(SBFFluidBehaviorSettings *)reduceMotionAppToSwitcherSettings setResponse:v39 * 0.8];
  [(SBFFluidBehaviorSettings *)self->_reduceMotionAppToSwitcherSettings setDampingRatio:1.0];
  [(SBFFluidBehaviorSettings *)self->_reduceMotionAppToSwitcherSettings setRetargetImpulse:0.018];
  double v40 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v41 = [v40 userInterfaceIdiom];

  double v42 = 0.15;
  if ((v41 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    double v42 = 0.0;
  }
  self->_reduceMotionTriggerDelay = v42;
  self->_zoomDownVelocityYMinimum = 3000.0;
  self->_zoomDownVelocityYMaximum = 5000.0;
  self->_zoomDownVelocityYLayoutResponseMultiplier = 0.7;
  self->_zoomDownVelocityXMinimum = 1000.0;
  self->_zoomDownVelocityXMaximum = 4000.0;
  self->_zoomDownVelocityXPositionResponseMultiplier = 1.2;
}

+ (id)settingsControllerModule
{
  v286[26] = *MEMORY[0x1E4F143B8];
  v263 = [MEMORY[0x1E4F94138] rowWithTitle:@"Layout" childSettingsKeyPath:@"layoutSettings"];
  v262 = [MEMORY[0x1E4F94138] rowWithTitle:@"Zoom Up" childSettingsKeyPath:@"zoomUpSettings"];
  v261 = [MEMORY[0x1E4F94138] rowWithTitle:@"Icon ZoomDown" childSettingsKeyPath:@"iconZoomDownSettings"];
  v260 = [MEMORY[0x1E4F94138] rowWithTitle:@"Icon Zoom Floating Dock Fade Delay" childSettingsKeyPath:@"floatingDockIconFadeSettings"];
  v259 = [MEMORY[0x1E4F94138] rowWithTitle:@"Switcher Icon Zoom Fade Out" childSettingsKeyPath:@"switcherZoomDownIconFadeOutSettings"];
  v258 = [MEMORY[0x1E4F94138] rowWithTitle:@"Switcher Icon Fade In" childSettingsKeyPath:@"iconFadeInSettings"];
  v257 = [MEMORY[0x1E4F94138] rowWithTitle:@"Switcher Fade Out" childSettingsKeyPath:@"switcherFadeOutSettings"];
  v256 = [MEMORY[0x1E4F94138] rowWithTitle:@"Center Zoom" childSettingsKeyPath:@"centerZoomSettings"];
  v255 = [MEMORY[0x1E4F94138] rowWithTitle:@"Slide Over" childSettingsKeyPath:@"slideOverSettings"];
  v254 = [MEMORY[0x1E4F94138] rowWithTitle:@"Toggle App Switcher" childSettingsKeyPath:@"toggleAppSwitcherSettings"];
  v253 = [MEMORY[0x1E4F94138] rowWithTitle:@"Launch App From Switcher" childSettingsKeyPath:@"launchAppFromSwitcherSettings"];
  v252 = [MEMORY[0x1E4F94138] rowWithTitle:@"Switcher To Home" childSettingsKeyPath:@"switcherToHomeSettings"];
  v251 = [MEMORY[0x1E4F94138] rowWithTitle:@"Stacked Switcher Tracking Paramters" childSettingsKeyPath:@"stackedSwitcherTrackingSettings"];
  v250 = [MEMORY[0x1E4F94138] rowWithTitle:@"Home Screen Blur" childSettingsKeyPath:@"backdropBlurSettings"];
  v249 = [MEMORY[0x1E4F94138] rowWithTitle:@"Home Screen Opacity" childSettingsKeyPath:@"homeScreenOpacitySettings"];
  v248 = [MEMORY[0x1E4F94138] rowWithTitle:@"Home Screen Scale" childSettingsKeyPath:@"homeScreenScaleSettings"];
  v247 = [MEMORY[0x1E4F94138] rowWithTitle:@"Opacity" childSettingsKeyPath:@"opacitySettings"];
  v246 = [MEMORY[0x1E4F94138] rowWithTitle:@"Center Zoom Opacity" childSettingsKeyPath:@"centerZoomOpacitySettings"];
  v197 = [MEMORY[0x1E4F94138] rowWithTitle:@"Swipe Shelf to Kill Opacity" childSettingsKeyPath:@"swipeToKillOpacitySettings"];
  v196 = [MEMORY[0x1E4F94138] rowWithTitle:@"Switcher To Home Opacity" childSettingsKeyPath:@"switcherToHomeOpacitySettings"];
  v195 = [MEMORY[0x1E4F94138] rowWithTitle:@"Wallpaper Scale" childSettingsKeyPath:@"wallpaperScaleSettings"];
  v194 = [MEMORY[0x1E4F94138] rowWithTitle:@"App Selection Squish" childSettingsKeyPath:@"appSelectionSquishSettings"];
  v193 = [MEMORY[0x1E4F94138] rowWithTitle:@"Status Bar Fade In" childSettingsKeyPath:@"statusBarFadeInSettings"];
  v192 = [MEMORY[0x1E4F94138] rowWithTitle:@"Status Bar Fade Out" childSettingsKeyPath:@"statusBarFadeOutSettings"];
  id v2 = [MEMORY[0x1E4F94140] rowWithTitle:@"Status Bar To Apex Bounce Duration" valueKeyPath:@"statusBarToApexBounceAnimationDuration"];
  v191 = [v2 between:0.0 and:2.0];

  v3 = [MEMORY[0x1E4F94140] rowWithTitle:@"Status Bar From Apex Bounce Duration" valueKeyPath:@"statusBarFromApexBounceAnimationDuration"];
  v190 = [v3 between:0.0 and:2.0];

  v4 = (void *)MEMORY[0x1E4F94168];
  v286[0] = v263;
  v286[1] = v262;
  v286[2] = v261;
  v286[3] = v260;
  v286[4] = v259;
  v286[5] = v258;
  v286[6] = v257;
  v286[7] = v256;
  v286[8] = v255;
  v286[9] = v254;
  v286[10] = v253;
  v286[11] = v252;
  v286[12] = v251;
  v286[13] = v250;
  v286[14] = v249;
  v286[15] = v248;
  v286[16] = v247;
  v286[17] = v246;
  v286[18] = v197;
  v286[19] = v196;
  v286[20] = v195;
  v286[21] = v194;
  v286[22] = v193;
  v286[23] = v192;
  v286[24] = v191;
  v286[25] = v190;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v286 count:26];
  v245 = [v4 sectionWithRows:v5 title:@"Animation Settings"];

  v189 = [MEMORY[0x1E4F941E8] rowWithTitle:@"Perform Two Phase Full Screen To Peek Transition" valueKeyPath:@"performTwoPhaseFullScreenToPeekTransition"];
  v188 = [MEMORY[0x1E4F94138] rowWithTitle:@"Full Screen To Peek First Phase Animation Settings" childSettingsKeyPath:@"fullScreenToPeekFirstPhaseAnimationSettings"];
  v187 = [MEMORY[0x1E4F94138] rowWithTitle:@"Full Screen To Peek Second Phase Animation Settings" childSettingsKeyPath:@"fullScreenToPeekSecondPhaseAnimationSettings"];
  v186 = [MEMORY[0x1E4F94140] rowWithTitle:@"Full Screen To Peek Second Phase Animation Delay" valueKeyPath:@"fullScreenToPeekSecondPhaseAnimationDelay"];
  v185 = [MEMORY[0x1E4F94138] rowWithTitle:@"Split View to Slide Over" childSettingsKeyPath:@"splitViewToSlideOverSettings"];
  v184 = [MEMORY[0x1E4F94138] rowWithTitle:@"Slide Over to Full Screen Animation Settings" childSettingsKeyPath:@"slideOverToFullScreenAnimationSettings"];
  v183 = [MEMORY[0x1E4F94140] rowWithTitle:@"Slide Over to Full Screen Outgoing App Scale Back Amount" valueKeyPath:@"slideOverToFullScreenOutgoingAppScaleBack"];
  v182 = [MEMORY[0x1E4F94140] rowWithTitle:@"Slide Over to Full Screen Outgoing App Final Opacity" valueKeyPath:@"slideOverToFullScreenOutgoingFinalOpacity"];
  v181 = [MEMORY[0x1E4F94138] rowWithTitle:@"Center to Slide Over (and Back) Animation Settings" childSettingsKeyPath:@"centerToSlideOverAnimationSettings"];
  v6 = (void *)MEMORY[0x1E4F94168];
  v285[0] = v189;
  v285[1] = v188;
  v285[2] = v187;
  v285[3] = v186;
  v285[4] = v185;
  v285[5] = v184;
  v285[6] = v183;
  v285[7] = v182;
  v285[8] = v181;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v285 count:9];
  v244 = [v6 sectionWithRows:v7 title:@"Top Affordance Transition Settings"];

  uint64_t v8 = (void *)MEMORY[0x1E4F94168];
  double v9 = [MEMORY[0x1E4F94138] rowWithTitle:@"Slide Up" childSettingsKeyPath:@"slideUpSettings"];
  v284 = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v284 count:1];
  v243 = [v8 sectionWithRows:v10 title:@"Entity Presentation"];

  id v11 = (void *)MEMORY[0x1E4F94168];
  v12 = [MEMORY[0x1E4F94138] rowWithTitle:@"Swap App Sides Using 🌐-Control-Left/Right, Layout", @"swapAppSidesLayoutAnimationSettings" childSettingsKeyPath];
  v283[0] = v12;
  uint64_t v13 = [MEMORY[0x1E4F94138] rowWithTitle:@"Swap App Sides Using 🌐-Control-Left/Right, Opacity", @"swapAppSidesOpacityAnimationSettings" childSettingsKeyPath];
  v283[1] = v13;
  double v14 = [MEMORY[0x1E4F94140] rowWithTitle:@"Delay Until Shadow Starts Fading Out In Swap App Sides Transition" valueKeyPath:@"swapAppSidesShadowFadeOutDelay"];
  v283[2] = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v283 count:3];
  v242 = [v11 sectionWithRows:v15 title:@"Keyboard Shortcut Transition Settings"];

  v241 = [MEMORY[0x1E4F94138] rowWithTitle:@"Zoom Up Center" childSettingsKeyPath:@"homeGestureCenterRowZoomUpSettings"];
  v240 = [MEMORY[0x1E4F94138] rowWithTitle:@"Zoom Up Top/Bottom" childSettingsKeyPath:@"homeGestureEdgeRowZoomUpSettings"];
  v239 = [MEMORY[0x1E4F94138] rowWithTitle:@"Zoom Down Top (Layout)" childSettingsKeyPath:@"homeGestureTopRowZoomDownLayoutSettings"];
  v238 = [MEMORY[0x1E4F94138] rowWithTitle:@"Zoom Down Top (Position)" childSettingsKeyPath:@"homeGestureTopRowZoomDownPositionSettings"];
  v237 = [MEMORY[0x1E4F94138] rowWithTitle:@"Zoom Down Top (Scale)" childSettingsKeyPath:@"homeGestureTopRowZoomDownScaleSettings"];
  v236 = [MEMORY[0x1E4F94138] rowWithTitle:@"Zoom Down Bottom (Layout)" childSettingsKeyPath:@"homeGestureBottomRowZoomDownLayoutSettings"];
  v235 = [MEMORY[0x1E4F94138] rowWithTitle:@"Zoom Down Bottom (Position)" childSettingsKeyPath:@"homeGestureBottomRowZoomDownPositionSettings"];
  v234 = [MEMORY[0x1E4F94138] rowWithTitle:@"Zoom Down Bottom (Scale)" childSettingsKeyPath:@"homeGestureBottomRowZoomDownScaleSettings"];
  v233 = [MEMORY[0x1E4F94138] rowWithTitle:@"Zoom Down Small Widget (Layout)" childSettingsKeyPath:@"homeGestureSmallWidgetZoomDownLayoutSettings"];
  v232 = [MEMORY[0x1E4F94138] rowWithTitle:@"Zoom Down Small Widget (Position)" childSettingsKeyPath:@"homeGestureSmallWidgetZoomDownPositionSettings"];
  v231 = [MEMORY[0x1E4F94138] rowWithTitle:@"Zoom Down Small Widget (Scale)" childSettingsKeyPath:@"homeGestureSmallWidgetZoomDownScaleSettings"];
  v230 = [MEMORY[0x1E4F94138] rowWithTitle:@"Zoom Down Medium Widget (Layout)" childSettingsKeyPath:@"homeGestureMediumWidgetZoomDownLayoutSettings"];
  v229 = [MEMORY[0x1E4F94138] rowWithTitle:@"Zoom Down Medium Widget (Position)" childSettingsKeyPath:@"homeGestureMediumWidgetZoomDownPositionSettings"];
  v228 = [MEMORY[0x1E4F94138] rowWithTitle:@"Zoom Down Medium Widget (Scale)" childSettingsKeyPath:@"homeGestureMediumWidgetZoomDownScaleSettings"];
  v227 = [MEMORY[0x1E4F94138] rowWithTitle:@"Zoom Down Large Widget (Layout)" childSettingsKeyPath:@"homeGestureLargeWidgetZoomDownLayoutSettings"];
  v226 = [MEMORY[0x1E4F94138] rowWithTitle:@"Zoom Down Large Widget (Position)" childSettingsKeyPath:@"homeGestureLargeWidgetZoomDownPositionSettings"];
  v225 = [MEMORY[0x1E4F94138] rowWithTitle:@"Zoom Down Large Widget (Scale)" childSettingsKeyPath:@"homeGestureLargeWidgetZoomDownScaleSettings"];
  v16 = [MEMORY[0x1E4F94140] rowWithTitle:@"Widget Scale Velocity Minimum" valueKeyPath:@"zoomDownWidgetScaleVelocityYMinimum"];
  v224 = [v16 between:0.0 and:10000.0];

  uint64_t v17 = [MEMORY[0x1E4F94140] rowWithTitle:@"Widget Scale Velocity Maximum" valueKeyPath:@"zoomDownWidgetScaleVelocityYMaximum"];
  v223 = [v17 between:0.0 and:10000.0];

  v18 = [MEMORY[0x1E4F94140] rowWithTitle:@"Widget Scale Overshoot Min Multiplier" valueKeyPath:@"zoomDownWidgetScaleOvershootMinimumMultiplier"];
  v222 = [v18 between:0.0 and:10.0];

  uint64_t v19 = [MEMORY[0x1E4F94140] rowWithTitle:@"Widget Scale Overshoot Max Multiplier" valueKeyPath:@"zoomDownWidgetScaleOvershootMaximumMultiplier"];
  v221 = [v19 between:0.0 and:10.0];

  double v20 = [MEMORY[0x1E4F94140] rowWithTitle:@"Widget Scale Overshoot Duration" valueKeyPath:@"zoomDownWidgetScaleOvershootDuration"];
  v220 = [v20 between:0.0 and:10.0];

  v219 = [MEMORY[0x1E4F94138] rowWithTitle:@"Arc Swipe" childSettingsKeyPath:@"arcSwipeSettings"];
  v218 = [MEMORY[0x1E4F94138] rowWithTitle:@"Arc Swipe Switcher Glancing" childSettingsKeyPath:@"arcSwipeSwitcherGlancingSettings"];
  v217 = [MEMORY[0x1E4F94138] rowWithTitle:@"App to Switcher Swipe Up Corner Radius" childSettingsKeyPath:@"appToSwitcherCornerRadiusSettings"];
  v216 = [MEMORY[0x1E4F94138] rowWithTitle:@"Card Fly In" childSettingsKeyPath:@"cardFlyInSettings"];
  v21 = [MEMORY[0x1E4F94140] rowWithTitle:@"Acceleration Dip Threshold" valueKeyPath:@"cardFlyInAccelerationDipThreshold"];
  v215 = [v21 between:0.0 and:100000.0];

  v22 = [MEMORY[0x1E4F94140] rowWithTitle:@"Min Touch Samples For Acceleration Dip" valueKeyPath:@"_minimumTouchSamplesForAccelerationDip"];
  v23 = [v22 between:0.0 and:100.0];
  v214 = [v23 precision:0];

  v213 = [MEMORY[0x1E4F94138] rowWithTitle:@"Reduce Motion Arc Swipe" childSettingsKeyPath:@"reduceMotionArcSwipeSettings"];
  CAFrameRateRange v180 = [MEMORY[0x1E4F94138] rowWithTitle:@"Reduce Motion App To Switcher" childSettingsKeyPath:@"reduceMotionAppToSwitcherSettings"];
  v24 = [MEMORY[0x1E4F94140] rowWithTitle:@"Reduce Motion Trigger Delay" valueKeyPath:@"reduceMotionTriggerDelay"];
  CAFrameRateRange v179 = [v24 between:0.0 and:1.0];

  v25 = [MEMORY[0x1E4F94140] rowWithTitle:@"Zoom Down Velocity Y Minimum" valueKeyPath:@"zoomDownVelocityYMinimum"];
  CAFrameRateRange v178 = [v25 between:0.0 and:10000.0];

  v26 = [MEMORY[0x1E4F94140] rowWithTitle:@"Zoom Down Velocity Y Maximum" valueKeyPath:@"zoomDownVelocityYMaximum"];
  CAFrameRateRange v177 = [v26 between:0.0 and:10000.0];

  v27 = [MEMORY[0x1E4F94140] rowWithTitle:@"Zoom Down Velocity Y Multiplier" valueKeyPath:@"zoomDownVelocityYLayoutResponseMultiplier"];
  CAFrameRateRange v176 = [v27 between:0.0 and:2.0];

  v28 = [MEMORY[0x1E4F94140] rowWithTitle:@"Zoom Down Velocity X Minimum" valueKeyPath:@"zoomDownVelocityXMinimum"];
  CAFrameRateRange v175 = [v28 between:0.0 and:10000.0];

  v29 = [MEMORY[0x1E4F94140] rowWithTitle:@"Zoom Down Velocity X Maximum" valueKeyPath:@"zoomDownVelocityXMaximum"];
  CAFrameRateRange v174 = [v29 between:0.0 and:10000.0];

  v30 = [MEMORY[0x1E4F94140] rowWithTitle:@"Zoom Down Velocity X Multiplier" valueKeyPath:@"zoomDownVelocityXPositionResponseMultiplier"];
  CAFrameRateRange v173 = [v30 between:0.0 and:2.0];

  v31 = (void *)MEMORY[0x1E4F94168];
  v282[0] = v241;
  v282[1] = v240;
  v282[2] = v239;
  v282[3] = v238;
  v282[4] = v237;
  v282[5] = v236;
  v282[6] = v235;
  v282[7] = v234;
  v282[8] = v233;
  v282[9] = v232;
  v282[10] = v231;
  v282[11] = v230;
  v282[12] = v229;
  v282[13] = v228;
  v282[14] = v227;
  v282[15] = v226;
  v282[16] = v225;
  v282[17] = v224;
  v282[18] = v223;
  v282[19] = v222;
  v282[20] = v221;
  v282[21] = v220;
  v282[22] = v219;
  v282[23] = v218;
  v282[24] = v216;
  v282[25] = v215;
  v282[26] = v214;
  v282[27] = v217;
  v282[28] = v213;
  v282[29] = v180;
  v282[30] = v179;
  v282[31] = v178;
  v282[32] = v177;
  v282[33] = v176;
  v282[34] = v175;
  v282[35] = v174;
  v282[36] = v173;
  v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v282 count:37];
  v212 = [v31 sectionWithRows:v32 title:@"Home Gesture Settings"];

  CAFrameRateRange v172 = [MEMORY[0x1E4F941E8] rowWithTitle:@"Allow Icon Zoom From Medium Widgets" valueKeyPath:@"allowIconZoomFromMediumWidgets"];
  CAFrameRateRange v171 = [MEMORY[0x1E4F941E8] rowWithTitle:@"Allow Icon Zoom From Large Widgets" valueKeyPath:@"allowIconZoomFromLargeWidgets"];
  v33 = (void *)MEMORY[0x1E4F94168];
  v281[0] = v172;
  v281[1] = v171;
  v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:v281 count:2];
  v211 = [v33 sectionWithRows:v34];

  v210 = [MEMORY[0x1E4F94138] rowWithTitle:@"Dosido (X Movement)" childSettingsKeyPath:@"dosidoSettings"];
  v209 = [MEMORY[0x1E4F94138] rowWithTitle:@"Dosido Scale Down" childSettingsKeyPath:@"dosidoScaleDownSettings"];
  v208 = [MEMORY[0x1E4F94138] rowWithTitle:@"Dosido Scale Up" childSettingsKeyPath:@"dosidoScaleUpSettings"];
  uint64_t v35 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Dosido Scale" valueKeyPath:@"dosidoScale"];
  CAFrameRateRange v170 = [v35 minValue:0.0 maxValue:1.0];

  int v36 = [MEMORY[0x1E4F94140] rowWithTitle:@"Dosido Scale Up Delay" valueKeyPath:@"dosidoScaleUpDelay"];
  CAFrameRateRange v169 = [v36 between:0.0 and:1.0];

  CAFrameRateRange v168 = [MEMORY[0x1E4F94138] rowWithTitle:@"Crossblur Dosido" childSettingsKeyPath:@"crossblurDosidoSettings"];
  double v37 = [MEMORY[0x1E4F94140] rowWithTitle:@"Crossblur Dosido Small Scale" valueKeyPath:@"crossblurDosidoSmallScale"];
  CAFrameRateRange v167 = [v37 between:0.0 and:0.01];

  v38 = [MEMORY[0x1E4F94140] rowWithTitle:@"Crossblur Dosido Center Zoom Up Small Scale" valueKeyPath:@"crossblurDosidoCenterZoomUpSmallScale"];
  CAFrameRateRange v166 = [v38 between:0.0 and:1.0];

  double v39 = [MEMORY[0x1E4F94140] rowWithTitle:@"Crossblur Dosido Large Scale" valueKeyPath:@"crossblurDosidoLargeScale"];
  CAFrameRateRange v165 = [v39 between:0.0 and:10.0];

  double v40 = [MEMORY[0x1E4F94140] rowWithTitle:@"Crossblur Dosido Blur Radius" valueKeyPath:@"crossblurDosidoBlurRadius"];
  CAFrameRateRange v164 = [v40 between:0.0 and:100.0];

  uint64_t v41 = [MEMORY[0x1E4F94140] rowWithTitle:@"Crossblur Rasterization Scale" valueKeyPath:@"crossblurRasterizationScale"];
  CAFrameRateRange v163 = [v41 between:0.0 and:5.0];

  CAFrameRateRange v162 = [MEMORY[0x1E4F94138] rowWithTitle:@"Crossfade Dosido" childSettingsKeyPath:@"crossfadeDosidoSettings"];
  double v42 = (void *)MEMORY[0x1E4F94168];
  v280[0] = v210;
  v280[1] = v209;
  v280[2] = v208;
  v280[3] = v170;
  v280[4] = v169;
  v280[5] = v168;
  v280[6] = v166;
  v280[7] = v167;
  v280[8] = v165;
  v280[9] = v164;
  v280[10] = v163;
  v280[11] = v162;
  CAFrameRateRange v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:v280 count:12];
  v207 = [v42 sectionWithRows:v43 title:@"Dosido"];

  CAFrameRateRange v44 = (void *)MEMORY[0x1E4F94168];
  CAFrameRateRange v45 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Disable Async Rendering (Transition %)" valueKeyPath:@"disableAsyncRenderingTransitionPercentage"];
  CAFrameRateRange v46 = [v45 minValue:0.0 maxValue:1.0];
  v279 = v46;
  CAFrameRateRange v47 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v279 count:1];
  v206 = [v44 sectionWithRows:v47];

  CAFrameRateRange v48 = (void *)MEMORY[0x1E4F94168];
  CAFrameRateRange v49 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Disallow Accelerated Home Button Press (Transition %)" valueKeyPath:@"disallowAcceleratedHomeButtonPressTransitionPercentage"];
  CAFrameRateRange v50 = [v49 minValue:0.0 maxValue:1.0];
  v278 = v50;
  CAFrameRateRange v51 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v278 count:1];
  v205 = [v48 sectionWithRows:v51];

  CAFrameRateRange v52 = (void *)MEMORY[0x1E4F94168];
  CAFrameRateRange v53 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Disable Tap During Morph From InApp View Transition Delay" valueKeyPath:@"disableTapDuringMorphFromInAppViewTransitionDelay"];
  CAFrameRateRange v54 = [v53 minValue:0.0 maxValue:1.0];
  v277 = v54;
  CAFrameRateRange v55 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v277 count:1];
  v204 = [v52 sectionWithRows:v55];

  CAFrameRateRange v161 = [MEMORY[0x1E4F94138] rowWithTitle:@"Alert Cardified Dismissal" childSettingsKeyPath:@"alertCardifiedDismissalSettings"];
  CAFrameRateRange v56 = (void *)MEMORY[0x1E4F94168];
  v276[0] = v161;
  CAFrameRateRange v57 = [MEMORY[0x1E4F94140] rowWithTitle:@"Alert Cardified Haptic Delay" valueKeyPath:@"alertCardifiedDismissHapticDelay"];
  v276[1] = v57;
  CAFrameRateRange v58 = [MEMORY[0x1E4F94140] rowWithTitle:@"Alert Cardified Zoom Out Delay" valueKeyPath:@"alertCardifiedDismissZoomOutDelay"];
  v276[2] = v58;
  CAFrameRateRange v59 = [MEMORY[0x1E4F94140] rowWithTitle:@"Alert Cardified Client Animations Delay" valueKeyPath:@"alertCardifiedDismissClientAnimationsDelay"];
  v276[3] = v59;
  CAFrameRateRange v60 = [MEMORY[0x1E4F1C978] arrayWithObjects:v276 count:4];
  v203 = [v56 sectionWithRows:v60];

  uint64_t v160 = [MEMORY[0x1E4F94138] rowWithTitle:@"Alert Bar Swipe Dismissal" childSettingsKeyPath:@"alertBarSwipeDismissalSettings"];
  CAFrameRateRange v61 = (void *)MEMORY[0x1E4F94168];
  v275[0] = v160;
  CAFrameRateRange v62 = [MEMORY[0x1E4F94140] rowWithTitle:@"Alert Bar Swipe Haptic Delay" valueKeyPath:@"alertBarSwipeDismissHapticDelay"];
  v275[1] = v62;
  CAFrameRateRange v63 = [MEMORY[0x1E4F94140] rowWithTitle:@"Alert Bar Swipe Zoom Out Delay" valueKeyPath:@"alertBarSwipeDismissZoomOutDelay"];
  v275[2] = v63;
  CAFrameRateRange v64 = [MEMORY[0x1E4F94140] rowWithTitle:@"Alert Bar Swipe Client Animations Delay" valueKeyPath:@"alertBarSwipeDismissClientAnimationsDelay"];
  v275[3] = v64;
  v65 = [MEMORY[0x1E4F1C978] arrayWithObjects:v275 count:4];
  v202 = [v61 sectionWithRows:v65];

  v159 = [MEMORY[0x1E4F94138] rowWithTitle:@"Siri Swipe Dismissal" childSettingsKeyPath:@"siriSwipeDismissalSettings"];
  v66 = (void *)MEMORY[0x1E4F94168];
  v274[0] = v159;
  v67 = [MEMORY[0x1E4F94140] rowWithTitle:@"Siri Swipe Haptic Delay" valueKeyPath:@"siriSwipeDismissHapticDelay"];
  v274[1] = v67;
  v68 = [MEMORY[0x1E4F94140] rowWithTitle:@"Siri Swipe Zoom Out Delay" valueKeyPath:@"siriSwipeDismissZoomOutDelay"];
  v274[2] = v68;
  v69 = [MEMORY[0x1E4F94140] rowWithTitle:@"Siri Swipe Client Animations Delay" valueKeyPath:@"siriSwipeDismissClientAnimationsDelay"];
  v274[3] = v69;
  v70 = [MEMORY[0x1E4F1C978] arrayWithObjects:v274 count:4];
  v200 = [v66 sectionWithRows:v70];

  v71 = [MEMORY[0x1E4F94140] rowWithTitle:@"Reopen Button Initial Scale" valueKeyPath:@"reopenButtonInitialScale"];
  long long v158 = [v71 between:0.0 and:1.0];

  long long v157 = [MEMORY[0x1E4F94140] rowWithTitle:@"Reopen Button Fade In Delay" valueKeyPath:@"reopenButtonFadeInDelay"];
  long long v156 = [MEMORY[0x1E4F94138] rowWithTitle:@"Card Fly In" childSettingsKeyPath:@"reopenButtonScaleSettings"];
  v72 = (void *)MEMORY[0x1E4F94168];
  v273[0] = v158;
  v273[1] = v157;
  v273[2] = v156;
  v73 = [MEMORY[0x1E4F1C978] arrayWithObjects:v273 count:3];
  v201 = [v72 sectionWithRows:v73];

  long long v155 = [MEMORY[0x1E4F94138] rowWithTitle:@"Banner Unfurl" childSettingsKeyPath:@"bannerUnfurlSettings"];
  v154 = [MEMORY[0x1E4F94138] rowWithTitle:@"Banner Unfurl Wallpaper Alpha" childSettingsKeyPath:@"bannerUnfurlWallpaperAlphaSettings"];
  v74 = (void *)MEMORY[0x1E4F94168];
  v272[0] = v155;
  v272[1] = v154;
  v75 = [MEMORY[0x1E4F1C978] arrayWithObjects:v272 count:2];
  double v153 = [v74 sectionWithRows:v75];

  v76 = [MEMORY[0x1E4F1CA48] array];
  v77 = [MEMORY[0x1E4F94140] rowWithTitle:@"Home Screen Blur in Switcher" valueKeyPath:@"homeScreenBlurInSwitcher"];
  v78 = [v77 between:0.0 and:1.0];
  [v76 addObject:v78];

  v79 = [MEMORY[0x1E4F94140] rowWithTitle:@"Home Screen Blur in Switcher (Reduce Motion Enabled)" valueKeyPath:@"homeScreenBlurInSwitcherReduceMotionEnabled"];
  v80 = [v79 between:0.0 and:1.0];
  [v76 addObject:v80];

  v81 = [MEMORY[0x1E4F94140] rowWithTitle:@"Home Screen Blur in Application" valueKeyPath:@"homeScreenBlurInApplication"];
  v82 = [v81 between:0.0 and:1.0];
  [v76 addObject:v82];

  v83 = [MEMORY[0x1E4F94140] rowWithTitle:@"Home Screen Blur in Assistant" valueKeyPath:@"homeScreenBlurInAssistant"];
  v84 = [v83 between:0.0 and:1.0];
  v85 = [v84 precision:3];
  [v76 addObject:v85];

  v86 = [MEMORY[0x1E4F94140] rowWithTitle:@"Home Screen Opacity in Switcher" valueKeyPath:@"homeScreenOpacityInSwitcher"];
  v87 = [v86 between:0.0 and:1.0];
  [v76 addObject:v87];

  v88 = [MEMORY[0x1E4F94140] rowWithTitle:@"Home Screen Opacity in Application" valueKeyPath:@"homeScreenOpacityInApplication"];
  v89 = [v88 between:0.0 and:1.0];
  [v76 addObject:v89];

  v90 = [MEMORY[0x1E4F94140] rowWithTitle:@"Home Screen Scale in Switcher" valueKeyPath:@"homeScreenScaleInSwitcher"];
  v91 = [v90 between:0.0 and:2.0];
  [v76 addObject:v91];

  v92 = [MEMORY[0x1E4F94140] rowWithTitle:@"Home Screen Scale in Application" valueKeyPath:@"homeScreenScaleInApplication"];
  v93 = [v92 between:0.0 and:2.0];
  [v76 addObject:v93];

  v94 = [MEMORY[0x1E4F94140] rowWithTitle:@"Home Screen Scale in Assistant" valueKeyPath:@"homeScreenScaleInAssistant"];
  v95 = [v94 between:0.0 and:2.0];
  [v76 addObject:v95];

  v96 = [MEMORY[0x1E4F94140] rowWithTitle:@"Wallpaper Scale in Switcher" valueKeyPath:@"wallpaperScaleInSwitcher"];
  v97 = [v96 between:0.0 and:2.0];
  [v76 addObject:v97];

  v98 = [MEMORY[0x1E4F94140] rowWithTitle:@"Wallpaper Scale in Application" valueKeyPath:@"wallpaperScaleInApplication"];
  v99 = [v98 between:0.0 and:2.0];
  [v76 addObject:v99];

  v100 = [MEMORY[0x1E4F94140] rowWithTitle:@"Dimming Alpha in Switcher" valueKeyPath:@"dimmingAlphaInSwitcher"];
  v101 = [v100 between:0.0 and:1.0];
  [v76 addObject:v101];

  v102 = [MEMORY[0x1E4F94140] rowWithTitle:@"Dimming Alpha in Application" valueKeyPath:@"dimmingAlphaInApplication"];
  v103 = [v102 between:0.0 and:1.0];
  [v76 addObject:v103];

  v104 = [MEMORY[0x1E4F94140] rowWithTitle:@"RM Crossfade Duration" valueKeyPath:@"reduceMotionCrossfadeDuration"];
  v105 = [v104 between:0.0 and:1.0];
  [v76 addObject:v105];

  v199 = [MEMORY[0x1E4F94168] sectionWithRows:v76];
  v106 = (void *)MEMORY[0x1E4F94100];
  v107 = [MEMORY[0x1E4F94178] actionWithSettingsKeyPath:0];
  uint64_t v152 = [v106 rowWithTitle:@"Restore Defaults" action:v107];

  uint64_t v108 = (void *)MEMORY[0x1E4F94168];
  v271 = v152;
  double v109 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v271 count:1];
  v198 = [v108 sectionWithRows:v109];

  v151 = [MEMORY[0x1E4F94140] rowWithTitle:@"Icon Hide Delay" valueKeyPath:@"iconZoomFloatingDockFadeDelay"];
  v110 = (void *)MEMORY[0x1E4F94168];
  v270 = v151;
  v111 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v270 count:1];
  v141 = [v110 sectionWithRows:v111];

  double v150 = [MEMORY[0x1E4F94140] rowWithTitle:@"Empty Switcher Dismiss Delay" valueKeyPath:@"emptySwitcherDismissDelay"];
  v112 = (void *)MEMORY[0x1E4F94168];
  v269 = v150;
  v113 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v269 count:1];
  uint64_t v147 = [v112 sectionWithRows:v113];

  int v149 = [MEMORY[0x1E4F94140] rowWithTitle:@"Resize Blur Delay" valueKeyPath:@"resizeBlurDelay"];
  v114 = (void *)MEMORY[0x1E4F94168];
  v268 = v149;
  v115 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v268 count:1];
  v146 = [v114 sectionWithRows:v115];

  v116 = [MEMORY[0x1E4F94140] rowWithTitle:@"Title & Icon Fade In Slowness Factor" valueKeyPath:@"appSwitcherTitleAndIconFadeInSlowDownFactor"];
  double v148 = [v116 between:1.0 and:10.0];

  v117 = (void *)MEMORY[0x1E4F94168];
  v267 = v148;
  v118 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v267 count:1];
  v142 = [v117 sectionWithRows:v118];

  double v145 = [MEMORY[0x1E4F94138] rowWithTitle:@"Pulse" childSettingsKeyPath:@"pulseScaleSettings"];
  v119 = [MEMORY[0x1E4F94140] rowWithTitle:@"Pulse Scale" valueKeyPath:@"pulseScale"];
  int v144 = [v119 between:0.0 and:1.0];

  v120 = [MEMORY[0x1E4F94140] rowWithTitle:@"Pulse Second Stage Delay" valueKeyPath:@"pulseSecondStageDelay"];
  uint64_t v143 = [v120 between:0.0 and:1.0];

  v121 = (void *)MEMORY[0x1E4F94168];
  v266[0] = v145;
  v266[1] = v144;
  v266[2] = v143;
  v122 = [MEMORY[0x1E4F1C978] arrayWithObjects:v266 count:3];
  v123 = [v121 sectionWithRows:v122];

  v124 = [MEMORY[0x1E4F94140] rowWithTitle:@"Initial Blur" valueKeyPath:@"homeScreenCenterZoomInitialBlur"];
  v140 = [v124 between:0.0 and:200.0];

  v125 = [MEMORY[0x1E4F94140] rowWithTitle:@"Initial Scale" valueKeyPath:@"homeScreenCenterZoomInitialScale"];
  v139 = [v125 between:0.0 and:1.0];

  uint64_t v126 = [MEMORY[0x1E4F94140] rowWithTitle:@"Initial Opacity" valueKeyPath:@"homeScreenCenterZoomInitialOpacity"];
  v138 = [v126 between:0.0 and:1.0];

  uint64_t v127 = [MEMORY[0x1E4F94140] rowWithTitle:@"Target Scale Unblur Complete" valueKeyPath:@"homeScreenCenterZoomTargetScaleWhenUnblurringIsComplete"];
  uint64_t v128 = [v127 between:0.0 and:1.0];

  v129 = [MEMORY[0x1E4F94140] rowWithTitle:@"Y Off Percent ScreenHeight" valueKeyPath:@"homeScreenCenterZoomYOffsetPercentOfScreenHeight"];
  uint64_t v130 = [v129 between:-1.0 and:1.0];

  v131 = (void *)MEMORY[0x1E4F94168];
  v265[0] = v140;
  v265[1] = v139;
  v265[2] = v138;
  v265[3] = v128;
  v265[4] = v130;
  v132 = [MEMORY[0x1E4F1C978] arrayWithObjects:v265 count:5];
  uint64_t v133 = [v131 sectionWithRows:v132 title:@"Home Screen Center Zoom"];

  v134 = (void *)MEMORY[0x1E4F94168];
  v264[0] = v198;
  v264[1] = v245;
  v264[2] = v244;
  v264[3] = v243;
  v264[4] = v242;
  v264[5] = v212;
  v264[6] = v211;
  v264[7] = v207;
  v264[8] = v199;
  v264[9] = v141;
  v264[10] = v147;
  v264[11] = v146;
  v264[12] = v142;
  v264[13] = v206;
  v264[14] = v205;
  v264[15] = v204;
  v264[16] = v203;
  v264[17] = v202;
  v264[18] = v200;
  v264[19] = v201;
  v264[20] = v153;
  v264[21] = v123;
  v264[22] = v133;
  v135 = [MEMORY[0x1E4F1C978] arrayWithObjects:v264 count:23];
  v136 = [v134 moduleWithTitle:@"Deck Switcher Behaviors" contents:v135];

  return v136;
}

- (void)setLayoutSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)zoomUpSettings
{
  return self->_zoomUpSettings;
}

- (void)setZoomUpSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)iconZoomDownSettings
{
  return self->_iconZoomDownSettings;
}

- (void)setIconZoomDownSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)floatingDockIconFadeSettings
{
  return self->_floatingDockIconFadeSettings;
}

- (void)setFloatingDockIconFadeSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)switcherZoomDownIconFadeOutSettings
{
  return self->_switcherZoomDownIconFadeOutSettings;
}

- (void)setSwitcherZoomDownIconFadeOutSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)iconFadeInSettings
{
  return self->_iconFadeInSettings;
}

- (void)setIconFadeInSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)switcherFadeOutSettings
{
  return self->_switcherFadeOutSettings;
}

- (void)setSwitcherFadeOutSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)centerZoomSettings
{
  return self->_centerZoomSettings;
}

- (void)setCenterZoomSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)slideOverSettings
{
  return self->_slideOverSettings;
}

- (void)setSlideOverSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)switcherToHomeSettings
{
  return self->_switcherToHomeSettings;
}

- (void)setSwitcherToHomeSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)switcherToHomeOpacitySettings
{
  return self->_switcherToHomeOpacitySettings;
}

- (void)setSwitcherToHomeOpacitySettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)toggleAppSwitcherSettings
{
  return self->_toggleAppSwitcherSettings;
}

- (void)setToggleAppSwitcherSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)launchAppFromSwitcherSettings
{
  return self->_launchAppFromSwitcherSettings;
}

- (void)setLaunchAppFromSwitcherSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)continuityBannerSlideUpSettings
{
  return self->_continuityBannerSlideUpSettings;
}

- (void)setContinuityBannerSlideUpSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)stackedSwitcherTrackingSettings
{
  return self->_stackedSwitcherTrackingSettings;
}

- (void)setStackedSwitcherTrackingSettings:(id)a3
{
}

- (BOOL)performTwoPhaseFullScreenToPeekTransition
{
  return self->_performTwoPhaseFullScreenToPeekTransition;
}

- (void)setPerformTwoPhaseFullScreenToPeekTransition:(BOOL)a3
{
  self->_performTwoPhaseFullScreenToPeekTransition = a3;
}

- (SBFFluidBehaviorSettings)fullScreenToPeekFirstPhaseAnimationSettings
{
  return self->_fullScreenToPeekFirstPhaseAnimationSettings;
}

- (void)setFullScreenToPeekFirstPhaseAnimationSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)fullScreenToPeekSecondPhaseAnimationSettings
{
  return self->_fullScreenToPeekSecondPhaseAnimationSettings;
}

- (void)setFullScreenToPeekSecondPhaseAnimationSettings:(id)a3
{
}

- (double)fullScreenToPeekSecondPhaseAnimationDelay
{
  return self->_fullScreenToPeekSecondPhaseAnimationDelay;
}

- (void)setFullScreenToPeekSecondPhaseAnimationDelay:(double)a3
{
  self->_fullScreenToPeekSecondPhaseAnimationDelay = a3;
}

- (SBFFluidBehaviorSettings)splitViewToSlideOverSettings
{
  return self->_splitViewToSlideOverSettings;
}

- (void)setSplitViewToSlideOverSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)slideOverToFullScreenAnimationSettings
{
  return self->_slideOverToFullScreenAnimationSettings;
}

- (void)setSlideOverToFullScreenAnimationSettings:(id)a3
{
}

- (double)slideOverToFullScreenOutgoingAppScaleBack
{
  return self->_slideOverToFullScreenOutgoingAppScaleBack;
}

- (void)setSlideOverToFullScreenOutgoingAppScaleBack:(double)a3
{
  self->_slideOverToFullScreenOutgoingAppScaleBack = a3;
}

- (double)slideOverToFullScreenOutgoingFinalOpacity
{
  return self->_slideOverToFullScreenOutgoingFinalOpacity;
}

- (void)setSlideOverToFullScreenOutgoingFinalOpacity:(double)a3
{
  self->_slideOverToFullScreenOutgoingFinalOpacity = a3;
}

- (SBFFluidBehaviorSettings)centerToSlideOverAnimationSettings
{
  return self->_centerToSlideOverAnimationSettings;
}

- (void)setCenterToSlideOverAnimationSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)swapAppSidesLayoutAnimationSettings
{
  return self->_swapAppSidesLayoutAnimationSettings;
}

- (void)setSwapAppSidesLayoutAnimationSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)swapAppSidesOpacityAnimationSettings
{
  return self->_swapAppSidesOpacityAnimationSettings;
}

- (void)setSwapAppSidesOpacityAnimationSettings:(id)a3
{
}

- (double)swapAppSidesShadowFadeOutDelay
{
  return self->_swapAppSidesShadowFadeOutDelay;
}

- (void)setSwapAppSidesShadowFadeOutDelay:(double)a3
{
  self->_swapAppSidesShadowFadeOutDelay = a3;
}

- (void)setHomeGestureCenterRowZoomUpSettings:(id)a3
{
}

- (void)setHomeGestureEdgeRowZoomUpSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)homeGestureTopRowZoomDownLayoutSettings
{
  return self->_homeGestureTopRowZoomDownLayoutSettings;
}

- (void)setHomeGestureTopRowZoomDownLayoutSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)homeGestureTopRowZoomDownPositionSettings
{
  return self->_homeGestureTopRowZoomDownPositionSettings;
}

- (void)setHomeGestureTopRowZoomDownPositionSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)homeGestureTopRowZoomDownScaleSettings
{
  return self->_homeGestureTopRowZoomDownScaleSettings;
}

- (void)setHomeGestureTopRowZoomDownScaleSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)homeGestureBottomRowZoomDownLayoutSettings
{
  return self->_homeGestureBottomRowZoomDownLayoutSettings;
}

- (void)setHomeGestureBottomRowZoomDownLayoutSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)homeGestureBottomRowZoomDownPositionSettings
{
  return self->_homeGestureBottomRowZoomDownPositionSettings;
}

- (void)setHomeGestureBottomRowZoomDownPositionSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)homeGestureBottomRowZoomDownScaleSettings
{
  return self->_homeGestureBottomRowZoomDownScaleSettings;
}

- (void)setHomeGestureBottomRowZoomDownScaleSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)homeGestureSmallWidgetZoomDownLayoutSettings
{
  return self->_homeGestureSmallWidgetZoomDownLayoutSettings;
}

- (void)setHomeGestureSmallWidgetZoomDownLayoutSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)homeGestureSmallWidgetZoomDownPositionSettings
{
  return self->_homeGestureSmallWidgetZoomDownPositionSettings;
}

- (void)setHomeGestureSmallWidgetZoomDownPositionSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)homeGestureSmallWidgetZoomDownScaleSettings
{
  return self->_homeGestureSmallWidgetZoomDownScaleSettings;
}

- (void)setHomeGestureSmallWidgetZoomDownScaleSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)homeGestureMediumWidgetZoomDownLayoutSettings
{
  return self->_homeGestureMediumWidgetZoomDownLayoutSettings;
}

- (void)setHomeGestureMediumWidgetZoomDownLayoutSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)homeGestureMediumWidgetZoomDownPositionSettings
{
  return self->_homeGestureMediumWidgetZoomDownPositionSettings;
}

- (void)setHomeGestureMediumWidgetZoomDownPositionSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)homeGestureMediumWidgetZoomDownScaleSettings
{
  return self->_homeGestureMediumWidgetZoomDownScaleSettings;
}

- (void)setHomeGestureMediumWidgetZoomDownScaleSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)homeGestureLargeWidgetZoomDownLayoutSettings
{
  return self->_homeGestureLargeWidgetZoomDownLayoutSettings;
}

- (void)setHomeGestureLargeWidgetZoomDownLayoutSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)homeGestureLargeWidgetZoomDownPositionSettings
{
  return self->_homeGestureLargeWidgetZoomDownPositionSettings;
}

- (void)setHomeGestureLargeWidgetZoomDownPositionSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)homeGestureLargeWidgetZoomDownScaleSettings
{
  return self->_homeGestureLargeWidgetZoomDownScaleSettings;
}

- (void)setHomeGestureLargeWidgetZoomDownScaleSettings:(id)a3
{
}

- (double)zoomDownWidgetScaleVelocityYMinimum
{
  return self->_zoomDownWidgetScaleVelocityYMinimum;
}

- (void)setZoomDownWidgetScaleVelocityYMinimum:(double)a3
{
  self->_zoomDownWidgetScaleVelocityYMinimum = a3;
}

- (double)zoomDownWidgetScaleVelocityYMaximum
{
  return self->_zoomDownWidgetScaleVelocityYMaximum;
}

- (void)setZoomDownWidgetScaleVelocityYMaximum:(double)a3
{
  self->_zoomDownWidgetScaleVelocityYMaximum = a3;
}

- (double)zoomDownWidgetScaleOvershootMinimumMultiplier
{
  return self->_zoomDownWidgetScaleOvershootMinimumMultiplier;
}

- (void)setZoomDownWidgetScaleOvershootMinimumMultiplier:(double)a3
{
  self->_zoomDownWidgetScaleOvershootMinimumMultiplier = a3;
}

- (double)zoomDownWidgetScaleOvershootMaximumMultiplier
{
  return self->_zoomDownWidgetScaleOvershootMaximumMultiplier;
}

- (void)setZoomDownWidgetScaleOvershootMaximumMultiplier:(double)a3
{
  self->_zoomDownWidgetScaleOvershootMaximumMultiplier = a3;
}

- (double)zoomDownWidgetScaleOvershootDuration
{
  return self->_zoomDownWidgetScaleOvershootDuration;
}

- (void)setZoomDownWidgetScaleOvershootDuration:(double)a3
{
  self->_zoomDownWidgetScaleOvershootDuration = a3;
}

- (SBFFluidBehaviorSettings)arcSwipeSettings
{
  return self->_arcSwipeSettings;
}

- (void)setArcSwipeSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)arcSwipeSwitcherGlancingSettings
{
  return self->_arcSwipeSwitcherGlancingSettings;
}

- (void)setArcSwipeSwitcherGlancingSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)appToSwitcherCornerRadiusSettings
{
  return self->_appToSwitcherCornerRadiusSettings;
}

- (void)setAppToSwitcherCornerRadiusSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)gestureInitiatedAppToSwitcherSettings
{
  return self->_gestureInitiatedAppToSwitcherSettings;
}

- (void)setGestureInitiatedAppToSwitcherSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)cardFlyInSettings
{
  return self->_cardFlyInSettings;
}

- (void)setCardFlyInSettings:(id)a3
{
}

- (double)cardFlyInAccelerationDipThreshold
{
  return self->_cardFlyInAccelerationDipThreshold;
}

- (void)setCardFlyInAccelerationDipThreshold:(double)a3
{
  self->_cardFlyInAccelerationDipThreshold = a3;
}

- (int64_t)minimumTouchSamplesForAccelerationDip
{
  return self->_minimumTouchSamplesForAccelerationDip;
}

- (void)setMinimumTouchSamplesForAccelerationDip:(int64_t)a3
{
  self->_minimumTouchSamplesForAccelerationDip = a3;
}

- (SBFFluidBehaviorSettings)reduceMotionArcSwipeSettings
{
  return self->_reduceMotionArcSwipeSettings;
}

- (void)setReduceMotionArcSwipeSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)reduceMotionAppToSwitcherSettings
{
  return self->_reduceMotionAppToSwitcherSettings;
}

- (void)setReduceMotionAppToSwitcherSettings:(id)a3
{
}

- (double)reduceMotionTriggerDelay
{
  return self->_reduceMotionTriggerDelay;
}

- (void)setReduceMotionTriggerDelay:(double)a3
{
  self->_reduceMotionTriggerDelay = a3;
}

- (double)zoomDownVelocityYMinimum
{
  return self->_zoomDownVelocityYMinimum;
}

- (void)setZoomDownVelocityYMinimum:(double)a3
{
  self->_zoomDownVelocityYMinimum = a3;
}

- (double)zoomDownVelocityYMaximum
{
  return self->_zoomDownVelocityYMaximum;
}

- (void)setZoomDownVelocityYMaximum:(double)a3
{
  self->_zoomDownVelocityYMaximum = a3;
}

- (double)zoomDownVelocityYLayoutResponseMultiplier
{
  return self->_zoomDownVelocityYLayoutResponseMultiplier;
}

- (void)setZoomDownVelocityYLayoutResponseMultiplier:(double)a3
{
  self->_zoomDownVelocityYLayoutResponseMultiplier = a3;
}

- (double)zoomDownVelocityXMinimum
{
  return self->_zoomDownVelocityXMinimum;
}

- (void)setZoomDownVelocityXMinimum:(double)a3
{
  self->_zoomDownVelocityXMinimum = a3;
}

- (double)zoomDownVelocityXMaximum
{
  return self->_zoomDownVelocityXMaximum;
}

- (void)setZoomDownVelocityXMaximum:(double)a3
{
  self->_zoomDownVelocityXMaximum = a3;
}

- (double)zoomDownVelocityXPositionResponseMultiplier
{
  return self->_zoomDownVelocityXPositionResponseMultiplier;
}

- (void)setZoomDownVelocityXPositionResponseMultiplier:(double)a3
{
  self->_zoomDownVelocityXPositionResponseMultiplier = a3;
}

- (double)appToSwitcherTransitionMinCardScaleFactor
{
  return self->_appToSwitcherTransitionMinCardScaleFactor;
}

- (void)setAppToSwitcherTransitionMinCardScaleFactor:(double)a3
{
  self->_appToSwitcherTransitionMinCardScaleFactor = a3;
}

- (BOOL)allowIconZoomFromMediumWidgets
{
  return self->_allowIconZoomFromMediumWidgets;
}

- (void)setAllowIconZoomFromMediumWidgets:(BOOL)a3
{
  self->_allowIconZoomFromMediumWidgets = a3;
}

- (BOOL)allowIconZoomFromLargeWidgets
{
  return self->_allowIconZoomFromLargeWidgets;
}

- (void)setAllowIconZoomFromLargeWidgets:(BOOL)a3
{
  self->_allowIconZoomFromLargeWidgets = a3;
}

- (SBFFluidBehaviorSettings)dosidoSettings
{
  return self->_dosidoSettings;
}

- (void)setDosidoSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)dosidoScaleDownSettings
{
  return self->_dosidoScaleDownSettings;
}

- (void)setDosidoScaleDownSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)dosidoScaleUpSettings
{
  return self->_dosidoScaleUpSettings;
}

- (void)setDosidoScaleUpSettings:(id)a3
{
}

- (double)dosidoScale
{
  return self->_dosidoScale;
}

- (void)setDosidoScale:(double)a3
{
  self->_dosidoScale = a3;
}

- (double)dosidoScaleUpDelay
{
  return self->_dosidoScaleUpDelay;
}

- (void)setDosidoScaleUpDelay:(double)a3
{
  self->_dosidoScaleUpDelay = a3;
}

- (void)setCrossblurDosidoSettings:(id)a3
{
}

- (double)crossblurDosidoCenterZoomUpSmallScale
{
  return self->_crossblurDosidoCenterZoomUpSmallScale;
}

- (void)setCrossblurDosidoCenterZoomUpSmallScale:(double)a3
{
  self->_crossblurDosidoCenterZoomUpSmallScale = a3;
}

- (double)crossblurDosidoSmallScale
{
  return self->_crossblurDosidoSmallScale;
}

- (void)setCrossblurDosidoSmallScale:(double)a3
{
  self->_crossblurDosidoSmallScale = a3;
}

- (double)crossblurDosidoLargeScale
{
  return self->_crossblurDosidoLargeScale;
}

- (void)setCrossblurDosidoLargeScale:(double)a3
{
  self->_crossblurDosidoLargeScale = a3;
}

- (void)setCrossblurDosidoBlurRadius:(double)a3
{
  self->_crossblurDosidoBlurRadius = a3;
}

- (void)setCrossblurRasterizationScale:(double)a3
{
  self->_crossblurRasterizationScale = a3;
}

- (SBFFluidBehaviorSettings)crossfadeDosidoSettings
{
  return self->_crossfadeDosidoSettings;
}

- (void)setCrossfadeDosidoSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)slideUpSettings
{
  return self->_slideUpSettings;
}

- (void)setSlideUpSettings:(id)a3
{
}

- (void)setBackdropBlurSettings:(id)a3
{
}

- (void)setHomeScreenOpacitySettings:(id)a3
{
}

- (void)setHomeScreenScaleSettings:(id)a3
{
}

- (void)setOpacitySettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)centerZoomOpacitySettings
{
  return self->_centerZoomOpacitySettings;
}

- (void)setCenterZoomOpacitySettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)swipeToKillOpacitySettings
{
  return self->_swipeToKillOpacitySettings;
}

- (void)setSwipeToKillOpacitySettings:(id)a3
{
}

- (void)setWallpaperScaleSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)appSelectionSquishSettings
{
  return self->_appSelectionSquishSettings;
}

- (void)setAppSelectionSquishSettings:(id)a3
{
}

- (void)setStatusBarFadeInSettings:(id)a3
{
}

- (void)setStatusBarFadeOutSettings:(id)a3
{
}

- (double)statusBarToApexBounceAnimationDuration
{
  return self->_statusBarToApexBounceAnimationDuration;
}

- (void)setStatusBarToApexBounceAnimationDuration:(double)a3
{
  self->_statusBarToApexBounceAnimationDuration = a3;
}

- (double)statusBarFromApexBounceAnimationDuration
{
  return self->_statusBarFromApexBounceAnimationDuration;
}

- (void)setStatusBarFromApexBounceAnimationDuration:(double)a3
{
  self->_statusBarFromApexBounceAnimationDuration = a3;
}

- (SBFFluidBehaviorSettings)alertCardifiedDismissalSettings
{
  return self->_alertCardifiedDismissalSettings;
}

- (void)setAlertCardifiedDismissalSettings:(id)a3
{
}

- (double)alertCardifiedDismissHapticDelay
{
  return self->_alertCardifiedDismissHapticDelay;
}

- (void)setAlertCardifiedDismissHapticDelay:(double)a3
{
  self->_alertCardifiedDismissHapticDelay = a3;
}

- (double)alertCardifiedDismissZoomOutDelay
{
  return self->_alertCardifiedDismissZoomOutDelay;
}

- (void)setAlertCardifiedDismissZoomOutDelay:(double)a3
{
  self->_alertCardifiedDismissZoomOutDelay = a3;
}

- (double)alertCardifiedDismissClientAnimationsDelay
{
  return self->_alertCardifiedDismissClientAnimationsDelay;
}

- (void)setAlertCardifiedDismissClientAnimationsDelay:(double)a3
{
  self->_alertCardifiedDismissClientAnimationsDelay = a3;
}

- (SBFFluidBehaviorSettings)alertBarSwipeDismissalSettings
{
  return self->_alertBarSwipeDismissalSettings;
}

- (void)setAlertBarSwipeDismissalSettings:(id)a3
{
}

- (double)alertBarSwipeDismissHapticDelay
{
  return self->_alertBarSwipeDismissHapticDelay;
}

- (void)setAlertBarSwipeDismissHapticDelay:(double)a3
{
  self->_alertBarSwipeDismissHapticDelay = a3;
}

- (double)alertBarSwipeDismissZoomOutDelay
{
  return self->_alertBarSwipeDismissZoomOutDelay;
}

- (void)setAlertBarSwipeDismissZoomOutDelay:(double)a3
{
  self->_alertBarSwipeDismissZoomOutDelay = a3;
}

- (double)alertBarSwipeDismissClientAnimationsDelay
{
  return self->_alertBarSwipeDismissClientAnimationsDelay;
}

- (void)setAlertBarSwipeDismissClientAnimationsDelay:(double)a3
{
  self->_alertBarSwipeDismissClientAnimationsDelay = a3;
}

- (SBFFluidBehaviorSettings)siriSwipeDismissalSettings
{
  return self->_siriSwipeDismissalSettings;
}

- (void)setSiriSwipeDismissalSettings:(id)a3
{
}

- (double)siriSwipeDismissHapticDelay
{
  return self->_siriSwipeDismissHapticDelay;
}

- (void)setSiriSwipeDismissHapticDelay:(double)a3
{
  self->_siriSwipeDismissHapticDelay = a3;
}

- (double)siriSwipeDismissZoomOutDelay
{
  return self->_siriSwipeDismissZoomOutDelay;
}

- (void)setSiriSwipeDismissZoomOutDelay:(double)a3
{
  self->_siriSwipeDismissZoomOutDelay = a3;
}

- (double)siriSwipeDismissClientAnimationsDelay
{
  return self->_siriSwipeDismissClientAnimationsDelay;
}

- (void)setSiriSwipeDismissClientAnimationsDelay:(double)a3
{
  self->_siriSwipeDismissClientAnimationsDelay = a3;
}

- (SBFFluidBehaviorSettings)reopenButtonScaleSettings
{
  return self->_reopenButtonScaleSettings;
}

- (void)setReopenButtonScaleSettings:(id)a3
{
}

- (double)reopenButtonInitialScale
{
  return self->_reopenButtonInitialScale;
}

- (void)setReopenButtonInitialScale:(double)a3
{
  self->_reopenButtonInitialScale = a3;
}

- (double)reopenButtonFadeInDelay
{
  return self->_reopenButtonFadeInDelay;
}

- (void)setReopenButtonFadeInDelay:(double)a3
{
  self->_reopenButtonFadeInDelay = a3;
}

- (SBFFluidBehaviorSettings)bannerUnfurlSettings
{
  return self->_bannerUnfurlSettings;
}

- (void)setBannerUnfurlSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)bannerUnfurlWallpaperAlphaSettings
{
  return self->_bannerUnfurlWallpaperAlphaSettings;
}

- (void)setBannerUnfurlWallpaperAlphaSettings:(id)a3
{
}

- (double)bannerUnfurlWallpaperAlphaDelay
{
  return self->_bannerUnfurlWallpaperAlphaDelay;
}

- (void)setBannerUnfurlWallpaperAlphaDelay:(double)a3
{
  self->_bannerUnfurlWallpaperAlphaDelay = a3;
}

- (SBFFluidBehaviorSettings)pulseScaleSettings
{
  return self->_pulseScaleSettings;
}

- (void)setPulseScaleSettings:(id)a3
{
}

- (double)pulseScale
{
  return self->_pulseScale;
}

- (void)setPulseScale:(double)a3
{
  self->_pulseScale = a3;
}

- (double)pulseSecondStageDelay
{
  return self->_pulseSecondStageDelay;
}

- (void)setPulseSecondStageDelay:(double)a3
{
  self->_pulseSecondStageDelay = a3;
}

- (void)setDisableAsyncRenderingTransitionPercentage:(double)a3
{
  self->_disableAsyncRenderingTransitionPercentage = a3;
}

- (void)setDisallowAcceleratedHomeButtonPressTransitionPercentage:(double)a3
{
  self->_disallowAcceleratedHomeButtonPressTransitionPercentage = a3;
}

- (double)disableTapDuringMorphFromInAppViewTransitionDelay
{
  return self->_disableTapDuringMorphFromInAppViewTransitionDelay;
}

- (void)setDisableTapDuringMorphFromInAppViewTransitionDelay:(double)a3
{
  self->_disableTapDuringMorphFromInAppViewTransitionDelay = a3;
}

- (double)centerZoomScale
{
  return self->_centerZoomScale;
}

- (void)setCenterZoomScale:(double)a3
{
  self->_centerZoomScale = a3;
}

- (double)homeScreenBlurInSwitcher
{
  return self->_homeScreenBlurInSwitcher;
}

- (void)setHomeScreenBlurInSwitcher:(double)a3
{
  self->_homeScreenBlurInSwitcher = a3;
}

- (double)homeScreenBlurInSwitcherReduceMotionEnabled
{
  return self->_homeScreenBlurInSwitcherReduceMotionEnabled;
}

- (void)setHomeScreenBlurInSwitcherReduceMotionEnabled:(double)a3
{
  self->_homeScreenBlurInSwitcherReduceMotionEnabled = a3;
}

- (void)setHomeScreenBlurInApplication:(double)a3
{
  self->_homeScreenBlurInApplication = a3;
}

- (double)homeScreenBlurInAssistant
{
  return self->_homeScreenBlurInAssistant;
}

- (void)setHomeScreenBlurInAssistant:(double)a3
{
  self->_homeScreenBlurInAssistant = a3;
}

- (double)homeScreenOpacityInSwitcher
{
  return self->_homeScreenOpacityInSwitcher;
}

- (void)setHomeScreenOpacityInSwitcher:(double)a3
{
  self->_homeScreenOpacityInSwitcher = a3;
}

- (void)setHomeScreenOpacityInApplication:(double)a3
{
  self->_homeScreenOpacityInApplication = a3;
}

- (void)setHomeScreenScaleInSwitcher:(double)a3
{
  self->_homeScreenScaleInSwitcher = a3;
}

- (void)setHomeScreenScaleInApplication:(double)a3
{
  self->_homeScreenScaleInApplication = a3;
}

- (double)homeScreenScaleInAssistant
{
  return self->_homeScreenScaleInAssistant;
}

- (void)setHomeScreenScaleInAssistant:(double)a3
{
  self->_homeScreenScaleInAssistant = a3;
}

- (double)wallpaperScaleInSwitcher
{
  return self->_wallpaperScaleInSwitcher;
}

- (void)setWallpaperScaleInSwitcher:(double)a3
{
  self->_wallpaperScaleInSwitcher = a3;
}

- (void)setWallpaperScaleInApplication:(double)a3
{
  self->_wallpaperScaleInApplication = a3;
}

- (double)dimmingAlphaInSwitcher
{
  return self->_dimmingAlphaInSwitcher;
}

- (void)setDimmingAlphaInSwitcher:(double)a3
{
  self->_dimmingAlphaInSwitcher = a3;
}

- (void)setDimmingAlphaInApplication:(double)a3
{
  self->_dimmingAlphaInApplication = a3;
}

- (double)dockHurdlingIconZoomInitialVelocity
{
  return self->_dockHurdlingIconZoomInitialVelocity;
}

- (void)setDockHurdlingIconZoomInitialVelocity:(double)a3
{
  self->_dockHurdlingIconZoomInitialVelocity = a3;
}

- (double)dockHurdlingIconZoomDockToBackTiming
{
  return self->_dockHurdlingIconZoomDockToBackTiming;
}

- (void)setDockHurdlingIconZoomDockToBackTiming:(double)a3
{
  self->_dockHurdlingIconZoomDockToBackTiming = a3;
}

- (double)dockHurdlingIconZoomDockToFrontTiming
{
  return self->_dockHurdlingIconZoomDockToFrontTiming;
}

- (void)setDockHurdlingIconZoomDockToFrontTiming:(double)a3
{
  self->_dockHurdlingIconZoomDockToFrontTiming = a3;
}

- (double)reduceMotionCrossfadeDuration
{
  return self->_reduceMotionCrossfadeDuration;
}

- (void)setReduceMotionCrossfadeDuration:(double)a3
{
  self->_reduceMotionCrossfadeDuration = a3;
}

- (double)iconZoomFloatingDockFadeDelay
{
  return self->_iconZoomFloatingDockFadeDelay;
}

- (void)setIconZoomFloatingDockFadeDelay:(double)a3
{
  self->_iconZoomFloatingDockFadeDelay = a3;
}

- (double)emptySwitcherDismissDelay
{
  return self->_emptySwitcherDismissDelay;
}

- (void)setEmptySwitcherDismissDelay:(double)a3
{
  self->_emptySwitcherDismissDelay = a3;
}

- (double)resizeBlurDelay
{
  return self->_resizeBlurDelay;
}

- (void)setResizeBlurDelay:(double)a3
{
  self->_resizeBlurDelay = a3;
}

- (double)appSwitcherTitleAndIconFadeInSlowDownFactor
{
  return self->_appSwitcherTitleAndIconFadeInSlowDownFactor;
}

- (void)setAppSwitcherTitleAndIconFadeInSlowDownFactor:(double)a3
{
  self->_appSwitcherTitleAndIconFadeInSlowDownFactor = a3;
}

- (double)homeScreenCenterZoomInitialBlur
{
  return self->_homeScreenCenterZoomInitialBlur;
}

- (void)setHomeScreenCenterZoomInitialBlur:(double)a3
{
  self->_homeScreenCenterZoomInitialBlur = a3;
}

- (double)homeScreenCenterZoomInitialScale
{
  return self->_homeScreenCenterZoomInitialScale;
}

- (void)setHomeScreenCenterZoomInitialScale:(double)a3
{
  self->_homeScreenCenterZoomInitialScale = a3;
}

- (double)homeScreenCenterZoomInitialOpacity
{
  return self->_homeScreenCenterZoomInitialOpacity;
}

- (void)setHomeScreenCenterZoomInitialOpacity:(double)a3
{
  self->_homeScreenCenterZoomInitialOpacity = a3;
}

- (double)homeScreenCenterZoomTargetScaleWhenUnblurringIsComplete
{
  return self->_homeScreenCenterZoomTargetScaleWhenUnblurringIsComplete;
}

- (void)setHomeScreenCenterZoomTargetScaleWhenUnblurringIsComplete:(double)a3
{
  self->_homeScreenCenterZoomTargetScaleWhenUnblurringIsComplete = a3;
}

- (double)homeScreenCenterZoomYOffsetPercentOfScreenHeight
{
  return self->_homeScreenCenterZoomYOffsetPercentOfScreenHeight;
}

- (void)setHomeScreenCenterZoomYOffsetPercentOfScreenHeight:(double)a3
{
  self->_homeScreenCenterZoomYOffsetPercentOfScreenHeight = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pulseScaleSettings, 0);
  objc_storeStrong((id *)&self->_bannerUnfurlWallpaperAlphaSettings, 0);
  objc_storeStrong((id *)&self->_bannerUnfurlSettings, 0);
  objc_storeStrong((id *)&self->_reopenButtonScaleSettings, 0);
  objc_storeStrong((id *)&self->_siriSwipeDismissalSettings, 0);
  objc_storeStrong((id *)&self->_alertBarSwipeDismissalSettings, 0);
  objc_storeStrong((id *)&self->_alertCardifiedDismissalSettings, 0);
  objc_storeStrong((id *)&self->_statusBarFadeOutSettings, 0);
  objc_storeStrong((id *)&self->_statusBarFadeInSettings, 0);
  objc_storeStrong((id *)&self->_appSelectionSquishSettings, 0);
  objc_storeStrong((id *)&self->_wallpaperScaleSettings, 0);
  objc_storeStrong((id *)&self->_swipeToKillOpacitySettings, 0);
  objc_storeStrong((id *)&self->_centerZoomOpacitySettings, 0);
  objc_storeStrong((id *)&self->_opacitySettings, 0);
  objc_storeStrong((id *)&self->_homeScreenScaleSettings, 0);
  objc_storeStrong((id *)&self->_homeScreenOpacitySettings, 0);
  objc_storeStrong((id *)&self->_backdropBlurSettings, 0);
  objc_storeStrong((id *)&self->_slideUpSettings, 0);
  objc_storeStrong((id *)&self->_crossfadeDosidoSettings, 0);
  objc_storeStrong((id *)&self->_crossblurDosidoSettings, 0);
  objc_storeStrong((id *)&self->_dosidoScaleUpSettings, 0);
  objc_storeStrong((id *)&self->_dosidoScaleDownSettings, 0);
  objc_storeStrong((id *)&self->_dosidoSettings, 0);
  objc_storeStrong((id *)&self->_reduceMotionAppToSwitcherSettings, 0);
  objc_storeStrong((id *)&self->_reduceMotionArcSwipeSettings, 0);
  objc_storeStrong((id *)&self->_cardFlyInSettings, 0);
  objc_storeStrong((id *)&self->_gestureInitiatedAppToSwitcherSettings, 0);
  objc_storeStrong((id *)&self->_appToSwitcherCornerRadiusSettings, 0);
  objc_storeStrong((id *)&self->_arcSwipeSwitcherGlancingSettings, 0);
  objc_storeStrong((id *)&self->_arcSwipeSettings, 0);
  objc_storeStrong((id *)&self->_homeGestureLargeWidgetZoomDownScaleSettings, 0);
  objc_storeStrong((id *)&self->_homeGestureLargeWidgetZoomDownPositionSettings, 0);
  objc_storeStrong((id *)&self->_homeGestureLargeWidgetZoomDownLayoutSettings, 0);
  objc_storeStrong((id *)&self->_homeGestureMediumWidgetZoomDownScaleSettings, 0);
  objc_storeStrong((id *)&self->_homeGestureMediumWidgetZoomDownPositionSettings, 0);
  objc_storeStrong((id *)&self->_homeGestureMediumWidgetZoomDownLayoutSettings, 0);
  objc_storeStrong((id *)&self->_homeGestureSmallWidgetZoomDownScaleSettings, 0);
  objc_storeStrong((id *)&self->_homeGestureSmallWidgetZoomDownPositionSettings, 0);
  objc_storeStrong((id *)&self->_homeGestureSmallWidgetZoomDownLayoutSettings, 0);
  objc_storeStrong((id *)&self->_homeGestureBottomRowZoomDownScaleSettings, 0);
  objc_storeStrong((id *)&self->_homeGestureBottomRowZoomDownPositionSettings, 0);
  objc_storeStrong((id *)&self->_homeGestureBottomRowZoomDownLayoutSettings, 0);
  objc_storeStrong((id *)&self->_homeGestureTopRowZoomDownScaleSettings, 0);
  objc_storeStrong((id *)&self->_homeGestureTopRowZoomDownPositionSettings, 0);
  objc_storeStrong((id *)&self->_homeGestureTopRowZoomDownLayoutSettings, 0);
  objc_storeStrong((id *)&self->_homeGestureEdgeRowZoomUpSettings, 0);
  objc_storeStrong((id *)&self->_homeGestureCenterRowZoomUpSettings, 0);
  objc_storeStrong((id *)&self->_swapAppSidesOpacityAnimationSettings, 0);
  objc_storeStrong((id *)&self->_swapAppSidesLayoutAnimationSettings, 0);
  objc_storeStrong((id *)&self->_centerToSlideOverAnimationSettings, 0);
  objc_storeStrong((id *)&self->_slideOverToFullScreenAnimationSettings, 0);
  objc_storeStrong((id *)&self->_splitViewToSlideOverSettings, 0);
  objc_storeStrong((id *)&self->_fullScreenToPeekSecondPhaseAnimationSettings, 0);
  objc_storeStrong((id *)&self->_fullScreenToPeekFirstPhaseAnimationSettings, 0);
  objc_storeStrong((id *)&self->_stackedSwitcherTrackingSettings, 0);
  objc_storeStrong((id *)&self->_continuityBannerSlideUpSettings, 0);
  objc_storeStrong((id *)&self->_launchAppFromSwitcherSettings, 0);
  objc_storeStrong((id *)&self->_toggleAppSwitcherSettings, 0);
  objc_storeStrong((id *)&self->_switcherToHomeOpacitySettings, 0);
  objc_storeStrong((id *)&self->_switcherToHomeSettings, 0);
  objc_storeStrong((id *)&self->_slideOverSettings, 0);
  objc_storeStrong((id *)&self->_centerZoomSettings, 0);
  objc_storeStrong((id *)&self->_switcherFadeOutSettings, 0);
  objc_storeStrong((id *)&self->_iconFadeInSettings, 0);
  objc_storeStrong((id *)&self->_switcherZoomDownIconFadeOutSettings, 0);
  objc_storeStrong((id *)&self->_floatingDockIconFadeSettings, 0);
  objc_storeStrong((id *)&self->_iconZoomDownSettings, 0);
  objc_storeStrong((id *)&self->_zoomUpSettings, 0);
  objc_storeStrong((id *)&self->_layoutSettings, 0);
}

- (double)homeScreenBlurProgressForMode:(int64_t)a3
{
  if (a3 == 3)
  {
    [(SBFluidSwitcherAnimationSettings *)self homeScreenBlurInApplication];
  }
  else if (a3 == 2)
  {
    if (SBReduceMotion())
    {
      [(SBFluidSwitcherAnimationSettings *)self homeScreenBlurInSwitcherReduceMotionEnabled];
    }
    else
    {
      [(SBFluidSwitcherAnimationSettings *)self homeScreenBlurInSwitcher];
    }
  }
  else
  {
    return 0.0;
  }
  return result;
}

- (double)homeScreenAlphaForMode:(int64_t)a3
{
  if (a3 == 3)
  {
    [(SBFluidSwitcherAnimationSettings *)self homeScreenOpacityInApplication];
  }
  else
  {
    double v4 = 1.0;
    if (a3 == 2 && (double v4 = 0.0, !UIAccessibilityIsReduceTransparencyEnabled()))
    {
      [(SBFluidSwitcherAnimationSettings *)self homeScreenOpacityInSwitcher];
    }
    else
    {
      return v4;
    }
  }
  return result;
}

- (double)wallpaperScaleForMode:(int64_t)a3
{
  if (a3 == 3)
  {
    [(SBFluidSwitcherAnimationSettings *)self wallpaperScaleInApplication];
  }
  else if (a3 == 2 && !UIAccessibilityIsReduceTransparencyEnabled())
  {
    [(SBFluidSwitcherAnimationSettings *)self wallpaperScaleInSwitcher];
  }
  else
  {
    return 1.0;
  }
  return result;
}

- (double)homeScreenDimmingAlphaForMode:(int64_t)a3
{
  if (a3 == 3)
  {
    [(SBFluidSwitcherAnimationSettings *)self dimmingAlphaInApplication];
  }
  else if (a3 == 2)
  {
    [(SBFluidSwitcherAnimationSettings *)self dimmingAlphaInSwitcher];
  }
  else
  {
    return 0.0;
  }
  return result;
}

@end