@interface SBAssistantController
+ (BOOL)isVisible;
+ (BOOL)shouldBreadcrumbLaunchedApplicationWithBundleIdentifier:(id)a3;
+ (BOOL)shouldDismissSiriForGestureTranslation:(CGPoint)a3 velocity:(CGPoint)a4;
+ (SBAssistantController)sharedInstance;
+ (id)_activationSettingsWithPunchoutStyle:(int64_t)a3;
+ (id)defaultActivationSettings;
+ (id)sharedInstanceIfExists;
+ (void)bootstrapServices;
- (BOOL)_isLocationTCCAlert:(id)a3;
- (BOOL)commandeerCaptureDropletPreludeForVisionInvocation:(id)a3 windowScene:(id)a4;
- (BOOL)contentObscuresEmbeddedDisplayScreen;
- (BOOL)isAmbientActive;
- (BOOL)isEnabled;
- (BOOL)isSystemAssistantExperienceAvailable;
- (BOOL)isSystemAssistantExperienceEnabled;
- (BOOL)isSystemAssistantExperienceHomeAffordanceDoubleTapGestureEnabled;
- (BOOL)isSystemAssistantExperiencePersistentSiriEnabled;
- (BOOL)isVisible;
- (BOOL)isVisibleInWindowScene:(id)a3;
- (BOOL)requestPasscodeUnlockWithCompletion:(id)a3;
- (BOOL)shouldDismissSiriForRemoteTransientOverlayFromBundleIdentifier:(id)a3;
- (BOOL)shouldShowSystemVolumeHUDForCategory:(id)a3;
- (BOOL)siriPresentation:(id)a3 requestsDeviceUnlockWithPassword:(id)a4;
- (BOOL)unlockedDevice;
- (SAInvalidatable)systemApertureAssertion;
- (SBAssistantController)init;
- (SBAssistantSession)currentSession;
- (SBIdleTimerCoordinating)_idleTimerCoordinator;
- (id)_currentSessionCreatingIfNeededWithFailureExplanation:(id *)a3;
- (id)_init;
- (id)_uiSceneTracker;
- (id)acquireWindowLevelAssertionWithPriority:(int64_t)a3 windowLevel:(double)a4 windowScene:(id)a5 reason:(id)a6;
- (id)alwaysOnLiveRenderingAssertionRequested;
- (id)rootViewController;
- (id)sessionForWindowScene:(id)a3;
- (id)window;
- (int64_t)idleTimerDuration;
- (int64_t)idleTimerMode;
- (int64_t)idleWarnMode;
- (void)_bioAuthenticated:(id)a3;
- (void)_deviceBlocked:(id)a3;
- (void)_dismissAssistantViewIfNecessaryWithAnimation:(int64_t)a3 factory:(id)a4 dismissalOptions:(id)a5 completion:(id)a6;
- (void)_dismissAssistantViewIfNecessaryWithAnimation:(int64_t)a3 factory:(id)a4 dismissalOptions:(id)a5 windowScene:(id)a6 completion:(id)a7;
- (void)_generativeModelsAvailabilityDidChange;
- (void)_noteDeviceLockedOrBlocked;
- (void)_prototypeSettingsChanged;
- (void)_remoteLocked:(id)a3;
- (void)_setIdleTimerCoordinator:(id)a3;
- (void)_setUnlockedDevice:(BOOL)a3;
- (void)_setVisible:(BOOL)a3;
- (void)_siriPreferencesDidChange;
- (void)_systemApertureFrameDidChange:(id)a3;
- (void)_turnScreenOffWithCompletion:(id)a3;
- (void)_uiLocked:(id)a3;
- (void)_updateSystemAssistantExperienceEnabled;
- (void)_updateSystemAssistantExperienceHomeAffordanceDoubleTapGestureEnabled;
- (void)_updateSystemAssistantExperiencePersistentSiriEnabled;
- (void)_updateWindowLevelForScene:(id)a3;
- (void)addObserver:(id)a3;
- (void)alertItemsController:(id)a3 didActivateAlertItem:(id)a4;
- (void)alertItemsController:(id)a3 didDeactivateAlertItem:(id)a4 forReason:(int)a5;
- (void)applicationProcessDidChangeState:(id)a3;
- (void)assistantSession:(id)a3 didChangePresentationInWindowScene:(id)a4;
- (void)assistantSession:(id)a3 requestsDismissalWithDismissalOptions:(id)a4;
- (void)assistantSession:(id)a3 viewDidAppearInWindowScene:(id)a4;
- (void)assistantSession:(id)a3 viewDidDisappearInWindowScene:(id)a4;
- (void)assistantSession:(id)a3 viewWillAppearInWindowScene:(id)a4;
- (void)assistantSession:(id)a3 viewWillDisappearInWindowScene:(id)a4;
- (void)dealloc;
- (void)deviceUnlockRequestedWithPassword:(id)a3;
- (void)dismissAssistantViewIfNecessaryForGestureTranslation:(CGPoint)a3 velocity:(CGPoint)a4 windowScene:(id)a5;
- (void)dismissAssistantViewIfNecessaryInWindowScene:(id)a3;
- (void)dismissAssistantViewIfNecessaryWithAnimation:(int64_t)a3 windowScene:(id)a4;
- (void)dismissAssistantViewIfNecessaryWithAnimation:(int64_t)a3 windowScene:(id)a4 completion:(id)a5;
- (void)dismissAssistantViewInEverySceneIfNecessary;
- (void)dismissAssistantViewInEverySceneIfNecessaryForGestureTranslation:(CGPoint)a3 velocity:(CGPoint)a4;
- (void)dismissAssistantViewInEverySceneIfNecessaryWithAnimation:(int64_t)a3;
- (void)dismissAssistantViewInEverySceneIfNecessaryWithAnimation:(int64_t)a3 completion:(id)a4;
- (void)dismissAssistantViewInEverySceneIfNecessaryWithAnimation:(int64_t)a3 factory:(id)a4 completion:(id)a5;
- (void)dismissOverlayForDashBoardAnimated:(BOOL)a3;
- (void)invalidateSystemApertureAssertionWithReason:(id)a3;
- (void)removeObserver:(id)a3;
- (void)requestTamaleLaunchAnimationLayerProviderWithCompletion:(id)a3;
- (void)restrictSystemApertureToDefaultLayoutWithReason:(id)a3;
- (void)screenWakeIdleTimerResetRequested;
- (void)screenWakeRequested;
- (void)setCurrentSession:(id)a3;
- (void)setSystemApertureAssertion:(id)a3;
- (void)setSystemAssistantExperienceEnabled:(BOOL)a3;
- (void)setSystemAssistantExperienceHomeAffordanceDoubleTapGestureEnabled:(BOOL)a3;
- (void)setSystemAssistantExperiencePersistentSiriEnabled:(BOOL)a3;
- (void)setUISceneTracker:(id)a3;
- (void)settings:(id)a3 changedValueForKey:(id)a4;
- (void)siriPresentation:(id)a3 acquireElevatedEffectsViewControllerAssertionWithReason:(id)a4 handler:(id)a5;
- (void)siriPresentation:(id)a3 didUpdateAudioCategoriesDisablingVolumeHUD:(id)a4;
- (void)siriPresentation:(id)a3 didUpdateHomeGestureSharing:(BOOL)a4;
- (void)siriPresentation:(id)a3 didUpdateInputType:(int64_t)a4;
- (void)siriPresentation:(id)a3 didUpdatePresentationOptions:(id)a4;
- (void)siriPresentation:(id)a3 didUpdateShouldDismissForSwipesOutsideContent:(BOOL)a4;
- (void)siriPresentation:(id)a3 didUpdateShouldDismissForTapsOutsideContent:(BOOL)a4;
- (void)siriPresentation:(id)a3 didUpdateShouldPassTouchesThroughToSpringBoard:(BOOL)a4;
- (void)siriPresentation:(id)a3 isEnabledDidChange:(BOOL)a4;
- (void)siriPresentation:(id)a3 requestsDismissalOfEffectsViewControllerWithHandler:(id)a4;
- (void)siriPresentation:(id)a3 requestsDismissalWithOptions:(id)a4 withHandler:(id)a5;
- (void)siriPresentation:(id)a3 requestsPresentationOfEffectsViewController:(id)a4 withHandler:(id)a5;
- (void)siriPresentation:(id)a3 requestsPresentationWithOptions:(id)a4 withHandler:(id)a5;
- (void)siriPresentation:(id)a3 requestsPunchout:(id)a4 withHandler:(id)a5;
- (void)siriPresentation:(id)a3 setHomeAffordanceSuppression:(int64_t)a4;
- (void)siriPresentation:(id)a3 setShowsHomeAffordance:(BOOL)a4;
- (void)siriPresentation:(id)a3 willChangeKeyboardVisibility:(BOOL)a4;
- (void)siriPresentation:(id)a3 willStartHostingSceneWithIdentifier:(id)a4 bundleIdentifier:(id)a5;
- (void)siriPresentation:(id)a3 willStopHostingSceneWithIdentifier:(id)a4 bundleIdentifier:(id)a5;
- (void)siriRequestDidReactivateForSiriPresentation:(id)a3;
- (void)windowLevelAssertionManager:(id)a3 didUpdateAssertionsForWindowScene:(id)a4;
@end

@implementation SBAssistantController

+ (SBAssistantController)sharedInstance
{
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    v7 = [NSString stringWithUTF8String:"+[SBAssistantController sharedInstance]"];
    [v6 handleFailureInFunction:v7 file:@"SBAssistantController.m" lineNumber:214 description:@"this call must be made on the main thread"];
  }
  v2 = (void *)__shared;
  if (!__shared)
  {
    kdebug_trace();
    id v3 = [[SBAssistantController alloc] _init];
    v4 = (void *)__shared;
    __shared = (uint64_t)v3;

    kdebug_trace();
    v2 = (void *)__shared;
  }
  return (SBAssistantController *)v2;
}

- (BOOL)isSystemAssistantExperienceHomeAffordanceDoubleTapGestureEnabled
{
  return self->_systemAssistantExperienceHomeAffordanceDoubleTapGestureEnabled;
}

+ (BOOL)isVisible
{
  v2 = +[SBAssistantController sharedInstanceIfExists];
  char v3 = [v2 isVisible];

  return v3;
}

- (BOOL)isVisible
{
  return self->_visible;
}

+ (id)sharedInstanceIfExists
{
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    v4 = [MEMORY[0x1E4F28B00] currentHandler];
    v5 = [NSString stringWithUTF8String:"+[SBAssistantController sharedInstanceIfExists]"];
    [v4 handleFailureInFunction:v5 file:@"SBAssistantController.m" lineNumber:224 description:@"this call must be made on the main thread"];
  }
  v2 = (void *)__shared;
  return v2;
}

- (BOOL)isSystemAssistantExperiencePersistentSiriEnabled
{
  return self->_systemAssistantExperiencePersistentSiriEnabled;
}

- (BOOL)isSystemAssistantExperienceEnabled
{
  return self->_systemAssistantExperienceEnabled;
}

- (id)sessionForWindowScene:(id)a3
{
  currentSession = self->_currentSession;
  id v5 = a3;
  id v6 = [(SBAssistantSession *)currentSession windowScene];

  if (v6 == v5) {
    v7 = self->_currentSession;
  }
  else {
    v7 = 0;
  }
  return v7;
}

- (void)applicationProcessDidChangeState:(id)a3
{
  v4 = [a3 object];
  uint64_t v5 = objc_opt_class();
  id v6 = v4;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      v7 = v6;
    }
    else {
      v7 = 0;
    }
  }
  else
  {
    v7 = 0;
  }
  id v11 = v7;

  v8 = [v11 bundleIdentifier];
  int v9 = [v8 isEqualToString:@"com.apple.ScreenshotServicesService"];

  if (v9)
  {
    v10 = [v11 processState];
    self->_screenShotServicesIsRunning = [v10 taskState] == 2;
  }
}

- (BOOL)isVisibleInWindowScene:(id)a3
{
  id v4 = a3;
  if ([(SBAssistantController *)self isVisible])
  {
    id v5 = [(SBAssistantSession *)self->_currentSession windowScene];
    BOOL v6 = v5 == v4;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (SBAssistantController)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"SBAssistantController.m" lineNumber:159 description:@"-init is not allowed on SBAssistantController"];

  return 0;
}

- (id)_init
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v22.receiver = self;
  v22.super_class = (Class)SBAssistantController;
  v2 = [(SBAssistantController *)&v22 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F4F740]);
    uint64_t v4 = [v3 initWithName:@"Siri" onQueue:MEMORY[0x1E4F14428]];
    operationQueue = v2->_operationQueue;
    v2->_operationQueue = (BSEventQueue *)v4;

    BOOL v6 = objc_alloc_init(SBWindowLevelAssertionManager);
    windowLevelAssertionManager = v2->_windowLevelAssertionManager;
    v2->_windowLevelAssertionManager = v6;

    [(SBWindowLevelAssertionManager *)v2->_windowLevelAssertionManager setDelegate:v2];
    if (MGGetBoolAnswer())
    {
      v8 = (SiriPresentationSpringBoardMainScreenViewController *)objc_alloc_init(MEMORY[0x1E4FA5010]);
      mainScreenSiriPresentation = v2->_mainScreenSiriPresentation;
      v2->_mainScreenSiriPresentation = v8;

      [(SiriPresentationSpringBoardMainScreenViewController *)v2->_mainScreenSiriPresentation setSiriPresentationControllerDelegate:v2];
      v2->_systemAssistantExperienceAvailable = AFHasGMSCapability();
      v10 = [[SBAssistantGestureConfiguration alloc] initWithSiriPresentationViewController:v2->_mainScreenSiriPresentation];
      gestureConfiguration = v2->_gestureConfiguration;
      v2->_gestureConfiguration = v10;

      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)_SBAssistantControllerGenerativeModelsAvailabilityDidChange, @"com.apple.gms.availability.notification", 0, (CFNotificationSuspensionBehavior)0);
      CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)_SBAssistantControllerPreferencesDidChange, (CFStringRef)*MEMORY[0x1E4F4E6B0], 0, (CFNotificationSuspensionBehavior)0);
      [(SBAssistantController *)v2 _generativeModelsAvailabilityDidChange];
    }
    uint64_t v13 = +[SBSystemAnimationDomain rootSettings];
    settings = v2->_settings;
    v2->_settings = (SBSystemAnimationSettings *)v13;

    [(PTSettings *)v2->_settings addKeyObserver:v2];
    [(SBAssistantController *)v2 _prototypeSettingsChanged];
    v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v15 addObserver:v2 selector:sel__systemApertureFrameDidChange_ name:@"SBSystemApertureLayoutDidChangeNotification" object:0];

    v16 = +[SBAlertItemsController sharedInstance];
    [v16 addObserver:v2];

    v17 = SBLogSiri();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v18 = [(SBAssistantController *)v2 isSystemAssistantExperienceEnabled];
      BOOL v19 = [(SBAssistantController *)v2 isSystemAssistantExperienceHomeAffordanceDoubleTapGestureEnabled];
      BOOL v20 = [(SBAssistantController *)v2 isSystemAssistantExperiencePersistentSiriEnabled];
      *(_DWORD *)buf = 67109632;
      BOOL v24 = v18;
      __int16 v25 = 1024;
      BOOL v26 = v19;
      __int16 v27 = 1024;
      BOOL v28 = v20;
      _os_log_impl(&dword_1D85BA000, v17, OS_LOG_TYPE_DEFAULT, "Initializing with isSystemAssistantExperienceEnabled: %{BOOL}u; isSystemAssistantExperienceHomeAffordanceDoubleT"
        "apGestureEnabled: %{BOOL}u; isSystemAssistantExperiencePersistentSiriEnabled: %{BOOL}u",
        buf,
        0x14u);
    }
  }
  return v2;
}

- (void)dealloc
{
  if (MGGetBoolAnswer())
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.gms.availability.notification", 0);
    CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, (CFNotificationName)*MEMORY[0x1E4F4E6B0], 0);
  }
  uint64_t v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self];

  id v5 = +[SBAlertItemsController sharedInstance];
  [v5 removeObserver:self];

  v6.receiver = self;
  v6.super_class = (Class)SBAssistantController;
  [(SBAssistantController *)&v6 dealloc];
}

+ (BOOL)shouldBreadcrumbLaunchedApplicationWithBundleIdentifier:(id)a3
{
  id v3 = objc_msgSend(a1, "sharedInstanceIfExists", a3);
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = [v3 currentSession];
    objc_super v6 = [v5 presentationContext];
    BOOL v7 = [v6 modality] != 3;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

+ (BOOL)shouldDismissSiriForGestureTranslation:(CGPoint)a3 velocity:(CGPoint)a4
{
  return +[SBAssistantGestureManager shouldDismissSiriForGestureTranslation:velocity:](SBAssistantGestureManager, "shouldDismissSiriForGestureTranslation:velocity:", a3.x, a3.y, a4.x, a4.y);
}

+ (id)defaultActivationSettings
{
  return +[SBAssistantController _activationSettingsWithPunchoutStyle:1];
}

- (BOOL)requestPasscodeUnlockWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  currentSession = self->_currentSession;
  if (currentSession)
  {
    mainScreenSiriPresentation = self->_mainScreenSiriPresentation;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __61__SBAssistantController_requestPasscodeUnlockWithCompletion___block_invoke;
    v9[3] = &unk_1E6B04DE8;
    id v10 = v4;
    [(SiriPresentationSpringBoardMainScreenViewController *)mainScreenSiriPresentation requestPasscodeUnlockWithCompletion:v9];
  }
  return currentSession != 0;
}

uint64_t __61__SBAssistantController_requestPasscodeUnlockWithCompletion___block_invoke(uint64_t a1, int a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, a2 == 0);
  }
  return result;
}

- (void)setSystemAssistantExperienceEnabled:(BOOL)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (self->_systemAssistantExperienceEnabled != a3)
  {
    BOOL v3 = a3;
    id v5 = SBLogSiri();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      BOOL v18 = v3;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "Updating isSystemAssistantExperienceEnabled to %{BOOL}u", buf, 8u);
    }

    self->_systemAssistantExperienceEnabled = v3;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    objc_super v6 = (void *)[(NSHashTable *)self->_observers copy];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = *(void **)(*((void *)&v12 + 1) + 8 * v10);
          if (objc_opt_respondsToSelector()) {
            [v11 assistantDidChangeSystemAssistantExperienceEnablement:self];
          }
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }
  }
}

- (void)setSystemAssistantExperienceHomeAffordanceDoubleTapGestureEnabled:(BOOL)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (self->_systemAssistantExperienceHomeAffordanceDoubleTapGestureEnabled != a3)
  {
    BOOL v3 = a3;
    id v5 = SBLogSiri();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      BOOL v18 = v3;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "Updating isSystemAssistantExperienceHomeAffordanceDoubleTapGestureEnabled to %{BOOL}u", buf, 8u);
    }

    self->_systemAssistantExperienceHomeAffordanceDoubleTapGestureEnabled = v3;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    objc_super v6 = (void *)[(NSHashTable *)self->_observers copy];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = *(void **)(*((void *)&v12 + 1) + 8 * v10);
          if (objc_opt_respondsToSelector()) {
            [v11 assistantDidChangeSystemAssistantExperienceHomeAffordanceDoubleTapGestureEnablement:self];
          }
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }
  }
}

- (void)setSystemAssistantExperiencePersistentSiriEnabled:(BOOL)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (self->_systemAssistantExperiencePersistentSiriEnabled != a3)
  {
    self->_systemAssistantExperiencePersistentSiriEnabled = a3;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v4 = (void *)[(NSHashTable *)self->_observers copy];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v11;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
          if (objc_opt_respondsToSelector()) {
            [v9 assistantDidChangeSystemAssistantExperiencePersistentSiriEnablement:self];
          }
          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v6);
    }
  }
}

- (void)dismissAssistantViewInEverySceneIfNecessary
{
}

- (void)dismissAssistantViewInEverySceneIfNecessaryWithAnimation:(int64_t)a3
{
}

- (void)dismissAssistantViewInEverySceneIfNecessaryWithAnimation:(int64_t)a3 completion:(id)a4
{
}

- (void)dismissAssistantViewInEverySceneIfNecessaryWithAnimation:(int64_t)a3 factory:(id)a4 completion:(id)a5
{
}

- (void)dismissAssistantViewInEverySceneIfNecessaryForGestureTranslation:(CGPoint)a3 velocity:(CGPoint)a4
{
  if (objc_msgSend((id)objc_opt_class(), "shouldDismissSiriForGestureTranslation:velocity:", a3.x, a3.y, a4.x, a4.y))
  {
    [(SBAssistantController *)self dismissAssistantViewInEverySceneIfNecessary];
  }
}

- (void)_dismissAssistantViewIfNecessaryWithAnimation:(int64_t)a3 factory:(id)a4 dismissalOptions:(id)a5 completion:(id)a6
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v12 = a5;
  long long v13 = (void (**)(void))a6;
  if (self->_currentSession && !self->_dismissing)
  {
    self->_dismissing = 1;
    BOOL v18 = [MEMORY[0x1E4F4F898] factoryWithDuration:0.0];
    if (a3)
    {
      if (v11)
      {
        uint64_t v19 = (SBAssistantSession *)v11;
      }
      else
      {
        uint64_t v19 = [MEMORY[0x1E4F4F898] factoryWithDuration:*(double *)&kSBAssistantDefaultAnimationDuration];
      }
      BOOL v20 = v19;

      BOOL v18 = v20;
    }
    v21 = SBLogSiri();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v22 = _SBFLoggingMethodProem();
      *(_DWORD *)buf = 138543618;
      BOOL v28 = v22;
      __int16 v29 = 2112;
      v30 = v18;
      _os_log_impl(&dword_1D85BA000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@ - ending the current session with factory: %@", buf, 0x16u);
    }
    currentSession = self->_currentSession;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __107__SBAssistantController__dismissAssistantViewIfNecessaryWithAnimation_factory_dismissalOptions_completion___block_invoke;
    v24[3] = &unk_1E6AF76F8;
    v24[4] = self;
    SEL v26 = a2;
    __int16 v25 = v13;
    [(SBAssistantSession *)currentSession endWithAnimationFactory:v18 siriDismissalOptions:v12 completion:v24];
  }
  else
  {
    long long v14 = SBLogSiri();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = _SBFLoggingMethodProem();
      v16 = self->_currentSession;
      v17 = NSStringFromBOOL();
      *(_DWORD *)buf = 138543874;
      BOOL v28 = v15;
      __int16 v29 = 2112;
      v30 = v16;
      __int16 v31 = 2114;
      v32 = v17;
      _os_log_impl(&dword_1D85BA000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ - asked to dismiss siri but it isn't necessary because currentSession: %@ _dismissing: %{public}@", buf, 0x20u);
    }
    if (v13) {
      v13[2](v13);
    }
  }
}

uint64_t __107__SBAssistantController__dismissAssistantViewIfNecessaryWithAnimation_factory_dismissalOptions_completion___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = SBLogSiri();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v3 = _SBFLoggingMethodProem();
    int v7 = 138543362;
    uint64_t v8 = v3;
    _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ - ended the current session, cleaning up", (uint8_t *)&v7, 0xCu);
  }
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 136);
  *(void *)(v4 + 136) = 0;

  *(unsigned char *)(*(void *)(a1 + 32) + 98) = 0;
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)dismissAssistantViewIfNecessaryInWindowScene:(id)a3
{
}

- (void)dismissAssistantViewIfNecessaryWithAnimation:(int64_t)a3 windowScene:(id)a4
{
}

- (void)dismissAssistantViewIfNecessaryWithAnimation:(int64_t)a3 windowScene:(id)a4 completion:(id)a5
{
}

- (void)dismissAssistantViewIfNecessaryForGestureTranslation:(CGPoint)a3 velocity:(CGPoint)a4 windowScene:(id)a5
{
  double y = a4.y;
  double x = a4.x;
  double v7 = a3.y;
  double v8 = a3.x;
  id v10 = a5;
  if (objc_msgSend((id)objc_opt_class(), "shouldDismissSiriForGestureTranslation:velocity:", v8, v7, x, y))-[SBAssistantController dismissAssistantViewIfNecessaryInWindowScene:](self, "dismissAssistantViewIfNecessaryInWindowScene:", v10); {
}
  }

- (void)_dismissAssistantViewIfNecessaryWithAnimation:(int64_t)a3 factory:(id)a4 dismissalOptions:(id)a5 windowScene:(id)a6 completion:(id)a7
{
  id v17 = a4;
  id v12 = a5;
  id v13 = a7;
  currentSession = self->_currentSession;
  id v15 = a6;
  id v16 = [(SBAssistantSession *)currentSession windowScene];

  if (v16 == v15) {
    [(SBAssistantController *)self _dismissAssistantViewIfNecessaryWithAnimation:a3 factory:v17 dismissalOptions:v12 completion:v13];
  }
}

- (BOOL)commandeerCaptureDropletPreludeForVisionInvocation:(id)a3 windowScene:(id)a4
{
  id v6 = a3;
  currentSession = self->_currentSession;
  id v8 = a4;
  id v9 = [(SBAssistantSession *)currentSession windowScene];

  BOOL v10 = v9 == v8
     && [(SBAssistantSession *)self->_currentSession commandeerCaptureDropletPreludeForVisionInvocation:v6];

  return v10;
}

- (BOOL)shouldShowSystemVolumeHUDForCategory:(id)a3
{
  id v4 = a3;
  audioCategoriesDisablingVolumeHUD = self->_audioCategoriesDisablingVolumeHUD;
  if (audioCategoriesDisablingVolumeHUD)
  {
    if ([(NSSet *)audioCategoriesDisablingVolumeHUD count]) {
      BOOL v6 = ![(NSSet *)self->_audioCategoriesDisablingVolumeHUD containsObject:v4];
    }
    else {
      LOBYTE(v6) = 0;
    }
  }
  else
  {
    LOBYTE(v6) = 1;
  }

  return v6;
}

- (id)window
{
  return [(SBAssistantSession *)self->_currentSession window];
}

- (id)rootViewController
{
  return [(SBAssistantSession *)self->_currentSession assistantRootViewController];
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v9 = v4;
    BOOL v5 = [(NSHashTable *)self->_observers containsObject:v4];
    id v4 = v9;
    if (!v5)
    {
      observers = self->_observers;
      if (!observers)
      {
        double v7 = [MEMORY[0x1E4F28D30] hashTableWithOptions:517];
        id v8 = self->_observers;
        self->_observers = v7;

        observers = self->_observers;
      }
      [(NSHashTable *)observers addObject:v9];
      id v4 = v9;
    }
  }
}

- (void)removeObserver:(id)a3
{
  if (a3) {
    -[NSHashTable removeObject:](self->_observers, "removeObject:");
  }
}

- (BOOL)contentObscuresEmbeddedDisplayScreen
{
  BOOL v3 = [(SBAssistantSession *)self->_currentSession windowScene];
  int v4 = [v3 isMainDisplayWindowScene];

  if (!v4) {
    return 0;
  }
  currentSession = self->_currentSession;
  return [(SBAssistantSession *)currentSession contentObscuresScreen];
}

- (BOOL)shouldDismissSiriForRemoteTransientOverlayFromBundleIdentifier:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector()) {
    char v5 = [(SiriPresentationSpringBoardMainScreenViewController *)self->_mainScreenSiriPresentation shouldDismissForTransientOverlayForBundleIdentifier:v4];
  }
  else {
    char v5 = 1;
  }

  return v5;
}

+ (void)bootstrapServices
{
  if (bootstrapServices_onceToken != -1) {
    dispatch_once(&bootstrapServices_onceToken, &__block_literal_global_209);
  }
}

void __42__SBAssistantController_bootstrapServices__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F9F920] listener];
  v1 = (void *)bootstrapServices___presentationService;
  bootstrapServices___presentationService = v0;

  uint64_t v2 = [MEMORY[0x1E4F9F928] listener];
  BOOL v3 = (void *)bootstrapServices___signalService;
  bootstrapServices___signalService = v2;
}

- (BOOL)isEnabled
{
  return [(SiriPresentationSpringBoardMainScreenViewController *)self->_mainScreenSiriPresentation isEnabled];
}

+ (id)_activationSettingsWithPunchoutStyle:(int64_t)a3
{
  id v4 = objc_alloc_init(SBActivationSettings);
  char v5 = v4;
  if (a3 == 2)
  {
    uint64_t v6 = 0;
  }
  else
  {
    if (a3 != 1) {
      goto LABEL_6;
    }
    uint64_t v6 = 1;
  }
  [(SBActivationSettings *)v4 setFlag:v6 forActivationSetting:44];
LABEL_6:
  return v5;
}

- (void)setUISceneTracker:(id)a3
{
  char v5 = (SBWindowSceneTracking *)a3;
  uiSceneTracker = self->_uiSceneTracker;
  p_uiSceneTracker = &self->_uiSceneTracker;
  if (uiSceneTracker != v5)
  {
    id v8 = v5;
    objc_storeStrong((id *)p_uiSceneTracker, a3);
    char v5 = v8;
  }
}

- (id)_uiSceneTracker
{
  if (self->_uiSceneTracker) {
    return self->_uiSceneTracker;
  }
  else {
    return (id)SBApp;
  }
}

- (void)_setUnlockedDevice:(BOOL)a3
{
  disableAssertion = self->_disableAssertion;
  if (a3)
  {
    if (!disableAssertion)
    {
      uint64_t v6 = [NSString stringWithFormat:@"Siri unlock SBAssistantController"];
      double v7 = [(id)SBApp authenticationController];
      id v8 = [v7 createKeybagUnlockAssertionWithReason:v6];
      id v9 = self->_disableAssertion;
      self->_disableAssertion = v8;

      [(SBFAuthenticationAssertion *)self->_disableAssertion activate];
LABEL_6:
    }
  }
  else if (disableAssertion)
  {
    [(SBFAuthenticationAssertion *)disableAssertion invalidate];
    uint64_t v6 = self->_disableAssertion;
    self->_disableAssertion = 0;
    goto LABEL_6;
  }
  self->_unlockedDevice = a3;
}

- (void)_setVisible:(BOOL)a3
{
  if (self->_visible != a3)
  {
    self->_visible = a3;
    id v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    if (self->_visible)
    {
      [v11 addObserver:self selector:sel__uiLocked_ name:*MEMORY[0x1E4FA7A38] object:0];
      [v11 addObserver:self selector:sel__deviceBlocked_ name:*MEMORY[0x1E4FA60F0] object:0];
      [v11 addObserver:self selector:sel__remoteLocked_ name:*MEMORY[0x1E4FA7A40] object:0];
      [v11 addObserver:self selector:sel__uiLocked_ name:@"SBLockScreenUIRelockedNotification" object:0];
      [v11 addObserver:self selector:sel__uiLocked_ name:@"SBLockScreenUIDidLockNotification" object:0];
      id v4 = [(SBAssistantController *)self _idleTimerCoordinator];
      char v5 = [(SBAssistantController *)self _idleTimerBehavior];
      uint64_t v6 = [v4 idleTimerProvider:self didProposeBehavior:v5 forReason:@"SBAssistantControllerVisible"];
      idleTimer = self->_idleTimer;
      self->_idleTimer = v6;
    }
    else
    {
      [v11 removeObserver:self name:*MEMORY[0x1E4FA7A38] object:0];
      [v11 removeObserver:self name:*MEMORY[0x1E4FA60F0] object:0];
      [v11 removeObserver:self name:*MEMORY[0x1E4FA7A40] object:0];
      [v11 removeObserver:self name:@"SBLockScreenUIRelockedNotification" object:0];
      self->_dismissing = 0;
    }
    [v11 postNotificationName:@"SBAssistantVisibilityDidChangeNotification" object:0];
    id v8 = +[SBKeyboardFocusCoordinator sharedInstance];
    id v9 = [(SBAssistantSession *)self->_currentSession windowScene];
    BOOL v10 = +[SBKeyboardFocusArbitrationReason assistantControllerVisibility];
    [v8 requestArbitrationForSBWindowScene:v9 forReason:v10];
  }
}

- (void)_noteDeviceLockedOrBlocked
{
  if (self->_visible)
  {
    BOOL v3 = SBLogSiri();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)char v5 = 0;
      _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "Dismissing assistant if necessary due to device lock or block", v5, 2u);
    }
  }
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F9F958]) initWithDeactivationOptions:0 animated:0 dismissalReason:4];
  [(SBAssistantController *)self _dismissAssistantViewIfNecessaryWithAnimation:0 factory:0 dismissalOptions:v4 completion:0];
}

- (void)_bioAuthenticated:(id)a3
{
  [(SBAssistantController *)self deviceUnlockRequestedWithPassword:0];
  [(SBAssistantController *)self _setUnlockedDevice:1];
}

- (void)_uiLocked:(id)a3
{
  id v4 = +[SBLockScreenManager sharedInstance];
  int v5 = [v4 isUILocked];

  if (v5)
  {
    [(SBAssistantController *)self _noteDeviceLockedOrBlocked];
  }
}

- (BOOL)isAmbientActive
{
  uint64_t v2 = [(id)SBApp windowSceneManager];
  BOOL v3 = [v2 activeDisplayWindowScene];
  id v4 = [v3 ambientPresentationController];

  LOBYTE(v2) = [v4 isPresented];
  return (char)v2;
}

- (void)_deviceBlocked:(id)a3
{
  id v4 = objc_msgSend((id)SBApp, "lockOutController", a3);
  int v5 = [v4 isBlocked];

  if (v5)
  {
    [(SBAssistantController *)self _noteDeviceLockedOrBlocked];
  }
}

- (void)_remoteLocked:(id)a3
{
  id v4 = [a3 userInfo];
  int v5 = [v4 objectForKey:*MEMORY[0x1E4FA7B20]];
  int v6 = [v5 BOOLValue];

  if (v6)
  {
    [(SBAssistantController *)self _noteDeviceLockedOrBlocked];
  }
}

- (void)_updateWindowLevelForScene:(id)a3
{
  id v9 = a3;
  id v4 = [(SBAssistantSession *)self->_currentSession windowScene];

  if (v4 == v9)
  {
    int v5 = -[SBWindowLevelAssertionManager highestPriorityWindowLevelAssertionForWindowScene:](self->_windowLevelAssertionManager, "highestPriorityWindowLevelAssertionForWindowScene:");
    int v6 = v5;
    currentSession = self->_currentSession;
    if (v5) {
      [v5 windowLevel];
    }
    else {
      double v8 = *MEMORY[0x1E4F43CF8] + 25.0;
    }
    [(SBAssistantSession *)currentSession assertWindowLevel:v8];
  }
  MEMORY[0x1F4181820]();
}

- (void)_turnScreenOffWithCompletion:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  BSDispatchMain();
}

void __54__SBAssistantController__turnScreenOffWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = [(id)SBApp screenSleepCoordinator];
  [v2 sleepAndLockUIFromSource:12 completion:*(void *)(a1 + 32)];
}

- (void)_systemApertureFrameDidChange:(id)a3
{
  id v4 = [a3 userInfo];
  id v7 = [v4 objectForKey:@"SBSystemApertureFrames"];

  if ([v7 count])
  {
    int v5 = (NSArray *)[v7 copy];
    systemApertureFrames = self->_systemApertureFrames;
    self->_systemApertureFrames = v5;

    [(SiriPresentationSpringBoardMainScreenViewController *)self->_mainScreenSiriPresentation setSystemApertureFrames:v7];
  }
}

- (id)_currentSessionCreatingIfNeededWithFailureExplanation:(id *)a3
{
  currentSession = self->_currentSession;
  if (!currentSession)
  {
    int v6 = [(SBAssistantController *)self _uiSceneTracker];
    id v7 = [v6 activeDisplayWindowScene];

    double v8 = [v7 sceneManager];
    id v9 = [v8 policyAggregator];

    if ([v9 allowsCapability:5 explanation:a3])
    {
      BOOL v10 = [[SBAssistantSession alloc] initWithWindowScene:v7 operationQueue:self->_operationQueue gestureConfiguration:self->_gestureConfiguration];
      [(SBAssistantSession *)v10 setDelegate:self];
      [(SBAssistantController *)self _updateWindowLevelForScene:v7];
      id v11 = self->_currentSession;
      self->_currentSession = v10;
    }
    currentSession = self->_currentSession;
  }
  return currentSession;
}

- (void)_generativeModelsAvailabilityDidChange
{
  [(SBAssistantController *)self _updateSystemAssistantExperienceEnabled];
  [(SBAssistantController *)self _siriPreferencesDidChange];
}

- (void)_siriPreferencesDidChange
{
  [(SBAssistantController *)self _updateSystemAssistantExperienceHomeAffordanceDoubleTapGestureEnabled];
  [(SBAssistantController *)self _updateSystemAssistantExperiencePersistentSiriEnabled];
}

- (void)_updateSystemAssistantExperienceEnabled
{
  uint64_t v3 = AFDeviceSupportsSystemAssistantExperience();
  [(SBAssistantController *)self setSystemAssistantExperienceEnabled:v3];
}

- (void)_updateSystemAssistantExperienceHomeAffordanceDoubleTapGestureEnabled
{
  if (self->_systemAssistantExperienceEnabled)
  {
    id v3 = [MEMORY[0x1E4F4E538] sharedPreferences];
    -[SBAssistantController setSystemAssistantExperienceHomeAffordanceDoubleTapGestureEnabled:](self, "setSystemAssistantExperienceHomeAffordanceDoubleTapGestureEnabled:", [v3 quickTypeGestureEnabled]);
  }
  else
  {
    [(SBAssistantController *)self setSystemAssistantExperienceHomeAffordanceDoubleTapGestureEnabled:0];
  }
}

- (void)_updateSystemAssistantExperiencePersistentSiriEnabled
{
  if (self->_systemAssistantExperienceEnabled) {
    uint64_t v3 = SBFIsSAEPersistentSiriAvailable();
  }
  else {
    uint64_t v3 = 0;
  }
  [(SBAssistantController *)self setSystemAssistantExperiencePersistentSiriEnabled:v3];
}

- (void)assistantSession:(id)a3 viewWillAppearInWindowScene:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  int v6 = SBLogSiri();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    id v16 = _SBFLoggingMethodProem();
    id v17 = [v5 _sceneIdentifier];
    *(_DWORD *)buf = 138543618;
    BOOL v24 = v16;
    __int16 v25 = 2114;
    SEL v26 = v17;
    _os_log_debug_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEBUG, "%{public}@: %{public}@", buf, 0x16u);
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = (void *)[(NSHashTable *)self->_observers copy];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v18 + 1) + 8 * v11);
        if (objc_opt_respondsToSelector()) {
          [v12 assistantWillAppear:self windowScene:v5];
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v9);
  }

  [(SBAssistantController *)self _setVisible:1];
  id v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v13 addObserver:self selector:sel__bioAuthenticated_ name:*MEMORY[0x1E4FA7DD8] object:0];

  long long v14 = +[SBLockScreenManager sharedInstance];
  int v15 = [v14 bioAuthenticatedWhileMenuButtonDown];

  if (v15) {
    [(SBAssistantController *)self _bioAuthenticated:0];
  }
  [(SiriPresentationSpringBoardMainScreenViewController *)self->_mainScreenSiriPresentation setSystemApertureFrames:self->_systemApertureFrames];
}

- (void)assistantSession:(id)a3 viewDidAppearInWindowScene:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = SBLogSiri();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    id v16 = _SBFLoggingMethodProem();
    id v17 = [v7 _sceneIdentifier];
    *(_DWORD *)buf = 138543618;
    BOOL v24 = v16;
    __int16 v25 = 2114;
    SEL v26 = v17;
    _os_log_debug_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEBUG, "%{public}@: %{public}@", buf, 0x16u);
  }
  if (([v6 shouldAllowBiometricAutoUnlock] & 1) == 0)
  {
    uint64_t v9 = +[SBLockScreenManager sharedInstance];
    [v9 setBiometricAutoUnlockingDisabled:1 forReason:@"Siri"];
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v10 = (void *)[(NSHashTable *)self->_observers copy];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v19;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v10);
        }
        int v15 = *(void **)(*((void *)&v18 + 1) + 8 * v14);
        if (objc_opt_respondsToSelector()) {
          [v15 assistantDidAppear:self windowScene:v7];
        }
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v12);
  }
}

- (void)assistantSession:(id)a3 viewWillDisappearInWindowScene:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = SBLogSiri();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v14 = _SBFLoggingMethodProem();
    int v15 = [v5 _sceneIdentifier];
    *(_DWORD *)buf = 138543618;
    objc_super v22 = v14;
    __int16 v23 = 2114;
    BOOL v24 = v15;
    _os_log_debug_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEBUG, "%{public}@: %{public}@", buf, 0x16u);
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = (void *)[(NSHashTable *)self->_observers copy];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v16 + 1) + 8 * v11);
        if (objc_opt_respondsToSelector()) {
          [v12 assistantWillDisappear:self windowScene:v5];
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  [(SBAssistantController *)self _setVisible:0];
  uint64_t v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v13 removeObserver:self name:*MEMORY[0x1E4FA7DD8] object:0];
}

- (void)assistantSession:(id)a3 viewDidDisappearInWindowScene:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = SBLogSiri();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    long long v16 = _SBFLoggingMethodProem();
    long long v17 = [v7 _sceneIdentifier];
    *(_DWORD *)buf = 138543618;
    BOOL v24 = v16;
    __int16 v25 = 2114;
    SEL v26 = v17;
    _os_log_debug_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEBUG, "%{public}@: %{public}@", buf, 0x16u);
  }
  if (([v6 shouldAllowBiometricAutoUnlock] & 1) == 0)
  {
    uint64_t v9 = +[SBLockScreenManager sharedInstance];
    [v9 setBiometricAutoUnlockingDisabled:0 forReason:@"Siri"];
  }
  [(SBAssistantController *)self _setUnlockedDevice:0];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v10 = (void *)[(NSHashTable *)self->_observers copy];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v19;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v10);
        }
        int v15 = *(void **)(*((void *)&v18 + 1) + 8 * v14);
        if (objc_opt_respondsToSelector()) {
          [v15 assistantDidDisappear:self windowScene:v7];
        }
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v12);
  }
}

- (void)assistantSession:(id)a3 didChangePresentationInWindowScene:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = SBLogSiri();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v13 = _SBFLoggingMethodProem();
    uint64_t v14 = [v5 _sceneIdentifier];
    *(_DWORD *)buf = 138543618;
    long long v21 = v13;
    __int16 v22 = 2114;
    __int16 v23 = v14;
    _os_log_debug_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEBUG, "%{public}@: %{public}@", buf, 0x16u);
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = (void *)[(NSHashTable *)self->_observers copy];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v15 + 1) + 8 * v11);
        if (objc_opt_respondsToSelector()) {
          [v12 assistantDidChangePresentation:self windowScene:v5];
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }
}

- (void)assistantSession:(id)a3 requestsDismissalWithDismissalOptions:(id)a4
{
  if (self->_currentSession == a3)
  {
    [(SBAssistantController *)self _dismissAssistantViewIfNecessaryWithAnimation:1 factory:0 dismissalOptions:a4 completion:0];
  }
  else
  {
    id v6 = SBLogSiri();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[SBAssistantController assistantSession:requestsDismissalWithDismissalOptions:]((uint64_t)self, (uint64_t)a2, v6);
    }
  }
}

- (id)acquireWindowLevelAssertionWithPriority:(int64_t)a3 windowLevel:(double)a4 windowScene:(id)a5 reason:(id)a6
{
  return [(SBWindowLevelAssertionManager *)self->_windowLevelAssertionManager acquireWindowLevelAssertionWithPriority:a3 windowLevel:a5 windowScene:a6 reason:a4];
}

- (void)windowLevelAssertionManager:(id)a3 didUpdateAssertionsForWindowScene:(id)a4
{
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  id v5 = a4;
  if (([v5 isEqualToString:@"assistantAnimationDuration"] & 1) != 0
    || [v5 isEqualToString:@"assistantDismissAnimationDurationOverApp"])
  {
    [(SBAssistantController *)self _prototypeSettingsChanged];
  }
}

- (void)_prototypeSettingsChanged
{
  [(SBSystemAnimationSettings *)self->_settings assistantAnimationDuration];
  *(double *)&kSBAssistantDefaultAnimationDuration = v2;
}

- (int64_t)idleTimerDuration
{
  float v2 = +[SBCoverSheetPresentationManager sharedInstanceIfExists];
  if ([v2 hasBeenDismissedSinceKeybagLock]) {
    int64_t v3 = 12;
  }
  else {
    int64_t v3 = 10;
  }

  return v3;
}

- (int64_t)idleTimerMode
{
  return 1;
}

- (int64_t)idleWarnMode
{
  return 2;
}

- (void)dismissOverlayForDashBoardAnimated:(BOOL)a3
{
}

- (void)screenWakeRequested
{
}

void __44__SBAssistantController_screenWakeRequested__block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  float v2 = SBLogSiri();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int64_t v3 = _SBFLoggingMethodProem();
    *(_DWORD *)buf = 138543362;
    uint64_t v9 = v3;
    _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
  }
  if (*(unsigned char *)(*(void *)(a1 + 32) + 97))
  {
    id v4 = +[SBLockScreenManager sharedInstance];
    if ([v4 isUILocked])
    {
      id v6 = @"SBUIUnlockOptionsTurnOnScreenFirstKey";
      uint64_t v7 = MEMORY[0x1E4F1CC38];
      id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v7 forKeys:&v6 count:1];
      [v4 unlockUIFromSource:12 withOptions:v5];
    }
  }
}

- (id)alwaysOnLiveRenderingAssertionRequested
{
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = __Block_byref_object_copy__71;
  v17[4] = __Block_byref_object_dispose__71;
  id v18 = 0;
  id v4 = objc_alloc(MEMORY[0x1E4F4F838]);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __64__SBAssistantController_alwaysOnLiveRenderingAssertionRequested__block_invoke;
  v16[3] = &unk_1E6B01F90;
  v16[4] = v17;
  id v5 = (void *)[v4 initWithIdentifier:@"alwaysOnLiveRenderingAssertionRequested" forReason:@"SBAssistantController" invalidationBlock:v16];
  location[1] = (id)MEMORY[0x1E4F143A8];
  location[2] = (id)3221225472;
  location[3] = __64__SBAssistantController_alwaysOnLiveRenderingAssertionRequested__block_invoke_2;
  location[4] = &unk_1E6B04E10;
  location[5] = self;
  SEL v15 = a2;
  id v6 = v5;
  id v13 = v6;
  uint64_t v14 = v17;
  BSDispatchMain();
  objc_initWeak(location, v6);
  dispatch_time_t v7 = dispatch_time(0, 5000000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__SBAssistantController_alwaysOnLiveRenderingAssertionRequested__block_invoke_192;
  block[3] = &unk_1E6AF4B10;
  objc_copyWeak(&v11, location);
  dispatch_after(v7, MEMORY[0x1E4F14428], block);
  id v8 = v6;
  objc_destroyWeak(&v11);
  objc_destroyWeak(location);

  _Block_object_dispose(v17, 8);
  return v8;
}

uint64_t __64__SBAssistantController_alwaysOnLiveRenderingAssertionRequested__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) invalidate];
}

void __64__SBAssistantController_alwaysOnLiveRenderingAssertionRequested__block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  float v2 = SBLogSiri();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int64_t v3 = _SBFLoggingMethodProem();
    int v11 = 138543362;
    uint64_t v12 = v3;
    _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@", (uint8_t *)&v11, 0xCu);
  }
  if (*(unsigned char *)(*(void *)(a1 + 32) + 97))
  {
    id v4 = +[SBLockScreenManager sharedInstance];
    if ([v4 isUILocked])
    {
      if ([*(id *)(a1 + 40) isValid])
      {
        id v5 = [*(id *)(a1 + 32) _uiSceneTracker];
        id v6 = [v5 activeDisplayWindowScene];

        dispatch_time_t v7 = [MEMORY[0x1E4FA5E68] sharedInstance];
        uint64_t v8 = [v7 acquireLiveRenderingAssertionForUIScene:v6 reason:@"SBAssistantController request."];
        uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
        uint64_t v10 = *(void **)(v9 + 40);
        *(void *)(v9 + 40) = v8;
      }
    }
  }
}

void __64__SBAssistantController_alwaysOnLiveRenderingAssertionRequested__block_invoke_192(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained invalidate];
}

- (void)screenWakeIdleTimerResetRequested
{
}

void __58__SBAssistantController_screenWakeIdleTimerResetRequested__block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  float v2 = SBLogSiri();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int64_t v3 = _SBFLoggingMethodProem();
    int v5 = 138543362;
    id v6 = v3;
    _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@", (uint8_t *)&v5, 0xCu);
  }
  uint64_t v4 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v4 + 97)) {
    [*(id *)(v4 + 80) reset];
  }
}

- (void)deviceUnlockRequestedWithPassword:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = SBLogSiri();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = _SBFLoggingMethodProem();
    int v7 = 138543362;
    uint64_t v8 = v6;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@", (uint8_t *)&v7, 0xCu);
  }
  [(SBAssistantController *)self siriPresentation:self->_mainScreenSiriPresentation requestsDeviceUnlockWithPassword:v4];
}

- (void)siriRequestDidReactivateForSiriPresentation:(id)a3
{
}

void __69__SBAssistantController_siriRequestDidReactivateForSiriPresentation___block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) currentSession];
  id v5 = [v1 windowScene];

  float v2 = [v5 controlCenterController];
  int v3 = [v2 isVisible];

  if (v3)
  {
    id v4 = [v5 controlCenterController];
    [v4 dismissAnimated:1];
  }
}

- (BOOL)siriPresentation:(id)a3 requestsDeviceUnlockWithPassword:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v21 = 0;
  __int16 v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  SEL v15 = __75__SBAssistantController_siriPresentation_requestsDeviceUnlockWithPassword___block_invoke;
  long long v16 = &unk_1E6B04E10;
  long long v17 = self;
  SEL v20 = a2;
  id v9 = v8;
  id v18 = v9;
  long long v19 = &v21;
  uint64_t v10 = (void (**)(void))MEMORY[0x1D948C7A0](&v13);
  if (objc_msgSend(MEMORY[0x1E4F29060], "isMainThread", v13, v14, v15, v16, v17)) {
    v10[2](v10);
  }
  else {
    dispatch_sync(MEMORY[0x1E4F14428], v10);
  }
  char v11 = *((unsigned char *)v22 + 24);

  _Block_object_dispose(&v21, 8);
  return v11;
}

void __75__SBAssistantController_siriPresentation_requestsDeviceUnlockWithPassword___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  float v2 = SBLogSiri();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = _SBFLoggingMethodProem();
    int v10 = 138543362;
    char v11 = v3;
    _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@", (uint8_t *)&v10, 0xCu);
  }
  id v4 = [(id)SBApp authenticationController];
  id v5 = [v4 createGracePeriodAssertionWithReason:@"Siri unlock attempt"];
  [v5 activate];
  uint64_t v6 = [*(id *)(a1 + 40) length];
  [v4 notePasscodeEntryBegan];
  id v7 = objc_alloc(MEMORY[0x1E4FA5EA0]);
  if (v6) {
    uint64_t v8 = [v7 initForPasscode:*(void *)(a1 + 40) source:0];
  }
  else {
    uint64_t v8 = [v7 initForBiometricAuthenticationWithSource:0];
  }
  id v9 = (void *)v8;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v4 _processAuthenticationRequest:v8 responder:*(void *)(a1 + 32)];
  [*(id *)(a1 + 32) _setUnlockedDevice:*(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
  [v5 invalidate];
}

- (void)siriPresentation:(id)a3 didUpdateAudioCategoriesDisablingVolumeHUD:(id)a4
{
  id v5 = a4;
  id v4 = v5;
  BSDispatchMain();
}

void __85__SBAssistantController_siriPresentation_didUpdateAudioCategoriesDisablingVolumeHUD___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  float v2 = SBLogSiri();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = _SBFLoggingMethodProem();
    int v11 = 138543362;
    uint64_t v12 = v3;
    _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@", (uint8_t *)&v11, 0xCu);
  }
  if (*(void *)(a1 + 40))
  {
    id v4 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:");
  }
  else
  {
    id v4 = 0;
  }
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v4;
  id v7 = v4;

  uint64_t v8 = [(id)SBApp volumeControl];
  id v9 = *(void **)(a1 + 32);
  int v10 = [v8 lastDisplayedCategory];
  LOBYTE(v9) = [v9 shouldShowSystemVolumeHUDForCategory:v10];

  if ((v9 & 1) == 0) {
    [v8 hideVolumeHUDIfVisible];
  }
}

- (void)siriPresentation:(id)a3 didUpdateHomeGestureSharing:(BOOL)a4
{
}

- (void)siriPresentation:(id)a3 didUpdateShouldDismissForTapsOutsideContent:(BOOL)a4
{
}

- (void)siriPresentation:(id)a3 didUpdateShouldDismissForSwipesOutsideContent:(BOOL)a4
{
}

- (void)siriPresentation:(id)a3 didUpdateShouldPassTouchesThroughToSpringBoard:(BOOL)a4
{
}

- (void)siriPresentation:(id)a3 willChangeKeyboardVisibility:(BOOL)a4
{
}

uint64_t __71__SBAssistantController_siriPresentation_willChangeKeyboardVisibility___block_invoke(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(a1 + 40);
  float v2 = *(void **)(*(void *)(a1 + 32) + 136);
  if (v1) {
    return [v2 noteKeyboardWillAppear];
  }
  else {
    return [v2 noteKeyboardWillDisappear];
  }
}

- (void)siriPresentation:(id)a3 requestsPresentationOfEffectsViewController:(id)a4 withHandler:(id)a5
{
  id v6 = a4;
  id v9 = a5;
  id v7 = v9;
  id v8 = v6;
  BSDispatchMain();
}

void __98__SBAssistantController_siriPresentation_requestsPresentationOfEffectsViewController_withHandler___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  float v2 = SBLogSiri();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = _SBFLoggingMethodProem();
    *(_DWORD *)buf = 138543362;
    uint64_t v21 = v3;
    _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
  }
  id v4 = *(void **)(a1 + 32);
  id v17 = 0;
  uint64_t v5 = [v4 _currentSessionCreatingIfNeededWithFailureExplanation:&v17];
  id v6 = (__CFString *)v17;
  id v7 = v6;
  if (v5)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __98__SBAssistantController_siriPresentation_requestsPresentationOfEffectsViewController_withHandler___block_invoke_198;
    v15[3] = &unk_1E6AF5300;
    uint64_t v8 = *(void *)(a1 + 40);
    id v16 = *(id *)(a1 + 48);
    [v5 presentSiriEffectsViewController:v8 completion:v15];
    id v9 = v16;
  }
  else
  {
    uint64_t v10 = *(void *)(a1 + 48);
    int v11 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v12 = *MEMORY[0x1E4F28798];
    if (v6) {
      uint64_t v13 = v6;
    }
    else {
      uint64_t v13 = @"<no reason provided>";
    }
    uint64_t v18 = *MEMORY[0x1E4F28588];
    long long v19 = v13;
    uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v19 forKeys:&v18 count:1];
    id v9 = [v11 errorWithDomain:v12 code:1 userInfo:v14];
    (*(void (**)(uint64_t, void, void *))(v10 + 16))(v10, 0, v9);

    id v7 = (void *)v14;
  }
}

uint64_t __98__SBAssistantController_siriPresentation_requestsPresentationOfEffectsViewController_withHandler___block_invoke_198(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)siriPresentation:(id)a3 requestsDismissalOfEffectsViewControllerWithHandler:(id)a4
{
  id v5 = a4;
  id v4 = v5;
  BSDispatchMain();
}

void __94__SBAssistantController_siriPresentation_requestsDismissalOfEffectsViewControllerWithHandler___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  float v2 = SBLogSiri();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = _SBFLoggingMethodProem();
    *(_DWORD *)buf = 138543362;
    id v9 = v3;
    _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
  }
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 136);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __94__SBAssistantController_siriPresentation_requestsDismissalOfEffectsViewControllerWithHandler___block_invoke_203;
  v6[3] = &unk_1E6AF6828;
  v6[4] = v4;
  id v7 = *(id *)(a1 + 40);
  [v5 dismissSiriEffectsViewControllerWithCompletion:v6];
}

uint64_t __94__SBAssistantController_siriPresentation_requestsDismissalOfEffectsViewControllerWithHandler___block_invoke_203(uint64_t a1)
{
  if (([*(id *)(*(void *)(a1 + 32) + 136) isActive] & 1) == 0)
  {
    uint64_t v2 = *(void *)(a1 + 32);
    int v3 = *(void **)(v2 + 136);
    *(void *)(v2 + 136) = 0;
  }
  uint64_t v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v4();
}

- (void)siriPresentation:(id)a3 acquireElevatedEffectsViewControllerAssertionWithReason:(id)a4 handler:(id)a5
{
  id v6 = a4;
  id v9 = a5;
  id v7 = v9;
  id v8 = v6;
  BSDispatchMain();
}

void __106__SBAssistantController_siriPresentation_acquireElevatedEffectsViewControllerAssertionWithReason_handler___block_invoke(void *a1)
{
  id v2 = [*(id *)(a1[4] + 136) acquireElevatedSiriEffectsViewControllerAssertionWithReason:a1[5]];
  (*(void (**)(void))(a1[6] + 16))();
}

- (void)siriPresentation:(id)a3 willStartHostingSceneWithIdentifier:(id)a4 bundleIdentifier:(id)a5
{
  currentSession = self->_currentSession;
  if (currentSession)
  {
    [(SBAssistantSession *)currentSession siriStartedHostingSceneWithIdentifier:a4 bundleIdentifier:a5];
  }
  else
  {
    id v6 = SBLogSiri();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SBAssistantController siriPresentation:willStartHostingSceneWithIdentifier:bundleIdentifier:]();
    }
  }
}

- (void)siriPresentation:(id)a3 willStopHostingSceneWithIdentifier:(id)a4 bundleIdentifier:(id)a5
{
  currentSession = self->_currentSession;
  if (currentSession)
  {
    [(SBAssistantSession *)currentSession siriStoppedHostingSceneWithIdentifier:a4 bundleIdentifier:a5];
  }
  else
  {
    id v6 = SBLogSiri();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SBAssistantController siriPresentation:willStopHostingSceneWithIdentifier:bundleIdentifier:]();
    }
  }
}

- (void)requestTamaleLaunchAnimationLayerProviderWithCompletion:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  BSDispatchMain();
}

uint64_t __81__SBAssistantController_requestTamaleLaunchAnimationLayerProviderWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 136);
  if (v2)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    return [v2 requestTamaleLaunchAnimationLayerProviderWithCompletion:v3];
  }
  else
  {
    id v5 = SBLogSiri();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __81__SBAssistantController_requestTamaleLaunchAnimationLayerProviderWithCompletion___block_invoke_cold_1();
    }

    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)siriPresentation:(id)a3 requestsPresentationWithOptions:(id)a4 withHandler:(id)a5
{
  id v6 = a4;
  id v9 = a5;
  id v7 = v9;
  id v8 = v6;
  BSDispatchMain();
}

void __86__SBAssistantController_siriPresentation_requestsPresentationWithOptions_withHandler___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v2 = SBLogSiri();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = _SBFLoggingMethodProem();
    uint64_t v4 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    char v24 = v3;
    __int16 v25 = 2114;
    uint64_t v26 = v4;
    _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@", buf, 0x16u);
  }
  id v5 = *(void **)(a1 + 32);
  id v20 = 0;
  id v6 = [v5 _currentSessionCreatingIfNeededWithFailureExplanation:&v20];
  id v7 = (__CFString *)v20;
  id v8 = v7;
  if (v6)
  {
    id v9 = [MEMORY[0x1E4F4F898] factoryWithDuration:*(double *)&kSBAssistantDefaultAnimationDuration];
    uint64_t v10 = *(void *)(a1 + 40);
    uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 40);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __86__SBAssistantController_siriPresentation_requestsPresentationWithOptions_withHandler___block_invoke_204;
    v18[3] = &unk_1E6AF5300;
    id v19 = *(id *)(a1 + 48);
    [v6 presentSiriPresentationViewController:v11 withAnimationFactory:v9 siriPresentationOptions:v10 completion:v18];
    uint64_t v12 = v19;
  }
  else
  {
    uint64_t v13 = *(void *)(a1 + 48);
    uint64_t v14 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v15 = *MEMORY[0x1E4F28798];
    if (v7) {
      id v16 = v7;
    }
    else {
      id v16 = @"<no reason provided>";
    }
    uint64_t v21 = *MEMORY[0x1E4F28588];
    uint64_t v22 = v16;
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
    uint64_t v17 = [v14 errorWithDomain:v15 code:1 userInfo:v9];
    (*(void (**)(uint64_t, void, uint64_t))(v13 + 16))(v13, 0, v17);
    uint64_t v12 = v8;
    id v8 = (void *)v17;
  }
}

uint64_t __86__SBAssistantController_siriPresentation_requestsPresentationWithOptions_withHandler___block_invoke_204(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)siriPresentation:(id)a3 requestsDismissalWithOptions:(id)a4 withHandler:(id)a5
{
  id v6 = a4;
  id v9 = a5;
  id v7 = v9;
  id v8 = v6;
  BSDispatchMain();
}

void __83__SBAssistantController_siriPresentation_requestsDismissalWithOptions_withHandler___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = SBLogSiri();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = _SBFLoggingMethodProem();
    uint64_t v4 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    uint64_t v12 = v3;
    __int16 v13 = 2114;
    uint64_t v14 = v4;
    _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@", buf, 0x16u);
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __83__SBAssistantController_siriPresentation_requestsDismissalWithOptions_withHandler___block_invoke_205;
  v9[3] = &unk_1E6AF6828;
  void v9[4] = *(void *)(a1 + 32);
  id v10 = *(id *)(a1 + 48);
  id v5 = (void (**)(void))MEMORY[0x1D948C7A0](v9);
  if ([*(id *)(a1 + 40) shouldTurnScreenOff])
  {
    id v6 = *(void **)(a1 + 32);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __83__SBAssistantController_siriPresentation_requestsDismissalWithOptions_withHandler___block_invoke_3;
    v7[3] = &unk_1E6AF5300;
    id v8 = v5;
    [v6 _turnScreenOffWithCompletion:v7];
  }
  else
  {
    v5[2](v5);
  }
}

void __83__SBAssistantController_siriPresentation_requestsDismissalWithOptions_withHandler___block_invoke_205(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __83__SBAssistantController_siriPresentation_requestsDismissalWithOptions_withHandler___block_invoke_2;
  v2[3] = &unk_1E6AF5300;
  int v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  [v1 dismissAssistantViewInEverySceneIfNecessaryWithAnimation:1 factory:0 completion:v2];
}

uint64_t __83__SBAssistantController_siriPresentation_requestsDismissalWithOptions_withHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, 1, 0);
  }
  return result;
}

uint64_t __83__SBAssistantController_siriPresentation_requestsDismissalWithOptions_withHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)siriPresentation:(id)a3 isEnabledDidChange:(BOOL)a4
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = SBLogSiri();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = _SBFLoggingMethodProem();
    int v6 = 138543362;
    id v7 = v5;
    _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@", (uint8_t *)&v6, 0xCu);
  }
}

- (void)siriPresentation:(id)a3 requestsPunchout:(id)a4 withHandler:(id)a5
{
  id v6 = a4;
  id v9 = a5;
  id v7 = v9;
  id v8 = v6;
  BSDispatchMain();
}

void __71__SBAssistantController_siriPresentation_requestsPunchout_withHandler___block_invoke(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v2 = SBLogSiri();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = _SBFLoggingMethodProem();
    *(_DWORD *)buf = 138543362;
    __int16 v31 = v3;
    _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
  }
  uint64_t v4 = (id *)(a1 + 40);
  id v5 = [*(id *)(a1 + 40) url];
  id v6 = SBWorkspaceDialRequestForURL(v5);
  if (![v6 isValid]
    || (uint64_t v7 = *(void *)(a1 + 32), *(unsigned char *)(v7 + 97)) && !*(unsigned char *)(v7 + 98))
  {
    uint64_t v11 = [*v4 bundleIdentifier];
    uint64_t v12 = [*v4 punchoutStyle];
    if (!v11)
    {
      if (v5)
      {
        uint64_t v14 = +[SBAssistantController _activationSettingsWithPunchoutStyle:v12];
        uint64_t v18 = (void *)SBApp;
        id v19 = [MEMORY[0x1E4F4F7F8] processHandle];
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = __71__SBAssistantController_siriPresentation_requestsPunchout_withHandler___block_invoke_216;
        v26[3] = &unk_1E6AF5DA8;
        id v27 = *(id *)(a1 + 48);
        [v18 applicationOpenURL:v5 withApplication:0 animating:1 activationSettings:v14 origin:v19 notifyLSOnFailure:1 withResult:v26];
      }
      else
      {
        uint64_t v22 = SBLogSiri();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
          __71__SBAssistantController_siriPresentation_requestsPunchout_withHandler___block_invoke_cold_1(a1, a1 + 40, v22);
        }

        uint64_t v23 = *(void *)(a1 + 48);
        if (!v23) {
          goto LABEL_21;
        }
        uint64_t v14 = FBSOpenApplicationErrorCreate();
        (*(void (**)(uint64_t, void, void *))(v23 + 16))(v23, 0, v14);
      }
      goto LABEL_20;
    }
    __int16 v13 = +[SBApplicationController sharedInstance];
    uint64_t v14 = [v13 applicationWithBundleIdentifier:v11];

    if (v14)
    {
      uint64_t v15 = +[SBAssistantController _activationSettingsWithPunchoutStyle:v12];
      id v16 = (void *)SBApp;
      uint64_t v17 = [MEMORY[0x1E4F4F7F8] processHandle];
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __71__SBAssistantController_siriPresentation_requestsPunchout_withHandler___block_invoke_211;
      v28[3] = &unk_1E6AF5DA8;
      id v29 = *(id *)(a1 + 48);
      [v16 applicationOpenURL:v5 withApplication:v14 animating:1 activationSettings:v15 origin:v17 notifyLSOnFailure:1 withResult:v28];
    }
    else
    {
      id v20 = SBLogSiri();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        char v24 = _SBFLoggingMethodProem();
        uint64_t v25 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138543874;
        __int16 v31 = v24;
        __int16 v32 = 2112;
        uint64_t v33 = v11;
        __int16 v34 = 2112;
        uint64_t v35 = v25;
        _os_log_error_impl(&dword_1D85BA000, v20, OS_LOG_TYPE_ERROR, "%{public}@ - Ignoring punchout since the specified app (%@) could not be found : request=%@", buf, 0x20u);
      }
      uint64_t v21 = *(void *)(a1 + 48);
      if (!v21) {
        goto LABEL_20;
      }
      uint64_t v15 = FBSOpenApplicationErrorCreate();
      (*(void (**)(uint64_t, void, void *))(v21 + 16))(v21, 0, v15);
    }

LABEL_20:
    goto LABEL_21;
  }
  id v8 = SBLogSiri();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = _SBFLoggingMethodProem();
    *(_DWORD *)buf = 138543362;
    __int16 v31 = v9;
    _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ - Ignoring assisted tel: URL because assistant is dismissing or not visible", buf, 0xCu);
  }
  uint64_t v10 = *(void *)(a1 + 48);
  if (v10)
  {
    uint64_t v11 = FBSOpenApplicationErrorCreate();
    (*(void (**)(uint64_t, void, void *))(v10 + 16))(v10, 0, v11);
LABEL_21:
  }
}

uint64_t __71__SBAssistantController_siriPresentation_requestsPunchout_withHandler___block_invoke_211(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, BOOL, uint64_t))(result + 16))(result, a2 == 0, a2);
  }
  return result;
}

uint64_t __71__SBAssistantController_siriPresentation_requestsPunchout_withHandler___block_invoke_216(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, BOOL, uint64_t))(result + 16))(result, a2 == 0, a2);
  }
  return result;
}

- (void)siriPresentation:(id)a3 setShowsHomeAffordance:(BOOL)a4
{
}

- (void)siriPresentation:(id)a3 didUpdateInputType:(int64_t)a4
{
}

void __61__SBAssistantController_siriPresentation_didUpdateInputType___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 136);
  if (v2)
  {
    id v3 = [v2 presentationContext];
    uint64_t v4 = [v3 siriPresentationOptions];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __61__SBAssistantController_siriPresentation_didUpdateInputType___block_invoke_2;
    v7[3] = &__block_descriptor_40_e43_v16__0___SiriPresentationOptionsMutating__8l;
    void v7[4] = *(void *)(a1 + 40);
    id v5 = [v4 mutatedCopyWithMutator:v7];
    id v6 = (void *)[v3 mutableCopy];
    [v6 setSiriPresentationOptions:v5];
    [*(id *)(*(void *)(a1 + 32) + 136) setPresentationContext:v6];
  }
}

uint64_t __61__SBAssistantController_siriPresentation_didUpdateInputType___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setInputType:*(void *)(a1 + 32)];
}

- (void)siriPresentation:(id)a3 didUpdatePresentationOptions:(id)a4
{
  id v5 = a4;
  id v4 = v5;
  BSDispatchMain();
}

void __71__SBAssistantController_siriPresentation_didUpdatePresentationOptions___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 136);
  if (v2)
  {
    id v4 = [v2 presentationContext];
    id v3 = (void *)[v4 mutableCopy];
    [v3 setSiriPresentationOptions:*(void *)(a1 + 40)];
    [*(id *)(*(void *)(a1 + 32) + 136) setPresentationContext:v3];
  }
}

- (void)siriPresentation:(id)a3 setHomeAffordanceSuppression:(int64_t)a4
{
}

- (void)restrictSystemApertureToDefaultLayoutWithReason:(id)a3
{
  id v4 = a3;
  if (!self->_systemApertureAssertion)
  {
    id v5 = [(id)SBApp systemApertureControllerForMainDisplay];
    id v6 = [v5 restrictSystemApertureToDefaultLayoutWithReason:v4];

    objc_initWeak(&location, self);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __73__SBAssistantController_restrictSystemApertureToDefaultLayoutWithReason___block_invoke;
    v8[3] = &unk_1E6AFFF18;
    objc_copyWeak(&v9, &location);
    [v6 addInvalidationBlock:v8];
    systemApertureAssertion = self->_systemApertureAssertion;
    self->_systemApertureAssertion = (SAInvalidatable *)v6;

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

void __73__SBAssistantController_restrictSystemApertureToDefaultLayoutWithReason___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setSystemApertureAssertion:0];
}

- (void)invalidateSystemApertureAssertionWithReason:(id)a3
{
  systemApertureAssertion = self->_systemApertureAssertion;
  if (systemApertureAssertion) {
    [(SAInvalidatable *)systemApertureAssertion invalidateWithReason:a3];
  }
}

- (void)alertItemsController:(id)a3 didActivateAlertItem:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  if ([(SBAssistantController *)self _isLocationTCCAlert:v5])
  {
    id v6 = SBLogSiri();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = _SBFLoggingMethodProem();
      int v8 = 138543618;
      id v9 = v7;
      __int16 v10 = 2114;
      id v11 = v5;
      _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ - observed did activate alert item: %{public}@, notifying siri location tcc presented.", (uint8_t *)&v8, 0x16u);
    }
    if (objc_opt_respondsToSelector()) {
      [(SiriPresentationSpringBoardMainScreenViewController *)self->_mainScreenSiriPresentation didPresentLocationTCC:v5];
    }
  }
}

- (void)alertItemsController:(id)a3 didDeactivateAlertItem:(id)a4 forReason:(int)a5
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if ([(SBAssistantController *)self _isLocationTCCAlert:v6])
  {
    uint64_t v7 = SBLogSiri();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = _SBFLoggingMethodProem();
      int v9 = 138543618;
      __int16 v10 = v8;
      __int16 v11 = 2114;
      id v12 = v6;
      _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ - observed did deactivate alert item: %{public}@, notifying siri location tcc dismissed.", (uint8_t *)&v9, 0x16u);
    }
    if (objc_opt_respondsToSelector()) {
      [(SiriPresentationSpringBoardMainScreenViewController *)self->_mainScreenSiriPresentation didDismissLocationTCC:v6];
    }
  }
}

- (BOOL)_isLocationTCCAlert:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class();
  id v5 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
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

  if (v7)
  {
    int v8 = [v7 extensionIdentifier];
    if (([v8 isEqual:@"com.apple.corelocation.CoreLocationVanillaWhenInUseAuthPromptPlugin"] & 1) != 0
      || ([v8 isEqual:@"com.apple.corelocation.CoreLocationRepromptAlwaysAuthPromptPlugin"] & 1) != 0)
    {
      char v9 = 1;
    }
    else
    {
      char v9 = [v8 isEqual:@"com.apple.corelocation.CoreLocationTemporaryPreciseAuthPromptPlugin"];
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (BOOL)unlockedDevice
{
  return self->_unlockedDevice;
}

- (BOOL)isSystemAssistantExperienceAvailable
{
  return self->_systemAssistantExperienceAvailable;
}

- (SBIdleTimerCoordinating)_idleTimerCoordinator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_idleTimerCoordinator);
  return (SBIdleTimerCoordinating *)WeakRetained;
}

- (void)_setIdleTimerCoordinator:(id)a3
{
}

- (SAInvalidatable)systemApertureAssertion
{
  return self->_systemApertureAssertion;
}

- (void)setSystemApertureAssertion:(id)a3
{
}

- (SBAssistantSession)currentSession
{
  return self->_currentSession;
}

- (void)setCurrentSession:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentSession, 0);
  objc_storeStrong((id *)&self->_systemApertureAssertion, 0);
  objc_destroyWeak((id *)&self->_idleTimerCoordinator);
  objc_storeStrong((id *)&self->_systemApertureFrames, 0);
  objc_storeStrong((id *)&self->_uiSceneTracker, 0);
  objc_storeStrong((id *)&self->_windowLevelAssertionManager, 0);
  objc_storeStrong((id *)&self->_idleTimer, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_audioCategoriesDisablingVolumeHUD, 0);
  objc_storeStrong((id *)&self->_gestureConfiguration, 0);
  objc_storeStrong((id *)&self->_mainScreenSiriPresentation, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_disableAssertion, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
}

- (void)assistantSession:(NSObject *)a3 requestsDismissalWithDismissalOptions:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = _SBFLoggingMethodProem();
  OUTLINED_FUNCTION_1_0();
  _os_log_debug_impl(&dword_1D85BA000, a3, OS_LOG_TYPE_DEBUG, "%{public}@ - assistant session requested dismissal but it isn't the current session, ignoring", v5, 0xCu);
}

- (void)siriPresentation:willStartHostingSceneWithIdentifier:bundleIdentifier:.cold.1()
{
  uint64_t v0 = _SBFLoggingMethodProem();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_10(&dword_1D85BA000, v1, v2, "%{public}@ - assistant session requested scene hosting to start but there isn't a current session, ignoring", v3, v4, v5, v6, v7);
}

- (void)siriPresentation:willStopHostingSceneWithIdentifier:bundleIdentifier:.cold.1()
{
  uint64_t v0 = _SBFLoggingMethodProem();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_10(&dword_1D85BA000, v1, v2, "%{public}@ - assistant session requested scene hosting to stop but there isn't a current session, ignoring", v3, v4, v5, v6, v7);
}

void __81__SBAssistantController_requestTamaleLaunchAnimationLayerProviderWithCompletion___block_invoke_cold_1()
{
  uint64_t v0 = _SBFLoggingMethodProem();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_10(&dword_1D85BA000, v1, v2, "%{public}@ - assistant session requested tamale layer but there isn't a current session, ignoring", v3, v4, v5, v6, v7);
}

void __71__SBAssistantController_siriPresentation_requestsPunchout_withHandler___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = _SBFLoggingMethodProem();
  OUTLINED_FUNCTION_1_0();
  __int16 v7 = 2112;
  uint64_t v8 = v5;
  _os_log_error_impl(&dword_1D85BA000, a3, OS_LOG_TYPE_ERROR, "%{public}@ - Ignoring punchout since it didn't specify an app nor a url : request=%@", v6, 0x16u);
}

@end