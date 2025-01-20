@interface SBDeviceApplicationSceneHandle
+ (double)_homeAffordanceInsetBottom;
+ (double)_homeAffordanceInsetTopForWindowScene:(id)a3;
- (BOOL)_classicAppPhoneOnPadPrefersLandscape;
- (BOOL)_classicAppPhoneOnPadSupportsOldStyleMixedOrientation;
- (BOOL)_computeTaskSuspensionForegroundPreference;
- (BOOL)_currentClassicModeAllowsLaunchingToAnySupportedOrientation;
- (BOOL)_isEnhancedWindowingEffectivelyEnabled;
- (BOOL)_isSettingUpSceneOrientationRequest;
- (BOOL)_mainSceneSupportsInterfaceOrientation:(int64_t)a3;
- (BOOL)_supportsMixedOrientation;
- (BOOL)_supportsMixedOrientationOnWindowScene:(id)a3;
- (BOOL)_supportsMultiWindowLayouts;
- (BOOL)contentPrefersToDisableClipping;
- (BOOL)defaultStatusBarHiddenForOrientation:(int64_t)a3;
- (BOOL)forbidsActivationByBreadcrumbAction;
- (BOOL)handleHardwareButtonEventType:(int64_t)a3;
- (BOOL)hasMainSceneBeenForegroundAtLeastOnce;
- (BOOL)isAutoHideEnabledForHomeAffordance;
- (BOOL)isCurrentStatusBarHiddenForOrientation:(int64_t)a3;
- (BOOL)isDeviceApplicationSceneHandle;
- (BOOL)isEdgeProtectEnabledForHomeGesture;
- (BOOL)isEffectivelyForeground;
- (BOOL)isHostedSecureApp;
- (BOOL)isOccluded;
- (BOOL)isReachabilitySupported;
- (BOOL)isShowingModalAlert;
- (BOOL)isStatusBarForceHidden;
- (BOOL)isStatusBarForcedHiddenForOrientation:(int64_t)a3;
- (BOOL)isStatusBarHiddenForActivation:(id)a3 forOrientation:(int64_t)a4;
- (BOOL)isTranslucent;
- (BOOL)prefersHeaderHiddenInSwitcher;
- (BOOL)prefersKillingInSwitcherDisabled;
- (BOOL)prefersProcessTaskSuspensionWhileSceneForeground;
- (BOOL)requestedFullScreenCenterWindow;
- (BOOL)shouldAlwaysDisplayLiveContent;
- (BOOL)shouldApplyAppProtectionSceneSettings;
- (BOOL)shouldPrioritizeForSwitcherOrdering;
- (BOOL)shouldSuppressAlertForSuppressionContexts:(id)a3 sectionIdentifier:(id)a4;
- (BOOL)supportsCenterWindow;
- (BOOL)wantsDeviceOrientationEventsEnabled;
- (BOOL)wantsEnhancedWindowingEnabled;
- (CGRect)statusBarAvoidanceFrame;
- (NSData)activationConditionsData;
- (NSSet)backgroundActivitiesToSuppress;
- (NSString)lastActivationIconLeafIdentifier;
- (NSString)sceneTitle;
- (SBDeviceApplicationSceneStatusBarBreadcrumbProvider)breadcrumbProvider;
- (SBDeviceApplicationSceneStatusBarStateProvider)statusBarStateProvider;
- (SBIdleTimerCoordinating)_idleTimerCoordinator;
- (SBScenePlaceholderContentViewProvider)placeholderContentProvider;
- (_UIStatusBarData)overlayStatusBarData;
- (char)_computeActivityMode;
- (char)_computeJetsamMode;
- (char)activityMode;
- (char)jetsamMode;
- (double)defaultStatusBarAlpha;
- (double)defaultStatusBarHeightForOrientation:(int64_t)a3;
- (double)statusBarAlpha;
- (double)statusBarHeightForOrientation:(int64_t)a3;
- (id)_defaultStatusBarForAssociatedDisplay;
- (id)_defaultStatusBarHeights;
- (id)_generateIdleTimerBehavior;
- (id)_potentiallyJailedDisplayConfiguration;
- (id)_sceneCornerRadiusConfigurationFromRequestContext:(id)a3 forEntity:(id)a4;
- (id)_sceneDataStoreCreatingIfNecessary:(BOOL)a3;
- (id)_sceneHostingInfoForSnapshottingAssertionWithView:(id)a3;
- (id)_windowScene;
- (id)acquireAssertionsForRelevancyResult:(id)a3 reason:(id)a4;
- (id)acquireSceneActivityModeAssertionWithReason:(id)a3 activityMode:(char)a4;
- (id)acquireSceneJetsamModeAssertionWithReason:(id)a3 jetsamMode:(char)a4;
- (id)acquireSceneTaskSuspensionForegroundPreferenceAssertionWithReason:(id)a3 prefersProcessTaskSuspensionWhileSceneForeground:(BOOL)a4;
- (id)additionalActionsForActivatingSceneEntity:(id)a3 withTransitionContext:(id)a4;
- (id)currentEffectiveStatusBarStyleRequest;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)displayEdgeInfoForLayoutEnvironment:(int64_t)a3;
- (id)effectiveBackgroundActivities;
- (id)effectiveStatusBarStyleRequestForActivation:(id)a3;
- (id)mostRecentSceneSnapshotsForScale:(double)a3 launchingOrientation:(int64_t)a4;
- (id)newScenePlaceholderContentContextWithActivationSettings:(id)a3;
- (id)newSceneViewController;
- (id)newSceneViewWithReferenceSize:(CGSize)a3 contentOrientation:(int64_t)a4 containerOrientation:(int64_t)a5 hostRequester:(id)a6;
- (id)statusBarEffectiveStyleRequestWithStyle:(int64_t)a3;
- (int64_t)_bestSupportedInterfaceOrientationForOrientation:(int64_t)a3;
- (int64_t)_classicPhoneOnPadActivationOrientationForOrientation:(int64_t)a3;
- (int64_t)_defaultStatusBarStyleFromSceneDataStore;
- (int64_t)_initialDeviceOrientationFromSceneOrientationRequestSetup;
- (int64_t)_initialMainSceneCompabilityMode:(id)a3;
- (int64_t)_interfaceOrientationFromUserResizing;
- (int64_t)_interfaceOrientationMode;
- (int64_t)_launchingInterfaceOrientationForOrientation:(int64_t)a3;
- (int64_t)_preferredSizingPolicyForContentOrientation:(int64_t)a3 containerOrientation:(int64_t)a4;
- (int64_t)_resumingInterfaceOrientationForOrientation:(int64_t)a3;
- (int64_t)_statusBarStyleWithActivationSettings:(id)a3;
- (int64_t)activationInterfaceOrientationForCurrentOrientation;
- (int64_t)activationInterfaceOrientationForOrientation:(int64_t)a3;
- (int64_t)backgroundStyle;
- (int64_t)currentInterfaceOrientation;
- (int64_t)currentStatusBarStyle;
- (int64_t)defaultBackgroundStyle;
- (int64_t)defaultInterfaceOrientation;
- (int64_t)defaultStatusBarStyle;
- (int64_t)lastActivationSource;
- (int64_t)statusBarOrientation;
- (int64_t)statusBarParts;
- (int64_t)wallpaperStyle;
- (int64_t)whitePointAdaptivityStyle;
- (unint64_t)_mainSceneSupportedInterfaceOrientations;
- (unint64_t)_supportedInterfaceOrientationsFromSceneOrientationRequestSetup;
- (unint64_t)_supportedSizingPoliciesForContentOrientation:(int64_t)a3 containerOrientation:(int64_t)a4;
- (unint64_t)preferredHardwareButtonEventTypes;
- (unint64_t)screenEdgesDeferringSystemGestures;
- (void)_addSnapshottingInfoAssertion:(id)a3;
- (void)_commonInitWithApplication:(id)a3 sceneIdentifier:(id)a4 displayIdentity:(id)a5;
- (void)_didCreateScene:(id)a3;
- (void)_didDestroyScene:(id)a3;
- (void)_didUpdateClientSettingsWithDiff:(id)a3 transitionContext:(id)a4;
- (void)_didUpdateDisplayIdentity;
- (void)_didUpdateSettingsWithDiff:(id)a3 previousSettings:(id)a4;
- (void)_modifyApplicationSceneClientSettings:(id)a3 fromRequestContext:(id)a4 entity:(id)a5 initialSceneSettings:(id)a6;
- (void)_modifyApplicationSceneSettings:(id)a3 fromRequestContext:(id)a4 entity:(id)a5;
- (void)_modifyApplicationTransitionContext:(id)a3 fromRequestContext:(id)a4 entity:(id)a5;
- (void)_modifyProcessExecutionContext:(id)a3 fromRequestContext:(id)a4 entity:(id)a5;
- (void)_modifySafeAreaInsetsOnApplicationSceneSettings:(id)a3 isFloating:(BOOL)a4;
- (void)_noteActivationConditionsChanged;
- (void)_noteBackgroundActivitiesToSuppressChanged;
- (void)_noteContentPrefersToDisableClippingChanged;
- (void)_noteDidMoveFromSceneManager:(id)a3;
- (void)_noteMainSceneBackgroundStyleChanged;
- (void)_noteReplacedWithSceneHandle:(id)a3;
- (void)_noteSceneTitleChanged;
- (void)_populateSettingsWithDefaultStatusBarHeight:(id)a3;
- (void)_reevaluateActivityModeFromAssertions;
- (void)_reevaluateJetsamModeFromAssertions;
- (void)_reevaluateOcclusionBySystemUI;
- (void)_reevaluateTaskSuspensionForegroundPreferenceFromAssertions;
- (void)_removeSnapshottingInfoAssertion:(id)a3;
- (void)_resetSceneOrientationRequestState;
- (void)_setClassicAppPhoneOnPadPrefersLandscape:(BOOL)a3;
- (void)_setIdleTimerCoordinator:(id)a3;
- (void)_setInitialDeviceOrientationFromSceneOrientationRequestSetup:(int64_t)a3;
- (void)_setInterfaceOrientationFromUserResizing:(int64_t)a3;
- (void)_setSettingUpSceneOrientationRequest:(BOOL)a3;
- (void)_setSupportedInterfaceOrientationsFromSceneOrientationRequestSetup:(unint64_t)a3;
- (void)_updateActivityMode;
- (void)_updateApplicationOcclusionRects;
- (void)_updateCapturingContentForAdditionalRenderingDestination;
- (void)_updateIdleTimerForReason:(id)a3;
- (void)_updateIsCapturingContentForAdditionalRenderingDestinationOfMutableSceneSettings:(id)a3 withDisplayIdentity:(id)a4;
- (void)_updateJetsamMode;
- (void)_updatePrefersProcessTaskSuspensionWhileSceneForeground;
- (void)_updateSceneHostingInfoForSnapshottingWithAssertion:(id)a3 forceUpdate:(BOOL)a4;
- (void)_updateSystemOcclusionRects;
- (void)addObserver:(id)a3;
- (void)appProtectionAssistantShouldShieldDidChange:(id)a3;
- (void)appProtectionSubjectsChanged:(id)a3 forSubscription:(id)a4;
- (void)applicationProcessDidExit:(id)a3 withContext:(id)a4;
- (void)applicationSceneHandle:(id)a3 appendToSceneSettings:(id)a4 fromRequestContext:(id)a5 entity:(id)a6;
- (void)dealloc;
- (void)removeObserver:(id)a3;
- (void)saveSuspendSnapshot:(id)a3;
- (void)setAlertSuppressionContextsBySectionIdentifier:(id)a3;
- (void)setBackgroundActivitiesToSuppress:(id)a3;
- (void)setContentPrefersToDisableClipping:(BOOL)a3;
- (void)setDefaultBackgroundStyle:(int64_t)a3;
- (void)setHasMainSceneBeenForegroundAtLeastOnce:(BOOL)a3;
- (void)setHostedSecureApp:(BOOL)a3;
- (void)setKeyboardContextMaskStyle:(unint64_t)a3;
- (void)setLastActivationIconLeafIdentifier:(id)a3;
- (void)setLastActivationSource:(int64_t)a3;
- (void)setOccluded:(BOOL)a3;
- (void)setPlaceholderContentProvider:(id)a3;
- (void)setShouldApplyAppProtectionSceneSettings:(BOOL)a3;
- (void)setStatusBarAvoidanceFrame:(CGRect)a3;
- (void)setStatusBarForceHidden:(BOOL)a3 forReason:(id)a4 animationSettings:(id)a5;
- (void)setStatusBarParts:(int64_t)a3;
- (void)setWantsEnhancedWindowingEnabled:(BOOL)a3;
- (void)setWhitePointAdaptivityStyle:(int64_t)a3;
@end

@implementation SBDeviceApplicationSceneHandle

- (BOOL)isHostedSecureApp
{
  return self->_hostedSecureApp;
}

- (BOOL)isDeviceApplicationSceneHandle
{
  return 1;
}

- (id)_windowScene
{
  v3 = [(id)SBApp windowSceneManager];
  v4 = [v3 windowSceneForSceneHandle:self];

  return v4;
}

- (BOOL)defaultStatusBarHiddenForOrientation:(int64_t)a3
{
  v5 = [(SBDeviceApplicationSceneHandle *)self _sceneDataStoreCreatingIfNecessary:0];
  v6 = [v5 safeObjectForKey:@"statusBarHidden" ofType:objc_opt_class()];

  if (v6)
  {
    char v7 = [v6 BOOLValue];
  }
  else
  {
    v8 = [(SBApplicationSceneHandle *)self application];
    v9 = [v8 info];
    v10 = [(SBDeviceApplicationSceneHandle *)self _potentiallyJailedDisplayConfiguration];
    char v7 = [v9 statusBarHiddenForInterfaceOrientation:a3 onDisplay:v10];
  }
  return v7;
}

- (id)_sceneDataStoreCreatingIfNecessary:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(SBApplicationSceneHandle *)self application];
  v6 = [v5 _dataStore];
  char v7 = [(SBDeviceApplicationSceneHandle *)self sceneIdentifier];
  v8 = [v6 sceneStoreForIdentifier:v7 creatingIfNecessary:v3];

  return v8;
}

- (SBDeviceApplicationSceneStatusBarStateProvider)statusBarStateProvider
{
  statusBarStateProvider = self->_statusBarStateProvider;
  if (!statusBarStateProvider)
  {
    v4 = [[SBDeviceApplicationSceneStatusBarStateProvider alloc] _initWithSceneHandle:self];
    v5 = self->_statusBarStateProvider;
    self->_statusBarStateProvider = v4;

    statusBarStateProvider = self->_statusBarStateProvider;
  }
  return statusBarStateProvider;
}

- (int64_t)defaultInterfaceOrientation
{
  v2 = [(SBApplicationSceneHandle *)self application];
  BOOL v3 = [v2 info];
  int64_t v4 = [v3 _launchingInterfaceOrientation];

  return v4;
}

- (NSSet)backgroundActivitiesToSuppress
{
  return self->_backgroundActivitiesToSuppress;
}

- (BOOL)isEffectivelyForeground
{
  return self->_isEffectivelyForeground;
}

- (int64_t)statusBarOrientation
{
  BOOL v3 = [(SBDeviceApplicationSceneHandle *)self sceneIfExists];
  int64_t v4 = v3;
  if (v3) {
    uint64_t v5 = [v3 currentInterfaceOrientation];
  }
  else {
    uint64_t v5 = [(SBDeviceApplicationSceneHandle *)self activationInterfaceOrientationForCurrentOrientation];
  }
  int64_t v6 = v5;

  return v6;
}

- (id)_potentiallyJailedDisplayConfiguration
{
  v2 = [(SBApplicationSceneHandle *)self application];
  BOOL v3 = [MEMORY[0x1E4F62420] mainConfiguration];
  int64_t v4 = [v2 restrictedClassicModeDisplayConfigurationForDisplayConfiguration:v3];

  return v4;
}

- (int64_t)activationInterfaceOrientationForCurrentOrientation
{
  return [(SBDeviceApplicationSceneHandle *)self activationInterfaceOrientationForOrientation:0];
}

- (BOOL)shouldPrioritizeForSwitcherOrdering
{
  v2 = [(SBDeviceApplicationSceneHandle *)self sceneIfExists];
  if (v2)
  {
    uint64_t v3 = objc_opt_class();
    int64_t v4 = [v2 uiClientSettings];
    uint64_t v5 = SBSafeCast(v3, v4);

    BOOL v6 = v5 != 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)setHasMainSceneBeenForegroundAtLeastOnce:(BOOL)a3
{
  self->_hasMainSceneBeenForegroundAtLeastOnce = a3;
}

- (BOOL)shouldAlwaysDisplayLiveContent
{
  v2 = [(SBDeviceApplicationSceneHandle *)self sceneIfExists];
  if (v2)
  {
    uint64_t v3 = objc_opt_class();
    int64_t v4 = [v2 uiClientSettings];
    uint64_t v5 = SBSafeCast(v3, v4);

    BOOL v6 = v5 != 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)_supportsMixedOrientation
{
  v2 = self;
  uint64_t v3 = [(SBDeviceApplicationSceneHandle *)self _windowScene];
  LOBYTE(v2) = [(SBDeviceApplicationSceneHandle *)v2 _supportsMixedOrientationOnWindowScene:v3];

  return (char)v2;
}

- (int64_t)lastActivationSource
{
  return self->_lastActivationSource;
}

- (BOOL)forbidsActivationByBreadcrumbAction
{
  v2 = [(SBDeviceApplicationSceneHandle *)self sceneIfExists];
  if (v2)
  {
    uint64_t v3 = objc_opt_class();
    int64_t v4 = [v2 uiClientSettings];
    uint64_t v5 = SBSafeCast(v3, v4);

    BOOL v6 = v5 != 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (int64_t)_statusBarStyleWithActivationSettings:(id)a3
{
  int64_t v4 = [a3 objectForActivationSetting:5];
  uint64_t v5 = [v4 scheme];

  if (!v5
    || (uint64_t v6 = [(SBDeviceApplicationSceneHandle *)self _defaultStatusBarStyleFromSceneDataStore], v6 == -1))
  {
    v8 = [(SBDeviceApplicationSceneHandle *)self statusBarStateProvider];
    int64_t v7 = [v8 statusBarStyle];
  }
  else
  {
    int64_t v7 = _SBStatusBarStyleFromLegacyStyle(v6);
  }

  return v7;
}

- (int64_t)currentStatusBarStyle
{
  v2 = [(SBDeviceApplicationSceneHandle *)self statusBarStateProvider];
  int64_t v3 = [v2 statusBarStyle];

  return v3;
}

- (BOOL)_currentClassicModeAllowsLaunchingToAnySupportedOrientation
{
  if ([(id)SBApp homeScreenRotationStyle])
  {
    if (__sb__runningInSpringBoard())
    {
      if (SBFEffectiveDeviceClass() != 2)
      {
LABEL_4:
        int64_t v3 = [(SBApplicationSceneHandle *)self application];
        uint64_t v4 = [v3 _classicMode];

        return (unint64_t)(v4 - 3) < 0xFFFFFFFFFFFFFFFELL;
      }
    }
    else
    {
      uint64_t v6 = [MEMORY[0x1E4F42948] currentDevice];
      uint64_t v7 = [v6 userInterfaceIdiom];

      if (v7 != 1) {
        goto LABEL_4;
      }
    }
  }
  v8 = [(SBApplicationSceneHandle *)self application];
  char v9 = [v8 classicAppPhoneAppRunningOnPad];

  return v9 ^ 1;
}

- (int64_t)_defaultStatusBarStyleFromSceneDataStore
{
  v2 = [(SBDeviceApplicationSceneHandle *)self _sceneDataStoreCreatingIfNecessary:0];
  int64_t v3 = [v2 safeObjectForKey:@"statusBarStyle" ofType:objc_opt_class()];

  if (v3) {
    int64_t v4 = (int)[v3 intValue];
  }
  else {
    int64_t v4 = -1;
  }

  return v4;
}

- (unint64_t)_supportedInterfaceOrientationsFromSceneOrientationRequestSetup
{
  v2 = [(SBDeviceApplicationSceneHandle *)self _sceneDataStoreCreatingIfNecessary:0];
  int64_t v3 = [v2 safeObjectForKey:@"supportedInterfaceOrientationsFromSceneOrientationRequestSetup" ofType:objc_opt_class()];
  int64_t v4 = v3;
  if (v3) {
    unint64_t v5 = [v3 integerValue];
  }
  else {
    unint64_t v5 = 0;
  }

  return v5;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)SBDeviceApplicationSceneHandle;
  id v4 = a3;
  unint64_t v5 = [(SBDeviceApplicationSceneHandle *)&v12 descriptionBuilderWithMultilinePrefix:v4];
  [v5 setActiveMultilinePrefix:v4];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __72__SBDeviceApplicationSceneHandle_descriptionBuilderWithMultilinePrefix___block_invoke;
  v10[3] = &unk_1E6AF5290;
  v10[4] = self;
  id v6 = v5;
  id v11 = v6;
  [v6 appendBodySectionWithName:0 multilinePrefix:v4 block:v10];

  uint64_t v7 = v11;
  id v8 = v6;

  return v8;
}

- (id)statusBarEffectiveStyleRequestWithStyle:(int64_t)a3
{
  int64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4FA9970]) initWithResolvedStyle:a3 foregroundColor:0];
  return v3;
}

- (int64_t)statusBarParts
{
  return self->_statusBarParts;
}

- (SBDeviceApplicationSceneStatusBarBreadcrumbProvider)breadcrumbProvider
{
  return self->_breadcrumbProvider;
}

- (CGRect)statusBarAvoidanceFrame
{
  double x = self->_statusBarAvoidanceFrame.origin.x;
  double y = self->_statusBarAvoidanceFrame.origin.y;
  double width = self->_statusBarAvoidanceFrame.size.width;
  double height = self->_statusBarAvoidanceFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (id)currentEffectiveStatusBarStyleRequest
{
  int64_t v3 = [(SBDeviceApplicationSceneHandle *)self currentStatusBarStyle];
  return [(SBDeviceApplicationSceneHandle *)self statusBarEffectiveStyleRequestWithStyle:v3];
}

- (void)setOccluded:(BOOL)a3
{
  if (self->_occludedByApplication == a3)
  {
    if (!self->_applicationOcclusionRectsDirty) {
      return;
    }
  }
  else
  {
    self->_occludedByApplication = a3;
  }
  [(SBDeviceApplicationSceneHandle *)self _updateApplicationOcclusionRects];
}

void __56__SBDeviceApplicationSceneHandle__noteSceneTitleChanged__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 sceneHandle:*(void *)(a1 + 32) didChangeSceneTitle:*(void *)(a1 + 40)];
  }
}

- (BOOL)_isEnhancedWindowingEffectivelyEnabled
{
  BOOL v3 = [(SBDeviceApplicationSceneHandle *)self wantsEnhancedWindowingEnabled];
  if (v3) {
    LOBYTE(v3) = ![(SBDeviceApplicationSceneHandle *)self isHostedSecureApp];
  }
  return v3;
}

- (BOOL)wantsEnhancedWindowingEnabled
{
  return self->_wantsEnhancedWindowingEnabled;
}

- (id)newScenePlaceholderContentContextWithActivationSettings:(id)a3
{
  id v3 = a3;
  id v4 = [[SBDeviceApplicationScenePlaceholderContentContext alloc] initWithActivationSettings:v3];

  return v4;
}

- (int64_t)_launchingInterfaceOrientationForOrientation:(int64_t)a3
{
  if ([(SBDeviceApplicationSceneHandle *)self currentInterfaceOrientation])
  {
    v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2 object:self file:@"SBDeviceApplicationSceneHandle.m" lineNumber:1122 description:@"Don't calculate a launch orientation for a running app. Really."];
  }
  id v6 = [(SBApplicationSceneHandle *)self application];
  if (!a3) {
    a3 = [(id)SBApp interfaceOrientationForCurrentDeviceOrientation:1];
  }
  uint64_t v7 = [(SBApplicationSceneHandle *)self application];
  char v8 = [v7 isMedusaCapable];

  if (v8)
  {
LABEL_6:
    int64_t v9 = a3;
    if (a3) {
      goto LABEL_12;
    }
    goto LABEL_7;
  }
  uint64_t v13 = [(id)SBApp homeScreenRotationStyle];
  v14 = [v6 info];
  int v15 = [v14 builtOnOrAfterSDKVersion:@"8.0"];

  BOOL v16 = [(SBDeviceApplicationSceneHandle *)self _currentClassicModeAllowsLaunchingToAnySupportedOrientation];
  BOOL v17 = [(SBDeviceApplicationSceneHandle *)self _mainSceneSupportsInterfaceOrientation:a3];
  int64_t v9 = [(SBDeviceApplicationSceneHandle *)self _interfaceOrientationFromUserResizing];
  if (v9) {
    goto LABEL_12;
  }
  if (v13) {
    int v19 = 1;
  }
  else {
    int v19 = v15;
  }
  if ((v19 & v16) == 1)
  {
    if (!v17)
    {
      v20 = +[SBOrientationLockManager sharedInstance];
      int v21 = [v20 isUserLocked];

      if (v21)
      {
        uint64_t v22 = [(id)SBApp rawDeviceOrientationIgnoringOrientationLocks];
        if ((unint64_t)(v22 - 5) >= 0xFFFFFFFFFFFFFFFCLL)
        {
          int64_t v9 = v22;
          if (v22 != a3
            && [(SBDeviceApplicationSceneHandle *)self _mainSceneSupportsInterfaceOrientation:v22])
          {
            goto LABEL_12;
          }
        }
      }
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  v23 = [(SBApplicationSceneHandle *)self application];
  int v24 = [v23 classicAppPhoneAppRunningOnPad];

  if (v24)
  {
    a3 = [(SBDeviceApplicationSceneHandle *)self _classicPhoneOnPadActivationOrientationForOrientation:a3];
    goto LABEL_6;
  }
LABEL_7:
  int64_t v9 = [(SBDeviceApplicationSceneHandle *)self defaultInterfaceOrientation];
  if (!v9)
  {
    v10 = SBLogCommon();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);

    if (v11)
    {
      objc_super v12 = [(SBDeviceApplicationSceneHandle *)self sceneIdentifier];
      NSLog(&cfstr_NoFallbackOrie.isa, v12);
    }
    int64_t v9 = 1;
  }
LABEL_12:

  return v9;
}

- (BOOL)_mainSceneSupportsInterfaceOrientation:(int64_t)a3
{
  unint64_t v3 = [(SBDeviceApplicationSceneHandle *)self _mainSceneSupportedInterfaceOrientations];
  return (XBInterfaceOrientationMaskForInterfaceOrientation() & v3) != 0;
}

- (unint64_t)_mainSceneSupportedInterfaceOrientations
{
  unint64_t v3 = [(SBApplicationSceneHandle *)self application];
  id v4 = [v3 info];
  if ([v3 isMedusaCapable])
  {
    unint64_t v5 = 30;
  }
  else
  {
    unint64_t v5 = [v4 supportedInterfaceOrientations];
    id v6 = [(SBDeviceApplicationSceneHandle *)self sceneIfExists];
    uint64_t v7 = v6;
    if (v6)
    {
      char v8 = [v6 uiClientSettings];
      unint64_t v5 = [v8 supportedInterfaceOrientations];
    }
  }

  return v5;
}

- (int64_t)_interfaceOrientationFromUserResizing
{
  v2 = [(SBDeviceApplicationSceneHandle *)self _sceneDataStoreCreatingIfNecessary:0];
  unint64_t v3 = [v2 safeObjectForKey:@"interfaceOrientationFromUserResizing" ofType:objc_opt_class()];
  id v4 = v3;
  if (v3) {
    int64_t v5 = [v3 integerValue];
  }
  else {
    int64_t v5 = 0;
  }

  return v5;
}

- (int64_t)activationInterfaceOrientationForOrientation:(int64_t)a3
{
  int64_t v5 = [(SBDeviceApplicationSceneHandle *)self currentInterfaceOrientation];
  if (v5)
  {
    int64_t v6 = v5;
    int64_t result = [(SBDeviceApplicationSceneHandle *)self _interfaceOrientationFromUserResizing];
    if (!result)
    {
      char v8 = [(SBApplicationSceneHandle *)self application];
      int v9 = [v8 classicAppPhoneAppRunningOnPad];

      int64_t result = v6;
      if (v9)
      {
        int64_t result = [(SBDeviceApplicationSceneHandle *)self _classicPhoneOnPadActivationOrientationForOrientation:a3];
        if (!result) {
          return v6;
        }
      }
    }
  }
  else
  {
    return [(SBDeviceApplicationSceneHandle *)self _launchingInterfaceOrientationForOrientation:a3];
  }
  return result;
}

- (int64_t)currentInterfaceOrientation
{
  v2 = [(SBDeviceApplicationSceneHandle *)self sceneIfExists];
  int64_t v3 = [v2 currentInterfaceOrientation];

  return v3;
}

- (void)applicationSceneHandle:(id)a3 appendToSceneSettings:(id)a4 fromRequestContext:(id)a5 entity:(id)a6
{
  id v8 = a4;
  id v9 = [a5 displayIdentity];
  [(SBDeviceApplicationSceneHandle *)self _updateIsCapturingContentForAdditionalRenderingDestinationOfMutableSceneSettings:v8 withDisplayIdentity:v9];
}

- (void)_updateIsCapturingContentForAdditionalRenderingDestinationOfMutableSceneSettings:(id)a3 withDisplayIdentity:(id)a4
{
  id v20 = a3;
  id v6 = a4;
  int v7 = [v20 isCapturingContentForAdditionalRenderingDestination];
  if ([v6 isContinuityDisplay])
  {
    id v8 = [(id)SBApp windowSceneManager];
    id v9 = [v8 windowSceneForDisplayIdentity:v6];

    v10 = [v9 _FBSScene];
    BOOL v11 = [v10 settings];
    uint64_t v12 = objc_opt_class();
    id v13 = v11;
    if (v12)
    {
      if (objc_opt_isKindOfClass()) {
        v14 = v13;
      }
      else {
        v14 = 0;
      }
    }
    else
    {
      v14 = 0;
    }
    id v15 = v14;

    uint64_t v16 = [v15 isCapturingContentForAdditionalRenderingDestination];
    [v20 setIsCapturingContentForAdditionalRenderingDestination:v16];
  }
  else
  {
    [v20 setIsCapturingContentForAdditionalRenderingDestination:0];
  }
  if (v7 != [v20 isCapturingContentForAdditionalRenderingDestination])
  {
    int v17 = [v20 isCapturingContentForAdditionalRenderingDestination];
    v18 = [MEMORY[0x1E4F28EB8] defaultCenter];
    int v19 = v18;
    if (v17) {
      [v18 addObserver:self selector:sel__updateCapturingContentForAdditionalRenderingDestination name:*MEMORY[0x1E4F43CB8] object:0];
    }
    else {
      [v18 removeObserver:self name:*MEMORY[0x1E4F43CB8] object:0];
    }
  }
}

- (void)_modifyApplicationSceneSettings:(id)a3 fromRequestContext:(id)a4 entity:(id)a5
{
  uint64_t v93 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v84.receiver = self;
  v84.super_class = (Class)SBDeviceApplicationSceneHandle;
  [(SBApplicationSceneHandle *)&v84 _modifyApplicationSceneSettings:v8 fromRequestContext:v9 entity:v10];
  id v80 = v9;
  v81 = [v9 request];
  BOOL v11 = [(SBApplicationSceneHandle *)self application];
  uint64_t v12 = [(SBDeviceApplicationSceneHandle *)self _windowScene];
  id v13 = [v12 switcherController];

  int v14 = [v11 isClassic];
  v82 = v13;
  int v15 = [v13 isChamoisWindowingUIEnabled];
  uint64_t v16 = v10;
  int v17 = [v10 BOOLForActivationSetting:72];
  int v18 = v14;
  if ((v14 & 1) == 0)
  {
    int v18 = v14;
    if (v15) {
      int v18 = ([v11 supportsChamoisSceneResizing] | v17) ^ 1;
    }
  }
  if (v14) {
    int v19 = 1;
  }
  else {
    int v19 = [v11 supportsChamoisOnExternalDisplay] ^ 1;
  }
  v83 = v11;
  if ([v11 supportsChamoisOnExternalDisplay])
  {
    id v20 = [v8 displayIdentity];
    int v21 = [v20 isContinuityDisplay];
  }
  else
  {
    int v21 = 1;
  }
  uint64_t v22 = [v8 displayConfiguration];
  if (((v19 | v18) & 1) != 0 || v21)
  {
    v23 = [MEMORY[0x1E4F42D90] mainScreen];
    int v24 = [v23 displayConfiguration];

    v25 = [v83 restrictedClassicModeDisplayConfigurationForDisplayConfiguration:v24];
    if (v18)
    {
      [v83 defaultLaunchingSizeForDisplayConfiguration:v25];
      BSRectWithSize();
      objc_msgSend(v8, "setFrame:");
    }
    if ((v19 | v21) == 1)
    {
      if (v19) {
        v26 = v25;
      }
      else {
        v26 = v24;
      }
      [v8 setDisplayConfiguration:v26];
    }
  }
  v27 = [v8 displayConfiguration];
  int v28 = [v27 isEqual:v22];

  if (v28) {
    v29 = 0;
  }
  else {
    v29 = v22;
  }
  objc_msgSend(v8, "sb_setDisplayConfigurationForSceneManagers:", v29);
  if (!v15)
  {
    uint64_t v33 = 0;
    v32 = v80;
    goto LABEL_27;
  }
  v30 = objc_msgSend(v8, "sb_displayIdentityForSceneManagers");
  int v31 = [v30 isExternal];

  v32 = v80;
  if ((v31 ^ 1 | v21))
  {
    uint64_t v33 = 0;
LABEL_27:
    v34 = v83;
    goto LABEL_29;
  }
  v34 = v83;
  uint64_t v33 = [v83 supportsChamoisSceneResizing] ^ 1;
LABEL_29:
  [v8 setScreenBoundsIgnoresSceneOrientation:v33];

  v35 = [v34 bundleIdentifier];
  if (![v35 isEqualToString:@"com.apple.camera"])
  {
LABEL_37:

    goto LABEL_38;
  }
  uint64_t v36 = [(SBDeviceApplicationSceneHandle *)self sceneIfExists];
  if (!v36)
  {
    int v40 = [v8 isForeground];

    if (!v40) {
      goto LABEL_38;
    }
    goto LABEL_36;
  }
  v37 = (void *)v36;
  v38 = [(SBDeviceApplicationSceneHandle *)self sceneIfExists];
  v39 = [v38 settings];
  if ([v39 isForeground])
  {

    goto LABEL_37;
  }
  char v41 = [v8 isForeground];

  if (v41)
  {
LABEL_36:
    unint64_t v42 = [v81 source];
    v43 = NSString;
    v44 = SBMainWorkspaceTransitionSourceDescription(v42);
    v35 = [v43 stringWithFormat:@"com.apple.cameraActivationCountWithSource.%@", v44];

    ADClientAddValueForScalarKey();
    goto LABEL_37;
  }
LABEL_38:
  v45 = [(id)SBApp modalAlertPresentationCoordinator];
  objc_msgSend(v8, "setCanShowAlerts:", objc_msgSend(v45, "canShowApplicationModalAlerts"));

  v46 = +[SBCoverSheetPresentationManager sharedInstance];
  v47 = [v46 traitsParticipantForSceneHandle:self];

  if (v47
    || ([v82 traitsParticipantForSceneHandle:self],
        (v47 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v48 = [v47 delegate];
    v49 = SBFSafeProtocolCast();

    if (!v49)
    {
      v76 = [MEMORY[0x1E4F28B00] currentHandler];
      v77 = (objc_class *)objc_opt_class();
      v78 = NSStringFromClass(v77);
      [v76 handleFailureInMethod:a2, self, @"SBDeviceApplicationSceneHandle.m", 1566, @"Unexpected delegate: %@ for scene handle %@", v78, self object file lineNumber description];
    }
    [v49 updateOrientationSceneSettingsForParticipant:v8];
    v50 = SBLogTraitsArbiter();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v51 = [v8 interfaceOrientation];
      v52 = [(SBDeviceApplicationSceneHandle *)self sceneIdentifier];
      *(_DWORD *)buf = 134218242;
      uint64_t v86 = v51;
      __int16 v87 = 2112;
      v88 = v52;
      _os_log_impl(&dword_1D85BA000, v50, OS_LOG_TYPE_DEFAULT, "[DeviceSceneHandle] Did set interfaceOrientation[%ld] on scene with identifier[%@]", buf, 0x16u);
    }
  }
  else
  {
    v47 = SBLogTraitsArbiter();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      v75 = [(SBDeviceApplicationSceneHandle *)self sceneIdentifier];
      *(_DWORD *)buf = 138412290;
      uint64_t v86 = (uint64_t)v75;
      _os_log_impl(&dword_1D85BA000, v47, OS_LOG_TYPE_DEFAULT, "[DeviceSceneHandle] Participant not found for scene identifier: %@", buf, 0xCu);
    }
  }

  [(SBDeviceApplicationSceneHandle *)self _populateSettingsWithDefaultStatusBarHeight:v8];
  uint64_t v53 = [v16 layoutRole];
  if (v53 == 3) {
    uint64_t v54 = 2;
  }
  else {
    uint64_t v54 = 1;
  }
  [(SBDeviceApplicationSceneHandle *)self _modifySafeAreaInsetsOnApplicationSceneSettings:v8 isFloating:v53 == 3];
  v55 = [(SBDeviceApplicationSceneHandle *)self displayEdgeInfoForLayoutEnvironment:v54];
  objc_msgSend(v55, "sb_applyDisplayEdgeInfoToSceneSettings:", v8);
  v56 = [(SBDeviceApplicationSceneHandle *)self _sceneCornerRadiusConfigurationFromRequestContext:v32 forEntity:v16];
  [v8 setCornerRadiusConfiguration:v56];

  objc_msgSend(v8, "setStatusBarParts:", -[SBDeviceApplicationSceneHandle statusBarParts](self, "statusBarParts"));
  objc_msgSend(v8, "setStatusBarAvoidanceFrame:", self->_statusBarAvoidanceFrame.origin.x, self->_statusBarAvoidanceFrame.origin.y, self->_statusBarAvoidanceFrame.size.width, self->_statusBarAvoidanceFrame.size.height);
  v57 = [(SBApplicationSceneHandle *)self application];
  v58 = [v57 info];
  uint64_t v59 = [v58 supportedUserInterfaceStyle];

  if (!v59)
  {
    v60 = (void *)SBApp;
    v61 = objc_msgSend(v8, "sb_displayIdentityForSceneManagers");
    v62 = [v60 userInterfaceStyleProviderForDisplay:v61];
    uint64_t v59 = [v62 currentStyle];
  }
  v63 = SBLogContinuitySession();
  if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
  {
    v64 = @"Unspecified";
    if (v59 == 1) {
      v64 = @"Light";
    }
    if (v59 == 2) {
      v65 = @"Dark";
    }
    else {
      v65 = v64;
    }
    v66 = [v8 displayIdentity];
    v67 = objc_msgSend(v8, "sb_displayIdentityForSceneManagers");
    *(_DWORD *)buf = 138544130;
    uint64_t v86 = (uint64_t)v65;
    __int16 v87 = 2114;
    v88 = v66;
    __int16 v89 = 2114;
    v90 = v67;
    __int16 v91 = 2114;
    v92 = self;
    _os_log_impl(&dword_1D85BA000, v63, OS_LOG_TYPE_DEFAULT, "modifying scene setting userInterfaceStyle to %{public}@ displayIdentity: %{public}@ forSceneManagers: %{public}@ %{public}@ ", buf, 0x2Au);
  }
  [v8 setUserInterfaceStyle:v59];
  objc_msgSend(v8, "setEnhancedWindowingEnabled:", -[SBDeviceApplicationSceneHandle _isEnhancedWindowingEffectivelyEnabled](self, "_isEnhancedWindowingEffectivelyEnabled"));
  if ([(SBDeviceApplicationSceneHandle *)self shouldApplyAppProtectionSceneSettings])
  {
    v68 = [(SBApplicationSceneHandle *)self application];
    v69 = +[SBApplicationAppProtectionAssistant assistantForApplication:v68];

    v70 = SBLogAppProtection();
    if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
    {
      int v71 = [v69 shouldShield];
      *(_DWORD *)buf = 67109120;
      LODWORD(v86) = v71;
      _os_log_impl(&dword_1D85BA000, v70, OS_LOG_TYPE_DEFAULT, "modifying scene setting underAppProtection to %d", buf, 8u);
    }

    if ([v69 shouldShield])
    {
      v72 = [v8 transientLocalSettings];
      [v72 setFlag:1 forSetting:*MEMORY[0x1E4F44140]];
    }
  }
  if ([v8 conformsToProtocol:&unk_1F35B14D8])
  {
    v73 = +[SBIconController sharedInstance];
    v74 = [v73 currentHomeScreenIconStyleConfiguration];

    [v8 setIconStyleConfiguration:v74];
  }
}

- (BOOL)shouldApplyAppProtectionSceneSettings
{
  return self->_shouldApplyAppProtectionSettings;
}

- (void)_populateSettingsWithDefaultStatusBarHeight:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(SBDeviceApplicationSceneHandle *)self _defaultStatusBarHeights];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __78__SBDeviceApplicationSceneHandle__populateSettingsWithDefaultStatusBarHeight___block_invoke;
  v7[3] = &unk_1E6B03D58;
  id v8 = v4;
  id v6 = v4;
  [v5 enumerateKeysAndObjectsUsingBlock:v7];
}

- (id)_sceneCornerRadiusConfigurationFromRequestContext:(id)a3 forEntity:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SBApplicationSceneHandle *)self application];
  id v9 = +[SBPlatformController sharedInstance];
  if (([v9 isRoundCornerPhone] & 1) == 0)
  {
    double v10 = 0.0;
    double v11 = 0.0;
    double v12 = 0.0;
    double v13 = 0.0;
    if (![v9 isRoundCornerPad]) {
      goto LABEL_46;
    }
  }
  v62 = v9;
  int v14 = [v6 displayIdentity];
  int v15 = [(id)SBApp windowSceneManager];
  uint64_t v16 = [v15 windowSceneForDisplayIdentity:v14];

  v60 = v16;
  int v17 = [v16 switcherController];
  int v18 = [v17 contentViewController];
  int v19 = [v18 liveOverlayForSceneHandle:self];

  uint64_t v59 = v17;
  uint64_t v20 = [v17 windowManagementStyle];
  int v21 = [v6 applicationSceneEntityForLayoutRole:2];

  id v57 = [v6 applicationSceneEntityForLayoutRole:1];

  id v56 = [v6 applicationSceneEntityForLayoutRole:2];

  id v22 = [v6 applicationSceneEntityForLayoutRole:3];

  int v58 = [v19 isMaximized];
  id v63 = v7;
  BOOL v25 = (v22 == v7 || v21 != 0) && v20 == 1;
  int v26 = [v8 isClassic];
  v61 = v14;
  [v14 UIScreen];
  int v28 = v27 = v8;
  v29 = [v28 traitCollection];
  [v29 displayCornerRadius];
  double v31 = v30;

  [v19 cornerRadii];
  double v13 = v32;
  double v12 = v33;
  double v11 = v34;
  double v10 = v35;
  if (v26)
  {
    -[SBApplication _screenTypeForClassicMode:]((uint64_t)v27, [v27 _classicMode]);
    SBHDisplayCornerRadiusForScreenType();
    double v37 = v36;
    unint64_t v38 = SBHScreenTypeForCurrentDevice();
    +[SBApplication _unobscuredScreenTypeForScreenType:]((uint64_t)SBApplication, v38);
    SBHDisplayCornerRadiusForScreenType();
    double v40 = v39;
    id v8 = v27;
    if (v20 == 2)
    {
      if (v58)
      {
        double v10 = v39;
        double v11 = v39;
        double v12 = v39;
        double v13 = v39;
      }
    }
    else
    {
      if ([v27 classicAppFullScreen]) {
        double v10 = v40;
      }
      else {
        double v10 = v37;
      }
      double v11 = v10;
      double v12 = v10;
      double v13 = v10;
    }
    id v7 = v63;
  }
  else
  {
    if (v20 == 2)
    {
      if (v58)
      {
        double v10 = v31;
        double v11 = v31;
        double v12 = v31;
        double v13 = v31;
      }
      id v7 = v63;
    }
    else
    {
      if (!v25)
      {
        id v7 = v63;
        v50 = v59;
        if (v57 == v63)
        {
          double v10 = v31;
          double v11 = v31;
          double v12 = v31;
          double v13 = v31;
        }
        else
        {
          double v10 = 0.0;
          double v11 = 0.0;
          double v12 = 0.0;
          double v13 = 0.0;
        }
        id v8 = v27;
        v48 = v61;
        id v9 = v62;
        v49 = v60;
        goto LABEL_45;
      }
      char v41 = +[SBMedusaDomain rootSettings];
      [v41 cornerRadiusForFloatingApps];
      double v43 = v42;
      [v41 cornerRadiusForInnerCorners];
      if (v21) {
        double v45 = v44;
      }
      else {
        double v45 = v31;
      }
      id v7 = v63;
      double v46 = 0.0;
      if (v22 == v63) {
        double v46 = v43;
      }
      if (v56 == v63) {
        double v47 = v31;
      }
      else {
        double v47 = v46;
      }
      if (v56 != v63) {
        double v44 = v46;
      }
      if (v57 == v63) {
        double v10 = v45;
      }
      else {
        double v10 = v47;
      }
      if (v57 == v63) {
        double v12 = v31;
      }
      else {
        double v12 = v44;
      }

      double v11 = v10;
      double v13 = v12;
    }
    id v8 = v27;
  }
  v48 = v61;
  id v9 = v62;
  v50 = v59;
  v49 = v60;
LABEL_45:

LABEL_46:
  uint64_t v51 = [(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection];
  if (v51 == 1) {
    double v52 = v13;
  }
  else {
    double v52 = v10;
  }
  if (v51 == 1) {
    double v53 = v12;
  }
  else {
    double v53 = v11;
  }
  if (v51 == 1) {
    double v12 = v11;
  }
  else {
    double v10 = v13;
  }
  uint64_t v54 = (void *)[objc_alloc(MEMORY[0x1E4F4F700]) initWithTopLeft:v10 bottomLeft:v12 bottomRight:v53 topRight:v52];

  return v54;
}

- (void)_modifySafeAreaInsetsOnApplicationSceneSettings:(id)a3 isFloating:(BOOL)a4
{
  id v6 = a3;
  id v7 = [(SBApplicationSceneHandle *)self application];
  if ([v7 isClassic])
  {
    id v8 = objc_msgSend(MEMORY[0x1E4FB33B0], "sb_displayEdgeInfoForApplication:", v7);
  }
  else
  {
    if (a4) {
      objc_msgSend(MEMORY[0x1E4FB33B0], "sb_floatingApplicationDisplayEdgeInfo");
    }
    else {
    id v8 = objc_msgSend(MEMORY[0x1E4FB33B0], "sb_thisDeviceDisplayEdgeInfo");
    }
  }
  id v9 = v8;
  objc_msgSend(v8, "sb_applyDisplayEdgeInfoToSceneSettings:", v6);
}

- (void)removeObserver:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SBDeviceApplicationSceneHandle;
  [(SBDeviceApplicationSceneHandle *)&v3 removeObserver:a3];
}

- (BOOL)contentPrefersToDisableClipping
{
  return self->_contentPrefersToDisableClipping;
}

- (BOOL)isEdgeProtectEnabledForHomeGesture
{
  if (SBFEffectiveHomeButtonType() == 2
    && [(SBDeviceApplicationSceneHandle *)self isAutoHideEnabledForHomeAffordance])
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    return ([(SBDeviceApplicationSceneHandle *)self screenEdgesDeferringSystemGestures] >> 2) & 1;
  }
  return v3;
}

- (BOOL)isAutoHideEnabledForHomeAffordance
{
  v2 = [(SBDeviceApplicationSceneHandle *)self sceneIfExists];
  BOOL v3 = [v2 uiClientSettings];
  char v4 = [v3 homeIndicatorAutoHidden];

  return v4;
}

- (unint64_t)screenEdgesDeferringSystemGestures
{
  BOOL v3 = [(SBDeviceApplicationSceneHandle *)self sceneIfExists];
  char v4 = v3;
  if (v3)
  {
    int64_t v5 = [v3 uiClientSettings];
    unint64_t v6 = [v5 screenEdgesDeferringSystemGestures];
    id v7 = [(SBApplicationSceneHandle *)self application];
    if (![v7 isClassic] || (objc_msgSend(v7, "classicAppFullScreen") & 1) != 0) {
      goto LABEL_16;
    }
    if ([v7 classicAppPhoneAppRunningOnPad])
    {
      unint64_t v6 = 0;
LABEL_16:

      goto LABEL_17;
    }
    if (__sb__runningInSpringBoard())
    {
      if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
        goto LABEL_16;
      }
    }
    else
    {
      id v8 = [MEMORY[0x1E4F42948] currentDevice];
      uint64_t v9 = [v8 userInterfaceIdiom];

      if (v9) {
        goto LABEL_16;
      }
    }
    if ((unint64_t)([(SBDeviceApplicationSceneHandle *)self currentInterfaceOrientation]- 1) > 1)uint64_t v10 = -11; {
    else
    }
      uint64_t v10 = -6;
    v6 &= v10;
    goto LABEL_16;
  }
  unint64_t v6 = 0;
LABEL_17:

  return v6;
}

- (void)setWantsEnhancedWindowingEnabled:(BOOL)a3
{
  self->_wantsEnhancedWindowingEnabled = a3;
}

- (void)setStatusBarParts:(int64_t)a3
{
  if (self->_statusBarParts != a3)
  {
    self->_statusBarParts = a3;
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __52__SBDeviceApplicationSceneHandle_setStatusBarParts___block_invoke;
    v3[3] = &unk_1E6B03BF8;
    v3[4] = self;
    v3[5] = a3;
    [(SBDeviceApplicationSceneHandle *)self _enumerateObserversWithBlock:v3];
  }
}

- (void)setStatusBarAvoidanceFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  p_statusBarAvoidanceFrame = &self->_statusBarAvoidanceFrame;
  if (!CGRectEqualToRect(self->_statusBarAvoidanceFrame, a3))
  {
    p_statusBarAvoidanceFrame->origin.CGFloat x = x;
    p_statusBarAvoidanceFrame->origin.CGFloat y = y;
    p_statusBarAvoidanceFrame->size.CGFloat width = width;
    p_statusBarAvoidanceFrame->size.CGFloat height = height;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __61__SBDeviceApplicationSceneHandle_setStatusBarAvoidanceFrame___block_invoke;
    v9[3] = &unk_1E6B03C20;
    v9[4] = self;
    *(CGFloat *)&v9[5] = x;
    *(CGFloat *)&v9[6] = y;
    *(CGFloat *)&v9[7] = width;
    *(CGFloat *)&v9[8] = height;
    [(SBDeviceApplicationSceneHandle *)self _enumerateObserversWithBlock:v9];
  }
}

void __70__SBDeviceApplicationSceneHandle__noteMainSceneBackgroundStyleChanged__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  SBDefaultBackgroundColorForAppScene([v2 isTranslucent] ^ 1);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v3 setBackgroundColorWhileHosting:v4];
}

- (BOOL)prefersHeaderHiddenInSwitcher
{
  v2 = [(SBDeviceApplicationSceneHandle *)self sceneIfExists];
  if (v2)
  {
    uint64_t v3 = objc_opt_class();
    id v4 = [v2 uiSettings];
    int64_t v5 = SBSafeCast(v3, v4);

    if (v5) {
      int v6 = [v5 isScreenSharingPresentation] ^ 1;
    }
    else {
      LOBYTE(v6) = 0;
    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (void)addObserver:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SBDeviceApplicationSceneHandle;
  [(SBDeviceApplicationSceneHandle *)&v3 addObserver:a3];
}

uint64_t __78__SBDeviceApplicationSceneHandle__populateSettingsWithDefaultStatusBarHeight___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a2;
  double v6 = (double)[a3 integerValue];
  uint64_t v7 = [v5 integerValue];

  return [v4 setDefaultStatusBarHeight:v7 forOrientation:v6];
}

- (id)_sceneHostingInfoForSnapshottingAssertionWithView:(id)a3
{
  id v4 = a3;
  id v5 = [v4 window];
  double v6 = v5;
  uint64_t v7 = 0;
  if (v4 && v5)
  {
    uint64_t v8 = [v5 _contextId];
    uint64_t v9 = [v4 layer];
    uint64_t RenderId = CALayerGetRenderId();

    double v11 = NSString;
    double v12 = [(SBDeviceApplicationSceneHandle *)self sceneIdentifier];
    double v13 = [v11 stringWithFormat:@"%@-%lu-%lu", v12, v8, RenderId];

    objc_initWeak(&location, self);
    int v14 = [_SBDeviceApplicationSceneHandleSnapshottingAssertion alloc];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __84__SBDeviceApplicationSceneHandle__sceneHostingInfoForSnapshottingAssertionWithView___block_invoke;
    v16[3] = &unk_1E6B03DA0;
    objc_copyWeak(&v17, &location);
    uint64_t v7 = [(_SBDeviceApplicationSceneHandleSnapshottingAssertion *)v14 initWithIdentifier:v13 forReason:@"SnapshottingMetadata" contextId:v8 renderId:RenderId invalidationBlock:v16];
    [(SBDeviceApplicationSceneHandle *)self _addSnapshottingInfoAssertion:v7];
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  return v7;
}

- (int64_t)_interfaceOrientationMode
{
  objc_super v3 = [(SBDeviceApplicationSceneHandle *)self sceneIfExists];
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 uiSettings];
    int64_t v6 = [v5 interfaceOrientationMode];
  }
  else
  {
    id v5 = [(SBApplicationSceneHandle *)self application];
    if (_SBApplicationClassicModeIsClassic([v5 _defaultClassicMode])) {
      int64_t v6 = 1;
    }
    else {
      int64_t v6 = 2;
    }
  }

  return v6;
}

- (void)_addSnapshottingInfoAssertion:(id)a3
{
  id v4 = a3;
  snapshottingInfoAssertions = self->_snapshottingInfoAssertions;
  id obj = v4;
  if (!snapshottingInfoAssertions)
  {
    int64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_snapshottingInfoAssertions;
    self->_snapshottingInfoAssertions = v6;

    id v4 = obj;
    snapshottingInfoAssertions = self->_snapshottingInfoAssertions;
  }
  [(NSMutableArray *)snapshottingInfoAssertions addObject:v4];
  objc_storeWeak((id *)&self->_currentSnapshottingInfoAssertion, obj);
  [(SBDeviceApplicationSceneHandle *)self _updateSceneHostingInfoForSnapshottingWithAssertion:obj forceUpdate:1];
}

- (void)_updateSceneHostingInfoForSnapshottingWithAssertion:(id)a3 forceUpdate:(BOOL)a4
{
  id v6 = a3;
  uint64_t v7 = [(SBDeviceApplicationSceneHandle *)self sceneIfExists];
  if ([v7 isValid])
  {
    int v8 = [v6 contextId];
    uint64_t v9 = [v6 renderId];
    uint64_t v10 = [v7 uiSettings];
    double v11 = v10;
    if (a4
      || [v10 hostContextIdentifierForSnapshotting] == v8
      && [v11 scenePresenterRenderIdentifierForSnapshotting] == v9)
    {
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __98__SBDeviceApplicationSceneHandle__updateSceneHostingInfoForSnapshottingWithAssertion_forceUpdate___block_invoke;
      v12[3] = &__block_descriptor_44_e43_v16__0__UIMutableApplicationSceneSettings_8l;
      int v13 = v8;
      v12[4] = v9;
      [v7 updateUISettingsWithBlock:v12];
    }
  }
}

- (void)_didUpdateClientSettingsWithDiff:(id)a3 transitionContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)SBDeviceApplicationSceneHandle;
  [(SBDeviceApplicationSceneHandle *)&v20 _didUpdateClientSettingsWithDiff:v6 transitionContext:v7];
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    int v13 = [MEMORY[0x1E4F28B00] currentHandler];
    int v14 = [NSString stringWithUTF8String:"-[SBDeviceApplicationSceneHandle _didUpdateClientSettingsWithDiff:transitionContext:]"];
    [v13 handleFailureInFunction:v14 file:@"SBDeviceApplicationSceneHandle.m" lineNumber:1414 description:@"this call must be made on the main thread"];
  }
  clientSettingsInspector = self->_clientSettingsInspector;
  if (!clientSettingsInspector)
  {
    uint64_t v9 = (UIApplicationSceneClientSettingsDiffInspector *)objc_alloc_init(MEMORY[0x1E4F42768]);
    uint64_t v10 = self->_clientSettingsInspector;
    self->_clientSettingsInspector = v9;

    objc_initWeak(&location, self);
    double v11 = self->_clientSettingsInspector;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __85__SBDeviceApplicationSceneHandle__didUpdateClientSettingsWithDiff_transitionContext___block_invoke;
    v17[3] = &unk_1E6AF85E0;
    objc_copyWeak(&v18, &location);
    [(UIApplicationSceneClientSettingsDiffInspector *)v11 observeVisibleMiniAlertCountWithBlock:v17];
    double v12 = self->_clientSettingsInspector;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __85__SBDeviceApplicationSceneHandle__didUpdateClientSettingsWithDiff_transitionContext___block_invoke_2;
    v15[3] = &unk_1E6AF85E0;
    objc_copyWeak(&v16, &location);
    [(UIApplicationSceneClientSettingsDiffInspector *)v12 observeSupportedInterfaceOrientationsWithBlock:v15];
    objc_destroyWeak(&v16);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
    clientSettingsInspector = self->_clientSettingsInspector;
  }
  [(UIApplicationSceneClientSettingsDiffInspector *)clientSettingsInspector inspectDiff:v6 withContext:v7];
}

- (void)_modifyApplicationSceneClientSettings:(id)a3 fromRequestContext:(id)a4 entity:(id)a5 initialSceneSettings:(id)a6
{
  id v10 = a3;
  v22.receiver = self;
  v22.super_class = (Class)SBDeviceApplicationSceneHandle;
  id v11 = a6;
  id v12 = a5;
  [(SBApplicationSceneHandle *)&v22 _modifyApplicationSceneClientSettings:v10 fromRequestContext:a4 entity:v12 initialSceneSettings:v11];
  int v13 = [(SBApplicationSceneHandle *)self application];
  uint64_t v14 = [v11 interfaceOrientation];
  [v10 setInterfaceOrientation:v14];
  uint64_t v15 = [v11 interfaceOrientationMode];

  if (v15 == 1) {
    objc_msgSend(v10, "setSupportedInterfaceOrientations:", -[SBDeviceApplicationSceneHandle _mainSceneSupportedInterfaceOrientations](self, "_mainSceneSupportedInterfaceOrientations"));
  }
  objc_msgSend(v10, "setBackgroundStyle:", -[SBDeviceApplicationSceneHandle backgroundStyle](self, "backgroundStyle"));
  [v10 setProximityDetectionModes:1];
  id v16 = [v12 activationSettings];
  objc_msgSend(v10, "setStatusBarModernStyle:", -[SBDeviceApplicationSceneHandle _statusBarStyleWithActivationSettings:](self, "_statusBarStyleWithActivationSettings:", v16));

  id v17 = [v12 activationSettings];
  objc_msgSend(v10, "setStatusBarHidden:", -[SBDeviceApplicationSceneHandle isStatusBarHiddenForActivation:forOrientation:](self, "isStatusBarHiddenForActivation:forOrientation:", v17, v14));

  [(SBDeviceApplicationSceneHandle *)self statusBarAlpha];
  objc_msgSend(v10, "setStatusBarAlpha:");
  objc_msgSend(v10, "setDefaultStatusBarStyle:", _SBStatusBarLegacyStyleFromStyle(-[SBDeviceApplicationSceneHandle defaultStatusBarStyle](self, "defaultStatusBarStyle")));
  objc_msgSend(v10, "setDefaultStatusBarHidden:", -[SBDeviceApplicationSceneHandle defaultStatusBarHiddenForOrientation:](self, "defaultStatusBarHiddenForOrientation:", v14));
  double v21 = 0.0;
  id v18 = [(SBDeviceApplicationSceneHandle *)self sceneIdentifier];
  int v19 = [v13 _defaultPNGNameFromSuspensionSettingsWithExpiration:&v21 sceneID:v18];

  [v10 setDefaultPNGName:v19];
  [v10 setDefaultPNGExpirationTime:v21];
  objc_super v20 = [v12 activationSettings];

  objc_msgSend(v10, "setCompatibilityMode:", -[SBDeviceApplicationSceneHandle _initialMainSceneCompabilityMode:](self, "_initialMainSceneCompabilityMode:", v20));
  [v10 setReachabilitySupported:1];
  objc_msgSend(v10, "setWhitePointAdaptivityStyle:", -[SBDeviceApplicationSceneHandle whitePointAdaptivityStyle](self, "whitePointAdaptivityStyle"));
}

- (int64_t)defaultStatusBarStyle
{
  v2 = [(SBDeviceApplicationSceneHandle *)self statusBarStateProvider];
  int64_t v3 = [v2 defaultStatusBarStyle];

  return v3;
}

- (BOOL)isTranslucent
{
  int v4 = __sb__runningInSpringBoard();
  char v5 = v4;
  if (v4)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      return [(SBDeviceApplicationSceneHandle *)self wallpaperStyle] != 1;
    }
    if (SBFEffectiveHomeButtonType() != 2)
    {
      if (v5) {
        return [(SBDeviceApplicationSceneHandle *)self wallpaperStyle] != 1;
      }
      goto LABEL_12;
    }
  }
  else
  {
    v2 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v2 userInterfaceIdiom] || SBFEffectiveHomeButtonType() != 2)
    {
LABEL_12:

      return [(SBDeviceApplicationSceneHandle *)self wallpaperStyle] != 1;
    }
  }
  id v6 = [(SBApplicationSceneHandle *)self application];
  char v7 = [v6 isClassic];

  if (v5)
  {
    if ((v7 & 1) == 0) {
      return [(SBDeviceApplicationSceneHandle *)self wallpaperStyle] != 1;
    }
  }
  else
  {

    if ((v7 & 1) == 0) {
      return [(SBDeviceApplicationSceneHandle *)self wallpaperStyle] != 1;
    }
  }
  return 1;
}

- (int64_t)wallpaperStyle
{
  [(SBDeviceApplicationSceneHandle *)self backgroundStyle];
  return _WallpaperStyleForBackgroundStyle();
}

- (int64_t)backgroundStyle
{
  int64_t v3 = [(SBDeviceApplicationSceneHandle *)self sceneIfExists];
  if (v3)
  {
    int v4 = [(SBApplicationSceneHandle *)self application];
    char v5 = [v4 info];
    id v6 = [v3 uiClientSettings];
    int64_t v7 = objc_msgSend(v5, "backgroundStyleForRequestedBackgroundStyle:", objc_msgSend(v6, "backgroundStyle"));
  }
  else
  {
    int64_t v7 = [(SBDeviceApplicationSceneHandle *)self defaultBackgroundStyle];
  }

  return v7;
}

- (int64_t)defaultBackgroundStyle
{
  return self->_defaultBackgroundStyle;
}

- (double)statusBarAlpha
{
  int64_t v3 = [(SBDeviceApplicationSceneHandle *)self sceneIfExists];
  int v4 = v3;
  if (v3)
  {
    char v5 = [v3 uiClientSettings];
    [v5 statusBarAlpha];
    double v7 = v6;
  }
  else
  {
    [(SBDeviceApplicationSceneHandle *)self defaultStatusBarAlpha];
    double v7 = v8;
  }

  return v7;
}

- (SBScenePlaceholderContentViewProvider)placeholderContentProvider
{
  return self->_placeholderContentProvider;
}

- (BOOL)isStatusBarHiddenForActivation:(id)a3 forOrientation:(int64_t)a4
{
  double v6 = [a3 objectForActivationSetting:5];
  double v7 = [v6 scheme];

  double v8 = [(SBDeviceApplicationSceneHandle *)self sceneIfExists];

  if (!v8 || v7)
  {
    char v11 = [(SBDeviceApplicationSceneHandle *)self defaultStatusBarHiddenForOrientation:a4];
  }
  else
  {
    uint64_t v9 = [(SBDeviceApplicationSceneHandle *)self scene];
    id v10 = [v9 uiClientSettings];
    char v11 = [v10 statusBarHidden];
  }
  return v11;
}

- (double)defaultStatusBarAlpha
{
  return 1.0;
}

- (void)_setIdleTimerCoordinator:(id)a3
{
}

- (int64_t)_initialMainSceneCompabilityMode:(id)a3
{
  id v4 = a3;
  char v5 = [(SBApplicationSceneHandle *)self application];
  int v6 = [v5 isClassic];
  double v7 = [v4 objectForActivationSetting:20];

  uint64_t v8 = [v7 integerValue];
  if (_SBApplicationClassicModeIsClassic(v8) || v6)
  {
    if ([v5 classicAppZoomedIn]) {
      int64_t v9 = 2;
    }
    else {
      int64_t v9 = 1;
    }
  }
  else
  {
    int64_t v9 = 0;
  }

  return v9;
}

- (id)_defaultStatusBarHeights
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  if (_defaultStatusBarHeights_onceToken != -1) {
    dispatch_once(&_defaultStatusBarHeights_onceToken, &__block_literal_global_205);
  }
  int64_t v3 = [(SBApplicationSceneHandle *)self application];
  double v30 = [(SBDeviceApplicationSceneHandle *)self _defaultStatusBarForAssociatedDisplay];
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  if (![v3 isClassic])
  {
    *(double *)&uint64_t v8 = 1.79769313e308;
    goto LABEL_9;
  }
  double v5 = 20.0;
  if (SBApplicationClassicModeExpectsRoundedCorners([v3 _classicMode]))
  {
    int v6 = [MEMORY[0x1E4F42948] currentDevice];
    uint64_t v7 = [v6 userInterfaceIdiom];

    if ((v7 & 0xFFFFFFFFFFFFFFFBLL) != 1
      || (double v5 = 24.0, [v3 classicAppPhoneAppRunningOnPad]))
    {
      *(double *)&uint64_t v8 = 44.0;
LABEL_9:
      double v5 = *(double *)&v8;
    }
  }
  v29 = v3;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = (id)_defaultStatusBarHeights_sEnumerator;
  uint64_t v9 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v34;
    unint64_t v12 = 0x1E4F28000uLL;
    do
    {
      uint64_t v13 = 0;
      uint64_t v31 = v10;
      do
      {
        if (*(void *)v34 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void **)(*((void *)&v33 + 1) + 8 * v13);
        uint64_t v15 = objc_msgSend(v14, "integerValue", v29);
        BOOL v16 = [(SBDeviceApplicationSceneHandle *)self isStatusBarForcedHiddenForOrientation:v15];
        if (v16) {
          double v17 = 0.0;
        }
        else {
          double v17 = v5;
        }
        if (!v16 && v5 == 1.79769313e308)
        {
          id v18 = [(SBApplicationSceneHandle *)self application];
          int v19 = [v18 info];
          if (v19)
          {
            objc_super v20 = [(SBApplicationSceneHandle *)self application];
            [v20 info];
            double v21 = self;
            uint64_t v22 = v11;
            int v24 = v23 = v4;
            objc_msgSend(v30, "heightForOrientation:isAzulBLinked:", v15, objc_msgSend(v24, "isAzulBLinked"));
            double v17 = v25;

            id v4 = v23;
            uint64_t v11 = v22;
            self = v21;
            unint64_t v12 = 0x1E4F28000;
          }
          else
          {
            [v30 heightForOrientation:v15 isAzulBLinked:1];
            double v17 = v26;
          }

          uint64_t v10 = v31;
        }
        v27 = [*(id *)(v12 + 3792) numberWithDouble:v17];
        [v4 setObject:v27 forKeyedSubscript:v14];

        ++v13;
      }
      while (v10 != v13);
      uint64_t v10 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v10);
  }

  return v4;
}

- (BOOL)isStatusBarForcedHiddenForOrientation:(int64_t)a3
{
  double v5 = [(SBApplicationSceneHandle *)self application];
  int v6 = [v5 info];
  uint64_t v7 = [(SBDeviceApplicationSceneHandle *)self _potentiallyJailedDisplayConfiguration];
  LOBYTE(a3) = [v6 statusBarForcedHiddenForInterfaceOrientation:a3 onDisplay:v7];

  return a3;
}

- (id)_defaultStatusBarForAssociatedDisplay
{
  v2 = [(SBDeviceApplicationSceneHandle *)self _windowScene];
  int64_t v3 = [v2 statusBarManager];
  id v4 = [v3 statusBar];

  return v4;
}

- (void)_didUpdateSettingsWithDiff:(id)a3 previousSettings:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)SBDeviceApplicationSceneHandle;
  [(SBDeviceApplicationSceneHandle *)&v10 _didUpdateSettingsWithDiff:a3 previousSettings:a4];
  double v5 = [(SBDeviceApplicationSceneHandle *)self scene];
  int v6 = [v5 settings];
  int v7 = [v6 isForeground];

  if (self->_isEffectivelyForeground != v7)
  {
    self->_isEffectivelyForeground = v7;
    if ((v7 & 1) == 0) {
      [(SBDeviceApplicationSceneHandle *)self _resetSceneOrientationRequestState];
    }
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __78__SBDeviceApplicationSceneHandle__didUpdateSettingsWithDiff_previousSettings___block_invoke;
    v8[3] = &unk_1E6B03D30;
    v8[4] = self;
    char v9 = v7;
    [(SBDeviceApplicationSceneHandle *)self _enumerateObserversWithBlock:v8];
  }
}

- (void)_didCreateScene:(id)a3
{
  id v4 = a3;
  double v5 = [v4 settings];
  self->_isEffectivelyForeground = [v5 isForeground];

  v23.receiver = self;
  v23.super_class = (Class)SBDeviceApplicationSceneHandle;
  [(SBDeviceApplicationSceneHandle *)&v23 _didCreateScene:v4];
  int v6 = [(SBDeviceApplicationSceneHandle *)self _sceneDataStoreCreatingIfNecessary:1];
  int v7 = [(SBDeviceApplicationSceneHandle *)self _definition];
  uint64_t v8 = [v7 specification];
  char v9 = [v8 uiSceneSessionRole];

  [v6 setObject:v9 forKey:@"sceneSessionRole"];
  objc_super v10 = [[SBModalAlertPresenter alloc] initWithScene:v4];
  modalAlertPresenter = self->_modalAlertPresenter;
  self->_modalAlertPresenter = v10;

  [(SBDeviceApplicationSceneHandle *)self _noteMainSceneBackgroundStyleChanged];
  unint64_t v12 = [(SBApplicationSceneHandle *)self application];
  uint64_t v13 = [v12 info];
  -[SBDeviceApplicationSceneHandle setWhitePointAdaptivityStyle:](self, "setWhitePointAdaptivityStyle:", [v13 whitePointAdaptivityStyle]);

  uint64_t v14 = [v4 uiPresentationManager];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __50__SBDeviceApplicationSceneHandle__didCreateScene___block_invoke;
  v22[3] = &unk_1E6AF51C8;
  v22[4] = self;
  [v14 modifyDefaultPresentationContext:v22];

  uint64_t v15 = [v4 clientProcess];
  LODWORD(v13) = [v15 isApplicationProcess];

  if (v13)
  {
    BOOL v16 = [v4 clientProcess];
    [v16 addObserver:self];
  }
  if ([(SBDeviceApplicationSceneHandle *)self shouldApplyAppProtectionSceneSettings]&& !self->_appProtectionSubscription)
  {
    double v17 = [MEMORY[0x1E4F4B800] subjectMonitorRegistry];
    id v18 = [v17 addMonitor:self subjectMask:1];
    appProtectionSubscription = self->_appProtectionSubscription;
    self->_appProtectionSubscription = v18;
  }
  objc_super v20 = [(SBApplicationSceneHandle *)self application];
  double v21 = [v20 appProtectionAssistant];
  [(SBDeviceApplicationSceneHandle *)self appProtectionAssistantShouldShieldDidChange:v21];

  if (self->_occludedByApplication) {
    [(SBDeviceApplicationSceneHandle *)self _updateApplicationOcclusionRects];
  }
  if (self->_occludedBySystemUI) {
    [(SBDeviceApplicationSceneHandle *)self _updateSystemOcclusionRects];
  }
  if (self->_computedActivityMode) {
    [(SBDeviceApplicationSceneHandle *)self _updateActivityMode];
  }
  if (self->_computedJetsamMode) {
    [(SBDeviceApplicationSceneHandle *)self _updateJetsamMode];
  }
  if (self->_computedTaskSuspensionForegroundPreference) {
    [(SBDeviceApplicationSceneHandle *)self _updatePrefersProcessTaskSuspensionWhileSceneForeground];
  }
}

- (void)_setInterfaceOrientationFromUserResizing:(int64_t)a3
{
  [(SBDeviceApplicationSceneHandle *)self _sceneDataStoreCreatingIfNecessary:a3 != 0];
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = [NSNumber numberWithInteger:a3];
  [v5 setObject:v4 forKey:@"interfaceOrientationFromUserResizing"];
}

- (void)_noteSceneTitleChanged
{
  int64_t v3 = [(SBDeviceApplicationSceneHandle *)self sceneTitle];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __56__SBDeviceApplicationSceneHandle__noteSceneTitleChanged__block_invoke;
  v5[3] = &unk_1E6B03D08;
  v5[4] = self;
  id v6 = v3;
  id v4 = v3;
  [(SBDeviceApplicationSceneHandle *)self _enumerateObserversWithBlock:v5];
}

- (NSString)sceneTitle
{
  int64_t v3 = [(SBDeviceApplicationSceneHandle *)self sceneIfExists];
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 uiClientSettings];
    [v5 canvasTitle];
  }
  else
  {
    id v5 = [(SBDeviceApplicationSceneHandle *)self _sceneDataStoreCreatingIfNecessary:0];
    [v5 objectForKey:@"canvasTitle"];
  id v6 = };

  return (NSString *)v6;
}

- (void)setWhitePointAdaptivityStyle:(int64_t)a3
{
  self->_whitePointAdaptivityStyle = a3;
}

- (void)_noteMainSceneBackgroundStyleChanged
{
  int64_t v3 = [(SBDeviceApplicationSceneHandle *)self sceneIfExists];
  id v4 = [v3 uiPresentationManager];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __70__SBDeviceApplicationSceneHandle__noteMainSceneBackgroundStyleChanged__block_invoke;
  v5[3] = &unk_1E6AF51C8;
  v5[4] = self;
  [v4 modifyDefaultPresentationContext:v5];
}

- (int64_t)whitePointAdaptivityStyle
{
  return self->_whitePointAdaptivityStyle;
}

- (void)_modifyProcessExecutionContext:(id)a3 fromRequestContext:(id)a4 entity:(id)a5
{
  id v8 = a3;
  v18.receiver = self;
  v18.super_class = (Class)SBDeviceApplicationSceneHandle;
  id v9 = a5;
  [(SBApplicationSceneHandle *)&v18 _modifyProcessExecutionContext:v8 fromRequestContext:a4 entity:v9];
  objc_super v10 = [(SBApplicationSceneHandle *)self application];
  uint64_t v11 = [v9 objectForActivationSetting:20];

  uint64_t v12 = [v10 _defaultClassicMode];
  uint64_t v13 = [v11 integerValue];
  if (v11) {
    uint64_t v12 = v13;
  }
  uint64_t v14 = [v8 environment];
  if (v14)
  {
    id v15 = objc_alloc(MEMORY[0x1E4F1CA60]);
    BOOL v16 = [v8 environment];
    id v17 = (id)[v15 initWithDictionary:v16];
  }
  else
  {
    id v17 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }

  if (v12 != -1)
  {
    [v10 _setCurrentClassicMode:v12];
    if (v11) {
      [v17 setObject:v11 forKey:@"CLASSIC_OVERRIDE"];
    }
    [v10 _setCurrentClassicMode:v12];
    if ([v10 classicAppPhoneAppRunningOnPad]) {
      [v17 setObject:@"iphone" forKey:@"CLASSIC_SUFFIX"];
    }
  }
  [v8 setEnvironment:v17];
}

- (void)_modifyApplicationTransitionContext:(id)a3 fromRequestContext:(id)a4 entity:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SBDeviceApplicationSceneHandle;
  [(SBApplicationSceneHandle *)&v15 _modifyApplicationTransitionContext:a3 fromRequestContext:v8 entity:v9];
  objc_super v10 = [v8 request];
  uint64_t v11 = [v10 source];

  if (v11 != 11) {
    [(SBDeviceApplicationSceneHandle *)self setLastActivationSource:v11];
  }
  uint64_t v12 = [v8 previousEntities];
  if ([v12 containsObject:v9]) {
    goto LABEL_6;
  }
  uint64_t v13 = [v8 entities];
  int v14 = [v13 containsObject:v9];

  if (v14)
  {
    uint64_t v12 = [v9 objectForActivationSetting:46];
    [(SBDeviceApplicationSceneHandle *)self setLastActivationIconLeafIdentifier:v12];
LABEL_6:
  }
}

- (void)setLastActivationSource:(int64_t)a3
{
  self->_lastActivationSource = a3;
}

- (void)setLastActivationIconLeafIdentifier:(id)a3
{
}

uint64_t __50__SBDeviceApplicationSceneHandle__didCreateScene___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setPresentedLayerTypes:*(void *)(*(void *)(a1 + 32) + 192)];
}

- (void)setShouldApplyAppProtectionSceneSettings:(BOOL)a3
{
  self->_shouldApplyAppProtectionSettings = a3;
}

- (id)effectiveStatusBarStyleRequestForActivation:(id)a3
{
  int64_t v4 = [(SBDeviceApplicationSceneHandle *)self _statusBarStyleWithActivationSettings:a3];
  return [(SBDeviceApplicationSceneHandle *)self statusBarEffectiveStyleRequestWithStyle:v4];
}

- (id)displayEdgeInfoForLayoutEnvironment:(int64_t)a3
{
  id v5 = [(SBApplicationSceneHandle *)self application];
  BOOL IsClassic = _SBApplicationClassicModeIsClassic([v5 _classicMode]);

  if (IsClassic)
  {
    int v7 = (void *)MEMORY[0x1E4FB33B0];
    id v8 = [(SBApplicationSceneHandle *)self application];
    id v9 = objc_msgSend(v7, "sb_displayEdgeInfoForApplication:", v8);
  }
  else
  {
    if (a3 == 2) {
      objc_msgSend(MEMORY[0x1E4FB33B0], "sb_floatingApplicationDisplayEdgeInfo");
    }
    else {
    id v9 = objc_msgSend(MEMORY[0x1E4FB33B0], "sb_thisDeviceDisplayEdgeInfo");
    }
  }
  return v9;
}

- (BOOL)hasMainSceneBeenForegroundAtLeastOnce
{
  return self->_hasMainSceneBeenForegroundAtLeastOnce;
}

void __98__SBDeviceApplicationSceneHandle__updateSceneHostingInfoForSnapshottingWithAssertion_forceUpdate___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(unsigned int *)(a1 + 40);
  id v4 = a2;
  [v4 setHostContextIdentifierForSnapshotting:v3];
  [v4 setScenePresenterRenderIdentifierForSnapshotting:*(void *)(a1 + 32)];
}

- (BOOL)prefersKillingInSwitcherDisabled
{
  uint64_t v3 = [(SBDeviceApplicationSceneHandle *)self sceneIfExists];
  if (v3)
  {
    uint64_t v4 = objc_opt_class();
    id v5 = [v3 uiClientSettings];
    id v6 = SBSafeCast(v4, v5);

    char v7 = v6 != 0;
  }
  else
  {
    id v6 = [(SBDeviceApplicationSceneHandle *)self _definition];
    id v8 = [v6 specification];
    char v7 = objc_msgSend((id)objc_msgSend(v8, "clientSettingsClass"), "isEqual:", objc_opt_class());
  }
  return v7;
}

- (void)setBackgroundActivitiesToSuppress:(id)a3
{
  id v6 = a3;
  if ((BSEqualSets() & 1) == 0)
  {
    uint64_t v4 = (NSSet *)[v6 copy];
    backgroundActivitiesToSuppress = self->_backgroundActivitiesToSuppress;
    self->_backgroundActivitiesToSuppress = v4;

    [(SBDeviceApplicationSceneHandle *)self _noteBackgroundActivitiesToSuppressChanged];
  }
}

- (id)newSceneViewWithReferenceSize:(CGSize)a3 contentOrientation:(int64_t)a4 containerOrientation:(int64_t)a5 hostRequester:(id)a6
{
  double height = a3.height;
  double width = a3.width;
  id v11 = a6;
  uint64_t v12 = -[SBDeviceApplicationSceneView initWithSceneHandle:referenceSize:contentOrientation:containerOrientation:hostRequester:]([SBDeviceApplicationSceneView alloc], "initWithSceneHandle:referenceSize:contentOrientation:containerOrientation:hostRequester:", self, a4, a5, v11, width, height);

  return v12;
}

- (id)additionalActionsForActivatingSceneEntity:(id)a3 withTransitionContext:(id)a4
{
  return 0;
}

void __85__SBDeviceApplicationSceneHandle__didUpdateClientSettingsWithDiff_transitionContext___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained scene];
  v2 = [v1 uiClientSettings];
  [v2 supportedInterfaceOrientations];

  [WeakRetained _interfaceOrientationFromUserResizing];
  if ((SBFInterfaceOrientationMaskContainsInterfaceOrientation() & 1) == 0) {
    [WeakRetained _setInterfaceOrientationFromUserResizing:0];
  }
}

- (void)setAlertSuppressionContextsBySectionIdentifier:(id)a3
{
  id v5 = (NSDictionary *)a3;
  if (self->_alertSuppressionContextsBySectionIdentifier != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_alertSuppressionContextsBySectionIdentifier, a3);
    id v5 = v6;
  }
}

- (void)_commonInitWithApplication:(id)a3 sceneIdentifier:(id)a4 displayIdentity:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v30.receiver = self;
  v30.super_class = (Class)SBDeviceApplicationSceneHandle;
  [(SBApplicationSceneHandle *)&v30 _commonInitWithApplication:v8 sceneIdentifier:v9 displayIdentity:v10];
  id v11 = [v8 info];
  self->_defaultBackgroundStyle = [v11 backgroundStyle];

  uint64_t v12 = [[SBDeviceApplicationSceneViewPlaceholderContentViewProvider alloc] initWithApplication:v8];
  placeholderContentProvider = self->_placeholderContentProvider;
  self->_placeholderContentProvider = (SBScenePlaceholderContentViewProvider *)v12;

  int v14 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
  activityModeAssertions = self->_activityModeAssertions;
  self->_activityModeAssertions = v14;

  BOOL v16 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
  jetsamModeAssertions = self->_jetsamModeAssertions;
  self->_jetsamModeAssertions = v16;

  objc_super v18 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
  taskSuspensionForegroundPreferenceAssertions = self->_taskSuspensionForegroundPreferenceAssertions;
  self->_taskSuspensionForegroundPreferenceAssertions = v18;

  [(SBApplicationSceneHandle *)self addSceneUpdateContributer:self];
  [(SBDeviceApplicationSceneHandle *)self _didUpdateDisplayIdentity];
  objc_super v20 = [v8 appProtectionAssistant];
  [v20 addObserver:self];

  double v21 = NSString;
  uint64_t v22 = (objc_class *)objc_opt_class();
  objc_super v23 = NSStringFromClass(v22);
  int v24 = [v21 stringWithFormat:@"SpringBoard - %@ - %@", v23, v9];

  objc_initWeak(&location, self);
  id v25 = MEMORY[0x1E4F14428];
  objc_copyWeak(&v28, &location);
  BSLogAddStateCaptureBlockWithTitle();
  double v26 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
  stateCaptureInvalidatable = self->_stateCaptureInvalidatable;
  self->_stateCaptureInvalidatable = v26;

  objc_destroyWeak(&v28);
  objc_destroyWeak(&location);
}

__CFString *__93__SBDeviceApplicationSceneHandle__commonInitWithApplication_sceneIdentifier_displayIdentity___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v3 = [WeakRetained descriptionWithMultilinePrefix:0];
  }
  else
  {
    uint64_t v3 = &stru_1F3084718;
  }

  return v3;
}

- (void)_didUpdateDisplayIdentity
{
  self->_keyboardLayerMaskStyle = 26;
  self->_statusBarParts = 0xFFFFLL;
  CGSize v3 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
  self->_statusBarAvoidanceFrame.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
  self->_statusBarAvoidanceFrame.size = v3;
  uint64_t v4 = [[SBDeviceApplicationSceneStatusBarBreadcrumbProvider alloc] initWithSceneHandle:self];
  breadcrumbProvider = self->_breadcrumbProvider;
  self->_breadcrumbProvider = v4;

  id v6 = [(SBDeviceApplicationSceneHandle *)self _windowScene];
  char v7 = [v6 assistantController];
  [v7 addObserver:self];

  [(SBDeviceApplicationSceneHandle *)self _reevaluateOcclusionBySystemUI];
  if (self->_occludedBySystemUI) {
    [(SBDeviceApplicationSceneHandle *)self _updateSystemOcclusionRects];
  }
  self->_applicationOcclusionRectsDirtCGFloat y = self->_occludedByApplication;
}

- (void)dealloc
{
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    CGSize v3 = [(SBDeviceApplicationSceneHandle *)self _windowScene];
    uint64_t v4 = [v3 assistantController];
    [v4 removeObserver:self];
  }
  id v5 = [(NSHashTable *)self->_activityModeAssertions allObjects];
  objc_msgSend(v5, "bs_each:", &__block_literal_global_191);

  id v6 = [(NSHashTable *)self->_jetsamModeAssertions allObjects];
  objc_msgSend(v6, "bs_each:", &__block_literal_global_12_0);

  char v7 = [(NSHashTable *)self->_taskSuspensionForegroundPreferenceAssertions allObjects];
  objc_msgSend(v7, "bs_each:", &__block_literal_global_15);

  [(BSInvalidatable *)self->_stateCaptureInvalidatable invalidate];
  [(SBDeviceApplicationSceneStatusBarStateProvider *)self->_statusBarStateProvider invalidate];
  [(UIApplicationSceneClientSettingsDiffInspector *)self->_clientSettingsInspector removeAllObservers];
  clientSettingsInspector = self->_clientSettingsInspector;
  self->_clientSettingsInspector = 0;

  id v9 = self->_preventKeyboardFocusDueToAppProtectionAssertion;
  preventKeyboardFocusDueToAppProtectionAssertion = self->_preventKeyboardFocusDueToAppProtectionAssertion;
  self->_preventKeyboardFocusDueToAppProtectionAssertion = 0;

  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  objc_super v20 = __41__SBDeviceApplicationSceneHandle_dealloc__block_invoke_4;
  double v21 = &unk_1E6AF4AC0;
  id v11 = v9;
  uint64_t v22 = v11;
  BSDispatchMain();
  if (self->_modalAlertPresenter && ([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    uint64_t v12 = self->_modalAlertPresenter;
    modalAlertPresenter = self->_modalAlertPresenter;
    self->_modalAlertPresenter = 0;

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __41__SBDeviceApplicationSceneHandle_dealloc__block_invoke_5;
    block[3] = &unk_1E6AF4AC0;
    id v17 = v12;
    int v14 = v12;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  [(APSubjectMonitorSubscription *)self->_appProtectionSubscription invalidate];

  v15.receiver = self;
  v15.super_class = (Class)SBDeviceApplicationSceneHandle;
  [(SBApplicationSceneHandle *)&v15 dealloc];
}

uint64_t __41__SBDeviceApplicationSceneHandle_dealloc__block_invoke(uint64_t a1, void *a2)
{
  return [a2 invalidate];
}

uint64_t __41__SBDeviceApplicationSceneHandle_dealloc__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 invalidate];
}

uint64_t __41__SBDeviceApplicationSceneHandle_dealloc__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 invalidate];
}

uint64_t __41__SBDeviceApplicationSceneHandle_dealloc__block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

uint64_t __41__SBDeviceApplicationSceneHandle_dealloc__block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

- (void)saveSuspendSnapshot:(id)a3
{
  id v9 = a3;
  uint64_t v4 = [(SBDeviceApplicationSceneHandle *)self sceneIfExists];
  id v5 = [v4 layerManager];
  id v6 = [v5 layers];
  uint64_t v7 = [v6 count];

  if (v9 && v7)
  {
    id v8 = [(SBApplicationSceneHandle *)self application];
    [v8 saveSuspendSnapshot:v9 forSceneHandle:self];
  }
}

- (id)mostRecentSceneSnapshotsForScale:(double)a3 launchingOrientation:(int64_t)a4
{
  uint64_t v7 = [(SBApplicationSceneHandle *)self application];
  id v8 = [v7 mostRecentSceneSnapshotsForSceneHandle:self scale:a4 launchingOrientation:a3];

  return v8;
}

- (BOOL)isReachabilitySupported
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  CGSize v3 = +[SBSceneManagerCoordinator mainDisplaySceneManager];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v4 = [v3 externalForegroundApplicationSceneHandles];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    BOOL v16 = v3;
    uint64_t v7 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [*(id *)(*((void *)&v17 + 1) + 8 * i) application];
        id v10 = [(SBApplicationSceneHandle *)self application];
        if ([v9 isSameExecutableAsApplication:v10])
        {
          id v11 = [(SBDeviceApplicationSceneHandle *)self sceneIfExists];
          uint64_t v12 = [v11 uiClientSettings];
          int v13 = [v12 isReachabilitySupported];

          if (!v13)
          {
            BOOL v14 = 0;
            goto LABEL_13;
          }
        }
        else
        {
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v6);
    BOOL v14 = 1;
LABEL_13:
    CGSize v3 = v16;
  }
  else
  {
    BOOL v14 = 1;
  }

  return v14;
}

- (BOOL)isShowingModalAlert
{
  return [(SBModalAlertPresenter *)self->_modalAlertPresenter isShowingModalAlert];
}

- (BOOL)shouldSuppressAlertForSuppressionContexts:(id)a3 sectionIdentifier:(id)a4
{
  alertSuppressionContextsBySectionIdentifier = self->_alertSuppressionContextsBySectionIdentifier;
  id v6 = a3;
  uint64_t v7 = [(NSDictionary *)alertSuppressionContextsBySectionIdentifier objectForKey:a4];
  LOBYTE(alertSuppressionContextsBySectionIdentifier) = [v6 intersectsSet:v7];

  return (char)alertSuppressionContextsBySectionIdentifier;
}

+ (double)_homeAffordanceInsetTopForWindowScene:(id)a3
{
  CGSize v3 = [a3 statusBarManager];
  uint64_t v4 = [v3 statusBar];
  [v4 defaultHeight];
  double v6 = v5;

  return v6;
}

+ (double)_homeAffordanceInsetBottom
{
  return 20.0;
}

- (_UIStatusBarData)overlayStatusBarData
{
  v2 = [(SBDeviceApplicationSceneStatusBarBreadcrumbProvider *)self->_breadcrumbProvider breadcrumbTitle];
  if (v2)
  {
    if (SBStatusBarIsSpeakeasy())
    {
      id v3 = [MEMORY[0x1E4FA94C0] entryWithStringValue:v2];
      id v4 = objc_alloc(MEMORY[0x1E4FA9440]);
      id v5 = (id)[v4 initWithEntry:v3 forKey:*MEMORY[0x1E4FA9720]];
    }
    else
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F43318]);
      id v3 = objc_alloc_init(MEMORY[0x1E4F43320]);
      [v3 setStringValue:v2];
      [v5 setBackNavigationEntry:v3];
    }
  }
  else
  {
    id v5 = 0;
  }

  return (_UIStatusBarData *)v5;
}

- (id)effectiveBackgroundActivities
{
  [MEMORY[0x1E4F42E40] getStyleOverrides];
  id v3 = STUIBackgroundActivityIdentifiersForStyleOverrides();
  id v4 = (void *)[v3 mutableCopy];

  id v5 = [(SBApplicationSceneHandle *)self application];
  double v6 = [v5 bundleIdentifier];
  if ([v6 isEqual:@"com.apple.Maps"]) {
    [v4 removeObject:*MEMORY[0x1E4FA9640]];
  }
  if ([v5 isNowRecordingApplication]) {
    [v4 removeObject:*MEMORY[0x1E4FA9668]];
  }
  [v4 minusSet:self->_backgroundActivitiesToSuppress];
  uint64_t v7 = [v5 info];
  id v8 = [v7 ignoredBackgroundActivityIdentifiers];
  [v4 minusSet:v8];

  return v4;
}

- (BOOL)isStatusBarForceHidden
{
  return [(NSMutableSet *)self->_statusBarForcedHiddenReasons count] != 0;
}

- (void)setStatusBarForceHidden:(BOOL)a3 forReason:(id)a4 animationSettings:(id)a5
{
  BOOL v6 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v9)
  {
    long long v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"SBDeviceApplicationSceneHandle.m", 421, @"Invalid parameter not satisfying: %@", @"reason" object file lineNumber description];
  }
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __86__SBDeviceApplicationSceneHandle_setStatusBarForceHidden_forReason_animationSettings___block_invoke;
  v18[3] = &unk_1E6AF4A98;
  v18[4] = self;
  id v11 = v10;
  id v19 = v11;
  uint64_t v12 = (void (**)(void, void))MEMORY[0x1D948C7A0](v18);
  statusBarForcedHiddenReasons = self->_statusBarForcedHiddenReasons;
  if (v6)
  {
    if (!statusBarForcedHiddenReasons)
    {
      BOOL v14 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
      objc_super v15 = self->_statusBarForcedHiddenReasons;
      self->_statusBarForcedHiddenReasons = v14;

      v12[2](v12, 1);
      statusBarForcedHiddenReasons = self->_statusBarForcedHiddenReasons;
    }
    [(NSMutableSet *)statusBarForcedHiddenReasons addObject:v9];
  }
  else
  {
    [(NSMutableSet *)statusBarForcedHiddenReasons removeObject:v9];
    if (![(NSMutableSet *)self->_statusBarForcedHiddenReasons count])
    {
      BOOL v16 = self->_statusBarForcedHiddenReasons;
      self->_statusBarForcedHiddenReasons = 0;

      v12[2](v12, 0);
    }
  }
}

void __86__SBDeviceApplicationSceneHandle_setStatusBarForceHidden_forReason_animationSettings___block_invoke(uint64_t a1, int a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = [*(id *)(a1 + 32) sceneIfExists];
  if (v4)
  {
    id v5 = SBLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      uint64_t v7 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 67109634;
      int v15 = a2;
      __int16 v16 = 2112;
      uint64_t v17 = v6;
      __int16 v18 = 2114;
      uint64_t v19 = v7;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_INFO, "Force hiding the status bar: %d for %@ with animationSettings=%{public}@", buf, 0x1Cu);
    }

    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __86__SBDeviceApplicationSceneHandle_setStatusBarForceHidden_forReason_animationSettings___block_invoke_42;
    v10[3] = &unk_1E6B03BD0;
    char v13 = a2;
    id v8 = *(id *)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 32);
    id v11 = v8;
    uint64_t v12 = v9;
    [v4 updateSettingsWithTransitionBlock:v10];
  }
}

id __86__SBDeviceApplicationSceneHandle_setStatusBarForceHidden_forReason_animationSettings___block_invoke_42(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setForcedStatusBarForegroundTransparent:*(unsigned __int8 *)(a1 + 48)];
  if (*(void *)(a1 + 32))
  {
    [MEMORY[0x1E4F42D58] _synchronizeDrawing];
    id v4 = [*(id *)(a1 + 40) _definition];
    id v5 = [v4 specification];
    id v6 = objc_alloc_init((Class)[v5 transitionContextClass]);

    if (!v6) {
      id v6 = objc_alloc_init(MEMORY[0x1E4F42790]);
    }
    [v6 setAnimationSettings:*(void *)(a1 + 32)];
    uint64_t v7 = [MEMORY[0x1E4F42D58] _synchronizedDrawingFence];
    [v6 setAnimationFence:v7];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (BOOL)isCurrentStatusBarHiddenForOrientation:(int64_t)a3
{
  return [(SBDeviceApplicationSceneHandle *)self isStatusBarHiddenForActivation:0 forOrientation:a3];
}

- (double)statusBarHeightForOrientation:(int64_t)a3
{
  if (-[SBDeviceApplicationSceneHandle isCurrentStatusBarHiddenForOrientation:](self, "isCurrentStatusBarHiddenForOrientation:"))
  {
    return 0.0;
  }
  [(SBDeviceApplicationSceneHandle *)self defaultStatusBarHeightForOrientation:a3];
  return result;
}

- (double)defaultStatusBarHeightForOrientation:(int64_t)a3
{
  id v5 = [(SBDeviceApplicationSceneHandle *)self sceneIfExists];
  id v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 uiSettings];
    [v7 defaultStatusBarHeightForOrientation:a3];
    double v9 = v8;
  }
  else
  {
    uint64_t v7 = [(SBDeviceApplicationSceneHandle *)self _defaultStatusBarHeights];
    id v10 = [NSNumber numberWithInteger:a3];
    id v11 = [v7 objectForKey:v10];
    [v11 doubleValue];
    double v9 = v12;
  }
  return v9;
}

void __52__SBDeviceApplicationSceneHandle_setStatusBarParts___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 sceneHandle:*(void *)(a1 + 32) didChangeStatusBarParts:*(void *)(a1 + 40)];
  }
}

void __61__SBDeviceApplicationSceneHandle_setStatusBarAvoidanceFrame___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v3, "sceneHandle:didChangeStatusBarAvoidanceFrame:", *(void *)(a1 + 32), *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  }
}

- (BOOL)wantsDeviceOrientationEventsEnabled
{
  id v3 = [(SBDeviceApplicationSceneHandle *)self sceneIfExists];
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 uiSettings];
    char IsClassic = [v5 deviceOrientationEventsEnabled];
  }
  else
  {
    id v5 = [(SBApplicationSceneHandle *)self application];
    char IsClassic = _SBApplicationClassicModeIsClassic([v5 _defaultClassicMode]);
  }
  BOOL v7 = IsClassic;

  return v7;
}

- (NSData)activationConditionsData
{
  id v3 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    id v5 = [(SBDeviceApplicationSceneHandle *)self sceneIfExists];
    id v6 = v5;
    if (v5)
    {
      BOOL v7 = [v5 uiClientSettings];
      [v7 activationConditionsData];
    }
    else
    {
      BOOL v7 = [(SBDeviceApplicationSceneHandle *)self _sceneDataStoreCreatingIfNecessary:0];
      [v7 objectForKey:@"activationConditions"];
    double v8 = };
  }
  else
  {
    double v8 = 0;
  }
  return (NSData *)v8;
}

- (void)setKeyboardContextMaskStyle:(unint64_t)a3
{
  id v5 = [(SBApplicationSceneHandle *)self application];
  int v6 = [v5 supportsChamoisSceneResizing];

  if (a3 != 2 || v6)
  {
    self->_keyboardLayerMaskStyle = a3;
    BOOL v7 = [(SBDeviceApplicationSceneHandle *)self sceneIfExists];
    double v8 = [v7 uiPresentationManager];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __62__SBDeviceApplicationSceneHandle_setKeyboardContextMaskStyle___block_invoke;
    v9[3] = &__block_descriptor_40_e43_v16__0__UIMutableScenePresentationContext_8l;
    v9[4] = a3;
    [v8 modifyDefaultPresentationContext:v9];
  }
}

uint64_t __62__SBDeviceApplicationSceneHandle_setKeyboardContextMaskStyle___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setPresentedLayerTypes:*(void *)(a1 + 32)];
}

- (BOOL)supportsCenterWindow
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = [(SBDeviceApplicationSceneHandle *)self _sceneDataStoreCreatingIfNecessary:0];
  uint64_t v4 = [v3 safeObjectForKey:@"originatedInCenterWindow" ofType:objc_opt_class()];
  id v5 = v4;
  if (v4)
  {
    char v6 = [v4 BOOLValue];
  }
  else
  {
    BOOL v7 = [v3 objectForKey:@"activationConditions"];
    double v8 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v7 error:0];
    double v9 = v8;
    if (v8)
    {
      id v16 = 0;
      uint64_t v10 = [v8 _suitabilityForTargetContentIdentifier:&stru_1F3084718 errorString:&v16];
      id v11 = v16;
      char v6 = v10 == 0;
      if (v10)
      {
        double v12 = SBLogCommon();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          char v13 = [(SBApplicationSceneHandle *)self application];
          BOOL v14 = [v13 bundleIdentifier];
          *(_DWORD *)buf = 138543618;
          __int16 v18 = v14;
          __int16 v19 = 2114;
          id v20 = v11;
          _os_log_impl(&dword_1D85BA000, v12, OS_LOG_TYPE_INFO, "Error decoding activation conditions for %{public}@:%{public}@", buf, 0x16u);
        }
      }
    }
    else
    {
      char v6 = 0;
    }
  }
  return v6;
}

- (BOOL)requestedFullScreenCenterWindow
{
  v2 = [(SBDeviceApplicationSceneHandle *)self _sceneDataStoreCreatingIfNecessary:0];
  id v3 = [v2 safeObjectForKey:@"requestedFullScreenCenterWindow" ofType:objc_opt_class()];
  uint64_t v4 = v3;
  if (v3) {
    char v5 = [v3 BOOLValue];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (void)setContentPrefersToDisableClipping:(BOOL)a3
{
  if (self->_contentPrefersToDisableClipping != a3)
  {
    self->_contentPrefersToDisableClipping = a3;
    [(SBDeviceApplicationSceneHandle *)self _noteContentPrefersToDisableClippingChanged];
  }
}

- (BOOL)handleHardwareButtonEventType:(int64_t)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if ((SBSUIHardwareButtonEventTypeIsValid() & 1) == 0)
  {
    uint64_t v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"SBDeviceApplicationSceneHandle.m", 834, @"Invalid parameter not satisfying: %@", @"SBSUIHardwareButtonEventTypeIsValid(eventType)" object file lineNumber description];
  }
  char v6 = [(SBDeviceApplicationSceneHandle *)self sceneIfExists];
  if (!v6)
  {
    double v9 = SBLogInCallPresentation();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v18 = SBSUIHardwareButtonEventTypeDescription();
      *(_DWORD *)buf = 138543618;
      double v26 = self;
      __int16 v27 = 2114;
      id v28 = v18;
      _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: Unable to handle %{public}@ event because the scene doesn't exist", buf, 0x16u);
    }
    goto LABEL_17;
  }
  uint64_t v7 = objc_opt_class();
  double v8 = [v6 uiClientSettings];
  double v9 = SBSafeCast(v7, v8);

  if (!v9)
  {
    id v11 = SBLogInCallPresentation();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v19 = SBSUIHardwareButtonEventTypeDescription();
      *(_DWORD *)buf = 138543618;
      double v26 = self;
      __int16 v27 = 2114;
      id v28 = v19;
      _os_log_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: Unable to handle %{public}@ event because scene client settings are not of the appropriate class", buf, 0x16u);
    }
    goto LABEL_16;
  }
  BOOL v10 = ([v9 preferredHardwareButtonEventTypes] & (1 << a3)) == 0;
  id v11 = SBLogInCallPresentation();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (v12)
    {
      id v20 = SBSUIHardwareButtonEventTypeDescription();
      *(_DWORD *)buf = 138543618;
      double v26 = self;
      __int16 v27 = 2114;
      id v28 = v20;
      _os_log_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: Unable to handle %{public}@ event because it's not in the preferred types mask", buf, 0x16u);
    }
LABEL_16:

LABEL_17:
    BOOL v17 = 0;
    goto LABEL_18;
  }
  if (v12)
  {
    char v13 = SBSUIHardwareButtonEventTypeDescription();
    *(_DWORD *)buf = 138543618;
    double v26 = self;
    __int16 v27 = 2114;
    id v28 = v13;
    _os_log_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: Sending hardware event action: %{public}@", buf, 0x16u);
  }
  objc_initWeak((id *)buf, self);
  id v14 = objc_alloc(MEMORY[0x1E4FA7B50]);
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __64__SBDeviceApplicationSceneHandle_handleHardwareButtonEventType___block_invoke;
  v23[3] = &unk_1E6B03C68;
  objc_copyWeak(v24, (id *)buf);
  v24[1] = (id)a3;
  int v15 = (void *)[v14 initWithButtonEventType:a3 timeout:v23 withResponseHandler:5.0];
  id v16 = [MEMORY[0x1E4F1CAD0] setWithObject:v15];
  [v6 sendActions:v16];

  objc_destroyWeak(v24);
  objc_destroyWeak((id *)buf);
  BOOL v17 = 1;
LABEL_18:

  return v17;
}

void __64__SBDeviceApplicationSceneHandle_handleHardwareButtonEventType___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  char v5 = SBLogInCallPresentation();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    char v6 = SBSUIHardwareButtonEventTypeDescription();
    int v7 = 138543874;
    id v8 = WeakRetained;
    __int16 v9 = 2114;
    BOOL v10 = v6;
    __int16 v11 = 2114;
    id v12 = v3;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Received response for hardware event %{public}@: %{public}@", (uint8_t *)&v7, 0x20u);
  }
}

- (unint64_t)preferredHardwareButtonEventTypes
{
  v2 = [(SBDeviceApplicationSceneHandle *)self sceneIfExists];
  if (v2
    && (uint64_t v3 = objc_opt_class(),
        [v2 uiClientSettings],
        uint64_t v4 = objc_claimAutoreleasedReturnValue(),
        SBSafeCast(v3, v4),
        char v5 = objc_claimAutoreleasedReturnValue(),
        v4,
        v5))
  {
    unint64_t v6 = [v5 preferredHardwareButtonEventTypes];
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

- (id)acquireAssertionsForRelevancyResult:(id)a3 reason:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:3];
  if ([v6 activityMode])
  {
    __int16 v9 = -[SBDeviceApplicationSceneHandle acquireSceneActivityModeAssertionWithReason:activityMode:](self, "acquireSceneActivityModeAssertionWithReason:activityMode:", v7, [v6 activityMode]);
    [v8 setObject:v9 forKey:&unk_1F334A448];
  }
  if ([v6 jetsamMode])
  {
    BOOL v10 = -[SBDeviceApplicationSceneHandle acquireSceneJetsamModeAssertionWithReason:jetsamMode:](self, "acquireSceneJetsamModeAssertionWithReason:jetsamMode:", v7, [v6 jetsamMode]);
    [v8 setObject:v10 forKey:&unk_1F334A460];
  }
  if ([v6 prefersProcessTaskSuspensionWhileSceneForeground])
  {
    __int16 v11 = -[SBDeviceApplicationSceneHandle acquireSceneTaskSuspensionForegroundPreferenceAssertionWithReason:prefersProcessTaskSuspensionWhileSceneForeground:](self, "acquireSceneTaskSuspensionForegroundPreferenceAssertionWithReason:prefersProcessTaskSuspensionWhileSceneForeground:", v7, [v6 prefersProcessTaskSuspensionWhileSceneForeground]);
    [v8 setObject:v11 forKey:&unk_1F334A478];
  }
  return v8;
}

- (char)activityMode
{
  uint64_t v3 = [(SBDeviceApplicationSceneHandle *)self sceneIfExists];
  uint64_t v4 = v3;
  if (v3)
  {
    char v5 = [v3 settings];
    char computedActivityMode = [v5 activityMode];
  }
  else
  {
    char computedActivityMode = self->_computedActivityMode;
  }

  return computedActivityMode;
}

- (id)acquireSceneActivityModeAssertionWithReason:(id)a3 activityMode:(char)a4
{
  uint64_t v4 = a4;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  objc_initWeak(&location, self);
  id v7 = [SBSceneHandleActivityModeAssertion alloc];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  uint64_t v13 = __91__SBDeviceApplicationSceneHandle_acquireSceneActivityModeAssertionWithReason_activityMode___block_invoke;
  id v14 = &unk_1E6B03C90;
  objc_copyWeak(&v15, &location);
  id v8 = [(SBSceneHandleActivityModeAssertion *)v7 initWithReason:v6 activityMode:v4 invalidationBlock:&v11];
  -[NSHashTable addObject:](self->_activityModeAssertions, "addObject:", v8, v11, v12, v13, v14);
  __int16 v9 = SBLogSceneRelevancy();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    __int16 v18 = v8;
    _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "Scene handle assertion was acquired: %{public}@", buf, 0xCu);
  }

  [(SBDeviceApplicationSceneHandle *)self _reevaluateActivityModeFromAssertions];
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  return v8;
}

void __91__SBDeviceApplicationSceneHandle_acquireSceneActivityModeAssertionWithReason_activityMode___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained[40] removeObject:v5];
    [v4 _reevaluateActivityModeFromAssertions];
  }
}

- (char)jetsamMode
{
  uint64_t v3 = [(SBDeviceApplicationSceneHandle *)self sceneIfExists];
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = [v3 settings];
    char computedJetsamMode = [v5 jetsamMode];
  }
  else
  {
    char computedJetsamMode = self->_computedJetsamMode;
  }

  return computedJetsamMode;
}

- (id)acquireSceneJetsamModeAssertionWithReason:(id)a3 jetsamMode:(char)a4
{
  uint64_t v4 = a4;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  objc_initWeak(&location, self);
  id v7 = [SBSceneHandleJetsamModeAssertion alloc];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  uint64_t v13 = __87__SBDeviceApplicationSceneHandle_acquireSceneJetsamModeAssertionWithReason_jetsamMode___block_invoke;
  id v14 = &unk_1E6B03CB8;
  objc_copyWeak(&v15, &location);
  id v8 = [(SBSceneHandleJetsamModeAssertion *)v7 initWithReason:v6 jetsamMode:v4 invalidationBlock:&v11];
  -[NSHashTable addObject:](self->_jetsamModeAssertions, "addObject:", v8, v11, v12, v13, v14);
  __int16 v9 = SBLogSceneRelevancy();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    __int16 v18 = v8;
    _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "Scene handle assertion was acquired: %{public}@", buf, 0xCu);
  }

  [(SBDeviceApplicationSceneHandle *)self _reevaluateJetsamModeFromAssertions];
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  return v8;
}

void __87__SBDeviceApplicationSceneHandle_acquireSceneJetsamModeAssertionWithReason_jetsamMode___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained[41] removeObject:v5];
    [v4 _reevaluateJetsamModeFromAssertions];
  }
}

- (BOOL)prefersProcessTaskSuspensionWhileSceneForeground
{
  uint64_t v3 = [(SBDeviceApplicationSceneHandle *)self sceneIfExists];
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = [v3 settings];
    char computedTaskSuspensionForegroundPreference = [v5 prefersProcessTaskSuspensionWhileSceneForeground];
  }
  else
  {
    char computedTaskSuspensionForegroundPreference = self->_computedTaskSuspensionForegroundPreference;
  }

  return computedTaskSuspensionForegroundPreference;
}

- (id)acquireSceneTaskSuspensionForegroundPreferenceAssertionWithReason:(id)a3 prefersProcessTaskSuspensionWhileSceneForeground:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  objc_initWeak(&location, self);
  id v7 = [SBSceneHandleTaskSuspensionForegroundPreferenceAssertion alloc];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  uint64_t v13 = __149__SBDeviceApplicationSceneHandle_acquireSceneTaskSuspensionForegroundPreferenceAssertionWithReason_prefersProcessTaskSuspensionWhileSceneForeground___block_invoke;
  id v14 = &unk_1E6B03CE0;
  objc_copyWeak(&v15, &location);
  id v8 = [(SBSceneHandleTaskSuspensionForegroundPreferenceAssertion *)v7 initWithReason:v6 taskSuspensionForegroundPreference:v4 invalidationBlock:&v11];
  -[NSHashTable addObject:](self->_taskSuspensionForegroundPreferenceAssertions, "addObject:", v8, v11, v12, v13, v14);
  __int16 v9 = SBLogSceneRelevancy();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    __int16 v18 = v8;
    _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "Scene handle assertion was acquired: %{public}@", buf, 0xCu);
  }

  [(SBDeviceApplicationSceneHandle *)self _reevaluateTaskSuspensionForegroundPreferenceFromAssertions];
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  return v8;
}

void __149__SBDeviceApplicationSceneHandle_acquireSceneTaskSuspensionForegroundPreferenceAssertionWithReason_prefersProcessTaskSuspensionWhileSceneForeground___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  BOOL v4 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained[42] removeObject:v5];
    [v4 _reevaluateTaskSuspensionForegroundPreferenceFromAssertions];
  }
}

- (int64_t)_bestSupportedInterfaceOrientationForOrientation:(int64_t)a3
{
  int64_t v5 = [(SBDeviceApplicationSceneHandle *)self currentInterfaceOrientation];
  unint64_t v6 = [(SBDeviceApplicationSceneHandle *)self _mainSceneSupportedInterfaceOrientations];
  uint64_t v7 = 1;
  uint64_t v8 = 4;
  uint64_t v9 = 3;
  if ((v6 & 8) == 0) {
    uint64_t v9 = (v6 >> 1) & 2;
  }
  if ((v6 & 0x10) == 0) {
    uint64_t v8 = v9;
  }
  if ((v6 & 2) == 0) {
    uint64_t v7 = v8;
  }
  if ((v6 & (1 << v5)) != 0) {
    int64_t v10 = v5;
  }
  else {
    int64_t v10 = v7;
  }
  if ((v6 & (1 << a3)) != 0) {
    return a3;
  }
  else {
    return v10;
  }
}

- (int64_t)_resumingInterfaceOrientationForOrientation:(int64_t)a3
{
  unint64_t v6 = [(SBDeviceApplicationSceneHandle *)self sceneIfExists];

  if (v6)
  {
    if (!a3) {
      goto LABEL_25;
    }
  }
  else
  {
    int v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2 object:self file:@"SBDeviceApplicationSceneHandle.m" lineNumber:1076 description:@"Don't calculate a resuming orientation for a non-running app. Really."];

    if (!a3) {
      goto LABEL_25;
    }
  }
  uint64_t v7 = [(SBApplicationSceneHandle *)self application];
  uint64_t v8 = [v7 info];
  char v9 = [v8 builtOnOrAfterSDKVersion:@"8.0"];

  BOOL v10 = [(SBDeviceApplicationSceneHandle *)self _mainSceneSupportsInterfaceOrientation:a3];
  uint64_t v11 = [(SBDeviceApplicationSceneHandle *)self _interfaceOrientationFromUserResizing];
  if (v11)
  {
LABEL_4:

    return v11;
  }
  if ([v7 classicAppPhoneAppRunningOnPad])
  {
    uint64_t v11 = [(SBDeviceApplicationSceneHandle *)self _classicPhoneOnPadActivationOrientationForOrientation:a3];
    goto LABEL_20;
  }
  if (!__sb__runningInSpringBoard())
  {
    uint64_t v13 = [MEMORY[0x1E4F42948] currentDevice];
    uint64_t v14 = [v13 userInterfaceIdiom];

    BOOL v12 = v14 == 0;
LABEL_11:
    if (v12) {
      char v15 = v9;
    }
    else {
      char v15 = 1;
    }
    if (v15) {
      goto LABEL_15;
    }
LABEL_19:
    __int16 v18 = [(SBDeviceApplicationSceneHandle *)self sceneIfExists];
    uint64_t v19 = [v18 uiClientSettings];
    uint64_t v11 = objc_msgSend(v19, "sb_effectiveInterfaceOrientation");

LABEL_20:
    if (v11) {
      return v11;
    }
    goto LABEL_25;
  }
  if (SBFEffectiveDeviceClass())
  {
    BOOL v12 = SBFEffectiveDeviceClass() == 1;
    goto LABEL_11;
  }
  if ((v9 & 1) == 0) {
    goto LABEL_19;
  }
LABEL_15:
  if (v10)
  {
    id v16 = [(SBApplicationSceneHandle *)self application];
    char v17 = [v16 isMedusaCapable];

    if (v17)
    {
      uint64_t v11 = a3;
      goto LABEL_4;
    }
    uint64_t v21 = [(SBDeviceApplicationSceneHandle *)self sceneIfExists];
    uint64_t v22 = [v21 uiClientSettings];
    uint64_t v23 = [v22 supportedInterfaceOrientations];

    if (v23)
    {
      uint64_t v11 = a3;
      if ((XBInterfaceOrientationMaskForInterfaceOrientation() & v23) != 0) {
        goto LABEL_4;
      }
    }
  }

LABEL_25:
  return [(SBDeviceApplicationSceneHandle *)self currentInterfaceOrientation];
}

- (int64_t)_classicPhoneOnPadActivationOrientationForOrientation:(int64_t)a3
{
  BOOL v5 = [(SBDeviceApplicationSceneHandle *)self _classicAppPhoneOnPadPrefersLandscape];
  unint64_t v6 = [(SBDeviceApplicationSceneHandle *)self sceneIfExists];
  uint64_t v7 = [v6 uiClientSettings];
  uint64_t v8 = [v7 supportedInterfaceOrientations];

  if (v8 && v5)
  {
    int64_t v9 = [(SBDeviceApplicationSceneHandle *)self currentInterfaceOrientation];
    if ((unint64_t)(v9 - 3) <= 1)
    {
      int64_t v10 = v9;
      if ((v8 & (1 << v9)) != 0) {
        return v10;
      }
    }
    if ((unint64_t)(a3 - 3) > 1)
    {
      if ((v8 & 0x10) != 0) {
        return 4;
      }
      if ((v8 & 8) != 0) {
        return 3;
      }
    }
    else
    {
      if ((v8 & (1 << a3)) != 0) {
        return a3;
      }
      if (a3 == 4) {
        int64_t v10 = 3;
      }
      else {
        int64_t v10 = 4;
      }
      if ((v8 & (1 << v10)) != 0) {
        return v10;
      }
    }
  }
  int64_t v10 = 1;
  if ([(SBDeviceApplicationSceneHandle *)self _mainSceneSupportsInterfaceOrientation:1])
  {
    return v10;
  }
  return [(SBDeviceApplicationSceneHandle *)self _bestSupportedInterfaceOrientationForOrientation:0];
}

- (void)_noteActivationConditionsChanged
{
  uint64_t v3 = [(SBDeviceApplicationSceneHandle *)self activationConditionsData];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __66__SBDeviceApplicationSceneHandle__noteActivationConditionsChanged__block_invoke;
  v5[3] = &unk_1E6B03D08;
  v5[4] = self;
  id v6 = v3;
  id v4 = v3;
  [(SBDeviceApplicationSceneHandle *)self _enumerateObserversWithBlock:v5];
}

void __66__SBDeviceApplicationSceneHandle__noteActivationConditionsChanged__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 sceneHandle:*(void *)(a1 + 32) didChangeActivationConditionsData:*(void *)(a1 + 40)];
  }
}

- (void)_noteBackgroundActivitiesToSuppressChanged
{
  id v3 = [(SBDeviceApplicationSceneHandle *)self backgroundActivitiesToSuppress];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __76__SBDeviceApplicationSceneHandle__noteBackgroundActivitiesToSuppressChanged__block_invoke;
  v5[3] = &unk_1E6B03D08;
  v5[4] = self;
  id v6 = v3;
  id v4 = v3;
  [(SBDeviceApplicationSceneHandle *)self _enumerateObserversWithBlock:v5];
}

void __76__SBDeviceApplicationSceneHandle__noteBackgroundActivitiesToSuppressChanged__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 sceneHandle:*(void *)(a1 + 32) didChangeBackgroundActivitiesToSuppress:*(void *)(a1 + 40)];
  }
}

- (void)_noteContentPrefersToDisableClippingChanged
{
  BOOL v3 = [(SBDeviceApplicationSceneHandle *)self contentPrefersToDisableClipping];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __77__SBDeviceApplicationSceneHandle__noteContentPrefersToDisableClippingChanged__block_invoke;
  v4[3] = &unk_1E6B03D30;
  v4[4] = self;
  BOOL v5 = v3;
  [(SBDeviceApplicationSceneHandle *)self _enumerateObserversWithBlock:v4];
}

void __77__SBDeviceApplicationSceneHandle__noteContentPrefersToDisableClippingChanged__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 sceneHandle:*(void *)(a1 + 32) didChangeContentPrefersToDisableClipping:*(unsigned __int8 *)(a1 + 40)];
  }
}

- (void)appProtectionSubjectsChanged:(id)a3 forSubscription:(id)a4
{
  id v5 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __79__SBDeviceApplicationSceneHandle_appProtectionSubjectsChanged_forSubscription___block_invoke;
  v7[3] = &unk_1E6AF5290;
  void v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

void __79__SBDeviceApplicationSceneHandle_appProtectionSubjectsChanged_forSubscription___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F4B7E0];
  id v3 = [*(id *)(a1 + 32) application];
  id v4 = [v3 bundleIdentifier];
  int64_t v10 = [v2 applicationWithBundleIdentifier:v4];

  int v5 = [*(id *)(a1 + 40) containsObject:v10];
  id v6 = v10;
  if (v5)
  {
    uint64_t v7 = [v10 isLocked];
    id v8 = [*(id *)(a1 + 32) sceneIfExists];
    if ([v8 isValid])
    {
      int64_t v9 = [v8 _interfaceProtectionHostComponent];
      [v9 setUnderAppProtection:v7];
    }
    id v6 = v10;
  }
}

- (void)appProtectionAssistantShouldShieldDidChange:(id)a3
{
  int v4 = [a3 shouldShield];
  preventKeyboardFocusDueToAppProtectionAssertion = self->_preventKeyboardFocusDueToAppProtectionAssertion;
  if (v4)
  {
    if (preventKeyboardFocusDueToAppProtectionAssertion) {
      return;
    }
    uint64_t v7 = [(SBDeviceApplicationSceneHandle *)self sceneIfExists];
    BOOL v12 = [v7 identityToken];

    id v6 = v12;
    if (v12)
    {
      id v8 = +[SBWorkspace mainWorkspace];
      int64_t v9 = [v8 keyboardFocusController];
      int64_t v10 = [v9 preventFocusForSceneWithIdentityToken:v12 reason:@"SBDeviceApplicationSceneHandle is preventing focus for shielded scene due to app protection"];
      uint64_t v11 = self->_preventKeyboardFocusDueToAppProtectionAssertion;
      self->_preventKeyboardFocusDueToAppProtectionAssertion = v10;

      id v6 = v12;
    }
  }
  else
  {
    [(BSInvalidatable *)preventKeyboardFocusDueToAppProtectionAssertion invalidate];
    id v6 = self->_preventKeyboardFocusDueToAppProtectionAssertion;
    self->_preventKeyboardFocusDueToAppProtectionAssertion = 0;
  }
}

- (void)_didDestroyScene:(id)a3
{
  appProtectionSubscription = self->_appProtectionSubscription;
  id v5 = a3;
  [(APSubjectMonitorSubscription *)appProtectionSubscription invalidate];
  id v6 = self->_appProtectionSubscription;
  self->_appProtectionSubscription = 0;

  uint64_t v7 = [v5 clientProcess];
  [v7 removeObserver:self];

  [(SBModalAlertPresenter *)self->_modalAlertPresenter invalidate];
  modalAlertPresenter = self->_modalAlertPresenter;
  self->_modalAlertPresenter = 0;

  statusBarForcedHiddenReasons = self->_statusBarForcedHiddenReasons;
  self->_statusBarForcedHiddenReasons = 0;

  self->_isEffectivelyForeground = 0;
  [(SBDeviceApplicationSceneHandle *)self setAlertSuppressionContextsBySectionIdentifier:0];
  int64_t v10 = [(SBApplicationSceneHandle *)self application];
  uint64_t v11 = [v10 info];
  -[SBDeviceApplicationSceneHandle setWhitePointAdaptivityStyle:](self, "setWhitePointAdaptivityStyle:", [v11 whitePointAdaptivityStyle]);

  v12.receiver = self;
  v12.super_class = (Class)SBDeviceApplicationSceneHandle;
  [(SBDeviceApplicationSceneHandle *)&v12 _didDestroyScene:v5];
}

void __85__SBDeviceApplicationSceneHandle__didUpdateClientSettingsWithDiff_transitionContext___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = (void *)WeakRetained[20];
  v2 = [WeakRetained scene];
  id v3 = [v2 uiClientSettings];
  objc_msgSend(v1, "setVisibleModalAlertCount:", objc_msgSend(v3, "visibleMiniAlertCount"));
}

void __78__SBDeviceApplicationSceneHandle__didUpdateSettingsWithDiff_previousSettings___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 sceneHandle:*(void *)(a1 + 32) didChangeEffectiveForegroundness:*(unsigned __int8 *)(a1 + 40)];
  }
}

- (BOOL)isOccluded
{
  return self->_occludedByApplication;
}

- (void)_updateApplicationOcclusionRects
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(SBDeviceApplicationSceneHandle *)self sceneIfExists];
  int v4 = v3;
  if (v3)
  {
    if (self->_occludedByApplication)
    {
      id v5 = (void *)MEMORY[0x1E4F29238];
      id v6 = [v3 settings];
      [v6 frame];
      uint64_t v7 = objc_msgSend(v5, "bs_valueWithCGRect:");
      v13[0] = v7;
      id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
    }
    else
    {
      id v8 = 0;
    }
    self->_applicationOcclusionRectsDirtCGFloat y = 0;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __66__SBDeviceApplicationSceneHandle__updateApplicationOcclusionRects__block_invoke;
    v10[3] = &unk_1E6AF5290;
    id v11 = v4;
    id v12 = v8;
    id v9 = v8;
    dispatch_async(MEMORY[0x1E4F14428], v10);
  }
}

void __66__SBDeviceApplicationSceneHandle__updateApplicationOcclusionRects__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _occlusionHostComponent];
  [v2 setApplicationOcclusionRects:*(void *)(a1 + 40)];
}

- (void)_reevaluateOcclusionBySystemUI
{
  id v3 = [(SBDeviceApplicationSceneHandle *)self _windowScene];
  int v4 = [v3 assistantController];
  id v7 = [v4 presentationContext];

  int occludedBySystemUI = self->_occludedBySystemUI;
  if ([v7 isAssistantPresented]) {
    int v6 = [v7 allowsHDRContentBelow] ^ 1;
  }
  else {
    int v6 = 0;
  }
  if (occludedBySystemUI != v6)
  {
    self->_int occludedBySystemUI = v6;
    [(SBDeviceApplicationSceneHandle *)self _updateSystemOcclusionRects];
  }
}

- (void)_updateSystemOcclusionRects
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(SBDeviceApplicationSceneHandle *)self sceneIfExists];
  int v4 = v3;
  if (v3)
  {
    if (self->_occludedBySystemUI)
    {
      id v5 = (void *)MEMORY[0x1E4F29238];
      int v6 = [v3 settings];
      [v6 frame];
      id v7 = objc_msgSend(v5, "bs_valueWithCGRect:");
      v13[0] = v7;
      id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
    }
    else
    {
      id v8 = 0;
    }
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __61__SBDeviceApplicationSceneHandle__updateSystemOcclusionRects__block_invoke;
    v10[3] = &unk_1E6AF5290;
    id v11 = v4;
    id v12 = v8;
    id v9 = v8;
    dispatch_async(MEMORY[0x1E4F14428], v10);
  }
}

void __61__SBDeviceApplicationSceneHandle__updateSystemOcclusionRects__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _occlusionHostComponent];
  [v2 setSystemOcclusionRects:*(void *)(a1 + 40)];
}

void __58__SBDeviceApplicationSceneHandle__defaultStatusBarHeights__block_invoke()
{
  v0 = (void *)_defaultStatusBarHeights_sEnumerator;
  _defaultStatusBarHeights_sEnumerator = (uint64_t)&unk_1F3348030;
}

- (void)_noteDidMoveFromSceneManager:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SBDeviceApplicationSceneHandle;
  [(SBApplicationSceneHandle *)&v6 _noteDidMoveFromSceneManager:a3];
  int v4 = [(SBDeviceApplicationSceneHandle *)self _windowScene];
  id v5 = [v4 assistantController];
  [v5 removeObserver:self];

  [(SBDeviceApplicationSceneHandle *)self _didUpdateDisplayIdentity];
  [(SBDeviceApplicationSceneHandle *)self _updateCapturingContentForAdditionalRenderingDestination];
}

- (void)_noteReplacedWithSceneHandle:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBDeviceApplicationSceneHandle;
  [(SBDeviceApplicationSceneHandle *)&v9 _noteReplacedWithSceneHandle:v4];
  uint64_t v5 = objc_opt_class();
  id v6 = v4;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }
  id v8 = v7;

  [v8 _updateCapturingContentForAdditionalRenderingDestination];
}

void __84__SBDeviceApplicationSceneHandle__sceneHostingInfoForSnapshottingAssertionWithView___block_invoke(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _removeSnapshottingInfoAssertion:v3];
}

- (void)_removeSnapshottingInfoAssertion:(id)a3
{
  snapshottingInfoAssertions = self->_snapshottingInfoAssertions;
  id v5 = a3;
  [(NSMutableArray *)snapshottingInfoAssertions removeObject:v5];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_currentSnapshottingInfoAssertion);

  if (WeakRetained == v5)
  {
    id v7 = [(NSMutableArray *)self->_snapshottingInfoAssertions lastObject];
    objc_storeWeak((id *)&self->_currentSnapshottingInfoAssertion, v7);
    [(SBDeviceApplicationSceneHandle *)self _updateSceneHostingInfoForSnapshottingWithAssertion:v7 forceUpdate:0];
  }
}

- (id)newSceneViewController
{
  id v3 = [SBDeviceApplicationSceneViewController alloc];
  return [(SBDeviceApplicationSceneViewController *)v3 initWithSceneHandle:self];
}

- (void)applicationProcessDidExit:(id)a3 withContext:(id)a4
{
  id v5 = a4;
  id v4 = v5;
  BSDispatchMain();
}

void __72__SBDeviceApplicationSceneHandle_applicationProcessDidExit_withContext___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) terminationReason];
  if (([*(id *)(a1 + 32) exitReason] & 1) == 0 && v2 != 1)
  {
    id v3 = [*(id *)(a1 + 40) _sceneDataStoreCreatingIfNecessary:0];
    [v3 removeObjectForKey:@"statusBarStyle"];
    [v3 removeObjectForKey:@"statusBarHidden"];
  }
}

void __72__SBDeviceApplicationSceneHandle_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 256) hasBreadcrumb]) {
    id v2 = (id)[*(id *)(a1 + 40) appendObject:*(void *)(*(void *)(a1 + 32) + 256) withName:@"breadcrumbProvider"];
  }
  id v3 = (id)[*(id *)(a1 + 40) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 32) + 224) withName:@"occludedByApplication" ifEqualTo:1];
  id v4 = (id)[*(id *)(a1 + 40) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 32) + 226) withName:@"occludedBySystem" ifEqualTo:1];
  id v5 = *(void **)(a1 + 40);
  [*(id *)(a1 + 32) activityMode];
  id v6 = NSStringFromFBSSceneActivityMode();
  [v5 appendString:v6 withName:@"activityMode"];

  id v7 = *(void **)(a1 + 40);
  [*(id *)(a1 + 32) jetsamMode];
  id v8 = NSStringFromFBSSceneJetsamMode();
  [v7 appendString:v8 withName:@"jetsamMode"];

  id v9 = (id)objc_msgSend(*(id *)(a1 + 40), "appendBool:withName:ifEqualTo:", objc_msgSend(*(id *)(a1 + 32), "prefersProcessTaskSuspensionWhileSceneForeground"), @"prefersProcessTaskSuspensionWhileSceneForeground", 1);
  int64_t v10 = *(void **)(a1 + 40);
  id v11 = [*(id *)(*(void *)(a1 + 32) + 320) allObjects];
  [v10 appendArraySection:v11 withName:@"activityModeAssertions" skipIfEmpty:1];

  id v12 = *(void **)(a1 + 40);
  uint64_t v13 = [*(id *)(*(void *)(a1 + 32) + 328) allObjects];
  [v12 appendArraySection:v13 withName:@"jetsamModeAssertions" skipIfEmpty:1];

  uint64_t v14 = *(void **)(a1 + 40);
  id v15 = [*(id *)(*(void *)(a1 + 32) + 336) allObjects];
  [v14 appendArraySection:v15 withName:@"taskSuspensionForegroundPreferenceAssertions" skipIfEmpty:1];
}

- (void)_updateIdleTimerForReason:(id)a3
{
  id v7 = a3;
  id v4 = [(SBDeviceApplicationSceneHandle *)self _generateIdleTimerBehavior];
  id v5 = [(SBDeviceApplicationSceneHandle *)self _idleTimerCoordinator];
  id v6 = (id)[v5 idleTimerProvider:self didProposeBehavior:v4 forReason:v7];
}

- (id)_generateIdleTimerBehavior
{
  return +[SBIdleTimerBehavior autoLockBehavior];
}

- (void)_updateCapturingContentForAdditionalRenderingDestination
{
  id v3 = [(SBDeviceApplicationSceneHandle *)self sceneManager];
  id v4 = [v3 displayIdentity];

  id v5 = [(SBDeviceApplicationSceneHandle *)self sceneIfExists];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __90__SBDeviceApplicationSceneHandle__updateCapturingContentForAdditionalRenderingDestination__block_invoke;
  v7[3] = &unk_1E6B03DC8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 updateSettings:v7];
}

void __90__SBDeviceApplicationSceneHandle__updateCapturingContentForAdditionalRenderingDestination__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = objc_opt_class();
  id v8 = v3;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      id v6 = v8;
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }
  id v7 = v6;

  [v4 _updateIsCapturingContentForAdditionalRenderingDestinationOfMutableSceneSettings:v7 withDisplayIdentity:*(void *)(a1 + 40)];
}

- (void)_reevaluateActivityModeFromAssertions
{
  char v3 = [(SBDeviceApplicationSceneHandle *)self _computeActivityMode];
  if (self->_computedActivityMode != v3)
  {
    self->_char computedActivityMode = v3;
    [(SBDeviceApplicationSceneHandle *)self _updateActivityMode];
  }
}

- (char)_computeActivityMode
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ([(NSHashTable *)self->_activityModeAssertions count])
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    char v3 = [(NSHashTable *)self->_activityModeAssertions allObjects];
    uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v12;
      int v7 = -3;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v12 != v6) {
            objc_enumerationMutation(v3);
          }
          int v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) activityMode];
          if (v7 <= v9) {
            int v7 = v9;
          }
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v5);
    }
    else
    {
      LOBYTE(v7) = -3;
    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }
  return v7;
}

- (void)_updateActivityMode
{
  char v3 = [(SBDeviceApplicationSceneHandle *)self sceneIfExists];
  uint64_t v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 settings];
    unsigned __int8 v6 = [v5 activityMode];
    int computedActivityMode = self->_computedActivityMode;

    if (computedActivityMode != v6)
    {
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __53__SBDeviceApplicationSceneHandle__updateActivityMode__block_invoke;
      v8[3] = &unk_1E6AF8858;
      v8[4] = self;
      [v4 updateSettingsWithBlock:v8];
    }
  }
}

uint64_t __53__SBDeviceApplicationSceneHandle__updateActivityMode__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setActivityMode:*(char *)(*(void *)(a1 + 32) + 344)];
}

- (void)_reevaluateJetsamModeFromAssertions
{
  char v3 = [(SBDeviceApplicationSceneHandle *)self _computeJetsamMode];
  if (self->_computedJetsamMode != v3)
  {
    self->_char computedJetsamMode = v3;
    [(SBDeviceApplicationSceneHandle *)self _updateJetsamMode];
  }
}

- (char)_computeJetsamMode
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ([(NSHashTable *)self->_jetsamModeAssertions count])
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    char v3 = [(NSHashTable *)self->_jetsamModeAssertions allObjects];
    uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v12;
      int v7 = 1;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v12 != v6) {
            objc_enumerationMutation(v3);
          }
          int v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) jetsamMode];
          if (v7 >= v9) {
            int v7 = v9;
          }
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v5);
    }
    else
    {
      LOBYTE(v7) = 1;
    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }
  return v7;
}

- (void)_updateJetsamMode
{
  char v3 = [(SBDeviceApplicationSceneHandle *)self sceneIfExists];
  uint64_t v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 settings];
    unsigned __int8 v6 = [v5 jetsamMode];
    int computedJetsamMode = self->_computedJetsamMode;

    if (computedJetsamMode != v6)
    {
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __51__SBDeviceApplicationSceneHandle__updateJetsamMode__block_invoke;
      v8[3] = &unk_1E6AF8858;
      v8[4] = self;
      [v4 updateSettingsWithBlock:v8];
    }
  }
}

uint64_t __51__SBDeviceApplicationSceneHandle__updateJetsamMode__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setJetsamMode:*(char *)(*(void *)(a1 + 32) + 345)];
}

- (void)_reevaluateTaskSuspensionForegroundPreferenceFromAssertions
{
  BOOL v3 = [(SBDeviceApplicationSceneHandle *)self _computeTaskSuspensionForegroundPreference];
  if (self->_computedTaskSuspensionForegroundPreference != v3)
  {
    self->_char computedTaskSuspensionForegroundPreference = v3;
    [(SBDeviceApplicationSceneHandle *)self _updatePrefersProcessTaskSuspensionWhileSceneForeground];
  }
}

- (BOOL)_computeTaskSuspensionForegroundPreference
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = [(NSHashTable *)self->_taskSuspensionForegroundPreferenceAssertions allObjects];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    int v5 = 0;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v2);
        }
        v5 |= [*(id *)(*((void *)&v9 + 1) + 8 * i) taskSuspensionForegroundPreference];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5 & 1;
}

- (void)_updatePrefersProcessTaskSuspensionWhileSceneForeground
{
  uint64_t v3 = [(SBDeviceApplicationSceneHandle *)self sceneIfExists];
  uint64_t v4 = v3;
  if (v3)
  {
    int v5 = [v3 settings];
    int v6 = [v5 prefersProcessTaskSuspensionWhileSceneForeground];
    int computedTaskSuspensionForegroundPreference = self->_computedTaskSuspensionForegroundPreference;

    if (computedTaskSuspensionForegroundPreference != v6)
    {
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __89__SBDeviceApplicationSceneHandle__updatePrefersProcessTaskSuspensionWhileSceneForeground__block_invoke;
      v8[3] = &unk_1E6AF8858;
      v8[4] = self;
      [v4 updateSettingsWithBlock:v8];
    }
  }
}

uint64_t __89__SBDeviceApplicationSceneHandle__updatePrefersProcessTaskSuspensionWhileSceneForeground__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setPrefersProcessTaskSuspensionWhileSceneForeground:*(unsigned __int8 *)(*(void *)(a1 + 32) + 346)];
}

- (void)setDefaultBackgroundStyle:(int64_t)a3
{
  self->_defaultBackgroundStyle = a3;
}

- (void)setPlaceholderContentProvider:(id)a3
{
}

- (SBIdleTimerCoordinating)_idleTimerCoordinator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_idleTimerCoordinator);
  return (SBIdleTimerCoordinating *)WeakRetained;
}

- (NSString)lastActivationIconLeafIdentifier
{
  return self->_lastActivationIconLeafIdentifier;
}

- (void)setHostedSecureApp:(BOOL)a3
{
  self->_hostedSecureApp = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastActivationIconLeafIdentifier, 0);
  objc_storeStrong((id *)&self->_taskSuspensionForegroundPreferenceAssertions, 0);
  objc_storeStrong((id *)&self->_jetsamModeAssertions, 0);
  objc_storeStrong((id *)&self->_activityModeAssertions, 0);
  objc_storeStrong((id *)&self->_stateCaptureInvalidatable, 0);
  objc_storeStrong((id *)&self->_preventKeyboardFocusDueToAppProtectionAssertion, 0);
  objc_storeStrong((id *)&self->_appProtectionSubscription, 0);
  objc_destroyWeak((id *)&self->_currentSnapshottingInfoAssertion);
  objc_storeStrong((id *)&self->_snapshottingInfoAssertions, 0);
  objc_storeStrong((id *)&self->_placeholderContentProvider, 0);
  objc_storeStrong((id *)&self->_statusBarStateProvider, 0);
  objc_storeStrong((id *)&self->_breadcrumbProvider, 0);
  objc_destroyWeak((id *)&self->_idleTimerCoordinator);
  objc_storeStrong((id *)&self->_clientSettingsInspector, 0);
  objc_storeStrong((id *)&self->_alertSuppressionContextsBySectionIdentifier, 0);
  objc_storeStrong((id *)&self->_backgroundActivitiesToSuppress, 0);
  objc_storeStrong((id *)&self->_statusBarForcedHiddenReasons, 0);
  objc_storeStrong((id *)&self->_modalAlertPresenter, 0);
}

- (BOOL)_classicAppPhoneOnPadPrefersLandscape
{
  uint64_t v3 = [(SBApplicationSceneHandle *)self application];
  int v4 = [v3 _classicAppScaledPhoneOnPad];

  if (!v4) {
    return 0;
  }
  int v5 = [(SBDeviceApplicationSceneHandle *)self _sceneDataStoreCreatingIfNecessary:0];
  int v6 = [v5 safeObjectForKey:@"classicPhoneAppPrefersLandscape" ofType:objc_opt_class()];
  char v7 = [v6 BOOLValue];

  return v7;
}

- (void)_setClassicAppPhoneOnPadPrefersLandscape:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(SBApplicationSceneHandle *)self application];
  int v6 = [v5 _classicAppScaledPhoneOnPad];

  if (v6)
  {
    id v8 = [(SBDeviceApplicationSceneHandle *)self _sceneDataStoreCreatingIfNecessary:1];
    char v7 = [NSNumber numberWithBool:v3];
    [v8 setObject:v7 forKey:@"classicPhoneAppPrefersLandscape"];
  }
}

- (BOOL)_classicAppPhoneOnPadSupportsOldStyleMixedOrientation
{
  BOOL v3 = [(SBApplicationSceneHandle *)self application];
  if ([v3 _classicAppScaledPhoneOnPad])
  {
    int v4 = [(SBDeviceApplicationSceneHandle *)self _windowScene];
    int v5 = [v4 switcherController];
    int v6 = [v5 isChamoisWindowingUIEnabled] ^ 1;
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (int64_t)_preferredSizingPolicyForContentOrientation:(int64_t)a3 containerOrientation:(int64_t)a4
{
  char v7 = [(SBDeviceApplicationSceneHandle *)self _windowScene];
  id v8 = [v7 switcherController];

  uint64_t v9 = [v8 windowManagementStyle];
  long long v10 = [(SBDeviceApplicationSceneHandle *)self sceneIfExists];
  long long v11 = [v10 settings];
  long long v12 = objc_msgSend(v11, "sb_displayIdentityForSceneManagers");

  long long v13 = [(SBApplicationSceneHandle *)self application];
  int64_t v14 = [v13 preferredSizingPolicyForSwitcherWindowManagementStyle:v9 displayIdentity:v12 contentOrientation:a3 containerOrientation:a4];

  return v14;
}

- (unint64_t)_supportedSizingPoliciesForContentOrientation:(int64_t)a3 containerOrientation:(int64_t)a4
{
  char v7 = [(SBDeviceApplicationSceneHandle *)self _windowScene];
  id v8 = [v7 switcherController];

  uint64_t v9 = [v8 windowManagementStyle];
  long long v10 = [(SBDeviceApplicationSceneHandle *)self sceneIfExists];
  long long v11 = [v10 settings];
  long long v12 = objc_msgSend(v11, "sb_displayIdentityForSceneManagers");

  long long v13 = [(SBApplicationSceneHandle *)self application];
  unint64_t v14 = [v13 supportedSizingPoliciesForSwitcherWindowManagementStyle:v9 displayIdentity:v12 contentOrientation:a3 containerOrientation:a4];

  return v14;
}

- (BOOL)_supportsMultiWindowLayouts
{
  BOOL v3 = [(SBDeviceApplicationSceneHandle *)self _windowScene];
  int v4 = [v3 switcherController];
  uint64_t v5 = [v4 windowManagementStyle];

  int v6 = [(SBDeviceApplicationSceneHandle *)self sceneIfExists];
  char v7 = [v6 settings];
  id v8 = objc_msgSend(v7, "sb_displayIdentityForSceneManagers");

  uint64_t v9 = [(SBApplicationSceneHandle *)self application];
  LOBYTE(v6) = [v9 supportsMultiWindowLayoutsForSwitcherWindowManagementStyle:v5 displayIdentity:v8];

  return (char)v6;
}

- (BOOL)_supportsMixedOrientationOnWindowScene:(id)a3
{
  int v4 = [a3 switcherController];
  uint64_t v5 = [v4 windowManagementStyle];

  int v6 = [(SBDeviceApplicationSceneHandle *)self sceneIfExists];
  char v7 = [v6 settings];
  id v8 = objc_msgSend(v7, "sb_displayIdentityForSceneManagers");

  uint64_t v9 = [(SBApplicationSceneHandle *)self application];
  LOBYTE(v6) = [v9 supportsMixedOrientationForSwitcherWindowManagementStyle:v5 displayIdentity:v8];

  return (char)v6;
}

- (void)_resetSceneOrientationRequestState
{
  [(SBDeviceApplicationSceneHandle *)self _setSettingUpSceneOrientationRequest:0];
  [(SBDeviceApplicationSceneHandle *)self _setInitialDeviceOrientationFromSceneOrientationRequestSetup:0];
  [(SBDeviceApplicationSceneHandle *)self _setSupportedInterfaceOrientationsFromSceneOrientationRequestSetup:0];
}

- (void)_setSettingUpSceneOrientationRequest:(BOOL)a3
{
  BOOL v3 = a3;
  -[SBDeviceApplicationSceneHandle _sceneDataStoreCreatingIfNecessary:](self, "_sceneDataStoreCreatingIfNecessary:");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  int v4 = [NSNumber numberWithBool:v3];
  [v5 setObject:v4 forKey:@"settingUpSceneOrientationRequest"];
}

- (void)_setInitialDeviceOrientationFromSceneOrientationRequestSetup:(int64_t)a3
{
  [(SBDeviceApplicationSceneHandle *)self _sceneDataStoreCreatingIfNecessary:a3 != 0];
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  int v4 = [NSNumber numberWithInteger:a3];
  [v5 setObject:v4 forKey:@"initialDeviceOrientationFromSceneOrientationRequestSetup"];
}

- (void)_setSupportedInterfaceOrientationsFromSceneOrientationRequestSetup:(unint64_t)a3
{
  [(SBDeviceApplicationSceneHandle *)self _sceneDataStoreCreatingIfNecessary:a3 != 0];
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  int v4 = [NSNumber numberWithUnsignedInteger:a3];
  [v5 setObject:v4 forKey:@"supportedInterfaceOrientationsFromSceneOrientationRequestSetup"];
}

- (BOOL)_isSettingUpSceneOrientationRequest
{
  id v2 = [(SBDeviceApplicationSceneHandle *)self _sceneDataStoreCreatingIfNecessary:0];
  BOOL v3 = [v2 safeObjectForKey:@"settingUpSceneOrientationRequest" ofType:objc_opt_class()];
  int v4 = v3;
  if (v3) {
    BOOL v5 = [v3 integerValue] != 0;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (int64_t)_initialDeviceOrientationFromSceneOrientationRequestSetup
{
  id v2 = [(SBDeviceApplicationSceneHandle *)self _sceneDataStoreCreatingIfNecessary:0];
  BOOL v3 = [v2 safeObjectForKey:@"initialDeviceOrientationFromSceneOrientationRequestSetup" ofType:objc_opt_class()];
  int v4 = v3;
  if (v3) {
    int64_t v5 = [v3 integerValue];
  }
  else {
    int64_t v5 = 0;
  }

  return v5;
}

@end