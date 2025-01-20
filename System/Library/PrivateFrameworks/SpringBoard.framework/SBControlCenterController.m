@interface SBControlCenterController
+ (SBControlCenterController)sharedInstance;
+ (id)_sharedInstanceCreatingIfNeeded:(BOOL)a3;
+ (id)sharedInstanceIfExists;
- (BOOL)_isLocationXWithinExtendedTrailingStatusBarRegion:(double)a3;
- (BOOL)_isLocationXWithinTrailingStatusBarRegion:(double)a3;
- (BOOL)_isLocationXWithinTrailingStatusBarRegion:(double)a3 regionPadding:(double)a4;
- (BOOL)_isStatusBarHiddenIgnoringControlCenter;
- (BOOL)_shouldAllowControlCenterGesture;
- (BOOL)_shouldShowGrabberOnFirstSwipe;
- (BOOL)allowGestureForContentBelow;
- (BOOL)allowShowTransitionSystemGesture;
- (BOOL)canBePresented;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)grabberTongue:(id)a3 shouldAllowSecondSwipeWithEdgeLocation:(double)a4;
- (BOOL)grabberTongue:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)grabberTongueHonorsAmbiguousActivationMargin:(id)a3;
- (BOOL)handleIndirectStatusBarAction;
- (BOOL)handleMenuButtonTap;
- (BOOL)indirectStatusBarPullGestureCalledBegin;
- (BOOL)isDismissedOrDismissing;
- (BOOL)isPresented;
- (BOOL)isPresentedOrDismissing;
- (BOOL)isVisible;
- (BOOL)presentationGestureContinuedIntoPaging;
- (BSInvalidatable)bannerSuppressionAssertion;
- (BSInvalidatable)deferOrientationUpdatesAssertion;
- (BSInvalidatable)displayLayoutAssertion;
- (BSInvalidatable)idleTimerDisableAssertion;
- (BSInvalidatable)keyboardFocusLockAssertion;
- (BSSimpleAssertion)hideStatusBarAssertion;
- (CCUIMainViewController)viewController;
- (CCUIStatusBarStyleSnapshot)hostStatusBarStyle;
- (CCUISystemControlsCoordinator)systemControlsCoordinator;
- (CGPoint)_locationOfTouchInActiveInterfaceOrientation:(id)a3 gestureRecognizer:(id)a4;
- (CGPoint)_presentGestureLocationInView;
- (CGPoint)_presentGestureTranslationInView:(BOOL)a3;
- (CGPoint)_presentGestureVelocityInView;
- (NSArray)physicalButtonSceneTargets;
- (NSArray)presentationRegions;
- (NSHashTable)observers;
- (NSMutableDictionary)systemApertureAssertionForRestrictionType;
- (NSSet)components;
- (NSString)coverSheetIdentifier;
- (PTSingleTestRecipe)presentModuleTestRecipe;
- (PTSingleTestRecipe)userInterfaceStyleTestRecipe;
- (SBAsynchronousRenderingAssertion)asynchronousRenderingAssertion;
- (SBBarSwipeAffordanceViewController)homeAffordanceViewController;
- (SBControlCenterController)init;
- (SBControlCenterSystemAgent)systemAgent;
- (SBControlCenterWindow)window;
- (SBFSensorActivityDataProvider)sensorActivityDataProvider;
- (SBFZStackParticipant)zStackParticipant;
- (SBGrabberTongue)grabberTongue;
- (SBHCredenzaSettings)credenzaSettings;
- (SBIdleTimerCoordinating)idleTimerCoordinator;
- (SBIndirectPanGestureRecognizer)indirectStatusBarPullGestureRecognizer;
- (SBKeyboardFocusControlling)keyboardFocusController;
- (SBMedusaHostedKeyboardWindowLevelAssertion)medusaHostedKeyboardWindowLevelAssertion;
- (SBWindowLevelAssertionManager)windowLevelAssertionManager;
- (SBWindowSceneStatusBarSettingsAssertion)statusBarAssertion;
- (UIApplicationSceneDeactivationAssertion)resignActiveAssertion;
- (UICoordinateSpace)presentationCoordinateSpace;
- (UIPanGestureRecognizer)statusBarPullGestureRecognizer;
- (UIViewController)homeButtonWrapperViewController;
- (_UILegibilitySettings)legibilitySettings;
- (double)_homeAffordanceAnimationDelay;
- (double)_reachabilityOffset;
- (double)_trailingStatusBarRegionWidth;
- (id)_applicationEligibleForInactiveMicModeSelection;
- (id)_controlCenterWindow;
- (id)_coverSheetViewController;
- (id)_inactiveMicModeSelectionSensorActivityDataFromApplication:(id)a3;
- (id)_lockScreenManager;
- (id)_newSystemApertureRestrictionAssertionForType:(unint64_t)a3 withReason:(id)a4;
- (id)_presentGestureRecognizers;
- (id)_sensorActivityDataFromSensorActivityAttribution:(id)a3;
- (id)_switcherController;
- (id)_systemGestureManager;
- (id)_touchesForGesture:(id)a3;
- (id)_transientOverlayPresenter;
- (id)acquireWindowLevelAssertionWithPriority:(int64_t)a3 windowLevel:(double)a4 windowScene:(id)a5 reason:(id)a6;
- (id)coordinatorRequestedIdleTimerBehavior:(id)a3;
- (id)customGestureRecognizerForGrabberTongue:(id)a3;
- (id)hasExistingControlFromExtension:(id)a3;
- (id)hideAnimationSettingsForBarSwipeAffordanceView:(id)a3;
- (id)reachabilitySpringAnimationBehaviorForControlCenterViewController:(id)a3;
- (id)unhideAnimationSettingsForBarSwipeAffordanceView:(id)a3;
- (id)viewForSystemGestureRecognizer:(id)a3;
- (int64_t)idleTimerDuration;
- (int64_t)idleTimerMode;
- (int64_t)idleWarnMode;
- (int64_t)indirectPanEffectiveInterfaceOrientation;
- (int64_t)notificationBehavior;
- (int64_t)participantState;
- (int64_t)proximityDetectionMode;
- (int64_t)scrollingStrategy;
- (unint64_t)barSwipeAffordanceView:(id)a3 systemGestureTypeForType:(int64_t)a4;
- (unint64_t)presentingEdge;
- (unint64_t)restrictedCapabilities;
- (void)_clearInactiveMicModeSelectionSensorActivityData;
- (void)_didDismiss;
- (void)_didEndTransition;
- (void)_didPresent;
- (void)_disableReachability;
- (void)_enumerateObservers:(id)a3;
- (void)_handleStatusBarPullDownGesture:(id)a3;
- (void)_policyAggregatorCapabilitiesDidChange:(id)a3;
- (void)_requireGestureRecognizerToFailForPresentGestureRecognizer:(id)a3;
- (void)_requirePresentGestureRecognizerToFailForGestureRecognizer:(id)a3;
- (void)_screenDidDim;
- (void)_setDisplayLayoutElementActive:(BOOL)a3;
- (void)_setStatusBarHidden:(BOOL)a3;
- (void)_setupGestureRecognizersForUpdatedWindowScene;
- (void)_setupPhysicalButtonPreferencesForUpdatedWindowScene;
- (void)_uiRelockedNotification:(id)a3;
- (void)_updateInactiveMicModeSelectionSensorActivityData;
- (void)_updateWindowContentHitTesting;
- (void)_updateWindowForScene:(id)a3;
- (void)_updateWindowLevelForScene:(id)a3;
- (void)_updateWindowOrientation;
- (void)_updateWindowVisibility;
- (void)_willBeginTransition;
- (void)_willDismiss;
- (void)_willPresent;
- (void)activityDidChangeForSensorActivityDataProvider:(id)a3;
- (void)addObserver:(id)a3;
- (void)controlCenterViewController:(id)a3 didChangePresentationState:(unint64_t)a4;
- (void)controlCenterViewController:(id)a3 didUpdateHomeGestureDismissalAllowed:(BOOL)a4;
- (void)controlCenterViewController:(id)a3 significantPresentationProgressChange:(double)a4;
- (void)controlCenterViewController:(id)a3 wantsHostStatusBarHidden:(BOOL)a4;
- (void)controlCenterViewControllerWillContinuePresentationIntoPaging:(id)a3;
- (void)dealloc;
- (void)didCloseExpandedModuleForControlCenterViewController:(id)a3;
- (void)didRequestPowerDownTransientOverlayForControlCenterViewController:(id)a3;
- (void)dismissAnimated:(BOOL)a3;
- (void)dismissAnimated:(BOOL)a3 completion:(id)a4;
- (void)grabberTongueBeganPulling:(id)a3 withDistance:(double)a4 andVelocity:(double)a5 andGesture:(id)a6;
- (void)grabberTongueCanceledPulling:(id)a3 withDistance:(double)a4 andVelocity:(double)a5 andGesture:(id)a6;
- (void)grabberTongueEndedPulling:(id)a3 withDistance:(double)a4 andVelocity:(double)a5 andGesture:(id)a6;
- (void)grabberTongueUpdatedPulling:(id)a3 withDistance:(double)a4 andVelocity:(double)a5 andGesture:(id)a6;
- (void)grabberTongueWillPresent:(id)a3;
- (void)handleDidEndReachabilityAnimation;
- (void)handleReachabilityModeActivated;
- (void)handleReachabilityModeDeactivated;
- (void)handleReachabilityYOffsetDidChange;
- (void)homeGesturePerformedForBarSwipeAffordanceView:(id)a3;
- (void)homeGrabberViewDidReceiveClick:(id)a3;
- (void)invalidateSystemApertureAssertionForType:(unint64_t)a3 withReason:(id)a4;
- (void)launchControl:(id)a3 completion:(id)a4;
- (void)presentAnimated:(BOOL)a3;
- (void)presentAnimated:(BOOL)a3 completion:(id)a4;
- (void)removeObserver:(id)a3;
- (void)restrictSystemApertureToType:(unint64_t)a3 withReason:(id)a4;
- (void)setAsynchronousRenderingAssertion:(id)a3;
- (void)setBannerSuppressionAssertion:(id)a3;
- (void)setDeferOrientationUpdatesAssertion:(id)a3;
- (void)setDisplayLayoutAssertion:(id)a3;
- (void)setGrabberTongue:(id)a3;
- (void)setHideStatusBarAssertion:(id)a3;
- (void)setHomeAffordanceViewController:(id)a3;
- (void)setHomeButtonWrapperViewController:(id)a3;
- (void)setIdleTimerCoordinator:(id)a3;
- (void)setIdleTimerDisableAssertion:(id)a3;
- (void)setIndirectStatusBarPullGestureCalledBegin:(BOOL)a3;
- (void)setIndirectStatusBarPullGestureRecognizer:(id)a3;
- (void)setKeyboardFocusController:(id)a3;
- (void)setKeyboardFocusLockAssertion:(id)a3;
- (void)setMedusaHostedKeyboardWindowLevelAssertion:(id)a3;
- (void)setObservers:(id)a3;
- (void)setPhysicalButtonSceneTargets:(id)a3;
- (void)setPresentationGestureContinuedIntoPaging:(BOOL)a3;
- (void)setResignActiveAssertion:(id)a3;
- (void)setSensorActivityDataProvider:(id)a3;
- (void)setStatusBarAssertion:(id)a3;
- (void)setStatusBarPullGestureRecognizer:(id)a3;
- (void)setSystemAgent:(id)a3;
- (void)setSystemApertureAssertionForRestrictionType:(id)a3;
- (void)setSystemControlsCoordinator:(id)a3;
- (void)setViewController:(id)a3;
- (void)setWindow:(id)a3;
- (void)setWindowLevelAssertionManager:(id)a3;
- (void)setZStackParticipant:(id)a3;
- (void)willOpenExpandedModuleForControlCenterViewController:(id)a3;
- (void)windowLevelAssertionManager:(id)a3 didUpdateAssertionsForWindowScene:(id)a4;
- (void)windowSceneDidConnect:(id)a3;
- (void)zStackParticipant:(id)a3 updatePreferences:(id)a4;
@end

@implementation SBControlCenterController

+ (id)_sharedInstanceCreatingIfNeeded:(BOOL)a3
{
  BOOL v3 = a3;
  if ([MEMORY[0x1E4F73138] inUserSessionLoginUI])
  {
    id v4 = 0;
  }
  else
  {
    v5 = (void *)_sharedInstanceCreatingIfNeeded____ControlCenter;
    if (_sharedInstanceCreatingIfNeeded____ControlCenter) {
      BOOL v6 = 1;
    }
    else {
      BOOL v6 = !v3;
    }
    if (!v6)
    {
      if (_sharedInstanceCreatingIfNeeded__onceToken != -1) {
        dispatch_once(&_sharedInstanceCreatingIfNeeded__onceToken, &__block_literal_global_168);
      }
      v5 = (void *)_sharedInstanceCreatingIfNeeded____ControlCenter;
    }
    id v4 = v5;
  }
  return v4;
}

+ (id)sharedInstanceIfExists
{
  return (id)[a1 _sharedInstanceCreatingIfNeeded:0];
}

- (BOOL)isVisible
{
  return [(SBControlCenterWindow *)self->_window isHidden] ^ 1;
}

- (id)_sensorActivityDataFromSensorActivityAttribution:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 sensor];
  if (v3)
  {
    uint64_t v5 = v4;
    id v6 = objc_alloc_init(MEMORY[0x1E4F5AE50]);
    v7 = v6;
    if (v5 == 2) {
      uint64_t v8 = 2;
    }
    else {
      uint64_t v8 = v5 == 1;
    }
    [v6 setSensorType:v8];
    v9 = [v3 displayName];
    [v7 setDisplayName:v9];

    objc_msgSend(v7, "setUsedRecently:", objc_msgSend(v3, "usedRecently"));
    v10 = [v3 bundleIdentifier];
    [v7 setBundleIdentifier:v10];

    v11 = [v3 attributionGroup];
    [v7 setAttributionGroup:v11];

    v12 = [v3 website];
    [v7 setWebsite:v12];

    objc_msgSend(v7, "setIsSystemService:", objc_msgSend(v3, "isSystemService"));
    v13 = [v3 executableDisplayName];
    [v7 setExecutableDisplayName:v13];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6 = (UIPanGestureRecognizer *)a3;
  if (self->_statusBarPullGestureRecognizer == v6)
  {
    [(SBControlCenterController *)self _locationOfTouchInActiveInterfaceOrientation:a4 gestureRecognizer:v6];
    double v9 = v8;
    CGFloat v11 = v10;
    v12 = [MEMORY[0x1E4F42D90] mainScreen];
    [v12 bounds];
    CGFloat v14 = v13;

    objc_msgSend((id)*MEMORY[0x1E4F43630], "statusBarHeightForOrientation:", objc_msgSend((id)SBApp, "activeInterfaceOrientation"));
    double v16 = v15;
    [(SBControlCenterController *)self _reachabilityOffset];
    CGFloat v18 = v16 + v17;
    v36.origin.x = 0.0;
    v36.origin.y = 0.0;
    v36.size.width = v14;
    v36.size.height = v18;
    v35.x = v9;
    v35.y = v11;
    BOOL v19 = CGRectContainsPoint(v36, v35);
    BOOL v20 = [(SBControlCenterController *)self _isLocationXWithinTrailingStatusBarRegion:v9];
    char v7 = v19 && v20;
    v21 = [MEMORY[0x1E4FA8AA0] sharedInstance];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __66__SBControlCenterController_gestureRecognizer_shouldReceiveTouch___block_invoke;
    v23[3] = &unk_1E6B02630;
    BOOL v32 = v19 && v20;
    double v26 = v9;
    CGFloat v27 = v11;
    uint64_t v28 = 0;
    uint64_t v29 = 0;
    CGFloat v30 = v14;
    CGFloat v31 = v18;
    v24 = v6;
    v25 = self;
    BOOL v33 = v19;
    BOOL v34 = v20;
    [v21 logBlock:v23];
  }
  else
  {
    char v7 = 1;
  }

  return v7;
}

- (BOOL)grabberTongue:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(SBControlCenterController *)self presentingEdge] == 1
    && (![(SBControlCenterController *)self _shouldShowGrabberOnFirstSwipe]
     || [(SBGrabberTongue *)self->_grabberTongue isVisible]))
  {
    double v8 = [v6 edgePullGestureRecognizer];
    [(SBControlCenterController *)self _locationOfTouchInActiveInterfaceOrientation:v7 gestureRecognizer:v8];
    double v10 = v9;
    uint64_t v12 = v11;

    BOOL v13 = [(SBControlCenterController *)self _isLocationXWithinTrailingStatusBarRegion:v10];
    if (!v13 && [(SBGrabberTongue *)self->_grabberTongue isVisible]) {
      [v6 dismissWithStyle:0 animated:1];
    }
    CGFloat v14 = [MEMORY[0x1E4FA8AA0] sharedInstance];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __62__SBControlCenterController_grabberTongue_shouldReceiveTouch___block_invoke;
    v16[3] = &unk_1E6B02680;
    BOOL v20 = v13;
    id v17 = v6;
    double v18 = v10;
    uint64_t v19 = v12;
    [v14 logBlock:v16];
  }
  else
  {
    BOOL v13 = 1;
  }

  return v13;
}

- (unint64_t)presentingEdge
{
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = [(SBGrabberTongue *)self->_grabberTongue edgePullGestureRecognizer];
  uint64_t v5 = SBSafeCast(v3, v4);

  if (v5)
  {
    unint64_t v6 = [v5 edges];
  }
  else if (SBFEffectiveHomeButtonType() == 2)
  {
    unint64_t v6 = 1;
  }
  else
  {
    id v7 = [MEMORY[0x1E4F42948] currentDevice];
    uint64_t v8 = [v7 userInterfaceIdiom];

    if ((v8 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
      unint64_t v6 = 1;
    }
    else {
      unint64_t v6 = 4;
    }
  }

  return v6;
}

- (CGPoint)_locationOfTouchInActiveInterfaceOrientation:(id)a3 gestureRecognizer:(id)a4
{
  id v5 = a4;
  [a3 locationInView:0];
  [(id)SBApp activeInterfaceOrientation];
  unint64_t v6 = [v5 view];

  [v6 size];
  _UIWindowConvertPointFromOrientationToOrientation();
  double v8 = v7;
  double v10 = v9;

  double v11 = v8;
  double v12 = v10;
  result.y = v12;
  result.x = v11;
  return result;
}

- (BOOL)_isLocationXWithinTrailingStatusBarRegion:(double)a3 regionPadding:(double)a4
{
  double v7 = [MEMORY[0x1E4F42D90] mainScreen];
  [v7 bounds];
  double v9 = v8;

  [(SBControlCenterController *)self _trailingStatusBarRegionWidth];
  double v11 = v10 + a4;
  if ([(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection] == 1) {
    BOOL v12 = v11 > a3;
  }
  else {
    BOOL v12 = v9 - v11 < a3;
  }
  BOOL v13 = objc_msgSend(MEMORY[0x1E4FA8AA0], "sharedInstance", v9 - v11);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __85__SBControlCenterController__isLocationXWithinTrailingStatusBarRegion_regionPadding___block_invoke;
  v15[3] = &__block_descriptor_49_e19___NSDictionary_8__0l;
  BOOL v16 = v12;
  *(double *)&v15[4] = v9;
  *(double *)&v15[5] = v11;
  [v13 logBlock:v15];

  return v12;
}

- (double)_trailingStatusBarRegionWidth
{
  uint64_t v3 = [MEMORY[0x1E4F42D90] mainScreen];
  [v3 bounds];
  double v5 = v4;

  uint64_t v6 = [(id)SBApp activeInterfaceOrientation];
  double v7 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v8 = [v7 userInterfaceIdiom];

  if ((v8 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    double v9 = [(UIWindow *)self->_window _sbWindowScene];
    double v10 = [v9 statusBarManager];
    double v11 = [v10 statusBar];

    [v11 frameForPartWithIdentifier:*MEMORY[0x1E4F441B0]];
    uint64_t v13 = v12;
    uint64_t v15 = v14;
    uint64_t v17 = v16;
    uint64_t v19 = v18;
    uint64_t v20 = [(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection];
    uint64_t v21 = v13;
    uint64_t v22 = v15;
    uint64_t v23 = v17;
    uint64_t v24 = v19;
    if (v20 == 1) {
      double MaxX = CGRectGetMaxX(*(CGRect *)&v21);
    }
    else {
      double MaxX = v5 - CGRectGetMinX(*(CGRect *)&v21);
    }
    SBLayoutDefaultSideLayoutElementWidth();
    double v28 = v27 * 0.5;
    if (MaxX < v28) {
      double MaxX = v28;
    }
  }
  else
  {
    double v26 = 0.172;
    if ((unint64_t)(v6 - 1) < 2) {
      double v26 = 0.25;
    }
    return v5 * v26;
  }
  return MaxX;
}

- (BOOL)_isLocationXWithinTrailingStatusBarRegion:(double)a3
{
  return [(SBControlCenterController *)self _isLocationXWithinTrailingStatusBarRegion:a3 regionPadding:0.0];
}

- (double)_reachabilityOffset
{
  v2 = +[SBReachabilityManager sharedInstance];
  [v2 effectiveReachabilityYOffset];
  double v4 = v3;

  return v4;
}

+ (SBControlCenterController)sharedInstance
{
  return (SBControlCenterController *)[a1 _sharedInstanceCreatingIfNeeded:1];
}

- (BOOL)isPresented
{
  uint64_t v3 = [(CCUIMainViewController *)self->_viewController presentationState];
  if (v3 != 1) {
    LOBYTE(v3) = [(CCUIMainViewController *)self->_viewController presentationState] == 2;
  }
  return v3;
}

- (CCUIMainViewController)viewController
{
  return self->_viewController;
}

- (BOOL)_shouldShowGrabberOnFirstSwipe
{
  uint64_t v3 = [(SBControlCenterController *)self _transientOverlayPresenter];
  char v4 = [v3 hasActivePresentation];

  if (v4) {
    return 0;
  }
  double v5 = [(SBControlCenterController *)self _lockScreenManager];
  char v6 = [v5 isUILocked];

  if (v6) {
    return 0;
  }
  uint64_t v8 = [(UIWindow *)self->_window _sbWindowScene];
  double v9 = [v8 switcherController];

  if ([v9 unlockedEnvironmentMode] == 2)
  {
    BOOL v7 = 0;
  }
  else
  {
    double v10 = [v9 layoutStateSideElement];
    double v11 = [v10 workspaceEntity];
    uint64_t v12 = [v11 applicationSceneEntity];
    uint64_t v13 = [v12 sceneHandle];

    if (v13)
    {
      BOOL v7 = 0;
    }
    else
    {
      uint64_t v14 = [v9 layoutStatePrimaryElement];
      uint64_t v15 = [v14 workspaceEntity];
      uint64_t v16 = [v15 applicationSceneEntity];
      uint64_t v17 = [v16 sceneHandle];

      unint64_t v18 = [(SBControlCenterController *)self presentingEdge];
      if ([v17 isDeviceApplicationSceneHandle]) {
        uint64_t v19 = [v17 screenEdgesDeferringSystemGestures];
      }
      else {
        uint64_t v19 = 0;
      }
      BOOL v7 = (v19 & v18) != 0;
    }
  }

  return v7;
}

- (id)_lockScreenManager
{
  v2 = [(UIWindow *)self->_window _sbWindowScene];
  uint64_t v3 = [v2 lockScreenManager];

  return v3;
}

- (id)_transientOverlayPresenter
{
  v2 = [(UIWindow *)self->_window _sbWindowScene];
  uint64_t v3 = [v2 transientOverlayPresenter];

  return v3;
}

- (void)activityDidChangeForSensorActivityDataProvider:(id)a3
{
  char v4 = (objc_class *)MEMORY[0x1E4F5AD38];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  BOOL v7 = [v5 mostRecentCameraAndMicrophoneSensorActivityAttribution];
  uint64_t v8 = [(SBControlCenterController *)self _sensorActivityDataFromSensorActivityAttribution:v7];

  [v8 setUsedRecently:1];
  [v6 setMostRecentSensorActivityData:v8];
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  if (_os_feature_enabled_impl()) {
    [v5 activeAndRecentSensorActivityAttributions];
  }
  else {
  double v10 = [v5 activeCameraAndMicrophoneActivityAttributions];
  }

  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  uint64_t v14 = __76__SBControlCenterController_activityDidChangeForSensorActivityDataProvider___block_invoke;
  uint64_t v15 = &unk_1E6B026C8;
  uint64_t v16 = self;
  id v17 = v9;
  id v11 = v9;
  [v10 enumerateObjectsUsingBlock:&v12];
  objc_msgSend(v6, "setActiveSensorActivityData:", v11, v12, v13, v14, v15, v16);
  [(CCUIMainViewController *)self->_viewController setSensorActivityDataProvider:v6];
  [(SBControlCenterController *)self _updateInactiveMicModeSelectionSensorActivityData];
}

void __76__SBControlCenterController_activityDidChangeForSensorActivityDataProvider___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) _sensorActivityDataFromSensorActivityAttribution:a2];
  [*(id *)(a1 + 40) addObject:v3];
}

- (void)_updateInactiveMicModeSelectionSensorActivityData
{
  id v3 = [(SBControlCenterController *)self viewController];
  id v6 = [v3 sensorActivityDataProvider];

  if (objc_opt_respondsToSelector())
  {
    char v4 = [(SBControlCenterController *)self _applicationEligibleForInactiveMicModeSelection];
    id v5 = [(SBControlCenterController *)self _inactiveMicModeSelectionSensorActivityDataFromApplication:v4];

    [v6 setInactiveSensorActivityDataEligibleForMicModeSelection:v5];
  }
}

- (id)_inactiveMicModeSelectionSensorActivityDataFromApplication:(id)a3
{
  if (a3)
  {
    id v3 = (objc_class *)MEMORY[0x1E4F5AE50];
    id v4 = a3;
    id v5 = objc_alloc_init(v3);
    [v5 setSensorType:1];
    id v6 = [v4 displayName];
    [v5 setDisplayName:v6];
    BOOL v7 = [v4 bundleIdentifier];

    [v5 setBundleIdentifier:v7];
    [v5 setExecutableDisplayName:v6];
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

- (id)_applicationEligibleForInactiveMicModeSelection
{
  if (!_os_feature_enabled_impl())
  {
    id v11 = 0;
    goto LABEL_12;
  }
  id v3 = [(SBControlCenterController *)self _lockScreenManager];
  char v4 = [v3 isUILocked];
  id v5 = [(UIWindow *)self->_window _sbWindowScene];
  id v6 = [v5 switcherController];

  if ((v4 & 1) == 0 && [v6 unlockedEnvironmentMode] == 3)
  {
    BOOL v7 = [v6 layoutStatePrimaryElement];
    uint64_t v8 = [v7 workspaceEntity];
    id v9 = [v8 applicationSceneEntity];
    double v10 = [v9 sceneHandle];
    id v11 = [v10 application];

    uint64_t v12 = [v11 info];
    if ([v12 supportsInactiveMicModeSelection])
    {
      uint64_t v13 = +[SBIconController sharedInstance];
      uint64_t v14 = [v11 bundleIdentifier];
      char v15 = [v13 isIconVisibleForBundleIdentifier:v14];

      if (v15) {
        goto LABEL_11;
      }
    }
    else
    {
    }
  }
  id v11 = 0;
LABEL_11:

LABEL_12:
  return v11;
}

uint64_t __61__SBControlCenterController__sharedInstanceCreatingIfNeeded___block_invoke()
{
  kdebug_trace();
  v0 = objc_alloc_init(SBControlCenterController);
  v1 = (void *)_sharedInstanceCreatingIfNeeded____ControlCenter;
  _sharedInstanceCreatingIfNeeded____ControlCenter = (uint64_t)v0;

  return kdebug_trace();
}

- (SBControlCenterController)init
{
  v52[1] = *MEMORY[0x1E4F143B8];
  v51.receiver = self;
  v51.super_class = (Class)SBControlCenterController;
  v2 = [(SBControlCenterController *)&v51 init];
  if (v2)
  {
    id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 addObserver:v2 selector:sel__screenDidDim name:*MEMORY[0x1E4FA7A10] object:0];
    [v3 addObserver:v2 selector:sel__uiRelockedNotification_ name:@"SBLockScreenUIRelockedNotification" object:0];
    [v3 addObserver:v2 selector:sel__policyAggregatorCapabilitiesDidChange_ name:@"SBPolicyAggregatorCapabilitiesChangedNotification" object:0];
    char v4 = +[SBSceneManagerCoordinator sharedInstance];
    id v5 = [v4 sceneDeactivationManager];
    uint64_t v6 = [v5 newAssertionWithReason:2];
    resignActiveAssertion = v2->_resignActiveAssertion;
    v2->_resignActiveAssertion = (UIApplicationSceneDeactivationAssertion *)v6;

    uint64_t v8 = objc_alloc_init(SBControlCenterSystemAgent);
    systemAgent = v2->_systemAgent;
    v2->_systemAgent = v8;

    double v10 = objc_alloc_init(SBControlCenterSystemControlsHost);
    uint64_t v11 = [objc_alloc(MEMORY[0x1E4F5AD48]) initWithSystemHost:v10];
    systemControlsCoordinator = v2->_systemControlsCoordinator;
    v2->_systemControlsCoordinator = (CCUISystemControlsCoordinator *)v11;

    [(CCUISystemControlsCoordinator *)v2->_systemControlsCoordinator beginObservingSystemState];
    uint64_t v13 = objc_alloc_init(SBWindowLevelAssertionManager);
    windowLevelAssertionManager = v2->_windowLevelAssertionManager;
    v2->_windowLevelAssertionManager = v13;

    [(SBWindowLevelAssertionManager *)v2->_windowLevelAssertionManager setDelegate:v2];
    char v15 = +[SBMainWorkspace sharedInstance];
    uint64_t v16 = [v15 keyboardFocusController];
    keyboardFocusController = v2->_keyboardFocusController;
    v2->_keyboardFocusController = (SBKeyboardFocusControlling *)v16;

    uint64_t v18 = SBFIsChamoisWindowingUIAvailable();
    uint64_t v19 = [MEMORY[0x1E4F5ACE8] sharedInstance];
    [v19 setVisibility:v18 forModuleWithIdentifier:@"com.apple.springboard.ContinuousExposeModule" completionHandler:0];

    uint64_t v20 = [MEMORY[0x1E4F5AD28] mainViewControllerWithSystemAgent:v2->_systemAgent];
    viewController = v2->_viewController;
    v2->_viewController = (CCUIMainViewController *)v20;

    [(CCUIMainViewController *)v2->_viewController setDelegate:v2];
    objc_initWeak(&location, v2);
    uint64_t v22 = v2->_viewController;
    uint64_t v23 = self;
    v52[0] = v23;
    uint64_t v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:1];
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = __33__SBControlCenterController_init__block_invoke;
    v48[3] = &unk_1E6B00AB8;
    objc_copyWeak(&v49, &location);
    id v25 = (id)[(CCUIMainViewController *)v22 registerForTraitChanges:v24 withHandler:v48];

    if (SBHomeGestureEnabled())
    {
      double v26 = [[SBBarSwipeAffordanceViewController alloc] initWithZStackParticipantIdentifier:19 windowScene:0];
      p_homeAffordanceViewController = (id *)&v2->_homeAffordanceViewController;
      homeAffordanceViewController = v2->_homeAffordanceViewController;
      v2->_homeAffordanceViewController = v26;

      [(SBBarSwipeAffordanceViewController *)v2->_homeAffordanceViewController setPointerClickDelegate:v2];
      [(SBBarSwipeAffordanceViewController *)v2->_homeAffordanceViewController setDelegate:v2];
      [(SBBarSwipeAffordanceViewController *)v2->_homeAffordanceViewController addChildViewController:v2->_viewController];
      [(CCUIMainViewController *)v2->_viewController didMoveToParentViewController:v2->_homeAffordanceViewController];
      uint64_t v29 = [(SBBarSwipeAffordanceViewController *)v2->_homeAffordanceViewController view];
      CGFloat v30 = [(CCUIMainViewController *)v2->_viewController view];
      [v29 addSubview:v30];

      CGFloat v31 = [(SBBarSwipeAffordanceViewController *)v2->_homeAffordanceViewController view];
      [v31 setDelegate:v2];

      BOOL v32 = [(SBBarSwipeAffordanceViewController *)v2->_homeAffordanceViewController view];
      [v32 addObserver:v2];

      BOOL v33 = [(SBBarSwipeAffordanceViewController *)v2->_homeAffordanceViewController view];
      [v33 setColorBias:2];

      [(CCUIMainViewController *)v2->_viewController setHostStatusBarStyleProvider:v2];
      [(SBBarSwipeAffordanceViewController *)v2->_homeAffordanceViewController setSuppressAffordance:[(CCUIMainViewController *)v2->_viewController isHomeGestureDismissalAllowed] ^ 1];
    }
    else
    {
      uint64_t v34 = [objc_alloc(MEMORY[0x1E4F42FF8]) initWithNibName:0 bundle:0];
      p_homeAffordanceViewController = (id *)&v2->_homeButtonWrapperViewController;
      homeButtonWrapperViewController = v2->_homeButtonWrapperViewController;
      v2->_homeButtonWrapperViewController = (UIViewController *)v34;

      [(UIViewController *)v2->_homeButtonWrapperViewController addChildViewController:v2->_viewController];
      [(CCUIMainViewController *)v2->_viewController didMoveToParentViewController:v2->_homeButtonWrapperViewController];
      CGRect v36 = [(UIViewController *)v2->_homeButtonWrapperViewController view];
      v37 = [(CCUIMainViewController *)v2->_viewController view];
      [v36 addSubview:v37];
    }
    id v38 = *p_homeAffordanceViewController;
    v39 = (void *)MEMORY[0x1E4F941D0];
    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = __33__SBControlCenterController_init__block_invoke_2;
    v46[3] = &unk_1E6AF4AC0;
    v40 = v2;
    v47 = v40;
    uint64_t v41 = [v39 recipeWithTitle:@"Present Module" prepareBlock:0 action:v46 cleanupBlock:0];
    presentModuleTestRecipe = v40->_presentModuleTestRecipe;
    v40->_presentModuleTestRecipe = (PTSingleTestRecipe *)v41;

    [MEMORY[0x1E4FA6270] registerTestRecipe:v40->_presentModuleTestRecipe];
    uint64_t v43 = [MEMORY[0x1E4F941D0] recipeWithTitle:@"Appearance Style" prepareBlock:0 action:&__block_literal_global_80_1 cleanupBlock:0];
    userInterfaceStyleTestRecipe = v40->_userInterfaceStyleTestRecipe;
    v40 = (SBControlCenterController *)((char *)v40 + 224);
    v40->super.isa = (Class)v43;

    [MEMORY[0x1E4FA6270] registerTestRecipe:v40->super.isa];
    objc_destroyWeak(&v49);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __33__SBControlCenterController_init__block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 traitCollection];
  uint64_t v4 = [v3 _backlightLuminance];

  if (v4 != 2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained dismissAnimated:1];
  }
}

void __33__SBControlCenterController_init__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) dismissAnimated:1];
  v1 = [SBControlCenterModuleTransientOverlayViewController alloc];
  v2 = [MEMORY[0x1E4F5ACF0] defaultOptions];
  uint64_t v4 = [(SBControlCenterModuleTransientOverlayViewController *)v1 initWithModuleIdentifier:@"com.apple.mediaremote.controlcenter.audio" presentationOptions:v2];

  id v3 = +[SBWorkspace mainWorkspace];
  [v3 presentTransientOverlayViewController:v4 animated:1 completion:0];
}

void __33__SBControlCenterController_init__block_invoke_3()
{
  id v0 = [MEMORY[0x1E4F42FE0] sharedInstance];
  [v0 toggleCurrentStyle];
}

- (void)dealloc
{
  uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"SBControlCenterController.m" lineNumber:310 description:@"this should never go away"];

  id v5 = [(SBControlCenterController *)self _systemGestureManager];
  [v5 removeGestureRecognizer:self->_statusBarPullGestureRecognizer];
  [v5 removeGestureRecognizer:self->_indirectStatusBarPullGestureRecognizer];
  uint64_t v6 = [(SBControlCenterController *)self _coverSheetViewController];
  [v6 unregisterExternalBehaviorProvider:self];
  [v6 unregisterExternalPresentationProvider:self];
  BOOL v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v7 removeObserver:self];

  [(UIApplicationSceneDeactivationAssertion *)self->_resignActiveAssertion relinquish];
  v8.receiver = self;
  v8.super_class = (Class)SBControlCenterController;
  [(SBControlCenterController *)&v8 dealloc];
}

- (int64_t)indirectPanEffectiveInterfaceOrientation
{
  return [(id)SBApp activeInterfaceOrientation];
}

- (void)zStackParticipant:(id)a3 updatePreferences:(id)a4
{
  id v5 = a4;
  [v5 setSuppressSystemApertureForSystemChromeSuppression:0];
  [v5 setActivationPolicyForParticipantsBelow:1];
  id v6 = [(SBControlCenterController *)self physicalButtonSceneTargets];
  [v5 setPhysicalButtonSceneTargets:v6];
}

- (id)viewForSystemGestureRecognizer:(id)a3
{
  return self->_window;
}

- (BOOL)isPresentedOrDismissing
{
  uint64_t v3 = [(CCUIMainViewController *)self->_viewController presentationState];
  BOOL result = [(SBControlCenterController *)self isPresented];
  if (v3 == 3) {
    return 1;
  }
  return result;
}

- (BOOL)isDismissedOrDismissing
{
  uint64_t v3 = [(SBControlCenterController *)self viewController];
  if ([v3 presentationState])
  {
    uint64_t v4 = [(SBControlCenterController *)self viewController];
    BOOL v5 = [v4 presentationState] == 3;
  }
  else
  {
    BOOL v5 = 1;
  }

  return v5;
}

- (BOOL)allowGestureForContentBelow
{
  uint64_t v3 = [(SBControlCenterController *)self viewController];
  if ([v3 presentationState])
  {
    uint64_t v4 = [(SBControlCenterController *)self viewController];
    if ([v4 presentationState] == 3)
    {
      BOOL v5 = [(SBControlCenterController *)self viewController];
      BOOL v6 = [v5 transitionState] != 1;
    }
    else
    {
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = 1;
  }

  return v6;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    observers = self->_observers;
    id v8 = v4;
    if (!observers)
    {
      BOOL v6 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
      BOOL v7 = self->_observers;
      self->_observers = v6;

      observers = self->_observers;
    }
    [(NSHashTable *)observers addObject:v8];
    id v4 = v8;
  }
}

- (void)removeObserver:(id)a3
{
}

- (BOOL)handleMenuButtonTap
{
  if ([(SBControlCenterController *)self isPresented]
    || [(SBGrabberTongue *)self->_grabberTongue isVisible])
  {
    uint64_t v3 = [(SBControlCenterController *)self viewController];
    int v4 = [v3 canDismissPresentedContent];

    if (v4)
    {
      BOOL v5 = [(SBControlCenterController *)self viewController];
      [v5 dismissPresentedContent];

      return 1;
    }
    else
    {
      BOOL v6 = 1;
      [(SBControlCenterController *)self dismissAnimated:1];
    }
  }
  else
  {
    if ([(SBControlCenterController *)self isPresentedOrDismissing]) {
      [(SBControlCenterController *)self dismissAnimated:1];
    }
    return 0;
  }
  return v6;
}

- (BOOL)handleIndirectStatusBarAction
{
  BOOL v3 = [(SBControlCenterController *)self _shouldAllowControlCenterGesture];
  if (v3) {
    [(SBControlCenterController *)self presentAnimated:1 completion:0];
  }
  return v3;
}

- (void)presentAnimated:(BOOL)a3
{
}

- (void)dismissAnimated:(BOOL)a3
{
}

- (void)presentAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  [(SBControlCenterController *)self _disableReachability];
  id v7 = [(SBControlCenterController *)self viewController];
  [v7 presentAnimated:v4 withCompletionHandler:v6];
}

- (void)dismissAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = (void (**)(void))a4;
  if ([(SBControlCenterController *)self isPresentedOrDismissing])
  {
    v16[0] = 0;
    v16[1] = v16;
    v16[2] = 0x2020000000;
    char v17 = 0;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __56__SBControlCenterController_dismissAnimated_completion___block_invoke;
    v13[3] = &unk_1E6AFD800;
    char v15 = v16;
    uint64_t v14 = v6;
    id v7 = (void *)MEMORY[0x1D948C7A0](v13);
    [(CCUIMainViewController *)self->_viewController dismissAnimated:v4 withCompletionHandler:v7];
    [MEMORY[0x1E4F4F898] globalSlowDownFactor];
    dispatch_time_t v9 = dispatch_time(0, (uint64_t)(v8 * 450000000.0));
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56__SBControlCenterController_dismissAnimated_completion___block_invoke_2;
    block[3] = &unk_1E6AF5300;
    id v12 = v7;
    id v10 = v7;
    dispatch_after(v9, MEMORY[0x1E4F14428], block);

    _Block_object_dispose(v16, 8);
  }
  else
  {
    if ([(SBGrabberTongue *)self->_grabberTongue isVisible]) {
      [(SBGrabberTongue *)self->_grabberTongue dismissWithStyle:0 animated:v4];
    }
    if (v6) {
      v6[2](v6);
    }
  }
}

uint64_t __56__SBControlCenterController_dismissAnimated_completion___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(*(void *)(result + 40) + 8);
  if (!*(unsigned char *)(v1 + 24))
  {
    *(unsigned char *)(v1 + 24) = 1;
    BOOL result = *(void *)(result + 32);
    if (result) {
      return (*(uint64_t (**)(void))(result + 16))();
    }
  }
  return result;
}

uint64_t __56__SBControlCenterController_dismissAnimated_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setSensorActivityDataProvider:(id)a3
{
  p_sensorActivityDataProvider = &self->_sensorActivityDataProvider;
  id v5 = a3;
  objc_storeWeak((id *)p_sensorActivityDataProvider, v5);
  [v5 addObserver:self];
  [(SBControlCenterController *)self activityDidChangeForSensorActivityDataProvider:v5];
}

- (void)windowSceneDidConnect:(id)a3
{
  [(SBControlCenterController *)self _updateWindowForScene:a3];
  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 postNotificationName:@"SBControlCenterControllerWindowSceneDidConnect" object:self];
}

- (void)_requirePresentGestureRecognizerToFailForGestureRecognizer:(id)a3
{
  id v5 = a3;
  id v4 = [(SBGrabberTongue *)self->_grabberTongue edgePullGestureRecognizer];
  [v5 requireGestureRecognizerToFail:v4];

  if (self->_statusBarPullGestureRecognizer) {
    objc_msgSend(v5, "requireGestureRecognizerToFail:");
  }
}

- (void)_requireGestureRecognizerToFailForPresentGestureRecognizer:(id)a3
{
  id v6 = a3;
  id v4 = [(SBGrabberTongue *)self->_grabberTongue edgePullGestureRecognizer];
  [v4 requireGestureRecognizerToFail:v6];

  statusBarPullGestureRecognizer = self->_statusBarPullGestureRecognizer;
  if (statusBarPullGestureRecognizer) {
    [(UIPanGestureRecognizer *)statusBarPullGestureRecognizer requireGestureRecognizerToFail:v6];
  }
}

- (id)_presentGestureRecognizers
{
  BOOL v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = [(SBGrabberTongue *)self->_grabberTongue edgePullGestureRecognizer];

  if (v4)
  {
    id v5 = [(SBGrabberTongue *)self->_grabberTongue edgePullGestureRecognizer];
    [v3 addObject:v5];
  }
  if (self->_statusBarPullGestureRecognizer) {
    objc_msgSend(v3, "addObject:");
  }
  id v6 = (void *)[v3 copy];

  return v6;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = (SBIndirectPanGestureRecognizer *)a3;
  id v5 = [(id)SBApp multiDisplayUserInteractionCoordinator];
  id v6 = [v5 activeTouchDownOriginatedWindowScene];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && v6
    && ([(SBControlCenterWindow *)self->_window windowScene],
        id v7 = objc_claimAutoreleasedReturnValue(),
        char v8 = [v7 isEqual:v6],
        v7,
        (v8 & 1) == 0))
  {
    id v12 = SBLogSystemGestureControlCenter();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = [(SBIndirectPanGestureRecognizer *)v4 name];
      *(_DWORD *)buf = 138412290;
      uint64_t v34 = v13;
      _os_log_impl(&dword_1D85BA000, v12, OS_LOG_TYPE_DEFAULT, "Not allowing %@ to begin because it was started from another display", buf, 0xCu);
    }
    BOOL v10 = 0;
    dispatch_time_t v9 = @"NotForCurrentDisplay";
  }
  else if ((SBIndirectPanGestureRecognizer *)self->_statusBarPullGestureRecognizer == v4 {
         || self->_indirectStatusBarPullGestureRecognizer == v4)
  }
  {
    if ([(SBControlCenterController *)self _shouldAllowControlCenterGesture])
    {
      dispatch_time_t v9 = 0;
      int v11 = 1;
    }
    else
    {
      uint64_t v14 = SBLogSystemGestureControlCenter();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D85BA000, v14, OS_LOG_TYPE_DEFAULT, "Not allowing the status bar pull down gesture to begin because the Control Center gesture isn't allowed at all.", buf, 2u);
      }

      int v11 = 0;
      dispatch_time_t v9 = @"ControlCenterNotAllowed";
    }
    if ([(SBControlCenterController *)self _shouldShowGrabberOnFirstSwipe]
      && self->_indirectStatusBarPullGestureRecognizer != v4)
    {
      char v15 = SBLogSystemGestureControlCenter();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D85BA000, v15, OS_LOG_TYPE_DEFAULT, "Not allowing the status bar pull down gesture to begin because we require a grabber on first swipe.", buf, 2u);
      }

      int v11 = 0;
      dispatch_time_t v9 = @"StatusBarGestureNotAllowedBecauseGrabberRequired";
    }
    uint64_t v16 = [(SBGrabberTongue *)self->_grabberTongue edgePullGestureRecognizer];
    if ([v16 state] == 1 || objc_msgSend(v16, "state") == 2 || objc_msgSend(v16, "state") == 3)
    {
      char v17 = SBLogSystemGestureControlCenter();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D85BA000, v17, OS_LOG_TYPE_DEFAULT, "Not allowing the status bar pull down gesture to begin because the screen edge gesture's state is active.", buf, 2u);
      }

      int v11 = 0;
      dispatch_time_t v9 = @"StatusBarGestureNotAllowedBecauseEdgeGestureIsActive";
    }
    if ((SBIndirectPanGestureRecognizer *)self->_statusBarPullGestureRecognizer == v4)
    {
      uint64_t v18 = [(SBControlCenterController *)self viewController];
      uint64_t v19 = [v18 view];
      [(SBIndirectPanGestureRecognizer *)v4 velocityInView:v19];
      double v21 = v20;
      double v23 = v22;

      if (v23 < 0.0 || fabs(v21) > fabs(v23))
      {
        uint64_t v24 = SBLogSystemGestureControlCenter();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D85BA000, v24, OS_LOG_TYPE_DEFAULT, "Preventing the status bar pull down gesture because we're moving up or horizontally.", buf, 2u);
        }

        int v11 = 0;
        dispatch_time_t v9 = @"StatusBarGestureNotAllowedBecauseMovingUpOrHorizontally";
      }
    }
    if (self->_indirectStatusBarPullGestureRecognizer == v4)
    {
      id v25 = [(SBControlCenterController *)self viewForSystemGestureRecognizer:v4];
      [(SBIndirectPanGestureRecognizer *)v4 locationInView:v25];
      if (!-[SBControlCenterController _isLocationXWithinExtendedTrailingStatusBarRegion:](self, "_isLocationXWithinExtendedTrailingStatusBarRegion:"))
      {
        dispatch_time_t v9 = @"StatusBarGestureNotAllowedBecausePointerIsNotInTheTrailingStatusBarRegion";
        int v11 = 0;
      }
    }
    BOOL v10 = v11 != 0;
  }
  else
  {
    dispatch_time_t v9 = 0;
    BOOL v10 = 1;
  }
  double v26 = [MEMORY[0x1E4FA8AA0] sharedInstance];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __58__SBControlCenterController_gestureRecognizerShouldBegin___block_invoke;
  v29[3] = &unk_1E6B02608;
  BOOL v32 = v10;
  CGFloat v30 = v4;
  CGFloat v31 = v9;
  double v27 = v4;
  [v26 logBlock:v29];

  return v10;
}

id __58__SBControlCenterController_gestureRecognizerShouldBegin___block_invoke(uint64_t a1)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  uint64_t v13 = @"[SBControlCenterController gestureRecognizerShouldBegin:]";
  v11[0] = @"shouldBegin";
  v2 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 48)];
  v12[0] = v2;
  v11[1] = @"address";
  BOOL v3 = [NSNumber numberWithUnsignedLong:*(void *)(a1 + 32)];
  v12[1] = v3;
  v11[2] = @"name";
  uint64_t v4 = [*(id *)(a1 + 32) name];
  id v5 = (void *)v4;
  id v6 = &stru_1F3084718;
  if (v4) {
    id v7 = (__CFString *)v4;
  }
  else {
    id v7 = &stru_1F3084718;
  }
  v11[3] = @"failureReason";
  if (*(void *)(a1 + 40)) {
    id v6 = *(__CFString **)(a1 + 40);
  }
  v12[2] = v7;
  v12[3] = v6;
  char v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:4];
  v14[0] = v8;
  dispatch_time_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];

  return v9;
}

id __66__SBControlCenterController_gestureRecognizer_shouldReceiveTouch___block_invoke(uint64_t a1)
{
  v29[1] = *MEMORY[0x1E4F143B8];
  double v28 = @"[SBControlCenterController gestureRecognizer:shouldReceiveTouch:]";
  v26[0] = @"shouldReceiveTouch";
  double v21 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 96)];
  v27[0] = v21;
  v26[1] = @"address";
  double v20 = [NSNumber numberWithUnsignedLong:*(void *)(a1 + 32)];
  v27[1] = v20;
  v26[2] = @"name";
  uint64_t v2 = [*(id *)(a1 + 32) name];
  uint64_t v19 = (void *)v2;
  BOOL v3 = &stru_1F3084718;
  if (v2) {
    BOOL v3 = (__CFString *)v2;
  }
  v27[2] = v3;
  v26[3] = @"location";
  v24[0] = @"x";
  uint64_t v18 = [NSNumber numberWithDouble:*(double *)(a1 + 48)];
  v24[1] = @"y";
  v25[0] = v18;
  char v17 = [NSNumber numberWithDouble:*(double *)(a1 + 56)];
  v25[1] = v17;
  uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:2];
  v27[3] = v16;
  v26[4] = @"statusBarBounds";
  v22[0] = @"x";
  uint64_t v4 = [NSNumber numberWithDouble:*(double *)(a1 + 64)];
  v23[0] = v4;
  v22[1] = @"y";
  id v5 = [NSNumber numberWithDouble:*(double *)(a1 + 72)];
  v23[1] = v5;
  v22[2] = @"width";
  id v6 = [NSNumber numberWithDouble:*(double *)(a1 + 80)];
  v23[2] = v6;
  v22[3] = @"height";
  id v7 = [NSNumber numberWithDouble:*(double *)(a1 + 88)];
  v23[3] = v7;
  char v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:4];
  v27[4] = v8;
  v26[5] = @"reachabilityOffset";
  dispatch_time_t v9 = NSNumber;
  [*(id *)(a1 + 40) _reachabilityOffset];
  BOOL v10 = objc_msgSend(v9, "numberWithDouble:");
  v27[5] = v10;
  v26[6] = @"insideStatusBarBounds";
  int v11 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 97)];
  v27[6] = v11;
  v26[7] = @"inCorrectStatusBarRegion";
  id v12 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 98)];
  v27[7] = v12;
  uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:8];
  v29[0] = v13;
  uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:&v28 count:1];

  return v14;
}

- (void)handleReachabilityModeActivated
{
  BOOL v3 = [(SBControlCenterController *)self viewController];
  [v3 setReachabilityActive:1];

  statusBarPullGestureRecognizer = self->_statusBarPullGestureRecognizer;
  id v5 = [(SBGrabberTongue *)self->_grabberTongue edgePullGestureRecognizer];
  [(UIPanGestureRecognizer *)statusBarPullGestureRecognizer requireGestureRecognizerToFail:v5];
}

- (void)handleReachabilityModeDeactivated
{
  BOOL v3 = [(SBControlCenterController *)self viewController];
  [v3 setReachabilityActive:0];

  statusBarPullGestureRecognizer = self->_statusBarPullGestureRecognizer;
  id v5 = [(SBGrabberTongue *)self->_grabberTongue edgePullGestureRecognizer];
  [(UIPanGestureRecognizer *)statusBarPullGestureRecognizer removeFailureRequirement:v5];
}

- (void)handleReachabilityYOffsetDidChange
{
  BOOL v3 = [(SBControlCenterController *)self viewController];
  uint64_t v4 = [v3 view];
  [v4 setNeedsLayout];

  id v6 = [(SBControlCenterController *)self viewController];
  id v5 = [v6 view];
  [v5 layoutIfNeeded];
}

- (void)handleDidEndReachabilityAnimation
{
  id v2 = [(SBControlCenterController *)self viewController];
  [v2 reachabilityAnimationDidEnd];
}

- (void)_disableReachability
{
  id v2 = +[SBReachabilityManager sharedInstance];
  [v2 deactivateReachability];
}

- (void)_handleStatusBarPullDownGesture:(id)a3
{
  uint64_t v4 = (SBIndirectPanGestureRecognizer *)a3;
  id v5 = [(SBControlCenterController *)self viewController];
  id v6 = [v5 view];
  [(SBIndirectPanGestureRecognizer *)v4 locationInView:v6];
  double v8 = v7;
  double v10 = v9;

  int v11 = [(SBControlCenterController *)self viewController];
  id v12 = [v11 view];
  [(SBIndirectPanGestureRecognizer *)v4 translationInView:v12];
  double v14 = v13;
  double v16 = v15;

  char v17 = [(SBControlCenterController *)self viewController];
  uint64_t v18 = [v17 view];
  [(SBIndirectPanGestureRecognizer *)v4 velocityInView:v18];
  double v20 = v19;
  double v22 = v21;

  if ([(SBControlCenterController *)self isDismissedOrDismissing])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v23 = v4;
      uint64_t v24 = [(SBControlCenterController *)self viewController];
      id v25 = [v24 view];
      -[SBIndirectPanGestureRecognizer setTranslation:inView:](v23, "setTranslation:inView:", v25, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
    }
    [(SBControlCenterController *)self _reachabilityOffset];
    if (v10 >= v26)
    {
      if ((SBIndirectPanGestureRecognizer *)self->_statusBarPullGestureRecognizer == v4)
      {
        uint64_t v29 = [(SBControlCenterController *)self viewController];
        CGFloat v30 = [(SBControlCenterController *)self _touchesForGesture:v4];
        objc_msgSend(v29, "beginPresentationWithLocation:translation:velocity:touches:", v30, v8, v10, v14, v16, v20, v22);
      }
      else if (self->_indirectStatusBarPullGestureRecognizer == v4 {
             && !self->_indirectStatusBarPullGestureCalledBegin
      }
             && v16 != 0.0)
      {
        double v27 = [(SBControlCenterController *)self viewController];
        double v28 = [(SBControlCenterController *)self _touchesForGesture:v4];
        objc_msgSend(v27, "beginPresentationWithLocation:translation:velocity:touches:", v28, v8, v10, v14, v16, v20, v22);

        self->_indirectStatusBarPullGestureCalledBegin = 1;
      }
    }
  }
  if ([(SBIndirectPanGestureRecognizer *)v4 state] == 1)
  {
    [(SBControlCenterController *)self restrictSystemApertureToType:1 withReason:@"Control Center Presentation Began"];
  }
  else if ([(SBIndirectPanGestureRecognizer *)v4 state] == 3 {
         || [(SBIndirectPanGestureRecognizer *)v4 state] == 4
  }
         || [(SBIndirectPanGestureRecognizer *)v4 state] == 5)
  {
    if ([(SBControlCenterController *)self isPresented]) {
      [(SBControlCenterController *)self restrictSystemApertureToType:0 withReason:@"Control Center Presented"];
    }
    [(SBControlCenterController *)self invalidateSystemApertureAssertionForType:1 withReason:@"Control Center Presentation Ended"];
  }
  CGFloat v31 = [(SBControlCenterController *)self viewController];
  uint64_t v32 = [v31 presentationState];

  if (v32)
  {
    switch([(SBIndirectPanGestureRecognizer *)v4 state])
    {
      case 1:
        BOOL v33 = SBLogTelemetrySignposts();
        if (os_signpost_enabled(v33))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1D85BA000, v33, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SB_CONTROL_CENTER_GESTURE", " enableTelemetry=YES  isAnimation=YES ", buf, 2u);
        }

        kdebug_trace();
        self->_presentationGestureContinuedIntoPaging = 0;
        break;
      case 2:
        if ((SBIndirectPanGestureRecognizer *)self->_statusBarPullGestureRecognizer == v4
          || self->_indirectStatusBarPullGestureRecognizer == v4 && self->_indirectStatusBarPullGestureCalledBegin)
        {
          uint64_t v34 = [(SBControlCenterController *)self viewController];
          objc_msgSend(v34, "updatePresentationWithLocation:translation:velocity:", v8, v10, v14, v16, v20, v22);
        }
        break;
      case 3:
        goto LABEL_29;
      case 4:
        if (self->_presentationGestureContinuedIntoPaging)
        {
LABEL_29:
          *(_WORD *)&self->_indirectStatusBarPullGestureCalledBegin = 0;
          double v35 = fabs(v22 * 0.03);
          if (self->_indirectStatusBarPullGestureRecognizer != v4) {
            double v35 = -0.0;
          }
          double v36 = v16 + v35;
          v37 = [(SBControlCenterController *)self viewController];
          objc_msgSend(v37, "endPresentationWithLocation:translation:velocity:", v8, v10, v14, v36, v20, v22);

          if ([(SBControlCenterController *)self isPresented]) {
            [(SBControlCenterController *)self _disableReachability];
          }
          id v38 = SBLogTelemetrySignposts();
          if (os_signpost_enabled(v38))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1D85BA000, v38, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SB_CONTROL_CENTER_GESTURE", " enableTelemetry=YES  isAnimation=YES ", buf, 2u);
          }

          kdebug_trace();
          v39 = [MEMORY[0x1E4FA8AA0] sharedInstance];
          v42[0] = MEMORY[0x1E4F143A8];
          v42[1] = 3221225472;
          v42[2] = __61__SBControlCenterController__handleStatusBarPullDownGesture___block_invoke;
          v42[3] = &unk_1E6B02658;
          *(double *)&v42[5] = v8;
          *(double *)&v42[6] = v10;
          *(double *)&v42[7] = v14;
          *(double *)&v42[8] = v36;
          *(double *)&v42[9] = v20;
          *(double *)&v42[10] = v22;
          v42[4] = self;
          [v39 logBlock:v42];
        }
        else
        {
          self->_indirectStatusBarPullGestureCalledBegin = 0;
          v40 = [(SBControlCenterController *)self viewController];
          objc_msgSend(v40, "cancelPresentationWithLocation:translation:velocity:", v8, v10, v14, v16, v20, v22);

          if ([(SBControlCenterController *)self isPresented]) {
            [(SBControlCenterController *)self _disableReachability];
          }
          uint64_t v41 = SBLogTelemetrySignposts();
          if (os_signpost_enabled(v41))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1D85BA000, v41, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SB_CONTROL_CENTER_GESTURE", " enableTelemetry=YES  isAnimation=YES ", buf, 2u);
          }

          kdebug_trace();
        }
        break;
      case 5:
        *(_WORD *)&self->_indirectStatusBarPullGestureCalledBegin = 0;
        break;
      default:
        break;
    }
  }
}

id __61__SBControlCenterController__handleStatusBarPullDownGesture___block_invoke(uint64_t a1)
{
  v24[1] = *MEMORY[0x1E4F143B8];
  double v23 = @"[SBControlCenterController _handleStatusBarPullDownGesture:]";
  v21[0] = @"location";
  v19[0] = @"x";
  double v14 = [NSNumber numberWithDouble:*(double *)(a1 + 40)];
  v19[1] = @"y";
  v20[0] = v14;
  double v13 = [NSNumber numberWithDouble:*(double *)(a1 + 48)];
  v20[1] = v13;
  id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];
  v22[0] = v12;
  v21[1] = @"translation";
  v17[0] = @"x";
  id v2 = [NSNumber numberWithDouble:*(double *)(a1 + 56)];
  v17[1] = @"y";
  v18[0] = v2;
  BOOL v3 = [NSNumber numberWithDouble:*(double *)(a1 + 64)];
  v18[1] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];
  v22[1] = v4;
  v21[2] = @"velocity";
  v15[0] = @"x";
  id v5 = [NSNumber numberWithDouble:*(double *)(a1 + 72)];
  v15[1] = @"y";
  v16[0] = v5;
  id v6 = [NSNumber numberWithDouble:*(double *)(a1 + 80)];
  v16[1] = v6;
  double v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
  v22[2] = v7;
  v21[3] = @"presented";
  double v8 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "isPresented"));
  v22[3] = v8;
  double v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:4];
  v24[0] = v9;
  double v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];

  return v10;
}

- (void)_setDisplayLayoutElementActive:(BOOL)a3
{
  displayLayoutAssertion = self->_displayLayoutAssertion;
  if (a3)
  {
    if (displayLayoutAssertion) {
      return;
    }
    id v5 = objc_alloc(MEMORY[0x1E4FA6A68]);
    int v11 = (void *)[v5 initWithIdentifier:*MEMORY[0x1E4F625A8]];
    [(SBControlCenterWindow *)self->_window level];
    [v11 setLevel:(uint64_t)v6];
    [v11 setFillsDisplayBounds:1];
    [v11 setLayoutRole:4];
    double v7 = [MEMORY[0x1E4F62438] sharedInstance];
    double v8 = [v7 addElement:v11];
    double v9 = self->_displayLayoutAssertion;
    self->_displayLayoutAssertion = v8;

    double v10 = (BSInvalidatable *)v11;
  }
  else
  {
    if (!displayLayoutAssertion) {
      return;
    }
    [(BSInvalidatable *)displayLayoutAssertion invalidate];
    double v10 = self->_displayLayoutAssertion;
    self->_displayLayoutAssertion = 0;
  }
}

- (BOOL)grabberTongue:(id)a3 shouldAllowSecondSwipeWithEdgeLocation:(double)a4
{
  id v6 = a3;
  if ([(SBControlCenterController *)self presentingEdge] == 1) {
    char v7 = 1;
  }
  else {
    char v7 = [v6 isEdgeLocationInGrabberRegion:a4];
  }

  return v7;
}

- (BOOL)grabberTongueHonorsAmbiguousActivationMargin:(id)a3
{
  return [(SBControlCenterController *)self presentingEdge] == 4;
}

id __62__SBControlCenterController_grabberTongue_shouldReceiveTouch___block_invoke(uint64_t a1)
{
  v21[1] = *MEMORY[0x1E4F143B8];
  double v20 = @"[SBControlCenterController grabberTongue:shouldReceiveTouch:]";
  v18[0] = @"shouldReceiveTouch";
  id v2 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 56)];
  v19[0] = v2;
  v18[1] = @"address";
  BOOL v3 = NSNumber;
  uint64_t v4 = [*(id *)(a1 + 32) edgePullGestureRecognizer];
  id v5 = [v3 numberWithUnsignedLong:v4];
  v19[1] = v5;
  void v18[2] = @"name";
  id v6 = [*(id *)(a1 + 32) edgePullGestureRecognizer];
  uint64_t v7 = [v6 name];
  double v8 = (void *)v7;
  double v9 = &stru_1F3084718;
  if (v7) {
    double v9 = (__CFString *)v7;
  }
  void v19[2] = v9;
  v18[3] = @"location";
  v16[0] = @"x";
  double v10 = [NSNumber numberWithDouble:*(double *)(a1 + 40)];
  v16[1] = @"y";
  v17[0] = v10;
  int v11 = [NSNumber numberWithDouble:*(double *)(a1 + 48)];
  v17[1] = v11;
  id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];
  v19[3] = v12;
  double v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:4];
  v21[0] = v13;
  double v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];

  return v14;
}

- (void)grabberTongueWillPresent:(id)a3
{
  [(SBControlCenterController *)self _updateWindowOrientation];
  [(SBControlCenterController *)self _updateWindowVisibility];
}

- (void)grabberTongueBeganPulling:(id)a3 withDistance:(double)a4 andVelocity:(double)a5 andGesture:(id)a6
{
  id v8 = a6;
  id v9 = a3;
  double v10 = SBLogTelemetrySignposts();
  if (os_signpost_enabled(v10))
  {
    *(_WORD *)id v25 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D85BA000, v10, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SB_CONTROL_CENTER_GESTURE", " enableTelemetry=YES  isAnimation=YES ", v25, 2u);
  }

  kdebug_trace();
  self->_presentationGestureContinuedIntoPaging = 0;
  [(SBControlCenterController *)self _disableReachability];
  [(SBControlCenterController *)self restrictSystemApertureToType:1 withReason:@"Control Center Presentation Began"];
  [v9 dismissWithStyle:0 animated:1];

  int v11 = [(SBControlCenterController *)self viewController];
  [(SBControlCenterController *)self _presentGestureLocationInView];
  double v13 = v12;
  double v15 = v14;
  [(SBControlCenterController *)self _presentGestureTranslationInView:1];
  double v17 = v16;
  double v19 = v18;
  [(SBControlCenterController *)self _presentGestureVelocityInView];
  double v21 = v20;
  double v23 = v22;
  uint64_t v24 = [(SBControlCenterController *)self _touchesForGesture:v8];

  objc_msgSend(v11, "beginPresentationWithLocation:translation:velocity:touches:", v24, v13, v15, v17, v19, v21, v23);
}

- (void)grabberTongueUpdatedPulling:(id)a3 withDistance:(double)a4 andVelocity:(double)a5 andGesture:(id)a6
{
  id v17 = [(SBControlCenterController *)self viewController];
  [(SBControlCenterController *)self _presentGestureLocationInView];
  double v8 = v7;
  double v10 = v9;
  [(SBControlCenterController *)self _presentGestureTranslationInView:0];
  double v12 = v11;
  double v14 = v13;
  [(SBControlCenterController *)self _presentGestureVelocityInView];
  objc_msgSend(v17, "updatePresentationWithLocation:translation:velocity:", v8, v10, v12, v14, v15, v16);
}

- (void)grabberTongueEndedPulling:(id)a3 withDistance:(double)a4 andVelocity:(double)a5 andGesture:(id)a6
{
  self->_presentationGestureContinuedIntoPaging = 0;
  [(SBControlCenterController *)self _presentGestureLocationInView];
  double v8 = v7;
  double v10 = v9;
  [(SBControlCenterController *)self _presentGestureTranslationInView:0];
  double v12 = v11;
  double v14 = v13;
  [(SBControlCenterController *)self _presentGestureVelocityInView];
  double v16 = v15;
  double v18 = v17;
  double v19 = [(SBControlCenterController *)self viewController];
  objc_msgSend(v19, "endPresentationWithLocation:translation:velocity:", v8, v10, v12, v14, v16, v18);

  if ([(SBControlCenterController *)self isPresented]) {
    [(SBControlCenterController *)self _disableReachability];
  }
  if ([(SBControlCenterController *)self isPresented]) {
    [(SBControlCenterController *)self restrictSystemApertureToType:0 withReason:@"Control Center Presented"];
  }
  [(SBControlCenterController *)self invalidateSystemApertureAssertionForType:1 withReason:@"Control Center Presentation Ended"];
  double v20 = SBLogTelemetrySignposts();
  if (os_signpost_enabled(v20))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D85BA000, v20, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SB_CONTROL_CENTER_GESTURE", " enableTelemetry=YES  isAnimation=YES ", buf, 2u);
  }

  kdebug_trace();
  double v21 = [MEMORY[0x1E4FA8AA0] sharedInstance];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __91__SBControlCenterController_grabberTongueEndedPulling_withDistance_andVelocity_andGesture___block_invoke;
  v22[3] = &unk_1E6B02658;
  *(double *)&v22[5] = v8;
  *(double *)&v22[6] = v10;
  *(double *)&v22[7] = v12;
  *(double *)&v22[8] = v14;
  *(double *)&v22[9] = v16;
  *(double *)&v22[10] = v18;
  void v22[4] = self;
  [v21 logBlock:v22];
}

id __91__SBControlCenterController_grabberTongueEndedPulling_withDistance_andVelocity_andGesture___block_invoke(uint64_t a1)
{
  v24[1] = *MEMORY[0x1E4F143B8];
  double v23 = @"[SBControlCenterController grabberTongueEndedPulling:withDistance:andVelocity:]";
  v21[0] = @"location";
  v19[0] = @"x";
  double v14 = [NSNumber numberWithDouble:*(double *)(a1 + 40)];
  v19[1] = @"y";
  v20[0] = v14;
  double v13 = [NSNumber numberWithDouble:*(double *)(a1 + 48)];
  v20[1] = v13;
  double v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];
  v22[0] = v12;
  v21[1] = @"translation";
  v17[0] = @"x";
  id v2 = [NSNumber numberWithDouble:*(double *)(a1 + 56)];
  v17[1] = @"y";
  v18[0] = v2;
  BOOL v3 = [NSNumber numberWithDouble:*(double *)(a1 + 64)];
  v18[1] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];
  v22[1] = v4;
  void v21[2] = @"velocity";
  v15[0] = @"x";
  id v5 = [NSNumber numberWithDouble:*(double *)(a1 + 72)];
  v15[1] = @"y";
  v16[0] = v5;
  id v6 = [NSNumber numberWithDouble:*(double *)(a1 + 80)];
  v16[1] = v6;
  double v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
  v22[2] = v7;
  v21[3] = @"presented";
  double v8 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "isPresented"));
  v22[3] = v8;
  double v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:4];
  v24[0] = v9;
  double v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];

  return v10;
}

- (void)grabberTongueCanceledPulling:(id)a3 withDistance:(double)a4 andVelocity:(double)a5 andGesture:(id)a6
{
  if (self->_presentationGestureContinuedIntoPaging)
  {
    [(SBControlCenterController *)self grabberTongueEndedPulling:a3 withDistance:a6 andVelocity:a4 andGesture:a5];
  }
  else
  {
    [(SBControlCenterController *)self _disableReachability];
    double v7 = [(SBControlCenterController *)self viewController];
    [(SBControlCenterController *)self _presentGestureLocationInView];
    double v9 = v8;
    double v11 = v10;
    [(SBControlCenterController *)self _presentGestureTranslationInView:0];
    double v13 = v12;
    double v15 = v14;
    [(SBControlCenterController *)self _presentGestureVelocityInView];
    objc_msgSend(v7, "cancelPresentationWithLocation:translation:velocity:", v9, v11, v13, v15, v16, v17);

    if ([(SBControlCenterController *)self isPresented]) {
      [(SBControlCenterController *)self restrictSystemApertureToType:0 withReason:@"Control Center Presented"];
    }
    [(SBControlCenterController *)self invalidateSystemApertureAssertionForType:1 withReason:@"Control Center Presentation Ended"];
    double v18 = SBLogTelemetrySignposts();
    if (os_signpost_enabled(v18))
    {
      *(_WORD *)double v19 = 0;
      _os_signpost_emit_with_name_impl(&dword_1D85BA000, v18, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SB_CONTROL_CENTER_GESTURE", " enableTelemetry=YES  isAnimation=YES ", v19, 2u);
    }

    kdebug_trace();
  }
}

- (id)customGestureRecognizerForGrabberTongue:(id)a3
{
  unint64_t v3 = [(SBControlCenterController *)self presentingEdge];
  if (v3 == 4) {
    uint64_t v4 = 2;
  }
  else {
    uint64_t v4 = 6;
  }
  id v5 = [[SBScreenEdgePanGestureRecognizer alloc] initWithTarget:0 action:0 type:v4 options:0];
  [(UIScreenEdgePanGestureRecognizer *)v5 setEdges:v3];
  return v5;
}

- (void)controlCenterViewController:(id)a3 wantsHostStatusBarHidden:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  hideStatusBarAssertion = self->_hideStatusBarAssertion;
  if (v4)
  {
    if (hideStatusBarAssertion) {
      goto LABEL_7;
    }
    id v13 = v6;
    double v8 = [(UIWindow *)self->_window _sbWindowScene];
    double v9 = [v8 statusBarManager];
    double v10 = [v9 assertionManager];
    double v11 = [v10 acquireHideFrontmostStatusBarAssertionForReason:@"Control Center Transitioning"];
    double v12 = self->_hideStatusBarAssertion;
    self->_hideStatusBarAssertion = v11;
  }
  else
  {
    if (!hideStatusBarAssertion) {
      goto LABEL_7;
    }
    id v13 = v6;
    [(BSSimpleAssertion *)hideStatusBarAssertion invalidate];
    double v8 = self->_hideStatusBarAssertion;
    self->_hideStatusBarAssertion = 0;
  }

  id v6 = v13;
LABEL_7:
}

- (id)reachabilitySpringAnimationBehaviorForControlCenterViewController:(id)a3
{
  unint64_t v3 = +[SBReachabilityDomain rootSettings];
  BOOL v4 = [v3 animationSettings];

  return v4;
}

- (void)controlCenterViewController:(id)a3 didChangePresentationState:(unint64_t)a4
{
  id v6 = a3;
  switch(a4)
  {
    case 0uLL:
      [(SBControlCenterController *)self _didEndTransition];
      [(SBControlCenterController *)self _didDismiss];
      break;
    case 1uLL:
      [(SBControlCenterController *)self _willBeginTransition];
      [(SBControlCenterController *)self _willPresent];
      [(SBControlCenterController *)self _updateWindowVisibility];
      break;
    case 2uLL:
      [(SBControlCenterController *)self _didEndTransition];
      [(SBControlCenterController *)self _didPresent];
      double v7 = (void *)MEMORY[0x1E4F42FF0];
      uint64_t v14 = MEMORY[0x1E4F143A8];
      uint64_t v15 = 3221225472;
      double v16 = __84__SBControlCenterController_controlCenterViewController_didChangePresentationState___block_invoke;
      double v17 = &unk_1E6AF4AC0;
      double v18 = self;
      double v8 = &v14;
      goto LABEL_6;
    case 3uLL:
      [(SBControlCenterController *)self _willDismiss];
      [(SBControlCenterController *)self _updateWindowVisibility];
      double v7 = (void *)MEMORY[0x1E4F42FF0];
      uint64_t v9 = MEMORY[0x1E4F143A8];
      uint64_t v10 = 3221225472;
      double v11 = __84__SBControlCenterController_controlCenterViewController_didChangePresentationState___block_invoke_2;
      double v12 = &unk_1E6AF4AC0;
      id v13 = self;
      double v8 = &v9;
LABEL_6:
      objc_msgSend(v7, "animateWithDuration:animations:", v8, 0.35, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18);
      break;
    default:
      break;
  }
  [(SBControlCenterController *)self _updateWindowContentHitTesting];
}

uint64_t __84__SBControlCenterController_controlCenterViewController_didChangePresentationState___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setStatusBarHidden:1];
}

uint64_t __84__SBControlCenterController_controlCenterViewController_didChangePresentationState___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setStatusBarHidden:0];
}

- (void)controlCenterViewController:(id)a3 significantPresentationProgressChange:(double)a4
{
  id v15 = a3;
  id v5 = self->_homeAffordanceViewController;
  if (BSFloatGreaterThanOrEqualToFloat())
  {
    if (v5)
    {
      uint64_t v6 = 1;
LABEL_9:
      [(SBBarSwipeAffordanceViewController *)v5 setWantsToBeActiveAffordance:v6];
      goto LABEL_10;
    }
    if (!self->_zStackParticipant)
    {
      uint64_t v9 = [(UIWindow *)self->_window _sbWindowScene];
      uint64_t v10 = [v9 zStackResolver];

      double v11 = [v10 acquireParticipantWithIdentifier:19 delegate:self];
      zStackParticipant = self->_zStackParticipant;
      self->_zStackParticipant = v11;

      [(SBControlCenterController *)self zStackParticipantDidChange:self->_zStackParticipant];
    }
  }
  else
  {
    if ((BSFloatIsZero() & 1) == 0 && v5)
    {
      double v7 = [(SBBarSwipeAffordanceViewController *)v5 view];
      uint64_t v6 = [v7 isTrackingHomeGestureOfType:1];

      goto LABEL_9;
    }
    if (v5)
    {
      uint64_t v6 = 0;
      goto LABEL_9;
    }
    id v13 = self->_zStackParticipant;
    if (v13)
    {
      [(SBFZStackParticipant *)v13 invalidate];
      uint64_t v14 = self->_zStackParticipant;
      self->_zStackParticipant = 0;
    }
  }
LABEL_10:
  if (self->_asynchronousRenderingAssertion
    && BSFloatIsZero()
    && [v15 transitionState] == 2
    && [v15 presentationState] == 3)
  {
    [(BSSimpleAssertion *)self->_asynchronousRenderingAssertion invalidate];
    asynchronousRenderingAssertion = self->_asynchronousRenderingAssertion;
    self->_asynchronousRenderingAssertion = 0;
  }
  [(SBControlCenterController *)self _updateWindowContentHitTesting];
}

- (void)controlCenterViewControllerWillContinuePresentationIntoPaging:(id)a3
{
  BOOL v4 = SBLogSystemGestureControlCenter();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "Control Center will continue presentation gesture into paging", v5, 2u);
  }

  self->_presentationGestureContinuedIntoPaging = 1;
}

- (void)controlCenterViewController:(id)a3 didUpdateHomeGestureDismissalAllowed:(BOOL)a4
{
}

- (void)willOpenExpandedModuleForControlCenterViewController:(id)a3
{
  id v3 = +[SBReachabilityManager sharedInstance];
  [v3 setReachabilityTemporarilyDisabled:1 forReason:@"Control Center Module"];
}

- (void)didCloseExpandedModuleForControlCenterViewController:(id)a3
{
  id v3 = +[SBReachabilityManager sharedInstance];
  [v3 setReachabilityTemporarilyDisabled:0 forReason:@"Control Center Module"];
}

- (void)didRequestPowerDownTransientOverlayForControlCenterViewController:(id)a3
{
  id v3 = +[SBWorkspace mainWorkspace];
  [v3 presentPowerDownTransientOverlay];
}

- (void)_willBeginTransition
{
  id v3 = +[SBIdleTimerGlobalCoordinator sharedInstance];
  BOOL v4 = [v3 acquireIdleTimerDisableAssertionForReason:@"Control Center Transitioning"];
  idleTimerDisableAssertion = self->_idleTimerDisableAssertion;
  self->_idleTimerDisableAssertion = v4;

  bannerSuppressionAssertion = self->_bannerSuppressionAssertion;
  if (bannerSuppressionAssertion) {
    [(BSInvalidatable *)bannerSuppressionAssertion invalidate];
  }
  id v9 = [(id)SBApp bannerManager];
  double v7 = [v9 acquireBannerSuppressionAssertionForReason:@"Control Center Transitioning"];
  double v8 = self->_bannerSuppressionAssertion;
  self->_bannerSuppressionAssertion = v7;
}

- (void)_didEndTransition
{
  [(BSInvalidatable *)self->_idleTimerDisableAssertion invalidate];
  idleTimerDisableAssertion = self->_idleTimerDisableAssertion;
  self->_idleTimerDisableAssertion = 0;

  [(BSInvalidatable *)self->_bannerSuppressionAssertion invalidate];
  bannerSuppressionAssertion = self->_bannerSuppressionAssertion;
  self->_bannerSuppressionAssertion = 0;
}

- (void)_willPresent
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1D85BA000, log, OS_LOG_TYPE_ERROR, "SBControlCenterController had to enable UIView animations because they were disabled", v1, 2u);
}

uint64_t __41__SBControlCenterController__willPresent__block_invoke(uint64_t a1, void *a2)
{
  return [a2 controlCenterWillPresent];
}

- (void)_didPresent
{
  [(SBControlCenterController *)self _updateWindowVisibility];
  id v14 = [(SBControlCenterController *)self _coverSheetViewController];
  [v14 externalBehaviorProviderBehaviorChanged:self];
  [v14 externalPresentationProviderPresentationChanged:self];
  id v3 = [(SBControlCenterController *)self idleTimerCoordinator];
  BOOL v4 = [(SBControlCenterController *)self coordinatorRequestedIdleTimerBehavior:v3];
  id v5 = (id)[v3 idleTimerProvider:self didProposeBehavior:v4 forReason:@"Control Center Visible"];
  uint64_t v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 postNotificationName:@"SBControlCenterControllerDidPresentNotification" object:self];

  [(SBFWindow *)self->_window makeKeyWindow];
  if (!self->_medusaHostedKeyboardWindowLevelAssertion)
  {
    double v7 = [(SBControlCenterWindow *)self->_window rootViewController];
    double v8 = [v7 _sbWindowScene];
    id v9 = [v8 medusaHostedKeyboardWindowController];
    [(SBControlCenterWindow *)self->_window windowLevel];
    double v11 = (SBMedusaHostedKeyboardWindowLevelAssertion *)[v9 newMedusaHostedKeyboardWindowLevelAssertionWithPriority:3 windowLevel:v10 + 1.0];
    medusaHostedKeyboardWindowLevelAssertion = self->_medusaHostedKeyboardWindowLevelAssertion;
    self->_medusaHostedKeyboardWindowLevelAssertion = v11;
  }
  id v13 = [MEMORY[0x1E4FA5E78] sharedInstance];
  [v13 emitEvent:47];
}

- (void)_willDismiss
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"SBControlCenterControllerWillDismissNotification" object:self];

  [(BSInvalidatable *)self->_keyboardFocusLockAssertion invalidate];
  keyboardFocusLockAssertion = self->_keyboardFocusLockAssertion;
  self->_keyboardFocusLockAssertion = 0;

  [(SBControlCenterController *)self invalidateSystemApertureAssertionForType:0 withReason:@"Control Center Dismissed"];
  [(SBControlCenterController *)self invalidateSystemApertureAssertionForType:1 withReason:@"Control Center Dismissed"];
}

- (void)_didDismiss
{
  if (self->_keyboardFocusLockAssertion)
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"SBControlCenterController.m" lineNumber:1133 description:@"skipped _willDismiss"];
  }
  [(SBControlCenterController *)self _clearInactiveMicModeSelectionSensorActivityData];
  [(BSInvalidatable *)self->_deferOrientationUpdatesAssertion invalidate];
  deferOrientationUpdatesAssertion = self->_deferOrientationUpdatesAssertion;
  self->_deferOrientationUpdatesAssertion = 0;

  [(BSSimpleAssertion *)self->_asynchronousRenderingAssertion invalidate];
  asynchronousRenderingAssertion = self->_asynchronousRenderingAssertion;
  self->_asynchronousRenderingAssertion = 0;

  id v5 = +[SBReachabilityManager sharedInstance];
  [v5 setReachabilityTemporarilyDisabled:0 forReason:@"Landscape Control Center"];

  [(SBControlCenterController *)self _enumerateObservers:&__block_literal_global_212];
  uint64_t v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 postNotificationName:@"SBControlCenterControllerDidDismissNotification" object:self];

  [(UIApplicationSceneDeactivationAssertion *)self->_resignActiveAssertion relinquish];
  [(SBControlCenterController *)self _setDisplayLayoutElementActive:0];
  double v7 = [(SBControlCenterController *)self _lockScreenManager];
  int v8 = [v7 isUILocked];

  if (v8) {
    BKSHIDServicesAmbientLightSensorDisableAutoBrightness();
  }
  id v9 = [(SBControlCenterWindow *)self->_window rootViewController];
  objc_msgSend(v9, "bs_beginAppearanceTransition:animated:", 0, 0);

  double v10 = [(SBControlCenterWindow *)self->_window rootViewController];
  [v10 endAppearanceTransition];

  [(SBControlCenterController *)self _updateWindowVisibility];
  id v14 = [(SBControlCenterController *)self _coverSheetViewController];
  [v14 externalBehaviorProviderBehaviorChanged:self];
  [v14 externalPresentationProviderPresentationChanged:self];
  [(SBMedusaHostedKeyboardWindowLevelAssertion *)self->_medusaHostedKeyboardWindowLevelAssertion invalidate];
  medusaHostedKeyboardWindowLevelAssertion = self->_medusaHostedKeyboardWindowLevelAssertion;
  self->_medusaHostedKeyboardWindowLevelAssertion = 0;

  [(SBFWindow *)self->_window resignAsKeyWindow];
}

uint64_t __40__SBControlCenterController__didDismiss__block_invoke(uint64_t a1, void *a2)
{
  return [a2 controlCenterDidDismiss];
}

- (void)_updateWindowOrientation
{
  if ((SBTraitsArbiterOrientationActuationEnabledForRole(@"SBTraitsParticipantRoleControlCenter") & 1) == 0)
  {
    uint64_t v3 = [(id)SBApp activeInterfaceOrientation];
    if ([(SBControlCenterWindow *)self->_window _windowInterfaceOrientation] != v3)
    {
      window = self->_window;
      [(SBControlCenterWindow *)window _legacySetRotatableViewOrientation:v3 updateStatusBar:0 duration:1 force:0.0];
    }
  }
}

- (void)_updateWindowVisibility
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if ([(SBGrabberTongue *)self->_grabberTongue isVisible]
    || ([(SBControlCenterController *)self viewController],
        uint64_t v3 = objc_claimAutoreleasedReturnValue(),
        uint64_t v4 = [v3 presentationState],
        v3,
        v4))
  {
    if ([(SBControlCenterWindow *)self->_window isHidden]) {
      [(SBWindow *)self->_window makeKeyAndVisible];
    }
    int v5 = 0;
  }
  else
  {
    [(SBFWindow *)self->_window resignAsKeyWindow];
    int v5 = 1;
    if (([(SBControlCenterWindow *)self->_window isHidden] & 1) == 0) {
      [(SBWindow *)self->_window setHidden:1];
    }
  }
  uint64_t v6 = SBLogCommon();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    [(SBControlCenterWindow *)self->_window alpha];
    v8[0] = 67109376;
    v8[1] = v5;
    __int16 v9 = 2048;
    uint64_t v10 = v7;
    _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "Updating control center window visibility - hidden:%{BOOL}u alpha:%.2f", (uint8_t *)v8, 0x12u);
  }
}

- (void)_updateWindowContentHitTesting
{
  BOOL v3 = [(SBControlCenterController *)self allowGestureForContentBelow];
  id v5 = [(SBControlCenterWindow *)self->_window rootViewController];
  uint64_t v4 = [v5 viewIfLoaded];
  objc_msgSend(v4, "bs_setHitTestingDisabled:", v3);
}

- (void)_setStatusBarHidden:(BOOL)a3
{
  statusBarAssertion = self->_statusBarAssertion;
  if (a3)
  {
    if (statusBarAssertion) {
      return;
    }
    id v5 = [(UIWindow *)self->_window _sbWindowScene];
    uint64_t v6 = [v5 statusBarManager];
    uint64_t v10 = [v6 assertionManager];

    uint64_t v7 = (SBWindowSceneStatusBarSettingsAssertion *)[(SBWindowSceneStatusBarSettingsAssertion *)v10 newSettingsAssertionWithStatusBarHidden:1 atLevel:11 reason:@"Control Center Visible"];
    int v8 = self->_statusBarAssertion;
    self->_statusBarAssertion = v7;

    [(SBWindowSceneStatusBarSettingsAssertion *)self->_statusBarAssertion acquire];
    __int16 v9 = v10;
  }
  else
  {
    if (!statusBarAssertion) {
      return;
    }
    [(SBWindowSceneStatusBarSettingsAssertion *)statusBarAssertion invalidate];
    __int16 v9 = self->_statusBarAssertion;
    self->_statusBarAssertion = 0;
  }
}

- (void)_clearInactiveMicModeSelectionSensorActivityData
{
  id v2 = [(SBControlCenterController *)self viewController];
  id v3 = [v2 sensorActivityDataProvider];

  if (objc_opt_respondsToSelector()) {
    [v3 setInactiveSensorActivityDataEligibleForMicModeSelection:0];
  }
}

- (id)_controlCenterWindow
{
  return self->_window;
}

- (id)_coverSheetViewController
{
  id v2 = [(UIWindow *)self->_window _sbWindowScene];
  id v3 = [v2 coverSheetViewController];

  return v3;
}

- (id)_switcherController
{
  id v2 = [(UIWindow *)self->_window _sbWindowScene];
  id v3 = [v2 switcherController];

  return v3;
}

- (id)_systemGestureManager
{
  id v2 = [(UIWindow *)self->_window _sbWindowScene];
  id v3 = [v2 systemGestureManager];

  return v3;
}

- (void)_enumerateObservers:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void (**)(id, void))a3;
  NSUInteger v5 = [(NSHashTable *)self->_observers count];
  if (v4 && v5)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v6 = (void *)[(NSHashTable *)self->_observers copy];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          v4[2](v4, *(void *)(*((void *)&v11 + 1) + 8 * v10++));
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }
  }
}

- (void)_screenDidDim
{
  id v3 = [(SBControlCenterController *)self viewController];
  [v3 displayWillTurnOff];

  [(SBControlCenterController *)self dismissAnimated:0];
}

- (void)_uiRelockedNotification:(id)a3
{
}

- (void)_policyAggregatorCapabilitiesDidChange:(id)a3
{
  uint64_t v4 = +[SBSceneManagerCoordinator mainDisplaySceneManager];
  id v5 = [v4 policyAggregator];

  if (([v5 allowsCapability:14] & 1) == 0) {
    [(SBControlCenterController *)self dismissAnimated:1];
  }
}

- (id)_touchesForGesture:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = 0;
  }
  else
  {
    id v5 = [v3 _activeEventOfType:0];
    if (v5)
    {
      uint64_t v6 = [v3 _activeTouchesForEvent:v5];
      uint64_t v4 = [v6 allObjects];

      if (!v4)
      {
        uint64_t v7 = SBLogCommon();
        BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);

        if (v8) {
          NSLog(&cfstr_FailedToFindAc.isa, v3, v5);
        }
      }
    }
    else
    {
      uint64_t v9 = SBLogCommon();
      BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);

      if (v10) {
        NSLog(&cfstr_FailedToFindAn.isa, v3);
      }
      uint64_t v4 = 0;
    }
  }
  return v4;
}

- (CGPoint)_presentGestureLocationInView
{
  id v3 = [(SBGrabberTongue *)self->_grabberTongue edgePullGestureRecognizer];
  uint64_t v4 = [(SBControlCenterController *)self viewController];
  id v5 = [v4 view];
  [v3 locationInView:v5];
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.y = v11;
  result.x = v10;
  return result;
}

- (CGPoint)_presentGestureTranslationInView:(BOOL)a3
{
  BOOL v3 = a3;
  unint64_t v5 = [(SBControlCenterController *)self presentingEdge];
  double v6 = [(SBGrabberTongue *)self->_grabberTongue edgePullGestureRecognizer];
  double v7 = [(SBControlCenterController *)self viewController];
  double v8 = [v7 view];
  if (v3 && v5 == 1)
  {
    double v9 = *MEMORY[0x1E4F1DAD8];
    double v10 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    objc_msgSend(v6, "setTranslation:inView:", v8, *MEMORY[0x1E4F1DAD8], v10);
  }
  else
  {
    [v6 translationInView:v8];
    double v9 = v11;
    double v10 = v12;
  }

  double v13 = v9;
  double v14 = v10;
  result.y = v14;
  result.x = v13;
  return result;
}

- (CGPoint)_presentGestureVelocityInView
{
  BOOL v3 = [(SBGrabberTongue *)self->_grabberTongue edgePullGestureRecognizer];
  uint64_t v4 = [(SBControlCenterController *)self viewController];
  unint64_t v5 = [v4 view];
  [v3 velocityInView:v5];
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.y = v11;
  result.x = v10;
  return result;
}

- (BOOL)_isLocationXWithinExtendedTrailingStatusBarRegion:(double)a3
{
  return [(SBControlCenterController *)self _isLocationXWithinTrailingStatusBarRegion:a3 regionPadding:20.0];
}

id __85__SBControlCenterController__isLocationXWithinTrailingStatusBarRegion_regionPadding___block_invoke(uint64_t a1)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  double v10 = @"[SBControlCenterController _isLocationXWithinTrailingStatusBarRegion:]";
  v8[0] = @"inTrailingStatusBarRegion";
  id v2 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 48)];
  v9[0] = v2;
  v8[1] = @"statusBarWidth";
  BOOL v3 = [NSNumber numberWithDouble:*(double *)(a1 + 32)];
  v9[1] = v3;
  _DWORD v8[2] = @"trailingRegionWidth";
  uint64_t v4 = [NSNumber numberWithDouble:*(double *)(a1 + 40)];
  v9[2] = v4;
  unint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:3];
  v11[0] = v5;
  double v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];

  return v6;
}

- (void)_updateWindowLevelForScene:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [(SBWindowLevelAssertionManager *)self->_windowLevelAssertionManager highestPriorityWindowLevelAssertionForWindowScene:a3];
  unint64_t v5 = SBLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543362;
    double v9 = v4;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "Updating Control Center window level using assertion: %{public}@", (uint8_t *)&v8, 0xCu);
  }

  window = self->_window;
  if (v4) {
    [v4 windowLevel];
  }
  else {
    double v7 = *MEMORY[0x1E4F43CF8] + 30.0;
  }
  [(SBControlCenterWindow *)window setWindowLevel:v7];
}

- (void)_updateWindowForScene:(id)a3
{
  id v4 = a3;
  window = self->_window;
  id v19 = v4;
  if (!window
    || ([(UIWindow *)window _sbWindowScene],
        id v6 = (id)objc_claimAutoreleasedReturnValue(),
        v6,
        double v7 = v19,
        v6 != v19))
  {
    int v8 = self->_homeAffordanceViewController;
    if (!v8)
    {
      int v8 = self->_homeButtonWrapperViewController;
      if (!v8)
      {
        int v8 = [(SBControlCenterController *)self viewController];
      }
    }
    double v9 = [(SBWindow *)[SBControlCenterWindow alloc] initWithWindowScene:v19 rootViewController:v8 role:@"SBTraitsParticipantRoleControlCenter" debugName:@"ControlCenterWindow"];
    uint64_t v10 = self->_window;
    self->_window = v9;

    [(SBControlCenterWindow *)self->_window setWindowLevel:*MEMORY[0x1E4F43CF8] + 30.0];
    double v11 = +[SBReachabilityManager sharedInstance];
    [v11 ignoreWindowForReachability:self->_window];

    [(SBWindow *)self->_window setHidden:1];
    double v12 = [(SBControlCenterWindow *)self->_window rootViewController];
    objc_msgSend(v12, "bs_endAppearanceTransition:", 0);

    unint64_t v13 = [(SBControlCenterController *)self presentingEdge];
    double v14 = [SBGrabberTongue alloc];
    id v15 = [(UIWindow *)self->_window _sbWindowScene];
    uint64_t v16 = [(SBGrabberTongue *)v14 initWithDelegate:self edge:v13 type:6 windowScene:v15];
    grabberTongue = self->_grabberTongue;
    self->_grabberTongue = v16;

    [(SBGrabberTongue *)self->_grabberTongue setName:@"ControlCenterGrabberTongue"];
    [(SBGrabberTongue *)self->_grabberTongue installInView:self->_window withColorStyle:0];
    [(SBControlCenterSystemAgent *)self->_systemAgent setWindowScene:v19];
    double v18 = [(SBControlCenterController *)self _coverSheetViewController];
    [v18 registerExternalBehaviorProvider:self];
    [v18 registerExternalPresentationProvider:self];
    [v18 registerExternalAppearanceProvider:self];
    [(SBControlCenterController *)self _setupGestureRecognizersForUpdatedWindowScene];
    [(SBControlCenterController *)self _setupPhysicalButtonPreferencesForUpdatedWindowScene];

    double v7 = v19;
  }
}

- (void)_setupGestureRecognizersForUpdatedWindowScene
{
  BOOL v3 = [(SBControlCenterController *)self _systemGestureManager];
  unint64_t v4 = [(SBControlCenterController *)self presentingEdge];
  if (v4 == 1)
  {
    unint64_t v5 = (UIPanGestureRecognizer *)[objc_alloc(MEMORY[0x1E4F42C38]) initWithTarget:self action:sel__handleStatusBarPullDownGesture_];
    statusBarPullGestureRecognizer = self->_statusBarPullGestureRecognizer;
    self->_statusBarPullGestureRecognizer = v5;

    [(UIPanGestureRecognizer *)self->_statusBarPullGestureRecognizer setAllowedTouchTypes:&unk_1F3347F28];
    [(UIPanGestureRecognizer *)self->_statusBarPullGestureRecognizer sbf_setPencilTouchesAllowed:_os_feature_enabled_impl()];
    [(UIPanGestureRecognizer *)self->_statusBarPullGestureRecognizer setDelegate:self];
    [v3 addGestureRecognizer:self->_statusBarPullGestureRecognizer withType:7];
    double v7 = [[SBIndirectPanGestureRecognizer alloc] initWithTarget:self action:sel__handleStatusBarPullDownGesture_ edges:1];
    indirectStatusBarPullGestureRecognizer = self->_indirectStatusBarPullGestureRecognizer;
    self->_indirectStatusBarPullGestureRecognizer = v7;

    [(SBIndirectPanGestureRecognizer *)self->_indirectStatusBarPullGestureRecognizer setName:@"indirectPresentControlCenterGestureRecognizer"];
    [(SBIndirectPanGestureRecognizer *)self->_indirectStatusBarPullGestureRecognizer setDelegate:self];
    [(SBIndirectPanGestureRecognizer *)self->_indirectStatusBarPullGestureRecognizer setOrientationProvider:self];
    [(SBIndirectPanGestureRecognizer *)self->_indirectStatusBarPullGestureRecognizer setShouldInvertYAxis:1];
    [(SBIndirectPanGestureRecognizer *)self->_indirectStatusBarPullGestureRecognizer setActivationRecognitionDistance:40.0];
    [(SBIndirectPanGestureRecognizer *)self->_indirectStatusBarPullGestureRecognizer setShouldRequireGestureToStartAtEdge:1];
    [(SBIndirectPanGestureRecognizer *)self->_indirectStatusBarPullGestureRecognizer setHysteresis:0 forInputType:30.0];
    [(SBIndirectPanGestureRecognizer *)self->_indirectStatusBarPullGestureRecognizer setHysteresis:1 forInputType:10.0];
    double v9 = self->_indirectStatusBarPullGestureRecognizer;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    void v19[2] = __74__SBControlCenterController__setupGestureRecognizersForUpdatedWindowScene__block_invoke;
    v19[3] = &unk_1E6B02710;
    void v19[4] = self;
    [(SBIndirectPanGestureRecognizer *)v9 setTranslationAdjustmentBlock:v19];
    uint64_t v10 = +[SBCoverSheetPresentationManager sharedInstance];
    double v11 = [v10 coverSheetSlidingViewController];
    double v12 = [v11 indirectPresentGestureRecognizer];

    [v12 requireGestureRecognizerToFail:self->_indirectStatusBarPullGestureRecognizer];
    [v3 addGestureRecognizer:self->_indirectStatusBarPullGestureRecognizer withType:10];
    [v3 gestureRecognizerOfType:132 shouldBeRequiredToFailByGestureRecognizer:self->_indirectStatusBarPullGestureRecognizer];
  }
  unint64_t v13 = +[SBReachabilityManager sharedInstance];
  [v13 addObserver:self];
  if (v4 == 1)
  {
    double v14 = [v13 dismissPanGestureRecognizer];
    id v15 = v14;
    if (self->_statusBarPullGestureRecognizer) {
      objc_msgSend(v14, "requireGestureRecognizerToFail:");
    }
    uint64_t v16 = [(SBGrabberTongue *)self->_grabberTongue edgePullGestureRecognizer];
    double v17 = v15;
    double v18 = v16;
    goto LABEL_9;
  }
  id v15 = [v13 dismissEdgeGestureRecognizer];
  if (v15)
  {
    double v17 = [(SBGrabberTongue *)self->_grabberTongue edgePullGestureRecognizer];
    uint64_t v16 = v17;
    double v18 = v15;
LABEL_9:
    [v17 requireGestureRecognizerToFail:v18];
  }
}

double __74__SBControlCenterController__setupGestureRecognizersForUpdatedWindowScene__block_invoke(uint64_t a1, double a2)
{
  unint64_t v4 = +[SBPlatformController sharedInstance];
  int v5 = [v4 isRoundCornerPad];

  if (v5)
  {
    id v6 = [*(id *)(a1 + 32) window];
    [v6 bounds];
    CGRectGetWidth(v8);
    SBScreenDisplayCornerRadius();
  }
  return a2;
}

- (void)_setupPhysicalButtonPreferencesForUpdatedWindowScene
{
  BOOL v3 = [(SBControlCenterController *)self window];
  id v19 = [v3 windowScene];

  unint64_t v4 = [v19 _FBSScene];
  int v5 = [v4 identity];

  id v6 = (void *)MEMORY[0x1E4FA5FB8];
  double v7 = [MEMORY[0x1E4F4F7F8] processHandle];
  CGRect v8 = [v7 auditToken];
  double v9 = [v6 targetWithPhysicalButton:1 generation:2 auditToken:v8 identifier:2];

  uint64_t v10 = (void *)MEMORY[0x1E4FA5FB8];
  double v11 = [MEMORY[0x1E4F4F7F8] processHandle];
  double v12 = [v11 auditToken];
  unint64_t v13 = [v10 targetWithPhysicalButton:2 generation:2 auditToken:v12 identifier:2];

  double v14 = [MEMORY[0x1E4FA5FA8] targetWithSceneIdentity:v5];
  [v14 addButtonTarget:v9];
  [v14 addButtonTarget:v13];
  id v15 = (void *)MEMORY[0x1E4F1C978];
  uint64_t v16 = (void *)[v14 copy];
  double v17 = [v15 arrayWithObject:v16];
  physicalButtonSceneTargets = self->_physicalButtonSceneTargets;
  self->_physicalButtonSceneTargets = v17;
}

- (BOOL)canBePresented
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  BOOL v3 = +[SBSceneManagerCoordinator mainDisplaySceneManager];
  unint64_t v4 = [v3 policyAggregator];

  id v57 = 0;
  char v5 = [v4 allowsCapability:14 explanation:&v57];
  id v6 = (__CFString *)v57;
  double v7 = 0;
  if ((v5 & 1) == 0)
  {
    CGRect v8 = SBLogSystemGestureControlCenter();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      double v9 = @"(unknown reason)";
      if (v6) {
        double v9 = v6;
      }
      *(_DWORD *)buf = 138543362;
      v60 = v9;
      _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "Not allowing transition because: %{public}@", buf, 0xCu);
    }

    uint64_t v10 = @"unknown reason";
    if (v6) {
      uint64_t v10 = v6;
    }
    double v7 = [NSString stringWithFormat:@"ControlCenterNotAllowedByPolicyAggregator (%@)", v10];
  }
  double v11 = +[SBLockStateAggregator sharedInstance];
  if ([v11 hasAnyLockState])
  {
    v56 = v6;
    char v12 = [v4 allowsCapability:20 explanation:&v56];
    unint64_t v13 = v56;

    if (v12) {
      goto LABEL_20;
    }
    double v14 = SBLogSystemGestureControlCenter();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = @"(unknown reason)";
      if (v13) {
        id v15 = v13;
      }
      *(_DWORD *)buf = 138543362;
      v60 = v15;
      _os_log_impl(&dword_1D85BA000, v14, OS_LOG_TYPE_DEFAULT, "Not allowing transition while locked because: %{public}@", buf, 0xCu);
    }

    uint64_t v16 = @"unknown reason";
    if (v13) {
      uint64_t v16 = v13;
    }
    [NSString stringWithFormat:@"LockScreenControlCenterNotAllowedByPolicyAggregator (%@)", v16];
    char v5 = 0;
    double v11 = v7;
    double v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    unint64_t v13 = v6;
  }

LABEL_20:
  double v17 = [(SBControlCenterController *)self _lockScreenManager];
  int v18 = [v17 isUILocked];
  char v19 = v18;
  if (v18)
  {
    double v20 = v17;
    double v21 = [v17 lockScreenEnvironment];
    double v22 = [v21 behaviorSuppressor];
    int v23 = [v22 suppressesControlCenter];

    if (v23)
    {
      uint64_t v24 = SBLogSystemGestureControlCenter();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D85BA000, v24, OS_LOG_TYPE_DEFAULT, "Not allowing gesture because lockscreen suppresses CC.", buf, 2u);
      }

      char v5 = 0;
      double v7 = @"ControlCenterNotAllowedBecauseLockScreenSuppressesCC";
    }
    double v17 = v20;
  }
  id v25 = [(SBControlCenterController *)self _transientOverlayPresenter];
  if ([v25 shouldDisableControlCenter])
  {
    double v26 = SBLogSystemGestureControlCenter();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D85BA000, v26, OS_LOG_TYPE_DEFAULT, "Not allowing transition because transient overlay suppresses CC.", buf, 2u);
    }
    char v5 = 0;
    double v27 = v7;
    double v7 = @"ControlCenterNotAllowedBecauseTransientOverlaySuppressesCC";
  }
  else
  {
    double v28 = [(UIWindow *)self->_window _sbWindowScene];
    uint64_t v29 = [v28 switcherController];

    if (v19)
    {
      double v27 = v29;
      goto LABEL_34;
    }
    double v27 = v29;
    if ([(__CFString *)v29 isAnySwitcherVisible]) {
      goto LABEL_34;
    }
    v47 = v13;
    v48 = self;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    double v26 = [(__CFString *)v29 layoutStateApplicationSceneHandles];
    uint64_t v34 = [v26 countByEnumeratingWithState:&v52 objects:v58 count:16];
    if (v34)
    {
      uint64_t v35 = v34;
      v44 = v27;
      v45 = v25;
      v46 = v4;
      uint64_t v36 = *(void *)v53;
      do
      {
        for (uint64_t i = 0; i != v35; ++i)
        {
          if (*(void *)v53 != v36) {
            objc_enumerationMutation(v26);
          }
          id v38 = [*(id *)(*((void *)&v52 + 1) + 8 * i) application];
          if ([v38 suppressesControlCenter])
          {
            v39 = SBLogSystemGestureControlCenter();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
            {
              v40 = [v38 bundleIdentifier];
              *(_DWORD *)buf = 138543362;
              v60 = v40;
              _os_log_impl(&dword_1D85BA000, v39, OS_LOG_TYPE_DEFAULT, "Not allowing transition because the top app (%{public}@) suppresses CC.", buf, 0xCu);
            }
            uint64_t v41 = NSString;
            v42 = [v38 bundleIdentifier];
            uint64_t v43 = [v41 stringWithFormat:@"ControlCenterNotAllowedBecauseTopAppSuppressesCC (%@)", v42];

            char v5 = 0;
            double v7 = (__CFString *)v43;
          }
        }
        uint64_t v35 = [v26 countByEnumeratingWithState:&v52 objects:v58 count:16];
      }
      while (v35);
      unint64_t v4 = v46;
      unint64_t v13 = v47;
      self = v48;
      id v25 = v45;
      double v27 = v44;
    }
  }

LABEL_34:
  if ([(SBControlCenterController *)self presentingEdge] == 4
    && [(id)SBApp isTypingActive])
  {
    CGFloat v30 = SBLogSystemGestureControlCenter();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D85BA000, v30, OS_LOG_TYPE_DEFAULT, "Not allowing transition because kbd says typing is active.", buf, 2u);
    }

    char v5 = 0;
    double v7 = @"ControlCenterNotAllowedBecauseUserIsTyping";
  }
  CGFloat v31 = [MEMORY[0x1E4FA8AA0] sharedInstance];
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __43__SBControlCenterController_canBePresented__block_invoke;
  v49[3] = &unk_1E6AFC9B0;
  char v51 = v5 & 1;
  v50 = v7;
  uint64_t v32 = v7;
  [v31 logBlock:v49];

  return v5 & 1;
}

id __43__SBControlCenterController_canBePresented__block_invoke(uint64_t a1)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  double v9 = @"[SBControlCenterController canBePresented]";
  v7[0] = @"allowTransition";
  id v2 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];
  v7[1] = @"failureReason";
  v8[0] = v2;
  BOOL v3 = *(__CFString **)(a1 + 32);
  if (!v3) {
    BOOL v3 = &stru_1F3084718;
  }
  v8[1] = v3;
  unint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];
  v10[0] = v4;
  char v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];

  return v5;
}

- (BOOL)allowShowTransitionSystemGesture
{
  BOOL v3 = [(SBControlCenterController *)self isDismissedOrDismissing];
  if (v3)
  {
    LOBYTE(v3) = [(SBControlCenterController *)self canBePresented];
  }
  return v3;
}

- (BOOL)_shouldAllowControlCenterGesture
{
  BOOL v3 = [(SBControlCenterController *)self _systemGestureManager];
  char v4 = [v3 isGestureWithTypeAllowed:6];

  if (v4)
  {
    char v5 = 0;
  }
  else
  {
    id v6 = SBLogSystemGestureControlCenter();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "Not allowing the present gesture to begin because system gestures aren't allowed.", buf, 2u);
    }

    char v5 = @"GestureNotAllowedBySystemGestureManager";
  }
  if (![(SBControlCenterController *)self allowShowTransitionSystemGesture])
  {
    double v7 = SBLogSystemGestureControlCenter();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "Not allowing the present gesture to begin because Control Center isn't allowed at this time.", buf, 2u);
    }

    char v4 = 0;
    char v5 = @"GestureNotAllowedAtThisTime";
  }
  CGRect v8 = +[SBReachabilityManager sharedInstance];
  char v9 = [v8 reachabilityModeActive];

  if ((v9 & 1) == 0
    && ([(UIPanGestureRecognizer *)self->_statusBarPullGestureRecognizer state] == 1
     || [(UIPanGestureRecognizer *)self->_statusBarPullGestureRecognizer state] == 2
     || [(UIPanGestureRecognizer *)self->_statusBarPullGestureRecognizer state] == 3))
  {
    uint64_t v10 = SBLogSystemGestureControlCenter();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_DEFAULT, "Not allowing the present gesture to begin because the status bar pull down gesture's state is active.", buf, 2u);
    }

    char v4 = 0;
    char v5 = @"GestureNotAllowedBecauseStatusBarGestureIsActive";
  }
  double v11 = [(id)SBApp bannerManager];
  char v12 = [(UIWindow *)self->_window _sbWindowScene];
  int v13 = [v11 isDisplayingFullScreenBannerInWindowScene:v12];

  if (v13)
  {
    double v14 = SBLogSystemGestureControlCenter();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D85BA000, v14, OS_LOG_TYPE_DEFAULT, "Not allowing the present gesture to begin because full screen banner is active.", buf, 2u);
    }

    char v4 = 0;
    char v5 = @"GestureNotAllowedBecauseFullScreenBannerIsActive";
  }
  id v15 = [MEMORY[0x1E4FA8AA0] sharedInstance];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  void v17[2] = __61__SBControlCenterController__shouldAllowControlCenterGesture__block_invoke;
  v17[3] = &unk_1E6AFC9B0;
  char v19 = v4;
  int v18 = v5;
  [v15 logBlock:v17];

  return v4;
}

id __61__SBControlCenterController__shouldAllowControlCenterGesture__block_invoke(uint64_t a1)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  char v9 = @"[SBControlCenterController _shouldAllowControlCenterGesture]";
  v7[0] = @"allowGesture";
  id v2 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];
  v7[1] = @"failureReason";
  v8[0] = v2;
  BOOL v3 = *(__CFString **)(a1 + 32);
  if (!v3) {
    BOOL v3 = &stru_1F3084718;
  }
  v8[1] = v3;
  char v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];
  v10[0] = v4;
  char v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];

  return v5;
}

- (id)_newSystemApertureRestrictionAssertionForType:(unint64_t)a3 withReason:(id)a4
{
  id v5 = a4;
  if (a3 == 1)
  {
    id v6 = [(id)SBApp systemApertureControllerForMainDisplay];
    uint64_t v7 = [v6 restrictSystemApertureToInertWithReason:v5];
  }
  else
  {
    if (a3)
    {
      CGRect v8 = 0;
      goto LABEL_7;
    }
    id v6 = [(id)SBApp systemApertureControllerForMainDisplay];
    uint64_t v7 = [v6 restrictSystemApertureToDefaultLayoutWithReason:v5];
  }
  CGRect v8 = (void *)v7;

LABEL_7:
  return v8;
}

- (void)restrictSystemApertureToType:(unint64_t)a3 withReason:(id)a4
{
  id v6 = a4;
  if (a3 != 1
    || !BSEqualStrings()
    || (+[SBSystemApertureDomain rootSettings],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        int v8 = [v7 suppressWhilePresentingControlCenter],
        v7,
        v8))
  {
    char v9 = [(SBControlCenterController *)self systemApertureAssertionForRestrictionType];
    uint64_t v10 = [NSNumber numberWithUnsignedInteger:a3];
    double v11 = [v9 objectForKey:v10];

    if (!v11)
    {
      id v12 = [(SBControlCenterController *)self _newSystemApertureRestrictionAssertionForType:a3 withReason:v6];
      if (v12)
      {
        objc_initWeak(&location, self);
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        void v18[2] = __69__SBControlCenterController_restrictSystemApertureToType_withReason___block_invoke;
        v18[3] = &unk_1E6B02738;
        objc_copyWeak(v19, &location);
        v19[1] = (id)a3;
        [v12 addInvalidationBlock:v18];
        int v13 = [(SBControlCenterController *)self systemApertureAssertionForRestrictionType];

        if (!v13)
        {
          double v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
          systemApertureAssertionForRestrictionType = self->_systemApertureAssertionForRestrictionType;
          self->_systemApertureAssertionForRestrictionType = v14;
        }
        uint64_t v16 = [(SBControlCenterController *)self systemApertureAssertionForRestrictionType];
        double v17 = [NSNumber numberWithUnsignedInteger:a3];
        [v16 setObject:v12 forKey:v17];

        objc_destroyWeak(v19);
        objc_destroyWeak(&location);
      }
    }
  }
}

void __69__SBControlCenterController_restrictSystemApertureToType_withReason___block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = (id *)(a1 + 32);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  id v5 = [WeakRetained systemApertureAssertionForRestrictionType];
  id v6 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 40)];
  id v7 = [v5 objectForKey:v6];

  if (v7 == v4)
  {
    int v8 = [WeakRetained systemApertureAssertionForRestrictionType];
    char v9 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 40)];
    [v8 removeObjectForKey:v9];
  }
}

- (void)invalidateSystemApertureAssertionForType:(unint64_t)a3 withReason:(id)a4
{
  id v9 = a4;
  id v6 = [(SBControlCenterController *)self systemApertureAssertionForRestrictionType];
  id v7 = [NSNumber numberWithUnsignedInteger:a3];
  int v8 = [v6 objectForKey:v7];

  if (v8) {
    [v8 invalidateWithReason:v9];
  }
}

- (NSString)coverSheetIdentifier
{
  id v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (int64_t)participantState
{
  if ([(SBControlCenterController *)self isVisible]) {
    return 2;
  }
  else {
    return 1;
  }
}

- (UICoordinateSpace)presentationCoordinateSpace
{
  id v2 = [(SBControlCenterController *)self viewController];
  BOOL v3 = [v2 view];

  return (UICoordinateSpace *)v3;
}

- (NSArray)presentationRegions
{
  v10[1] = *MEMORY[0x1E4F143B8];
  if ([(SBControlCenterController *)self isPresented])
  {
    BOOL v3 = (void *)MEMORY[0x1E4F5E468];
    id v4 = [(SBControlCenterController *)self viewController];
    id v5 = [v4 view];
    id v6 = [v3 regionForCoordinateSpace:v5];
    id v7 = [v6 role:3];
    v10[0] = v7;
    int v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  }
  else
  {
    int v8 = 0;
  }
  return (NSArray *)v8;
}

- (NSSet)components
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  if ([(SBControlCenterController *)self isPresented])
  {
    id v4 = objc_opt_new();
    id v5 = [(SBControlCenterController *)self appearanceIdentifier];
    id v6 = [v4 identifier:v5];
    id v7 = [v6 priority:50];
    int v8 = [v7 suppressTeachableMomentsAnimation:1];
    [v3 addObject:v8];
  }
  return (NSSet *)v3;
}

- (_UILegibilitySettings)legibilitySettings
{
  return 0;
}

- (int64_t)scrollingStrategy
{
  return 0;
}

- (int64_t)notificationBehavior
{
  return 0;
}

- (unint64_t)restrictedCapabilities
{
  return 0;
}

- (int64_t)idleWarnMode
{
  return 0;
}

- (int64_t)idleTimerMode
{
  return 1;
}

- (int64_t)idleTimerDuration
{
  return 9;
}

- (int64_t)proximityDetectionMode
{
  return 0;
}

- (id)hasExistingControlFromExtension:(id)a3
{
  id v3 = [(CCUIMainViewController *)self->_viewController existingControlKindFromWidgetExtension:a3];
  if (v3) {
    id v4 = [[SBWidgetExtensionDebugSearchResult alloc] initWithKind:v3];
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (void)launchControl:(id)a3 completion:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  int v8 = SBLogWidgets();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v13 = v6;
    _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "Launch control: %{public}@", buf, 0xCu);
  }

  if ([(SBControlCenterController *)self isPresented])
  {
    [(CCUIMainViewController *)self->_viewController addIfNecessaryAndScrollToControlMatching:v6 animated:1];
    v7[2](v7, 0);
  }
  else
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __54__SBControlCenterController_launchControl_completion___block_invoke;
    void v9[3] = &unk_1E6AFA2A0;
    v9[4] = self;
    id v10 = v6;
    double v11 = v7;
    SBWorkspaceForceToSpringBoard(v9);
  }
}

void __54__SBControlCenterController_launchControl_completion___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    SBWorkspaceSuspendActiveDisplay();
    id v3 = *(void **)(a1 + 32);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __54__SBControlCenterController_launchControl_completion___block_invoke_2;
    v5[3] = &unk_1E6AF5FC8;
    v5[4] = v3;
    id v6 = *(id *)(a1 + 40);
    id v7 = *(id *)(a1 + 48);
    [v3 presentAnimated:1 completion:v5];
  }
  else
  {
    id v4 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v4();
  }
}

uint64_t __54__SBControlCenterController_launchControl_completion___block_invoke_2(void *a1)
{
  [*(id *)(a1[4] + 40) addIfNecessaryAndScrollToControlMatching:a1[5] animated:1];
  id v2 = *(uint64_t (**)(void))(a1[6] + 16);
  return v2();
}

- (id)coordinatorRequestedIdleTimerBehavior:(id)a3
{
  return +[SBIdleTimerBehavior defaultBehavior];
}

- (void)homeGesturePerformedForBarSwipeAffordanceView:(id)a3
{
  id v4 = [(SBControlCenterController *)self viewController];
  int v5 = [v4 canDismissPresentedContent];

  if (v5)
  {
    id v6 = [(SBControlCenterController *)self viewController];
    [v6 dismissPresentedContent];
  }
  else
  {
    [(SBControlCenterController *)self dismissAnimated:1 completion:0];
  }
}

- (void)homeGrabberViewDidReceiveClick:(id)a3
{
  id v4 = [(SBBarSwipeAffordanceViewController *)self->_homeAffordanceViewController zStackParticipant];
  int v5 = v4;
  if (v4 && [v4 ownsHomeGesture])
  {
    [(SBControlCenterController *)self dismissAnimated:1];
  }
  else
  {
    id v6 = SBLogSystemGestureControlCenter();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "Preventing the home affordance click gesture because Control Center does not own the home gesture.", v7, 2u);
    }
  }
}

- (unint64_t)barSwipeAffordanceView:(id)a3 systemGestureTypeForType:(int64_t)a4
{
  if ((unint64_t)(a4 - 1) > 2) {
    return 0;
  }
  else {
    return qword_1D8FD18B8[a4 - 1];
  }
}

- (id)hideAnimationSettingsForBarSwipeAffordanceView:(id)a3
{
  id v4 = objc_msgSend(MEMORY[0x1E4FA5F28], "rootSettings", a3);
  int v5 = [v4 hideForHomeGestureOwnershipAnimationSettings];
  id v6 = [v5 BSAnimationSettings];
  id v7 = (void *)[v6 mutableCopy];

  [(SBControlCenterController *)self _homeAffordanceAnimationDelay];
  double v9 = v8;
  [v7 delay];
  [v7 setDelay:v9 + v10];
  return v7;
}

- (id)unhideAnimationSettingsForBarSwipeAffordanceView:(id)a3
{
  id v4 = objc_msgSend(MEMORY[0x1E4FA5F28], "rootSettings", a3);
  int v5 = [v4 unhideForHomeGestureOwnershipAnimationSettings];
  id v6 = [v5 BSAnimationSettings];
  id v7 = (void *)[v6 mutableCopy];

  [(SBControlCenterController *)self _homeAffordanceAnimationDelay];
  double v9 = v8;
  [v7 delay];
  [v7 setDelay:v9 + v10];
  return v7;
}

- (double)_homeAffordanceAnimationDelay
{
  id v2 = [(SBControlCenterController *)self viewController];
  unint64_t v3 = [v2 moduleRowCount];

  uint64_t v4 = 8;
  if (v3 < 8) {
    uint64_t v4 = v3;
  }
  return (double)(unint64_t)(v4 + 1) * 0.016;
}

- (BOOL)_isStatusBarHiddenIgnoringControlCenter
{
  unint64_t v3 = [(UIWindow *)self->_window _sbWindowScene];
  uint64_t v4 = [v3 statusBarManager];
  int v5 = [v4 assertionManager];

  if (*(_OWORD *)&self->_hideStatusBarAssertion == 0)
  {
    char IsZero = [v5 isFrontmostStatusBarHidden];
  }
  else
  {
    id v6 = [(SBControlCenterController *)self _switcherController];
    if ([v6 unlockedEnvironmentMode] == 3)
    {
      char IsZero = [v6 isInAppStatusBarHidden];
    }
    else
    {
      id v7 = [v5 statusBarSettingsForLevel:6];
      double v8 = [v7 alpha];
      [v8 doubleValue];
      char IsZero = BSFloatIsZero();
    }
  }

  return IsZero;
}

- (CCUIStatusBarStyleSnapshot)hostStatusBarStyle
{
  unint64_t v3 = [(UIWindow *)self->_window _sbWindowScene];
  uint64_t v4 = [v3 statusBarManager];

  int v5 = [v4 assertionManager];
  id v6 = [(SBControlCenterController *)self _lockScreenManager];
  int v7 = [v6 isUILocked];

  if (v7)
  {
    uint64_t v8 = [v5 isFrontmostStatusBarHidden];
    if ([(SBControlCenterController *)self isPresentedOrDismissing])
    {
      id v9 = [v5 effectiveStatusBarStyleRequestWithSettings:0];
      double v10 = v9;
    }
    else
    {
      double v10 = [v4 leadingStatusBarStyleRequest];
      id v9 = [v4 trailingStatusBarStyleRequest];
    }
    double v13 = *MEMORY[0x1E4F1DB28];
    double v15 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v17 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v19 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    double v21 = *MEMORY[0x1E4F437F8];
    double v23 = *(double *)(MEMORY[0x1E4F437F8] + 8);
    double v25 = *(double *)(MEMORY[0x1E4F437F8] + 16);
    double v27 = *(double *)(MEMORY[0x1E4F437F8] + 24);
    double v11 = [(SBControlCenterController *)self _coverSheetViewController];
    int v31 = [v11 shouldShowLockStatusBarTime];
    uint64_t v32 = (void *)*MEMORY[0x1E4F441A8];
    if (v31) {
      uint64_t v32 = 0;
    }
    id v30 = v32;
    uint64_t v29 = 0;
    double v28 = 0;
  }
  else
  {
    uint64_t v8 = [(SBControlCenterController *)self _isStatusBarHiddenIgnoringControlCenter];
    double v10 = [v4 leadingStatusBarStyleRequest];
    id v9 = [v4 trailingStatusBarStyleRequest];
    double v11 = [(SBControlCenterController *)self _switcherController];
    [v11 statusBarAvoidanceFrameForLayoutRole:2];
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    [v11 statusBarEdgeInsets];
    double v21 = v20;
    double v23 = v22;
    double v25 = v24;
    double v27 = v26;
    double v28 = [v11 statusBarOverlayData];
    uint64_t v29 = [v11 statusBarActionsByPartIdentifier];
    id v30 = 0;
  }

  if (!__sb__runningInSpringBoard())
  {
    BOOL v33 = [MEMORY[0x1E4F42948] currentDevice];
    uint64_t v34 = [v33 userInterfaceIdiom];

    if (v34) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  if (!SBFEffectiveDeviceClass() || SBFEffectiveDeviceClass() == 1)
  {
LABEL_14:
    [v4 avoidanceFrameForStatusBar:0];
    double v13 = v35;
    double v15 = v36;
    double v17 = v37;
    double v19 = v38;
  }
LABEL_15:
  v39 = objc_msgSend(objc_alloc(MEMORY[0x1E4F5AD40]), "initWithHidden:hiddenPartIdentifier:leadingStyleRequest:trailingStyleRequest:overlayData:actionsByPartIdentifier:statusBarInsets:avoidanceFrame:", v8, v30, v10, v9, v28, v29, v21, v23, v25, v27, v13, v15, v17, v19);

  return (CCUIStatusBarStyleSnapshot *)v39;
}

- (id)acquireWindowLevelAssertionWithPriority:(int64_t)a3 windowLevel:(double)a4 windowScene:(id)a5 reason:(id)a6
{
  return [(SBWindowLevelAssertionManager *)self->_windowLevelAssertionManager acquireWindowLevelAssertionWithPriority:a3 windowLevel:a5 windowScene:a6 reason:a4];
}

- (void)windowLevelAssertionManager:(id)a3 didUpdateAssertionsForWindowScene:(id)a4
{
}

- (SBIdleTimerCoordinating)idleTimerCoordinator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_idleTimerCoordinator);
  return (SBIdleTimerCoordinating *)WeakRetained;
}

- (void)setIdleTimerCoordinator:(id)a3
{
}

- (SBFSensorActivityDataProvider)sensorActivityDataProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sensorActivityDataProvider);
  return (SBFSensorActivityDataProvider *)WeakRetained;
}

- (SBControlCenterWindow)window
{
  return self->_window;
}

- (void)setWindow:(id)a3
{
}

- (void)setViewController:(id)a3
{
}

- (SBBarSwipeAffordanceViewController)homeAffordanceViewController
{
  return self->_homeAffordanceViewController;
}

- (void)setHomeAffordanceViewController:(id)a3
{
}

- (UIViewController)homeButtonWrapperViewController
{
  return self->_homeButtonWrapperViewController;
}

- (void)setHomeButtonWrapperViewController:(id)a3
{
}

- (SBFZStackParticipant)zStackParticipant
{
  return self->_zStackParticipant;
}

- (void)setZStackParticipant:(id)a3
{
}

- (SBControlCenterSystemAgent)systemAgent
{
  return self->_systemAgent;
}

- (void)setSystemAgent:(id)a3
{
}

- (CCUISystemControlsCoordinator)systemControlsCoordinator
{
  return self->_systemControlsCoordinator;
}

- (void)setSystemControlsCoordinator:(id)a3
{
}

- (BSSimpleAssertion)hideStatusBarAssertion
{
  return self->_hideStatusBarAssertion;
}

- (void)setHideStatusBarAssertion:(id)a3
{
}

- (SBWindowSceneStatusBarSettingsAssertion)statusBarAssertion
{
  return self->_statusBarAssertion;
}

- (void)setStatusBarAssertion:(id)a3
{
}

- (SBAsynchronousRenderingAssertion)asynchronousRenderingAssertion
{
  return self->_asynchronousRenderingAssertion;
}

- (void)setAsynchronousRenderingAssertion:(id)a3
{
}

- (SBKeyboardFocusControlling)keyboardFocusController
{
  return self->_keyboardFocusController;
}

- (void)setKeyboardFocusController:(id)a3
{
}

- (SBMedusaHostedKeyboardWindowLevelAssertion)medusaHostedKeyboardWindowLevelAssertion
{
  return self->_medusaHostedKeyboardWindowLevelAssertion;
}

- (void)setMedusaHostedKeyboardWindowLevelAssertion:(id)a3
{
}

- (SBGrabberTongue)grabberTongue
{
  return self->_grabberTongue;
}

- (void)setGrabberTongue:(id)a3
{
}

- (UIPanGestureRecognizer)statusBarPullGestureRecognizer
{
  return self->_statusBarPullGestureRecognizer;
}

- (void)setStatusBarPullGestureRecognizer:(id)a3
{
}

- (SBIndirectPanGestureRecognizer)indirectStatusBarPullGestureRecognizer
{
  return self->_indirectStatusBarPullGestureRecognizer;
}

- (void)setIndirectStatusBarPullGestureRecognizer:(id)a3
{
}

- (BOOL)indirectStatusBarPullGestureCalledBegin
{
  return self->_indirectStatusBarPullGestureCalledBegin;
}

- (void)setIndirectStatusBarPullGestureCalledBegin:(BOOL)a3
{
  self->_indirectStatusBarPullGestureCalledBegin = a3;
}

- (BOOL)presentationGestureContinuedIntoPaging
{
  return self->_presentationGestureContinuedIntoPaging;
}

- (void)setPresentationGestureContinuedIntoPaging:(BOOL)a3
{
  self->_presentationGestureContinuedIntoPaging = a3;
}

- (UIApplicationSceneDeactivationAssertion)resignActiveAssertion
{
  return self->_resignActiveAssertion;
}

- (void)setResignActiveAssertion:(id)a3
{
}

- (BSInvalidatable)displayLayoutAssertion
{
  return self->_displayLayoutAssertion;
}

- (void)setDisplayLayoutAssertion:(id)a3
{
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (SBWindowLevelAssertionManager)windowLevelAssertionManager
{
  return self->_windowLevelAssertionManager;
}

- (void)setWindowLevelAssertionManager:(id)a3
{
}

- (BSInvalidatable)idleTimerDisableAssertion
{
  return self->_idleTimerDisableAssertion;
}

- (void)setIdleTimerDisableAssertion:(id)a3
{
}

- (BSInvalidatable)bannerSuppressionAssertion
{
  return self->_bannerSuppressionAssertion;
}

- (void)setBannerSuppressionAssertion:(id)a3
{
}

- (BSInvalidatable)deferOrientationUpdatesAssertion
{
  return self->_deferOrientationUpdatesAssertion;
}

- (void)setDeferOrientationUpdatesAssertion:(id)a3
{
}

- (BSInvalidatable)keyboardFocusLockAssertion
{
  return self->_keyboardFocusLockAssertion;
}

- (void)setKeyboardFocusLockAssertion:(id)a3
{
}

- (PTSingleTestRecipe)presentModuleTestRecipe
{
  return self->_presentModuleTestRecipe;
}

- (PTSingleTestRecipe)userInterfaceStyleTestRecipe
{
  return self->_userInterfaceStyleTestRecipe;
}

- (NSMutableDictionary)systemApertureAssertionForRestrictionType
{
  return self->_systemApertureAssertionForRestrictionType;
}

- (void)setSystemApertureAssertionForRestrictionType:(id)a3
{
}

- (NSArray)physicalButtonSceneTargets
{
  return self->_physicalButtonSceneTargets;
}

- (void)setPhysicalButtonSceneTargets:(id)a3
{
}

- (SBHCredenzaSettings)credenzaSettings
{
  return self->_credenzaSettings;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_credenzaSettings, 0);
  objc_storeStrong((id *)&self->_physicalButtonSceneTargets, 0);
  objc_storeStrong((id *)&self->_systemApertureAssertionForRestrictionType, 0);
  objc_storeStrong((id *)&self->_userInterfaceStyleTestRecipe, 0);
  objc_storeStrong((id *)&self->_presentModuleTestRecipe, 0);
  objc_storeStrong((id *)&self->_keyboardFocusLockAssertion, 0);
  objc_storeStrong((id *)&self->_deferOrientationUpdatesAssertion, 0);
  objc_storeStrong((id *)&self->_bannerSuppressionAssertion, 0);
  objc_storeStrong((id *)&self->_idleTimerDisableAssertion, 0);
  objc_storeStrong((id *)&self->_windowLevelAssertionManager, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_displayLayoutAssertion, 0);
  objc_storeStrong((id *)&self->_resignActiveAssertion, 0);
  objc_storeStrong((id *)&self->_indirectStatusBarPullGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_statusBarPullGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_grabberTongue, 0);
  objc_storeStrong((id *)&self->_medusaHostedKeyboardWindowLevelAssertion, 0);
  objc_storeStrong((id *)&self->_keyboardFocusController, 0);
  objc_storeStrong((id *)&self->_asynchronousRenderingAssertion, 0);
  objc_storeStrong((id *)&self->_statusBarAssertion, 0);
  objc_storeStrong((id *)&self->_hideStatusBarAssertion, 0);
  objc_storeStrong((id *)&self->_systemControlsCoordinator, 0);
  objc_storeStrong((id *)&self->_systemAgent, 0);
  objc_storeStrong((id *)&self->_zStackParticipant, 0);
  objc_storeStrong((id *)&self->_homeButtonWrapperViewController, 0);
  objc_storeStrong((id *)&self->_homeAffordanceViewController, 0);
  objc_storeStrong((id *)&self->_viewController, 0);
  objc_storeStrong((id *)&self->_window, 0);
  objc_destroyWeak((id *)&self->_sensorActivityDataProvider);
  objc_destroyWeak((id *)&self->_idleTimerCoordinator);
}

@end