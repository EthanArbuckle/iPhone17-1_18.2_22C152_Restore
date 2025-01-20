@interface SBSystemUIScenesCoordinator
+ (BOOL)_isSystemUISceneBoundClient:(id)a3;
+ (BOOL)_isSystemUISceneDynamicClient:(id)a3 withSceneRequestOptions:(id)a4;
+ (BOOL)shouldHandleSceneRequestsForProcess:(id)a3 withOptions:(id)a4;
+ (id)_configurationForSystemUISceneSessionRoles;
+ (id)_sceneControllersConfigurations;
+ (id)_systemUISceneBoundProcessIdentities;
+ (id)_systemUISceneSessionRoles;
- (BOOL)enumerateScenesWithBlock:(id)a3;
- (SBAccessibilityUIServerUISceneController)accessibilityUIServerUISceneController;
- (SBAssistiveTouchUISceneController)assistiveTouchUISceneController;
- (SBCameraOverlayUISceneController)cameraOverlayUISceneController;
- (SBDruidUISceneController)druidUISceneController;
- (SBEnsembleUISceneController)ensembleUISceneController;
- (SBEyedropperUISceneController)eyedropperUISceneController;
- (SBFullKeyboardAccessUISceneController)fullKeyboardAccessUISceneController;
- (SBInputUISceneController)inputUISceneController;
- (SBInternalPerfPowerHUDSceneController)internalPerfPowerHUDUISceneController;
- (SBLiveTranscriptionUISceneController)liveTranscriptionUISceneController;
- (SBMagnifierUISceneController)magnifierUISceneController;
- (SBMomentsUISceneController)momentsUISceneController;
- (SBOverlayUISceneController)overlayUISceneController;
- (SBPerfPowerHUDSceneController)perfPowerHUDUISceneController;
- (SBPrototypeToolsSceneController)prototypeToolsSceneController;
- (SBProximityReaderUISceneController)proximityReaderUISceneController;
- (SBSystemUIScenesCoordinator)init;
- (SBVoiceControlUISceneController)voiceControlUISceneController;
- (double)_levelForClientConfiguration:(id)a3;
- (id)_newDefaultPresenterForWindowScene:(id)a3 configuration:(id)a4;
- (id)sceneFromIdentityToken:(id)a3;
- (id)sceneFromIdentityTokenStringRepresentation:(id)a3;
- (id)sceneWorkspaceControllerForProcessIdentity:(id)a3;
- (void)_completeWindowSceneClientsConfiguration;
- (void)_createSceneWorkspaceControllerForProcessIdentity:(id)a3 jobLabel:(id)a4 options:(id)a5;
- (void)_createSystemUISceneControllerForConfiguration:(id)a3 withActiveDisplayWindowScene:(id)a4;
- (void)_didDisableSecureRendering:(id)a3;
- (void)_willEnableSecureRendering:(id)a3;
- (void)activateSceneForProcessIdentity:(id)a3 withHandle:(id)a4 options:(id)a5 completion:(id)a6;
- (void)addSystemUISceneToPresentationBinder:(id)a3 forDisplayIdentity:(id)a4;
- (void)dealloc;
- (void)destroyScenesWithPersistentIdentifiers:(id)a3 processIdentity:(id)a4 completion:(id)a5;
- (void)removeSystemUISceneFromPresentationBinder:(id)a3 forDisplayIdentity:(id)a4;
- (void)setAccessibilityUIServerUISceneController:(id)a3;
- (void)setAssistiveTouchUISceneController:(id)a3;
- (void)setCameraOverlayUISceneController:(id)a3;
- (void)setDruidUISceneController:(id)a3;
- (void)setEnsembleUISceneController:(id)a3;
- (void)setEyedropperUISceneController:(id)a3;
- (void)setFullKeyboardAccessUISceneController:(id)a3;
- (void)setInputUISceneController:(id)a3;
- (void)setInternalPerfPowerHUDUISceneController:(id)a3;
- (void)setLiveTranscriptionUISceneController:(id)a3;
- (void)setMagnifierUISceneController:(id)a3;
- (void)setMomentsUISceneController:(id)a3;
- (void)setOverlayUISceneController:(id)a3;
- (void)setPerfPowerHUDUISceneController:(id)a3;
- (void)setPrototypeToolsSceneController:(id)a3;
- (void)setProximityReaderUISceneController:(id)a3;
- (void)setVoiceControlUISceneController:(id)a3;
- (void)windowSceneDidConnect:(id)a3;
- (void)windowSceneDidDisconnect:(id)a3;
@end

@implementation SBSystemUIScenesCoordinator

- (SBOverlayUISceneController)overlayUISceneController
{
  return self->_overlayUISceneController;
}

- (SBMomentsUISceneController)momentsUISceneController
{
  return self->_momentsUISceneController;
}

+ (BOOL)shouldHandleSceneRequestsForProcess:(id)a3 withOptions:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, a1, @"SBSystemUIScenesCoordinator.m", 258, @"Invalid parameter not satisfying: %@", @"processHandle" object file lineNumber description];
  }
  v9 = objc_opt_class();
  v10 = [v7 identity];
  if ([v9 _isSystemUISceneBoundClient:v10]) {
    char v11 = 1;
  }
  else {
    char v11 = [a1 _isSystemUISceneDynamicClient:v7 withSceneRequestOptions:v8];
  }

  return v11;
}

+ (BOOL)_isSystemUISceneDynamicClient:(id)a3 withSceneRequestOptions:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, a1, @"SBSystemUIScenesCoordinator.m", 268, @"Invalid parameter not satisfying: %@", @"processHandle" object file lineNumber description];
  }
  v9 = [MEMORY[0x1E4F62448] sharedInstance];
  v10 = objc_msgSend(v9, "processForPID:", objc_msgSend(v7, "pid"));

  char v11 = [v8 specification];
  v12 = [v11 uiSceneSessionRole];

  int v13 = [v10 hasEntitlement:@"com.apple.springboard.SystemUIScene"];
  int v14 = v13;
  if (v12)
  {
    v15 = [(id)objc_opt_class() _systemUISceneSessionRoles];
    int v16 = [v15 containsObject:v12];

    if (v14) {
      goto LABEL_5;
    }
LABEL_8:
    LOBYTE(v18) = 0;
    goto LABEL_10;
  }
  int v16 = 0;
  if (!v13) {
    goto LABEL_8;
  }
LABEL_5:
  if (v8)
  {
    v17 = +[SBSystemUISceneDomain rootSettings];
    int v18 = [v17 allowAnySceneSessionRole] | v16;
  }
  else
  {
    LOBYTE(v18) = 1;
  }
LABEL_10:

  return v18;
}

+ (BOOL)_isSystemUISceneBoundClient:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, a1, @"SBSystemUIScenesCoordinator.m", 263, @"Invalid parameter not satisfying: %@", @"clientIdentity" object file lineNumber description];
  }
  v6 = [a1 _systemUISceneBoundProcessIdentities];
  char v7 = [v6 containsObject:v5];

  return v7;
}

+ (id)_systemUISceneBoundProcessIdentities
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__SBSystemUIScenesCoordinator__systemUISceneBoundProcessIdentities__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_systemUISceneBoundProcessIdentities_onceToken != -1) {
    dispatch_once(&_systemUISceneBoundProcessIdentities_onceToken, block);
  }
  v2 = (void *)_systemUISceneBoundProcessIdentities__systemUISceneBoundProcessIdentities;
  return v2;
}

+ (id)_systemUISceneSessionRoles
{
  if (_systemUISceneSessionRoles_onceToken != -1) {
    dispatch_once(&_systemUISceneSessionRoles_onceToken, &__block_literal_global_264);
  }
  v2 = (void *)_systemUISceneSessionRoles_systemUISceneSessionRoles;
  return v2;
}

void __57__SBSystemUIScenesCoordinator__systemUISceneSessionRoles__block_invoke()
{
  v14[6] = *MEMORY[0x1E4F143B8];
  int v13 = objc_opt_new();
  v12 = [v13 uiSceneSessionRole];
  v14[0] = v12;
  v0 = objc_opt_new();
  v1 = [v0 uiSceneSessionRole];
  v14[1] = v1;
  v2 = objc_opt_new();
  v3 = [v2 uiSceneSessionRole];
  v14[2] = v3;
  v4 = objc_opt_new();
  id v5 = [v4 uiSceneSessionRole];
  v14[3] = v5;
  v6 = objc_opt_new();
  char v7 = [v6 uiSceneSessionRole];
  v14[4] = v7;
  id v8 = objc_opt_new();
  v9 = [v8 uiSceneSessionRole];
  v14[5] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:6];
  char v11 = (void *)_systemUISceneSessionRoles_systemUISceneSessionRoles;
  _systemUISceneSessionRoles_systemUISceneSessionRoles = v10;
}

+ (id)_configurationForSystemUISceneSessionRoles
{
  if (_configurationForSystemUISceneSessionRoles_onceToken != -1) {
    dispatch_once(&_configurationForSystemUISceneSessionRoles_onceToken, &__block_literal_global_28_2);
  }
  v2 = (void *)_configurationForSystemUISceneSessionRoles_configurationForSystemUISceneSessionRoles;
  return v2;
}

void __73__SBSystemUIScenesCoordinator__configurationForSystemUISceneSessionRoles__block_invoke()
{
  v22[5] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CA60];
  v1 = +[SBProximityReaderUISceneController _setupInfo];
  v2 = [v0 dictionaryWithDictionary:v1];

  v3 = [MEMORY[0x1E4F29238] valueWithPointer:sel_setProximityReaderUISceneController_];
  v17 = v2;
  [v2 setObject:v3 forKey:@"setter"];

  v20 = objc_opt_new();
  v19 = [v20 uiSceneSessionRole];
  v21[0] = v19;
  int v18 = +[SBLiquidDetectionUISceneController _setupInfo];
  v22[0] = v18;
  int v16 = objc_opt_new();
  v4 = [v16 uiSceneSessionRole];
  v21[1] = v4;
  v22[1] = v2;
  id v5 = objc_opt_new();
  v6 = [v5 uiSceneSessionRole];
  v21[2] = v6;
  char v7 = +[SBScreenSharingOverlayUISceneController _setupInfo];
  v22[2] = v7;
  id v8 = objc_opt_new();
  v9 = [v8 uiSceneSessionRole];
  v21[3] = v9;
  uint64_t v10 = +[SBMagnifierUISceneController _setupInfo];
  v22[3] = v10;
  char v11 = objc_opt_new();
  v12 = [v11 uiSceneSessionRole];
  v21[4] = v12;
  int v13 = +[SBDisplayCalibratorUISceneController _setupInfo];
  v22[4] = v13;
  uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:5];
  v15 = (void *)_configurationForSystemUISceneSessionRoles_configurationForSystemUISceneSessionRoles;
  _configurationForSystemUISceneSessionRoles_configurationForSystemUISceneSessionRoles = v14;
}

+ (id)_sceneControllersConfigurations
{
  if (_sceneControllersConfigurations_onceToken != -1) {
    dispatch_once(&_sceneControllersConfigurations_onceToken, &__block_literal_global_41_3);
  }
  v2 = (void *)_sceneControllersConfigurations__sceneControllersConfigurations;
  return v2;
}

void __62__SBSystemUIScenesCoordinator__sceneControllersConfigurations__block_invoke()
{
  v90[14] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CA60];
  v1 = +[SBDruidUISceneController _setupInfo];
  v2 = [v0 dictionaryWithDictionary:v1];

  v3 = [MEMORY[0x1E4F29238] valueWithPointer:sel_setDruidUISceneController_];
  v83 = v2;
  [v2 setObject:v3 forKey:@"setter"];

  v4 = (void *)MEMORY[0x1E4F1CA60];
  id v5 = +[SBOverlayUISceneController _setupInfo];
  v6 = [v4 dictionaryWithDictionary:v5];

  char v7 = [MEMORY[0x1E4F29238] valueWithPointer:sel_setOverlayUISceneController_];
  v82 = v6;
  [v6 setObject:v7 forKey:@"setter"];

  id v8 = (void *)MEMORY[0x1E4F1CA60];
  v9 = +[SBInputUISceneController _setupInfo];
  uint64_t v10 = [v8 dictionaryWithDictionary:v9];

  char v11 = [MEMORY[0x1E4F29238] valueWithPointer:sel_setInputUISceneController_];
  v81 = v10;
  [v10 setObject:v11 forKey:@"setter"];

  v12 = (void *)MEMORY[0x1E4F1CA60];
  int v13 = +[SBEnsembleUISceneController _setupInfo];
  uint64_t v14 = [v12 dictionaryWithDictionary:v13];

  v15 = [MEMORY[0x1E4F29238] valueWithPointer:sel_setEnsembleUISceneController_];
  v80 = v14;
  [v14 setObject:v15 forKey:@"setter"];

  int v16 = (void *)MEMORY[0x1E4F1CA60];
  v17 = +[SBEyedropperUISceneController _setupInfo];
  int v18 = [v16 dictionaryWithDictionary:v17];

  v19 = [MEMORY[0x1E4F29238] valueWithPointer:sel_setEyedropperUISceneController_];
  v79 = v18;
  [v18 setObject:v19 forKey:@"setter"];

  v20 = (void *)MEMORY[0x1E4F1CA60];
  v21 = +[SBPerfPowerHUDSceneController _setupInfo];
  v22 = [v20 dictionaryWithDictionary:v21];

  v23 = [MEMORY[0x1E4F29238] valueWithPointer:sel_setPerfPowerHUDUISceneController_];
  v78 = v22;
  [v22 setObject:v23 forKey:@"setter"];

  v24 = (void *)MEMORY[0x1E4F1CA60];
  v25 = +[SBInternalPerfPowerHUDSceneController _setupInfo];
  v26 = [v24 dictionaryWithDictionary:v25];

  v27 = [MEMORY[0x1E4F29238] valueWithPointer:sel_setInternalPerfPowerHUDUISceneController_];
  v77 = v26;
  [v26 setObject:v27 forKey:@"setter"];

  v28 = (void *)MEMORY[0x1E4F1CA60];
  v29 = +[SBPrototypeToolsSceneController _setupInfo];
  v30 = [v28 dictionaryWithDictionary:v29];

  v31 = [MEMORY[0x1E4F29238] valueWithPointer:sel_setPrototypeToolsSceneController_];
  v76 = v30;
  [v30 setObject:v31 forKey:@"setter"];

  v32 = (void *)MEMORY[0x1E4F1CA60];
  v33 = +[SBMomentsUISceneController _setupInfo];
  v34 = [v32 dictionaryWithDictionary:v33];

  v35 = [MEMORY[0x1E4F29238] valueWithPointer:sel_setMomentsUISceneController_];
  [v34 setObject:v35 forKey:@"setter"];

  if (((+[SBCaptureHardwareButton deviceSupportsCaptureButton]() & 1) != 0
     || +[SBCaptureHardwareButton simulateCaptureButtonWithActionButton]())
    && +[SBCaptureHardwareButton isCaptureFeatureEnabled]())
  {
    v36 = (void *)MEMORY[0x1E4F1CA60];
    v37 = +[SBCameraOverlayUISceneController _setupInfo];
    v38 = [v36 dictionaryWithDictionary:v37];

    v39 = [MEMORY[0x1E4F29238] valueWithPointer:sel_setCameraOverlayUISceneController_];
    [v38 setObject:v39 forKey:@"setter"];
  }
  else
  {
    v38 = 0;
  }
  v40 = (void *)MEMORY[0x1E4F1CA60];
  v41 = +[SBAccessibilityUIServerUISceneController _setupInfo];
  v42 = [v40 dictionaryWithDictionary:v41];

  v43 = [MEMORY[0x1E4F29238] valueWithPointer:sel_setAccessibilityUIServerUISceneController_];
  [v42 setObject:v43 forKey:@"setter"];

  v44 = (void *)MEMORY[0x1E4F1CA60];
  v45 = +[SBAssistiveTouchUISceneController _setupInfo];
  v46 = [v44 dictionaryWithDictionary:v45];

  v47 = [MEMORY[0x1E4F29238] valueWithPointer:sel_setAssistiveTouchUISceneController_];
  [v46 setObject:v47 forKey:@"setter"];

  v48 = (void *)MEMORY[0x1E4F1CA60];
  v49 = +[SBLiveTranscriptionUISceneController _setupInfo];
  v50 = [v48 dictionaryWithDictionary:v49];

  v51 = [MEMORY[0x1E4F29238] valueWithPointer:sel_setLiveTranscriptionUISceneController_];
  [v50 setObject:v51 forKey:@"setter"];

  v52 = (void *)MEMORY[0x1E4F1CA60];
  v53 = +[SBFullKeyboardAccessUISceneController _setupInfo];
  v54 = [v52 dictionaryWithDictionary:v53];

  v55 = [MEMORY[0x1E4F29238] valueWithPointer:sel_setFullKeyboardAccessUISceneController_];
  [v54 setObject:v55 forKey:@"setter"];

  v56 = (void *)MEMORY[0x1E4F1CA60];
  v57 = +[SBVoiceControlUISceneController _setupInfo];
  v58 = [v56 dictionaryWithDictionary:v57];

  v59 = [MEMORY[0x1E4F29238] valueWithPointer:sel_setVoiceControlUISceneController_];
  [v58 setObject:v59 forKey:@"setter"];

  v90[0] = v83;
  v90[1] = v82;
  v90[2] = v81;
  v90[3] = v50;
  v73 = v50;
  v90[4] = v54;
  v90[5] = v58;
  v72 = v58;
  v74 = v42;
  v90[6] = v46;
  v90[7] = v42;
  v90[8] = v80;
  v90[9] = v79;
  v90[10] = v34;
  v90[11] = v78;
  v90[12] = v77;
  v90[13] = v76;
  uint64_t v60 = [MEMORY[0x1E4F1C978] arrayWithObjects:v90 count:14];
  v61 = (void *)_sceneControllersConfigurations__sceneControllersConfigurations;
  _sceneControllersConfigurations__sceneControllersConfigurations = v60;

  if (v38)
  {
    uint64_t v62 = [(id)_sceneControllersConfigurations__sceneControllersConfigurations arrayByAddingObject:v38];
    v63 = (void *)_sceneControllersConfigurations__sceneControllersConfigurations;
    _sceneControllersConfigurations__sceneControllersConfigurations = v62;
  }
  v75 = v38;
  long long v87 = 0u;
  long long v88 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  id obj = (id)_sceneControllersConfigurations__sceneControllersConfigurations;
  uint64_t v64 = [obj countByEnumeratingWithState:&v85 objects:v89 count:16];
  if (v64)
  {
    uint64_t v65 = v64;
    uint64_t v66 = *(void *)v86;
    do
    {
      for (uint64_t i = 0; i != v65; ++i)
      {
        if (*(void *)v86 != v66) {
          objc_enumerationMutation(obj);
        }
        v68 = *(void **)(*((void *)&v85 + 1) + 8 * i);
        v69 = [v68 objectForKey:@"jobLabel"];
        v70 = [v68 objectForKey:@"isDaemon"];
        if ([v70 BOOLValue]) {
          [MEMORY[0x1E4F96408] identityForDaemonJobLabel:v69];
        }
        else {
        v71 = [MEMORY[0x1E4F96408] identityForAngelJobLabel:v69];
        }

        [v68 setObject:v71 forKey:@"processIdentity"];
      }
      uint64_t v65 = [obj countByEnumeratingWithState:&v85 objects:v89 count:16];
    }
    while (v65);
  }
}

void __67__SBSystemUIScenesCoordinator__systemUISceneBoundProcessIdentities__block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1CA48];
  v3 = [*(id *)(a1 + 32) _sceneControllersConfigurations];
  uint64_t v4 = objc_msgSend(v2, "arrayWithCapacity:", objc_msgSend(v3, "count"));
  id v5 = (void *)_systemUISceneBoundProcessIdentities__systemUISceneBoundProcessIdentities;
  _systemUISceneBoundProcessIdentities__systemUISceneBoundProcessIdentities = v4;

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v6 = objc_msgSend(*(id *)(a1 + 32), "_sceneControllersConfigurations", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        char v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v12 = [v11 objectForKey:@"enabled"];
        int v13 = [v12 BOOLValue];

        if (v13)
        {
          uint64_t v14 = [v11 objectForKey:@"processIdentity"];
          [(id)_systemUISceneBoundProcessIdentities__systemUISceneBoundProcessIdentities addObject:v14];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }
}

- (void)_createSceneWorkspaceControllerForProcessIdentity:(id)a3 jobLabel:(id)a4 options:(id)a5
{
  id v21 = a3;
  id v9 = a4;
  uint64_t v10 = [a5 specification];
  char v11 = [v10 uiSceneSessionRole];

  v12 = [(id)objc_opt_class() _configurationForSystemUISceneSessionRoles];
  int v13 = [v12 objectForKey:v11];
  uint64_t v14 = (void *)[v13 mutableCopy];

  if (!v9)
  {
    id v9 = [v14 objectForKey:@"jobLabel"];
  }
  if (v21)
  {
    if (v9) {
      goto LABEL_5;
    }
  }
  else
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"SBSystemUIScenesCoordinator.m", 281, @"Invalid parameter not satisfying: %@", @"processIdentity" object file lineNumber description];

    if (v9) {
      goto LABEL_5;
    }
  }
  uint64_t v20 = [MEMORY[0x1E4F28B00] currentHandler];
  [v20 handleFailureInMethod:a2 object:self file:@"SBSystemUIScenesCoordinator.m" lineNumber:282 description:@"jobLabel unexpectedly nil"];

LABEL_5:
  long long v15 = [NSString stringWithFormat:@"%@.%@", @"com.apple.SpringBoard.SceneWorkspace", v9];
  if (v14)
  {
    [v14 setObject:v21 forKey:@"processIdentity"];
    [v14 setObject:v9 forKey:@"jobLabel"];
    [v14 setObject:v15 forKey:@"workspaceID"];
    long long v16 = [(id)SBApp windowSceneManager];
    long long v17 = [v16 activeDisplayWindowScene];

    [(SBSystemUIScenesCoordinator *)self _createSystemUISceneControllerForConfiguration:v14 withActiveDisplayWindowScene:v17];
  }
  else
  {
    long long v18 = [SBSystemUISceneController alloc];
    long long v17 = [(SBSystemUISceneController *)v18 initWithSceneWorkspaceIdentifier:v15 clientProcessIdentity:v21 sceneVendingPolicy:2 traitsRole:@"SBTraitsParticipantRoleSystemUIScene" jobLabel:v9 level:*MEMORY[0x1E4F43CF8] + 255.0];
    [(SBSystemUISceneController *)v17 setDefaultPresenter:self->_springboardMainBinderPresenter];
    [(NSMutableArray *)self->_sceneControllers addObject:v17];
    [(NSMutableArray *)self->_allKnownProcessIdentities addObject:v21];
  }
}

- (SBSystemUIScenesCoordinator)init
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v26.receiver = self;
  v26.super_class = (Class)SBSystemUIScenesCoordinator;
  v2 = [(SBSystemUIScenesCoordinator *)&v26 init];
  if (v2)
  {
    v3 = objc_alloc_init(SBSystemUISceneDefaultPresenter);
    customBinderPresenter = v2->_customBinderPresenter;
    v2->_customBinderPresenter = v3;

    id v5 = [[SBSystemUISceneDefaultPresenter alloc] initWithPresentationBinderProvider:v2];
    springboardMainBinderPresenter = v2->_springboardMainBinderPresenter;
    v2->_springboardMainBinderPresenter = v5;

    uint64_t v7 = [(id)objc_opt_class() _sceneControllersConfigurations];
    uint64_t v8 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v7, "count"));
    sceneControllers = v2->_sceneControllers;
    v2->_sceneControllers = (NSMutableArray *)v8;

    uint64_t v10 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v7, "count"));
    allKnownProcessIdentities = v2->_allKnownProcessIdentities;
    v2->_allKnownProcessIdentities = (NSMutableArray *)v10;

    v12 = [(id)SBApp windowSceneManager];
    int v13 = [v12 activeDisplayWindowScene];

    if (!v13)
    {
      uint64_t v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v14 addObserver:v2 selector:sel__completeWindowSceneClientsConfiguration name:@"SBBootCompleteNotification" object:0];
    }
    long long v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v15 addObserver:v2 selector:sel__willEnableSecureRendering_ name:*MEMORY[0x1E4FA60E8] object:0];
    [v15 addObserver:v2 selector:sel__didDisableSecureRendering_ name:*MEMORY[0x1E4FA60E0] object:0];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v16 = objc_msgSend((id)objc_opt_class(), "_sceneControllersConfigurations", 0);
    uint64_t v17 = [v16 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v23;
      do
      {
        uint64_t v20 = 0;
        do
        {
          if (*(void *)v23 != v19) {
            objc_enumerationMutation(v16);
          }
          [(SBSystemUIScenesCoordinator *)v2 _createSystemUISceneControllerForConfiguration:*(void *)(*((void *)&v22 + 1) + 8 * v20++) withActiveDisplayWindowScene:v13];
        }
        while (v18 != v20);
        uint64_t v18 = [v16 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v18);
    }
  }
  return v2;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)SBSystemUIScenesCoordinator;
  [(SBSystemUIScenesCoordinator *)&v4 dealloc];
}

- (void)_createSystemUISceneControllerForConfiguration:(id)a3 withActiveDisplayWindowScene:(id)a4
{
  id v28 = a3;
  id v6 = a4;
  uint64_t v7 = [v28 objectForKey:@"processIdentity"];
  uint64_t v8 = [v28 objectForKey:@"enabled"];
  int v9 = [v8 BOOLValue];

  if (!v9) {
    goto LABEL_18;
  }
  uint64_t v10 = (objc_class *)(id)[v28 objectForKey:@"class"];
  uint64_t v11 = [v28 objectForKey:@"jobLabel"];
  v27 = [v28 objectForKey:@"traitsRole"];
  objc_super v26 = [v28 objectForKey:@"workspaceID"];
  v12 = [v28 objectForKey:@"setter"];
  uint64_t v13 = [v12 pointerValue];

  uint64_t v14 = [v28 objectForKey:@"presentationStyle"];
  long long v15 = [v28 objectForKey:@"vendingStrategy"];
  [(SBSystemUIScenesCoordinator *)self _levelForClientConfiguration:v28];
  double v17 = v16;
  uint64_t v25 = v13;
  uint64_t v18 = (void *)v11;
  if (v14)
  {
    uint64_t v19 = [v14 integerValue];
    if (v15)
    {
LABEL_4:
      uint64_t v20 = objc_msgSend(v15, "integerValue", v25);
      goto LABEL_7;
    }
  }
  else
  {
    uint64_t v19 = 0;
    if (v15) {
      goto LABEL_4;
    }
  }
  uint64_t v20 = 2;
LABEL_7:
  id v21 = self->_springboardMainBinderPresenter;
  if (v19 == 2)
  {
    if (!v6)
    {
      long long v23 = 0;
      goto LABEL_14;
    }
    long long v22 = [(SBSystemUIScenesCoordinator *)self _newDefaultPresenterForWindowScene:v6 configuration:v28];
LABEL_12:
    long long v23 = v22;
LABEL_14:

    id v21 = v23;
    goto LABEL_15;
  }
  if (v19 == 1)
  {
    long long v22 = self->_customBinderPresenter;
    goto LABEL_12;
  }
LABEL_15:
  long long v24 = (void *)[[v10 alloc] initWithSceneWorkspaceIdentifier:v26 clientProcessIdentity:v7 sceneVendingPolicy:v20 traitsRole:v27 jobLabel:v18 level:v17];
  [v24 setDefaultPresenter:v21];
  if (v25) {
    [(SBSystemUIScenesCoordinator *)self performSelector:v25 withObject:v24];
  }
  -[NSMutableArray addObject:](self->_sceneControllers, "addObject:", v24, v25);
  [(NSMutableArray *)self->_allKnownProcessIdentities addObject:v7];

LABEL_18:
}

- (void)_completeWindowSceneClientsConfiguration
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  objc_super v4 = [(id)SBApp windowSceneManager];
  id v5 = [v4 activeDisplayWindowScene];

  if (!v5)
  {
    double v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2 object:self file:@"SBSystemUIScenesCoordinator.m" lineNumber:384 description:@"Must have a concept of active display SB window scene at this point."];
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = objc_msgSend((id)objc_opt_class(), "_sceneControllersConfigurations", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        v12 = [v11 objectForKey:@"presentationStyle"];
        uint64_t v13 = [v12 integerValue];

        if (v13 == 2)
        {
          uint64_t v14 = [v11 objectForKey:@"processIdentity"];
          long long v15 = [(SBSystemUIScenesCoordinator *)self sceneWorkspaceControllerForProcessIdentity:v14];
          id v16 = [(SBSystemUIScenesCoordinator *)self _newDefaultPresenterForWindowScene:v5 configuration:v11];
          [v15 setDefaultPresenter:v16];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v8);
  }
}

- (id)_newDefaultPresenterForWindowScene:(id)a3 configuration:(id)a4
{
  id v6 = a3;
  [(SBSystemUIScenesCoordinator *)self _levelForClientConfiguration:a4];
  double v8 = v7;
  uint64_t v9 = [[SBSystemUISceneDefaultPresenter alloc] initWithWindowHostingPresentationOnWindowScene:v6];

  uint64_t v10 = [NSNumber numberWithDouble:v8];
  [(SBSystemUISceneDefaultPresenter *)v9 setPreferredWindowLevel:v10];

  return v9;
}

- (double)_levelForClientConfiguration:(id)a3
{
  v3 = [a3 objectForKey:@"hostLevel"];
  objc_super v4 = v3;
  if (v3)
  {
    [v3 floatValue];
    double v6 = v5;
  }
  else
  {
    double v6 = *MEMORY[0x1E4F43CF8] + 255.0;
  }

  return v6;
}

- (void)windowSceneDidConnect:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  float v5 = self->_sceneControllers;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "windowSceneDidConnect:", v4, (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)windowSceneDidDisconnect:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  float v5 = self->_sceneControllers;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "windowSceneDidDisconnect:", v4, (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)_willEnableSecureRendering:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v3 = self->_sceneControllers;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7++), "willEnableSecureRendering:", 0, (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)_didDisableSecureRendering:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v3 = self->_sceneControllers;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7++), "didDisableSecureRendering:", 0, (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)activateSceneForProcessIdentity:(id)a3 withHandle:(id)a4 options:(id)a5 completion:(id)a6
{
  id v23 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = (void (**)(id, void, void *))a6;
  BSDispatchQueueAssertMain();
  if (v23)
  {
    if (v12) {
      goto LABEL_3;
    }
LABEL_11:
    uint64_t v20 = 3;
    goto LABEL_12;
  }
  long long v21 = [MEMORY[0x1E4F28B00] currentHandler];
  [v21 handleFailureInMethod:a2, self, @"SBSystemUIScenesCoordinator.m", 438, @"Invalid parameter not satisfying: %@", @"processIdentity" object file lineNumber description];

  if (!v12) {
    goto LABEL_11;
  }
LABEL_3:
  char v14 = [(id)objc_opt_class() _isSystemUISceneBoundClient:v23];
  if (v11)
  {
    if ((v14 & 1) == 0)
    {
      if ([(id)objc_opt_class() _isSystemUISceneDynamicClient:v11 withSceneRequestOptions:v12])
      {
        uint64_t v15 = [(SBSystemUIScenesCoordinator *)self sceneWorkspaceControllerForProcessIdentity:v23];

        if (!v15)
        {
          id v16 = [v11 consistentJobLabel];
          [(SBSystemUIScenesCoordinator *)self _createSceneWorkspaceControllerForProcessIdentity:v23 jobLabel:v16 options:v12];
        }
      }
    }
  }
  uint64_t v17 = objc_opt_class();
  long long v18 = [(SBSystemUIScenesCoordinator *)self sceneWorkspaceControllerForProcessIdentity:v23];
  long long v19 = SBSafeCast(v17, v18);

  if (v19) {
    goto LABEL_15;
  }
  uint64_t v20 = 2;
LABEL_12:
  long long v19 = [MEMORY[0x1E4F28C58] errorWithDomain:SBSystemUIScenesCoordinatorErrorDomain code:v20 userInfo:0];
  if (!v19)
  {
LABEL_15:
    long long v22 = [v19 clientProcessIdentity];
    [v19 activateSceneForProcessIdentity:v22 withHandle:v11 options:v12 completion:v13];

    long long v19 = 0;
    goto LABEL_16;
  }
  if (v13) {
    v13[2](v13, 0, v19);
  }
LABEL_16:
}

- (void)destroyScenesWithPersistentIdentifiers:(id)a3 processIdentity:(id)a4 completion:(id)a5
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  long long v10 = (void (**)(id, void, void *))a5;
  id v11 = a4;
  BSDispatchQueueAssertMain();
  if (v9)
  {
    if (v11) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"SBSystemUIScenesCoordinator.m", 469, @"Invalid parameter not satisfying: %@", @"persistentIdentifiers" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
  }
  long long v21 = [MEMORY[0x1E4F28B00] currentHandler];
  [v21 handleFailureInMethod:a2, self, @"SBSystemUIScenesCoordinator.m", 470, @"Invalid parameter not satisfying: %@", @"processIdentity" object file lineNumber description];

LABEL_3:
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = [(SBSystemUIScenesCoordinator *)self sceneWorkspaceControllerForProcessIdentity:v11];

  char v14 = SBSafeCast(v12, v13);

  if (v14)
  {
    uint64_t v15 = [v14 clientProcessIdentity];
    [v14 destroyScenesWithPersistentIdentifiers:v9 processIdentity:v15 completion:v10];
  }
  else if (v10)
  {
    id v16 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v17 = SBSystemUIScenesCoordinatorErrorDomain;
    uint64_t v22 = *MEMORY[0x1E4F28568];
    v23[0] = @"Unknown process identity";
    long long v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
    long long v19 = [v16 errorWithDomain:v17 code:2 userInfo:v18];
    v10[2](v10, 0, v19);
  }
}

- (id)sceneWorkspaceControllerForProcessIdentity:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  BSDispatchQueueAssertMain();
  if (!v5)
  {
    uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"SBSystemUIScenesCoordinator.m", 486, @"Invalid parameter not satisfying: %@", @"processIdentity" object file lineNumber description];
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = self->_sceneControllers;
  id v7 = (id)[(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        long long v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v11 = [v10 sceneWorkspaceControllerForProcessIdentity:v5];

        if (v10 == v11)
        {
          id v7 = v10;
          goto LABEL_13;
        }
      }
      id v7 = (id)[(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  return v7;
}

- (id)sceneFromIdentityToken:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BSDispatchQueueAssertMain();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = self->_sceneControllers;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "sceneFromIdentityToken:", v4, (void)v13);
        if (v10)
        {
          id v11 = (void *)v10;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  id v11 = 0;
LABEL_11:

  return v11;
}

- (id)sceneFromIdentityTokenStringRepresentation:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BSDispatchQueueAssertMain();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = self->_sceneControllers;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "sceneFromIdentityTokenStringRepresentation:", v4, (void)v13);
        if (v10)
        {
          id v11 = (void *)v10;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  id v11 = 0;
LABEL_11:

  return v11;
}

- (BOOL)enumerateScenesWithBlock:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BSDispatchQueueAssertMain();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = self->_sceneControllers;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        if (objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "enumerateScenesWithBlock:", v4, (void)v10))
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)addSystemUISceneToPresentationBinder:(id)a3 forDisplayIdentity:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = +[SBSceneManagerCoordinator sharedInstance];
  id v8 = [v7 sceneManagerForDisplayIdentity:v5];

  [v8 addSystemUISceneToPresentationBinder:v6];
}

- (void)removeSystemUISceneFromPresentationBinder:(id)a3 forDisplayIdentity:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = +[SBSceneManagerCoordinator sharedInstance];
  id v8 = [v7 sceneManagerForDisplayIdentity:v5];

  [v8 removeSystemUISceneFromPresentationBinder:v6];
}

- (SBAccessibilityUIServerUISceneController)accessibilityUIServerUISceneController
{
  return self->_accessibilityUIServerUISceneController;
}

- (void)setAccessibilityUIServerUISceneController:(id)a3
{
}

- (SBAssistiveTouchUISceneController)assistiveTouchUISceneController
{
  return self->_assistiveTouchUISceneController;
}

- (void)setAssistiveTouchUISceneController:(id)a3
{
}

- (SBCameraOverlayUISceneController)cameraOverlayUISceneController
{
  return self->_cameraOverlayUISceneController;
}

- (void)setCameraOverlayUISceneController:(id)a3
{
}

- (SBDruidUISceneController)druidUISceneController
{
  return self->_druidUISceneController;
}

- (void)setDruidUISceneController:(id)a3
{
}

- (SBEnsembleUISceneController)ensembleUISceneController
{
  return self->_ensembleUISceneController;
}

- (void)setEnsembleUISceneController:(id)a3
{
}

- (SBEyedropperUISceneController)eyedropperUISceneController
{
  return self->_eyedropperUISceneController;
}

- (void)setEyedropperUISceneController:(id)a3
{
}

- (SBFullKeyboardAccessUISceneController)fullKeyboardAccessUISceneController
{
  return self->_fullKeyboardAccessUISceneController;
}

- (void)setFullKeyboardAccessUISceneController:(id)a3
{
}

- (SBInputUISceneController)inputUISceneController
{
  return self->_inputUISceneController;
}

- (void)setInputUISceneController:(id)a3
{
}

- (SBInternalPerfPowerHUDSceneController)internalPerfPowerHUDUISceneController
{
  return self->_internalPerfPowerHUDUISceneController;
}

- (void)setInternalPerfPowerHUDUISceneController:(id)a3
{
}

- (SBLiveTranscriptionUISceneController)liveTranscriptionUISceneController
{
  return self->_liveTranscriptionUISceneController;
}

- (void)setLiveTranscriptionUISceneController:(id)a3
{
}

- (void)setMomentsUISceneController:(id)a3
{
}

- (void)setOverlayUISceneController:(id)a3
{
}

- (SBPerfPowerHUDSceneController)perfPowerHUDUISceneController
{
  return self->_perfPowerHUDUISceneController;
}

- (void)setPerfPowerHUDUISceneController:(id)a3
{
}

- (SBVoiceControlUISceneController)voiceControlUISceneController
{
  return self->_voiceControlUISceneController;
}

- (void)setVoiceControlUISceneController:(id)a3
{
}

- (SBProximityReaderUISceneController)proximityReaderUISceneController
{
  return self->_proximityReaderUISceneController;
}

- (void)setProximityReaderUISceneController:(id)a3
{
}

- (SBMagnifierUISceneController)magnifierUISceneController
{
  return self->_magnifierUISceneController;
}

- (void)setMagnifierUISceneController:(id)a3
{
}

- (SBPrototypeToolsSceneController)prototypeToolsSceneController
{
  return self->_prototypeToolsSceneController;
}

- (void)setPrototypeToolsSceneController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prototypeToolsSceneController, 0);
  objc_storeStrong((id *)&self->_magnifierUISceneController, 0);
  objc_storeStrong((id *)&self->_proximityReaderUISceneController, 0);
  objc_storeStrong((id *)&self->_voiceControlUISceneController, 0);
  objc_storeStrong((id *)&self->_perfPowerHUDUISceneController, 0);
  objc_storeStrong((id *)&self->_overlayUISceneController, 0);
  objc_storeStrong((id *)&self->_momentsUISceneController, 0);
  objc_storeStrong((id *)&self->_liveTranscriptionUISceneController, 0);
  objc_storeStrong((id *)&self->_internalPerfPowerHUDUISceneController, 0);
  objc_storeStrong((id *)&self->_inputUISceneController, 0);
  objc_storeStrong((id *)&self->_fullKeyboardAccessUISceneController, 0);
  objc_storeStrong((id *)&self->_eyedropperUISceneController, 0);
  objc_storeStrong((id *)&self->_ensembleUISceneController, 0);
  objc_storeStrong((id *)&self->_druidUISceneController, 0);
  objc_storeStrong((id *)&self->_cameraOverlayUISceneController, 0);
  objc_storeStrong((id *)&self->_assistiveTouchUISceneController, 0);
  objc_storeStrong((id *)&self->_accessibilityUIServerUISceneController, 0);
  objc_storeStrong((id *)&self->_allKnownProcessIdentities, 0);
  objc_storeStrong((id *)&self->_sceneControllers, 0);
  objc_storeStrong((id *)&self->_springboardMainBinderPresenter, 0);
  objc_storeStrong((id *)&self->_customBinderPresenter, 0);
}

@end