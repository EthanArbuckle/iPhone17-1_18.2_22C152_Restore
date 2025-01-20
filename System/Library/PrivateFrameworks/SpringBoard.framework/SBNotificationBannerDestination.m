@interface SBNotificationBannerDestination
+ (id)_test_notificationRequestForBannerWithIcon;
- (BNPresentable)presentablePendingSnapshot;
- (BNPresentable)presentedPresentable;
- (BOOL)_canReceiveNotificationRequestIfAmbientPresented:(id)a3;
- (BOOL)_canReceiveNotificationRequestIfLocked:(id)a3;
- (BOOL)_isAmbientNotificationsPreviewOnTapOnly;
- (BOOL)_isAmbientPresented;
- (BOOL)_isBundleIdentifierBlockedForCommunicationPolicy:(id)a3;
- (BOOL)_isBundleIdentifierBlockedForScreenTimeExpiration:(id)a3;
- (BOOL)_isContentSuppressedForNotificationRequest:(id)a3;
- (BOOL)_isDeviceAuthenticated;
- (BOOL)_isDismissingLongLookForBanner;
- (BOOL)_isInSetupMode;
- (BOOL)_isPresentedBannerBeingDragged;
- (BOOL)_isPresentingBanner;
- (BOOL)_isPresentingBannerInLongLook;
- (BOOL)_isPresentingBannerPreventingAutomaticLock;
- (BOOL)_isPresentingBannerRequestingRaiseGesture;
- (BOOL)_isPresentingBannerWithHiddenPreview;
- (BOOL)_isPresentingStickyBanner;
- (BOOL)_isShowingShortLookAtRest;
- (BOOL)_isUILocked;
- (BOOL)_presentedBannerMatchesNotificationRequest:(id)a3;
- (BOOL)_revokeAllPresentablesWithRequesterIdentifier:(id)a3 reason:(id)a4 options:(unint64_t)a5;
- (BOOL)_shouldAllowDragInteraction;
- (BOOL)_shouldDismissPresentedBannerPerformingPreludeForcingIfSticky:(BOOL)a3 outReason:(id *)a4;
- (BOOL)_shouldForceDismisssIfStickyForReason:(id)a3;
- (BOOL)_shouldHideStatusBar;
- (BOOL)_shouldScreenTimeSuppressNotificationRequest:(id)a3;
- (BOOL)_shouldScreenTimeSuppressNotificationsForBundleIdentifier:(id)a3;
- (BOOL)canReceiveNotificationRequest:(id)a3;
- (BOOL)fullScreenPresentableViewControllerShouldTransitionToDetailStageOnTap:(id)a3;
- (BOOL)handleHomeButtonPress;
- (BOOL)isAlertDestination;
- (BOOL)isNotificationContentExtensionVisible:(id)a3;
- (BOOL)isPresentingEmergencyNotification;
- (BOOL)isUserInteractionInProgress;
- (BOOL)notificationPresentableViewControllerShouldPresentLongLook:(id)a3;
- (BOOL)notificationViewControllerShouldAllowExpandedPlatterInteraction:(id)a3;
- (BOOL)notificationViewControllerShouldInterpretTapAsDefaultAction:(id)a3;
- (BOOL)notificationViewControllerShouldPan:(id)a3;
- (BOOL)notificationViewControllerShouldSupportExpandedPlatterInteraction:(id)a3;
- (BOOL)shouldDismissForReason:(id)a3 outReason:(id *)a4;
- (BSInvalidatable)bannerGestureRecognizerPriorityAssertion;
- (BSInvalidatable)biometricMatchingAssertion;
- (BSInvalidatable)idleTimerDisableAssertion;
- (BSInvalidatable)starModeDisableAssertion;
- (BSServiceConnectionEndpoint)endpoint;
- (CGRect)presentedBannerScreenFrame;
- (NCBannerTransitionBlockingPrototypeRecipe)transitionBlockingPrototypeRecipe;
- (NCNotificationAlertDestinationDelegate)delegate;
- (NCNotificationManagementViewPresenter)notificationManagementPresenter;
- (NCNotificationRequest)_presentedNotificationRequest;
- (NCNotificationViewController)_notificationViewControllerForActiveDragSession;
- (NCNotificationViewController)presentedBanner;
- (NSMutableSet)destinationObservers;
- (NSString)coverSheetIdentifier;
- (NSString)identifier;
- (OS_dispatch_source)dismissTimer;
- (OS_dispatch_source)presentTimer;
- (OS_dispatch_source)replaceTimer;
- (SBAssistantController)assistantController;
- (SBDashBoardLegibilityProvider)dashBoardLegibilityProvider;
- (SBInAppStatusBarHiddenAssertion)appsStatusBarAssertion;
- (SBLockScreenManager)lockScreenManager;
- (SBNotificationBannerDestination)init;
- (SBNotificationPresentableViewController)_presentedNotificationPresentableVC;
- (SBSetupManager)setupManager;
- (SBWindowSceneStatusBarSettingsAssertion)systemStatusBarAssertion;
- (UIApplicationSceneDeactivationAssertion)resignActiveAssertion;
- (id)_ambientPresentationController;
- (id)_dashBoardLegibilitySettings;
- (id)_notificationSectionSettingsForSectionIdentifier:(id)a3;
- (id)_notificationSystemSettings;
- (id)_notificationViewControllerForRequest:(id)a3;
- (id)_notificationViewControllerFromPresentable:(id)a3;
- (id)_presentableForRequest:(id)a3 modal:(BOOL)a4;
- (id)_presentedNotificationRequestPresenter;
- (id)_requestFromPresentable:(id)a3;
- (id)_startTimerWithDelay:(unint64_t)a3 eventHandler:(id)a4;
- (id)_staticContentProviderForViewController:(id)a3 class:(Class)a4 notificationRequest:(id)a5 test:(id)a6;
- (id)notificationManagementViewPresenter:(id)a3 sectionSettingsForSectionIdentifier:(id)a4;
- (id)notificationRequestPresenter:(id)a3 staticContentProviderForNotificationRequest:(id)a4;
- (id)notificationRequestPresenterNotificationUsageTrackingState:(id)a3;
- (id)notificationViewController:(id)a3 auxiliaryOptionsContentProviderForNotificationRequest:(id)a4 withLongLook:(BOOL)a5;
- (id)notificationViewControllerContainerViewProviderForExpandedContent:(id)a3;
- (int64_t)idleTimerDuration;
- (int64_t)idleTimerMode;
- (int64_t)idleWarnMode;
- (int64_t)notificationBehavior;
- (int64_t)participantState;
- (int64_t)proximityDetectionMode;
- (int64_t)scrollingStrategy;
- (unint64_t)restrictedCapabilities;
- (void)_cancelDismissTimer;
- (void)_cancelReplaceAndDismissTimers;
- (void)_cancelReplaceTimer;
- (void)_dismissPresentableCompleted:(id)a3;
- (void)_dismissPresentedBannerAnimated:(BOOL)a3 reason:(id)a4 forceIfSticky:(BOOL)a5;
- (void)_dismissPresentedBannerOnly:(BOOL)a3 reason:(id)a4 animated:(BOOL)a5;
- (void)_dismissPresentedBannerOnly:(BOOL)a3 reason:(id)a4 animated:(BOOL)a5 forceIfSticky:(BOOL)a6;
- (void)_handleExpansionRequestForViewController:(id)a3 notificationRequest:(id)a4 forTrigger:(int64_t)a5 test:(id)a6 completionBlock:(id)a7;
- (void)_invalidateBiometricAuthIfNecessary;
- (void)_lockStateChanged;
- (void)_performCancelAction;
- (void)_performSilenceAction;
- (void)_postNotificationRequest:(id)a3 modal:(BOOL)a4 completion:(id)a5;
- (void)_postPresentableForRequest:(id)a3 modal:(BOOL)a4 completion:(id)a5;
- (void)_publishDidPresentBannerForNotificationRequest:(id)a3;
- (void)_requestBiometricAuthIfAmbientPresentedForNotificationRequest:(id)a3;
- (void)_requestUnlockForExpansionForViewController:(id)a3 notificationRequest:(id)a4 completionBlock:(id)a5;
- (void)_resetPresentTimer;
- (void)_setNotificationViewControllerForActiveDragSession:(id)a3;
- (void)_setPresentedPresentable:(id)a3;
- (void)_setReadyForNotificationRequests;
- (void)_setReadyForNotificationRequestsCoalescingWith:(id)a3;
- (void)_setStatusBarsHidden:(BOOL)a3 withDuration:(double)a4;
- (void)_setupModeChanged;
- (void)_setupSystemStateChangeNotifications;
- (void)_setupTimers;
- (void)_startDismissTimer;
- (void)_startReplaceAndDismissTimersForRequest:(id)a3;
- (void)_startReplaceTimer;
- (void)_test_dismissNotificationRequest:(id)a3;
- (void)_test_postNotificationRequest:(id)a3 completion:(id)a4;
- (void)_updateMotionGestureObservation;
- (void)_userInteractionDidEndForRequestPresenter:(id)a3;
- (void)_userInteractionWillBeginForRequestPresenter:(id)a3;
- (void)backlightController:(id)a3 didAnimateBacklightToFactor:(float)a4 source:(int64_t)a5;
- (void)coronaAnimationController:(id)a3 willAnimateCoronaTransitionWithAnimator:(id)a4;
- (void)dealloc;
- (void)destinationDidBecomeDisabled;
- (void)didReceiveRaiseGesture;
- (void)fullScreenPresentableViewController:(id)a3 requestsDismissalWithReason:(id)a4;
- (void)longLookDidDismissForNotificationViewController:(id)a3;
- (void)longLookDidPresentForNotificationViewController:(id)a3;
- (void)longLookWillDismissForNotificationViewController:(id)a3;
- (void)longLookWillPresentForNotificationViewController:(id)a3;
- (void)modifyNotificationRequest:(id)a3;
- (void)notificationManagementContentProvider:(id)a3 requestsPresentingNotificationManagementViewType:(unint64_t)a4 forNotificationRequest:(id)a5 withPresentingView:(id)a6;
- (void)notificationManagementViewPresenter:(id)a3 setAllowsCriticalAlerts:(BOOL)a4 forNotificationRequest:(id)a5 withSectionIdentifier:(id)a6;
- (void)notificationManagementViewPresenter:(id)a3 setAllowsNotifications:(BOOL)a4 forNotificationRequest:(id)a5 withSectionIdentifier:(id)a6;
- (void)notificationManagementViewPresenter:(id)a3 setAllowsTimeSensitive:(BOOL)a4 forNotificationRequest:(id)a5 withSectionIdentifier:(id)a6;
- (void)notificationManagementViewPresenter:(id)a3 setDeliverQuietly:(BOOL)a4 forNotificationRequest:(id)a5 withSectionIdentifier:(id)a6;
- (void)notificationManagementViewPresenter:(id)a3 setMuted:(BOOL)a4 untilDate:(id)a5 forSectionIdentifier:(id)a6 threadIdentifier:(id)a7;
- (void)notificationManagementViewPresenterDidDismissManagementView:(id)a3;
- (void)notificationManagementViewPresenterWillPresentManagementView:(id)a3;
- (void)notificationPresentableViewController:(id)a3 presentationSize:(CGSize *)a4 containerSize:(CGSize *)a5;
- (void)notificationRequestPresenter:(id)a3 didVendTransitionBlockingAssertion:(id)a4;
- (void)notificationRequestPresenter:(id)a3 executeAction:(id)a4 withParameters:(id)a5 completion:(id)a6;
- (void)notificationRequestPresenter:(id)a3 shouldTransitionToStage:(id)a4 forTrigger:(int64_t)a5 completionBlock:(id)a6;
- (void)notificationViewController:(id)a3 dragInteraction:(id)a4 session:(id)a5 didEndWithOperation:(unint64_t)a6;
- (void)notificationViewController:(id)a3 dragInteraction:(id)a4 session:(id)a5 willEndWithOperation:(unint64_t)a6;
- (void)notificationViewController:(id)a3 dragInteraction:(id)a4 sessionWillBegin:(id)a5;
- (void)notificationViewController:(id)a3 requestPermissionToExecuteAction:(id)a4 withParameters:(id)a5 completion:(id)a6;
- (void)notificationViewControllerWillDismissForCancelAction:(id)a3;
- (void)postNotificationRequest:(id)a3;
- (void)prepareDestinationToReceiveCriticalNotificationRequest:(id)a3;
- (void)presentModalBannerAndExpandForNotificationRequest:(id)a3;
- (void)presentableDidAppearAsBanner:(id)a3;
- (void)presentableDidDisappearAsBanner:(id)a3 withReason:(id)a4;
- (void)presentableWillAppearAsBanner:(id)a3;
- (void)presentableWillDisappearAsBanner:(id)a3 withReason:(id)a4;
- (void)presentableWillNotAppearAsBanner:(id)a3 withReason:(id)a4;
- (void)registerNotificationBannerDestinationObserver:(id)a3;
- (void)setAppsStatusBarAssertion:(id)a3;
- (void)setAssistantController:(id)a3;
- (void)setBannerGestureRecognizerPriorityAssertion:(id)a3;
- (void)setBiometricMatchingAssertion:(id)a3;
- (void)setDashBoardLegibilityProvider:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDestinationObservers:(id)a3;
- (void)setDismissTimer:(id)a3;
- (void)setIdleTimerDisableAssertion:(id)a3;
- (void)setLockScreenManager:(id)a3;
- (void)setNotificationManagementPresenter:(id)a3;
- (void)setPresentTimer:(id)a3;
- (void)setPresentablePendingSnapshot:(id)a3;
- (void)setReplaceTimer:(id)a3;
- (void)setResignActiveAssertion:(id)a3;
- (void)setSetupManager:(id)a3;
- (void)setStarModeDisableAssertion:(id)a3;
- (void)setSystemStatusBarAssertion:(id)a3;
- (void)setTransitionBlockingPrototypeRecipe:(id)a3;
- (void)setUserInteractionInProgress:(BOOL)a3;
- (void)unregisterNotificationBannerDestinationObserver:(id)a3;
- (void)userInteractionDidEndForBannerForPresentable:(id)a3;
- (void)userInteractionWillBeginForBannerForPresentable:(id)a3;
- (void)withdrawNotificationRequest:(id)a3;
@end

@implementation SBNotificationBannerDestination

- (BOOL)_isPresentingBannerInLongLook
{
  BOOL v3 = [(SBNotificationBannerDestination *)self _isPresentingBanner];
  if (v3)
  {
    v4 = [(SBNotificationBannerDestination *)self _presentedNotificationPresentableVC];
    v5 = [v4 notificationViewController];
    char v6 = [v5 hasCommittedToPresentingCustomContentProvidingViewController];

    LOBYTE(v3) = v6;
  }
  return v3;
}

- (BOOL)_isPresentingBanner
{
  v2 = [(SBNotificationBannerDestination *)self presentedPresentable];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BNPresentable)presentedPresentable
{
  return self->_presentedPresentable;
}

+ (id)_test_notificationRequestForBannerWithIcon
{
  v23[2] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4FB37F0] notificationRequestWithRequestDestination:*MEMORY[0x1E4FB3848]];
  BOOL v3 = (void *)[v2 mutableCopy];

  v4 = (void *)MEMORY[0x1E4F42A80];
  v5 = [v3 sectionIdentifier];
  char v6 = [MEMORY[0x1E4F42D90] mainScreen];
  [v6 scale];
  v20 = objc_msgSend(v4, "_applicationIconImageForBundleIdentifier:format:scale:", v5, 5);

  v7 = [v3 content];
  v8 = (void *)[v7 mutableCopy];

  v23[0] = v20;
  v9 = [MEMORY[0x1E4F1CA98] null];
  v23[1] = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
  [v8 setIcons:v10];

  [v3 setContent:v8];
  id v11 = objc_alloc_init(MEMORY[0x1E4FB37A0]);
  v12 = objc_alloc_init(SBNotificationBannerDestinationTestActionRunner);
  [v11 setActionRunner:v12];
  [v11 setShouldDismissNotification:1];
  [v3 setClearAction:v11];
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v14 = objc_alloc_init(MEMORY[0x1E4FB37A0]);
  v15 = objc_msgSend(NSString, "stringWithFormat:", @"Action %lu", 0);
  [v14 setTitle:v15];

  [v14 setActionRunner:v12];
  [v14 setShouldDismissNotification:0];
  [v13 addObject:v14];

  id v16 = objc_alloc_init(MEMORY[0x1E4FB37A0]);
  v17 = objc_msgSend(NSString, "stringWithFormat:", @"Action %lu", 1);
  [v16 setTitle:v17];

  [v16 setActionRunner:v12];
  [v16 setShouldDismissNotification:0];
  [v13 addObject:v16];

  uint64_t v21 = *MEMORY[0x1E4FB3740];
  id v22 = v13;
  v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
  [v3 setSupplementaryActions:v18];

  return v3;
}

- (SBNotificationBannerDestination)init
{
  v18.receiver = self;
  v18.super_class = (Class)SBNotificationBannerDestination;
  v2 = [(SBNotificationBannerDestination *)&v18 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    destinationObservers = v2->_destinationObservers;
    v2->_destinationObservers = (NSMutableSet *)v3;

    [(SBNotificationBannerDestination *)v2 _setupSystemStateChangeNotifications];
    [(SBNotificationBannerDestination *)v2 _setupTimers];
    v5 = [(id)SBApp bannerManager];
    id v6 = objc_alloc_init(MEMORY[0x1E4FB38D8]);
    v7 = [MEMORY[0x1E4FB38D8] requesterIdentifier];
    [v5 registerAuthority:v6 forRequesterIdentifier:v7];

    v8 = +[SBSceneManagerCoordinator sharedInstance];
    v9 = [v8 sceneDeactivationManager];
    uint64_t v10 = [v9 newAssertionWithReason:6];
    resignActiveAssertion = v2->_resignActiveAssertion;
    v2->_resignActiveAssertion = (UIApplicationSceneDeactivationAssertion *)v10;

    v12 = (NCNotificationManagementViewPresenter *)objc_alloc_init(MEMORY[0x1E4FB38F8]);
    notificationManagementPresenter = v2->_notificationManagementPresenter;
    v2->_notificationManagementPresenter = v12;

    [(NCNotificationManagementViewPresenter *)v2->_notificationManagementPresenter setDelegate:v2];
    id v14 = +[SBBacklightController sharedInstanceIfExists];
    [v14 addObserver:v2];

    uint64_t v15 = [objc_alloc(MEMORY[0x1E4FB38B0]) initWithNotificationAlertDestination:v2];
    transitionBlockingPrototypeRecipe = v2->_transitionBlockingPrototypeRecipe;
    v2->_transitionBlockingPrototypeRecipe = (NCBannerTransitionBlockingPrototypeRecipe *)v15;
  }
  return v2;
}

- (void)setAssistantController:(id)a3
{
  v5 = (SBAssistantController *)a3;
  assistantController = self->_assistantController;
  if (assistantController != v5)
  {
    v7 = v5;
    [(SBAssistantController *)assistantController removeObserver:self];
    objc_storeStrong((id *)&self->_assistantController, a3);
    [(SBAssistantController *)self->_assistantController addObserver:self];
    v5 = v7;
  }
}

- (void)setLockScreenManager:(id)a3
{
  v5 = (SBLockScreenManager *)a3;
  lockScreenManager = self->_lockScreenManager;
  if (lockScreenManager != v5)
  {
    v9 = v5;
    v7 = [(SBLockScreenManager *)lockScreenManager coverSheetViewController];
    [v7 unregisterExternalBehaviorProvider:self];

    objc_storeStrong((id *)&self->_lockScreenManager, a3);
    v8 = [(SBLockScreenManager *)self->_lockScreenManager coverSheetViewController];
    [v8 registerExternalBehaviorProvider:self];

    v5 = v9;
  }
}

- (void)dealloc
{
  [(SBNotificationBannerDestination *)self setAssistantController:0];
  [(SBNotificationBannerDestination *)self setLockScreenManager:0];
  [(BSInvalidatable *)self->_biometricMatchingAssertion invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SBNotificationBannerDestination;
  [(SBNotificationBannerDestination *)&v3 dealloc];
}

- (BOOL)_shouldForceDismisssIfStickyForReason:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:@"dismissOverlays"] & 1) != 0
    || ([v3 isEqualToString:@"SBBannerManagerDismissalReasonLock"] & 1) != 0
    || ([v3 isEqualToString:@"performSleep"] & 1) != 0
    || ([v3 isEqualToString:@"mainScreenAnimationController"] & 1) != 0)
  {
    char v4 = 1;
  }
  else
  {
    char v4 = [v3 isEqualToString:@"assistantWillAppear"];
  }

  return v4;
}

- (BOOL)shouldDismissForReason:(id)a3 outReason:(id *)a4
{
  BOOL v6 = [(SBNotificationBannerDestination *)self _shouldForceDismisssIfStickyForReason:a3];
  return [(SBNotificationBannerDestination *)self _shouldDismissPresentedBannerPerformingPreludeForcingIfSticky:v6 outReason:a4];
}

- (BOOL)isPresentingEmergencyNotification
{
  id v3 = [(SBNotificationBannerDestination *)self _presentedNotificationRequest];
  char v4 = [v3 options];
  if ([v4 revealsAdditionalContentOnPresentation]
    && [(SBNotificationBannerDestination *)self _isPresentingBannerInLongLook])
  {
    BOOL v5 = ![(SBNotificationBannerDestination *)self _isDismissingLongLookForBanner];
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (CGRect)presentedBannerScreenFrame
{
  double v3 = *MEMORY[0x1E4F1DB20];
  double v4 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double v5 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double v6 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  if ([(SBNotificationBannerDestination *)self _isPresentingBanner])
  {
    v7 = [(SBNotificationBannerDestination *)self _presentedNotificationPresentableVC];
    v8 = v7;
    if (v7)
    {
      v9 = [v7 notificationViewController];
      [v9 _lookView];
    }
    else
    {
      v9 = UIViewControllerFromPresentable();
      [v9 viewIfLoaded];
    uint64_t v10 = };

    if (v10)
    {
      [v10 bounds];
      double v12 = v11;
      double v14 = v13;
      double v16 = v15;
      double v18 = v17;
      v19 = [v10 window];
      v20 = [v19 screen];
      uint64_t v21 = [v20 fixedCoordinateSpace];
      objc_msgSend(v10, "convertRect:toCoordinateSpace:", v21, v12, v14, v16, v18);
      double v3 = v22;
      double v4 = v23;
      double v5 = v24;
      double v6 = v25;
    }
  }
  double v26 = v3;
  double v27 = v4;
  double v28 = v5;
  double v29 = v6;
  result.size.height = v29;
  result.size.width = v28;
  result.origin.y = v27;
  result.origin.x = v26;
  return result;
}

- (void)presentModalBannerAndExpandForNotificationRequest:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = (void *)*MEMORY[0x1E4FB3750];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEFAULT))
  {
    double v6 = v5;
    v7 = [v4 notificationIdentifier];
    v8 = objc_msgSend(v7, "un_logDigest");
    *(_DWORD *)buf = 138543362;
    double v11 = v8;
    _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "Presenting and expanding modal banner for notification %{public}@", buf, 0xCu);
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __85__SBNotificationBannerDestination_presentModalBannerAndExpandForNotificationRequest___block_invoke;
  v9[3] = &unk_1E6AF4AC0;
  v9[4] = self;
  [(SBNotificationBannerDestination *)self _postNotificationRequest:v4 modal:0 completion:v9];
}

void __85__SBNotificationBannerDestination_presentModalBannerAndExpandForNotificationRequest___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _presentedNotificationPresentableVC];
  v1 = [v2 notificationViewController];
  [v1 expandAndPlayMedia];
}

- (void)registerNotificationBannerDestinationObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(SBNotificationBannerDestination *)self destinationObservers];
  [v5 addObject:v4];
}

- (void)unregisterNotificationBannerDestinationObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(SBNotificationBannerDestination *)self destinationObservers];
  [v5 removeObject:v4];
}

- (BOOL)isAlertDestination
{
  return 1;
}

- (NSString)identifier
{
  return (NSString *)(id)*MEMORY[0x1E4FB3848];
}

- (BSServiceConnectionEndpoint)endpoint
{
  return (BSServiceConnectionEndpoint *)MEMORY[0x1F415C338](self, a2);
}

- (BOOL)canReceiveNotificationRequest:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(SBNotificationBannerDestination *)self _isPresentingStickyBanner]
    || [(SBNotificationBannerDestination *)self isUserInteractionInProgress])
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    int v5 = ![(SBNotificationBannerDestination *)self _isInSetupMode];
  }
  BOOL v6 = [(SBNotificationBannerDestination *)self _canReceiveNotificationRequestIfLocked:v4];
  BOOL v7 = [(SBNotificationBannerDestination *)self _canReceiveNotificationRequestIfAmbientPresented:v4];
  BOOL v8 = v5 & v6 & v7;
  v9 = (void *)*MEMORY[0x1E4FB3750];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEFAULT))
  {
    log = v9;
    uint64_t v10 = [(SBNotificationBannerDestination *)self identifier];
    double v14 = [v4 notificationIdentifier];
    double v11 = objc_msgSend(v14, "un_logDigest");
    uint64_t v12 = NSStringFromBOOL();
    *(_DWORD *)buf = 138545154;
    double v17 = v10;
    __int16 v18 = 2114;
    v19 = v11;
    __int16 v20 = 2114;
    uint64_t v21 = v12;
    __int16 v22 = 1024;
    BOOL v23 = [(SBNotificationBannerDestination *)self _isPresentingStickyBanner];
    __int16 v24 = 1024;
    BOOL v25 = [(SBNotificationBannerDestination *)self isUserInteractionInProgress];
    __int16 v26 = 1024;
    BOOL v27 = [(SBNotificationBannerDestination *)self _isInSetupMode];
    __int16 v28 = 1024;
    BOOL v29 = v6;
    __int16 v30 = 1024;
    BOOL v31 = v7;
    _os_log_impl(&dword_1D85BA000, log, OS_LOG_TYPE_DEFAULT, "Destination %{public}@ can receive notification %{public}@: %{public}@ [ stickyVisible: %d isUserInteractionInProgress: %d inSetupMode: %d canReceiveNotificationRequestIfLocked: %d canReceiveIfAmbientPresented: %d ]", buf, 0x3Eu);
  }
  return v8;
}

- (void)postNotificationRequest:(id)a3
{
}

- (void)modifyNotificationRequest:(id)a3
{
  id v4 = a3;
  if ([(SBNotificationBannerDestination *)self _presentedBannerMatchesNotificationRequest:v4])
  {
    int v5 = (void *)*MEMORY[0x1E4FB3750];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEBUG)) {
      -[SBNotificationBannerDestination modifyNotificationRequest:](v5, v4);
    }
    BOOL v6 = [(SBNotificationBannerDestination *)self _presentedNotificationPresentableVC];
    BOOL v7 = [v6 notificationViewController];

    [v7 setNotificationRequest:v4];
    BOOL v8 = (void *)MEMORY[0x1E4F42FF0];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __61__SBNotificationBannerDestination_modifyNotificationRequest___block_invoke;
    v10[3] = &unk_1E6AF4AC0;
    id v11 = v7;
    id v9 = v7;
    [v8 animateWithDuration:v10 animations:0.25];
  }
}

uint64_t __61__SBNotificationBannerDestination_modifyNotificationRequest___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateContent];
}

- (void)withdrawNotificationRequest:(id)a3
{
  id v4 = a3;
  if (![(SBNotificationBannerDestination *)self _isPresentingBannerInLongLook]
    && [(SBNotificationBannerDestination *)self _isPresentingStickyBanner]
    && [(SBNotificationBannerDestination *)self _presentedBannerMatchesNotificationRequest:v4])
  {
    int v5 = (void *)*MEMORY[0x1E4FB3750];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEBUG)) {
      -[SBNotificationBannerDestination withdrawNotificationRequest:](v5, v4);
    }
    [(SBNotificationBannerDestination *)self _dismissPresentedBannerOnly:0 reason:@"SBBannerRevocationReasonBannerDestinationWithdraw" animated:1 forceIfSticky:1];
  }
}

- (BOOL)handleHomeButtonPress
{
  if (![(SBNotificationBannerDestination *)self _isPresentingBanner]
    || ![(SBNotificationBannerDestination *)self _isPresentingBannerInLongLook]
    && ![(SBNotificationBannerDestination *)self _isPresentingStickyBanner])
  {
    return 0;
  }
  [(SBNotificationBannerDestination *)self _performCancelAction];
  BOOL v3 = 1;
  [(SBNotificationBannerDestination *)self _dismissPresentedBannerAnimated:1 reason:@"SBBannerRevocationReasonBannerDestinationHomeButtonPress" forceIfSticky:1];
  return v3;
}

- (void)prepareDestinationToReceiveCriticalNotificationRequest:(id)a3
{
  if ([(SBNotificationBannerDestination *)self _isPresentingBannerInLongLook]
    || [(SBNotificationBannerDestination *)self _isPresentingStickyBanner])
  {
    id v4 = [(SBNotificationBannerDestination *)self _presentedNotificationRequest];
    int v5 = [v4 options];
    char v6 = [v5 revealsAdditionalContentOnPresentation];

    if ((v6 & 1) == 0)
    {
      [(SBNotificationBannerDestination *)self _performCancelAction];
      [(SBNotificationBannerDestination *)self _dismissPresentedBannerAnimated:1 reason:@"SBBannerRevocationReasonBannerDestinationCriticalRequest" forceIfSticky:1];
    }
  }
}

- (void)destinationDidBecomeDisabled
{
}

- (BOOL)isNotificationContentExtensionVisible:(id)a3
{
  id v4 = a3;
  int v5 = [(SBNotificationBannerDestination *)self _presentedNotificationPresentableVC];
  char v6 = [v5 notificationViewController];
  char v7 = [v6 isContentExtensionVisible:v4];

  return v7;
}

- (void)presentableWillNotAppearAsBanner:(id)a3 withReason:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = (void *)*MEMORY[0x1E4FB3750];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEFAULT))
  {
    id v9 = v8;
    uint64_t v10 = [(SBNotificationBannerDestination *)self identifier];
    int v12 = 138543874;
    double v13 = v10;
    __int16 v14 = 2114;
    id v15 = v6;
    __int16 v16 = 2114;
    id v17 = v7;
    _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "Destination %{public}@ presentable %{public}@ will NOT appear as banner with reason '%{public}@'", (uint8_t *)&v12, 0x20u);
  }
  [(SBNotificationBannerDestination *)self _cancelReplaceAndDismissTimers];
  [(SBNotificationBannerDestination *)self _dismissPresentableCompleted:v6];
  objc_getAssociatedObject(v6, &_SBNotificationBannerDestinationBannerRequestCompletion);
  id v11 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(v6, &_SBNotificationBannerDestinationBannerRequestCompletion, 0, (void *)1);
  if (v11) {
    v11[2](v11);
  }
}

- (void)presentableWillAppearAsBanner:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = (void *)*MEMORY[0x1E4FB3750];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEFAULT))
  {
    id v7 = v6;
    BOOL v8 = [(SBNotificationBannerDestination *)self identifier];
    *(_DWORD *)buf = 138543618;
    id v17 = v8;
    __int16 v18 = 2114;
    id v19 = v5;
    _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "Destination %{public}@ presentable will appear as banner: %{public}@", buf, 0x16u);
  }
  [(SBNotificationBannerDestination *)self _cancelReplaceAndDismissTimers];
  id v9 = [(SBNotificationBannerDestination *)self _requestFromPresentable:v5];
  if (!v9)
  {
    id v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"SBNotificationBannerDestination.m", 337, @"Presentable doesn't have a notification request: %@", v5 object file lineNumber description];
  }
  uint64_t v10 = [(id)SBApp bannerManager];
  id v11 = [v10 windowSceneForPresentable:self->_presentedPresentable];
  int v12 = [v10 bannerWindowInWindowScene:v11];
  double v13 = objc_msgSend(v12, "sb_coronaAnimationController");
  [v13 addParticipant:self];

  __int16 v14 = [(SBNotificationBannerDestination *)self delegate];
  [v14 destination:self willPresentNotificationRequest:v9 suppressAlerts:0];

  [(SBNotificationBannerDestination *)self _requestBiometricAuthIfAmbientPresentedForNotificationRequest:v9];
}

- (void)presentableDidAppearAsBanner:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = (os_log_t *)MEMORY[0x1E4FB3750];
  id v7 = (void *)*MEMORY[0x1E4FB3750];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEFAULT))
  {
    BOOL v8 = v7;
    id v9 = [(SBNotificationBannerDestination *)self identifier];
    *(_DWORD *)buf = 138543618;
    BOOL v27 = v9;
    __int16 v28 = 2114;
    id v29 = v5;
    _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "Destination %{public}@ presentable did appear as banner: %{public}@", buf, 0x16u);
  }
  uint64_t v10 = [(SBNotificationBannerDestination *)self _requestFromPresentable:v5];
  if (!v10)
  {
    BOOL v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2, self, @"SBNotificationBannerDestination.m", 347, @"Presentable doesn't have a notification request: %@", v5 object file lineNumber description];
  }
  id v11 = [v10 options];
  int v12 = [v11 dismissAutomatically];

  if (v12) {
    [(SBNotificationBannerDestination *)self _startReplaceAndDismissTimersForRequest:v10];
  }
  if ([(SBNotificationBannerDestination *)self isPreventingAutomaticLock])
  {
    double v13 = +[SBIdleTimerGlobalCoordinator sharedInstance];
    __int16 v14 = [v13 acquireIdleTimerDisableAssertionForReason:@"SBNotificationBannerDestination"];
    idleTimerDisableAssertion = self->_idleTimerDisableAssertion;
    self->_idleTimerDisableAssertion = v14;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained destination:self didPresentNotificationRequest:v10];
  objc_getAssociatedObject(v5, &_SBNotificationBannerDestinationBannerRequestCompletion);
  id v17 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(v5, &_SBNotificationBannerDestinationBannerRequestCompletion, 0, (void *)1);
  if (v17) {
    v17[2](v17);
  }
  if (UIAccessibilityIsReduceTransparencyEnabled())
  {
    __int16 v18 = +[SBBacklightController sharedInstanceIfExists];
    uint64_t v19 = [v18 backlightState];

    if (v19 == 1)
    {
      uint64_t v20 = [(SBNotificationBannerDestination *)self _notificationViewControllerFromPresentable:v5];
      [v20 setContentReplacedWithSnapshot:1];
    }
    else
    {
      objc_storeWeak((id *)&self->_presentablePendingSnapshot, v5);
      os_log_t v21 = *v6;
      if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v22 = v21;
        BOOL v23 = [(SBNotificationBannerDestination *)self identifier];
        __int16 v24 = SBBacklightStateDescription(v19);
        *(_DWORD *)buf = 138543618;
        BOOL v27 = v23;
        __int16 v28 = 2114;
        id v29 = v24;
        _os_log_impl(&dword_1D85BA000, v22, OS_LOG_TYPE_DEFAULT, "Destination %{public}@ reduce transparency enabled, but backlight factor is %{public}@ – deferring", buf, 0x16u);
      }
    }
  }
}

- (void)presentableWillDisappearAsBanner:(id)a3 withReason:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = (BNPresentable *)a3;
  id v8 = a4;
  id v9 = (void *)*MEMORY[0x1E4FB3750];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = v9;
    id v11 = [(SBNotificationBannerDestination *)self identifier];
    *(_DWORD *)buf = 138543874;
    __int16 v16 = v11;
    __int16 v17 = 2114;
    __int16 v18 = v7;
    __int16 v19 = 2114;
    id v20 = v8;
    _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_DEFAULT, "Destination %{public}@ presentable %{public}@ will disappear as banner with reason '%{public}@'", buf, 0x20u);
  }
  if (self->_presentedPresentable == v7)
  {
    [(BSInvalidatable *)self->_bannerGestureRecognizerPriorityAssertion invalidate];
    bannerGestureRecognizerPriorityAssertion = self->_bannerGestureRecognizerPriorityAssertion;
    self->_bannerGestureRecognizerPriorityAssertion = 0;

    double v13 = [(SBNotificationBannerDestination *)self _requestFromPresentable:v7];
    if (!v13)
    {
      __int16 v14 = [MEMORY[0x1E4F28B00] currentHandler];
      [v14 handleFailureInMethod:a2, self, @"SBNotificationBannerDestination.m", 378, @"Presentable doesn't have a notification request: %@", v7 object file lineNumber description];
    }
    if (([v8 isEqualToString:@"SBBannerManagerDismissalReasonLock"] & 1) != 0
      || ([v8 isEqualToString:@"performSleep"] & 1) != 0
      || ([v8 isEqualToString:*MEMORY[0x1E4F4F590]] & 1) != 0
      || [v8 isEqualToString:*MEMORY[0x1E4F4F598]])
    {
      [(SBNotificationBannerDestination *)self _performSilenceAction];
    }
    else if (([v8 isEqualToString:@"assistantWillAppear"] & 1) != 0 {
           || ([v8 isEqualToString:@"dismissOverlays"] & 1) != 0
    }
           || [v8 isEqualToString:@"SBBannerRevocationReasonBannerDestinationDisabled"])
    {
      [(SBNotificationBannerDestination *)self _performCancelAction];
    }
  }
}

- (void)presentableDidDisappearAsBanner:(id)a3 withReason:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = (BNPresentable *)a3;
  id v8 = a4;
  id v9 = (void *)*MEMORY[0x1E4FB3750];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = v9;
    id v11 = [(SBNotificationBannerDestination *)self identifier];
    *(_DWORD *)buf = 138543874;
    id v20 = v11;
    __int16 v21 = 2114;
    __int16 v22 = v7;
    __int16 v23 = 2114;
    id v24 = v8;
    _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_DEFAULT, "Destination %{public}@ presentable %{public}@ did disappear as banner with reason '%{public}@'", buf, 0x20u);
  }
  if (self->_presentedPresentable == v7)
  {
    int v12 = [(SBNotificationBannerDestination *)self _requestFromPresentable:v7];
    if (!v12)
    {
      __int16 v18 = [MEMORY[0x1E4F28B00] currentHandler];
      [v18 handleFailureInMethod:a2, self, @"SBNotificationBannerDestination.m", 391, @"Presentable doesn't have a notification request: %@", v7 object file lineNumber description];
    }
    if (![(SBNotificationBannerDestination *)self _isPresentingBannerInLongLook]) {
      [(SBNotificationBannerDestination *)self _cancelReplaceAndDismissTimers];
    }
    [(SBNotificationBannerDestination *)self _dismissPresentableCompleted:v7];
    double v13 = [(SBNotificationBannerDestination *)self delegate];
    [v13 destination:self didDismissNotificationRequest:v12];

    [(SBNotificationBannerDestination *)self _updateMotionGestureObservation];
    idleTimerDisableAssertion = self->_idleTimerDisableAssertion;
    if (idleTimerDisableAssertion)
    {
      [(BSInvalidatable *)idleTimerDisableAssertion invalidate];
      id v15 = self->_idleTimerDisableAssertion;
      self->_idleTimerDisableAssertion = 0;
    }
    starModeDisableAssertion = self->_starModeDisableAssertion;
    if (starModeDisableAssertion)
    {
      [(BSInvalidatable *)starModeDisableAssertion invalidate];
      __int16 v17 = self->_starModeDisableAssertion;
      self->_starModeDisableAssertion = 0;
    }
    [(SBNotificationBannerDestination *)self _invalidateBiometricAuthIfNecessary];
  }
}

- (void)userInteractionWillBeginForBannerForPresentable:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)*MEMORY[0x1E4FB3750];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v5;
    id v7 = [(SBNotificationBannerDestination *)self identifier];
    int v8 = 138543618;
    id v9 = v7;
    __int16 v10 = 2114;
    id v11 = v4;
    _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "Destination %{public}@ presentable will begin user interaction: %{public}@", (uint8_t *)&v8, 0x16u);
  }
  if (objc_opt_respondsToSelector()) {
    [(SBNotificationBannerDestination *)self _userInteractionWillBeginForRequestPresenter:v4];
  }
}

- (void)userInteractionDidEndForBannerForPresentable:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)*MEMORY[0x1E4FB3750];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v5;
    id v7 = [(SBNotificationBannerDestination *)self identifier];
    int v8 = 138543618;
    id v9 = v7;
    __int16 v10 = 2114;
    id v11 = v4;
    _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "Destination %{public}@ presentable did end user interaction: %{public}@", (uint8_t *)&v8, 0x16u);
  }
  if (objc_opt_respondsToSelector()) {
    [(SBNotificationBannerDestination *)self _userInteractionDidEndForRequestPresenter:v4];
  }
}

- (BOOL)notificationPresentableViewControllerShouldPresentLongLook:(id)a3
{
  return objc_msgSend(a3, "bs_isAppearingOrAppeared");
}

- (void)notificationPresentableViewController:(id)a3 presentationSize:(CGSize *)a4 containerSize:(CGSize *)a5
{
  if (a5)
  {
    id v7 = (void *)SBApp;
    id v8 = a3;
    id v34 = [v7 bannerManager];
    id v9 = [v34 windowSceneForPresentable:v8];

    if (v9)
    {
      id v10 = v9;
    }
    else
    {
      id v11 = [(id)SBApp windowSceneManager];
      id v10 = [v11 activeDisplayWindowScene];
    }
    uint64_t v12 = [v34 bannerWindowInWindowScene:v10];
    [v12 bounds];
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;

    a5->width = v18;
    a5->height = v20;
    if (a4)
    {
      __int16 v21 = [v34 layoutManagerInWindowScene:v10];
      __int16 v22 = [v10 screen];
      objc_msgSend(v21, "useableContainerFrameInContainerBounds:onScreen:", v22, v14, v16, v18, v20);
      double v24 = v23;
      double v26 = v25;
      double v28 = v27;
      double v30 = v29;
      [v22 scale];
      objc_msgSend(v21, "presentedFrameForContentWithPreferredSize:inUseableContainerFrame:containerBounds:scale:", v28, v30, v24, v26, v28, v30, *(void *)&v14, *(void *)&v16, *(void *)&v18, *(void *)&v20, v31);
      a4->width = v32;
      a4->height = v33;
    }
  }
}

- (id)notificationRequestPresenter:(id)a3 staticContentProviderForNotificationRequest:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass)
  {
    id v11 = v16;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __108__SBNotificationBannerDestination_notificationRequestPresenter_staticContentProviderForNotificationRequest___block_invoke;
    v16[3] = &unk_1E6AFD828;
    id v4 = (id *)v17;
    v17[0] = v8;
    v17[1] = self;
    id v5 = &v18;
    uint64_t v12 = 0;
    id v18 = v9;
  }
  else
  {
    uint64_t v12 = objc_opt_class();
    id v11 = 0;
  }
  double v13 = (void *)MEMORY[0x1D948C7A0](v11);
  double v14 = [(SBNotificationBannerDestination *)self _staticContentProviderForViewController:v8 class:v12 notificationRequest:v9 test:v13];

  if (isKindOfClass)
  {
  }
  return v14;
}

uint64_t __108__SBNotificationBannerDestination_notificationRequestPresenter_staticContentProviderForNotificationRequest___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  if ([*(id *)(a1 + 40) _isContentSuppressedForNotificationRequest:*(void *)(a1 + 48)]
    && ([v2 hasCommittedToPresentingCustomContentProvidingViewController] & 1) == 0)
  {
    uint64_t v3 = [v2 isShortLook];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

- (void)notificationRequestPresenter:(id)a3 shouldTransitionToStage:(id)a4 forTrigger:(int64_t)a5 completionBlock:(id)a6
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  uint64_t v12 = (id *)a4;
  double v26 = a6;
  double v13 = (void *)*MEMORY[0x1E4FB3750];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEFAULT))
  {
    double v14 = v13;
    double v15 = [(SBNotificationBannerDestination *)self identifier];
    double v16 = NCStringFromStageChangeTrigger();
    *(_DWORD *)buf = 138544130;
    v35 = v15;
    __int16 v36 = 2114;
    id v37 = v11;
    __int16 v38 = 2114;
    v39 = v12;
    __int16 v40 = 2114;
    v41 = v16;
    _os_log_impl(&dword_1D85BA000, v14, OS_LOG_TYPE_DEFAULT, "Destination %{public}@ request presenter '%{public}@' requesting transition to stage '%{public}@' for triger '%{public}@'", buf, 0x2Au);
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (objc_opt_respondsToSelector())
  {
    id v18 = [v11 notificationRequest];
  }
  else
  {
    id v18 = 0;
  }
  int64_t v19 = a5;
  double v25 = v12;
  if (isKindOfClass)
  {
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __115__SBNotificationBannerDestination_notificationRequestPresenter_shouldTransitionToStage_forTrigger_completionBlock___block_invoke;
    v32[3] = &unk_1E6AF5420;
    double v20 = (id *)v33;
    v33[0] = v11;
    v33[1] = self;
    __int16 v21 = (void *)MEMORY[0x1D948C7A0](v32);
    __int16 v22 = v26;
  }
  else
  {
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __115__SBNotificationBannerDestination_notificationRequestPresenter_shouldTransitionToStage_forTrigger_completionBlock___block_invoke_56;
    v30[3] = &unk_1E6AF5420;
    double v20 = (id *)v31;
    id v23 = v11;
    v31[0] = v23;
    v31[1] = self;
    __int16 v21 = (void *)MEMORY[0x1D948C7A0](v30);
    __int16 v22 = v27;
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __115__SBNotificationBannerDestination_notificationRequestPresenter_shouldTransitionToStage_forTrigger_completionBlock___block_invoke_59;
    v27[3] = &unk_1E6AF5AA0;
    uint64_t v12 = &v28;
    id v28 = v23;
    id v6 = (id *)&v29;
    double v29 = v26;
  }
  double v24 = (void *)MEMORY[0x1D948C7A0](v22);
  [(SBNotificationBannerDestination *)self _handleExpansionRequestForViewController:v11 notificationRequest:v18 forTrigger:v19 test:v21 completionBlock:v24];

  if ((isKindOfClass & 1) == 0)
  {
  }
}

uint64_t __115__SBNotificationBannerDestination_notificationRequestPresenter_shouldTransitionToStage_forTrigger_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) _presentedNotificationPresentableVC];
  id v4 = [v3 notificationViewController];

  if (v2 == v4
    && ((objc_msgSend(v3, "bs_isDisappearingOrDisappeared") & 1) != 0
     || [v3 bannerAppearState] == 3
     || ![v3 bannerAppearState]))
  {
    id v7 = (void *)*MEMORY[0x1E4FB3750];
    uint64_t v5 = 0;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEFAULT))
    {
      id v8 = *(void **)(a1 + 40);
      id v9 = v7;
      id v10 = [v8 identifier];
      uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 48);
      int v12 = 138543618;
      double v13 = v10;
      __int16 v14 = 2114;
      uint64_t v15 = v11;
      _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "Destination %{public}@ presentable requesting finishing long look transition, but is disappearing or disappeared: %{public}@", (uint8_t *)&v12, 0x16u);

      uint64_t v5 = 0;
    }
  }
  else
  {
    uint64_t v5 = 1;
  }

  return v5;
}

uint64_t __115__SBNotificationBannerDestination_notificationRequestPresenter_shouldTransitionToStage_forTrigger_completionBlock___block_invoke_56(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  BOOL v2 = (objc_opt_respondsToSelector() & 1) != 0 && [*(id *)(a1 + 32) bannerStage] > 1;
  int v3 = objc_msgSend(*(id *)(a1 + 32), "bs_isDisappearingOrDisappeared") | v2;
  if (v3 == 1)
  {
    id v4 = (void *)*MEMORY[0x1E4FB3750];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void **)(a1 + 40);
      id v6 = v4;
      id v7 = [v5 identifier];
      uint64_t v8 = *(void *)(a1 + 32);
      int v10 = 138543618;
      uint64_t v11 = v7;
      __int16 v12 = 2114;
      uint64_t v13 = v8;
      _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "Destination %{public}@ request presenter requesting transition to detail stage, but is disappearing or already transitioned: %{public}@", (uint8_t *)&v10, 0x16u);
    }
  }
  return v3 ^ 1u;
}

uint64_t __115__SBNotificationBannerDestination_notificationRequestPresenter_shouldTransitionToStage_forTrigger_completionBlock___block_invoke_59(uint64_t a1, int a2)
{
  if (a2 && (objc_opt_respondsToSelector() & 1) != 0) {
    [*(id *)(a1 + 32) invalidateStaticContent];
  }
  int v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v3();
}

- (void)notificationRequestPresenter:(id)a3 executeAction:(id)a4 withParameters:(id)a5 completion:(id)a6
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  __int16 v12 = (__CFString *)a5;
  id v13 = a6;
  uint64_t v14 = (void *)*MEMORY[0x1E4FB3750];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = v14;
    uint64_t v16 = [(SBNotificationBannerDestination *)self identifier];
    double v17 = [v11 identifier];
    uint64_t v18 = [(__CFString *)v12 count];
    int64_t v19 = @"{}";
    *(_DWORD *)buf = 138543875;
    double v30 = v16;
    if (v18) {
      int64_t v19 = v12;
    }
    __int16 v31 = 2114;
    CGFloat v32 = v17;
    __int16 v33 = 2113;
    id v34 = v19;
    _os_log_impl(&dword_1D85BA000, v15, OS_LOG_TYPE_DEFAULT, "Destination %{public}@ executing action %{public}@ with parameters %{private}@", buf, 0x20u);
  }
  if (objc_opt_respondsToSelector())
  {
    double v20 = [v10 notificationRequest];
  }
  else
  {
    double v20 = 0;
  }
  __int16 v21 = [(SBNotificationBannerDestination *)self delegate];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __104__SBNotificationBannerDestination_notificationRequestPresenter_executeAction_withParameters_completion___block_invoke;
  v25[3] = &unk_1E6AF4DB0;
  v25[4] = self;
  id v26 = v20;
  id v27 = v11;
  id v28 = v13;
  id v22 = v13;
  id v23 = v11;
  id v24 = v20;
  [v21 destination:self executeAction:v23 forNotificationRequest:v24 requestAuthentication:1 withParameters:v12 completion:v25];
}

uint64_t __104__SBNotificationBannerDestination_notificationRequestPresenter_executeAction_withParameters_completion___block_invoke(uint64_t a1, int a2)
{
  if (a2 && ([*(id *)(a1 + 32) _isPresentingBannerInLongLook] & 1) == 0)
  {
    int v3 = [*(id *)(a1 + 40) defaultAction];
    id v4 = v3;
    if (v3 != *(void **)(a1 + 48))
    {
      uint64_t v5 = [*(id *)(a1 + 40) options];
      if ([v5 displaysActionsInline])
      {
        id v6 = [*(id *)(a1 + 40) supplementaryActions];
        id v7 = [v6 objectForKey:*MEMORY[0x1E4FB3740]];
        if ([v7 containsObject:*(void *)(a1 + 48)])
        {
          uint64_t v8 = [*(id *)(a1 + 48) activationMode];

          if (v8 == 1) {
            goto LABEL_12;
          }
LABEL_9:
          [*(id *)(a1 + 32) _dismissPresentedBannerOnly:0 reason:@"SBBannerRevocationReasonBannerDestinationBackgroundDefaultAction" animated:1 forceIfSticky:1];
          goto LABEL_12;
        }
      }
      goto LABEL_12;
    }
    uint64_t v9 = [v3 activationMode];

    if (v9 == 1) {
      goto LABEL_12;
    }
    goto LABEL_9;
  }
LABEL_12:
  uint64_t result = *(void *)(a1 + 56);
  if (result)
  {
    id v11 = *(uint64_t (**)(void))(result + 16);
    return v11();
  }
  return result;
}

- (id)notificationRequestPresenterNotificationUsageTrackingState:(id)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = *MEMORY[0x1E4FB3898];
  int v3 = [(SBNotificationBannerDestination *)self identifier];
  v7[0] = v3;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];

  return v4;
}

- (void)notificationRequestPresenter:(id)a3 didVendTransitionBlockingAssertion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SBNotificationBannerDestination *)self _presentedNotificationRequestPresenter];

  if (v8 == v6)
  {
    [(SBNotificationBannerDestination *)self _cancelReplaceAndDismissTimers];
    objc_initWeak(&location, self);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __99__SBNotificationBannerDestination_notificationRequestPresenter_didVendTransitionBlockingAssertion___block_invoke;
    v9[3] = &unk_1E6B032B0;
    objc_copyWeak(&v12, &location);
    id v10 = v6;
    id v11 = self;
    [v7 addInvalidationBlock:v9];

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

void __99__SBNotificationBannerDestination_notificationRequestPresenter_didVendTransitionBlockingAssertion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  int v3 = *(void **)(a1 + 32);
  id v7 = WeakRetained;
  id v4 = [WeakRetained _presentedNotificationRequestPresenter];

  if (v3 == v4)
  {
    uint64_t v5 = *(void **)(a1 + 40);
    id v6 = [*(id *)(a1 + 32) notificationRequest];
    [v5 _startReplaceAndDismissTimersForRequest:v6];
  }
}

- (void)notificationViewController:(id)a3 requestPermissionToExecuteAction:(id)a4 withParameters:(id)a5 completion:(id)a6
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = (__CFString *)a5;
  id v13 = a6;
  uint64_t v14 = (void *)*MEMORY[0x1E4FB3750];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = v14;
    uint64_t v16 = [(SBNotificationBannerDestination *)self identifier];
    double v17 = [v11 identifier];
    uint64_t v18 = [(__CFString *)v12 count];
    int64_t v19 = @"{}";
    *(_DWORD *)id v22 = 138543875;
    *(void *)&v22[4] = v16;
    if (v18) {
      int64_t v19 = v12;
    }
    *(_WORD *)&v22[12] = 2114;
    *(void *)&v22[14] = v17;
    __int16 v23 = 2113;
    id v24 = v19;
    _os_log_impl(&dword_1D85BA000, v15, OS_LOG_TYPE_DEFAULT, "Destination %{public}@ requesting permission to execute action %{public}@ with parameters %{private}@", v22, 0x20u);
  }
  double v20 = objc_msgSend(v10, "notificationRequest", *(_OWORD *)v22);
  __int16 v21 = [(SBNotificationBannerDestination *)self delegate];
  [v21 destination:self requestPermissionToExecuteAction:v11 forNotificationRequest:v20 withParameters:v12 completion:v13];
}

- (void)notificationViewControllerWillDismissForCancelAction:(id)a3
{
}

- (void)notificationViewController:(id)a3 dragInteraction:(id)a4 sessionWillBegin:(id)a5
{
}

- (void)notificationViewController:(id)a3 dragInteraction:(id)a4 session:(id)a5 willEndWithOperation:(unint64_t)a6
{
  if ((a6 & 0xFFFFFFFFFFFFFFFELL) == 2) {
    [(SBNotificationBannerDestination *)self _dismissPresentedBannerAnimated:0 reason:@"SBBannerRevocationReasonBannerDestinationDragAndDrop" forceIfSticky:1];
  }
}

- (void)notificationViewController:(id)a3 dragInteraction:(id)a4 session:(id)a5 didEndWithOperation:(unint64_t)a6
{
  id v7 = (NCNotificationViewController *)a3;
  if (self->_notificationViewControllerForActiveDragSession == v7)
  {
    self->_notificationViewControllerForActiveDragSession = 0;
    id v8 = v7;

    id v7 = v8;
  }
}

- (BOOL)notificationViewControllerShouldPan:(id)a3
{
  return 1;
}

- (BOOL)notificationViewControllerShouldInterpretTapAsDefaultAction:(id)a3
{
  return 1;
}

- (BOOL)notificationViewControllerShouldSupportExpandedPlatterInteraction:(id)a3
{
  return ![(SBNotificationBannerDestination *)self _shouldAllowDragInteraction];
}

- (BOOL)notificationViewControllerShouldAllowExpandedPlatterInteraction:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SBNotificationBannerDestination *)self _presentedNotificationPresentableVC];
  id v6 = [v5 notificationViewController];

  if (v6 != v4) {
    goto LABEL_2;
  }
  if (!objc_msgSend(v5, "bs_isAppearingOrAppeared"))
  {
    BOOL v7 = 0;
    goto LABEL_3;
  }
  if ([v5 bannerAppearState] == 1) {
LABEL_2:
  }
    BOOL v7 = 1;
  else {
    BOOL v7 = [v5 bannerAppearState] == 2;
  }
LABEL_3:

  return v7;
}

- (id)notificationViewControllerContainerViewProviderForExpandedContent:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SBNotificationBannerDestination *)self _presentedNotificationPresentableVC];
  id v6 = [v5 notificationViewController];

  if (v6 == v4)
  {
    id v8 = objc_alloc(MEMORY[0x1E4FA79B0]);
    uint64_t v9 = [v5 view];
    BOOL v7 = (void *)[v8 initWithRequester:v4 containerView:v9 reason:@"Container view requested for notification banner" invalidationBlock:0];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)notificationViewController:(id)a3 auxiliaryOptionsContentProviderForNotificationRequest:(id)a4 withLongLook:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  id v8 = [v7 sectionIdentifier];
  uint64_t v9 = [(SBNotificationBannerDestination *)self _notificationSectionSettingsForSectionIdentifier:v8];
  int v10 = [v9 isUserConfigurable];

  id v11 = 0;
  if (v10 && v5) {
    id v11 = (void *)[objc_alloc(MEMORY[0x1E4FB38F0]) initWithNotificationRequest:v7 managementDelegate:self];
  }

  return v11;
}

- (void)longLookWillPresentForNotificationViewController:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(SBNotificationBannerDestination *)self _shouldHideStatusBar])
  {
    [MEMORY[0x1E4F42FF0] _currentAnimationDuration];
    -[SBNotificationBannerDestination _setStatusBarsHidden:withDuration:](self, "_setStatusBarsHidden:withDuration:", 1);
  }
  BOOL v5 = [(SBNotificationBannerDestination *)self resignActiveAssertion];
  id v6 = [v4 _fbsDisplayIdentity];
  objc_msgSend(v5, "sb_acquireForDisplayIdentity:", v6);

  [(SBNotificationBannerDestination *)self _cancelReplaceAndDismissTimers];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = [(SBNotificationBannerDestination *)self destinationObservers];
  id v8 = (void *)[v7 copy];

  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v14 + 1) + 8 * v12);
        if (objc_opt_respondsToSelector()) {
          [v13 notificationBannerDestinationWillPresentLongLook:self];
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }
}

- (void)longLookDidPresentForNotificationViewController:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [v4 notificationRequest];
  id v6 = (void *)*MEMORY[0x1E4FB3750];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEFAULT))
  {
    id v7 = v6;
    id v8 = [v5 notificationIdentifier];
    uint64_t v9 = objc_msgSend(v8, "un_logDigest");
    *(_DWORD *)buf = 138543362;
    double v30 = v9;
    _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "Long look presented for notification %{public}@", buf, 0xCu);
  }
  uint64_t v10 = [v5 options];
  char v11 = [v10 revealsAdditionalContentOnPresentation];

  if (v11)
  {
    if ([(SBNotificationBannerDestination *)self _isContentSuppressedForNotificationRequest:v5])
    {
      [v4 invalidateContentProviders];
    }
  }
  else
  {
    [(SBNotificationBannerDestination *)self _setReadyForNotificationRequestsCoalescingWith:v5];
  }
  uint64_t v12 = +[SBKeyboardFocusCoordinator sharedInstance];
  id v13 = [v4 _sbWindowScene];
  long long v14 = +[SBKeyboardFocusArbitrationReason longLookDidPresentForNotificationViewController];
  [v12 requestArbitrationForSBWindowScene:v13 forReason:v14];

  long long v15 = [(SBNotificationBannerDestination *)self lockScreenManager];
  long long v16 = [v15 coverSheetViewController];
  [v16 externalBehaviorProviderBehaviorChanged:self];

  [(SBNotificationBannerDestination *)self _updateMotionGestureObservation];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v17 = [(SBNotificationBannerDestination *)self destinationObservers];
  uint64_t v18 = (void *)[v17 copy];

  uint64_t v19 = [v18 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v25 != v21) {
          objc_enumerationMutation(v18);
        }
        __int16 v23 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        if (objc_opt_respondsToSelector()) {
          [v23 notificationBannerDestinationDidPresentLongLook:self];
        }
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v20);
  }
}

- (void)longLookWillDismissForNotificationViewController:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(SBNotificationBannerDestination *)self _shouldHideStatusBar])
  {
    [MEMORY[0x1E4F42FF0] _currentAnimationDuration];
    -[SBNotificationBannerDestination _setStatusBarsHidden:withDuration:](self, "_setStatusBarsHidden:withDuration:", 0);
  }
  BOOL v5 = [v4 notificationRequest];
  id v6 = [v5 options];
  char v7 = [v6 revealsAdditionalContentOnPresentation];

  if ((v7 & 1) == 0)
  {
    id v8 = [v4 _lookView];
    [v8 setHidden:1];
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v9 = [(SBNotificationBannerDestination *)self destinationObservers];
  uint64_t v10 = (void *)[v9 copy];

  uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v17;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v10);
        }
        long long v15 = *(void **)(*((void *)&v16 + 1) + 8 * v14);
        if (objc_opt_respondsToSelector()) {
          [v15 notificationBannerDestinationWillDismissLongLook:self];
        }
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v12);
  }
}

- (void)longLookDidDismissForNotificationViewController:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [v4 notificationRequest];
  id v6 = (void *)*MEMORY[0x1E4FB3750];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEFAULT))
  {
    char v7 = v6;
    id v8 = [v5 notificationIdentifier];
    uint64_t v9 = objc_msgSend(v8, "un_logDigest");
    *(_DWORD *)buf = 138543362;
    __int16 v33 = v9;
    _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "Long look dismissed for notification %{public}@", buf, 0xCu);
  }
  uint64_t v10 = [(SBNotificationBannerDestination *)self delegate];
  [v10 destination:self didDismissNotificationRequest:v5];

  uint64_t v11 = [(SBNotificationBannerDestination *)self resignActiveAssertion];
  [v11 relinquish];

  uint64_t v12 = +[SBKeyboardFocusCoordinator sharedInstance];
  uint64_t v13 = [v4 _sbWindowScene];
  uint64_t v14 = +[SBKeyboardFocusArbitrationReason longLookDidDismissForNotificationViewController];
  [v12 requestArbitrationForSBWindowScene:v13 forReason:v14];

  long long v15 = [(SBNotificationBannerDestination *)self lockScreenManager];
  long long v16 = [v15 coverSheetViewController];
  [v16 externalBehaviorProviderBehaviorChanged:self];

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v17 = [(SBNotificationBannerDestination *)self destinationObservers];
  long long v18 = (void *)[v17 copy];

  uint64_t v19 = [v18 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v28;
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v28 != v21) {
          objc_enumerationMutation(v18);
        }
        __int16 v23 = *(void **)(*((void *)&v27 + 1) + 8 * v22);
        if (objc_opt_respondsToSelector()) {
          [v23 notificationBannerDestinationDidDismissLongLook:self];
        }
        ++v22;
      }
      while (v20 != v22);
      uint64_t v20 = [v18 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v20);
  }

  long long v24 = [(SBNotificationBannerDestination *)self _presentedNotificationPresentableVC];
  id v25 = [v24 notificationViewController];

  if (v25 == v4)
  {
    long long v26 = [(BNPresentable *)self->_presentedPresentable requesterIdentifier];
    [(SBNotificationBannerDestination *)self _revokeAllPresentablesWithRequesterIdentifier:v26 reason:@"SBBannerRevocationReasonLongLookDismissal" options:1];
  }
}

- (void)fullScreenPresentableViewController:(id)a3 requestsDismissalWithReason:(id)a4
{
  id v5 = a3;
  id v6 = (void *)SBApp;
  id v7 = a4;
  id v8 = [v6 bannerManager];
  uint64_t v9 = [MEMORY[0x1E4F4F5E8] uniqueIdentificationForPresentable:v5];
  id v13 = 0;
  uint64_t v10 = [v8 revokePresentablesWithIdentification:v9 reason:v7 options:0 userInfo:0 error:&v13];

  id v11 = v13;
  if (!v10)
  {
    uint64_t v12 = (void *)*MEMORY[0x1E4FB3750];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_ERROR)) {
      -[SBNotificationBannerDestination fullScreenPresentableViewController:requestsDismissalWithReason:](v12, (uint64_t)v5, (uint64_t)v11);
    }
  }
}

- (BOOL)fullScreenPresentableViewControllerShouldTransitionToDetailStageOnTap:(id)a3
{
  return 1;
}

- (void)didReceiveRaiseGesture
{
  id v1 = a1;
  BOOL v2 = (objc_class *)objc_opt_class();
  int v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1_17(&dword_1D85BA000, v4, v5, "Destination %{public}@ received raise gesture", v6, v7, v8, v9, v10);
}

- (void)_updateMotionGestureObservation
{
  id v1 = a1;
  BOOL v2 = (objc_class *)objc_opt_class();
  int v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1_17(&dword_1D85BA000, v4, v5, "Destination %{public}@ is listening to raise gesture", v6, v7, v8, v9, v10);
}

- (void)coronaAnimationController:(id)a3 willAnimateCoronaTransitionWithAnimator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x3032000000;
  v10[3] = __Block_byref_object_copy__60;
  void v10[4] = __Block_byref_object_dispose__60;
  id v11 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __101__SBNotificationBannerDestination_coronaAnimationController_willAnimateCoronaTransitionWithAnimator___block_invoke;
  v9[3] = &unk_1E6AF52B8;
  void v9[4] = self;
  void v9[5] = v10;
  [v7 addAnimations:v9];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __101__SBNotificationBannerDestination_coronaAnimationController_willAnimateCoronaTransitionWithAnimator___block_invoke_3;
  v8[3] = &unk_1E6AFBD78;
  v8[4] = self;
  v8[5] = v10;
  [v7 addCompletion:v8];
  _Block_object_dispose(v10, 8);
}

void __101__SBNotificationBannerDestination_coronaAnimationController_willAnimateCoronaTransitionWithAnimator___block_invoke(uint64_t a1)
{
  BOOL v2 = [*(id *)(a1 + 32) _presentedNotificationPresentableVC];
  int v3 = [v2 notificationViewController];

  if (v3)
  {
    uint64_t v4 = [v3 materialGroupNameBase];
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;

    [v3 setContentReplacedWithSnapshot:0];
    if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
    {
      id v7 = (objc_class *)objc_opt_class();
      uint64_t v8 = NSStringFromClass(v7);
      uint64_t v9 = [v8 stringByAppendingString:@"-CoronaChange"];

      [v3 setMaterialGroupNameBase:v9];
    }
    uint8_t v10 = [v3 view];
    id v11 = (void *)MEMORY[0x1E4F42FF0];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __101__SBNotificationBannerDestination_coronaAnimationController_willAnimateCoronaTransitionWithAnimator___block_invoke_2;
    v13[3] = &unk_1E6AF4AC0;
    id v14 = v10;
    id v12 = v10;
    [v11 performWithoutAnimation:v13];
    objc_msgSend(v12, "pl_performCrossFadeIfNecessary");
  }
}

uint64_t __101__SBNotificationBannerDestination_coronaAnimationController_willAnimateCoronaTransitionWithAnimator___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setNeedsLayout];
  BOOL v2 = *(void **)(a1 + 32);
  return [v2 layoutIfNeeded];
}

void __101__SBNotificationBannerDestination_coronaAnimationController_willAnimateCoronaTransitionWithAnimator___block_invoke_3(uint64_t a1)
{
  BOOL v2 = [*(id *)(a1 + 32) _presentedNotificationPresentableVC];
  id v3 = [v2 notificationViewController];

  [v3 setMaterialGroupNameBase:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
}

- (void)backlightController:(id)a3 didAnimateBacklightToFactor:(float)a4 source:(int64_t)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (fabsf(a4 + -1.0) < 2.2204e-16)
  {
    p_presentablePendingSnapshot = &self->_presentablePendingSnapshot;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_presentablePendingSnapshot);
    if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
    {
      uint64_t v8 = (void *)*MEMORY[0x1E4FB3750];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v9 = v8;
        uint8_t v10 = [(SBNotificationBannerDestination *)self identifier];
        int v15 = 138543618;
        long long v16 = v10;
        __int16 v17 = 2114;
        id v18 = WeakRetained;
        _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "Destination %{public}@ backlight is on, snapshotting presentable %{public}@", (uint8_t *)&v15, 0x16u);
      }
      id v11 = [WeakRetained notificationViewController];
      [v11 setContentReplacedWithSnapshot:1];

      objc_storeWeak((id *)p_presentablePendingSnapshot, 0);
    }
    else
    {
      id v12 = (void *)*MEMORY[0x1E4FB3750];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEFAULT))
      {
        id v13 = v12;
        id v14 = [(SBNotificationBannerDestination *)self identifier];
        int v15 = 138543362;
        long long v16 = v14;
        _os_log_impl(&dword_1D85BA000, v13, OS_LOG_TYPE_DEFAULT, "Destination %{public}@ backlight is on, but no presentable pending snapshot", (uint8_t *)&v15, 0xCu);
      }
    }
  }
}

- (SBNotificationPresentableViewController)_presentedNotificationPresentableVC
{
  presentedPresentable = self->_presentedPresentable;
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = presentedPresentable;
  if (v3)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v5 = v4;
    }
    else {
      uint64_t v5 = 0;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }
  id v6 = v5;

  return (SBNotificationPresentableViewController *)v6;
}

- (NCNotificationRequest)_presentedNotificationRequest
{
  uint64_t v3 = [(SBNotificationBannerDestination *)self _presentedNotificationPresentableVC];
  uint64_t v4 = [v3 notificationViewController];
  uint64_t v5 = [v4 notificationRequest];
  if (v5 || (objc_opt_respondsToSelector() & 1) == 0)
  {
    id v6 = v5;
  }
  else
  {
    id v6 = [(BNPresentable *)self->_presentedPresentable notificationRequest];
  }
  id v7 = v6;

  return (NCNotificationRequest *)v7;
}

- (id)_notificationViewControllerFromPresentable:(id)a3
{
  id v3 = a3;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v4 = [v3 notificationViewController];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (id)_requestFromPresentable:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SBNotificationBannerDestination *)self _notificationViewControllerFromPresentable:v4];
  id v6 = [v5 notificationRequest];

  if (!v6)
  {
    if (objc_opt_respondsToSelector())
    {
      id v6 = [v4 notificationRequest];
    }
    else
    {
      id v6 = 0;
    }
  }

  return v6;
}

- (id)_presentedNotificationRequestPresenter
{
  id v3 = [(SBNotificationBannerDestination *)self _presentedNotificationPresentableVC];
  id v4 = [v3 notificationViewController];
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [(SBNotificationBannerDestination *)self presentedPresentable];
  }
  id v7 = v6;

  return v7;
}

- (void)_lockStateChanged
{
  id v3 = [(SBNotificationBannerDestination *)self lockScreenManager];
  char v4 = [v3 isUILocked];

  if ((v4 & 1) == 0) {
    [(SBNotificationBannerDestination *)self _resetPresentTimer];
  }
  if ([(SBNotificationBannerDestination *)self _isPresentingBannerWithHiddenPreview])
  {
    uint64_t v5 = [(SBNotificationBannerDestination *)self _presentedNotificationPresentableVC];
    id v6 = [v5 notificationViewController];

    [v6 invalidateContentProviders];
  }
}

- (BOOL)_isUILocked
{
  BOOL v2 = [(SBNotificationBannerDestination *)self lockScreenManager];
  char v3 = [v2 isUILocked];

  return v3;
}

- (BOOL)_isDeviceAuthenticated
{
  BOOL v2 = [(id)SBApp authenticationController];
  char v3 = [v2 isAuthenticated];

  return v3;
}

- (void)_setupModeChanged
{
  if (![(SBNotificationBannerDestination *)self _isInSetupMode])
  {
    [(SBNotificationBannerDestination *)self _resetPresentTimer];
  }
}

- (void)_setReadyForNotificationRequests
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  char v3 = (void *)*MEMORY[0x1E4FB3750];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEFAULT))
  {
    char v4 = v3;
    uint64_t v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    int v8 = 138543362;
    uint64_t v9 = v6;
    _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "Destination %{public}@ is now ready to receive notifications", (uint8_t *)&v8, 0xCu);
  }
  id v7 = [(SBNotificationBannerDestination *)self delegate];
  if ([(SBNotificationBannerDestination *)self _isUILocked]) {
    [v7 destination:self didBecomeReadyToReceiveNotificationsPassingTest:&__block_literal_global_184];
  }
  else {
    [v7 destinationDidBecomeReadyToReceiveNotifications:self];
  }
}

uint64_t __67__SBNotificationBannerDestination__setReadyForNotificationRequests__block_invoke(uint64_t a1, void *a2)
{
  BOOL v2 = [a2 requestDestinations];
  uint64_t v3 = [v2 containsObject:*MEMORY[0x1E4FB3860]];

  return v3;
}

- (void)_setReadyForNotificationRequestsCoalescingWith:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (void *)*MEMORY[0x1E4FB3750];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v5;
    id v7 = (objc_class *)objc_opt_class();
    int v8 = NSStringFromClass(v7);
    uint64_t v9 = [v4 notificationIdentifier];
    uint64_t v10 = objc_msgSend(v9, "un_logDigest");
    int v12 = 138543618;
    id v13 = v8;
    __int16 v14 = 2114;
    int v15 = v10;
    _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "Destination %{public}@ is now ready to receive notifications coalescing with %{public}@", (uint8_t *)&v12, 0x16u);
  }
  id v11 = [(SBNotificationBannerDestination *)self delegate];
  [v11 destination:self didBecomeReadyToReceiveNotificationsCoalescedWith:v4];
}

- (void)_postNotificationRequest:(id)a3 modal:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  uint64_t v10 = _os_activity_create(&dword_1D85BA000, "post-banner", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v10, &state);

  id v11 = (id *)MEMORY[0x1E4FB3750];
  int v12 = (id)*MEMORY[0x1E4FB3750];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    id v26 = [(SBNotificationBannerDestination *)self identifier];
    long long v27 = [v8 notificationIdentifier];
    long long v28 = objc_msgSend(v27, "un_logDigest");
    *(_DWORD *)buf = 138543618;
    id v32 = v26;
    __int16 v33 = 2114;
    *(void *)uint64_t v34 = v28;
    _os_log_debug_impl(&dword_1D85BA000, v12, OS_LOG_TYPE_DEBUG, "Destination %{public}@ received notification %{public}@", buf, 0x16u);
  }
  id v13 = [v8 alertOptions];
  int v14 = [v13 shouldSuppress];

  int v15 = objc_msgSend(v8, "sb_shouldSuppressAlert");
  BOOL v16 = [(SBNotificationBannerDestination *)self _shouldScreenTimeSuppressNotificationRequest:v8];
  if ((v14 | v15 | v16) != 1 || v6)
  {
    if ([(SBNotificationBannerDestination *)self _isPresentingBannerInLongLook])
    {
      uint64_t v20 = *v11;
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v21 = [v8 notificationIdentifier];
        objc_msgSend(v21, "un_logDigest");
        id v22 = (id)objc_claimAutoreleasedReturnValue();
        __int16 v23 = [(SBNotificationBannerDestination *)self identifier];
        *(_DWORD *)buf = 138543618;
        id v32 = v22;
        __int16 v33 = 2114;
        *(void *)uint64_t v34 = v23;
        _os_log_impl(&dword_1D85BA000, v20, OS_LOG_TYPE_DEFAULT, "Forwarding notification %{public}@ to long look banner %{public}@", buf, 0x16u);
      }
      long long v24 = [(SBNotificationBannerDestination *)self _presentedNotificationPresentableVC];
      id v25 = [v24 notificationViewController];
      [v25 didForwardNotificationRequestToCustomContent:v8];
    }
    else
    {
      [(SBNotificationBannerDestination *)self _postPresentableForRequest:v8 modal:v6 completion:v9];
      [(SBNotificationBannerDestination *)self _publishDidPresentBannerForNotificationRequest:v8];
      if (!v6) {
        [(SBNotificationBannerDestination *)self _updateMotionGestureObservation];
      }
    }
  }
  else
  {
    __int16 v17 = *v11;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      id v18 = [v8 notificationIdentifier];
      uint64_t v19 = objc_msgSend(v18, "un_logDigest");
      *(_DWORD *)buf = 138544386;
      id v32 = v19;
      __int16 v33 = 1024;
      *(_DWORD *)uint64_t v34 = 1;
      *(_WORD *)&v34[4] = 1024;
      *(_DWORD *)&v34[6] = v15;
      __int16 v35 = 1024;
      int v36 = v14;
      __int16 v37 = 1024;
      BOOL v38 = v16;
      _os_log_impl(&dword_1D85BA000, v17, OS_LOG_TYPE_DEFAULT, "Banner for notification %{public}@ was dropped. suppressed: %d application: %d, do not disturb: %d screen time: %d", buf, 0x24u);
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __77__SBNotificationBannerDestination__postNotificationRequest_modal_completion___block_invoke;
    block[3] = &unk_1E6AF4AC0;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  os_activity_scope_leave(&state);
}

uint64_t __77__SBNotificationBannerDestination__postNotificationRequest_modal_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setReadyForNotificationRequests];
}

- (BOOL)_presentedBannerMatchesNotificationRequest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SBNotificationBannerDestination *)self _presentedNotificationRequest];
  BOOL v6 = [v5 notificationIdentifier];
  id v7 = [v4 notificationIdentifier];
  if ([v6 isEqualToString:v7])
  {
    id v8 = [v5 sectionIdentifier];
    id v9 = [v4 sectionIdentifier];
    char v10 = [v8 isEqualToString:v9];
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (BOOL)_shouldHideStatusBar
{
  if (SBFEffectiveHomeButtonType() == 2) {
    return 0;
  }
  if (__sb__runningInSpringBoard()) {
    return SBFEffectiveDeviceClass() != 2;
  }
  uint64_t v3 = [MEMORY[0x1E4F42948] currentDevice];
  BOOL v2 = [v3 userInterfaceIdiom] != 1;

  return v2;
}

- (void)_setStatusBarsHidden:(BOOL)a3 withDuration:(double)a4
{
  BOOL v4 = a3;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  BOOL v6 = (void *)*MEMORY[0x1E4FB3750];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEFAULT))
  {
    id v7 = v6;
    id v8 = (objc_class *)objc_opt_class();
    uint64_t v9 = NSStringFromClass(v8);
    char v10 = (void *)v9;
    id v11 = @"NO";
    if (v4) {
      id v11 = @"YES";
    }
    int v24 = 138412546;
    uint64_t v25 = v9;
    __int16 v26 = 2112;
    long long v27 = v11;
    _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "%@ is setting status bar hidden = %@", (uint8_t *)&v24, 0x16u);
  }
  uint64_t v12 = [(SBNotificationBannerDestination *)self appsStatusBarAssertion];
  id v13 = (void *)v12;
  int v14 = !v4;
  if (!v4 || v12)
  {
    if (!v12) {
      int v14 = 0;
    }
    if (v14 == 1)
    {
      [(SBNotificationBannerDestination *)self setAppsStatusBarAssertion:0];
      [v13 invalidate];
    }
  }
  else
  {
    int v15 = [(id)SBApp bannerManager];
    BOOL v16 = [v15 windowSceneForPresentable:self->_presentedPresentable];
    __int16 v17 = [v16 switcherController];
    id v18 = [v17 requestInAppStatusBarHiddenAssertionForReason:@"SBNotificationBannerDestination" animated:0];
    [(SBNotificationBannerDestination *)self setAppsStatusBarAssertion:v18];
  }
  uint64_t v19 = +[SBWindowSceneStatusBarManager windowSceneStatusBarManagerForEmbeddedDisplay];
  uint64_t v20 = [v19 assertionManager];
  if (v4)
  {
    uint64_t v21 = (objc_class *)objc_opt_class();
    id v22 = NSStringFromClass(v21);
    __int16 v23 = (void *)[v20 newSettingsAssertionWithStatusBarHidden:1 atLevel:12 reason:v22];
    [(SBNotificationBannerDestination *)self setSystemStatusBarAssertion:v23];
  }
  else
  {
    [(SBNotificationBannerDestination *)self setSystemStatusBarAssertion:0];
  }
}

- (void)setSystemStatusBarAssertion:(id)a3
{
  BOOL v4 = (SBWindowSceneStatusBarSettingsAssertion *)a3;
  uint64_t v5 = v4;
  if (v4) {
    [(SBWindowSceneStatusBarSettingsAssertion *)v4 acquire];
  }
  systemStatusBarAssertion = self->_systemStatusBarAssertion;
  self->_systemStatusBarAssertion = v5;
}

- (BOOL)_canReceiveNotificationRequestIfLocked:(id)a3
{
  id v4 = a3;
  if ([(SBNotificationBannerDestination *)self _isUILocked])
  {
    uint64_t v5 = [v4 requestDestinations];
    char v6 = [v5 containsObject:*MEMORY[0x1E4FB3860]];
  }
  else
  {
    char v6 = 1;
  }

  return v6;
}

- (BOOL)_isContentSuppressedForNotificationRequest:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(SBNotificationBannerDestination *)self _isDeviceAuthenticated];
  char v6 = [v4 options];

  uint64_t v7 = [v6 contentPreviewSetting];
  if (v5 && v7 == 2) {
    return 1;
  }
  else {
    return (v7 != 0) & ~v5;
  }
}

- (id)_notificationSectionSettingsForSectionIdentifier:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(SBNotificationBannerDestination *)self delegate];
  char v6 = [v5 notificationSectionSettingsForDestination:self forSectionIdentifier:v4];

  return v6;
}

- (id)_notificationSystemSettings
{
  uint64_t v3 = [(SBNotificationBannerDestination *)self delegate];
  id v4 = [v3 notificationSystemSettingsForDestination:self];

  return v4;
}

- (BOOL)_shouldAllowDragInteraction
{
  uint64_t v3 = +[SBPlatformController sharedInstance];
  if ([v3 isMedusaCapable]) {
    BOOL v4 = ![(SBNotificationBannerDestination *)self _isUILocked];
  }
  else {
    LOBYTE(v4) = 0;
  }

  return v4;
}

- (id)_staticContentProviderForViewController:(id)a3 class:(Class)a4 notificationRequest:(id)a5 test:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = v12;
  if (v12 && !(*((unsigned int (**)(id))v12 + 2))(v12))
  {
    int v15 = 0;
  }
  else
  {
    if (objc_opt_respondsToSelector())
    {
      int v14 = [v10 staticContentProvider];
    }
    else
    {
      int v14 = 0;
    }
    if ((objc_opt_isKindOfClass() & 1) == 0 || (int v15 = (void *)[v14 copy]) == 0)
    {
      if (a4) {
        BOOL v16 = a4;
      }
      else {
        BOOL v16 = (objc_class *)MEMORY[0x1E4FB3908];
      }
      int v15 = (void *)[[v16 alloc] initWithNotificationRequest:v11];
      __int16 v17 = [v11 sectionIdentifier];
      id v18 = [(SBNotificationBannerDestination *)self _notificationSectionSettingsForSectionIdentifier:v17];

      objc_msgSend(v15, "setSummarizationEnabled:", objc_msgSend(v18, "isSummarizationEnabled"));
    }
    objc_msgSend(v15, "setDeviceAuthenticated:", -[SBNotificationBannerDestination _isDeviceAuthenticated](self, "_isDeviceAuthenticated"));
    [v15 setDelegate:v10];
  }
  return v15;
}

- (void)_handleExpansionRequestForViewController:(id)a3 notificationRequest:(id)a4 forTrigger:(int64_t)a5 test:(id)a6 completionBlock:(id)a7
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  int v14 = (unsigned int (**)(void))a6;
  int v15 = (void (**)(id, void))a7;
  if (v14 && !v14[2](v14))
  {
LABEL_13:
    v15[2](v15, 0);
    goto LABEL_25;
  }
  BOOL v16 = [(SBNotificationBannerDestination *)self _isAmbientPresented];
  BOOL v17 = [(SBNotificationBannerDestination *)self _isContentSuppressedForNotificationRequest:v13];
  BOOL v18 = v17;
  if (!v16)
  {
    if (v17)
    {
LABEL_9:
      [(SBNotificationBannerDestination *)self _requestUnlockForExpansionForViewController:v12 notificationRequest:v13 completionBlock:v15];
      goto LABEL_25;
    }
    goto LABEL_24;
  }
  if (a5 == 4)
  {
    uint64_t v19 = (void *)*MEMORY[0x1E4FB3750];
    BOOL v20 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEFAULT);
    if (v18)
    {
      if (v20)
      {
        uint64_t v21 = v19;
        id v22 = [v13 notificationIdentifier];
        __int16 v23 = objc_msgSend(v22, "un_logDigest");
        int v24 = NCStringFromStageChangeTrigger();
        int v41 = 138543618;
        uint64_t v42 = v23;
        __int16 v43 = 2114;
        v44 = v24;
        _os_log_impl(&dword_1D85BA000, v21, OS_LOG_TYPE_DEFAULT, "Requesting unlock for expansion of request %{public}@ for trigger %{public}@ in Ambient", (uint8_t *)&v41, 0x16u);
      }
      goto LABEL_9;
    }
    if (v20)
    {
      long long v30 = v19;
      uint64_t v31 = [v13 notificationIdentifier];
      id v32 = objc_msgSend(v31, "un_logDigest");
      __int16 v33 = NCStringFromStageChangeTrigger();
      int v41 = 138543618;
      uint64_t v42 = v32;
      __int16 v43 = 2114;
      v44 = v33;
      _os_log_impl(&dword_1D85BA000, v30, OS_LOG_TYPE_DEFAULT, "Expanding request %{public}@ for trigger %{public}@ in Ambient", (uint8_t *)&v41, 0x16u);

LABEL_23:
      goto LABEL_24;
    }
    goto LABEL_24;
  }
  if ([(SBNotificationBannerDestination *)self _isAmbientNotificationsPreviewOnTapOnly])
  {
    uint64_t v25 = (void *)*MEMORY[0x1E4FB3750];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEFAULT))
    {
      __int16 v26 = v25;
      long long v27 = [v13 notificationIdentifier];
      uint64_t v28 = objc_msgSend(v27, "un_logDigest");
      long long v29 = NCStringFromStageChangeTrigger();
      int v41 = 138543618;
      uint64_t v42 = v28;
      __int16 v43 = 2114;
      v44 = v29;
      _os_log_impl(&dword_1D85BA000, v26, OS_LOG_TYPE_DEFAULT, "Not expanding notification for request %{public}@ on trigger %{public}@ because previews are set to be shown on tap only in Ambient", (uint8_t *)&v41, 0x16u);
    }
    goto LABEL_13;
  }
  if (!v18)
  {
    uint64_t v39 = (void *)*MEMORY[0x1E4FB3750];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEFAULT))
    {
      long long v30 = v39;
      __int16 v40 = [v13 notificationIdentifier];
      id v32 = objc_msgSend(v40, "un_logDigest");
      int v41 = 138543362;
      uint64_t v42 = v32;
      _os_log_impl(&dword_1D85BA000, v30, OS_LOG_TYPE_DEFAULT, "Expanding notification for request %{public}@ because content is not suppressed in Ambient", (uint8_t *)&v41, 0xCu);

      goto LABEL_23;
    }
LABEL_24:
    v15[2](v15, 1);
    goto LABEL_25;
  }
  BOOL v34 = [(SBNotificationBannerDestination *)self _isDeviceAuthenticated];
  __int16 v35 = (void *)*MEMORY[0x1E4FB3750];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEFAULT))
  {
    int v36 = v35;
    __int16 v37 = [v13 notificationIdentifier];
    BOOL v38 = objc_msgSend(v37, "un_logDigest");
    int v41 = 138543618;
    uint64_t v42 = v38;
    __int16 v43 = 1024;
    LODWORD(v44) = v34;
    _os_log_impl(&dword_1D85BA000, v36, OS_LOG_TYPE_DEFAULT, "Checking expanding notification for request %{public}@ in Ambient [ isAuthenticated = %{BOOL}d ]", (uint8_t *)&v41, 0x12u);
  }
  v15[2](v15, v34);
  if (v34) {
    [(SBNotificationBannerDestination *)self _invalidateBiometricAuthIfNecessary];
  }
LABEL_25:
}

- (void)_requestUnlockForExpansionForViewController:(id)a3 notificationRequest:(id)a4 completionBlock:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)*MEMORY[0x1E4FB3750];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEFAULT))
  {
    id v12 = v11;
    id v13 = [v9 notificationIdentifier];
    int v14 = objc_msgSend(v13, "un_logDigest");
    *(_DWORD *)buf = 138543362;
    __int16 v26 = v14;
    _os_log_impl(&dword_1D85BA000, v12, OS_LOG_TYPE_DEFAULT, "Requesting unlock for expansion of request %{public}@", buf, 0xCu);
  }
  int v15 = objc_alloc_init(SBLockScreenUnlockRequest);
  [(SBLockScreenUnlockRequest *)v15 setSource:10];
  [(SBLockScreenUnlockRequest *)v15 setIntent:2];
  BOOL v16 = (objc_class *)objc_opt_class();
  BOOL v17 = NSStringFromClass(v16);
  [(SBLockScreenUnlockRequest *)v15 setName:v17];

  [(SBLockScreenUnlockRequest *)v15 setWantsBiometricPresentation:1];
  [(SBNotificationBannerDestination *)self _cancelReplaceAndDismissTimers];
  objc_initWeak((id *)buf, self);
  BOOL v18 = [(SBNotificationBannerDestination *)self lockScreenManager];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __115__SBNotificationBannerDestination__requestUnlockForExpansionForViewController_notificationRequest_completionBlock___block_invoke;
  v21[3] = &unk_1E6B032F8;
  id v19 = v9;
  id v22 = v19;
  objc_copyWeak(&v24, (id *)buf);
  id v20 = v10;
  id v23 = v20;
  [v18 unlockWithRequest:v15 completion:v21];

  objc_destroyWeak(&v24);
  objc_destroyWeak((id *)buf);
}

uint64_t __115__SBNotificationBannerDestination__requestUnlockForExpansionForViewController_notificationRequest_completionBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  BOOL v4 = (void *)*MEMORY[0x1E4FB3750];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEFAULT))
  {
    BOOL v5 = *(void **)(a1 + 32);
    char v6 = v4;
    uint64_t v7 = [v5 notificationIdentifier];
    id v8 = objc_msgSend(v7, "un_logDigest");
    int v11 = 138543618;
    id v12 = v8;
    __int16 v13 = 1024;
    int v14 = a2;
    _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "Unlock request completed for request %{public}@ [ success = %{BOOL}d ]", (uint8_t *)&v11, 0x12u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _startReplaceAndDismissTimersForRequest:*(void *)(a1 + 32)];

  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  }
  return result;
}

- (void)_userInteractionWillBeginForRequestPresenter:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = self;
  objc_sync_enter(v5);
  if (![(SBNotificationBannerDestination *)v5 isUserInteractionInProgress])
  {
    [(SBNotificationBannerDestination *)v5 setUserInteractionInProgress:1];
    char v6 = (id)*MEMORY[0x1E4FB3750];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = [v4 notificationRequest];
      id v8 = [v7 notificationIdentifier];
      id v9 = objc_msgSend(v8, "un_logDigest");
      int v10 = 138543362;
      int v11 = v9;
      _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "User interaction started for banner for request %{public}@", (uint8_t *)&v10, 0xCu);
    }
    if (![(SBNotificationBannerDestination *)v5 _isPresentingBannerInLongLook]) {
      [(SBNotificationBannerDestination *)v5 _cancelReplaceAndDismissTimers];
    }
  }
  objc_sync_exit(v5);
}

- (void)_userInteractionDidEndForRequestPresenter:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = self;
  objc_sync_enter(v5);
  if ([(SBNotificationBannerDestination *)v5 isUserInteractionInProgress])
  {
    [(SBNotificationBannerDestination *)v5 setUserInteractionInProgress:0];
    char v6 = (id)*MEMORY[0x1E4FB3750];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = [v4 notificationRequest];
      id v8 = [v7 notificationIdentifier];
      id v9 = objc_msgSend(v8, "un_logDigest");
      int v11 = 138543362;
      uint64_t v12 = v9;
      _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "User interaction ended for presenter for request %{public}@", (uint8_t *)&v11, 0xCu);
    }
    if (![(SBNotificationBannerDestination *)v5 _isPresentingBannerInLongLook])
    {
      int v10 = [v4 notificationRequest];
      [(SBNotificationBannerDestination *)v5 _startReplaceAndDismissTimersForRequest:v10];
    }
  }
  objc_sync_exit(v5);
}

- (id)_ambientPresentationController
{
  BOOL v2 = [(id)SBApp windowSceneManager];
  uint64_t v3 = [v2 activeDisplayWindowScene];
  id v4 = [v3 ambientPresentationController];

  return v4;
}

- (BOOL)_isAmbientPresented
{
  BOOL v2 = [(SBNotificationBannerDestination *)self _ambientPresentationController];
  char v3 = [v2 isPresented];

  return v3;
}

- (BOOL)_isAmbientNotificationsPreviewOnTapOnly
{
  BOOL v2 = [(SBNotificationBannerDestination *)self _ambientPresentationController];
  char v3 = [v2 notificationsPreviewOnTapOnly];

  return v3;
}

- (BOOL)_canReceiveNotificationRequestIfAmbientPresented:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(SBNotificationBannerDestination *)self _isAmbientPresented])
  {
    BOOL v5 = [v4 options];
    int v6 = [v5 suppressPresentationInAmbient];

    uint64_t v7 = [(SBNotificationBannerDestination *)self _ambientPresentationController];
    int v8 = [v7 suppressNotificationPresentation];

    uint64_t v9 = [v4 interruptionLevel];
    int v10 = [v4 options];
    int v11 = [v10 revealsAdditionalContentOnPresentation];

    if (v9 == 3) {
      int v12 = 1;
    }
    else {
      int v12 = v11;
    }
    if (v6 | v8 ^ 1) {
      int v13 = v6 ^ 1;
    }
    else {
      int v13 = v12;
    }
    int v14 = (void *)*MEMORY[0x1E4FB3750];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEFAULT))
    {
      BOOL v15 = v9 == 3;
      BOOL v16 = v14;
      BOOL v17 = [v4 notificationIdentifier];
      BOOL v18 = objc_msgSend(v17, "un_logDigest");
      int v20 = 138544642;
      uint64_t v21 = v18;
      __int16 v22 = 1024;
      int v23 = v13;
      __int16 v24 = 1024;
      int v25 = v6;
      __int16 v26 = 1024;
      int v27 = v8;
      __int16 v28 = 1024;
      BOOL v29 = v15;
      __int16 v30 = 1024;
      int v31 = v11;
      _os_log_impl(&dword_1D85BA000, v16, OS_LOG_TYPE_DEFAULT, "Can receive request %{public}@ in ambient : %{BOOL}d [ requestSuppress:%{BOOL}d ; ambientSuppress:%{BOOL}d ; cri"
        "tical:%{BOOL}d ; emergency:%{BOOL}d ]",
        (uint8_t *)&v20,
        0x2Au);
    }
  }
  else
  {
    LOBYTE(v13) = 1;
  }

  return v13;
}

- (void)_requestBiometricAuthIfAmbientPresentedForNotificationRequest:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(SBNotificationBannerDestination *)self _isAmbientPresented]
    && [(SBNotificationBannerDestination *)self _isContentSuppressedForNotificationRequest:v4])
  {
    BOOL v5 = [MEMORY[0x1E4FA7C68] sharedInstance];
    int v6 = v5;
    biometricMatchingAssertion = self->_biometricMatchingAssertion;
    if (biometricMatchingAssertion)
    {
      [v5 resumeMatchingForAssertion:biometricMatchingAssertion advisory:1];
    }
    else
    {
      int v8 = (void *)*MEMORY[0x1E4FB3750];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v9 = v8;
        int v10 = [v4 notificationIdentifier];
        int v11 = objc_msgSend(v10, "un_logDigest");
        int v14 = 138543362;
        BOOL v15 = v11;
        _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "Acquiring biometric matching assertion for notification presentation in Ambient for request %{public}@", (uint8_t *)&v14, 0xCu);
      }
      int v12 = [v6 acquireMatchingAssertionWithMode:3 reason:@"SBNotificationBannerDestinationAmbientAuthentication"];
      int v13 = self->_biometricMatchingAssertion;
      self->_biometricMatchingAssertion = v12;
    }
  }
}

- (void)_invalidateBiometricAuthIfNecessary
{
  if (self->_biometricMatchingAssertion)
  {
    char v3 = *MEMORY[0x1E4FB3750];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v5 = 0;
      _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "Invalidating biometric matching assertion for notification presentation in Ambient", v5, 2u);
    }
    [(BSInvalidatable *)self->_biometricMatchingAssertion invalidate];
    biometricMatchingAssertion = self->_biometricMatchingAssertion;
    self->_biometricMatchingAssertion = 0;
  }
}

- (void)_publishDidPresentBannerForNotificationRequest:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(SBNotificationBannerDestination *)self destinationObservers];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __82__SBNotificationBannerDestination__publishDidPresentBannerForNotificationRequest___block_invoke;
  v7[3] = &unk_1E6B03320;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 enumerateObjectsUsingBlock:v7];
}

void __82__SBNotificationBannerDestination__publishDidPresentBannerForNotificationRequest___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 notificationBannerDestination:*(void *)(a1 + 32) didPresentBannerForNotificationRequest:*(void *)(a1 + 40)];
  }
}

- (BOOL)_isPresentingStickyBanner
{
  id v3 = [(SBNotificationBannerDestination *)self _presentedNotificationRequest];
  if ([(SBNotificationBannerDestination *)self _isPresentingBanner])
  {
    id v4 = [v3 options];
    int v5 = [v4 dismissAutomatically] ^ 1;
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (BOOL)_isShowingShortLookAtRest
{
  BOOL v3 = [(SBNotificationBannerDestination *)self _isPresentingBanner];
  if (v3)
  {
    if ([(SBNotificationBannerDestination *)self _isPresentedBannerBeingDragged]) {
      LOBYTE(v3) = 0;
    }
    else {
      LOBYTE(v3) = ![(SBNotificationBannerDestination *)self _isPresentingBannerInLongLook];
    }
  }
  return v3;
}

- (BOOL)_isDismissingLongLookForBanner
{
  if (![(SBNotificationBannerDestination *)self _isPresentingBannerInLongLook]) {
    return 1;
  }
  BOOL v3 = [(SBNotificationBannerDestination *)self _presentedNotificationPresentableVC];
  id v4 = [v3 notificationViewController];
  char v5 = [v4 isNotPresentingOrHasCommittedToDismissingCustomContentProvidingViewController];

  return v5;
}

- (BOOL)_isPresentedBannerBeingDragged
{
  BOOL v3 = [(SBNotificationBannerDestination *)self _isPresentingBanner];
  if (v3)
  {
    id v4 = [(SBNotificationBannerDestination *)self _presentedNotificationPresentableVC];
    char v5 = [v4 isDragging];

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (BOOL)_isPresentingBannerRequestingRaiseGesture
{
  BOOL v3 = [(SBNotificationBannerDestination *)self _isPresentingBanner];
  if (v3)
  {
    id v4 = [(SBNotificationBannerDestination *)self _presentedNotificationRequest];
    char v5 = [v4 options];
    char v6 = [v5 playMediaWhenRaised];

    LOBYTE(v3) = v6;
  }
  return v3;
}

- (BOOL)_isPresentingBannerWithHiddenPreview
{
  BOOL v3 = [(SBNotificationBannerDestination *)self _presentedNotificationRequest];
  id v4 = [v3 options];
  uint64_t v5 = [v4 contentPreviewSetting];

  BOOL result = [(SBNotificationBannerDestination *)self _isPresentingBanner];
  if (!v5) {
    return 0;
  }
  return result;
}

- (BOOL)_isPresentingBannerPreventingAutomaticLock
{
  BOOL v2 = [(SBNotificationBannerDestination *)self _presentedNotificationRequest];
  BOOL v3 = [v2 options];
  char v4 = [v3 preventsAutomaticLock];

  return v4;
}

- (BOOL)_isInSetupMode
{
  BOOL v2 = [(SBNotificationBannerDestination *)self setupManager];
  char v3 = [v2 isInSetupMode];

  return v3;
}

- (BOOL)_shouldScreenTimeSuppressNotificationRequest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 options];
  if ([v5 overridesDowntime])
  {
    BOOL v6 = 0;
  }
  else
  {
    uint64_t v7 = [v4 sectionIdentifier];
    BOOL v6 = [(SBNotificationBannerDestination *)self _shouldScreenTimeSuppressNotificationsForBundleIdentifier:v7];
  }
  return v6;
}

- (BOOL)_shouldScreenTimeSuppressNotificationsForBundleIdentifier:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(SBNotificationBannerDestination *)self _isBundleIdentifierBlockedForScreenTimeExpiration:v4]|| [(SBNotificationBannerDestination *)self _isBundleIdentifierBlockedForCommunicationPolicy:v4];

  return v5;
}

- (BOOL)_isBundleIdentifierBlockedForScreenTimeExpiration:(id)a3
{
  id v3 = a3;
  id v4 = +[SBApplicationController sharedInstance];
  BOOL v5 = [v4 applicationWithBundleIdentifier:v3];

  BOOL v6 = [v5 info];
  LOBYTE(v3) = [v6 isBlockedForScreenTimeExpiration];

  return (char)v3;
}

- (BOOL)_isBundleIdentifierBlockedForCommunicationPolicy:(id)a3
{
  id v3 = a3;
  id v4 = +[SBCommunicationPolicyManager sharedInstance];
  char v5 = [v4 shouldScreenTimeSuppressNotificationsForBundleIdentifier:v3];

  return v5;
}

- (id)_notificationViewControllerForRequest:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4FB3918];
  id v5 = a3;
  BOOL v6 = (void *)[[v4 alloc] initWithNotificationRequest:v5 revealingAdditionalContentOnPresentation:0];

  [v6 setDelegate:self];
  [v6 addObserver:self];
  uint64_t v7 = (objc_class *)objc_opt_class();
  id v8 = NSStringFromClass(v7);
  if (UIAccessibilityIsReduceTransparencyEnabled())
  {
    uint64_t v9 = objc_msgSend(v8, "stringByAppendingFormat:", @"-%lu", ++_notificationViewControllerForRequest____reduceTransparencyBannerCount);

    id v8 = (void *)v9;
  }
  [v6 setMaterialGroupNameBase:v8];
  [v6 updateContent];

  return v6;
}

- (id)_dashBoardLegibilitySettings
{
  dashBoardLegibilityProvider = self->_dashBoardLegibilityProvider;
  if (!dashBoardLegibilityProvider)
  {
    id v4 = objc_alloc_init(SBDashBoardLegibilityProvider);
    id v5 = self->_dashBoardLegibilityProvider;
    self->_dashBoardLegibilityProvider = v4;

    dashBoardLegibilityProvider = self->_dashBoardLegibilityProvider;
  }
  return [(SBDashBoardLegibilityProvider *)dashBoardLegibilityProvider currentLegibilitySettings];
}

- (id)_presentableForRequest:(id)a3 modal:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([(SBNotificationBannerDestination *)self _isAmbientPresented])
  {
    uint64_t v7 = (SBNotificationPresentableViewController *)[objc_alloc(MEMORY[0x1E4FB38D0]) initWithNotificationRequest:v6];
    [(NCNotificationPresentableViewController *)v7 setDelegate:self];
    [(SBNotificationPresentableViewController *)v7 addPresentableObserver:self];
  }
  else
  {
    id v8 = [(SBNotificationBannerDestination *)self _notificationViewControllerForRequest:v6];
    [v8 setRevealAdditionalContentOnPresentation:v4];
    uint64_t v7 = [(NCNotificationPresentableViewController *)[SBNotificationPresentableViewController alloc] initWithNotificationViewController:v8];
    [(NCNotificationPresentableViewController *)v7 setDelegate:self];
  }
  return v7;
}

- (void)_postPresentableForRequest:(id)a3 modal:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  int v10 = [(SBNotificationBannerDestination *)self delegate];
  int v11 = (os_log_t *)MEMORY[0x1E4FB3750];
  if (self->_presentedPresentable)
  {
    int v12 = [(SBNotificationBannerDestination *)self _presentedNotificationPresentableVC];
    int v13 = [v12 notificationViewController];

    [v13 setInteractionEnabled:0];
    int v14 = [(SBNotificationBannerDestination *)self _presentedNotificationRequest];
    if (v14)
    {
      os_log_t v15 = *v11;
      if (os_log_type_enabled(*v11, OS_LOG_TYPE_DEBUG)) {
        -[SBNotificationBannerDestination _postPresentableForRequest:modal:completion:](v15, v14);
      }
      [v10 destination:self willDismissNotificationRequest:v14];
    }
  }
  uint64_t v16 = [(SBNotificationBannerDestination *)self _presentableForRequest:v8 modal:v6];
  presentedPresentable = self->_presentedPresentable;
  self->_presentedPresentable = v16;

  BOOL v18 = (void *)MEMORY[0x1D948C7A0](v9);
  if (v18)
  {
    id v19 = self->_presentedPresentable;
    int v20 = (void *)MEMORY[0x1D948C7A0](v18);
    objc_setAssociatedObject(v19, &_SBNotificationBannerDestinationBannerRequestCompletion, v20, (void *)3);
  }
  uint64_t v21 = [v8 options];
  int v22 = [v21 dismissAutomatically];

  os_log_t v23 = *v11;
  BOOL v24 = os_log_type_enabled(*v11, OS_LOG_TYPE_DEFAULT);
  if (!v22 || v6)
  {
    if (v24)
    {
      __int16 v30 = self->_presentedPresentable;
      __int16 v26 = v23;
      int v27 = [v8 notificationIdentifier];
      __int16 v28 = objc_msgSend(v27, "un_logDigest");
      *(_DWORD *)__int16 v35 = 138543618;
      *(void *)&v35[4] = v30;
      *(_WORD *)&v35[12] = 2114;
      *(void *)&v35[14] = v28;
      BOOL v29 = "Posting sticky banner %{public}@ for notification %{public}@";
      goto LABEL_15;
    }
  }
  else if (v24)
  {
    int v25 = self->_presentedPresentable;
    __int16 v26 = v23;
    int v27 = [v8 notificationIdentifier];
    __int16 v28 = objc_msgSend(v27, "un_logDigest");
    *(_DWORD *)__int16 v35 = 138543618;
    *(void *)&v35[4] = v25;
    *(_WORD *)&v35[12] = 2114;
    *(void *)&v35[14] = v28;
    BOOL v29 = "Posting banner %{public}@ for notification %{public}@";
LABEL_15:
    _os_log_impl(&dword_1D85BA000, v26, OS_LOG_TYPE_DEFAULT, v29, v35, 0x16u);
  }
  int v31 = objc_msgSend((id)SBApp, "bannerManager", *(_OWORD *)v35, *(void *)&v35[16], v36);
  uint64_t v32 = [v31 acquireGestureRecognizerPriorityAssertionForPresentable:self->_presentedPresentable priority:1 reason:@"user notification banner destination presenting banner"];
  bannerGestureRecognizerPriorityAssertion = self->_bannerGestureRecognizerPriorityAssertion;
  self->_bannerGestureRecognizerPriorityAssertion = v32;

  BOOL v34 = [(id)SBApp bannerManager];
  [v34 postPresentable:self->_presentedPresentable withOptions:1 userInfo:0 error:0];

  [MEMORY[0x1E4FB38E0] presentedNotificationRequestAsBanner:v8];
}

- (void)_resetPresentTimer
{
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_0_1(&dword_1D85BA000, v0, v1, "resetting present timer %@", v2, v3, v4, v5, v6);
}

- (id)_startTimerWithDelay:(unint64_t)a3 eventHandler:(id)a4
{
  id v6 = a4;
  uint64_t v7 = dispatch_get_global_queue(33, 0);
  id v8 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v7);
  dispatch_time_t v9 = dispatch_time(0, 1000000000 * a3);
  dispatch_source_set_timer(v8, v9, 0xFFFFFFFFFFFFFFFFLL, 0);
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __69__SBNotificationBannerDestination__startTimerWithDelay_eventHandler___block_invoke;
  handler[3] = &unk_1E6AF5FC8;
  int v10 = v8;
  uint64_t v16 = v10;
  BOOL v17 = self;
  id v18 = v6;
  id v11 = v6;
  dispatch_source_set_event_handler(v10, handler);
  dispatch_activate(v10);
  int v12 = v18;
  int v13 = v10;

  return v13;
}

void __69__SBNotificationBannerDestination__startTimerWithDelay_eventHandler___block_invoke(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEBUG)) {
    __69__SBNotificationBannerDestination__startTimerWithDelay_eventHandler___block_invoke_cold_1();
  }
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __69__SBNotificationBannerDestination__startTimerWithDelay_eventHandler___block_invoke_124;
  v3[3] = &unk_1E6AF6828;
  uint64_t v2 = *(void **)(a1 + 48);
  v3[4] = *(void *)(a1 + 40);
  id v4 = v2;
  dispatch_async(MEMORY[0x1E4F14428], v3);
}

void __69__SBNotificationBannerDestination__startTimerWithDelay_eventHandler___block_invoke_124(uint64_t a1)
{
  if ([*(id *)(a1 + 32) _isShowingShortLookAtRest])
  {
    uint64_t v2 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v2();
  }
  else
  {
    uint64_t v3 = *MEMORY[0x1E4FB3750];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_ERROR)) {
      __69__SBNotificationBannerDestination__startTimerWithDelay_eventHandler___block_invoke_124_cold_1(v3);
    }
  }
}

- (void)_startReplaceTimer
{
  OUTLINED_FUNCTION_1_1(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_0_1(&dword_1D85BA000, v0, v1, "started replace timer %@", v2, v3, v4, v5, v6);
}

uint64_t __53__SBNotificationBannerDestination__startReplaceTimer__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setReadyForNotificationRequests];
}

- (void)_startDismissTimer
{
  OUTLINED_FUNCTION_1_1(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_0_1(&dword_1D85BA000, v0, v1, "started dismiss timer %@", v2, v3, v4, v5, v6);
}

uint64_t __53__SBNotificationBannerDestination__startDismissTimer__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _dismissPresentedBannerAnimated:1 reason:@"SBBannerRevocationReasonBannerDestinationDismissTimer" forceIfSticky:1];
}

- (void)_startReplaceAndDismissTimersForRequest:(id)a3
{
  id v7 = [a3 options];
  if ([v7 dismissAutomatically]
    && ![(SBNotificationBannerDestination *)self isUserInteractionInProgress])
  {
    uint64_t v4 = [(SBNotificationBannerDestination *)self _presentedNotificationRequestPresenter];
    uint64_t v5 = [v4 activeTransitionBlockingAssertions];
    uint64_t v6 = [v5 count];

    if (!v6)
    {
      [(SBNotificationBannerDestination *)self _startReplaceTimer];
      [(SBNotificationBannerDestination *)self _startDismissTimer];
    }
  }
  else
  {
  }
}

- (void)_cancelReplaceTimer
{
  OUTLINED_FUNCTION_1_1(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_0_1(&dword_1D85BA000, v0, v1, "canceling replace timer %@", v2, v3, v4, v5, v6);
}

- (void)_cancelDismissTimer
{
  OUTLINED_FUNCTION_1_1(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_0_1(&dword_1D85BA000, v0, v1, "canceling dismiss timer %@", v2, v3, v4, v5, v6);
}

- (void)_cancelReplaceAndDismissTimers
{
  [(SBNotificationBannerDestination *)self _cancelReplaceTimer];
  [(SBNotificationBannerDestination *)self _cancelDismissTimer];
}

- (void)_setupTimers
{
  uint64_t v3 = dispatch_get_global_queue(33, 0);
  uint64_t v4 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v3);
  presentTimer = self->_presentTimer;
  self->_presentTimer = v4;

  uint8_t v6 = self->_presentTimer;
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __47__SBNotificationBannerDestination__setupTimers__block_invoke;
  handler[3] = &unk_1E6AF4AC0;
  void handler[4] = self;
  dispatch_source_set_event_handler(v6, handler);
  dispatch_activate((dispatch_object_t)self->_presentTimer);
}

void __47__SBNotificationBannerDestination__setupTimers__block_invoke(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEBUG)) {
    __47__SBNotificationBannerDestination__setupTimers__block_invoke_cold_1();
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__SBNotificationBannerDestination__setupTimers__block_invoke_125;
  block[3] = &unk_1E6AF4AC0;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __47__SBNotificationBannerDestination__setupTimers__block_invoke_125(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setReadyForNotificationRequests];
}

- (void)_setupSystemStateChangeNotifications
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel__lockStateChanged name:@"SBAggregateLockStateDidChangeNotification" object:0];
  [v3 addObserver:self selector:sel__setupModeChanged name:@"SBInBuddyModeDidChangeNotification" object:0];
}

- (void)_performSilenceAction
{
  id v5 = [(SBNotificationBannerDestination *)self _presentedNotificationRequest];
  id v3 = [(SBNotificationBannerDestination *)self delegate];
  uint64_t v4 = [v5 silenceAction];
  [v3 destination:self executeAction:v4 forNotificationRequest:v5 requestAuthentication:0 withParameters:MEMORY[0x1E4F1CC08] completion:0];
}

- (void)_performCancelAction
{
  id v5 = [(SBNotificationBannerDestination *)self _presentedNotificationRequest];
  id v3 = [(SBNotificationBannerDestination *)self delegate];
  uint64_t v4 = [v5 cancelAction];
  [v3 destination:self executeAction:v4 forNotificationRequest:v5 requestAuthentication:0 withParameters:MEMORY[0x1E4F1CC08] completion:0];
}

- (void)_dismissPresentedBannerAnimated:(BOOL)a3 reason:(id)a4 forceIfSticky:(BOOL)a5
{
}

- (void)_dismissPresentedBannerOnly:(BOOL)a3 reason:(id)a4 animated:(BOOL)a5 forceIfSticky:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  BOOL v8 = a3;
  id v10 = a4;
  if ([(SBNotificationBannerDestination *)self _shouldDismissPresentedBannerPerformingPreludeForcingIfSticky:v6 outReason:0])
  {
    [(SBNotificationBannerDestination *)self _dismissPresentedBannerOnly:v8 reason:v10 animated:v7];
  }
}

- (BOOL)_shouldDismissPresentedBannerPerformingPreludeForcingIfSticky:(BOOL)a3 outReason:(id *)a4
{
  if ([(SBNotificationBannerDestination *)self isPresentingBanner])
  {
    if (a3 || ![(SBNotificationBannerDestination *)self _isPresentingStickyBanner]) {
      return 1;
    }
    if (a4)
    {
      BOOL v7 = @"presentingStickyBanner";
LABEL_8:
      BOOL result = 0;
      *a4 = v7;
      return result;
    }
  }
  else if (a4)
  {
    BOOL v7 = @"noBanner";
    goto LABEL_8;
  }
  return 0;
}

- (BOOL)_revokeAllPresentablesWithRequesterIdentifier:(id)a3 reason:(id)a4 options:(unint64_t)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  BOOL v8 = (void *)SBApp;
  id v9 = a4;
  id v10 = [v8 bannerManager];
  id v11 = [MEMORY[0x1E4F4F5E8] identificationWithRequesterIdentifier:v7];
  id v17 = 0;
  int v12 = [v10 revokePresentablesWithIdentification:v11 reason:v9 options:a5 userInfo:0 error:&v17];

  id v13 = v17;
  if (!v12)
  {
    uint64_t v14 = [v13 code];
    os_log_t v15 = *MEMORY[0x1E4FB3750];
    if (v14 == 3)
    {
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v19 = v7;
        _os_log_impl(&dword_1D85BA000, v15, OS_LOG_TYPE_DEFAULT, "No presentables to revoke with requester identifier %{public}@", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_ERROR))
    {
      -[SBNotificationBannerDestination _revokeAllPresentablesWithRequesterIdentifier:reason:options:]();
    }
  }

  return v12 != 0;
}

- (void)_dismissPresentedBannerOnly:(BOOL)a3 reason:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a3;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  BOOL v8 = [(SBNotificationBannerDestination *)self _presentedNotificationRequest];
  id v9 = (os_log_t *)MEMORY[0x1E4FB3750];
  id v10 = *MEMORY[0x1E4FB3750];
  if (v8)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEFAULT))
    {
      id v11 = v10;
      int v12 = [v8 notificationIdentifier];
      id v13 = objc_msgSend(v12, "un_logDigest");
      int v20 = 138543362;
      uint64_t v21 = v13;
      _os_log_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_DEFAULT, "Revoking banner for notification %{public}@", (uint8_t *)&v20, 0xCu);
    }
    uint64_t v14 = [(id)SBApp bannerManager];
    os_log_t v15 = [v14 windowSceneForPresentable:self->_presentedPresentable];
    char v16 = [v14 isDisplayingBannerInWindowScene:v15];

    id v17 = [(SBNotificationBannerDestination *)self delegate];
    [v17 destination:self willDismissNotificationRequest:v8];

    id v18 = [(BNPresentable *)self->_presentedPresentable requesterIdentifier];
    [(SBNotificationBannerDestination *)self _revokeAllPresentablesWithRequesterIdentifier:v18 reason:v7 options:v5];

    if ((v16 & 1) == 0)
    {
      id v19 = *v9;
      if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v20) = 0;
        _os_log_impl(&dword_1D85BA000, v19, OS_LOG_TYPE_DEFAULT, "Tried to dismiss a banner that was queued but not currently presented", (uint8_t *)&v20, 2u);
      }
      [(SBNotificationBannerDestination *)self _dismissPresentableCompleted:0];
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_ERROR)) {
      -[SBNotificationBannerDestination _dismissPresentedBannerOnly:reason:animated:](v10);
    }
    [(SBNotificationBannerDestination *)self _dismissPresentableCompleted:0];
  }
}

- (void)_dismissPresentableCompleted:(id)a3
{
  presentedPresentable = self->_presentedPresentable;
  self->_presentedPresentable = 0;

  [(SBNotificationBannerDestination *)self _resetPresentTimer];
}

- (NSString)coverSheetIdentifier
{
  uint64_t v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (int64_t)participantState
{
  if ([(SBNotificationBannerDestination *)self _isPresentingBannerInLongLook]) {
    return 2;
  }
  else {
    return 1;
  }
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

- (int64_t)idleTimerDuration
{
  return 9;
}

- (int64_t)idleTimerMode
{
  return 1;
}

- (int64_t)proximityDetectionMode
{
  return 0;
}

- (void)notificationManagementContentProvider:(id)a3 requestsPresentingNotificationManagementViewType:(unint64_t)a4 forNotificationRequest:(id)a5 withPresentingView:(id)a6
{
  notificationManagementPresenter = self->_notificationManagementPresenter;
  id v10 = a6;
  id v11 = a5;
  id v14 = [(SBNotificationBannerDestination *)self _presentedNotificationPresentableVC];
  int v12 = [v14 notificationViewController];
  id v13 = objc_msgSend(v12, "bs_topPresentedViewController");
  [(NCNotificationManagementViewPresenter *)notificationManagementPresenter presentNotificationManagementViewType:a4 forNotificationRequest:v11 withPresentingViewController:v13 withPresentingView:v10];
}

- (id)notificationManagementViewPresenter:(id)a3 sectionSettingsForSectionIdentifier:(id)a4
{
  return [(SBNotificationBannerDestination *)self _notificationSectionSettingsForSectionIdentifier:a4];
}

- (void)notificationManagementViewPresenter:(id)a3 setAllowsNotifications:(BOOL)a4 forNotificationRequest:(id)a5 withSectionIdentifier:(id)a6
{
  BOOL v6 = a4;
  id v8 = a6;
  id v9 = [(SBNotificationBannerDestination *)self delegate];
  [v9 destination:self setAllowsNotifications:v6 forSectionIdentifier:v8];
}

- (void)notificationManagementViewPresenter:(id)a3 setDeliverQuietly:(BOOL)a4 forNotificationRequest:(id)a5 withSectionIdentifier:(id)a6
{
  BOOL v6 = a4;
  id v8 = a6;
  id v9 = [(SBNotificationBannerDestination *)self delegate];
  [v9 destination:self setDeliverQuietly:v6 forSectionIdentifier:v8];
}

- (void)notificationManagementViewPresenter:(id)a3 setAllowsCriticalAlerts:(BOOL)a4 forNotificationRequest:(id)a5 withSectionIdentifier:(id)a6
{
  BOOL v6 = a4;
  id v8 = a6;
  id v9 = [(SBNotificationBannerDestination *)self delegate];
  [v9 destination:self setAllowsCriticalAlerts:v6 forSectionIdentifier:v8];
}

- (void)notificationManagementViewPresenter:(id)a3 setMuted:(BOOL)a4 untilDate:(id)a5 forSectionIdentifier:(id)a6 threadIdentifier:(id)a7
{
  BOOL v9 = a4;
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = [(SBNotificationBannerDestination *)self delegate];
  [v14 destination:self setMuted:v9 untilDate:v13 forSectionIdentifier:v12 threadIdentifier:v11];
}

- (void)notificationManagementViewPresenter:(id)a3 setAllowsTimeSensitive:(BOOL)a4 forNotificationRequest:(id)a5 withSectionIdentifier:(id)a6
{
  BOOL v6 = a4;
  id v8 = a6;
  id v9 = [(SBNotificationBannerDestination *)self delegate];
  [v9 destination:self setAllowsTimeSensitive:v6 forSectionIdentifier:v8];
}

- (void)notificationManagementViewPresenterWillPresentManagementView:(id)a3
{
  id v3 = [(SBNotificationBannerDestination *)self _presentedNotificationPresentableVC];
  uint64_t v4 = [v3 notificationViewController];
  objc_msgSend(v4, "bs_topPresentedViewController");
  id v5 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_opt_respondsToSelector()) {
    [v5 preserveInputViews];
  }
}

- (void)notificationManagementViewPresenterDidDismissManagementView:(id)a3
{
  id v3 = [(SBNotificationBannerDestination *)self _presentedNotificationPresentableVC];
  uint64_t v4 = [v3 notificationViewController];
  objc_msgSend(v4, "bs_topPresentedViewController");
  id v5 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_opt_respondsToSelector()) {
    [v5 restoreInputViews];
  }
}

- (NCNotificationAlertDestinationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (NCNotificationAlertDestinationDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SBAssistantController)assistantController
{
  return self->_assistantController;
}

- (SBLockScreenManager)lockScreenManager
{
  return self->_lockScreenManager;
}

- (SBSetupManager)setupManager
{
  return self->_setupManager;
}

- (void)setSetupManager:(id)a3
{
}

- (void)_setPresentedPresentable:(id)a3
{
}

- (NCNotificationViewController)_notificationViewControllerForActiveDragSession
{
  return self->_notificationViewControllerForActiveDragSession;
}

- (void)_setNotificationViewControllerForActiveDragSession:(id)a3
{
}

- (BOOL)isUserInteractionInProgress
{
  return self->_userInteractionInProgress;
}

- (void)setUserInteractionInProgress:(BOOL)a3
{
  self->_userInteractionInProgress = a3;
}

- (OS_dispatch_source)presentTimer
{
  return self->_presentTimer;
}

- (void)setPresentTimer:(id)a3
{
}

- (OS_dispatch_source)replaceTimer
{
  return self->_replaceTimer;
}

- (void)setReplaceTimer:(id)a3
{
}

- (OS_dispatch_source)dismissTimer
{
  return self->_dismissTimer;
}

- (void)setDismissTimer:(id)a3
{
}

- (UIApplicationSceneDeactivationAssertion)resignActiveAssertion
{
  return self->_resignActiveAssertion;
}

- (void)setResignActiveAssertion:(id)a3
{
}

- (SBWindowSceneStatusBarSettingsAssertion)systemStatusBarAssertion
{
  return self->_systemStatusBarAssertion;
}

- (SBInAppStatusBarHiddenAssertion)appsStatusBarAssertion
{
  return self->_appsStatusBarAssertion;
}

- (void)setAppsStatusBarAssertion:(id)a3
{
}

- (NSMutableSet)destinationObservers
{
  return self->_destinationObservers;
}

- (void)setDestinationObservers:(id)a3
{
}

- (BSInvalidatable)idleTimerDisableAssertion
{
  return self->_idleTimerDisableAssertion;
}

- (void)setIdleTimerDisableAssertion:(id)a3
{
}

- (BSInvalidatable)starModeDisableAssertion
{
  return self->_starModeDisableAssertion;
}

- (void)setStarModeDisableAssertion:(id)a3
{
}

- (BSInvalidatable)bannerGestureRecognizerPriorityAssertion
{
  return self->_bannerGestureRecognizerPriorityAssertion;
}

- (void)setBannerGestureRecognizerPriorityAssertion:(id)a3
{
}

- (NCNotificationManagementViewPresenter)notificationManagementPresenter
{
  return self->_notificationManagementPresenter;
}

- (void)setNotificationManagementPresenter:(id)a3
{
}

- (SBDashBoardLegibilityProvider)dashBoardLegibilityProvider
{
  return self->_dashBoardLegibilityProvider;
}

- (void)setDashBoardLegibilityProvider:(id)a3
{
}

- (BNPresentable)presentablePendingSnapshot
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentablePendingSnapshot);
  return (BNPresentable *)WeakRetained;
}

- (void)setPresentablePendingSnapshot:(id)a3
{
}

- (BSInvalidatable)biometricMatchingAssertion
{
  return self->_biometricMatchingAssertion;
}

- (void)setBiometricMatchingAssertion:(id)a3
{
}

- (NCBannerTransitionBlockingPrototypeRecipe)transitionBlockingPrototypeRecipe
{
  return self->_transitionBlockingPrototypeRecipe;
}

- (void)setTransitionBlockingPrototypeRecipe:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitionBlockingPrototypeRecipe, 0);
  objc_storeStrong((id *)&self->_biometricMatchingAssertion, 0);
  objc_destroyWeak((id *)&self->_presentablePendingSnapshot);
  objc_storeStrong((id *)&self->_dashBoardLegibilityProvider, 0);
  objc_storeStrong((id *)&self->_notificationManagementPresenter, 0);
  objc_storeStrong((id *)&self->_bannerGestureRecognizerPriorityAssertion, 0);
  objc_storeStrong((id *)&self->_starModeDisableAssertion, 0);
  objc_storeStrong((id *)&self->_idleTimerDisableAssertion, 0);
  objc_storeStrong((id *)&self->_destinationObservers, 0);
  objc_storeStrong((id *)&self->_appsStatusBarAssertion, 0);
  objc_storeStrong((id *)&self->_systemStatusBarAssertion, 0);
  objc_storeStrong((id *)&self->_resignActiveAssertion, 0);
  objc_storeStrong((id *)&self->_dismissTimer, 0);
  objc_storeStrong((id *)&self->_replaceTimer, 0);
  objc_storeStrong((id *)&self->_presentTimer, 0);
  objc_storeStrong((id *)&self->_notificationViewControllerForActiveDragSession, 0);
  objc_storeStrong((id *)&self->_presentedPresentable, 0);
  objc_storeStrong((id *)&self->_setupManager, 0);
  objc_storeStrong((id *)&self->_lockScreenManager, 0);
  objc_storeStrong((id *)&self->_assistantController, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (NCNotificationViewController)presentedBanner
{
  uint64_t v2 = [(SBNotificationBannerDestination *)self _presentedNotificationPresentableVC];
  id v3 = [v2 notificationViewController];

  return (NCNotificationViewController *)v3;
}

- (void)_test_postNotificationRequest:(id)a3 completion:(id)a4
{
}

- (void)_test_dismissNotificationRequest:(id)a3
{
}

- (void)modifyNotificationRequest:(void *)a1 .cold.1(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = [a2 notificationIdentifier];
  id v5 = objc_msgSend(v4, "un_logDigest");
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1_17(&dword_1D85BA000, v6, v7, "Modifying notification %{public}@ in banner", v8, v9, v10, v11, v12);
}

- (void)withdrawNotificationRequest:(void *)a1 .cold.1(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = [a2 notificationIdentifier];
  id v5 = objc_msgSend(v4, "un_logDigest");
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1_17(&dword_1D85BA000, v6, v7, "Withdrawing notification %{public}@ from banner", v8, v9, v10, v11, v12);
}

- (void)fullScreenPresentableViewController:(uint64_t)a3 requestsDismissalWithReason:.cold.1(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = a1;
  id v5 = BNEffectivePresentableDescription();
  OUTLINED_FUNCTION_5_0();
  uint64_t v7 = a3;
  _os_log_error_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_ERROR, "Failed to revoke presentable '%{public}@': %{public}@", v6, 0x16u);
}

- (void)_postPresentableForRequest:(void *)a1 modal:(void *)a2 completion:.cold.1(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = [a2 notificationIdentifier];
  id v5 = objc_msgSend(v4, "un_logDigest");
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1_17(&dword_1D85BA000, v6, v7, "Replacing banner for notification %{public}@", v8, v9, v10, v11, v12);
}

void __69__SBNotificationBannerDestination__startTimerWithDelay_eventHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_0_1(&dword_1D85BA000, v0, v1, "timer fired %@", v2, v3, v4, v5, v6);
}

void __69__SBNotificationBannerDestination__startTimerWithDelay_eventHandler___block_invoke_124_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1D85BA000, log, OS_LOG_TYPE_ERROR, "timer should only fire while in short look", v1, 2u);
}

void __47__SBNotificationBannerDestination__setupTimers__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_0_1(&dword_1D85BA000, v0, v1, "present timer fired %@", v2, v3, v4, v5, v6);
}

- (void)_revokeAllPresentablesWithRequesterIdentifier:reason:options:.cold.1()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5_0();
  uint64_t v3 = v0;
  _os_log_error_impl(&dword_1D85BA000, v1, OS_LOG_TYPE_ERROR, "Failed to revoke presentables with requester identifier %{public}@: %{public}@", v2, 0x16u);
}

- (void)_dismissPresentedBannerOnly:(os_log_t)log reason:animated:.cold.1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_1D85BA000, log, OS_LOG_TYPE_ERROR, "Tried to dismiss a banner but none was presented", v1, 2u);
}

@end