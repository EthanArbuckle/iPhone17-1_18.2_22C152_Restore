@interface SBMainDisplayPolicyAggregator
- (BOOL)_allowsCapabilityAssistantEnabledWithExplanation:(id *)a3;
- (BOOL)_allowsCapabilityAssistantWithExplanation:(id *)a3;
- (BOOL)_allowsCapabilityCommandTabWithExplanation:(id *)a3;
- (BOOL)_allowsCapabilityControlCenterEditingWithExplanation:(id *)a3;
- (BOOL)_allowsCapabilityControlCenterWithExplanation:(id *)a3;
- (BOOL)_allowsCapabilityCoverSheetSpotlightWithExplanation:(id *)a3;
- (BOOL)_allowsCapabilityCoverSheetWithExplanation:(id *)a3;
- (BOOL)_allowsCapabilityDismissCoverSheetWithExplanation:(id *)a3;
- (BOOL)_allowsCapabilityHomeScreenEditingWithExplanation:(id *)a3;
- (BOOL)_allowsCapabilityLiftToWakeWithExplanation:(id *)a3;
- (BOOL)_allowsCapabilityLockScreenBulletinWithExplanation:(id *)a3;
- (BOOL)_allowsCapabilityLockScreenCameraSupportedWithExplanation:(id *)a3;
- (BOOL)_allowsCapabilityLockScreenCameraWithExplanation:(id *)a3;
- (BOOL)_allowsCapabilityLockScreenControlCenterWithExplanation:(id *)a3;
- (BOOL)_allowsCapabilityLockScreenNotificationCenterWithExplanation:(id *)a3;
- (BOOL)_allowsCapabilityLockScreenTodayViewWithExplanation:(id *)a3;
- (BOOL)_allowsCapabilityLoginWindowWithExplanation:(id *)a3;
- (BOOL)_allowsCapabilityLogoutWithExplanation:(id *)a3;
- (BOOL)_allowsCapabilityPosterSwitcherWithExplanation:(id *)a3;
- (BOOL)_allowsCapabilityQuickNoteWithExplanation:(id *)a3;
- (BOOL)_allowsCapabilityScreenshotWithExplanation:(id *)a3;
- (BOOL)_allowsCapabilitySendMediaCommandWithExplanation:(id *)a3;
- (BOOL)_allowsCapabilitySpotlightWithExplanation:(id *)a3;
- (BOOL)_allowsCapabilitySuggestedApplicationWithExplanation:(id *)a3;
- (BOOL)_allowsCapabilitySystemGestureWithExplanation:(id *)a3;
- (BOOL)_allowsCapabilityTodayViewWithExplanation:(id *)a3;
- (BOOL)_allowsCapabilityUnlockToPluginSpecifiedApplicationWithExplanation:(id *)a3;
- (BOOL)_allowsCapabilityVoiceControlWithExplanation:(id *)a3;
- (BOOL)_allowsNotificationOrControlCenterWithExplanation:(id *)a3;
- (BOOL)_dictationInfoOnScreen;
- (BOOL)_hasFullySetUpUserWithExplanation:(id *)a3;
- (BOOL)allowsCapability:(int64_t)a3;
- (BOOL)allowsCapability:(int64_t)a3 explanation:(id *)a4;
- (BOOL)allowsTransitionRequest:(id)a3;
- (MCProfileConnection)_profileConnection;
- (SBAlertItemsController)_alertItemsController;
- (SBApplicationController)_applicationController;
- (SBAssistantController)_assistantController;
- (SBBannerManager)_bannerManager;
- (SBCommandTabController)_commandTabController;
- (SBConferenceManager)_conferenceManager;
- (SBLockScreenManager)_lockScreenManager;
- (SBLockStateAggregator)_lockStateAggregator;
- (SBMainDisplayPolicyAggregator)initWithDefaults:(id)a3 displayIdentity:(id)a4;
- (SBMainWorkspace)_mainWorkspace;
- (SBRemoteTransientOverlaySessionManager)_remoteTransientOverlaySessionManager;
- (SBSetupManager)_setupManager;
- (SBTelephonyManager)_telephonyManager;
- (void)_setAlertItemsController:(id)a3;
- (void)_setApplicationController:(id)a3;
- (void)_setAssistantController:(id)a3;
- (void)_setBannerManager:(id)a3;
- (void)_setCommandTabController:(id)a3;
- (void)_setConferenceManager:(id)a3;
- (void)_setLockScreenManager:(id)a3;
- (void)_setLockStateAggregator:(id)a3;
- (void)_setMainWorkspace:(id)a3;
- (void)_setProfileConnection:(id)a3;
- (void)_setRemoteTransientOverlaySessionManager:(id)a3;
- (void)_setSetupManager:(id)a3;
- (void)_setTelephonyManager:(id)a3;
- (void)reloadDemoDefaults;
@end

@implementation SBMainDisplayPolicyAggregator

- (BOOL)allowsTransitionRequest:(id)a3
{
  id v4 = a3;
  v5 = [v4 transientOverlayContext];
  if (!v5)
  {
    v6 = [(id)SBApp restartManager];
    char v7 = [v6 isPendingExit];

    if (v7) {
      goto LABEL_15;
    }
  }
  v8 = [(id)SBApp userSessionController];
  int v9 = [v8 isLoginSession];

  if (v9)
  {
    v10 = [v4 applicationContext];
    v11 = [v10 activatingEntity];
    if ([v11 isApplicationSceneEntity])
    {
      int v12 = [v10 isBackground];

      if (!v12)
      {
        v14 = 0;
        if (!v5)
        {
LABEL_11:
          if ([v14 isLaunchableDuringSetup]) {
            goto LABEL_12;
          }

LABEL_15:
          BOOL v15 = 0;
          goto LABEL_16;
        }
LABEL_12:

        goto LABEL_13;
      }
      v11 = [v10 activatingEntity];
      v13 = [v11 application];
      v14 = [v13 info];
    }
    else
    {
      v14 = 0;
    }

    if (!v5) {
      goto LABEL_11;
    }
    goto LABEL_12;
  }
LABEL_13:
  v17.receiver = self;
  v17.super_class = (Class)SBMainDisplayPolicyAggregator;
  BOOL v15 = [(SBPolicyAggregator *)&v17 allowsTransitionRequest:v4];
LABEL_16:

  return v15;
}

- (SBMainDisplayPolicyAggregator)initWithDefaults:(id)a3 displayIdentity:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v47.receiver = self;
  v47.super_class = (Class)SBMainDisplayPolicyAggregator;
  int v9 = [(SBMainDisplayPolicyAggregator *)&v47 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_defaults, a3);
    objc_storeStrong((id *)&v10->_displayIdentity, a4);
    v11 = [(SBLocalDefaults *)v10->_defaults demoDefaults];
    v10->_storeDemoAppLockEnabled = [v11 isStoreDemoApplicationLockEnabled];
    int v12 = [NSString stringWithUTF8String:"storeDemoApplicationLockEnabled"];
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __66__SBMainDisplayPolicyAggregator_initWithDefaults_displayIdentity___block_invoke;
    v44[3] = &unk_1E6AF5290;
    v13 = v10;
    v45 = v13;
    id v46 = v11;
    id v35 = v11;
    v14 = (void *)MEMORY[0x1E4F14428];
    id v15 = (id)[v35 observeDefault:v12 onQueue:MEMORY[0x1E4F14428] withBlock:v44];

    v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v17 = *MEMORY[0x1E4F73EC0];
    v18 = [MEMORY[0x1E4F28F08] mainQueue];
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __66__SBMainDisplayPolicyAggregator_initWithDefaults_displayIdentity___block_invoke_2;
    v42[3] = &unk_1E6AF7EE0;
    v19 = v13;
    v43 = v19;
    id v20 = (id)[v16 addObserverForName:v17 object:0 queue:v18 usingBlock:v42];

    v21 = +[SBDefaults externalDefaults];
    v22 = [v21 notesDefaults];

    v23 = [NSString stringWithUTF8String:"quickNotesDisabled"];
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __66__SBMainDisplayPolicyAggregator_initWithDefaults_displayIdentity___block_invoke_3;
    v40[3] = &unk_1E6AF4AC0;
    v24 = v19;
    v41 = v24;
    id v25 = (id)[v22 observeDefault:v23 onQueue:v14 withBlock:v40];

    v26 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v27 = *MEMORY[0x1E4FA6140];
    v28 = [MEMORY[0x1E4F28F08] mainQueue];
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __66__SBMainDisplayPolicyAggregator_initWithDefaults_displayIdentity___block_invoke_4;
    v38[3] = &unk_1E6AF7EE0;
    v29 = v24;
    v39 = v29;
    id v30 = (id)[v26 addObserverForName:v27 object:0 queue:v28 usingBlock:v38];

    v31 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v32 = [MEMORY[0x1E4F28F08] mainQueue];
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __66__SBMainDisplayPolicyAggregator_initWithDefaults_displayIdentity___block_invoke_5;
    v36[3] = &unk_1E6AF7EE0;
    v37 = v29;
    id v33 = (id)[v31 addObserverForName:@"SBInstalledApplicationsDidChangeNotification" object:0 queue:v32 usingBlock:v36];
  }
  return v10;
}

uint64_t __66__SBMainDisplayPolicyAggregator_initWithDefaults_displayIdentity___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 40) isStoreDemoApplicationLockEnabled];
  *(unsigned char *)(*(void *)(a1 + 32) + 136) = result;
  return result;
}

void __66__SBMainDisplayPolicyAggregator_initWithDefaults_displayIdentity___block_invoke_2(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"SBPolicyAggregatorCapabilitiesChangedNotification" object:*(void *)(a1 + 32)];
}

void __66__SBMainDisplayPolicyAggregator_initWithDefaults_displayIdentity___block_invoke_3(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"SBPolicyAggregatorCapabilitiesChangedNotification" object:*(void *)(a1 + 32)];
}

void __66__SBMainDisplayPolicyAggregator_initWithDefaults_displayIdentity___block_invoke_4(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"SBPolicyAggregatorCapabilitiesChangedNotification" object:*(void *)(a1 + 32)];
}

void __66__SBMainDisplayPolicyAggregator_initWithDefaults_displayIdentity___block_invoke_5(uint64_t a1, void *a2)
{
  id v6 = [a2 userInfo];
  v3 = [v6 objectForKey:@"SBInstalledApplicationsAddedBundleIDs"];
  id v4 = [v6 objectForKey:@"SBInstalledApplicationsRemovedBundleIDs"];
  if (([v3 containsObject:@"com.apple.mobilenotes"] & 1) != 0
    || [v4 containsObject:@"com.apple.mobilenotes"])
  {
    v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 postNotificationName:@"SBPolicyAggregatorCapabilitiesChangedNotification" object:*(void *)(a1 + 32)];
  }
}

- (BOOL)allowsCapability:(int64_t)a3
{
  return [(SBMainDisplayPolicyAggregator *)self allowsCapability:a3 explanation:0];
}

- (BOOL)allowsCapability:(int64_t)a3 explanation:(id *)a4
{
  switch(a3)
  {
    case 1:
      BOOL result = [(SBMainDisplayPolicyAggregator *)self _allowsCapabilitySuggestedApplicationWithExplanation:a4];
      break;
    case 2:
      BOOL result = [(SBMainDisplayPolicyAggregator *)self _allowsCapabilityLockScreenBulletinWithExplanation:a4];
      break;
    case 3:
      BOOL result = [(SBMainDisplayPolicyAggregator *)self _allowsCapabilityUnlockToPluginSpecifiedApplicationWithExplanation:a4];
      break;
    case 4:
      BOOL result = [(SBMainDisplayPolicyAggregator *)self _allowsCapabilityAssistantEnabledWithExplanation:a4];
      break;
    case 5:
      BOOL result = [(SBMainDisplayPolicyAggregator *)self _allowsCapabilityAssistantWithExplanation:a4];
      break;
    case 6:
      BOOL result = [(SBMainDisplayPolicyAggregator *)self _allowsCapabilitySendMediaCommandWithExplanation:a4];
      break;
    case 7:
      BOOL result = [(SBMainDisplayPolicyAggregator *)self _allowsCapabilitySystemGestureWithExplanation:a4];
      break;
    case 8:
      BOOL result = [(SBMainDisplayPolicyAggregator *)self _allowsCapabilityVoiceControlWithExplanation:a4];
      break;
    case 9:
      BOOL result = [(SBMainDisplayPolicyAggregator *)self _allowsCapabilitySpotlightWithExplanation:a4];
      break;
    case 10:
      BOOL result = [(SBMainDisplayPolicyAggregator *)self _allowsCapabilityLockScreenCameraSupportedWithExplanation:a4];
      break;
    case 11:
      BOOL result = [(SBMainDisplayPolicyAggregator *)self _allowsCapabilityLockScreenCameraWithExplanation:a4];
      break;
    case 12:
      BOOL result = [(SBMainDisplayPolicyAggregator *)self _allowsCapabilityCoverSheetWithExplanation:a4];
      break;
    case 13:
      BOOL result = [(SBMainDisplayPolicyAggregator *)self _allowsCapabilityDismissCoverSheetWithExplanation:a4];
      break;
    case 14:
      BOOL result = [(SBMainDisplayPolicyAggregator *)self _allowsCapabilityControlCenterWithExplanation:a4];
      break;
    case 15:
      BOOL result = [(SBMainDisplayPolicyAggregator *)self _allowsCapabilityLogoutWithExplanation:a4];
      break;
    case 16:
      BOOL result = [(SBMainDisplayPolicyAggregator *)self _allowsCapabilityLoginWindowWithExplanation:a4];
      break;
    case 17:
      BOOL result = [(SBMainDisplayPolicyAggregator *)self _allowsCapabilityHomeScreenEditingWithExplanation:a4];
      break;
    case 18:
      BOOL result = [(SBMainDisplayPolicyAggregator *)self _allowsCapabilityScreenshotWithExplanation:a4];
      break;
    case 19:
      BOOL result = [(SBMainDisplayPolicyAggregator *)self _allowsCapabilityCommandTabWithExplanation:a4];
      break;
    case 20:
      BOOL result = [(SBMainDisplayPolicyAggregator *)self _allowsCapabilityLockScreenControlCenterWithExplanation:a4];
      break;
    case 21:
      BOOL result = [(SBMainDisplayPolicyAggregator *)self _allowsCapabilityLockScreenNotificationCenterWithExplanation:a4];
      break;
    case 22:
      BOOL result = [(SBMainDisplayPolicyAggregator *)self _allowsCapabilityLockScreenTodayViewWithExplanation:a4];
      break;
    case 23:
      BOOL result = [(SBMainDisplayPolicyAggregator *)self _allowsCapabilityTodayViewWithExplanation:a4];
      break;
    case 24:
      BOOL result = [(SBMainDisplayPolicyAggregator *)self _allowsCapabilityLiftToWakeWithExplanation:a4];
      break;
    case 25:
      BOOL result = [(SBMainDisplayPolicyAggregator *)self _allowsCapabilityQuickNoteWithExplanation:a4];
      break;
    case 26:
      BOOL result = [(SBMainDisplayPolicyAggregator *)self _allowsCapabilityCoverSheetSpotlightWithExplanation:a4];
      break;
    case 27:
      BOOL result = [(SBMainDisplayPolicyAggregator *)self _allowsCapabilityPosterSwitcherWithExplanation:a4];
      break;
    case 28:
      BOOL result = [(SBMainDisplayPolicyAggregator *)self _allowsCapabilityHardwareButtonBezelEffectsEdgeLight:a4];
      break;
    case 29:
      BOOL result = [(SBMainDisplayPolicyAggregator *)self _allowsCapabilityControlCenterEditingWithExplanation:a4];
      break;
    default:
      BOOL result = 0;
      break;
  }
  return result;
}

- (void)reloadDemoDefaults
{
  id v3 = [(SBLocalDefaults *)self->_defaults demoDefaults];
  self->_storeDemoAppLockEnabled = [v3 isStoreDemoApplicationLockEnabled];
}

- (MCProfileConnection)_profileConnection
{
  override_profileConnection = self->_override_profileConnection;
  if (override_profileConnection)
  {
    id v3 = override_profileConnection;
  }
  else
  {
    id v3 = [MEMORY[0x1E4F74230] sharedConnection];
  }
  return v3;
}

- (SBSetupManager)_setupManager
{
  override_setupManager = self->_override_setupManager;
  if (override_setupManager)
  {
    id v3 = override_setupManager;
  }
  else
  {
    id v3 = +[SBSetupManager sharedInstance];
  }
  return v3;
}

- (SBAlertItemsController)_alertItemsController
{
  override_alertItemsController = self->_override_alertItemsController;
  if (override_alertItemsController)
  {
    id v3 = override_alertItemsController;
  }
  else
  {
    id v3 = +[SBAlertItemsController sharedInstance];
  }
  return v3;
}

- (SBApplicationController)_applicationController
{
  override_applicationController = self->_override_applicationController;
  if (override_applicationController)
  {
    id v3 = override_applicationController;
  }
  else
  {
    id v3 = +[SBApplicationController sharedInstanceIfExists];
  }
  return v3;
}

- (SBAssistantController)_assistantController
{
  override_assistantController = self->_override_assistantController;
  if (override_assistantController)
  {
    id v3 = override_assistantController;
  }
  else
  {
    id v3 = +[SBAssistantController sharedInstanceIfExists];
  }
  return v3;
}

- (SBCommandTabController)_commandTabController
{
  override_commandTabController = self->_override_commandTabController;
  if (override_commandTabController)
  {
    id v3 = override_commandTabController;
  }
  else
  {
    id v3 = +[SBCommandTabController sharedInstance];
  }
  return v3;
}

- (SBConferenceManager)_conferenceManager
{
  override_conferenceManager = self->_override_conferenceManager;
  if (override_conferenceManager)
  {
    id v3 = override_conferenceManager;
  }
  else
  {
    id v3 = +[SBConferenceManager sharedInstance];
  }
  return v3;
}

- (SBRemoteTransientOverlaySessionManager)_remoteTransientOverlaySessionManager
{
  override_remoteTransientOverlaySessionManager = self->_override_remoteTransientOverlaySessionManager;
  if (override_remoteTransientOverlaySessionManager)
  {
    id v3 = override_remoteTransientOverlaySessionManager;
  }
  else
  {
    id v3 = [(id)SBApp remoteTransientOverlaySessionManager];
  }
  return v3;
}

- (SBLockScreenManager)_lockScreenManager
{
  override_lockScreenManager = self->_override_lockScreenManager;
  if (override_lockScreenManager)
  {
    id v3 = override_lockScreenManager;
  }
  else
  {
    id v3 = +[SBLockScreenManager sharedInstanceIfExists];
  }
  return v3;
}

- (SBLockStateAggregator)_lockStateAggregator
{
  override_lockStateAggregator = self->_override_lockStateAggregator;
  if (override_lockStateAggregator)
  {
    id v3 = override_lockStateAggregator;
  }
  else
  {
    id v3 = +[SBLockStateAggregator sharedInstance];
  }
  return v3;
}

- (SBTelephonyManager)_telephonyManager
{
  override_telephonyManager = self->_override_telephonyManager;
  if (override_telephonyManager)
  {
    id v3 = override_telephonyManager;
  }
  else
  {
    id v3 = +[SBTelephonyManager sharedTelephonyManagerCreatingIfNecessary:0];
  }
  return v3;
}

- (SBMainWorkspace)_mainWorkspace
{
  override_mainWorkspace = self->_override_mainWorkspace;
  if (override_mainWorkspace)
  {
    id v3 = override_mainWorkspace;
  }
  else
  {
    id v3 = +[SBMainWorkspace sharedInstance];
  }
  return v3;
}

- (SBBannerManager)_bannerManager
{
  override_bannerManager = self->_override_bannerManager;
  if (override_bannerManager)
  {
    id v3 = override_bannerManager;
  }
  else
  {
    id v3 = [(id)SBApp bannerManager];
  }
  return v3;
}

- (BOOL)_hasFullySetUpUserWithExplanation:(id *)a3
{
  id v4 = [(SBMainDisplayPolicyAggregator *)self _setupManager];
  char v5 = [v4 isInSetupMode];

  if (v5)
  {
    id v6 = @"In setup mode";
  }
  else
  {
    id v7 = [(id)SBApp userSessionController];
    int v8 = [v7 isLoginSession];

    if (!v8) {
      return 1;
    }
    id v6 = @"In login session";
  }
  BOOL result = 0;
  if (a3) {
    *a3 = v6;
  }
  return result;
}

- (BOOL)_allowsCapabilitySuggestedApplicationWithExplanation:(id *)a3
{
  id v11 = 0;
  BOOL v5 = [(SBMainDisplayPolicyAggregator *)self _hasFullySetUpUserWithExplanation:&v11];
  id v6 = (__CFString *)v11;
  if (v5)
  {
    id v7 = [(SBMainDisplayPolicyAggregator *)self _lockScreenManager];
    int v8 = [v7 isInLostMode];

    if (!v8)
    {
      BOOL v9 = 1;
      goto LABEL_8;
    }

    id v6 = @"Device is in lost mode";
  }
  BOOL v9 = 0;
  if (a3 && v6)
  {
    id v6 = v6;
    BOOL v9 = 0;
    *a3 = v6;
  }
LABEL_8:

  return v9;
}

- (BOOL)_allowsCapabilityLockScreenBulletinWithExplanation:(id *)a3
{
  id v9 = 0;
  BOOL v4 = [(SBMainDisplayPolicyAggregator *)self _hasFullySetUpUserWithExplanation:&v9];
  id v5 = v9;
  if (v4)
  {
    BOOL v6 = 1;
  }
  else
  {
    int v7 = SUSUIRequiresAlertPresentationAfterUpdate();
    BOOL v6 = v7;
    if (a3 && !v7 && v5) {
      *a3 = v5;
    }
  }

  return v6;
}

- (BOOL)_allowsCapabilityUnlockToPluginSpecifiedApplicationWithExplanation:(id *)a3
{
  id v8 = 0;
  BOOL v4 = [(SBMainDisplayPolicyAggregator *)self _hasFullySetUpUserWithExplanation:&v8];
  id v5 = v8;
  BOOL v6 = v5;
  if (a3 && !v4 && v5) {
    *a3 = v5;
  }

  return v4;
}

- (BOOL)_allowsCapabilityAssistantEnabledWithExplanation:(id *)a3
{
  id v5 = +[SBDefaults localDefaults];
  BOOL v6 = [v5 lockScreenDefaults];
  char v7 = [v6 limitFeaturesForRemoteLock];

  if (v7)
  {
    id v8 = @"features limited for remote lock";
  }
  else
  {
    id v14 = 0;
    BOOL v9 = [(SBMainDisplayPolicyAggregator *)self _hasFullySetUpUserWithExplanation:&v14];
    id v8 = (__CFString *)v14;
    if (v9)
    {
      v10 = [(SBMainDisplayPolicyAggregator *)self _assistantController];
      char v11 = [v10 isEnabled];

      if (v11)
      {
        BOOL v12 = 1;
        goto LABEL_10;
      }

      id v8 = @"Assistant not supported or disabled";
    }
  }
  BOOL v12 = 0;
  if (a3 && v8)
  {
    id v8 = v8;
    BOOL v12 = 0;
    *a3 = v8;
  }
LABEL_10:

  return v12;
}

- (BOOL)_allowsCapabilityAssistantWithExplanation:(id *)a3
{
  id v26 = 0;
  BOOL v5 = [(SBMainDisplayPolicyAggregator *)self _allowsCapabilityAssistantEnabledWithExplanation:&v26];
  BOOL v6 = (__CFString *)v26;
  char v7 = [(SBMainDisplayPolicyAggregator *)self _lockScreenManager];
  id v8 = v7;
  if (!v5)
  {
    BOOL v13 = 0;
    goto LABEL_17;
  }
  BOOL v9 = [v7 lockScreenEnvironment];
  v10 = [v9 callController];
  char v11 = [v10 isMakingEmergencyCall];

  if (v11)
  {
    BOOL v12 = @"Making an emergency call";
LABEL_16:

    BOOL v13 = 0;
    BOOL v6 = v12;
    goto LABEL_17;
  }
  if (+[SBVoiceDisabledBundles voiceControlDisabledByCurrentlyRunningApp])
  {
    BOOL v12 = @"Voice control disabled by current application";
    goto LABEL_16;
  }
  id v14 = [(SBMainDisplayPolicyAggregator *)self _remoteTransientOverlaySessionManager];
  int v15 = [v14 hasSessionWithPendingButtonEvents:1 options:0];

  if (v15)
  {
    BOOL v12 = [NSString stringWithFormat:@"Has a remote transient overlay session handling lock button press."];
    goto LABEL_16;
  }
  v16 = [(SBMainDisplayPolicyAggregator *)self _alertItemsController];
  int v17 = [v16 hasVisibleSuperModalAlert];

  if (v17)
  {
    BOOL v12 = @"Super modal alert visible";
    goto LABEL_16;
  }
  if ([v8 isUILocked])
  {
    v18 = [v8 coverSheetViewController];
    v19 = [v18 activeBehavior];
    char v20 = [v19 areRestrictedCapabilities:2];

    if (v20)
    {
      BOOL v12 = @"Lock screen has has disabled assistant";
      goto LABEL_16;
    }
  }
  v21 = [(SBMainDisplayPolicyAggregator *)self _mainWorkspace];
  v22 = [v21 transientOverlayPresentationManager];
  int v23 = [v22 shouldDisableSiri];

  if (v23)
  {
    BOOL v12 = @"Transient overlay has disabled assistant";
    goto LABEL_16;
  }
  BOOL v13 = 1;
LABEL_17:
  v24 = [(id)SBApp lockOutController];
  if ([v24 isThermallyBlocked])
  {

    BOOL v13 = 0;
    BOOL v6 = @"Thermal trap has disabled assistant";
  }
  if ([v24 isLiquidDetectionCriticalUIBlocked])
  {

    BOOL v13 = 0;
    BOOL v6 = @"Liquid detection critical ui has disabled assistant";
  }
  if ([v24 isProximityReaderBlocked])
  {

    BOOL v13 = 0;
    BOOL v6 = @"Proximity reader has disabled assistant";
  }
  if (a3 && !v13 && v6) {
    *a3 = v6;
  }

  return v13;
}

- (BOOL)_allowsCapabilitySendMediaCommandWithExplanation:(id *)a3
{
  id v8 = 0;
  BOOL v4 = [(SBMainDisplayPolicyAggregator *)self _hasFullySetUpUserWithExplanation:&v8];
  id v5 = v8;
  BOOL v6 = v5;
  if (a3 && !v4 && v5) {
    *a3 = v5;
  }

  return v4;
}

- (BOOL)_allowsCapabilitySystemGestureWithExplanation:(id *)a3
{
  id v12 = 0;
  BOOL v5 = [(SBMainDisplayPolicyAggregator *)self _hasFullySetUpUserWithExplanation:&v12];
  BOOL v6 = (__CFString *)v12;
  char v7 = v6;
  if (v5)
  {
    if (!self->_storeDemoAppLockEnabled)
    {
LABEL_6:
      BOOL v10 = 1;
      goto LABEL_10;
    }

    char v7 = @"We are in store demo app lock mode";
  }
  id v8 = [MEMORY[0x1E4F5AD18] standardDefaults];
  int v9 = [v8 shouldAlwaysBeEnabled];

  if (v9)
  {

    char v7 = 0;
    goto LABEL_6;
  }
  BOOL v10 = 0;
  if (a3 && v7)
  {
    char v7 = v7;
    BOOL v10 = 0;
    *a3 = v7;
  }
LABEL_10:

  return v10;
}

- (BOOL)_allowsCapabilityVoiceControlWithExplanation:(id *)a3
{
  BOOL v5 = [(SBMainDisplayPolicyAggregator *)self _lockScreenManager];
  id v29 = 0;
  BOOL v6 = [(SBMainDisplayPolicyAggregator *)self _hasFullySetUpUserWithExplanation:&v29];
  char v7 = (__CFString *)v29;
  if (v6)
  {
    if (MGGetBoolAnswer())
    {
      id v8 = [(SBMainDisplayPolicyAggregator *)self _assistantController];
      char v9 = [v8 isEnabled];

      if (v9)
      {
        BOOL v10 = v7;
        char v7 = @"Siri is supported and enabled";
      }
      else
      {
        BOOL v13 = [(SBLocalDefaults *)self->_defaults lockScreenDefaults];
        char v14 = [v13 limitFeaturesForRemoteLock];

        if (v14)
        {
          BOOL v10 = v7;
          char v7 = @"We are disabled for remote lock";
        }
        else if (+[SBVoiceDisabledBundles voiceControlDisabledByCurrentlyRunningApp])
        {
          BOOL v10 = v7;
          char v7 = @"Disabled by the currently running app";
        }
        else
        {
          BOOL v10 = [(SBMainDisplayPolicyAggregator *)self _telephonyManager];
          if (([v10 inCall] & 1) != 0 || objc_msgSend(v10, "incomingCallExists"))
          {
            int v15 = NSString;
            [v10 inCall];
            v16 = NSStringFromBOOL();
            [v10 incomingCallExists];
            int v17 = NSStringFromBOOL();
            uint64_t v18 = [v15 stringWithFormat:@"We are inCall: %@ incomingCall: %@", v16, v17];

            char v7 = (__CFString *)v18;
          }
          else
          {

            v19 = [(SBMainDisplayPolicyAggregator *)self _conferenceManager];
            char v20 = [v19 inFaceTime];

            if (v20)
            {
              BOOL v10 = v7;
              char v7 = @"We are in a FaceTime call";
            }
            else
            {
              v21 = [(SBMainDisplayPolicyAggregator *)self _alertItemsController];
              char v22 = [v21 hasVisibleSuperModalAlert];

              if (v22)
              {
                BOOL v10 = v7;
                char v7 = @"Super modal alert visible";
              }
              else if ([v5 isUILocked] {
                     && ([v5 coverSheetViewController],
              }
                         int v23 = objc_claimAutoreleasedReturnValue(),
                         [v23 activeBehavior],
                         v24 = objc_claimAutoreleasedReturnValue(),
                         char v25 = [v24 areRestrictedCapabilities:2],
                         v24,
                         v23,
                         (v25 & 1) != 0))
              {
                BOOL v10 = v7;
                char v7 = @"Lock screen has has disabled voice control";
              }
              else
              {
                id v26 = [(SBMainDisplayPolicyAggregator *)self _mainWorkspace];
                uint64_t v27 = [v26 transientOverlayPresentationManager];
                int v28 = [v27 shouldDisableSiri];

                if (!v28)
                {
                  BOOL v11 = 1;
                  goto LABEL_10;
                }
                BOOL v10 = v7;
                char v7 = @"Transient overlay has disabled voice control";
              }
            }
          }
        }
      }
    }
    else
    {
      BOOL v10 = v7;
      char v7 = @"MG says the device doesn't have the VC capability";
    }
  }
  BOOL v11 = 0;
  if (a3 && v7)
  {
    char v7 = v7;
    BOOL v11 = 0;
    *a3 = v7;
  }
LABEL_10:

  return v11;
}

- (BOOL)_allowsCapabilitySpotlightWithExplanation:(id *)a3
{
  BOOL v5 = [(SBMainDisplayPolicyAggregator *)self _profileConnection];
  int v6 = [v5 isSpotlightAllowed];

  if (v6)
  {
    id v10 = 0;
    BOOL v7 = [(SBMainDisplayPolicyAggregator *)self _hasFullySetUpUserWithExplanation:&v10];
    id v8 = (__CFString *)v10;
    if (!a3) {
      goto LABEL_8;
    }
  }
  else
  {
    BOOL v7 = 0;
    id v8 = @"ManagedConfiguration policy states: no spotlight";
    if (!a3) {
      goto LABEL_8;
    }
  }
  if (!v7 && v8) {
    *a3 = v8;
  }
LABEL_8:

  return v7;
}

- (BOOL)_allowsCapabilityLockScreenCameraSupportedWithExplanation:(id *)a3
{
  hasCameraCapability = self->_hasCameraCapability;
  if (hasCameraCapability)
  {
    int v6 = (__CFBoolean *)*MEMORY[0x1E4F1CFD0];
  }
  else
  {
    int v7 = MGGetBoolAnswer();
    int v6 = (__CFBoolean *)*MEMORY[0x1E4F1CFD0];
    hasCameraCapability = (__CFBoolean *)*MEMORY[0x1E4F1CFC8];
    if (v7) {
      hasCameraCapability = (__CFBoolean *)*MEMORY[0x1E4F1CFD0];
    }
    self->_hasCameraCapability = hasCameraCapability;
  }
  if (hasCameraCapability != v6)
  {
    BOOL v8 = 0;
    char v9 = @"MG says the device doesn't have the camera capability";
    if (!a3) {
      return v8;
    }
    goto LABEL_13;
  }
  id v10 = [(SBMainDisplayPolicyAggregator *)self _applicationController];
  BOOL v11 = [v10 cameraApplication];

  BOOL v8 = v11 != 0;
  if (v11) {
    char v9 = 0;
  }
  else {
    char v9 = @"The device doesn't have Camera.app.";
  }

  if (a3)
  {
LABEL_13:
    if (v9 && !v8) {
      *a3 = v9;
    }
  }
  return v8;
}

- (BOOL)_allowsCapabilityLockScreenCameraWithExplanation:(id *)a3
{
  BOOL v4 = [(id)SBApp lockOutController];
  id v21 = 0;
  BOOL v5 = [(SBMainDisplayPolicyAggregator *)self _hasFullySetUpUserWithExplanation:&v21];
  id v19 = v21;
  int v6 = [(id)SBApp userSessionController];
  uint64_t v7 = [v6 sessionType];

  char v8 = [(SBMainDisplayPolicyAggregator *)self allowsCapability:10];
  unsigned int v9 = [v4 isBlocked];
  id v10 = [(SBMainDisplayPolicyAggregator *)self _applicationController];
  BOOL v11 = v10;
  if (v10)
  {
    id v12 = [v10 restrictionController];
    unsigned int v13 = [v12 isApplicationIdentifierRestricted:@"com.apple.camera"];
  }
  else
  {
    unsigned int v13 = 0;
  }
  char v14 = [(id)SBApp authenticationController];
  unsigned __int8 v15 = [v14 hasAuthenticatedAtLeastOnceSinceBoot];

  unsigned __int8 v16 = v5 & ~(v13 | ~v8 | v9);
  if (v7 == 2) {
    unsigned __int8 v16 = 0;
  }
  char v17 = v16 & v15;
  if (a3 && (v16 & v15 & 1) == 0)
  {
    [NSString stringWithFormat:@"lockScreenCameraSupported: %d, cameraRestricted: %d, currently blocked: %d (thermal blocked: %d), isUserFullySetUp: %d, userSetUpExplanation: \"%@\", ephemeral multi-user: %d", -[SBMainDisplayPolicyAggregator allowsCapability:](self, "allowsCapability:", 10), v13, v9, objc_msgSend(v4, "isThermallyBlocked"), v5, v19, v7 == 2];
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v17;
}

- (BOOL)_allowsNotificationOrControlCenterWithExplanation:(id *)a3
{
  id v18 = 0;
  BOOL v5 = [(SBMainDisplayPolicyAggregator *)self _hasFullySetUpUserWithExplanation:&v18];
  int v6 = (__CFString *)v18;
  if (v5)
  {
    uint64_t v7 = [(id)SBApp lockOutController];
    char v8 = [v7 isBlocked];

    if (v8)
    {
      unsigned int v9 = @"Device is blocked";
    }
    else
    {
      id v10 = +[SBAlertItemsController sharedInstance];
      char v11 = [v10 hasVisibleModalAlert];

      if (v11)
      {
        unsigned int v9 = @"A modal alert item is showing";
      }
      else
      {
        id v12 = [(SBMainDisplayPolicyAggregator *)self _lockScreenManager];
        char v13 = [v12 isInLostMode];

        if (v13)
        {
          unsigned int v9 = @"Device is in lost mode";
        }
        else
        {
          char v14 = [(SBMainDisplayPolicyAggregator *)self _commandTabController];
          char v15 = [v14 isVisible];

          if (v15)
          {
            unsigned int v9 = @"Command-Tab is visible";
          }
          else
          {
            if (![(SBMainDisplayPolicyAggregator *)self _dictationInfoOnScreen])
            {
              BOOL v16 = 1;
              goto LABEL_16;
            }
            unsigned int v9 = @"The dictation presentation window is being displayed above CoverSheet";
          }
        }
      }
    }

    int v6 = v9;
  }
  BOOL v16 = 0;
  if (a3 && v6)
  {
    int v6 = v6;
    BOOL v16 = 0;
    *a3 = v6;
  }
LABEL_16:

  return v16;
}

- (BOOL)_allowsCapabilityCoverSheetWithExplanation:(id *)a3
{
  id v16 = 0;
  BOOL v5 = [(SBMainDisplayPolicyAggregator *)self _allowsNotificationOrControlCenterWithExplanation:&v16];
  int v6 = (__CFString *)v16;
  if (v5)
  {
    uint64_t v7 = [(id)SBApp bannerManager];
    char v8 = [(id)SBApp windowSceneManager];
    unsigned int v9 = [v8 windowSceneForDisplayIdentity:self->_displayIdentity];
    char v10 = [v7 isDisplayingBannerInWindowScene:v9];

    if (v10)
    {
      char v11 = @"The banner manager is presenting a banner on the embedded display.";
    }
    else
    {
      id v12 = +[SBIconController sharedInstance];
      int v13 = [v12 areAnyIconViewContextMenusShowing];

      if (!v13)
      {
        BOOL v14 = 1;
        goto LABEL_11;
      }
      char v11 = @"Icon force touch is peeking or showing.";
    }

    int v6 = v11;
  }
  BOOL v14 = 0;
  if (a3 && v6)
  {
    int v6 = v6;
    BOOL v14 = 0;
    *a3 = v6;
  }
LABEL_11:

  return v14;
}

- (BOOL)_allowsCapabilityDismissCoverSheetWithExplanation:(id *)a3
{
  BOOL v5 = [(SBMainDisplayPolicyAggregator *)self _lockScreenManager];
  int v6 = [v5 isUILocked];

  if (!v6) {
    return 1;
  }
  uint64_t v7 = [(SBMainDisplayPolicyAggregator *)self _lockScreenManager];
  char v8 = [v7 coverSheetViewController];
  unsigned int v9 = [v8 activeBehavior];

  if ([v9 areRestrictedCapabilities:4096])
  {
    char v10 = @"Lock screen prevents cover sheet dismiss";
    goto LABEL_6;
  }
  if (([v9 areRestrictedCapabilities:56] & 1) == 0)
  {

    return 1;
  }
  char v10 = @"Lock screen prevents unlock";
LABEL_6:

  BOOL result = 0;
  if (a3) {
    *a3 = v10;
  }
  return result;
}

- (BOOL)_allowsCapabilityControlCenterWithExplanation:(id *)a3
{
  BOOL v5 = [(SBMainDisplayPolicyAggregator *)self _profileConnection];
  int v6 = [v5 isControlCenterAllowed];

  if (v6)
  {
    id v16 = 0;
    BOOL v7 = [(SBMainDisplayPolicyAggregator *)self _allowsNotificationOrControlCenterWithExplanation:&v16];
    char v8 = (__CFString *)v16;
    if (v7)
    {
      unsigned int v9 = [(id)SBApp notificationDispatcher];
      char v10 = [v9 bannerDestination];
      int v11 = [v10 isPresentingBannerInLongLook];

      if (!v11)
      {
LABEL_8:
        BOOL v14 = 1;
        goto LABEL_12;
      }

      char v8 = @"Banner destination is presenting long look";
    }
  }
  else
  {
    char v8 = @"ManagedConfiguration policy states: no control center";
  }
  id v12 = [MEMORY[0x1E4F5AD18] standardDefaults];
  int v13 = [v12 shouldAlwaysBeEnabled];

  if (v13)
  {

    char v8 = 0;
    goto LABEL_8;
  }
  BOOL v14 = 0;
  if (a3 && v8)
  {
    char v8 = v8;
    BOOL v14 = 0;
    *a3 = v8;
  }
LABEL_12:

  return v14;
}

- (BOOL)_allowsCapabilityLogoutWithExplanation:(id *)a3
{
  BOOL v5 = [(SBMainDisplayPolicyAggregator *)self _lockScreenManager];
  int v6 = [v5 isInLostMode];

  BOOL v7 = [(id)SBApp userSessionController];
  char v8 = [v7 isLoginSession];

  if (v8)
  {
    unsigned int v9 = @"In login session";
  }
  else
  {
    char v10 = [(id)SBApp userSessionController];
    int v11 = [v10 isMultiUserSupported];

    if (v11)
    {
      id v12 = [(SBMainDisplayPolicyAggregator *)self _profileConnection];
      int v13 = [v12 isInSingleAppMode];

      if ((v13 ^ 1 | v6)) {
        return 1;
      }
      unsigned int v9 = @"Device is in Single App Mode";
    }
    else
    {
      unsigned int v9 = @"Device not configured for multiuser";
    }
  }
  BOOL result = 0;
  if (a3) {
    *a3 = v9;
  }
  return result;
}

- (BOOL)_allowsCapabilityLoginWindowWithExplanation:(id *)a3
{
  BOOL v4 = [(id)SBApp userSessionController];
  int v5 = [v4 isMultiUserSupported];

  if (v5)
  {
    int v6 = [(id)SBApp userSessionController];
    char v7 = [v6 isLoginSession];

    if (v7) {
      return 1;
    }
    unsigned int v9 = @"Current session is not a login session";
  }
  else
  {
    unsigned int v9 = @"Device not configured for multiuser";
  }
  BOOL result = 0;
  if (a3) {
    *a3 = v9;
  }
  return result;
}

- (BOOL)_allowsCapabilityControlCenterEditingWithExplanation:(id *)a3
{
  int v5 = [(id)SBApp authenticationController];
  int v6 = [v5 hasAuthenticatedAtLeastOnceSinceBoot];

  if (v6)
  {
    char v7 = [(SBMainDisplayPolicyAggregator *)self _profileConnection];
    int v8 = [v7 isHomeScreenEditingAllowed];

    if (v8)
    {
      unsigned int v9 = [(id)SBApp userSessionController];
      uint64_t v10 = [v9 sessionType];

      if (v10 == 2)
      {
        int v11 = @"Not available to ephemeral user sessions";
      }
      else
      {
        id v12 = [(SBMainDisplayPolicyAggregator *)self _profileConnection];
        int v13 = [v12 restrictionEnforcedHomeScreenLayout];

        if (v13)
        {
          int v11 = @"Device has enforced home screen layout";
        }
        else
        {
          if (![MEMORY[0x1E4F42738] isRunningInStoreDemoMode]) {
            return 1;
          }
          char v15 = +[SBDefaults externalDefaults];
          id v16 = [v15 demoDefaults];
          int v17 = [v16 shouldLockIconsInStoreDemoMode];

          if (!v17) {
            return 1;
          }
          int v11 = @"Device is in store demo mode";
        }
      }
    }
    else
    {
      int v11 = @"ManagedConfiguration policy states: no home screen editing";
    }
  }
  else
  {
    int v11 = @"Haven't unlocked the device yet after a reboot.";
  }
  BOOL result = 0;
  if (a3) {
    *a3 = v11;
  }
  return result;
}

- (BOOL)_allowsCapabilityHomeScreenEditingWithExplanation:(id *)a3
{
  int v5 = [(id)SBApp windowSceneManager];
  int v6 = [v5 windowSceneForDisplayIdentity:self->_displayIdentity];

  char v7 = [v6 switcherController];
  uint64_t v8 = [v7 unlockedEnvironmentMode];
  unsigned int v9 = [(SBMainDisplayPolicyAggregator *)self _profileConnection];
  int v10 = [v9 isHomeScreenEditingAllowed];

  if (v10)
  {
    int v11 = [(id)SBApp userSessionController];
    uint64_t v12 = [v11 sessionType];

    if (v12 == 2)
    {
      int v13 = @"Not available to ephemeral user sessions";
    }
    else
    {
      BOOL v14 = [(SBMainDisplayPolicyAggregator *)self _profileConnection];
      char v15 = [v14 restrictionEnforcedHomeScreenLayout];

      if (v15)
      {
        int v13 = @"Device has enforced home screen layout";
      }
      else if ([MEMORY[0x1E4F42738] isRunningInStoreDemoMode] {
             && (+[SBDefaults externalDefaults],
      }
                 id v18 = objc_claimAutoreleasedReturnValue(),
                 [v18 demoDefaults],
                 id v19 = objc_claimAutoreleasedReturnValue(),
                 char v20 = [v19 shouldLockIconsInStoreDemoMode],
                 v19,
                 v18,
                 (v20 & 1) != 0))
      {
        int v13 = @"Device is in store demo mode";
      }
      else if (v8 == 3)
      {
        int v13 = @"App is open";
      }
      else if ([v7 isInAnyPeekState])
      {
        int v13 = @"Peek is showing";
      }
      else if (v8 == 2)
      {
        int v13 = @"App Switcher is open";
      }
      else
      {
        id v21 = +[SBIconController sharedInstanceIfExists];
        char v22 = [v21 iconManager];
        int v23 = [v22 isShowingPullDownSearchOrTransitioningToVisible];

        if (!v23)
        {
          BOOL v16 = 1;
          goto LABEL_9;
        }
        int v13 = @"Spotlight is visible";
      }
    }
  }
  else
  {
    int v13 = @"ManagedConfiguration policy states: no home screen editing";
  }
  BOOL v16 = 0;
  if (a3) {
    *a3 = v13;
  }
LABEL_9:

  return v16;
}

- (BOOL)_allowsCapabilityScreenshotWithExplanation:(id *)a3
{
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __76__SBMainDisplayPolicyAggregator__allowsCapabilityScreenshotWithExplanation___block_invoke;
  v16[3] = &__block_descriptor_40_e18_v16__0__NSString_8l;
  v16[4] = a3;
  BOOL v4 = (void (**)(void, void))MEMORY[0x1D948C7A0](v16, a2);
  int v5 = [(SBMainDisplayPolicyAggregator *)self _profileConnection];
  int v6 = [v5 BOOLRestrictionForFeature:*MEMORY[0x1E4F74148]];

  if (v6 == 2)
  {
    char v7 = @"ManagedConfiguration policy states: no screen shots allowed";
LABEL_10:
    ((void (**)(void, __CFString *))v4)[2](v4, v7);
    BOOL v14 = 0;
    goto LABEL_11;
  }
  uint64_t v8 = [(id)SBApp userSessionController];
  if ([v8 isLoginSession])
  {
    unsigned int v9 = +[SBDefaults localDefaults];
    int v10 = [v9 applicationDefaults];
    int v11 = [v10 shouldAllowScreenshotsInLoginWindow];

    if (!v11)
    {
      char v7 = @"Snapshotting unavailable at the login window.";
      goto LABEL_10;
    }
  }
  else
  {
  }
  uint64_t v12 = [(id)SBApp authenticationController];
  char v13 = [v12 hasAuthenticatedAtLeastOnceSinceBoot];

  if ((v13 & 1) == 0)
  {
    char v7 = @"Haven't unlocked the device yet after a reboot.";
    goto LABEL_10;
  }
  BOOL v14 = 1;
LABEL_11:

  return v14;
}

void **__76__SBMainDisplayPolicyAggregator__allowsCapabilityScreenshotWithExplanation___block_invoke(void **result, id a2)
{
  if (result[4])
  {
    id v2 = result;
    BOOL result = (void **)a2;
    *v2[4] = result;
  }
  return result;
}

- (BOOL)_allowsCapabilityCommandTabWithExplanation:(id *)a3
{
  int v5 = [(SBMainDisplayPolicyAggregator *)self _profileConnection];
  int v6 = [v5 isCommandTabAllowed];

  if (v6)
  {
    char v7 = [(id)SBApp modalAlertPresentationCoordinator];
    char v8 = [v7 isShowingModalAlert];

    if (v8)
    {
      unsigned int v9 = @"Can't use command-tab while a mini alert is visible.";
    }
    else
    {
      int v11 = [(SBMainDisplayPolicyAggregator *)self _lockStateAggregator];
      char v12 = [v11 hasAnyLockState];

      if (v12)
      {
        unsigned int v9 = @"Can't use command-tab while locked.";
      }
      else
      {
        char v13 = [(SBMainDisplayPolicyAggregator *)self _setupManager];
        int v14 = [v13 isInSetupMode];

        if (!v14) {
          return 1;
        }
        unsigned int v9 = @"Can't use command-tab while in buddy mode.";
      }
    }
  }
  else
  {
    unsigned int v9 = @"ManagedConfiguration policy states: no command-tab allowed";
  }
  BOOL result = 0;
  if (a3) {
    *a3 = v9;
  }
  return result;
}

- (BOOL)_allowsCapabilityLockScreenControlCenterWithExplanation:(id *)a3
{
  int v5 = [(SBMainDisplayPolicyAggregator *)self _profileConnection];
  int v6 = [v5 isControlCenterAllowed];

  if (v6)
  {
    char v7 = [(id)SBApp authenticationController];
    char v8 = [v7 isAuthenticated];

    if ((v8 & 1) != 0
      || ([(SBMainDisplayPolicyAggregator *)self _profileConnection],
          unsigned int v9 = objc_claimAutoreleasedReturnValue(),
          int v10 = [v9 isLockScreenControlCenterAllowed],
          v9,
          v10))
    {
      int v11 = [(id)SBApp authenticationController];
      char v12 = [v11 hasAuthenticatedAtLeastOnceSinceBoot];

      if (v12) {
        return 1;
      }
      int v14 = @"Haven't unlocked the device yet after a reboot.";
    }
    else
    {
      int v14 = @"ManagedConfiguration policy states: no control center on the lock screen.";
    }
  }
  else
  {
    int v14 = @"ManagedConfiguration policy states: no control center";
  }
  BOOL result = 0;
  if (a3) {
    *a3 = v14;
  }
  return result;
}

- (BOOL)_allowsCapabilityLockScreenNotificationCenterWithExplanation:(id *)a3
{
  int v5 = [(id)SBApp authenticationController];
  char v6 = [v5 isAuthenticated];

  if ((v6 & 1) != 0
    || ([(SBMainDisplayPolicyAggregator *)self _profileConnection],
        char v7 = objc_claimAutoreleasedReturnValue(),
        int v8 = [v7 effectiveBoolValueForSetting:*MEMORY[0x1E4F740A0]],
        v7,
        v8 != 2))
  {
    int v10 = [(id)SBApp authenticationController];
    char v11 = [v10 hasAuthenticatedAtLeastOnceSinceBoot];

    if (v11) {
      return 1;
    }
    unsigned int v9 = @"Haven't unlocked the device yet after a reboot.";
  }
  else
  {
    unsigned int v9 = @"ManagedConfiguration policy states: no notifications view on the lock screen.";
  }
  BOOL result = 0;
  if (a3) {
    *a3 = v9;
  }
  return result;
}

- (BOOL)_allowsCapabilityLockScreenTodayViewWithExplanation:(id *)a3
{
  BOOL v5 = -[SBMainDisplayPolicyAggregator _allowsCapabilityTodayViewWithExplanation:](self, "_allowsCapabilityTodayViewWithExplanation:");
  if (v5)
  {
    char v6 = [(id)SBApp authenticationController];
    char v7 = [v6 isAuthenticated];

    if ((v7 & 1) != 0
      || ([(SBMainDisplayPolicyAggregator *)self _profileConnection],
          int v8 = objc_claimAutoreleasedReturnValue(),
          int v9 = [v8 effectiveBoolValueForSetting:*MEMORY[0x1E4F740A8]],
          v8,
          v9 != 2))
    {
      char v11 = [(id)SBApp authenticationController];
      int v12 = [v11 hasAuthenticatedAtLeastOnceSinceBoot];

      if (v12)
      {
        char v13 = [(id)SBApp userSessionController];
        uint64_t v14 = [v13 sessionType];

        if (v14 != 2)
        {
          LOBYTE(v5) = 1;
          return v5;
        }
        int v10 = @"No today view on shared iPad.";
      }
      else
      {
        int v10 = @"Haven't unlocked the device yet after a reboot.";
      }
    }
    else
    {
      int v10 = @"ManagedConfiguration policy states: no today view on the lock screen.";
    }
    LOBYTE(v5) = 0;
    if (a3) {
      *a3 = v10;
    }
  }
  return v5;
}

- (BOOL)_allowsCapabilityTodayViewWithExplanation:(id *)a3
{
  BOOL v4 = [(SBMainDisplayPolicyAggregator *)self _profileConnection];
  int v5 = [v4 effectiveBoolValueForSetting:*MEMORY[0x1E4F74180]];

  if (v5 == 2 && a3 != 0) {
    *a3 = @"ManagedConfiguration policy states: no today view.";
  }
  return v5 != 2;
}

- (BOOL)_allowsCapabilityLiftToWakeWithExplanation:(id *)a3
{
  BOOL v4 = [(SBMainDisplayPolicyAggregator *)self _lockScreenManager];
  int v5 = [v4 isInLostMode];

  if (a3 && v5) {
    *a3 = @"Device is in lost mode";
  }
  return v5 ^ 1;
}

- (BOOL)_allowsCapabilityQuickNoteWithExplanation:(id *)a3
{
  BOOL v4 = +[SBDefaults externalDefaults];
  int v5 = [v4 notesDefaults];
  char v6 = [v5 quickNotesDisabled];

  if (v6)
  {
    BOOL v7 = 0;
    int v8 = @"Disabled by Notes pref.";
    if (!a3) {
      return v7;
    }
    goto LABEL_15;
  }
  if (!MGGetBoolAnswer())
  {
    BOOL v7 = 0;
    int v8 = @"Device does not support pencil.";
    if (!a3) {
      return v7;
    }
    goto LABEL_15;
  }
  int v9 = [(id)SBApp authenticationController];
  int v10 = [v9 hasAuthenticatedAtLeastOnceSinceBoot];

  if (!v10)
  {
    BOOL v7 = 0;
    int v8 = @"Haven't unlocked the device yet after a reboot.";
    if (!a3) {
      return v7;
    }
    goto LABEL_15;
  }
  char v11 = +[SBApplicationController sharedInstance];
  int v12 = [v11 notesApplication];

  if (v12 && ![v12 isUninstalled])
  {
    int v8 = 0;
    BOOL v7 = 1;
  }
  else
  {
    BOOL v7 = 0;
    int v8 = @"Notes app is uninstalled.";
  }

  if (a3)
  {
LABEL_15:
    if (v8 && !v7) {
      *a3 = v8;
    }
  }
  return v7;
}

- (BOOL)_allowsCapabilityCoverSheetSpotlightWithExplanation:(id *)a3
{
  int v5 = _os_feature_enabled_impl();
  BOOL v6 = [(SBMainDisplayPolicyAggregator *)self _allowsCapabilitySpotlightWithExplanation:a3];
  BOOL v7 = [(SBMainDisplayPolicyAggregator *)self _allowsCapabilityLockScreenTodayViewWithExplanation:a3];
  if (a3 && (v5 & 1) == 0)
  {
    int v8 = @"Feature not enabled.";
    if (v5) {
      int v8 = 0;
    }
    *a3 = v8;
  }
  return v7 & v5 & v6;
}

- (BOOL)_allowsCapabilityPosterSwitcherWithExplanation:(id *)a3
{
  if (CSAutobahnEnabledForPlatform())
  {
    if (!SBGuidedAccessIsActive()) {
      return 1;
    }
    BOOL v4 = @"Guided access is active.";
  }
  else
  {
    BOOL v4 = @"Feature not enabled.";
  }
  BOOL result = 0;
  if (a3) {
    *a3 = v4;
  }
  return result;
}

- (BOOL)_dictationInfoOnScreen
{
  int v2 = _dictationInfoOnScreen_token;
  if (_dictationInfoOnScreen_token == -1)
  {
    notify_register_check((const char *)*MEMORY[0x1E4F43AB0], &_dictationInfoOnScreen_token);
    int v2 = _dictationInfoOnScreen_token;
  }
  uint64_t state64 = 0;
  notify_get_state(v2, &state64);
  return state64 & 1;
}

- (void)_setProfileConnection:(id)a3
{
}

- (void)_setSetupManager:(id)a3
{
}

- (void)_setAlertItemsController:(id)a3
{
}

- (void)_setApplicationController:(id)a3
{
}

- (void)_setAssistantController:(id)a3
{
}

- (void)_setCommandTabController:(id)a3
{
}

- (void)_setConferenceManager:(id)a3
{
}

- (void)_setRemoteTransientOverlaySessionManager:(id)a3
{
}

- (void)_setLockScreenManager:(id)a3
{
}

- (void)_setLockStateAggregator:(id)a3
{
}

- (void)_setTelephonyManager:(id)a3
{
}

- (void)_setMainWorkspace:(id)a3
{
}

- (void)_setBannerManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayIdentity, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_override_bannerManager, 0);
  objc_storeStrong((id *)&self->_override_mainWorkspace, 0);
  objc_storeStrong((id *)&self->_override_telephonyManager, 0);
  objc_storeStrong((id *)&self->_override_lockStateAggregator, 0);
  objc_storeStrong((id *)&self->_override_lockScreenManager, 0);
  objc_storeStrong((id *)&self->_override_remoteTransientOverlaySessionManager, 0);
  objc_storeStrong((id *)&self->_override_conferenceManager, 0);
  objc_storeStrong((id *)&self->_override_commandTabController, 0);
  objc_storeStrong((id *)&self->_override_assistantController, 0);
  objc_storeStrong((id *)&self->_override_applicationController, 0);
  objc_storeStrong((id *)&self->_override_alertItemsController, 0);
  objc_storeStrong((id *)&self->_override_setupManager, 0);
  objc_storeStrong((id *)&self->_override_profileConnection, 0);
}

@end