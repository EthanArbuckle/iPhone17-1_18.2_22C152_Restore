@interface SBCoverSheetPresentationManager
+ (SBCoverSheetPresentationManager)sharedInstance;
+ (id)sharedInstanceIfExists;
+ (void)getLeadingTopButtonFrame:(CGRect *)a3 trailingTopButtonFrame:(CGRect *)a4 forScreen:(id)a5;
- (BOOL)_isEffectivelyLocked;
- (BOOL)_secureAppTypeGetsCorrectDismissalSemantics:(unint64_t)a3;
- (BOOL)activeInterfaceOrientationLocked;
- (BOOL)animateIconsOnPresentationToo;
- (BOOL)centerFollowsFinger;
- (BOOL)coverSheetCanTransitionToPresented:(BOOL)a3;
- (BOOL)coverSheetSlidingViewControllerContentShouldAutoRotateWhenNotVisible:(id)a3;
- (BOOL)coverSheetSlidingViewControllerShouldAllowDismissal:(id)a3;
- (BOOL)dismissingCoverSheet;
- (BOOL)hasBeenDismissedSinceBoot;
- (BOOL)hasBeenDismissedSinceKeybagLock;
- (BOOL)hasBeenDismissedSinceKeybagLockAndAuthenticated;
- (BOOL)hasContentUnderCoverSheetSlidingViewController:(id)a3;
- (BOOL)hasFirstSwipeShowGrabberOverride;
- (BOOL)iconAnimatorNeedsAnimating;
- (BOOL)isActiveInterfaceOrientationLocked;
- (BOOL)isAnyGestureActivelyRecognized;
- (BOOL)isCoverSheetHostingAnApp;
- (BOOL)isCoverSheetHostingUnlockedEnvironmentWindows;
- (BOOL)isDismissGestureActive;
- (BOOL)isInSecureApp;
- (BOOL)isPresented;
- (BOOL)isTransitioning;
- (BOOL)isVisible;
- (BOOL)isVisibleAndNotDisappearing;
- (BOOL)needsFakeStatusBarUpdate;
- (BOOL)pendingClearSecureAppViewControllers;
- (BOOL)preparingToDismissCoverSheet;
- (BOOL)rubberBandCleanupNeeded;
- (BOOL)secureAppEnvironmentViewControllerShouldEnableIdleWarning:(id)a3 alwaysOnEnabled:(BOOL)a4;
- (BOOL)shouldDisplayFakeStatusBar;
- (BOOL)wallpaperFloatingLayerHidden;
- (BOOL)wantsHomeGestureOwnership;
- (BSCompoundAssertion)preserveSecureAppAssertions;
- (BSEventQueue)lockUnlockQueue;
- (BSInvalidatable)deferOrientationUpdatesAssertion;
- (BSInvalidatable)keyboardFocusAssertion;
- (BSInvalidatable)requireWallpaperAssertion;
- (BSInvalidatable)secureAppViewController;
- (BSInvalidatable)suspendWallpaperAnimationAssertion;
- (BSInvalidatable)systemApertureCoverSheetAssertion;
- (BSInvalidatable)wallpaperFloatingLayerView;
- (CSCoverSheetFlyInSettings)flyInSettings;
- (CSCoverSheetTransitionSettings)transitionSettings;
- (CSLockScreenSettings)lockScreenSettings;
- (NSHashTable)dismissalObservers;
- (NSMutableSet)coverSheetWindowVisibleReasons;
- (NSMutableSet)secureAppWindowVisibleReasons;
- (NSSet)components;
- (NSString)coverSheetIdentifier;
- (OS_dispatch_group)iconAnimatorCompletionGroup;
- (SBAsynchronousRenderingAssertion)asynchronousRenderingAssertion;
- (SBAtomicObjectQueue)unlockProgressQueue;
- (SBCoverSheetIconFlyInAnimator)iconAnimator;
- (SBCoverSheetPresentationDelegate)delegate;
- (SBCoverSheetPresentationManager)init;
- (SBCoverSheetSceneManager)sceneManager;
- (SBCoverSheetSecureAppEnvironmentViewController)secureAppEnvironmentViewController;
- (SBCoverSheetSlidingViewController)coverSheetSlidingViewController;
- (SBCoverSheetSlidingViewController)secureAppSlidingViewController;
- (SBDeviceApplicationSceneHandle)coverSheetHostedAppSceneHandle;
- (SBDisableActiveInterfaceOrientationChangeAssertion)activeInterfaceOrientationChangeAssertion;
- (SBFZStackParticipant)zStackParticipant;
- (SBLockScreenEnvironment)lockScreenEnvironment;
- (SBMainWorkspace)mainWorkspace;
- (SBPearlMatchingStateProvider)pearlMatchingStateProvider;
- (SBUILockStateProvider)uiLockStateProvider;
- (SBWindow)coverSheetWindow;
- (SBWindow)secureAppWindow;
- (UIImpactFeedbackGenerator)rubberBandFeedbackGenerator;
- (UIView)wallpaperFloatingLayerViewContainerView;
- (_UILegibilitySettings)legibilitySettings;
- (double)iconFlyInFriction;
- (double)iconFlyInInteractiveDampingRatioMax;
- (double)iconFlyInInteractiveDampingRatioMin;
- (double)iconFlyInInteractiveResponseMax;
- (double)iconFlyInInteractiveResponseMin;
- (double)iconFlyInTension;
- (id)_impactFeedbackGeneratorConfigurationForStyle:(int64_t)a3;
- (id)_newRubberBandFeedbackGeneratorForSettings:(id)a3;
- (id)acquirePreserveSecureAppAssertionForReason:(id)a3;
- (id)coverSheetSlidingViewControllerIfLoaded;
- (id)coverSheetViewController;
- (id)iconAnimatorCompletionBlock;
- (id)ppt_transitionBeginsCallback;
- (id)ppt_transitionEndsCallback;
- (id)scenesForBacklightSession;
- (id)secureAppCleanupHandler;
- (id)secureAppSlidingViewControllerIfLoaded;
- (id)traitsParticipantForSceneHandle:(id)a3;
- (int64_t)_wallpaperEffectiveInterfaceOrientation;
- (int64_t)_wallpaperEffectiveInterfaceOrientationWithFallbackOrientation:(int64_t)a3;
- (int64_t)idleTimerDuration;
- (int64_t)idleTimerMode;
- (int64_t)idleWarnMode;
- (int64_t)interfaceOrientationForWallpaperController:(id)a3;
- (int64_t)notificationBehavior;
- (int64_t)participantState;
- (int64_t)proximityDetectionMode;
- (int64_t)scrollingStrategy;
- (unint64_t)restrictedCapabilities;
- (unint64_t)screenEdgesDeferringSystemGestures;
- (unint64_t)transitionOverrideOptions;
- (unint64_t)transitionType;
- (void)_acquireAsynchronousRenderingAssertion;
- (void)_acquireSystemApertureCoverSheetAssertion;
- (void)_animateForProgress:(double)a3;
- (void)_authenticationChanged:(id)a3;
- (void)_cleanupARubberBandTransitionForSlidingViewController:(id)a3;
- (void)_cleanupATransition;
- (void)_cleanupDismissalTransition;
- (void)_cleanupIconAnimator;
- (void)_cleanupInterstitialTransitionForSlidingViewController:(id)a3;
- (void)_cleanupPresentationTransition;
- (void)_cleanupRubberBandDismissalTransitionForSlidingViewController:(id)a3;
- (void)_cleanupRubberBandPresentationTransitionForSlidingViewController:(id)a3;
- (void)_clearSecureAppViewControllersIncludingWindow:(BOOL)a3;
- (void)_clearSecureAppViewControllersIncludingWindow:(BOOL)a3 force:(BOOL)a4;
- (void)_createWallpaperOverlayIfNeededWithCoverSheetFrame:(CGRect)a3;
- (void)_enqueueBlock:(id)a3 withName:(id)a4;
- (void)_invalidateSystemApertureCoverSheetAssertion;
- (void)_noteEffectiveLockStatusMayHaveChangedForUserNotification:(BOOL)a3 canDismiss:(BOOL)a4;
- (void)_notifyDelegateDidDismiss;
- (void)_notifyDelegateDidPresent;
- (void)_notifyDelegateRequestsUnlock;
- (void)_notifyDelegateWillDismiss;
- (void)_notifyDelegateWillPresent;
- (void)_performAfterSecureAppCleanup:(id)a3;
- (void)_prepareCoverSheetWindowForDisplay;
- (void)_prepareForARubberBandTransitionForSlidingViewController:(id)a3;
- (void)_prepareForATransition;
- (void)_prepareForDismissalTransition;
- (void)_prepareForPresentationTransitionForUserGesture:(BOOL)a3;
- (void)_prepareForRubberBandDismissalTransitionForSlidingViewController:(id)a3;
- (void)_prepareForRubberBandPresentationTransitionForSlidingViewController:(id)a3;
- (void)_prepareForTransitionToSecureApp;
- (void)_prepareIconAnimatorForPresenting:(BOOL)a3;
- (void)_prepareInterstitialTransitionForSlidingViewController:(id)a3;
- (void)_prepareSecureAppViewController;
- (void)_prepareSecureAppWindowForDisplay;
- (void)_relinquishAsynchronousRenderingAssertion;
- (void)_relinquishHomeGestureOwnership;
- (void)_removeWallpaperOverlay;
- (void)_requestHomeGestureOwnership;
- (void)_restartStartupTransitionBegan:(id)a3;
- (void)_setCoverSheet:(BOOL)a3 windowVisible:(BOOL)a4 forReason:(id)a5;
- (void)_setCoverSheetPresented:(BOOL)a3 forcePresented:(BOOL)a4 animated:(BOOL)a5 options:(unint64_t)a6 withCompletion:(id)a7;
- (void)_setCoverSheetPresented:(BOOL)a3 forcePresented:(BOOL)a4 animated:(BOOL)a5 withCompletion:(id)a6;
- (void)_setCoverSheetWindowVisible:(BOOL)a3 forReason:(id)a4;
- (void)_setOrientationUpdatesDeferred:(BOOL)a3;
- (void)_setSecureAppWindowVisible:(BOOL)a3 forReason:(id)a4;
- (void)_setTransitionProgress:(double)a3 animated:(BOOL)a4 gestureActive:(BOOL)a5 coverSheetProgress:(double)a6 completion:(id)a7;
- (void)_tellDashBoardOurAppearanceAndBehaviorChanged;
- (void)_tellDashBoardOurAppearanceChanged;
- (void)_tellDashBoardOurBehaviorChanged;
- (void)_transitionFromSecureAppToFullAppAndDismiss:(BOOL)a3 preservingBanners:(BOOL)a4;
- (void)_updateIconsFlyInWithSettings:(id)a3;
- (void)_updateInterstitialTransitionForSlidingViewController:(id)a3 withProgress:(double)a4;
- (void)_updateProximitySensorState;
- (void)_updateSecureAppViewControllerVisibilityForAssertionsActive:(BOOL)a3;
- (void)_updateShouldDisplayFakeStatusBarInVisibleTransition:(BOOL)a3;
- (void)_updateTopButtonsForCoverSheetViewController:(id)a3;
- (void)_updateVisibilityOfWindow:(id)a3 forReasons:(id)a4;
- (void)_updateWallpaperOverlay;
- (void)addDismissalObserver:(id)a3;
- (void)assistantDidDisappear:(id)a3 windowScene:(id)a4;
- (void)authenticationStateMayHaveChangedFromSource:(int)a3;
- (void)completeOngoingPresentationIfNeeded;
- (void)coverSheetSlidingViewController:(id)a3 animateForGestureActive:(BOOL)a4 withProgress:(double)a5 beginBlock:(id)a6 endBlock:(id)a7;
- (void)coverSheetSlidingViewController:(id)a3 animationTickedWithProgress:(double)a4 velocity:(double)a5 coverSheetFrame:(CGRect)a6 gestureActive:(BOOL)a7 forPresentationValue:(BOOL)a8;
- (void)coverSheetSlidingViewController:(id)a3 committingToEndPresented:(BOOL)a4;
- (void)coverSheetSlidingViewController:(id)a3 isTransitioning:(BOOL)a4;
- (void)coverSheetSlidingViewController:(id)a3 prepareForDismissalTransitionForReversingTransition:(BOOL)a4 forUserGesture:(BOOL)a5;
- (void)coverSheetSlidingViewController:(id)a3 prepareForPresentationTransitionForUserGesture:(BOOL)a4;
- (void)coverSheetSlidingViewControllerCleanupDismissalTransition:(id)a3;
- (void)coverSheetSlidingViewControllerCleanupPresentationTransition:(id)a3;
- (void)coverSheetSlidingViewControllerCleanupRubberBandedPresentationTransition:(id)a3;
- (void)coverSheetSlidingViewControllerDidEndTransition:(id)a3;
- (void)coverSheetSlidingViewControllerDidPassRubberBandThreshold:(id)a3;
- (void)coverSheetSlidingViewControllerPrepareForRubberBandedPresentationTransition:(id)a3;
- (void)coverSheetSlidingViewControllerReachabilityAnimationDidEnd:(id)a3;
- (void)coverSheetSlidingViewControllerReachabilityAnimationWillBegin:(id)a3;
- (void)coverSheetSlidingViewControllerUserPresentGestureBegan:(id)a3;
- (void)coverSheetViewController:(id)a3 didChangeActiveBehavior:(id)a4;
- (void)coverSheetViewControllerActivityItemsMayHaveChanged:(id)a3;
- (void)coverSheetViewControllerDidAddNewSceneHostEnvironment:(id)a3;
- (void)coverSheetViewControllerDidObscureWallpaper:(id)a3 obscured:(BOOL)a4;
- (void)coverSheetViewControllerDidUpdateAudioCategoriesDisablingVolumeHUD:(id)a3;
- (void)coverSheetViewControllerExternalLockProviderStateDidChange:(id)a3;
- (void)hostableEntityPresenter:(id)a3 didBeginHosting:(id)a4;
- (void)hostableEntityPresenter:(id)a3 didEndHosting:(id)a4;
- (void)loadViewsIfNeeded;
- (void)noteDeviceDidLock;
- (void)noteScreenDidTurnOff;
- (void)pearlMatchingStateProviderStateChangedForMatchFailure:(id)a3;
- (void)removeDismissalObserver:(id)a3;
- (void)sceneHandle:(id)a3 didCreateScene:(id)a4;
- (void)sceneHandle:(id)a3 didDestroyScene:(id)a4;
- (void)secureAppOfTypeDidBegin:(unint64_t)a3;
- (void)secureAppOfTypeDidEnd:(unint64_t)a3;
- (void)setActiveInterfaceOrientationChangeAssertion:(id)a3;
- (void)setActiveInterfaceOrientationLocked:(BOOL)a3;
- (void)setAnimateIconsOnPresentationToo:(BOOL)a3;
- (void)setAsynchronousRenderingAssertion:(id)a3;
- (void)setCenterFollowsFinger:(BOOL)a3;
- (void)setCoverSheetPresented:(BOOL)a3 animated:(BOOL)a4 options:(unint64_t)a5 withCompletion:(id)a6;
- (void)setCoverSheetPresented:(BOOL)a3 animated:(BOOL)a4 withCompletion:(id)a5;
- (void)setCoverSheetSlidingViewController:(id)a3;
- (void)setCoverSheetWindow:(id)a3;
- (void)setCoverSheetWindowVisibleReasons:(id)a3;
- (void)setDeferOrientationUpdatesAssertion:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDismissalObservers:(id)a3;
- (void)setDismissingCoverSheet:(BOOL)a3;
- (void)setFlyInSettings:(id)a3;
- (void)setHasBeenDismissedSinceBoot:(BOOL)a3;
- (void)setHasBeenDismissedSinceKeybagLock:(BOOL)a3;
- (void)setIconAnimator:(id)a3;
- (void)setIconAnimatorCompletionBlock:(id)a3;
- (void)setIconAnimatorCompletionGroup:(id)a3;
- (void)setIconAnimatorNeedsAnimating:(BOOL)a3;
- (void)setIconFlyInFriction:(double)a3;
- (void)setIconFlyInInteractiveDampingRatioMax:(double)a3;
- (void)setIconFlyInInteractiveDampingRatioMin:(double)a3;
- (void)setIconFlyInInteractiveResponseMax:(double)a3;
- (void)setIconFlyInInteractiveResponseMin:(double)a3;
- (void)setIconFlyInTension:(double)a3;
- (void)setKeyboardFocusAssertion:(id)a3;
- (void)setLockScreenEnvironment:(id)a3;
- (void)setLockScreenSettings:(id)a3;
- (void)setLockUnlockQueue:(id)a3;
- (void)setMainWorkspace:(id)a3;
- (void)setNeedsFakeStatusBarUpdate:(BOOL)a3;
- (void)setParticipantState:(int64_t)a3;
- (void)setPearlMatchingStateProvider:(id)a3;
- (void)setPendingClearSecureAppViewControllers:(BOOL)a3;
- (void)setPpt_transitionBeginsCallback:(id)a3;
- (void)setPpt_transitionEndsCallback:(id)a3;
- (void)setPreparingToDismissCoverSheet:(BOOL)a3;
- (void)setPreserveSecureAppAssertions:(id)a3;
- (void)setRequireWallpaperAssertion:(id)a3;
- (void)setRubberBandCleanupNeeded:(BOOL)a3;
- (void)setRubberBandFeedbackGenerator:(id)a3;
- (void)setSceneManager:(id)a3;
- (void)setSecureAppCleanupHandler:(id)a3;
- (void)setSecureAppEnvironmentViewController:(id)a3;
- (void)setSecureAppSlidingViewController:(id)a3;
- (void)setSecureAppViewController:(id)a3;
- (void)setSecureAppWindow:(id)a3;
- (void)setSecureAppWindowVisibleReasons:(id)a3;
- (void)setShouldDisplayFakeStatusBar:(BOOL)a3;
- (void)setSuspendWallpaperAnimationAssertion:(id)a3;
- (void)setSystemApertureCoverSheetAssertion:(id)a3;
- (void)setTransitionOverrideOptions:(unint64_t)a3;
- (void)setTransitionSettings:(id)a3;
- (void)setTransitionType:(unint64_t)a3;
- (void)setUILockStateProvider:(id)a3;
- (void)setUnlockProgressQueue:(id)a3;
- (void)setWallpaperFloatingLayerHidden:(BOOL)a3;
- (void)setWallpaperFloatingLayerView:(id)a3;
- (void)setWallpaperFloatingLayerViewContainerView:(id)a3;
- (void)setWantsHomeGestureOwnership:(BOOL)a3;
- (void)setZStackParticipant:(id)a3;
- (void)settings:(id)a3 changedValueForKey:(id)a4;
- (void)updateBecauseSecureAppChanged;
- (void)updateInterfaceOrientationToMatchOrientation:(int64_t)a3;
- (void)updateVisibilityForGrabberVisible:(BOOL)a3;
- (void)willUIUnlockWithPendingUnlockRequest:(BOOL)a3;
- (void)zStackParticipant:(id)a3 updatePreferences:(id)a4;
@end

@implementation SBCoverSheetPresentationManager

- (BOOL)isVisible
{
  if ([(SBUILockStateProvider *)self->_uiLockStateProvider isUILocked]) {
    return 1;
  }
  v4 = [(SBCoverSheetPresentationManager *)self coverSheetSlidingViewControllerIfLoaded];
  BOOL v3 = [v4 _appearState] != 0;

  return v3;
}

- (id)coverSheetSlidingViewControllerIfLoaded
{
  return self->_coverSheetSlidingViewController;
}

+ (SBCoverSheetPresentationManager)sharedInstance
{
  if (sharedInstance_onceToken_20 != -1) {
    dispatch_once(&sharedInstance_onceToken_20, &__block_literal_global_158);
  }
  v2 = (void *)__sharedInstance_1;
  return (SBCoverSheetPresentationManager *)v2;
}

- (BSInvalidatable)secureAppViewController
{
  return self->_secureAppViewController;
}

- (id)traitsParticipantForSceneHandle:(id)a3
{
  id v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) == 0
    || ([(SBCoverSheetSecureAppEnvironmentViewController *)self->_secureAppEnvironmentViewController traitsParticipantForSceneHandle:v4], (v5 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v6 = [(SBLockScreenEnvironment *)self->_lockScreenEnvironment applicationHoster];
    if (objc_opt_respondsToSelector())
    {
      v5 = [v6 traitsParticipantForSceneHandle:v4];
    }
    else
    {
      v5 = 0;
    }
  }
  return v5;
}

- (NSString)coverSheetIdentifier
{
  return (NSString *)@"CoverSheet";
}

- (void)_tellDashBoardOurBehaviorChanged
{
  id v3 = [(SBCoverSheetPresentationManager *)self coverSheetViewController];
  [v3 externalBehaviorProviderBehaviorChanged:self];
}

- (void)_tellDashBoardOurAppearanceAndBehaviorChanged
{
  [(SBCoverSheetPresentationManager *)self _tellDashBoardOurAppearanceChanged];
  [(SBCoverSheetPresentationManager *)self _tellDashBoardOurBehaviorChanged];
}

- (void)_tellDashBoardOurAppearanceChanged
{
  id v3 = [(SBCoverSheetPresentationManager *)self coverSheetViewController];
  [v3 externalAppearanceProviderBehaviorChanged:self];
}

- (BOOL)isAnyGestureActivelyRecognized
{
  if ([(SBCoverSheetSlidingViewController *)self->_coverSheetSlidingViewController isAnyGestureActivelyRecognized])
  {
    return 1;
  }
  secureAppSlidingViewController = self->_secureAppSlidingViewController;
  return [(SBCoverSheetSlidingViewController *)secureAppSlidingViewController isAnyGestureActivelyRecognized];
}

+ (id)sharedInstanceIfExists
{
  return (id)__sharedInstance_1;
}

- (id)coverSheetViewController
{
  v2 = [(SBLockScreenEnvironment *)self->_lockScreenEnvironment rootViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (SBDeviceApplicationSceneHandle)coverSheetHostedAppSceneHandle
{
  id v3 = [(SBLockScreenEnvironment *)self->_lockScreenEnvironment applicationHoster];
  char v4 = [v3 isHostingAnApp];
  secureAppViewController = (BSInvalidatable *)v3;
  if (v4) {
    goto LABEL_4;
  }
  if ([(BSInvalidatable *)self->_secureAppViewController isHostingAnApp])
  {
    secureAppViewController = self->_secureAppViewController;
LABEL_4:
    v6 = [(BSInvalidatable *)secureAppViewController hostedAppSceneHandle];
    goto LABEL_6;
  }
  v6 = 0;
LABEL_6:

  return (SBDeviceApplicationSceneHandle *)v6;
}

- (BOOL)isCoverSheetHostingAnApp
{
  id v3 = [(SBLockScreenEnvironment *)self->_lockScreenEnvironment applicationHoster];
  char v4 = [v3 isHostingAnApp];

  if (v4)
  {
LABEL_7:
    LOBYTE(secureAppViewController) = 1;
    return (char)secureAppViewController;
  }
  secureAppViewController = self->_secureAppViewController;
  if (secureAppViewController)
  {
    if (([(BSInvalidatable *)secureAppViewController isHostingAnApp] & 1) == 0)
    {
      v6 = SBLogCoverSheet();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "Is coversheet hosting an app ? Neither application hoster nor secure app view controller is hosting an app but we have a secure app view controller. Returning YES", v8, 2u);
      }
    }
    goto LABEL_7;
  }
  return (char)secureAppViewController;
}

uint64_t __49__SBCoverSheetPresentationManager_sharedInstance__block_invoke()
{
  kdebug_trace();
  v0 = objc_alloc_init(SBCoverSheetPresentationManager);
  v1 = (void *)__sharedInstance_1;
  __sharedInstance_1 = (uint64_t)v0;

  v2 = +[SBWallpaperController sharedInstance];
  [v2 setOrientationProvider:__sharedInstance_1 forSource:3];

  return kdebug_trace();
}

- (SBCoverSheetPresentationManager)init
{
  v43.receiver = self;
  v43.super_class = (Class)SBCoverSheetPresentationManager;
  v2 = [(SBCoverSheetPresentationManager *)&v43 init];
  if (v2)
  {
    id v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    coverSheetWindowVisibleReasons = v2->_coverSheetWindowVisibleReasons;
    v2->_coverSheetWindowVisibleReasons = v3;

    v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    secureAppWindowVisibleReasons = v2->_secureAppWindowVisibleReasons;
    v2->_secureAppWindowVisibleReasons = v5;

    v7 = objc_alloc_init(SBAtomicObjectQueue);
    unlockProgressQueue = v2->_unlockProgressQueue;
    v2->_unlockProgressQueue = v7;

    id v9 = objc_alloc(MEMORY[0x1E4F4F740]);
    uint64_t v10 = [v9 initWithName:@"SBCoverSheetLockUnlockQueue" onQueue:MEMORY[0x1E4F14428]];
    lockUnlockQueue = v2->_lockUnlockQueue;
    v2->_lockUnlockQueue = (BSEventQueue *)v10;

    uint64_t v12 = [MEMORY[0x1E4F5E408] rootSettings];
    lockScreenSettings = v2->_lockScreenSettings;
    v2->_lockScreenSettings = (CSLockScreenSettings *)v12;

    [(CSLockScreenSettings *)v2->_lockScreenSettings addKeyObserver:v2];
    v14 = [(CSLockScreenSettings *)v2->_lockScreenSettings dashBoardScrollModifierSettings];
    [v14 addKeyObserver:v2];

    uint64_t v15 = [(SBCoverSheetPresentationManager *)v2 _newRubberBandFeedbackGeneratorForSettings:v2->_lockScreenSettings];
    rubberBandFeedbackGenerator = v2->_rubberBandFeedbackGenerator;
    v2->_rubberBandFeedbackGenerator = (UIImpactFeedbackGenerator *)v15;

    v17 = [(CSLockScreenSettings *)v2->_lockScreenSettings coverSheetTransitionsSettings];
    uint64_t v18 = [v17 flyInSettings];
    flyInSettings = v2->_flyInSettings;
    v2->_flyInSettings = (CSCoverSheetFlyInSettings *)v18;

    [(SBCoverSheetPresentationManager *)v2 _updateIconsFlyInWithSettings:v2->_flyInSettings];
    v20 = [(CSLockScreenSettings *)v2->_lockScreenSettings coverSheetTransitionsSettings];
    v21 = [v20 flyInSettings];
    [v21 addKeyObserver:v2];

    v22 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v22 addObserver:v2 selector:sel__authenticationChanged_ name:*MEMORY[0x1E4FA6140] object:0];
    [v22 addObserver:v2 selector:sel__restartStartupTransitionBegan_ name:@"SBRestartManagerDidBeginStartupTransitionNotification" object:0];
    v23 = +[SBSecureAppManager sharedInstance];
    [v23 addObserver:v2];

    v24 = +[SBAssistantController sharedInstance];
    [v24 addObserver:v2];

    v25 = [(id)SBApp windowSceneManager];
    v26 = [v25 embeddedDisplayWindowScene];
    v27 = [v26 zStackResolver];

    uint64_t v28 = [v27 acquireParticipantWithIdentifier:8 delegate:v2];
    zStackParticipant = v2->_zStackParticipant;
    v2->_zStackParticipant = (SBFZStackParticipant *)v28;

    objc_initWeak(&location, v2);
    v30 = (void *)MEMORY[0x1E4F4F6E8];
    v31 = (objc_class *)objc_opt_class();
    v32 = NSStringFromClass(v31);
    uint64_t v37 = MEMORY[0x1E4F143A8];
    uint64_t v38 = 3221225472;
    v39 = __39__SBCoverSheetPresentationManager_init__block_invoke;
    v40 = &unk_1E6AF92D8;
    objc_copyWeak(&v41, &location);
    uint64_t v33 = [v30 assertionWithIdentifier:v32 stateDidChangeHandler:&v37];
    preserveSecureAppAssertions = v2->_preserveSecureAppAssertions;
    v2->_preserveSecureAppAssertions = (BSCompoundAssertion *)v33;

    v35 = objc_msgSend((id)SBApp, "backlightEnvironmentSessionProvider", v37, v38, v39, v40);
    [v35 registerBacklightEnvironmentSceneProvider:v2];

    objc_destroyWeak(&v41);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __39__SBCoverSheetPresentationManager_init__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  id v4 = v3;
  BSDispatchMain();

  objc_destroyWeak(&v5);
}

void __39__SBCoverSheetPresentationManager_init__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_updateSecureAppViewControllerVisibilityForAssertionsActive:", objc_msgSend(*(id *)(a1 + 32), "isActive"));
}

- (BOOL)coverSheetCanTransitionToPresented:(BOOL)a3
{
  return [(SBCoverSheetSlidingViewController *)self->_coverSheetSlidingViewController canTransitionToPresented:a3];
}

- (void)setCoverSheetPresented:(BOOL)a3 animated:(BOOL)a4 withCompletion:(id)a5
{
}

- (void)_setCoverSheetPresented:(BOOL)a3 forcePresented:(BOOL)a4 animated:(BOOL)a5 withCompletion:(id)a6
{
}

- (void)setCoverSheetPresented:(BOOL)a3 animated:(BOOL)a4 options:(unint64_t)a5 withCompletion:(id)a6
{
}

- (void)_setCoverSheetPresented:(BOOL)a3 forcePresented:(BOOL)a4 animated:(BOOL)a5 options:(unint64_t)a6 withCompletion:(id)a7
{
  BOOL v8 = a5;
  BOOL v9 = a4;
  BOOL v10 = a3;
  id v12 = a7;
  BOOL v13 = [(SBCoverSheetPresentationManager *)self isInSecureApp];
  if ([(SBUILockStateProvider *)self->_uiLockStateProvider isUILocked] != v10
    || (BOOL v17 = [(SBCoverSheetSlidingViewController *)self->_coverSheetSlidingViewController isAnyGestureActivelyRecognized], v10 && v9)|| v17|| v13)
  {
    v14 = [(SBCoverSheetSlidingViewController *)self->_coverSheetSlidingViewController activeGestureRecognizer];
    if (v8 && !v10)
    {
      uint64_t v15 = SBLogTelemetrySignposts();
      if (os_signpost_enabled(v15))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1D85BA000, v15, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SB_LOCKSCREEN_UNLOCK_ANIMATION_START", " enableTelemetry=YES  isAnimation=YES ", buf, 2u);
      }

      kdebug_trace();
      v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v16 postNotificationName:@"SBCoverSheetWillAnimateDeactivation" object:self];
    }
    [v14 setEnabled:0];
    [v14 setEnabled:1];
    self->_transitionOverrideOptions = a6;
    [(SBCoverSheetSlidingViewController *)self->_coverSheetSlidingViewController setPresented:v10 forUserGesture:(a6 >> 2) & 1 animated:v8 withCompletion:v12];
    self->_transitionOverrideOptions = 0;
  }
  else
  {
    if (!v12) {
      goto LABEL_9;
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __106__SBCoverSheetPresentationManager__setCoverSheetPresented_forcePresented_animated_options_withCompletion___block_invoke;
    block[3] = &unk_1E6AF5300;
    id v19 = v12;
    dispatch_async(MEMORY[0x1E4F14428], block);
    v14 = v19;
  }

LABEL_9:
}

uint64_t __106__SBCoverSheetPresentationManager__setCoverSheetPresented_forcePresented_animated_options_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)completeOngoingPresentationIfNeeded
{
  id v3 = [(SBCoverSheetPresentationManager *)self coverSheetSlidingViewControllerIfLoaded];
  int v4 = [v3 _appearState];

  if (v4 == 1)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __70__SBCoverSheetPresentationManager_completeOngoingPresentationIfNeeded__block_invoke;
    v5[3] = &unk_1E6AF4AC0;
    v5[4] = self;
    [MEMORY[0x1E4F42FF0] performWithoutAnimation:v5];
  }
}

void __70__SBCoverSheetPresentationManager_completeOngoingPresentationIfNeeded__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) coverSheetSlidingViewController];
  [v1 setPresented:1 forUserGesture:0 animated:0 withCompletion:0];
}

- (BOOL)isInSecureApp
{
  v2 = [(SBCoverSheetPresentationManager *)self secureAppSlidingViewControllerIfLoaded];
  id v3 = v2;
  if (v2) {
    BOOL v4 = [v2 _appearState] != 0;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (void)updateBecauseSecureAppChanged
{
  [(SBCoverSheetPresentationManager *)self _clearSecureAppViewControllersIncludingWindow:0 force:1];
  [(SBCoverSheetPresentationManager *)self _prepareSecureAppWindowForDisplay];
}

- (void)updateInterfaceOrientationToMatchOrientation:(int64_t)a3
{
  id v5 = [(SBCoverSheetPresentationManager *)self coverSheetWindow];
  uint64_t v6 = [v5 interfaceOrientation];

  if (v6 != a3)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __80__SBCoverSheetPresentationManager_updateInterfaceOrientationToMatchOrientation___block_invoke;
    v7[3] = &unk_1E6AF4A70;
    v7[4] = self;
    v7[5] = a3;
    [MEMORY[0x1E4F42FF0] performWithoutAnimation:v7];
  }
}

void __80__SBCoverSheetPresentationManager_updateInterfaceOrientationToMatchOrientation___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) coverSheetWindow];
  [v2 _legacySetRotatableViewOrientation:*(void *)(a1 + 40) duration:0.0];

  id v3 = [*(id *)(a1 + 32) zStackParticipant];
  [v3 setNeedsUpdatePreferencesWithReason:@"updateInterfaceOrientationToMatchOrientation"];
}

- (BOOL)isVisibleAndNotDisappearing
{
  id v3 = [(SBCoverSheetPresentationManager *)self coverSheetSlidingViewControllerIfLoaded];
  int v4 = [v3 _appearState];

  if (v4 == 3) {
    return 0;
  }
  BOOL result = [(SBUILockStateProvider *)self->_uiLockStateProvider isUILocked];
  if (v4) {
    return 1;
  }
  return result;
}

- (BOOL)isTransitioning
{
  v2 = [(SBCoverSheetPresentationManager *)self coverSheetSlidingViewControllerIfLoaded];
  int v3 = [v2 _appearState];

  return (v3 & 0xFFFFFFFD) == 1;
}

- (BOOL)isPresented
{
  v2 = [(SBCoverSheetPresentationManager *)self coverSheetSlidingViewControllerIfLoaded];
  int v3 = [v2 _appearState];

  return (v3 - 1) < 2;
}

- (BOOL)isDismissGestureActive
{
  if ([(SBCoverSheetSlidingViewController *)self->_coverSheetSlidingViewController isDismissGestureActive])
  {
    return 1;
  }
  secureAppSlidingViewController = self->_secureAppSlidingViewController;
  return [(SBCoverSheetSlidingViewController *)secureAppSlidingViewController isDismissGestureActive];
}

- (void)willUIUnlockWithPendingUnlockRequest:(BOOL)a3
{
  BOOL v3 = a3;
  if (![(SBCoverSheetPresentationManager *)self _isEffectivelyLocked])
  {
    id v5 = [(SBCoverSheetPresentationManager *)self secureAppViewController];
    uint64_t v6 = [v5 hostedAppSceneHandle];

    if (v6)
    {
      [(SBCoverSheetPresentationManager *)self _transitionFromSecureAppToFullAppAndDismiss:v3 ^ 1 preservingBanners:v3];
    }
  }
}

- (void)authenticationStateMayHaveChangedFromSource:(int)a3
{
  [(SBCoverSheetPresentationManager *)self _noteEffectiveLockStatusMayHaveChangedForUserNotification:a3 == 10 canDismiss:1];
}

- (void)loadViewsIfNeeded
{
  id v2 = [(SBCoverSheetPresentationManager *)self coverSheetSlidingViewController];
  [v2 loadViewIfNeeded];
}

- (void)noteDeviceDidLock
{
}

- (id)acquirePreserveSecureAppAssertionForReason:(id)a3
{
  return (id)[(BSCompoundAssertion *)self->_preserveSecureAppAssertions acquireForReason:a3];
}

- (void)addDismissalObserver:(id)a3
{
  id v4 = a3;
  dismissalObservers = self->_dismissalObservers;
  id v8 = v4;
  if (!dismissalObservers)
  {
    uint64_t v6 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    v7 = self->_dismissalObservers;
    self->_dismissalObservers = v6;

    id v4 = v8;
    dismissalObservers = self->_dismissalObservers;
  }
  [(NSHashTable *)dismissalObservers addObject:v4];
}

- (void)removeDismissalObserver:(id)a3
{
}

- (SBWindow)coverSheetWindow
{
  coverSheetWindow = self->_coverSheetWindow;
  if (!coverSheetWindow)
  {
    id v4 = [SBCoverSheetWindow alloc];
    id v5 = [(id)SBApp windowSceneManager];
    uint64_t v6 = [v5 embeddedDisplayWindowScene];
    v7 = [(SBWindow *)v4 initWithWindowScene:v6 role:@"SBTraitsParticipantRoleCoverSheet" debugName:@"CoverSheet"];

    id v8 = [MEMORY[0x1E4F428B8] clearColor];
    [(SBCoverSheetWindow *)v7 setBackgroundColor:v8];

    [(SBCoverSheetWindow *)v7 setWindowLevel:*MEMORY[0x1E4F43CF8]];
    BOOL v9 = [(UIWindow *)v7 _sbWindowScene];
    BOOL v10 = [v9 statusBarManager];
    v11 = [v10 layoutManager];
    [v11 setOrientationWindow:v7 forStatusBarLayoutLayer:1];

    id v12 = +[SBSecureAppManager sharedInstance];
    BOOL v13 = [(UIWindow *)v7 _sbWindowScene];
    v14 = [v13 layoutStateTransitionCoordinator];
    [v12 setSecureAppTransitionCoordinator:v14];

    [(SBCoverSheetPresentationManager *)self setCoverSheetWindow:v7];
    coverSheetWindow = self->_coverSheetWindow;
  }
  return coverSheetWindow;
}

- (void)setCoverSheetWindow:(id)a3
{
  id v5 = (SBWindow *)a3;
  if (self->_coverSheetWindow != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_coverSheetWindow, a3);
    [(SBCoverSheetPresentationManager *)self _prepareCoverSheetWindowForDisplay];
    [(SBCoverSheetPresentationManager *)self _updateVisibilityOfWindow:self->_coverSheetWindow forReasons:self->_coverSheetWindowVisibleReasons];
    uint64_t v6 = [(SBCoverSheetPresentationManager *)self sceneManager];
    [v6 setCoverSheetWindow:self->_coverSheetWindow];

    id v5 = v7;
  }
}

- (void)setLockScreenEnvironment:(id)a3
{
  id v5 = (SBLockScreenEnvironment *)a3;
  if (self->_lockScreenEnvironment != v5)
  {
    BOOL v13 = v5;
    objc_storeStrong((id *)&self->_lockScreenEnvironment, a3);
    uint64_t v6 = [(SBLockScreenEnvironment *)self->_lockScreenEnvironment rootViewController];
    if (objc_opt_respondsToSelector()) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }
    id v8 = [(SBCoverSheetSlidingViewController *)[SBCoverSheetPrimarySlidingViewController alloc] initWithContentViewController:v7 canBePulledDown:1 canBePulledUp:1 dismissalPreemptingGestureRecognizer:0];
    [(SBCoverSheetSlidingViewController *)v8 setDelegate:self];
    [(SBCoverSheetPrimarySlidingViewController *)v8 setGrabberDelegate:self];
    BOOL v9 = [(id)SBApp proximitySensorManager];
    [(SBCoverSheetSlidingViewController *)v8 setProximitySensorManager:v9];

    [(SBCoverSheetPresentationManager *)self setCoverSheetSlidingViewController:v8];
    BOOL v10 = [(SBCoverSheetPresentationManager *)self coverSheetViewController];
    [v10 registerExternalAppearanceProvider:self];

    v11 = [(SBCoverSheetPresentationManager *)self coverSheetViewController];
    [v11 registerExternalBehaviorProvider:self];

    id v12 = [(SBCoverSheetPresentationManager *)self coverSheetViewController];
    [v12 addCoverSheetObserver:self];

    id v5 = v13;
  }
}

- (SBCoverSheetSlidingViewController)coverSheetSlidingViewController
{
  coverSheetSlidingViewController = self->_coverSheetSlidingViewController;
  if (!coverSheetSlidingViewController)
  {
    uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"SBCoverSheetPresentationManager.m" lineNumber:488 description:@"asking for the coversheet sliding view controller before it was initialized."];

    coverSheetSlidingViewController = self->_coverSheetSlidingViewController;
  }
  return coverSheetSlidingViewController;
}

- (SBCoverSheetSceneManager)sceneManager
{
  sceneManager = self->_sceneManager;
  if (!sceneManager)
  {
    id v4 = [SBCoverSheetSceneManager alloc];
    id v5 = [(SBCoverSheetPresentationManager *)self coverSheetWindow];
    uint64_t v6 = [(SBCoverSheetSceneManager *)v4 initWithCoverSheetWindow:v5];
    id v7 = self->_sceneManager;
    self->_sceneManager = v6;

    sceneManager = self->_sceneManager;
  }
  return sceneManager;
}

- (void)setTransitionType:(unint64_t)a3
{
  if (self->_transitionType != a3)
  {
    self->_transitionType = a3;
    CSCoverSheetTransitionSettingsForTransitionType(a3);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [(SBCoverSheetPresentationManager *)self setTransitionSettings:v4];
    [(SBCoverSheetSlidingViewController *)self->_coverSheetSlidingViewController setTransitionSettings:v4];
  }
}

- (void)setPearlMatchingStateProvider:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pearlMatchingStateProvider);
  if (WeakRetained != obj)
  {
    [WeakRetained setDelegate:0];
    objc_storeWeak((id *)&self->_pearlMatchingStateProvider, obj);
    [obj setDelegate:self];
  }
}

- (BOOL)isActiveInterfaceOrientationLocked
{
  return self->_activeInterfaceOrientationChangeAssertion != 0;
}

- (void)setActiveInterfaceOrientationLocked:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v6 = [v5 userInterfaceIdiom];

  if ((v6 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    return;
  }
  if (!v3)
  {
    [(SBDisableActiveInterfaceOrientationChangeAssertion *)self->_activeInterfaceOrientationChangeAssertion invalidate];
    activeInterfaceOrientationChangeAssertion = self->_activeInterfaceOrientationChangeAssertion;
    self->_activeInterfaceOrientationChangeAssertion = 0;
LABEL_9:

    return;
  }
  uint64_t v7 = [(id)SBApp activeInterfaceOrientation];
  if (v7 != [(id)SBApp activeInterfaceOrientationWithoutConsideringTransientOverlays]) {
    [(id)SBApp noteInterfaceOrientationChanged:v7 logMessage:@"Cover Sheet presentation over transient overlay might cause orientation mismatch"];
  }
  if (!self->_activeInterfaceOrientationChangeAssertion)
  {
    BOOL v9 = [[SBDisableActiveInterfaceOrientationChangeAssertion alloc] initWithReason:@"SBCoverSheetLockActiveInterfaceOrientationReason" nudgeOrientationOnInvalidate:1];
    activeInterfaceOrientationChangeAssertion = self->_activeInterfaceOrientationChangeAssertion;
    self->_activeInterfaceOrientationChangeAssertion = v9;
    goto LABEL_9;
  }
}

- (void)setHasBeenDismissedSinceKeybagLock:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (self->_hasBeenDismissedSinceKeybagLockAndAuthenticated != a3)
  {
    if (!a3
      || ([(id)SBApp authenticationController],
          id v5 = objc_claimAutoreleasedReturnValue(),
          int v6 = [v5 isAuthenticated],
          v5,
          v6))
    {
      self->_hasBeenDismissedSinceKeybagLockAndAuthenticated = v3;
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      uint64_t v7 = (void *)[(NSHashTable *)self->_dismissalObservers copy];
      uint64_t v8 = [v7 countByEnumeratingWithState:&v23 objects:v28 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v24;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v24 != v10) {
              objc_enumerationMutation(v7);
            }
            id v12 = *(void **)(*((void *)&v23 + 1) + 8 * v11);
            if (objc_opt_respondsToSelector()) {
              [v12 coverSheetPresentationManagerDidChangeDismissedSinceKeyBagLockAndAuthenticated:self];
            }
            ++v11;
          }
          while (v9 != v11);
          uint64_t v9 = [v7 countByEnumeratingWithState:&v23 objects:v28 count:16];
        }
        while (v9);
      }
    }
  }
  if (self->_hasBeenDismissedSinceKeybagLock != v3)
  {
    self->_hasBeenDismissedSinceKeybagLock = v3;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    BOOL v13 = (void *)[(NSHashTable *)self->_dismissalObservers copy];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v19 objects:v27 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v20;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v20 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void **)(*((void *)&v19 + 1) + 8 * v17);
          if (objc_opt_respondsToSelector()) {
            [v18 coverSheetPresentationManagerDidChangeDismissedSinceKeyBagLock:self];
          }
          ++v17;
        }
        while (v15 != v17);
        uint64_t v15 = [v13 countByEnumeratingWithState:&v19 objects:v27 count:16];
      }
      while (v15);
    }

    [(SBCoverSheetPresentationManager *)self _tellDashBoardOurAppearanceChanged];
    [(UIViewController *)self->_coverSheetSlidingViewController _setNeedsUpdateOfSupportedInterfaceOrientations];
  }
}

- (void)setIconAnimatorCompletionGroup:(id)a3
{
  id v5 = (OS_dispatch_group *)a3;
  if (self->_iconAnimatorCompletionGroup != v5)
  {
    int v6 = v5;
    objc_storeStrong((id *)&self->_iconAnimatorCompletionGroup, a3);
    [(SBCoverSheetPresentationManager *)self setIconAnimatorCompletionBlock:0];
    id v5 = v6;
  }
}

- (void)setIconAnimatorCompletionBlock:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id iconAnimatorCompletionBlock = self->_iconAnimatorCompletionBlock;
  if (iconAnimatorCompletionBlock != v4)
  {
    if (iconAnimatorCompletionBlock)
    {
      int v6 = SBLogCoverSheet();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v7 = (void *)MEMORY[0x1D948C7A0](self->_iconAnimatorCompletionBlock);
        int v12 = 134217984;
        BOOL v13 = v7;
        _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "Cancelling completion block %p for icon animation", (uint8_t *)&v12, 0xCu);
      }
      dispatch_block_cancel(self->_iconAnimatorCompletionBlock);
    }
    uint64_t v8 = (void *)[v4 copy];
    id v9 = self->_iconAnimatorCompletionBlock;
    self->_id iconAnimatorCompletionBlock = v8;

    if (self->_iconAnimatorCompletionBlock)
    {
      uint64_t v10 = SBLogCoverSheet();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = (void *)MEMORY[0x1D948C7A0](self->_iconAnimatorCompletionBlock);
        int v12 = 134217984;
        BOOL v13 = v11;
        _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_DEFAULT, "Scheduling completion block %p for icon animation", (uint8_t *)&v12, 0xCu);
      }
      dispatch_group_notify((dispatch_group_t)self->_iconAnimatorCompletionGroup, MEMORY[0x1E4F14428], self->_iconAnimatorCompletionBlock);
    }
  }
}

- (SBWindow)secureAppWindow
{
  if (!self->_secureAppWindow)
  {
    BOOL v3 = +[SBSecureAppManager sharedInstance];
    int v4 = [v3 hasSecureApp];

    if (v4)
    {
      id v5 = [SBSecureAppWindow alloc];
      int v6 = [(id)SBApp windowSceneManager];
      uint64_t v7 = [v6 embeddedDisplayWindowScene];
      uint64_t v8 = [(SBWindow *)v5 initWithWindowScene:v7 role:@"SBTraitsParticipantRoleSecureApp" debugName:@"SecureApp"];

      id v9 = [MEMORY[0x1E4F428B8] blackColor];
      [(SBSecureAppWindow *)v8 setBackgroundColor:v9];

      [(SBSecureAppWindow *)v8 setWindowLevel:*MEMORY[0x1E4F43CF8] + -5.0];
      [(SBCoverSheetPresentationManager *)self setSecureAppWindow:v8];
    }
  }
  secureAppWindow = self->_secureAppWindow;
  return secureAppWindow;
}

- (void)setSecureAppWindow:(id)a3
{
  id v5 = (SBWindow *)a3;
  if (self->_secureAppWindow != v5)
  {
    int v6 = v5;
    objc_storeStrong((id *)&self->_secureAppWindow, a3);
    [(SBCoverSheetPresentationManager *)self _updateVisibilityOfWindow:self->_secureAppWindow forReasons:self->_secureAppWindowVisibleReasons];
    [(SBCoverSheetPresentationManager *)self _tellDashBoardOurBehaviorChanged];
    id v5 = v6;
  }
}

- (SBCoverSheetSlidingViewController)secureAppSlidingViewController
{
  secureAppSlidingViewController = self->_secureAppSlidingViewController;
  if (!secureAppSlidingViewController)
  {
    [(SBCoverSheetPresentationManager *)self _prepareSecureAppViewController];
    secureAppSlidingViewController = self->_secureAppSlidingViewController;
  }
  return secureAppSlidingViewController;
}

- (id)secureAppSlidingViewControllerIfLoaded
{
  return self->_secureAppSlidingViewController;
}

- (void)setSecureAppSlidingViewController:(id)a3
{
  id v5 = (SBCoverSheetSlidingViewController *)a3;
  secureAppSlidingViewController = self->_secureAppSlidingViewController;
  if (secureAppSlidingViewController != v5)
  {
    uint64_t v7 = v5;
    [(SBCoverSheetSlidingViewController *)secureAppSlidingViewController bs_endAppearanceTransition:0];
    [(SBWindow *)self->_secureAppWindow setRootViewController:0];
    objc_storeStrong((id *)&self->_secureAppSlidingViewController, a3);
    id v5 = v7;
  }
}

- (void)_prepareSecureAppViewController
{
  id v13 = +[SBSecureAppManager sharedInstance];
  BOOL v3 = (void *)[v13 newHostableEntityForCurrentSecureApp];
  if (v3)
  {
    int v4 = (SBSecureAppViewController *)objc_alloc_init(MEMORY[0x1E4F5E400]);
    [(SBSecureAppViewController *)v4 setHostedEntity:v3];
    [(SBSecureAppViewController *)v4 setEntityPresenterDelegate:self];
    [(SBSecureAppViewController *)v4 setHostableEntityContentMode:2];
    id v5 = [(SBCoverSheetPresentationManager *)self coverSheetViewController];
    [(CSCoverSheetExternalViewControllerBase *)v4 setCoverSheetViewController:v5];
  }
  else
  {
    id v5 = (void *)[v13 newApplicationSceneEntityForCurrentSecureApp];
    int v4 = [(SBDashBoardHostedAppViewController *)[SBSecureAppViewController alloc] initWithApplicationSceneEntity:v5];
    [(SBDashBoardHostedAppViewController *)v4 setDelegate:self];
    [(SBDashBoardHostedAppViewController *)v4 setPlaceholderContentEnabled:0];
    if (__sb__runningInSpringBoard())
    {
      [(SBDashBoardHostedAppViewController *)v4 setInterfaceOrientationLocked:SBFEffectiveDeviceClass() != 2];
    }
    else
    {
      int v6 = [MEMORY[0x1E4F42948] currentDevice];
      -[SBDashBoardHostedAppViewController setInterfaceOrientationLocked:](v4, "setInterfaceOrientationLocked:", [v6 userInterfaceIdiom] != 1);
    }
  }

  [(SBCoverSheetPresentationManager *)self setSecureAppViewController:v4];
  uint64_t v7 = [[SBCoverSheetSecureAppEnvironmentViewController alloc] initWithSecureAppViewController:v4];
  [(SBCoverSheetPresentationManager *)self setSecureAppEnvironmentViewController:v7];
  [(SBCoverSheetSecureAppEnvironmentViewController *)self->_secureAppEnvironmentViewController setDelegate:self];
  uint64_t v8 = SBHomeGestureEnabled();
  id v9 = [SBCoverSheetSlidingViewController alloc];
  secureAppEnvironmentViewController = self->_secureAppEnvironmentViewController;
  uint64_t v11 = [(SBCoverSheetSlidingViewController *)self->_coverSheetSlidingViewController dismissGestureRecognizer];
  int v12 = [(SBCoverSheetSlidingViewController *)v9 initWithContentViewController:secureAppEnvironmentViewController canBePulledDown:0 canBePulledUp:v8 dismissalPreemptingGestureRecognizer:v11];

  [(SBCoverSheetSlidingViewController *)v12 setDismissalTransformMode:2];
  [(SBCoverSheetSlidingViewController *)v12 setRoundsCorners:1];
  [(SBCoverSheetSlidingViewController *)v12 setDelegate:self];
  [(SBCoverSheetPresentationManager *)self setSecureAppSlidingViewController:v12];
  self->_pendingClearSecureAppViewControllers = 0;
}

- (void)_updateSecureAppViewControllerVisibilityForAssertionsActive:(BOOL)a3
{
  if (!a3 && self->_pendingClearSecureAppViewControllers) {
    [(SBCoverSheetPresentationManager *)self _clearSecureAppViewControllersIncludingWindow:1];
  }
}

- (void)_clearSecureAppViewControllersIncludingWindow:(BOOL)a3
{
}

- (void)_clearSecureAppViewControllersIncludingWindow:(BOOL)a3 force:(BOOL)a4
{
  BOOL v4 = a3;
  if (a4 || ([(BSCompoundAssertion *)self->_preserveSecureAppAssertions isActive] & 1) == 0)
  {
    uint64_t v7 = SBLogCoverSheet();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "Clearing Secure App View Controllers", v9, 2u);
    }

    [(SBCoverSheetSecureAppEnvironmentViewController *)self->_secureAppEnvironmentViewController relinquishHomeGesture];
    [(SBCoverSheetSecureAppEnvironmentViewController *)self->_secureAppEnvironmentViewController setDelegate:0];
    [(SBCoverSheetSlidingViewController *)self->_secureAppSlidingViewController invalidate];
    [(BSInvalidatable *)self->_secureAppViewController invalidate];
    [(SBCoverSheetPresentationManager *)self setSecureAppViewController:0];
    [(SBCoverSheetPresentationManager *)self setSecureAppEnvironmentViewController:0];
    [(SBCoverSheetPresentationManager *)self setSecureAppSlidingViewController:0];
    if (v4) {
      [(SBCoverSheetPresentationManager *)self setSecureAppWindow:0];
    }
    if (self->_secureAppCleanupHandler)
    {
      uint64_t v8 = (void (**)(void))MEMORY[0x1D948C7A0]();
      [(SBCoverSheetPresentationManager *)self setSecureAppCleanupHandler:0];
      v8[2](v8);
    }
    BOOL v6 = 0;
  }
  else
  {
    BOOL v6 = 1;
  }
  self->_pendingClearSecureAppViewControllers = v6;
}

- (void)_performAfterSecureAppCleanup:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_secureAppWindow)
  {
    id v6 = v4;
    [(SBCoverSheetPresentationManager *)self setSecureAppCleanupHandler:v4];
  }
  else
  {
    if (!v4) {
      goto LABEL_6;
    }
    id v6 = v4;
    (*((void (**)(id))v4 + 2))(v4);
  }
  id v5 = v6;
LABEL_6:
}

- (void)setSecureAppViewController:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = (BSInvalidatable *)a3;
  if (self->_secureAppViewController != v5)
  {
    id v6 = SBLogCoverSheet();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      int v12 = v5;
      _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "Secure app view controller changed to %@", (uint8_t *)&v11, 0xCu);
    }

    uint64_t v7 = [(BSInvalidatable *)self->_secureAppViewController applicationSceneHandle];
    [v7 removeObserver:self];

    [(BSInvalidatable *)self->_secureAppViewController bs_endAppearanceTransition:0];
    [(BSInvalidatable *)self->_secureAppViewController removeFromParentViewController];
    objc_storeStrong((id *)&self->_secureAppViewController, a3);
    uint64_t v8 = [(BSInvalidatable *)self->_secureAppViewController applicationSceneHandle];
    [v8 addObserver:self];

    id v9 = [(id)SBApp backlightEnvironmentSessionProvider];
    [v9 invalidateBacklightScenesForProvider:self];

    uint64_t v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v10 postNotificationName:@"BCoverSheetSecureAppChangedNotification" object:self];
  }
}

- (void)setSecureAppEnvironmentViewController:(id)a3
{
  id v5 = (SBCoverSheetSecureAppEnvironmentViewController *)a3;
  if (self->_secureAppEnvironmentViewController != v5)
  {
    uint64_t v8 = v5;
    id v6 = [(SBCoverSheetPresentationManager *)self coverSheetViewController];
    [v6 removeApplicationHoster:self->_secureAppEnvironmentViewController];

    [(SBCoverSheetSecureAppEnvironmentViewController *)self->_secureAppEnvironmentViewController bs_endAppearanceTransition:0];
    [(SBCoverSheetSecureAppEnvironmentViewController *)self->_secureAppEnvironmentViewController removeFromParentViewController];
    objc_storeStrong((id *)&self->_secureAppEnvironmentViewController, a3);
    uint64_t v7 = [(SBCoverSheetPresentationManager *)self coverSheetViewController];
    [v7 addApplicationHoster:self->_secureAppEnvironmentViewController];

    id v5 = v8;
  }
}

- (void)_noteEffectiveLockStatusMayHaveChangedForUserNotification:(BOOL)a3 canDismiss:(BOOL)a4
{
  id v10 = [(SBCoverSheetPresentationManager *)self secureAppViewController];
  if ([v10 isHostingAnApp])
  {
    BOOL v7 = [(SBCoverSheetPresentationManager *)self _isEffectivelyLocked];

    if (!v7)
    {
      uint64_t v8 = objc_alloc_init(SBLockScreenUnlockRequest);
      [(SBLockScreenUnlockRequest *)v8 setName:@"Unlock UI for authenticated while in secure app"];
      [(SBLockScreenUnlockRequest *)v8 setSource:24];
      [(SBLockScreenUnlockRequest *)v8 setIntent:1];
      id v9 = [(SBCoverSheetPresentationManager *)self uiLockStateProvider];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __104__SBCoverSheetPresentationManager__noteEffectiveLockStatusMayHaveChangedForUserNotification_canDismiss___block_invoke;
      v11[3] = &unk_1E6B01C98;
      v11[4] = self;
      BOOL v12 = a3;
      BOOL v13 = a4;
      [v9 coverSheetPresentationManager:self unlockWithRequest:v8 completion:v11];
    }
  }
  else
  {
  }
}

void __104__SBCoverSheetPresentationManager__noteEffectiveLockStatusMayHaveChangedForUserNotification_canDismiss___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    BOOL v3 = [*(id *)(a1 + 32) secureAppViewController];
    int v4 = [v3 isHostingAnApp];

    if (v4)
    {
      if (*(unsigned char *)(a1 + 40))
      {
        id v5 = [(id)SBApp notificationDispatcher];
        id v6 = [v5 bannerDestination];
        uint64_t v7 = [v6 isPresentingBannerInLongLook];
      }
      else
      {
        uint64_t v7 = 0;
      }
      uint64_t v8 = *(void **)(a1 + 32);
      if (*(unsigned char *)(a1 + 41)) {
        uint64_t v9 = v7 ^ 1;
      }
      else {
        uint64_t v9 = 0;
      }
      [v8 _transitionFromSecureAppToFullAppAndDismiss:v9 preservingBanners:v7];
    }
  }
}

- (void)_transitionFromSecureAppToFullAppAndDismiss:(BOOL)a3 preservingBanners:(BOOL)a4
{
  BOOL v5 = a3;
  uint64_t v7 = [(SBCoverSheetPresentationManager *)self secureAppViewController];
  uint64_t v8 = [v7 hostedAppSceneHandle];

  if (v8)
  {
    uint64_t v9 = [SBDeviceApplicationSceneEntity alloc];
    id v10 = [v8 application];
    int v11 = [(SBDeviceApplicationSceneEntity *)v9 initWithApplicationForMainDisplay:v10];
  }
  else
  {
    int v11 = 0;
  }
  BOOL v12 = +[SBMainWorkspace sharedInstance];
  BOOL v13 = [v12 createRequestForApplicationActivation:v11 options:0];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __97__SBCoverSheetPresentationManager__transitionFromSecureAppToFullAppAndDismiss_preservingBanners___block_invoke;
  v20[3] = &__block_descriptor_33_e70___SBMainWorkspaceTransaction_16__0__SBMainWorkspaceTransitionRequest_8l;
  BOOL v21 = a4;
  [v13 setTransactionProvider:v20];
  uint64_t v14 = [v8 application];
  uint64_t v15 = [v14 bundleIdentifier];
  char v16 = [v15 isEqualToString:@"com.apple.purplebuddy"];

  if (v5 && (v16 & 1) == 0)
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __97__SBCoverSheetPresentationManager__transitionFromSecureAppToFullAppAndDismiss_preservingBanners___block_invoke_2;
    v18[3] = &unk_1E6AF4A98;
    v18[4] = self;
    id v19 = v8;
    id v17 = (id)[v13 addCompletionHandler:v18];
  }
  if (objc_opt_respondsToSelector()) {
    [(BSInvalidatable *)self->_secureAppViewController setIntentToTransitionFromSecureAppToFull:1];
  }
  [v12 executeTransitionRequest:v13];
}

SBCoverSheetToAppsWorkspaceTransaction *__97__SBCoverSheetPresentationManager__transitionFromSecureAppToFullAppAndDismiss_preservingBanners___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = [[SBCoverSheetToAppsWorkspaceTransaction alloc] initWithTransitionRequest:v3];

  [(SBCoverSheetToAppsWorkspaceTransaction *)v4 setPreservesBanners:*(unsigned __int8 *)(a1 + 32)];
  return v4;
}

void __97__SBCoverSheetPresentationManager__transitionFromSecureAppToFullAppAndDismiss_preservingBanners___block_invoke_2(uint64_t a1, int a2)
{
  if (a2)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __97__SBCoverSheetPresentationManager__transitionFromSecureAppToFullAppAndDismiss_preservingBanners___block_invoke_3;
    v3[3] = &unk_1E6AF4AC0;
    id v2 = *(void **)(a1 + 32);
    id v4 = *(id *)(a1 + 40);
    [v2 _performAfterSecureAppCleanup:v3];
  }
}

void __97__SBCoverSheetPresentationManager__transitionFromSecureAppToFullAppAndDismiss_preservingBanners___block_invoke_3(uint64_t a1)
{
  id v2 = [SBDeviceApplicationSceneEntity alloc];
  id v3 = [*(id *)(a1 + 32) application];
  id v6 = [(SBDeviceApplicationSceneEntity *)v2 initWithApplicationForMainDisplay:v3];

  id v4 = [(SBApplicationSceneEntity *)v6 sceneHandle];
  BOOL v5 = v4;
  if (v4) {
    SBWorkspaceSuspendApplicationScene(v4);
  }
}

- (NSSet)components
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  int64_t v4 = [(SBCoverSheetSlidingViewController *)self->_coverSheetSlidingViewController dismissalSlidingMode];
  BOOL v5 = [MEMORY[0x1E4F5E3C0] homeAffordance];
  id v6 = [v5 priority:20];
  uint64_t v7 = [(SBCoverSheetPresentationManager *)self appearanceIdentifier];
  uint64_t v8 = [v6 identifier:v7];

  if (v4 == 2
    || [(SBCoverSheetSlidingViewController *)self->_coverSheetSlidingViewController isTransitioning])
  {
    if (self->_shouldDisplayFakeStatusBar)
    {
      uint64_t v9 = objc_opt_new();
      id v10 = [v9 priority:20];
      int v11 = [v10 fakeStatusBar:1];
      BOOL v12 = [v11 transitionModifiers:2];
      [v3 addObject:v12];
    }
    [v8 setValue:MEMORY[0x1E4F1CC38]];
  }
  if ([(SBCoverSheetPresentationManager *)self hasBeenDismissedSinceKeybagLock]) {
    [v8 setValue:MEMORY[0x1E4F1CC38]];
  }
  [v3 addObject:v8];
  BOOL v13 = [MEMORY[0x1E4F5E3C0] homeAffordance];
  uint64_t v14 = [(SBCoverSheetPresentationManager *)self appearanceIdentifier];
  uint64_t v15 = [v13 identifier:v14];

  char v16 = [(SBCoverSheetPresentationManager *)self coverSheetSlidingViewController];
  id v17 = [v16 systemGesturesDelegate];
  int v18 = [v17 syntheticAppearState];

  unsigned int v19 = [(SBFZStackParticipant *)self->_zStackParticipant ownsHomeGesture] ^ 1;
  if (v18 == 1) {
    uint64_t v20 = 1;
  }
  else {
    uint64_t v20 = v19;
  }
  [v15 setHidden:v20];
  if (v20 == 1) {
    [v15 setPriority:20];
  }
  [v3 addObject:v15];
  if ([(SBCoverSheetPresentationManager *)self hasBeenDismissedSinceKeybagLock])
  {
    BOOL v21 = [MEMORY[0x1E4F5E3C0] footerCallToActionLabel];
    long long v22 = [v21 hidden:1];
    [v3 addObject:v22];
  }
  long long v23 = [MEMORY[0x1E4F5E3C0] statusBarGradient];
  long long v24 = [(SBCoverSheetPresentationManager *)self appearanceIdentifier];
  long long v25 = [v23 identifier:v24];

  long long v26 = +[SBWallpaperController sharedInstance];
  v27 = [v26 _wallpaperViewForVariant:0];

  if ([v27 hasVideo])
  {
    uint64_t v28 = [v27 wallpaperName];
    uint64_t v29 = [v28 length];

    [v25 setHidden:v29 != 0];
    if (v29) {
      [v3 addObject:v25];
    }
  }
  else
  {
    [v25 setHidden:0];
  }
  if ([(SBCoverSheetPresentationManager *)self wallpaperFloatingLayerHidden])
  {
    v30 = objc_opt_new();
    v31 = [v30 identifier:@"SBCoverSheetPresentationManager"];
    v32 = [v31 priority:20];
    uint64_t v33 = [v32 shouldRenderInline:1];

    [v3 addObject:v33];
  }

  return (NSSet *)v3;
}

- (_UILegibilitySettings)legibilitySettings
{
  return 0;
}

- (int64_t)idleWarnMode
{
  return 0;
}

- (int64_t)idleTimerMode
{
  return 0;
}

- (int64_t)idleTimerDuration
{
  if (![(SBCoverSheetPresentationManager *)self hasBeenDismissedSinceKeybagLock]) {
    return 0;
  }
  id v2 = [(id)SBApp authenticationController];
  if ([v2 isAuthenticatedCached]) {
    int64_t v3 = 12;
  }
  else {
    int64_t v3 = 1;
  }

  return v3;
}

- (int64_t)notificationBehavior
{
  return 0;
}

- (unint64_t)restrictedCapabilities
{
  unint64_t v3 = 8 * (self->_secureAppWindow != 0);
  if (([(SBFZStackParticipant *)self->_zStackParticipant ownsHomeGesture] & 1) == 0)
  {
    int64_t v4 = [(SBCoverSheetSecureAppEnvironmentViewController *)self->_secureAppEnvironmentViewController zStackParticipant];
    int v5 = [v4 ownsHomeGesture];

    if (!v5) {
      v3 |= 0x1000uLL;
    }
  }
  if ([(SBCoverSheetSlidingViewController *)self->_coverSheetSlidingViewController _appearState] == 2)return v3; {
  else
  }
    return v3 | 0x40;
}

- (int64_t)proximityDetectionMode
{
  return 0;
}

- (void)coverSheetViewControllerExternalLockProviderStateDidChange:(id)a3
{
  int64_t v4 = objc_msgSend(MEMORY[0x1E4F624E0], "sharedInstance", a3);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __94__SBCoverSheetPresentationManager_coverSheetViewControllerExternalLockProviderStateDidChange___block_invoke;
  v6[3] = &unk_1E6AF4AC0;
  v6[4] = self;
  int v5 = [MEMORY[0x1E4F624D8] eventWithName:@"external lock provider state did change" handler:v6];
  [v4 executeOrAppendEvent:v5];
}

uint64_t __94__SBCoverSheetPresentationManager_coverSheetViewControllerExternalLockProviderStateDidChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _noteEffectiveLockStatusMayHaveChangedForUserNotification:0 canDismiss:0];
}

- (void)coverSheetViewControllerDidAddNewSceneHostEnvironment:(id)a3
{
  unint64_t v3 = (void *)SBApp;
  id v4 = a3;
  id v5 = [v3 backlightEnvironmentSessionProvider];
  [v5 invalidateBacklightSceneHostEnvironmentsForProvider:v4];
}

- (void)coverSheetViewControllerActivityItemsMayHaveChanged:(id)a3
{
  id v3 = [(SBCoverSheetPresentationManager *)self zStackParticipant];
  [v3 setNeedsUpdatePreferencesWithReason:@"coversheet activity items may have changed"];
}

- (void)coverSheetViewControllerDidUpdateAudioCategoriesDisablingVolumeHUD:(id)a3
{
  id v3 = [(SBCoverSheetPresentationManager *)self zStackParticipant];
  [v3 setNeedsUpdatePreferencesWithReason:@"coversheet updated audio categories disabling the Volume HUD"];
}

- (void)coverSheetViewControllerDidObscureWallpaper:(id)a3 obscured:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = +[SBWallpaperController sharedInstance];
  [v5 setWallpaperObscured:v4];
}

- (void)coverSheetViewController:(id)a3 didChangeActiveBehavior:(id)a4
{
  id v4 = [(SBCoverSheetPresentationManager *)self zStackParticipant];
  [v4 setNeedsUpdatePreferencesWithReason:@"coversheet active behavior did change"];
}

- (void)_updateTopButtonsForCoverSheetViewController:(id)a3
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v6 = 0u;
  long long v7 = 0u;
  id v3 = a3;
  id v4 = objc_opt_class();
  id v5 = [v3 _screen];
  [v4 getLeadingTopButtonFrame:&v8 trailingTopButtonFrame:&v6 forScreen:v5];

  objc_msgSend(v3, "updateLeadingTopButtonFrame:trailingTopButtonFrame:", v8, v9, v6, v7);
}

+ (void)getLeadingTopButtonFrame:(CGRect *)a3 trailingTopButtonFrame:(CGRect *)a4 forScreen:(id)a5
{
  id v16 = a5;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    long long v7 = +[SBIconController sharedInstance];
    [v7 getLeadingTopButtonFrame:a3 trailingTopButtonFrame:a4];

    long long v8 = v16;
  }
  else
  {
    [v16 bounds];
    double Width = CGRectGetWidth(v18);
    v19.size.width = 60.0;
    v19.origin.x = 0.0;
    v19.origin.y = 8.0;
    v19.size.height = 24.0;
    double v10 = CGRectGetWidth(v19);
    if (a3)
    {
      __asm { FMOV            V2.2D, #8.0 }
      a3->origin = _Q2;
      a3->size = (CGSize)xmmword_1D8FD17B0;
    }
    long long v8 = v16;
    if (a4)
    {
      a4->origin.x = Width - v10 + -8.0;
      *(_OWORD *)&a4->origin.y = xmmword_1D8FD17C0;
      a4->size.height = 24.0;
    }
  }
}

- (void)pearlMatchingStateProviderStateChangedForMatchFailure:(id)a3
{
  if ([a3 seenMatchResultSinceScreenOn])
  {
    id v4 = [(id)SBApp authenticationController];
    char v5 = [v4 isAuthenticated];

    if ((v5 & 1) == 0)
    {
      if ([(SBCoverSheetSlidingViewController *)self->_coverSheetSlidingViewController isAnyGestureActivelyRecognized])
      {
        id v6 = [(SBCoverSheetSlidingViewController *)self->_coverSheetSlidingViewController activeGestureRecognizer];
        [v6 setEnabled:0];
        [v6 setEnabled:1];
      }
    }
  }
}

- (void)coverSheetSlidingViewController:(id)a3 prepareForPresentationTransitionForUserGesture:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = (SBCoverSheetSlidingViewController *)a3;
  BSDispatchQueueAssertMain();
  if (self->_coverSheetSlidingViewController == v6)
  {
    long long v7 = SBLogCoverSheet();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "cover sheet sliding view controller prepare for presentation transition", buf, 2u);
    }

    [(SBCoverSheetPresentationManager *)self _prepareForPresentationTransitionForUserGesture:v4];
  }
  if (self->_secureAppSlidingViewController == v6)
  {
    long long v8 = SBLogCoverSheet();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long v9 = 0;
      _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "secure app view controller prepare for presentation transition", v9, 2u);
    }
  }
}

- (void)coverSheetSlidingViewControllerCleanupPresentationTransition:(id)a3
{
  BOOL v4 = (SBCoverSheetSlidingViewController *)a3;
  BSDispatchQueueAssertMain();
  if (self->_coverSheetSlidingViewController == v4) {
    [(SBCoverSheetPresentationManager *)self _cleanupPresentationTransition];
  }
  if (self->_secureAppSlidingViewController == v4)
  {
    char v5 = SBLogCoverSheet();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "secure app view controller clean up presentation transition", v6, 2u);
    }
  }
}

- (void)coverSheetSlidingViewControllerPrepareForRubberBandedPresentationTransition:(id)a3
{
  id v4 = a3;
  BSDispatchQueueAssertMain();
  [(SBCoverSheetPresentationManager *)self _prepareForRubberBandPresentationTransitionForSlidingViewController:v4];
}

- (void)coverSheetSlidingViewControllerCleanupRubberBandedPresentationTransition:(id)a3
{
  id v4 = a3;
  BSDispatchQueueAssertMain();
  [(SBCoverSheetPresentationManager *)self _cleanupRubberBandPresentationTransitionForSlidingViewController:v4];

  if (self->_rubberBandCleanupNeeded)
  {
    id v5 = [(SBCoverSheetPresentationManager *)self coverSheetViewController];
    [v5 cleanupRubberBandTransition];
  }
}

- (void)coverSheetSlidingViewController:(id)a3 prepareForDismissalTransitionForReversingTransition:(BOOL)a4 forUserGesture:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  long long v8 = (SBCoverSheetSlidingViewController *)a3;
  BSDispatchQueueAssertMain();
  if (self->_secureAppSlidingViewController == v8)
  {
    long long v9 = SBLogCoverSheet();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long v24 = 0;
      _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "secure app view controller prepare for dismissal transition", v24, 2u);
    }
  }
  double v10 = [(SBCoverSheetPresentationManager *)self coverSheetViewController];
  int v11 = [(id)SBApp authenticationController];
  int v12 = [v11 isAuthenticated];

  BOOL v13 = [(SBCoverSheetPresentationManager *)self pearlMatchingStateProvider];
  uint64_t v14 = v13;
  if (self->_coverSheetSlidingViewController == v8) {
    int v15 = [v13 pearlMatchEnabledAndPossible] ^ 1;
  }
  else {
    int v15 = 1;
  }
  int v16 = [v10 externalLockProvidersRequireUnlock];
  uint64_t v17 = [(SBCoverSheetSlidingViewController *)v8 dismissalSlidingMode];
  if (v12) {
    BOOL v18 = v16 == 0;
  }
  else {
    BOOL v18 = 0;
  }
  if (v18) {
    int v19 = 0;
  }
  else {
    int v19 = v17 == 2 || !v6;
  }
  uint64_t v20 = +[SBSecureAppManager sharedInstance];
  if ([v20 hasSecureApp]) {
    char v21 = 0;
  }
  else {
    char v21 = ![(SBCoverSheetPresentationManager *)self isInSecureApp];
  }

  BOOL v22 = 0;
  if (self->_coverSheetSlidingViewController == v8 && (v21 & 1) == 0) {
    BOOL v22 = [(SBCoverSheetPresentationManager *)self _isEffectivelyLocked];
  }
  if (v5)
  {
    long long v23 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v23 postNotificationName:@"SBBiometricEventTimestampNotificationCoversheetSwipedForDismissal" object:self];
  }
  if (v22)
  {
    [(SBCoverSheetPresentationManager *)self _prepareForTransitionToSecureApp];
  }
  else if (v19)
  {
    if ((v15 | v16)) {
      [(SBCoverSheetPresentationManager *)self _prepareForRubberBandDismissalTransitionForSlidingViewController:v8];
    }
    else {
      [(SBCoverSheetPresentationManager *)self _prepareInterstitialTransitionForSlidingViewController:v8];
    }
  }
  else
  {
    [(SBCoverSheetPresentationManager *)self _prepareForDismissalTransition];
  }
}

- (void)coverSheetSlidingViewControllerUserPresentGestureBegan:(id)a3
{
  id v4 = (SBCoverSheetSlidingViewController *)a3;
  BSDispatchQueueAssertMain();
  if (self->_coverSheetSlidingViewController == v4)
  {
    [(SBCoverSheetPresentationManager *)self setHasBeenDismissedSinceKeybagLock:1];
    [(SBCoverSheetPresentationManager *)self setHasBeenDismissedSinceBoot:1];
  }
  if (self->_secureAppSlidingViewController == v4)
  {
    BOOL v5 = SBLogCoverSheet();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long v7 = 0;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "secure app view controller user present gesture began", v7, 2u);
    }
  }
  BOOL v6 = +[SBControlCenterController sharedInstanceIfExists];
  [v6 dismissAnimated:0];
}

- (void)coverSheetSlidingViewController:(id)a3 committingToEndPresented:(BOOL)a4
{
  BOOL v6 = (SBCoverSheetSlidingViewController *)a3;
  BSDispatchQueueAssertMain();
  coverSheetSlidingViewController = self->_coverSheetSlidingViewController;

  if (coverSheetSlidingViewController == v6)
  {
    if (a4)
    {
      [(SBCoverSheetPresentationManager *)self setWantsHomeGestureOwnership:1];
    }
    else
    {
      [(SBCoverSheetPresentationManager *)self setHasBeenDismissedSinceKeybagLock:1];
      [(SBCoverSheetPresentationManager *)self setHasBeenDismissedSinceBoot:1];
      [(SBCoverSheetPresentationManager *)self setWantsHomeGestureOwnership:0];
      [(SBCoverSheetPresentationManager *)self _invalidateSystemApertureCoverSheetAssertion];
    }
  }
}

- (void)coverSheetSlidingViewControllerCleanupDismissalTransition:(id)a3
{
  id v4 = (SBCoverSheetSlidingViewController *)a3;
  BSDispatchQueueAssertMain();
  if (self->_coverSheetSlidingViewController == v4)
  {
    BOOL v5 = SBLogCoverSheet();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "cover sheet sliding view controller cleanup dismissal transition", buf, 2u);
    }
  }
  if (self->_secureAppSlidingViewController == v4)
  {
    BOOL v6 = SBLogCoverSheet();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v18 = 0;
      _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "secure app view controller cleanup dismissal transition", v18, 2u);
    }
  }
  BOOL v7 = [(SBCoverSheetPresentationManager *)self _isEffectivelyLocked];
  if (self->_coverSheetSlidingViewController == v4
    && (+[SBSecureAppManager sharedInstance],
        long long v8 = objc_claimAutoreleasedReturnValue(),
        int v9 = [v8 hasSecureApp] & v7,
        v8,
        v9 == 1))
  {
    double v10 = SBLogCoverSheet();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v17 = 0;
      _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_DEFAULT, "*** not cleaning up cover sheet dismissal transition because going to secure app ***", v17, 2u);
    }

    int v11 = [(SBCoverSheetPresentationManager *)self coverSheetSlidingViewController];
    [v11 setDismissGesturesEnabled:0];

    int v12 = [(SBCoverSheetPresentationManager *)self coverSheetViewController];
    [v12 setCoverSheetIsVisible:0];

    [(SBCoverSheetPresentationManager *)self _cleanupATransition];
  }
  else
  {
    BOOL v13 = SBLogCoverSheet();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v14)
      {
        *(_WORD *)int v16 = 0;
        _os_log_impl(&dword_1D85BA000, v13, OS_LOG_TYPE_DEFAULT, "*** not cleaning up cover sheet dismissal transition because requires unlock ***", v16, 2u);
      }

      [(SBCoverSheetPresentationManager *)self _setCoverSheetPresented:1 forcePresented:1 animated:1 withCompletion:0];
    }
    else
    {
      if (v14)
      {
        *(_WORD *)int v15 = 0;
        _os_log_impl(&dword_1D85BA000, v13, OS_LOG_TYPE_DEFAULT, "cleaning up cover sheet dismissal transition", v15, 2u);
      }

      [(SBCoverSheetPresentationManager *)self _cleanupDismissalTransition];
    }
  }
}

- (void)coverSheetSlidingViewControllerDidEndTransition:(id)a3
{
  BSDispatchQueueAssertMain();
  [(SBCoverSheetPresentationManager *)self setTransitionType:0];
}

- (void)coverSheetSlidingViewControllerDidPassRubberBandThreshold:(id)a3
{
  self->_rubberBandCleanupNeeded = 0;
}

- (BOOL)hasContentUnderCoverSheetSlidingViewController:(id)a3
{
  id v4 = (SBCoverSheetSlidingViewController *)a3;
  BSDispatchQueueAssertMain();
  coverSheetSlidingViewController = self->_coverSheetSlidingViewController;

  if (coverSheetSlidingViewController != v4) {
    return 0;
  }
  BOOL v7 = +[SBSecureAppManager sharedInstance];
  char v8 = [v7 hasSecureApp];

  return v8;
}

- (void)coverSheetSlidingViewController:(id)a3 animationTickedWithProgress:(double)a4 velocity:(double)a5 coverSheetFrame:(CGRect)a6 gestureActive:(BOOL)a7 forPresentationValue:(BOOL)a8
{
  if (a8)
  {
    double v10 = (SBCoverSheetSlidingViewController *)a3;
    kdebug_trace();
    kdebug_trace();
    coverSheetSlidingViewController = self->_coverSheetSlidingViewController;

    if (coverSheetSlidingViewController == v10)
    {
      unlockProgressQueue = self->_unlockProgressQueue;
      BOOL v13 = [NSNumber numberWithDouble:a4];
      [(SBAtomicObjectQueue *)unlockProgressQueue enqueue:v13];

      BSDispatchMain();
    }
  }
}

void __155__SBCoverSheetPresentationManager_coverSheetSlidingViewController_animationTickedWithProgress_velocity_coverSheetFrame_gestureActive_forPresentationValue___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 392) dequeue];
  objc_msgSend(v2, "bs_CGFloatValue");
  double v4 = v3;

  if (v4 > 0.9)
  {
    double v5 = *(double *)(a1 + 40);
    if (v4 <= 0.8)
    {
      if (v5 <= 0.0) {
        goto LABEL_11;
      }
    }
    else if (v5 <= 0.0)
    {
      if (v5 >= 0.0) {
        goto LABEL_11;
      }
LABEL_8:
      [*(id *)(a1 + 32) _acquireSystemApertureCoverSheetAssertion];
      goto LABEL_11;
    }
    [*(id *)(a1 + 32) _invalidateSystemApertureCoverSheetAssertion];
    goto LABEL_11;
  }
  if (v4 > 0.8 && *(double *)(a1 + 40) < 0.0) {
    goto LABEL_8;
  }
LABEL_11:
  [*(id *)(a1 + 32) _updateShouldDisplayFakeStatusBarInVisibleTransition:v4 < 0.9];
  id v9 = [*(id *)(a1 + 32) transitionSettings];
  double v6 = v4;
  if ([v9 usesFixedWallpaperPresentationProgress])
  {
    [v9 fixedWallpaperPresentationProgress];
    double v6 = v7;
  }
  char v8 = +[SBWallpaperController sharedInstance];
  [v8 updateWallpaperAnimationWithProgress:v6];

  [*(id *)(a1 + 32) setWallpaperFloatingLayerHidden:v4 > 0.2];
}

- (void)_updateShouldDisplayFakeStatusBarInVisibleTransition:(BOOL)a3
{
  BOOL v4 = a3 || self->_secureAppViewController || self->_needsFakeStatusBarUpdate || self->_preparingToDismissCoverSheet;
  if (self->_shouldDisplayFakeStatusBar != v4)
  {
    self->_needsFakeStatusBarUpdate = 0;
    self->_shouldDisplayFakeStatusBar = v4;
    double v5 = (void *)MEMORY[0x1E4F42FF0];
    if (v4)
    {
      double v6 = v10;
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      double v7 = __88__SBCoverSheetPresentationManager__updateShouldDisplayFakeStatusBarInVisibleTransition___block_invoke;
    }
    else
    {
      double v6 = &v8;
      uint64_t v8 = MEMORY[0x1E4F143A8];
      uint64_t v9 = 3221225472;
      double v7 = __88__SBCoverSheetPresentationManager__updateShouldDisplayFakeStatusBarInVisibleTransition___block_invoke_2;
    }
    v6[2] = (uint64_t)v7;
    v6[3] = (uint64_t)&unk_1E6AF4AC0;
    v6[4] = (uint64_t)self;
    objc_msgSend(v5, "performWithoutAnimation:", v8, v9);
    [(SBCoverSheetPresentationManager *)self _tellDashBoardOurAppearanceAndBehaviorChanged];
  }
}

void __88__SBCoverSheetPresentationManager__updateShouldDisplayFakeStatusBarInVisibleTransition___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 88) statusBarTransitionController];
  [v2 updateStatusBarForLockScreenComeback];

  id v5 = [*(id *)(*(void *)(a1 + 32) + 24) _sbWindowScene];
  double v3 = [v5 statusBarManager];
  BOOL v4 = [v3 layoutManager];
  [v4 addActiveLayoutLayer:1];
}

void __88__SBCoverSheetPresentationManager__updateShouldDisplayFakeStatusBarInVisibleTransition___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 88) statusBarTransitionController];
  [v2 updateStatusBarForLockScreenTeardown];

  id v5 = [*(id *)(*(void *)(a1 + 32) + 24) _sbWindowScene];
  double v3 = [v5 statusBarManager];
  BOOL v4 = [v3 layoutManager];
  [v4 removeActiveLayoutLayer:1];
}

- (void)coverSheetSlidingViewController:(id)a3 animateForGestureActive:(BOOL)a4 withProgress:(double)a5 beginBlock:(id)a6 endBlock:(id)a7
{
  BOOL v9 = a4;
  int v11 = (void (**)(void))a6;
  id v12 = a7;
  BOOL v13 = SBLogCoverSheet();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    -[SBCoverSheetPresentationManager coverSheetSlidingViewController:animateForGestureActive:withProgress:beginBlock:endBlock:](v13, a5);
  }

  if (self->_iconAnimator && self->_iconAnimatorCompletionGroup)
  {
    BOOL v15 = a5 > 0.2 && self->_iconAnimatorNeedsAnimating;
    if (v9) {
      BOOL v15 = a5 > 0.560000002;
    }
    if (v15)
    {
      if (v11) {
        v11[2](v11);
      }
      self->_iconAnimatorNeedsAnimating = 0;
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __124__SBCoverSheetPresentationManager_coverSheetSlidingViewController_animateForGestureActive_withProgress_beginBlock_endBlock___block_invoke;
      v16[3] = &unk_1E6AF5300;
      id v17 = v12;
      [(SBCoverSheetPresentationManager *)self _setTransitionProgress:1 animated:v9 gestureActive:v16 coverSheetProgress:1.0 completion:a5];
    }
  }
}

uint64_t __124__SBCoverSheetPresentationManager_coverSheetSlidingViewController_animateForGestureActive_withProgress_beginBlock_endBlock___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (BOOL)coverSheetSlidingViewControllerContentShouldAutoRotateWhenNotVisible:(id)a3
{
  BOOL v4 = [(SBCoverSheetPresentationManager *)self hasBeenDismissedSinceBoot];
  return !v4 | [(SBCoverSheetPresentationManager *)self isPresented];
}

- (BOOL)coverSheetSlidingViewControllerShouldAllowDismissal:(id)a3
{
  if (self->_coverSheetSlidingViewController != a3
    || ![(SBCoverSheetPresentationManager *)self _isEffectivelyLocked])
  {
    return 1;
  }
  secureAppViewController = self->_secureAppViewController;
  return [(BSInvalidatable *)secureAppViewController isHostingAnApp];
}

- (void)coverSheetSlidingViewController:(id)a3 isTransitioning:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = [(SBCoverSheetPresentationManager *)self coverSheetViewController];
  [v5 setPartiallyOnScreen:v4];
}

- (void)coverSheetSlidingViewControllerReachabilityAnimationWillBegin:(id)a3
{
  id v3 = [(SBCoverSheetPresentationManager *)self coverSheetViewController];
  [v3 handleReachabilityAnimationWillBegin];
}

- (void)coverSheetSlidingViewControllerReachabilityAnimationDidEnd:(id)a3
{
  id v3 = [(SBCoverSheetPresentationManager *)self coverSheetViewController];
  [v3 handleReachabilityAnimationDidEnd];
}

- (void)_updateWallpaperOverlay
{
  if (self->_wallpaperFloatingLayerHidden
    || ![(SBCoverSheetSlidingViewController *)self->_coverSheetSlidingViewController isTransitioning])
  {
    [(SBCoverSheetPresentationManager *)self _removeWallpaperOverlay];
  }
  else
  {
    id v3 = [MEMORY[0x1E4F42948] currentDevice];
    uint64_t v4 = [v3 userInterfaceIdiom];

    if (v4 & 0xFFFFFFFFFFFFFFFBLL) == 1 && (_os_feature_enabled_impl())
    {
      id v5 = [MEMORY[0x1E4F42D90] mainScreen];
      [v5 _referenceBounds];
      double v7 = v6;
      double v9 = v8;
      double v11 = v10;
      double v13 = v12;
    }
    else
    {
      id v5 = [(SBCoverSheetPresentationManager *)self coverSheetViewController];
      BOOL v14 = [v5 view];
      [v14 bounds];
      double v7 = v15;
      double v9 = v16;
      double v11 = v17;
      double v13 = v18;
    }
    -[SBCoverSheetPresentationManager _createWallpaperOverlayIfNeededWithCoverSheetFrame:](self, "_createWallpaperOverlayIfNeededWithCoverSheetFrame:", v7, v9, v11, v13);
  }
}

- (void)_createWallpaperOverlayIfNeededWithCoverSheetFrame:(CGRect)a3
{
  if (!self->_wallpaperFloatingLayerView)
  {
    double height = a3.size.height;
    double width = a3.size.width;
    double v6 = [(SBCoverSheetPresentationManager *)self transitionSettings];
    int v7 = [v6 floatingLayerAsWallpaperOverlay];

    if (v7)
    {
      double v8 = +[SBWallpaperController sharedInstance];
      double v9 = (objc_class *)objc_opt_class();
      double v10 = NSStringFromClass(v9);
      double v11 = [v8 createWallpaperFloatingViewForReason:v10 ignoreReplica:1];
      wallpaperFloatingLayerView = self->_wallpaperFloatingLayerView;
      self->_wallpaperFloatingLayerView = v11;

      double v13 = (UIView *)objc_alloc_init(MEMORY[0x1E4F42FF0]);
      wallpaperFloatingLayerViewContainerView = self->_wallpaperFloatingLayerViewContainerView;
      self->_wallpaperFloatingLayerViewContainerView = v13;

      [(UIView *)self->_wallpaperFloatingLayerViewContainerView setClipsToBounds:1];
      [(UIView *)self->_wallpaperFloatingLayerViewContainerView addSubview:self->_wallpaperFloatingLayerView];
      -[UIView setFrame:](self->_wallpaperFloatingLayerViewContainerView, "setFrame:", 0.0, 0.0, width, height);
      -[BSInvalidatable setFrame:](self->_wallpaperFloatingLayerView, "setFrame:", 0.0, 0.0, width, height);
      id v15 = +[SBWallpaperController sharedInstance];
      [v15 addWallpaperOverlay:self->_wallpaperFloatingLayerViewContainerView];
    }
  }
}

- (void)_removeWallpaperOverlay
{
  id v3 = +[SBWallpaperController sharedInstance];
  [v3 removeWallpaperOverlay:self->_wallpaperFloatingLayerViewContainerView];

  [(BSInvalidatable *)self->_wallpaperFloatingLayerView invalidate];
  wallpaperFloatingLayerView = self->_wallpaperFloatingLayerView;
  self->_wallpaperFloatingLayerView = 0;

  wallpaperFloatingLayerViewContainerView = self->_wallpaperFloatingLayerViewContainerView;
  self->_wallpaperFloatingLayerViewContainerView = 0;
}

- (BOOL)hasFirstSwipeShowGrabberOverride
{
  id v2 = +[SBWorkspace mainWorkspace];
  id v3 = [v2 transientOverlayPresentationManager];
  char v4 = [v3 hasActivePresentation];

  return v4;
}

- (unint64_t)screenEdgesDeferringSystemGestures
{
  id v2 = [(UIWindow *)self->_coverSheetWindow _sbWindowScene];
  id v3 = [v2 switcherController];

  char v4 = [v3 layoutStatePrimaryElement];
  id v5 = [v4 workspaceEntity];
  double v6 = [v5 applicationSceneEntity];
  int v7 = [v6 sceneHandle];
  unint64_t v8 = [v7 screenEdgesDeferringSystemGestures];

  return v8;
}

- (void)updateVisibilityForGrabberVisible:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3)
  {
    id v5 = [(SBCoverSheetPresentationManager *)self coverSheetViewController];
    if ((SBTraitsArbiterOrientationActuationEnabledForRole(@"SBTraitsParticipantRoleCoverSheet") & 1) == 0)
    {
      uint64_t v6 = [(id)SBApp activeInterfaceOrientation];
      [v5 setEffectiveInterfaceOrientationOverride:v6];
      [(SBCoverSheetPresentationManager *)self updateInterfaceOrientationToMatchOrientation:v6];
    }
  }
  [(SBCoverSheetPresentationManager *)self _setCoverSheetWindowVisible:v3 forReason:@"SBCoverSheetPresentTongueGrabberVisibleReason"];
}

- (BOOL)secureAppEnvironmentViewControllerShouldEnableIdleWarning:(id)a3 alwaysOnEnabled:(BOOL)a4
{
  if (!a4) {
    return 1;
  }
  char v4 = [a3 hostedAppSceneHandle];
  id v5 = [v4 application];
  uint64_t v6 = [v5 bundleIdentifier];

  int v7 = +[SBSecureAppManager sharedInstance];
  unint64_t v8 = [v7 secureAppAction];
  double v9 = [v7 wakeDestination];
  if (v9) {
    BOOL v10 = v8 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10 || ([v8 isInProcessAction] & 1) != 0 || objc_msgSend(v9, "type") != 1)
  {
    char v13 = 1;
  }
  else
  {
    double v11 = [v9 identifier];
    char v12 = [v11 isEqualToString:v6];

    char v13 = v12 ^ 1;
  }

  return v13;
}

- (void)secureAppOfTypeDidBegin:(unint64_t)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = SBLogCoverSheet();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 134217984;
    unint64_t v14 = a3;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "SecureApp began of type: %lu", (uint8_t *)&v13, 0xCu);
  }

  int v6 = [(SBUILockStateProvider *)self->_uiLockStateProvider isUILocked];
  int v7 = +[SBSecureAppManager sharedInstance];
  int v8 = [v7 hasSecureApp];

  if (v6 && v8)
  {
    if (+[SBBacklightPlatformProvider deviceSupportsAlwaysOn])
    {
      double v9 = [(id)SBApp authenticationController];
      char v10 = [v9 hasPasscodeSet];
    }
    else
    {
      char v10 = 1;
    }
    double v11 = +[SBBacklightController sharedInstanceIfExists];
    uint64_t v12 = [v11 backlightState];

    if ((v10 & 1) != 0 || v12 != 3) {
      [(SBCoverSheetPresentationManager *)self setCoverSheetPresented:0 animated:1 withCompletion:0];
    }
  }
}

- (void)secureAppOfTypeDidEnd:(unint64_t)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = SBLogCoverSheet();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 134217984;
    unint64_t v11 = a3;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "SecureApp ended of type: %lu", (uint8_t *)&v10, 0xCu);
  }

  BOOL v6 = [(SBCoverSheetPresentationManager *)self _secureAppTypeGetsCorrectDismissalSemantics:a3];
  int v7 = +[SBSecureAppManager sharedInstance];
  int v8 = [v7 secureAppAction];
  uint64_t v9 = [v8 secureAppType];

  if (!v6 && [(SBUILockStateProvider *)self->_uiLockStateProvider isUILocked] && !v9) {
    [(SBCoverSheetPresentationManager *)self setCoverSheetPresented:1 animated:1 withCompletion:0];
  }
}

- (void)assistantDidDisappear:(id)a3 windowScene:(id)a4
{
  id v5 = +[SBSecureAppManager sharedInstance];
  BOOL v6 = [v5 secureAppAction];
  uint64_t v7 = [v6 secureAppType];

  if ([(SBUILockStateProvider *)self->_uiLockStateProvider isUILocked]) {
    BOOL v8 = v7 == 9;
  }
  else {
    BOOL v8 = 0;
  }
  if (v8)
  {
    [(SBCoverSheetPresentationManager *)self setCoverSheetPresented:0 animated:1 withCompletion:0];
  }
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  int v13 = (CSLockScreenSettings *)a3;
  id v6 = a4;
  lockScreenSettings = self->_lockScreenSettings;
  if (lockScreenSettings == v13)
  {
    if (([v6 isEqualToString:@"unlockRubberBandFeedbackIntensity"] & 1) != 0
      || [v6 isEqualToString:@"unlockRubberBandFeedbackInterval"])
    {
      unint64_t v11 = [(SBCoverSheetPresentationManager *)self _newRubberBandFeedbackGeneratorForSettings:self->_lockScreenSettings];
      rubberBandFeedbackGenerator = self->_rubberBandFeedbackGenerator;
      self->_rubberBandFeedbackGenerator = v11;
    }
  }
  else
  {
    BOOL v8 = [(CSLockScreenSettings *)lockScreenSettings dashBoardScrollModifierSettings];

    if (v8 == v13)
    {
      if ([v6 isEqualToString:@"strategy"]) {
        [(SBCoverSheetPresentationManager *)self _tellDashBoardOurBehaviorChanged];
      }
    }
    else
    {
      uint64_t v9 = [(CSLockScreenSettings *)self->_lockScreenSettings coverSheetTransitionsSettings];
      int v10 = [v9 flyInSettings];

      if (v10 == v13) {
        [(SBCoverSheetPresentationManager *)self _updateIconsFlyInWithSettings:v13];
      }
    }
  }
}

- (void)_updateIconsFlyInWithSettings:(id)a3
{
  id v4 = a3;
  self->_centerFollowsFinger = [v4 centerFollowsFinger];
  self->_animateIconsOnPresentationToo = [v4 animateIconsOnPresentationToo];
  [v4 iconsFlyInInteractiveResponseMin];
  self->_iconFlyInInteractiveResponseMin = v5;
  [v4 iconsFlyInInteractiveResponseMax];
  self->_iconFlyInInteractiveResponseMax = v6;
  [v4 iconsFlyInInteractiveDampingRatioMin];
  self->_iconFlyInInteractiveDampingRatioMin = v7;
  [v4 iconsFlyInInteractiveDampingRatioMax];
  self->_iconFlyInInteractiveDampingRatioMax = v8;
  [v4 iconsFlyInTension];
  self->_iconFlyInTension = v9;
  [v4 iconsFlyInFriction];
  double v11 = v10;

  self->_iconFlyInFriction = v11;
}

- (void)zStackParticipant:(id)a3 updatePreferences:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([(SBCoverSheetPresentationManager *)self wantsHomeGestureOwnership]) {
    uint64_t v8 = 2;
  }
  else {
    uint64_t v8 = 0;
  }
  [v7 setActivationPolicyForParticipantsBelow:v8];
  if (![(SBCoverSheetPresentationManager *)self wantsHomeGestureOwnership]) {
    goto LABEL_22;
  }
  double v9 = [(SBCoverSheetPresentationManager *)self coverSheetViewController];
  if ([v9 isLockScreenShowingDefaultContent])
  {
  }
  else
  {
    double v10 = +[SBAssistantController sharedInstanceIfExists];
    int v11 = [v10 isVisible];

    if (!v11) {
      goto LABEL_22;
    }
  }
  id v23 = v6;
  uint64_t v12 = [(SBCoverSheetPresentationManager *)self coverSheetViewController];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  int v13 = [v12 sceneHostEnvironmentEntriesForBacklightSession];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    double v16 = 0;
    uint64_t v17 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v25 != v17) {
          objc_enumerationMutation(v13);
        }
        int v19 = [*(id *)(*((void *)&v24 + 1) + 8 * i) bundleIdentifier];
        if (v19)
        {
          if (!v16)
          {
            double v16 = [MEMORY[0x1E4F1CA80] set];
          }
          [v16 addObject:v19];
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v15);
  }
  else
  {
    double v16 = 0;
  }

  [v7 setAssociatedBundleIdentifiersToSuppressInSystemAperture:v16];
  uint64_t v20 = [v12 audioCategoriesDisablingVolumeHUD];
  [v7 setAudioCategoriesDisablingVolumeHUD:v20];

  id v6 = v23;
LABEL_22:
  char v21 = self->_coverSheetWindow;
  if ([(SBCoverSheetPresentationManager *)self wantsHomeGestureOwnership]) {
    BOOL v22 = (unint64_t)([(SBWindow *)v21 interfaceOrientation] - 3) < 2;
  }
  else {
    BOOL v22 = 0;
  }
  [v7 setSuppressSystemApertureForSystemChromeSuppression:v22];
  if ([(SBCoverSheetPresentationManager *)self isPresented]) {
    [v7 setAllowsDimmingWhenForegroundInactive:1];
  }
}

- (id)scenesForBacklightSession
{
  id v2 = [(SBCoverSheetPresentationManager *)self secureAppViewController];
  BOOL v3 = [v2 applicationSceneHandle];
  id v4 = [v3 sceneIfExists];

  if (v4)
  {
    double v5 = [MEMORY[0x1E4F1CAD0] setWithObject:v4];
  }
  else
  {
    double v5 = 0;
  }

  return v5;
}

- (void)sceneHandle:(id)a3 didCreateScene:(id)a4
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__SBCoverSheetPresentationManager_sceneHandle_didCreateScene___block_invoke;
  block[3] = &unk_1E6AF4AC0;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __62__SBCoverSheetPresentationManager_sceneHandle_didCreateScene___block_invoke(uint64_t a1)
{
  id v2 = [(id)SBApp backlightEnvironmentSessionProvider];
  [v2 invalidateBacklightScenesForProvider:*(void *)(a1 + 32)];
}

- (void)sceneHandle:(id)a3 didDestroyScene:(id)a4
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__SBCoverSheetPresentationManager_sceneHandle_didDestroyScene___block_invoke;
  block[3] = &unk_1E6AF4AC0;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __63__SBCoverSheetPresentationManager_sceneHandle_didDestroyScene___block_invoke(uint64_t a1)
{
  id v2 = [(id)SBApp backlightEnvironmentSessionProvider];
  [v2 invalidateBacklightScenesForProvider:*(void *)(a1 + 32)];
}

- (void)hostableEntityPresenter:(id)a3 didBeginHosting:(id)a4
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75__SBCoverSheetPresentationManager_hostableEntityPresenter_didBeginHosting___block_invoke;
  block[3] = &unk_1E6AF4AC0;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __75__SBCoverSheetPresentationManager_hostableEntityPresenter_didBeginHosting___block_invoke(uint64_t a1)
{
  id v2 = [(id)SBApp backlightEnvironmentSessionProvider];
  [v2 invalidateBacklightScenesForProvider:*(void *)(a1 + 32)];
}

- (void)hostableEntityPresenter:(id)a3 didEndHosting:(id)a4
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__SBCoverSheetPresentationManager_hostableEntityPresenter_didEndHosting___block_invoke;
  block[3] = &unk_1E6AF4AC0;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __73__SBCoverSheetPresentationManager_hostableEntityPresenter_didEndHosting___block_invoke(uint64_t a1)
{
  id v2 = [(id)SBApp backlightEnvironmentSessionProvider];
  [v2 invalidateBacklightScenesForProvider:*(void *)(a1 + 32)];
}

- (int64_t)_wallpaperEffectiveInterfaceOrientation
{
  uint64_t v3 = [(id)SBApp activeInterfaceOrientation];
  return [(SBCoverSheetPresentationManager *)self _wallpaperEffectiveInterfaceOrientationWithFallbackOrientation:v3];
}

- (int64_t)_wallpaperEffectiveInterfaceOrientationWithFallbackOrientation:(int64_t)a3
{
  return a3;
}

- (int64_t)interfaceOrientationForWallpaperController:(id)a3
{
  id v4 = [(SBCoverSheetPresentationManager *)self coverSheetWindow];
  int64_t v5 = -[SBCoverSheetPresentationManager _wallpaperEffectiveInterfaceOrientationWithFallbackOrientation:](self, "_wallpaperEffectiveInterfaceOrientationWithFallbackOrientation:", [v4 interfaceOrientation]);

  return v5;
}

- (void)_prepareForPresentationTransitionForUserGesture:(BOOL)a3
{
  BOOL v3 = a3;
  int64_t v5 = SBLogCoverSheet();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_INFO, "_prepareForPresentationTransition", buf, 2u);
  }

  id v6 = [(SBCoverSheetPresentationManager *)self coverSheetViewController];
  [(SBCoverSheetPresentationManager *)self _prepareForATransition];
  int v7 = [(SBCoverSheetSlidingViewController *)self->_coverSheetSlidingViewController _appearState];
  if ((SBTraitsArbiterOrientationActuationEnabledForRole(@"SBTraitsParticipantRoleCoverSheet") & 1) == 0 && !v7)
  {
    uint64_t v8 = [(id)SBApp activeInterfaceOrientation];
    [v6 setEffectiveInterfaceOrientationOverride:v8];
    [(SBCoverSheetPresentationManager *)self updateInterfaceOrientationToMatchOrientation:v8];
  }
  double v9 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v10 = [v9 userInterfaceIdiom];

  if ((v10 & 0xFFFFFFFFFFFFFFFBLL) != 1)
  {
    int v11 = +[SBUIController sharedInstance];
    [v11 setAllowIconRotation:0 forReason:@"SBCoverSheetSuspendIconRotationReason"];
  }
  [(SBCoverSheetPresentationManager *)self setActiveInterfaceOrientationLocked:1];
  uint64_t v12 = +[SBWallpaperController sharedInstance];
  [v12 activateOrientationSource:3];

  int v13 = [(SBCoverSheetPresentationManager *)self coverSheetSlidingViewController];
  objc_msgSend(v13, "bs_beginAppearanceTransition:animated:", 1, 0);

  uint64_t v14 = [(SBCoverSheetPresentationManager *)self coverSheetSlidingViewController];
  [v14 setDismissGesturesEnabled:1];

  uint64_t v15 = [(SBCoverSheetPresentationManager *)self suspendWallpaperAnimationAssertion];
  [v15 invalidate];

  double v16 = +[SBWallpaperController sharedInstance];
  uint64_t v17 = [v16 suspendWallpaperAnimationForReason:@"SBCoverSheetSuspendWallpaperAnimationForTransition"];
  [(SBCoverSheetPresentationManager *)self setSuspendWallpaperAnimationAssertion:v17];

  [(SBCoverSheetPresentationManager *)self setParticipantState:2];
  [(SBCoverSheetPresentationManager *)self _tellDashBoardOurAppearanceAndBehaviorChanged];
  double v18 = [(SBCoverSheetPresentationManager *)self transitionSettings];
  if ([v18 revealWallpaper])
  {
    int v19 = +[SBWallpaperController sharedInstance];
    [v19 setActiveVariant:0];
  }
  if (!v7)
  {
    [(SBCoverSheetPresentationManager *)self _notifyDelegateWillPresent];
    uint64_t v20 = SBLogTelemetrySignposts();
    if (os_signpost_enabled(v20))
    {
      *(_WORD *)long long v26 = 0;
      _os_signpost_emit_with_name_impl(&dword_1D85BA000, v20, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SB_COVERSHEET_TRANSITION", " enableTelemetry=YES  isAnimation=YES ", v26, 2u);
    }

    kdebug_trace();
    char v21 = [(SBCoverSheetPresentationManager *)self ppt_transitionBeginsCallback];
    if (v21)
    {
      [(SBCoverSheetPresentationManager *)self setPpt_transitionBeginsCallback:0];
      v21[2](v21);
    }
  }
  BOOL v22 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v22 postNotificationName:@"SBCoverSheetWillPresentNotification" object:self];

  self->_dismissingCoverSheet = 0;
  [(SBCoverSheetPresentationManager *)self setNeedsFakeStatusBarUpdate:1];
  [(SBCoverSheetPresentationManager *)self _updateWallpaperOverlay];
  if (v3 && [(SBCoverSheetPresentationManager *)self hasBeenDismissedSinceKeybagLock])
  {
    [v6 noteWillPresentForUserGesture];
  }
  else if (self->_shouldDisplayFakeStatusBar)
  {
    id v23 = [(UIWindow *)self->_coverSheetWindow _sbWindowScene];
    long long v24 = [v23 statusBarManager];
    long long v25 = [v24 layoutManager];
    [v25 addActiveLayoutLayer:1];
  }
  [(SBCoverSheetPresentationManager *)self _acquireSystemApertureCoverSheetAssertion];
}

- (void)_invalidateSystemApertureCoverSheetAssertion
{
  [(BSInvalidatable *)self->_systemApertureCoverSheetAssertion invalidate];
  systemApertureCoverSheetAssertion = self->_systemApertureCoverSheetAssertion;
  self->_systemApertureCoverSheetAssertion = 0;
}

- (void)_acquireSystemApertureCoverSheetAssertion
{
  if (!self->_systemApertureCoverSheetAssertion)
  {
    id v5 = [(id)SBApp systemApertureControllerForMainDisplay];
    BOOL v3 = [v5 systemApertureRepresentationSuppressionAssertionForCoversheetVisibility];
    systemApertureCoverSheetAssertion = self->_systemApertureCoverSheetAssertion;
    self->_systemApertureCoverSheetAssertion = v3;
  }
}

- (void)_cleanupPresentationTransition
{
  BOOL v3 = SBLogCoverSheet();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)char v21 = 0;
    _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_INFO, "_cleanupPresentationTransition", v21, 2u);
  }

  uint64_t v4 = 1;
  [(SBCoverSheetPresentationManager *)self _setCoverSheetWindowVisible:1 forReason:@"SBCoverSheetWindowVisibleReasonPresented"];
  [(SBCoverSheetPresentationManager *)self _setSecureAppWindowVisible:0 forReason:@"SBCoverSheetWindowVisibleReasonPresented"];
  [(SBCoverSheetPresentationManager *)self _cleanupATransition];
  if ([(SBCoverSheetPresentationManager *)self hasBeenDismissedSinceKeybagLock])
  {
    id v5 = [(id)SBApp authenticationController];
    uint64_t v4 = [v5 isAuthenticated] ^ 1;
  }
  id v6 = [(SBCoverSheetPresentationManager *)self sceneManager];
  [v6 updateSceneManagerForPresented:1 suspendUnderLockEnvironment:v4];

  int v7 = [(SBCoverSheetPresentationManager *)self coverSheetSlidingViewController];
  objc_msgSend(v7, "bs_endAppearanceTransition:", 1);

  [(SBCoverSheetPresentationManager *)self _notifyDelegateDidPresent];
  uint64_t v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v8 postNotificationName:@"SBCoverSheetDidPresentNotification" object:self];

  [(SBCoverSheetPresentationManager *)self _clearSecureAppViewControllersIncludingWindow:1];
  [MEMORY[0x1E4F42D58] _synchronizeDrawing];
  double v9 = +[SBWallpaperController sharedInstance];
  [v9 setActiveVariant:0];
  uint64_t v10 = +[SBWallpaperController sharedInstance];
  [v10 setWindowLevel:*MEMORY[0x1E4F43CF8] + -15.0];

  self->_shouldDisplayFakeStatusBar = 0;
  [(SBCoverSheetPresentationManager *)self _tellDashBoardOurAppearanceAndBehaviorChanged];
  int v11 = [(SBCoverSheetPresentationManager *)self suspendWallpaperAnimationAssertion];
  [v11 invalidate];

  [(SBCoverSheetPresentationManager *)self setSuspendWallpaperAnimationAssertion:0];
  uint64_t v12 = +[SBAlertItemsController sharedInstance];
  [v12 setForceAlertsToPend:0 forReason:@"SBCoverSheetForceAlertItemsToPendReason"];

  int v13 = [(SBCoverSheetPresentationManager *)self keyboardFocusAssertion];
  if (!v13)
  {
    uint64_t v14 = [(SBCoverSheetPresentationManager *)self mainWorkspace];
    uint64_t v15 = [v14 keyboardFocusController];
    double v16 = [(SBCoverSheetPresentationManager *)self coverSheetWindow];
    uint64_t v17 = [v16 _sbWindowScene];
    double v18 = +[SBKeyboardFocusLockReason coverSheet];
    int v19 = [v15 focusLockSpringBoardWindowScene:v17 forReason:v18];
    [(SBCoverSheetPresentationManager *)self setKeyboardFocusAssertion:v19];
  }
  uint64_t v20 = [(SBCoverSheetPresentationManager *)self coverSheetViewController];
  [v20 setCoverSheetIsVisible:1];
}

- (void)_prepareForARubberBandTransitionForSlidingViewController:(id)a3
{
  uint64_t v4 = (SBCoverSheetSlidingViewController *)a3;
  id v5 = v4;
  if (self->_coverSheetSlidingViewController == v4)
  {
    [(SBCoverSheetPresentationManager *)self _prepareForATransition];
    [(SBCoverSheetPresentationManager *)self _tellDashBoardOurAppearanceAndBehaviorChanged];
    uint64_t v4 = v5;
  }
  [(SBCoverSheetSlidingViewController *)v4 setDismissalSlidingMode:2];
}

- (void)_cleanupARubberBandTransitionForSlidingViewController:(id)a3
{
  uint64_t v4 = (SBCoverSheetSlidingViewController *)a3;
  id v6 = v4;
  if (self->_coverSheetSlidingViewController == v4)
  {
    [(SBCoverSheetPresentationManager *)self _cleanupATransition];
    uint64_t v4 = v6;
  }
  [(SBCoverSheetSlidingViewController *)v4 setDismissalSlidingMode:1];
  id v5 = +[SBAlertItemsController sharedInstance];
  [v5 setForceAlertsToPend:0 forReason:@"SBCoverSheetForceAlertItemsToPendReason"];
}

- (void)_prepareForRubberBandPresentationTransitionForSlidingViewController:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = SBLogCoverSheet();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_INFO, "_prepareForRubberBandPresentationTransitionForSlidingViewController: %@", (uint8_t *)&v6, 0xCu);
  }

  [(SBCoverSheetPresentationManager *)self _prepareForARubberBandTransitionForSlidingViewController:v4];
}

- (void)_cleanupRubberBandPresentationTransitionForSlidingViewController:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = SBLogCoverSheet();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_INFO, "_cleanupRubberBandPresentationTransitionForSlidingViewController: %@", (uint8_t *)&v6, 0xCu);
  }

  [(SBCoverSheetPresentationManager *)self _cleanupARubberBandTransitionForSlidingViewController:v4];
}

- (void)_prepareForRubberBandDismissalTransitionForSlidingViewController:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = SBLogCoverSheet();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_INFO, "_prepareForRubberBandDismissalTransitionForSlidingViewController: %@", (uint8_t *)&v7, 0xCu);
  }

  [(SBCoverSheetPresentationManager *)self _prepareForARubberBandTransitionForSlidingViewController:v4];
  [(UIImpactFeedbackGenerator *)self->_rubberBandFeedbackGenerator prepare];
  self->_rubberBandCleanupNeeded = 1;
  int v6 = [(SBCoverSheetPresentationManager *)self coverSheetViewController];
  [v6 prepareRubberBandTransition];
}

- (void)_cleanupRubberBandDismissalTransitionForSlidingViewController:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = SBLogCoverSheet();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_INFO, "_cleanupRubberBandDismissalTransitionForSlidingViewController: %@", (uint8_t *)&v6, 0xCu);
  }

  [(SBCoverSheetPresentationManager *)self _cleanupARubberBandTransitionForSlidingViewController:v4];
}

- (void)_prepareInterstitialTransitionForSlidingViewController:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = SBLogCoverSheet();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v9 = 138412290;
    id v10 = v4;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_INFO, "_prepareInterstitialTransitionForSlidingViewController: %@", (uint8_t *)&v9, 0xCu);
  }

  int v6 = SBLogTelemetrySignposts();
  if (os_signpost_enabled(v6))
  {
    LOWORD(v9) = 0;
    _os_signpost_emit_with_name_impl(&dword_1D85BA000, v6, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SB_COVERSHEET_INTERSTITIAL_TRANSITION", " enableTelemetry=YES  isAnimation=YES ", (uint8_t *)&v9, 2u);
  }

  kdebug_trace();
  [v4 setDismissalSlidingMode:3];
  id v7 = [(SBCoverSheetPresentationManager *)self pearlMatchingStateProvider];
  [v7 reset];

  uint64_t v8 = [(SBCoverSheetPresentationManager *)self coverSheetViewController];
  [v8 prepareForInterstitialPresentation];
}

- (void)_updateInterstitialTransitionForSlidingViewController:(id)a3 withProgress:(double)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = SBLogCoverSheet();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v9 = 138412546;
    id v10 = v6;
    __int16 v11 = 2048;
    double v12 = a4;
    _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_INFO, "_updateInterstitialTransitionForSlidingViewController: %@ withProgress: %.2f", (uint8_t *)&v9, 0x16u);
  }

  uint64_t v8 = [(SBCoverSheetPresentationManager *)self coverSheetViewController];
  [v8 updateInterstitialPresentationWithProgress:a4];
}

- (void)_cleanupInterstitialTransitionForSlidingViewController:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = SBLogCoverSheet();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v15 = 138412290;
    id v16 = v4;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_INFO, "_cleanupInterstitialTransitionForSlidingViewController: %@", (uint8_t *)&v15, 0xCu);
  }

  [v4 setDismissalSlidingMode:1];
  id v6 = [v4 activeGestureRecognizer];
  uint64_t v7 = [v6 state];
  BOOL v8 = [(SBCoverSheetSlidingViewController *)self->_coverSheetSlidingViewController mathForGestureRecognizerPointsDown:v6];
  BOOL v9 = v7 == 2;
  BOOL v10 = v7 == 2;
  int v11 = v9 || v8;
  uint64_t v12 = v11 ^ 1u;
  uint64_t v13 = [(SBCoverSheetPresentationManager *)self coverSheetViewController];
  [v13 cleanupInterstitialPresentationToPresented:v12 inPlace:v10];

  uint64_t v14 = SBLogTelemetrySignposts();
  if (os_signpost_enabled(v14))
  {
    LOWORD(v15) = 0;
    _os_signpost_emit_with_name_impl(&dword_1D85BA000, v14, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SB_COVERSHEET_INTERSTITIAL_TRANSITION", " enableTelemetry=YES  isAnimation=YES ", (uint8_t *)&v15, 2u);
  }

  kdebug_trace();
}

- (void)_prepareForDismissalTransition
{
  BOOL v3 = SBLogCoverSheet();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_INFO, "_prepareForDismissalTransition", buf, 2u);
  }

  if ([(SBCoverSheetSlidingViewController *)self->_coverSheetSlidingViewController dismissalSlidingMode] == 2)[(SBCoverSheetPresentationManager *)self _cleanupARubberBandTransitionForSlidingViewController:self->_coverSheetSlidingViewController]; {
  if ([(SBCoverSheetSlidingViewController *)self->_coverSheetSlidingViewController dismissalSlidingMode] == 3)[(SBCoverSheetPresentationManager *)self _cleanupInterstitialTransitionForSlidingViewController:self->_coverSheetSlidingViewController];
  }
  int v4 = [(SBCoverSheetSlidingViewController *)self->_coverSheetSlidingViewController _appearState];
  [(SBCoverSheetPresentationManager *)self _prepareForATransition];
  [(SBCoverSheetPresentationManager *)self _setCoverSheetWindowVisible:0 forReason:@"SBCoverSheetWindowVisibleReasonPresented"];
  id v5 = [(SBCoverSheetPresentationManager *)self coverSheetSlidingViewController];
  objc_msgSend(v5, "bs_beginAppearanceTransition:animated:", 0, 0);

  [MEMORY[0x1E4F42D58] _synchronizeDrawing];
  id v6 = [(SBCoverSheetPresentationManager *)self transitionSettings];
  char v7 = [v6 revealWallpaper];

  if ((v7 & 1) == 0)
  {
    BOOL v8 = +[SBWallpaperController sharedInstance];
    [v8 setActiveVariant:1];
  }
  BOOL v9 = [(SBCoverSheetPresentationManager *)self sceneManager];
  [v9 updateSceneManagerForPresented:0 suspendUnderLockEnvironment:0];

  if (v4 == 2)
  {
    [(SBCoverSheetPresentationManager *)self _notifyDelegateWillDismiss];
    BOOL v10 = SBLogTelemetrySignposts();
    if (os_signpost_enabled(v10))
    {
      *(_WORD *)int v19 = 0;
      _os_signpost_emit_with_name_impl(&dword_1D85BA000, v10, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SB_COVERSHEET_TRANSITION", " enableTelemetry=YES  isAnimation=YES ", v19, 2u);
    }

    kdebug_trace();
    int v11 = [(SBCoverSheetPresentationManager *)self ppt_transitionBeginsCallback];
    if (v11)
    {
      [(SBCoverSheetPresentationManager *)self setPpt_transitionBeginsCallback:0];
      v11[2](v11);
    }
  }
  uint64_t v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v12 postNotificationName:@"SBCoverSheetWillDismissNotification" object:self];

  uint64_t v13 = [(SBCoverSheetPresentationManager *)self suspendWallpaperAnimationAssertion];
  [v13 invalidate];

  uint64_t v14 = +[SBWallpaperController sharedInstance];
  int v15 = [v14 suspendWallpaperAnimationForReason:@"SBCoverSheetSuspendWallpaperAnimationForTransition"];
  [(SBCoverSheetPresentationManager *)self setSuspendWallpaperAnimationAssertion:v15];

  self->_preparingToDismissCoverSheet = 1;
  [(SBCoverSheetPresentationManager *)self _updateShouldDisplayFakeStatusBarInVisibleTransition:0];
  [(SBCoverSheetPresentationManager *)self _tellDashBoardOurAppearanceAndBehaviorChanged];
  id v16 = +[SBWallpaperController sharedInstance];
  [v16 setWindowLevel:*MEMORY[0x1E4F43F20] + -3.0];

  *(_WORD *)&self->_preparingToDismissCoverSheet = 256;
  [(SBCoverSheetPresentationManager *)self _updateWallpaperOverlay];
  if (v4 == 2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_transitionSettings);
    if ([WeakRetained iconsFlyIn])
    {
      BOOL v18 = [(SBCoverSheetPresentationManager *)self hasBeenDismissedSinceKeybagLock];

      if (!v18) {
        [(SBCoverSheetPresentationManager *)self _prepareIconAnimatorForPresenting:0];
      }
    }
    else
    {
    }
  }
}

- (void)_cleanupDismissalTransition
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = BSInterfaceOrientationDescription();
  if (a1 == a2) {
    char v7 = &stru_1F3084718;
  }
  else {
    char v7 = @"which is unexpected and doesn't match the active interface orientation! ";
  }
  BOOL v8 = [(id)SBApp orientationAggregator];
  int v9 = 138543874;
  BOOL v10 = v6;
  __int16 v11 = 2114;
  uint64_t v12 = v7;
  __int16 v13 = 2114;
  uint64_t v14 = v8;
  _os_log_error_impl(&dword_1D85BA000, a3, OS_LOG_TYPE_ERROR, "Unlocking to %{public}@, %{public}@%{public}@", (uint8_t *)&v9, 0x20u);
}

- (void)_prepareForTransitionToSecureApp
{
  [(SBCoverSheetPresentationManager *)self _prepareSecureAppWindowForDisplay];
  uint64_t v3 = SBCoverSheetTransitionTypeForCurrentState();
  [(SBCoverSheetPresentationManager *)self setTransitionType:v3];
}

- (void)_prepareForATransition
{
  [(SBCoverSheetPresentationManager *)self _setOrientationUpdatesDeferred:1];
  id v10 = [(SBLockScreenEnvironment *)self->_lockScreenEnvironment idleTimerController];
  if (objc_opt_respondsToSelector()) {
    [v10 addIdleTimerDisabledAssertionReason:@"SBCoverSheetDisableIdleTimerForGestureInProgress"];
  }
  [(SBCoverSheetPresentationManager *)self _setCoverSheetWindowVisible:1 forReason:@"SBCoverSheetWindowVisibleReasonTransition"];
  uint64_t v3 = +[SBAlertItemsController sharedInstance];
  [v3 setForceAlertsToPend:1 forReason:@"SBCoverSheetForceAlertItemsToPendReason"];

  unint64_t transitionOverrideOptions = self->_transitionOverrideOptions;
  if ((transitionOverrideOptions & 2) != 0)
  {
    uint64_t v5 = 5;
  }
  else if (transitionOverrideOptions)
  {
    uint64_t v5 = 9;
  }
  else
  {
    uint64_t v5 = SBCoverSheetTransitionTypeForCurrentState();
  }
  [(SBCoverSheetPresentationManager *)self setTransitionType:v5];
  [(SBCoverSheetPresentationManager *)self _acquireAsynchronousRenderingAssertion];
  id v6 = [(SBCoverSheetPresentationManager *)self requireWallpaperAssertion];
  [v6 invalidate];

  char v7 = +[SBWallpaperController sharedInstance];
  BOOL v8 = [v7 requireWallpaperWithReason:@"CoverSheet"];
  [(SBCoverSheetPresentationManager *)self setRequireWallpaperAssertion:v8];

  int v9 = [(SBCoverSheetPresentationManager *)self sceneManager];
  [v9 updateForegroundScenesForCoverSheetAnimationActive:1];
}

- (void)_cleanupATransition
{
  [(SBCoverSheetPresentationManager *)self _setCoverSheetWindowVisible:0 forReason:@"SBCoverSheetWindowVisibleReasonTransition"];
  [(SBCoverSheetPresentationManager *)self _setOrientationUpdatesDeferred:0];
  uint64_t v3 = [(SBLockScreenEnvironment *)self->_lockScreenEnvironment idleTimerController];
  if (objc_opt_respondsToSelector()) {
    [v3 removeIdleTimerDisabledAssertionReason:@"SBCoverSheetDisableIdleTimerForGestureInProgress"];
  }
  [(SBCoverSheetPresentationManager *)self _relinquishAsynchronousRenderingAssertion];
  int v4 = [(SBCoverSheetPresentationManager *)self requireWallpaperAssertion];
  [v4 invalidate];

  [(SBCoverSheetPresentationManager *)self setRequireWallpaperAssertion:0];
  uint64_t v5 = [(SBCoverSheetPresentationManager *)self sceneManager];
  [v5 updateForegroundScenesForCoverSheetAnimationActive:0];

  [(SBCoverSheetPresentationManager *)self _updateWallpaperOverlay];
  id v6 = SBLogTelemetrySignposts();
  if (os_signpost_enabled(v6))
  {
    *(_WORD *)BOOL v8 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D85BA000, v6, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SB_COVERSHEET_TRANSITION", " enableTelemetry=YES  isAnimation=YES ", v8, 2u);
  }

  kdebug_trace();
  char v7 = [(SBCoverSheetPresentationManager *)self ppt_transitionEndsCallback];
  if (v7)
  {
    [(SBCoverSheetPresentationManager *)self setPpt_transitionEndsCallback:0];
    v7[2](v7);
  }
}

- (void)noteScreenDidTurnOff
{
  [(SBCoverSheetPresentationManager *)self setHasBeenDismissedSinceKeybagLock:0];
  uint64_t v3 = [(SBCoverSheetPresentationManager *)self sceneManager];
  [v3 updateSceneManagerForPresented:1 suspendUnderLockEnvironment:1];

  [(SBCoverSheetPresentationManager *)self _setOrientationUpdatesDeferred:0];
}

- (void)_notifyDelegateWillPresent
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __61__SBCoverSheetPresentationManager__notifyDelegateWillPresent__block_invoke;
  v2[3] = &unk_1E6AF4AC0;
  v2[4] = self;
  [(SBCoverSheetPresentationManager *)self _enqueueBlock:v2 withName:@"willPresent"];
}

void __61__SBCoverSheetPresentationManager__notifyDelegateWillPresent__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) delegate];
  [v1 lockScreenViewControllerWillPresent];
}

- (void)_notifyDelegateDidPresent
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __60__SBCoverSheetPresentationManager__notifyDelegateDidPresent__block_invoke;
  v2[3] = &unk_1E6AF4AC0;
  v2[4] = self;
  [(SBCoverSheetPresentationManager *)self _enqueueBlock:v2 withName:@"didPresent"];
}

void __60__SBCoverSheetPresentationManager__notifyDelegateDidPresent__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) delegate];
  [v1 lockScreenViewControllerDidPresent];
}

- (void)_notifyDelegateWillDismiss
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __61__SBCoverSheetPresentationManager__notifyDelegateWillDismiss__block_invoke;
  v2[3] = &unk_1E6AF4AC0;
  v2[4] = self;
  [(SBCoverSheetPresentationManager *)self _enqueueBlock:v2 withName:@"willDismiss"];
}

void __61__SBCoverSheetPresentationManager__notifyDelegateWillDismiss__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) delegate];
  [v1 lockScreenViewControllerWillDismiss];
}

- (void)_notifyDelegateDidDismiss
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __60__SBCoverSheetPresentationManager__notifyDelegateDidDismiss__block_invoke;
  v2[3] = &unk_1E6AF4AC0;
  v2[4] = self;
  [(SBCoverSheetPresentationManager *)self _enqueueBlock:v2 withName:@"didDismiss"];
}

void __60__SBCoverSheetPresentationManager__notifyDelegateDidDismiss__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) delegate];
  [v1 lockScreenViewControllerDidDismiss];
}

- (void)_notifyDelegateRequestsUnlock
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __64__SBCoverSheetPresentationManager__notifyDelegateRequestsUnlock__block_invoke;
  v2[3] = &unk_1E6AF4AC0;
  v2[4] = self;
  [(SBCoverSheetPresentationManager *)self _enqueueBlock:v2 withName:@"requestsUnlock"];
}

void __64__SBCoverSheetPresentationManager__notifyDelegateRequestsUnlock__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) delegate];
  [v1 lockScreenViewControllerRequestsUnlock];
}

- (void)_enqueueBlock:(id)a3 withName:(id)a4
{
  id v5 = [MEMORY[0x1E4F4F748] eventWithName:a4 handler:a3];
  [(BSEventQueue *)self->_lockUnlockQueue executeOrInsertEvent:v5 atPosition:1];
}

- (void)setWantsHomeGestureOwnership:(BOOL)a3
{
  if (self->_wantsHomeGestureOwnership != a3)
  {
    self->_wantsHomeGestureOwnership = a3;
    if (a3) {
      [(SBCoverSheetPresentationManager *)self _requestHomeGestureOwnership];
    }
    else {
      [(SBCoverSheetPresentationManager *)self _relinquishHomeGestureOwnership];
    }
  }
}

- (void)_requestHomeGestureOwnership
{
  id v2 = [(SBCoverSheetPresentationManager *)self zStackParticipant];
  [v2 setNeedsUpdatePreferencesWithReason:@"requesting home gesture ownership"];
}

- (void)_relinquishHomeGestureOwnership
{
  id v2 = [(SBCoverSheetPresentationManager *)self zStackParticipant];
  [v2 setNeedsUpdatePreferencesWithReason:@"relinquishing home gesture ownership"];
}

- (void)_setOrientationUpdatesDeferred:(BOOL)a3
{
  BOOL v3 = a3;
  if ((SBTraitsArbiterOrientationActuationEnabledForRole(@"SBTraitsParticipantRoleCoverSheet") & 1) == 0)
  {
    deferOrientationUpdatesAssertion = self->_deferOrientationUpdatesAssertion;
    if ((((deferOrientationUpdatesAssertion == 0) ^ v3) & 1) == 0)
    {
      if (v3)
      {
        id v6 = [(id)SBApp deviceOrientationUpdateDeferralAssertionWithReason:@"SBCoverSheetLockOrientationForInteractiveTransition"];
      }
      else
      {
        [(BSInvalidatable *)deferOrientationUpdatesAssertion invalidate];
        id v6 = 0;
      }
      char v7 = self->_deferOrientationUpdatesAssertion;
      self->_deferOrientationUpdatesAssertion = v6;
    }
  }
}

- (void)_setCoverSheetWindowVisible:(BOOL)a3 forReason:(id)a4
{
}

- (void)_setSecureAppWindowVisible:(BOOL)a3 forReason:(id)a4
{
}

- (void)_setCoverSheet:(BOOL)a3 windowVisible:(BOOL)a4 forReason:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  if (v6)
  {
    int v9 = [(SBCoverSheetPresentationManager *)self coverSheetWindow];
    uint64_t v10 = 112;
  }
  else
  {
    int v9 = [(SBCoverSheetPresentationManager *)self secureAppWindow];
    uint64_t v10 = 120;
  }
  id v11 = *(id *)((char *)&self->super.isa + v10);
  uint64_t v12 = v11;
  if (v5)
  {
    uint64_t v13 = [v11 count];
    [v12 addObject:v8];
    if (!v13)
    {
      uint64_t v14 = SBLogCoverSheet();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        uint64_t v15 = @"Secure App";
        if (v6) {
          uint64_t v15 = @"CoverSheet";
        }
        int v18 = 138543362;
        int v19 = v15;
        _os_log_impl(&dword_1D85BA000, v14, OS_LOG_TYPE_INFO, "Making %{public}@ Window visible", (uint8_t *)&v18, 0xCu);
      }

      [v9 makeKeyAndVisible];
    }
  }
  else
  {
    [v11 removeObject:v8];
    if (![v12 count])
    {
      id v16 = SBLogCoverSheet();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        uint64_t v17 = @"Secure App";
        if (v6) {
          uint64_t v17 = @"CoverSheet";
        }
        int v18 = 138543362;
        int v19 = v17;
        _os_log_impl(&dword_1D85BA000, v16, OS_LOG_TYPE_INFO, "Making %{public}@ Window hidden", (uint8_t *)&v18, 0xCu);
      }

      [v9 resignAsKeyWindow];
      [v9 setHidden:1];
    }
  }
}

- (void)_updateVisibilityOfWindow:(id)a3 forReasons:(id)a4
{
  id v5 = a3;
  if ([a4 count]) {
    [v5 makeKeyAndVisible];
  }
  else {
    [v5 setHidden:1];
  }
}

- (void)_prepareCoverSheetWindowForDisplay
{
  id v5 = [(SBCoverSheetPresentationManager *)self coverSheetSlidingViewController];
  BOOL v3 = [v5 contentViewController];

  if (v3)
  {
    int v4 = [(SBCoverSheetPresentationManager *)self coverSheetWindow];
    [v4 setRootViewController:v5];
  }
}

- (void)_prepareSecureAppWindowForDisplay
{
  BOOL v3 = +[SBSecureAppManager sharedInstance];
  int v4 = [v3 hasSecureApp];

  if (v4)
  {
    id v5 = [(SBCoverSheetPresentationManager *)self secureAppSlidingViewController];
    if (v5)
    {
      BOOL v6 = [(SBCoverSheetPresentationManager *)self secureAppWindow];
      [v6 setRootViewController:v5];

      [(SBCoverSheetPresentationManager *)self _setSecureAppWindowVisible:1 forReason:@"SBCoverSheetWindowVisibleReasonPresented"];
      [(SBCoverSheetSecureAppEnvironmentViewController *)self->_secureAppEnvironmentViewController requestHomeGestureOwnership];
    }
  }
  self->_pendingClearSecureAppViewControllers = 0;
}

- (void)_updateProximitySensorState
{
  if ([(SBCoverSheetPresentationManager *)self isPresented])
  {
    BOOL v3 = [(SBLockScreenEnvironment *)self->_lockScreenEnvironment proximityBehaviorProvider];
    uint64_t v4 = [v3 expectsFaceContact];
  }
  else
  {
    uint64_t v4 = 0;
  }
  id v5 = [(id)SBApp proximitySensorManager];
  [v5 client:@"CoverSheet" wantsProximityDetectionEnabled:v4];
}

- (void)_acquireAsynchronousRenderingAssertion
{
  if (!self->_asynchronousRenderingAssertion)
  {
    BOOL v3 = [[SBAsynchronousRenderingAssertion alloc] initWithReason:@"SBCoverSheetAsynchronousRenderingReason"];
    asynchronousRenderingAssertion = self->_asynchronousRenderingAssertion;
    self->_asynchronousRenderingAssertion = v3;
  }
}

- (void)_relinquishAsynchronousRenderingAssertion
{
  [(BSSimpleAssertion *)self->_asynchronousRenderingAssertion invalidate];
  asynchronousRenderingAssertion = self->_asynchronousRenderingAssertion;
  self->_asynchronousRenderingAssertion = 0;
}

- (void)_authenticationChanged:(id)a3
{
  uint64_t v4 = (void *)SBApp;
  id v5 = a3;
  BOOL v6 = [v4 authenticationController];
  int v7 = [v6 isAuthenticatedCached];

  id v8 = [v5 userInfo];

  int v9 = objc_msgSend(v8, "bs_BOOLForKey:", *MEMORY[0x1E4FA6148]);
  if ([(SBCoverSheetSlidingViewController *)self->_coverSheetSlidingViewController dismissalSlidingMode] != 1&& v7&& (v9 & 1) == 0)
  {
    uint64_t v10 = SBLogCoverSheet();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_INFO, "Authentication state changed while in a non-tracking dismissal transition, re-preparing for dismissal.", v12, 2u);
    }

    [(SBCoverSheetPresentationManager *)self coverSheetSlidingViewController:self->_coverSheetSlidingViewController prepareForDismissalTransitionForReversingTransition:0 forUserGesture:0];
  }
  if (((v7 | v9 ^ 1) & 1) == 0)
  {
    [(SBCoverSheetPresentationManager *)self setHasBeenDismissedSinceKeybagLock:0];
    if (![(SBCoverSheetPresentationManager *)self isTransitioning]
      && ([(SBUILockStateProvider *)self->_uiLockStateProvider isLockScreenPresentationPending] & 1) == 0)
    {
      id v11 = [(SBCoverSheetPresentationManager *)self sceneManager];
      [v11 updateSceneManagerForPresented:1 suspendUnderLockEnvironment:1];
    }
  }
}

- (void)_restartStartupTransitionBegan:(id)a3
{
  id v6 = [a3 object];
  uint64_t v4 = [v6 startupTransition];
  uint64_t v5 = [v4 destination];

  if (v5 == 2)
  {
    [(SBCoverSheetPresentationManager *)self setHasBeenDismissedSinceBoot:1];
    [(SBCoverSheetPresentationManager *)self setHasBeenDismissedSinceKeybagLock:1];
  }
}

- (BOOL)_isEffectivelyLocked
{
  BOOL v3 = [(id)SBApp authenticationController];
  if ([v3 isAuthenticated])
  {
    uint64_t v4 = [(SBCoverSheetPresentationManager *)self coverSheetViewController];
    char v5 = [v4 externalLockProvidersRequireUnlock];
  }
  else
  {
    char v5 = 1;
  }

  return v5;
}

- (id)_impactFeedbackGeneratorConfigurationForStyle:(int64_t)a3
{
  switch(a3)
  {
    case 0:
      BOOL v3 = [MEMORY[0x1E4F431B8] lightConfiguration];
      break;
    case 2:
      BOOL v3 = [MEMORY[0x1E4F431B8] strongConfiguration];
      break;
    case 3:
      BOOL v3 = [MEMORY[0x1E4F431B8] softConfiguration];
      break;
    case 4:
      BOOL v3 = [MEMORY[0x1E4F431B8] rigidConfiguration];
      break;
    default:
      BOOL v3 = [MEMORY[0x1E4F431B8] defaultConfiguration];
      break;
  }
  return v3;
}

- (id)_newRubberBandFeedbackGeneratorForSettings:(id)a3
{
  id v4 = a3;
  char v5 = -[SBCoverSheetPresentationManager _impactFeedbackGeneratorConfigurationForStyle:](self, "_impactFeedbackGeneratorConfigurationForStyle:", [v4 unlockRubberBandFeedbackIntensity]);
  id v6 = [v5 feedback];
  int v7 = (void *)[v6 copy];

  if (v7)
  {
    id v8 = [MEMORY[0x1E4F43160] feedbackPattern];
    [v8 addFeedback:v7 atTime:0.0];
    [v4 unlockRubberBandFeedbackInterval];
    objc_msgSend(v8, "addFeedback:atTime:", v7);
    [v5 setFeedback:v8];
  }
  int v9 = (void *)[objc_alloc(MEMORY[0x1E4F42AA8]) initWithConfiguration:v5];

  return v9;
}

- (BOOL)_secureAppTypeGetsCorrectDismissalSemantics:(unint64_t)a3
{
  return (a3 > 0xC) | (0x8C1u >> a3) & 1;
}

- (void)_prepareIconAnimatorForPresenting:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (!SBReduceMotion())
  {
    [(SBCoverSheetPresentationManager *)self _cleanupIconAnimator];
    char v5 = SBLogCoverSheet();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19) = 0;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "Preparing for icon animation", (uint8_t *)&v19, 2u);
    }

    id v6 = +[SBIconController sharedInstance];
    int v7 = [v6 _openFolderController];

    if (v7)
    {
      id v8 = [v6 iconManager];
      [v8 closeFolderAnimated:0 withCompletion:0];
    }
    int v9 = [v6 _currentFolderController];
    uint64_t v10 = [[SBCoverSheetIconFlyInAnimator alloc] initWithFolderController:v9];
    iconAnimator = self->_iconAnimator;
    self->_iconAnimator = v10;

    uint64_t v12 = [MEMORY[0x1E4FA6270] rootSettings];
    uint64_t v13 = [v12 iconAnimationSettings];
    uint64_t v14 = [v13 unlockSettings];
    uint64_t v15 = (void *)[v14 copy];

    [(SBIconAnimator *)self->_iconAnimator setSettings:v15];
    [(SBIconAnimator *)self->_iconAnimator prepare];
    if (v3) {
      double v16 = 1.0;
    }
    else {
      double v16 = 0.0;
    }
    [(SBCoverSheetPresentationManager *)self _animateForProgress:v16];
    [(SBCoverSheetPresentationManager *)self _setTransitionProgress:0 animated:0 gestureActive:0 coverSheetProgress:v16 completion:0.0];
    self->_iconAnimatorNeedsAnimating = 1;
    dispatch_group_t v17 = dispatch_group_create();
    int v18 = SBLogCoverSheet();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 134217984;
      dispatch_group_t v20 = v17;
      _os_log_impl(&dword_1D85BA000, v18, OS_LOG_TYPE_DEFAULT, "Creating completion group for icon animation: %p", (uint8_t *)&v19, 0xCu);
    }

    [(SBCoverSheetPresentationManager *)self setIconAnimatorCompletionGroup:v17];
  }
}

- (void)_animateForProgress:(double)a3
{
}

- (void)_setTransitionProgress:(double)a3 animated:(BOOL)a4 gestureActive:(BOOL)a5 coverSheetProgress:(double)a6 completion:(id)a7
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v11 = a7;
  if (v8)
  {
    double iconFlyInFriction = 0.0;
    double v31 = 0.0;
    if (v7)
    {
      convertDampingRatioAndResponseToTensionAndFriction();
    }
    else
    {
      double iconFlyInTension = self->_iconFlyInTension;
      double iconFlyInFriction = self->_iconFlyInFriction;
      double v31 = iconFlyInTension;
    }
    uint64_t v13 = [(SBCoverSheetPresentationManager *)self iconAnimatorCompletionGroup];
    dispatch_group_enter(v13);
    uint64_t v14 = SBLogCoverSheet();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v33 = v13;
      _os_log_impl(&dword_1D85BA000, v14, OS_LOG_TYPE_DEFAULT, "Entering completion group %p for icon animation", buf, 0xCu);
    }

    uint64_t v15 = [(SBCoverSheetPresentationManager *)self iconAnimatorCompletionBlock];
    BOOL v16 = v15 == 0;

    if (v16)
    {
      objc_initWeak((id *)buf, self);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __111__SBCoverSheetPresentationManager__setTransitionProgress_animated_gestureActive_coverSheetProgress_completion___block_invoke;
      block[3] = &unk_1E6AFC630;
      void block[4] = self;
      objc_copyWeak(&v29, (id *)buf);
      dispatch_block_t v17 = dispatch_block_create((dispatch_block_flags_t)0, block);
      [(SBCoverSheetPresentationManager *)self setIconAnimatorCompletionBlock:v17];

      objc_destroyWeak(&v29);
      objc_destroyWeak((id *)buf);
    }
    int v18 = (void *)MEMORY[0x1E4F42FF0];
    double v20 = iconFlyInFriction;
    double v19 = v31;
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __111__SBCoverSheetPresentationManager__setTransitionProgress_animated_gestureActive_coverSheetProgress_completion___block_invoke_198;
    v26[3] = &unk_1E6AFD2C0;
    v26[4] = self;
    BOOL v27 = v7;
    *(double *)&v26[5] = a3;
    *(double *)&v26[6] = v31;
    *(double *)&v26[7] = iconFlyInFriction;
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __111__SBCoverSheetPresentationManager__setTransitionProgress_animated_gestureActive_coverSheetProgress_completion___block_invoke_3;
    v23[3] = &unk_1E6AFA340;
    long long v24 = v13;
    id v25 = v11;
    uint64_t v21 = v13;
    [v18 _animateUsingSpringWithTension:0 friction:v26 interactive:v23 animations:v19 completion:v20];
  }
  else
  {
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __111__SBCoverSheetPresentationManager__setTransitionProgress_animated_gestureActive_coverSheetProgress_completion___block_invoke_200;
    v22[3] = &unk_1E6AF4A70;
    v22[4] = self;
    *(double *)&v22[5] = a3;
    [MEMORY[0x1E4F42FF0] _performWithoutRetargetingAnimations:v22];
  }
}

void __111__SBCoverSheetPresentationManager__setTransitionProgress_animated_gestureActive_coverSheetProgress_completion___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = SBLogCoverSheet();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 232);
    *(_DWORD *)buf = 134217984;
    uint64_t v8 = v3;
    _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_DEFAULT, "Running completion for icon animation group %p", buf, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setIconAnimatorCompletionGroup:0];
  dispatch_time_t v5 = dispatch_time(0, 300000000);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __111__SBCoverSheetPresentationManager__setTransitionProgress_animated_gestureActive_coverSheetProgress_completion___block_invoke_197;
  v6[3] = &unk_1E6AF5290;
  v6[4] = *(void *)(a1 + 32);
  void v6[5] = WeakRetained;
  dispatch_after(v5, MEMORY[0x1E4F14428], v6);
}

uint64_t __111__SBCoverSheetPresentationManager__setTransitionProgress_animated_gestureActive_coverSheetProgress_completion___block_invoke_197(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = SBLogCoverSheet();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 232);
    int v5 = 134217984;
    uint64_t v6 = v3;
    _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_DEFAULT, "Cleaning up icon animator for icon animation group %p", (uint8_t *)&v5, 0xCu);
  }

  return [*(id *)(a1 + 40) _cleanupIconAnimator];
}

uint64_t __111__SBCoverSheetPresentationManager__setTransitionProgress_animated_gestureActive_coverSheetProgress_completion___block_invoke_198(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1E4F42FF0];
  CAFrameRateRange v8 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __111__SBCoverSheetPresentationManager__setTransitionProgress_animated_gestureActive_coverSheetProgress_completion___block_invoke_2;
  v4[3] = &unk_1E6AFD2C0;
  v4[4] = *(void *)(a1 + 32);
  char v7 = *(unsigned char *)(a1 + 64);
  long long v5 = *(_OWORD *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 56);
  return objc_msgSend(v2, "sb_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1114125, v4, *(double *)&v8.minimum, *(double *)&v8.maximum, *(double *)&v8.preferred);
}

void __111__SBCoverSheetPresentationManager__setTransitionProgress_animated_gestureActive_coverSheetProgress_completion___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _animateForProgress:*(double *)(a1 + 40)];
  if (!*(unsigned char *)(a1 + 64))
  {
    id v2 = +[SBWallpaperController sharedInstance];
    [v2 updateWallpaperAnimationWithIconFlyInTension:*(double *)(a1 + 48) friction:*(double *)(a1 + 56)];
  }
}

uint64_t __111__SBCoverSheetPresentationManager__setTransitionProgress_animated_gestureActive_coverSheetProgress_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  id v2 = SBLogCoverSheet();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 134217984;
    uint64_t v6 = v3;
    _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_DEFAULT, "Leaving completion group %p for icon animation", (uint8_t *)&v5, 0xCu);
  }

  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __111__SBCoverSheetPresentationManager__setTransitionProgress_animated_gestureActive_coverSheetProgress_completion___block_invoke_200(uint64_t a1)
{
  return [*(id *)(a1 + 32) _animateForProgress:*(double *)(a1 + 40)];
}

- (void)setWallpaperFloatingLayerHidden:(BOOL)a3
{
  if (self->_wallpaperFloatingLayerHidden != a3)
  {
    self->_wallpaperFloatingLayerHidden = a3;
    [(SBCoverSheetPresentationManager *)self _tellDashBoardOurAppearanceChanged];
    [(SBCoverSheetPresentationManager *)self _updateWallpaperOverlay];
  }
}

- (void)_cleanupIconAnimator
{
  iconAnimator = self->_iconAnimator;
  if (iconAnimator)
  {
    [(SBIconAnimator *)iconAnimator cleanup];
    id v4 = self->_iconAnimator;
    self->_iconAnimator = 0;
  }
}

- (int64_t)participantState
{
  return self->_participantState;
}

- (void)setParticipantState:(int64_t)a3
{
  self->_participantState = a3;
}

- (int64_t)scrollingStrategy
{
  return self->_scrollingStrategy;
}

- (SBCoverSheetPresentationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBCoverSheetPresentationDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SBUILockStateProvider)uiLockStateProvider
{
  return self->_uiLockStateProvider;
}

- (void)setUILockStateProvider:(id)a3
{
}

- (SBPearlMatchingStateProvider)pearlMatchingStateProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pearlMatchingStateProvider);
  return (SBPearlMatchingStateProvider *)WeakRetained;
}

- (SBLockScreenEnvironment)lockScreenEnvironment
{
  return self->_lockScreenEnvironment;
}

- (BOOL)isCoverSheetHostingUnlockedEnvironmentWindows
{
  return self->_isCoverSheetHostingUnlockedEnvironmentWindows;
}

- (SBMainWorkspace)mainWorkspace
{
  return self->_mainWorkspace;
}

- (void)setMainWorkspace:(id)a3
{
}

- (BOOL)hasBeenDismissedSinceKeybagLock
{
  return self->_hasBeenDismissedSinceKeybagLock;
}

- (BOOL)hasBeenDismissedSinceKeybagLockAndAuthenticated
{
  return self->_hasBeenDismissedSinceKeybagLockAndAuthenticated;
}

- (BOOL)hasBeenDismissedSinceBoot
{
  return self->_hasBeenDismissedSinceBoot;
}

- (void)setHasBeenDismissedSinceBoot:(BOOL)a3
{
  self->_hasBeenDismissedSinceBoot = a3;
}

- (BOOL)activeInterfaceOrientationLocked
{
  return self->_activeInterfaceOrientationLocked;
}

- (NSMutableSet)coverSheetWindowVisibleReasons
{
  return self->_coverSheetWindowVisibleReasons;
}

- (void)setCoverSheetWindowVisibleReasons:(id)a3
{
}

- (NSMutableSet)secureAppWindowVisibleReasons
{
  return self->_secureAppWindowVisibleReasons;
}

- (void)setSecureAppWindowVisibleReasons:(id)a3
{
}

- (SBCoverSheetSecureAppEnvironmentViewController)secureAppEnvironmentViewController
{
  return self->_secureAppEnvironmentViewController;
}

- (id)secureAppCleanupHandler
{
  return self->_secureAppCleanupHandler;
}

- (void)setSecureAppCleanupHandler:(id)a3
{
}

- (void)setSceneManager:(id)a3
{
}

- (BSEventQueue)lockUnlockQueue
{
  return self->_lockUnlockQueue;
}

- (void)setLockUnlockQueue:(id)a3
{
}

- (CSLockScreenSettings)lockScreenSettings
{
  return self->_lockScreenSettings;
}

- (void)setLockScreenSettings:(id)a3
{
}

- (UIImpactFeedbackGenerator)rubberBandFeedbackGenerator
{
  return self->_rubberBandFeedbackGenerator;
}

- (void)setRubberBandFeedbackGenerator:(id)a3
{
}

- (unint64_t)transitionType
{
  return self->_transitionType;
}

- (CSCoverSheetTransitionSettings)transitionSettings
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_transitionSettings);
  return (CSCoverSheetTransitionSettings *)WeakRetained;
}

- (void)setTransitionSettings:(id)a3
{
}

- (unint64_t)transitionOverrideOptions
{
  return self->_transitionOverrideOptions;
}

- (void)setTransitionOverrideOptions:(unint64_t)a3
{
  self->_unint64_t transitionOverrideOptions = a3;
}

- (BOOL)shouldDisplayFakeStatusBar
{
  return self->_shouldDisplayFakeStatusBar;
}

- (void)setShouldDisplayFakeStatusBar:(BOOL)a3
{
  self->_shouldDisplayFakeStatusBar = a3;
}

- (BOOL)needsFakeStatusBarUpdate
{
  return self->_needsFakeStatusBarUpdate;
}

- (void)setNeedsFakeStatusBarUpdate:(BOOL)a3
{
  self->_needsFakeStatusBarUpdate = a3;
}

- (BOOL)rubberBandCleanupNeeded
{
  return self->_rubberBandCleanupNeeded;
}

- (void)setRubberBandCleanupNeeded:(BOOL)a3
{
  self->_rubberBandCleanupNeeded = a3;
}

- (SBAsynchronousRenderingAssertion)asynchronousRenderingAssertion
{
  return self->_asynchronousRenderingAssertion;
}

- (void)setAsynchronousRenderingAssertion:(id)a3
{
}

- (SBDisableActiveInterfaceOrientationChangeAssertion)activeInterfaceOrientationChangeAssertion
{
  return self->_activeInterfaceOrientationChangeAssertion;
}

- (void)setActiveInterfaceOrientationChangeAssertion:(id)a3
{
}

- (BSInvalidatable)deferOrientationUpdatesAssertion
{
  return self->_deferOrientationUpdatesAssertion;
}

- (void)setDeferOrientationUpdatesAssertion:(id)a3
{
}

- (SBCoverSheetIconFlyInAnimator)iconAnimator
{
  return self->_iconAnimator;
}

- (void)setIconAnimator:(id)a3
{
}

- (BOOL)preparingToDismissCoverSheet
{
  return self->_preparingToDismissCoverSheet;
}

- (void)setPreparingToDismissCoverSheet:(BOOL)a3
{
  self->_preparingToDismissCoverSheet = a3;
}

- (BOOL)dismissingCoverSheet
{
  return self->_dismissingCoverSheet;
}

- (void)setDismissingCoverSheet:(BOOL)a3
{
  self->_dismissingCoverSheet = a3;
}

- (OS_dispatch_group)iconAnimatorCompletionGroup
{
  return self->_iconAnimatorCompletionGroup;
}

- (id)iconAnimatorCompletionBlock
{
  return self->_iconAnimatorCompletionBlock;
}

- (BSInvalidatable)systemApertureCoverSheetAssertion
{
  return self->_systemApertureCoverSheetAssertion;
}

- (void)setSystemApertureCoverSheetAssertion:(id)a3
{
}

- (CSCoverSheetFlyInSettings)flyInSettings
{
  return self->_flyInSettings;
}

- (void)setFlyInSettings:(id)a3
{
}

- (BOOL)centerFollowsFinger
{
  return self->_centerFollowsFinger;
}

- (void)setCenterFollowsFinger:(BOOL)a3
{
  self->_centerFollowsFinger = a3;
}

- (BOOL)animateIconsOnPresentationToo
{
  return self->_animateIconsOnPresentationToo;
}

- (void)setAnimateIconsOnPresentationToo:(BOOL)a3
{
  self->_animateIconsOnPresentationToo = a3;
}

- (double)iconFlyInInteractiveResponseMin
{
  return self->_iconFlyInInteractiveResponseMin;
}

- (void)setIconFlyInInteractiveResponseMin:(double)a3
{
  self->_iconFlyInInteractiveResponseMin = a3;
}

- (double)iconFlyInInteractiveResponseMax
{
  return self->_iconFlyInInteractiveResponseMax;
}

- (void)setIconFlyInInteractiveResponseMax:(double)a3
{
  self->_iconFlyInInteractiveResponseMax = a3;
}

- (double)iconFlyInInteractiveDampingRatioMin
{
  return self->_iconFlyInInteractiveDampingRatioMin;
}

- (void)setIconFlyInInteractiveDampingRatioMin:(double)a3
{
  self->_iconFlyInInteractiveDampingRatioMin = a3;
}

- (double)iconFlyInInteractiveDampingRatioMax
{
  return self->_iconFlyInInteractiveDampingRatioMax;
}

- (void)setIconFlyInInteractiveDampingRatioMax:(double)a3
{
  self->_iconFlyInInteractiveDampingRatioMax = a3;
}

- (double)iconFlyInTension
{
  return self->_iconFlyInTension;
}

- (void)setIconFlyInTension:(double)a3
{
  self->_double iconFlyInTension = a3;
}

- (double)iconFlyInFriction
{
  return self->_iconFlyInFriction;
}

- (void)setIconFlyInFriction:(double)a3
{
  self->_double iconFlyInFriction = a3;
}

- (BOOL)iconAnimatorNeedsAnimating
{
  return self->_iconAnimatorNeedsAnimating;
}

- (void)setIconAnimatorNeedsAnimating:(BOOL)a3
{
  self->_iconAnimatorNeedsAnimating = a3;
}

- (BOOL)wantsHomeGestureOwnership
{
  return self->_wantsHomeGestureOwnership;
}

- (SBFZStackParticipant)zStackParticipant
{
  return self->_zStackParticipant;
}

- (void)setZStackParticipant:(id)a3
{
}

- (BSInvalidatable)suspendWallpaperAnimationAssertion
{
  return self->_suspendWallpaperAnimationAssertion;
}

- (void)setSuspendWallpaperAnimationAssertion:(id)a3
{
}

- (BSInvalidatable)requireWallpaperAssertion
{
  return self->_requireWallpaperAssertion;
}

- (void)setRequireWallpaperAssertion:(id)a3
{
}

- (BSInvalidatable)keyboardFocusAssertion
{
  return self->_keyboardFocusAssertion;
}

- (void)setKeyboardFocusAssertion:(id)a3
{
}

- (id)ppt_transitionBeginsCallback
{
  return self->_ppt_transitionBeginsCallback;
}

- (void)setPpt_transitionBeginsCallback:(id)a3
{
}

- (id)ppt_transitionEndsCallback
{
  return self->_ppt_transitionEndsCallback;
}

- (void)setPpt_transitionEndsCallback:(id)a3
{
}

- (UIView)wallpaperFloatingLayerViewContainerView
{
  return self->_wallpaperFloatingLayerViewContainerView;
}

- (void)setWallpaperFloatingLayerViewContainerView:(id)a3
{
}

- (BSInvalidatable)wallpaperFloatingLayerView
{
  return self->_wallpaperFloatingLayerView;
}

- (void)setWallpaperFloatingLayerView:(id)a3
{
}

- (BOOL)wallpaperFloatingLayerHidden
{
  return self->_wallpaperFloatingLayerHidden;
}

- (BSCompoundAssertion)preserveSecureAppAssertions
{
  return self->_preserveSecureAppAssertions;
}

- (void)setPreserveSecureAppAssertions:(id)a3
{
}

- (BOOL)pendingClearSecureAppViewControllers
{
  return self->_pendingClearSecureAppViewControllers;
}

- (void)setPendingClearSecureAppViewControllers:(BOOL)a3
{
  self->_pendingClearSecureAppViewControllers = a3;
}

- (NSHashTable)dismissalObservers
{
  return self->_dismissalObservers;
}

- (void)setDismissalObservers:(id)a3
{
}

- (SBAtomicObjectQueue)unlockProgressQueue
{
  return self->_unlockProgressQueue;
}

- (void)setUnlockProgressQueue:(id)a3
{
}

- (void)setCoverSheetSlidingViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coverSheetSlidingViewController, 0);
  objc_storeStrong((id *)&self->_unlockProgressQueue, 0);
  objc_storeStrong((id *)&self->_dismissalObservers, 0);
  objc_storeStrong((id *)&self->_preserveSecureAppAssertions, 0);
  objc_storeStrong((id *)&self->_wallpaperFloatingLayerView, 0);
  objc_storeStrong((id *)&self->_wallpaperFloatingLayerViewContainerView, 0);
  objc_storeStrong(&self->_ppt_transitionEndsCallback, 0);
  objc_storeStrong(&self->_ppt_transitionBeginsCallback, 0);
  objc_storeStrong((id *)&self->_keyboardFocusAssertion, 0);
  objc_storeStrong((id *)&self->_requireWallpaperAssertion, 0);
  objc_storeStrong((id *)&self->_suspendWallpaperAnimationAssertion, 0);
  objc_storeStrong((id *)&self->_zStackParticipant, 0);
  objc_storeStrong((id *)&self->_flyInSettings, 0);
  objc_storeStrong((id *)&self->_systemApertureCoverSheetAssertion, 0);
  objc_storeStrong(&self->_iconAnimatorCompletionBlock, 0);
  objc_storeStrong((id *)&self->_iconAnimatorCompletionGroup, 0);
  objc_storeStrong((id *)&self->_iconAnimator, 0);
  objc_storeStrong((id *)&self->_deferOrientationUpdatesAssertion, 0);
  objc_storeStrong((id *)&self->_activeInterfaceOrientationChangeAssertion, 0);
  objc_storeStrong((id *)&self->_asynchronousRenderingAssertion, 0);
  objc_destroyWeak((id *)&self->_transitionSettings);
  objc_storeStrong((id *)&self->_rubberBandFeedbackGenerator, 0);
  objc_storeStrong((id *)&self->_lockScreenSettings, 0);
  objc_storeStrong((id *)&self->_lockUnlockQueue, 0);
  objc_storeStrong((id *)&self->_sceneManager, 0);
  objc_storeStrong(&self->_secureAppCleanupHandler, 0);
  objc_storeStrong((id *)&self->_secureAppEnvironmentViewController, 0);
  objc_storeStrong((id *)&self->_secureAppWindowVisibleReasons, 0);
  objc_storeStrong((id *)&self->_coverSheetWindowVisibleReasons, 0);
  objc_storeStrong((id *)&self->_mainWorkspace, 0);
  objc_storeStrong((id *)&self->_secureAppViewController, 0);
  objc_storeStrong((id *)&self->_lockScreenEnvironment, 0);
  objc_destroyWeak((id *)&self->_pearlMatchingStateProvider);
  objc_storeStrong((id *)&self->_uiLockStateProvider, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_secureAppSlidingViewController, 0);
  objc_storeStrong((id *)&self->_secureAppWindow, 0);
  objc_storeStrong((id *)&self->_coverSheetWindow, 0);
}

- (void)coverSheetSlidingViewController:(os_log_t)log animateForGestureActive:(double)a2 withProgress:beginBlock:endBlock:.cold.1(os_log_t log, double a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  double v3 = a2;
  _os_log_debug_impl(&dword_1D85BA000, log, OS_LOG_TYPE_DEBUG, "animateForGestureActive withProgress: %.2f", (uint8_t *)&v2, 0xCu);
}

@end