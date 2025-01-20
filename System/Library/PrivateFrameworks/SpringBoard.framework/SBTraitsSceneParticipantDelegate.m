@interface SBTraitsSceneParticipantDelegate
- (BOOL)_isAllowedToHavePortraitUpsideDown;
- (BOOL)canDetermineActiveOrientation;
- (BOOL)isOrientationActuationAnimatable;
- (BOOL)needsActuationForUpdateReasons:(int64_t)a3;
- (FBScene)scene;
- (NSNumber)preferredSceneLevel;
- (NSString)description;
- (SBSceneHandle)sceneHandle;
- (SBTraitsSceneParticipantDelegate)initWithScene:(id)a3;
- (SBTraitsSceneParticipantDelegate)initWithSceneHandle:(id)a3;
- (TRAArbiter)arbiter;
- (TRAParticipant)participant;
- (double)_angleFromScreenReferenceSpaceForSettings:(id)a3 displayIdentity:(id)a4;
- (id)_application;
- (id)actuateOrientationAlongsideBlock;
- (id)actuateOrientationSettingsAlongsideBlock;
- (id)actuateZOrderAlongsideBlock;
- (id)participantAssociatedSceneIdentityTokens:(id)a3;
- (int64_t)_orientationMode;
- (int64_t)_preferredOrientation;
- (int64_t)orientationModeOverride;
- (int64_t)sceneCurrentOrientation;
- (unint64_t)_allLegalOrientations;
- (unint64_t)_bestGuessSupportedInterfaceOrientations;
- (unint64_t)_hostReferenceAngleModeForDisplayIdentity:(id)a3;
- (unint64_t)_sanitizedMask:(unint64_t)a3 forApplication:(id)a4;
- (unint64_t)_supportedOrientations;
- (unint64_t)initialSupportedOrientationsOverride;
- (void)_evaluateOrientationTransitionContext:(id)a3;
- (void)_resetToInitialState;
- (void)actuateOrientationSettingsWithContext:(id)a3;
- (void)actuateUserInterfaceStyleSettingsWithContext:(id)a3;
- (void)actuateZOrderLevelSettings;
- (void)appendDescriptionForParticipant:(id)a3 withBuilder:(id)a4 multilinePrefix:(id)a5;
- (void)dealloc;
- (void)didChangeSettingsForParticipant:(id)a3 context:(id)a4;
- (void)invalidate;
- (void)participantWillInvalidate:(id)a3;
- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6;
- (void)sceneContentStateDidChange:(id)a3;
- (void)sceneHandle:(id)a3 didCreateScene:(id)a4;
- (void)sceneHandle:(id)a3 didDestroyScene:(id)a4;
- (void)setActuateOrientationAlongsideBlock:(id)a3;
- (void)setActuateOrientationSettingsAlongsideBlock:(id)a3;
- (void)setActuateZOrderAlongsideBlock:(id)a3;
- (void)setArbiter:(id)a3;
- (void)setCanDetermineActiveOrientation:(BOOL)a3;
- (void)setInitialSupportedOrientationsOverride:(unint64_t)a3;
- (void)setOrientationActuationAnimatable:(BOOL)a3;
- (void)setOrientationActuationEnabled:(BOOL)a3;
- (void)setOrientationModeOverride:(int64_t)a3;
- (void)setParticipant:(id)a3;
- (void)setPreferredSceneLevel:(id)a3;
- (void)setScene:(id)a3;
- (void)setSceneHandle:(id)a3;
- (void)updateOrientationSceneSettingsForParticipant:(id)a3;
- (void)updatePreferencesForParticipant:(id)a3 updater:(id)a4;
- (void)updatePreferencesWithUpdater:(id)a3;
@end

@implementation SBTraitsSceneParticipantDelegate

- (void)updateOrientationSceneSettingsForParticipant:(id)a3
{
  id v15 = a3;
  if (([v15 isUISubclass] & 1) == 0)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"SBTraitsSceneParticipantDelegate.m" lineNumber:342 description:@"Settings must be an UI subclass"];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_participant);
  v6 = [WeakRetained currentSettings];
  v7 = [v6 orientationSettings];

  if (v7)
  {
    v8 = [v15 displayIdentity];
    v9 = [v7 validatedOrientationInputs];
    uint64_t v10 = [v9 currentDeviceOrientation];

    [(SBTraitsSceneParticipantDelegate *)self _angleFromScreenReferenceSpaceForSettings:v7 displayIdentity:v8];
    double v12 = v11;
    objc_msgSend(v15, "setHostReferenceAngleMode:", -[SBTraitsSceneParticipantDelegate _hostReferenceAngleModeForDisplayIdentity:](self, "_hostReferenceAngleModeForDisplayIdentity:", v8));
    [v15 setAngleFromHostReferenceUprightDirection:v12];
    v13 = [v7 orientationMapResolver];
    [v15 setInterfaceOrientationMapResolver:v13];

    objc_msgSend(v15, "setInterfaceOrientationMode:", -[SBTraitsSceneParticipantDelegate _orientationMode](self, "_orientationMode"));
    objc_msgSend(v15, "setInterfaceOrientation:", objc_msgSend(v7, "orientation"));
    [v15 setDeviceOrientation:v10];
  }
}

- (int64_t)_orientationMode
{
  int64_t result = self->_orientationModeOverride;
  if (!result)
  {
    unint64_t orientationMode = self->_orientationMode;
    if (!orientationMode)
    {
      v5 = [MEMORY[0x1E4F42948] currentDevice];
      uint64_t v6 = [v5 userInterfaceIdiom];

      if ((v6 & 0xFFFFFFFFFFFFFFFBLL) == 1)
      {
        v7 = [(SBTraitsSceneParticipantDelegate *)self _application];
        v8 = v7;
        if (v7)
        {
          int v9 = [v7 isMedusaCapable];
          int64_t v10 = 1;
          if (v9) {
            int64_t v10 = 2;
          }
          self->_unint64_t orientationMode = v10;
        }
        else
        {
          self->_unint64_t orientationMode = 1;
          id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
          double v12 = [WeakRetained clientHandle];
          v13 = [v12 processHandle];

          v14 = [v13 bundle];
          if (v14)
          {
            bundleOrientationProperties = self->_bundleOrientationProperties;
            if (!bundleOrientationProperties)
            {
              v16 = [v14 bundleInfoValuesForKeys:&unk_1F3348180];
              v17 = self->_bundleOrientationProperties;
              self->_bundleOrientationProperties = v16;

              bundleOrientationProperties = self->_bundleOrientationProperties;
            }
            char v18 = [(NSDictionary *)bundleOrientationProperties bs_BOOLForKey:@"UIRequiresFullScreen"];
            v19 = [(NSDictionary *)self->_bundleOrientationProperties bs_safeArrayForKey:@"UISupportedInterfaceOrientations~ipad"];
            uint64_t v20 = [v19 count];

            if ((v18 & 1) == 0 && v20 == 4) {
              self->_unint64_t orientationMode = 2;
            }
          }
        }
        unint64_t orientationMode = self->_orientationMode;
      }
      else
      {
        unint64_t orientationMode = 1;
        self->_unint64_t orientationMode = 1;
      }
    }
    if (orientationMode <= 1) {
      return 1;
    }
    else {
      return orientationMode;
    }
  }
  return result;
}

- (unint64_t)_hostReferenceAngleModeForDisplayIdentity:(id)a3
{
  if ([a3 isExternal]) {
    return 1;
  }
  else {
    return 2;
  }
}

- (double)_angleFromScreenReferenceSpaceForSettings:(id)a3 displayIdentity:(id)a4
{
  uint64_t v6 = (void *)SBApp;
  id v7 = a4;
  id v8 = a3;
  int v9 = [v6 windowSceneManager];
  int64_t v10 = [v9 windowSceneForDisplayIdentity:v7];

  double v11 = [v10 switcherController];
  [v11 isChamoisWindowingUIEnabled];

  double v12 = [(SBTraitsSceneParticipantDelegate *)self _application];
  [v12 classicAppPhoneAppRunningOnPad];

  [v8 orientation];
  v13 = [v8 validatedOrientationInputs];

  [v13 nonFlatDeviceOrientation];
  SBFAngleForRotationFromInterfaceOrientationToInterfaceOrientation();
  BSRadiansToDegrees();
  double v15 = v14;

  return v15;
}

- (void)didChangeSettingsForParticipant:(id)a3 context:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_participant);

  if (WeakRetained == v7)
  {
    if (v7) {
      goto LABEL_3;
    }
LABEL_12:
    double v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"SBTraitsSceneParticipantDelegate.m", 589, @"Invalid parameter not satisfying: %@", @"participant != nil" object file lineNumber description];

    if (v8) {
      goto LABEL_4;
    }
    goto LABEL_13;
  }
  double v14 = [MEMORY[0x1E4F28B00] currentHandler];
  [v14 handleFailureInMethod:a2, self, @"SBTraitsSceneParticipantDelegate.m", 588, @"Invalid parameter not satisfying: %@", @"participant == _participant" object file lineNumber description];

  if (!v7) {
    goto LABEL_12;
  }
LABEL_3:
  if (v8) {
    goto LABEL_4;
  }
LABEL_13:
  v16 = [MEMORY[0x1E4F28B00] currentHandler];
  [v16 handleFailureInMethod:a2, self, @"SBTraitsSceneParticipantDelegate.m", 590, @"Invalid parameter not satisfying: %@", @"context != nil" object file lineNumber description];

LABEL_4:
  [(SBTraitsSceneParticipantDelegate *)self actuateZOrderLevelSettings];
  int64_t v10 = [v8 userInterfaceStyleActuationContext];
  [(SBTraitsSceneParticipantDelegate *)self actuateUserInterfaceStyleSettingsWithContext:v10];

  if (self->_orientationActuationEnabled)
  {
    double v11 = [v8 orientationActuationContext];
    [(SBTraitsSceneParticipantDelegate *)self actuateOrientationSettingsWithContext:v11];
LABEL_9:

    goto LABEL_10;
  }
  uint64_t v18 = 0;
  uint64_t v19 = 0;
  uint64_t v17 = 0;
  id v12 = objc_loadWeakRetained((id *)&self->_scene);
  SBTraitsSceneParticipantDelegateOrientationChangeInspector(v12, v7, &v18, &v17, &v19);

  [(SBTraitsSceneOrientationRequestAssistant *)self->_orientationRequestActionAssistant checkValidityAgainstUpdateReasons:v19];
  actuateOrientationAlongsideBlock = (void (**)(id, void *, uint64_t))self->_actuateOrientationAlongsideBlock;
  if (actuateOrientationAlongsideBlock && v19)
  {
    double v11 = [v8 orientationActuationContext];
    actuateOrientationAlongsideBlock[2](actuateOrientationAlongsideBlock, v11, v19);
    goto LABEL_9;
  }
LABEL_10:
}

- (void)actuateUserInterfaceStyleSettingsWithContext:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_participant);
  id v6 = objc_loadWeakRetained((id *)&self->_scene);
  if (v6)
  {
    id v7 = [WeakRetained currentSettings];

    if (v7)
    {
      uint64_t v8 = [WeakRetained currentUserInterfaceStyle];
      int v9 = [v6 uiSettings];
      uint64_t v10 = [v9 userInterfaceStyle];

      if (v8 != v10)
      {
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        v11[2] = __81__SBTraitsSceneParticipantDelegate_actuateUserInterfaceStyleSettingsWithContext___block_invoke;
        v11[3] = &unk_1E6B06DF0;
        uint64_t v13 = v8;
        id v12 = v4;
        +[SBSceneSettingsUpdater safeUpdateScene:v6 withBlock:v11];
      }
    }
  }
}

- (BOOL)needsActuationForUpdateReasons:(int64_t)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  id v7 = WeakRetained;
  BOOL v8 = 0;
  if (a3 && WeakRetained)
  {
    int v9 = [WeakRetained settings];
    char v10 = [v9 isUISubclass];

    if ((v10 & 1) == 0)
    {
      uint64_t v20 = [MEMORY[0x1E4F28B00] currentHandler];
      [v20 handleFailureInMethod:a2 object:self file:@"SBTraitsSceneParticipantDelegate.m" lineNumber:439 description:@"Settings must be an UI subclass"];
    }
    id v11 = objc_loadWeakRetained((id *)&self->_participant);
    id v12 = [v7 settings];
    uint64_t v27 = 0;
    v28 = &v27;
    uint64_t v29 = 0x2020000000;
    char v30 = 0;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v22 = (void (*)(void *))__67__SBTraitsSceneParticipantDelegate_needsActuationForUpdateReasons___block_invoke;
    v23 = &unk_1E6B06E40;
    v26 = &v27;
    id v13 = v12;
    id v24 = v13;
    id v14 = v11;
    id v25 = v14;
    double v15 = v21;
    char v31 = 0;
    uint8x8_t v16 = (uint8x8_t)vcnt_s8((int8x8_t)a3);
    v16.i16[0] = vaddlv_u8(v16);
    int v17 = v16.i32[0];
    if (v16.i32[0])
    {
      unint64_t v18 = 0;
      do
      {
        if (((1 << v18) & a3) != 0)
        {
          v22(v15);
          if (v31) {
            break;
          }
          --v17;
        }
        if (v18 > 0x3E) {
          break;
        }
        ++v18;
      }
      while (v17 > 0);
    }

    BOOL v8 = *((unsigned char *)v28 + 24) != 0;
    _Block_object_dispose(&v27, 8);
  }
  return v8;
}

void __67__SBTraitsSceneParticipantDelegate_needsActuationForUpdateReasons___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  switch(a2)
  {
    case 8:
      BOOL v8 = [*(id *)(a1 + 32) interfaceOrientationMapResolver];
      int v9 = [*(id *)(a1 + 40) currentSettings];
      char v10 = [v9 orientationSettings];
      id v11 = [v10 orientationMapResolver];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v8 isEqual:v11] ^ 1;

      break;
    case 4:
      uint64_t v6 = [*(id *)(a1 + 32) deviceOrientation];
      uint64_t v7 = [*(id *)(a1 + 40) currentDeviceOrientation];
      goto LABEL_7;
    case 2:
      uint64_t v6 = [*(id *)(a1 + 32) interfaceOrientation];
      uint64_t v7 = [*(id *)(a1 + 40) currentOrientation];
LABEL_7:
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v6 != v7;
      break;
  }
  *a4 = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
}

- (void)actuateZOrderLevelSettings
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_participant);
  id v4 = [WeakRetained currentSettings];
  id v11 = [v4 zOrderLevelSettings];

  id v5 = objc_loadWeakRetained((id *)&self->_scene);
  if (v5)
  {
    if (v11)
    {
      [v11 zOrderLevel];
      double v7 = v6;
      BOOL v8 = [v5 settings];
      [v8 level];
      char v9 = BSFloatEqualToFloat();

      if ((v9 & 1) == 0)
      {
        +[SBSceneSettingsUpdater safeUpdateScene:v5 withSceneLevel:v7];
        actuateZOrderAlongsideBlock = (void (**)(double))self->_actuateZOrderAlongsideBlock;
        if (actuateZOrderAlongsideBlock) {
          actuateZOrderAlongsideBlock[2](v7);
        }
      }
    }
  }
}

- (void)sceneContentStateDidChange:(id)a3
{
  id v5 = a3;
  if (!self->_invalidated)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);

    if (WeakRetained != v5)
    {
      BOOL v8 = [MEMORY[0x1E4F28B00] currentHandler];
      [v8 handleFailureInMethod:a2, self, @"SBTraitsSceneParticipantDelegate.m", 480, @"Invalid parameter not satisfying: %@", @"scene == _scene" object file lineNumber description];
    }
    id v7 = objc_loadWeakRetained((id *)&self->_participant);
    if (!v7)
    {
      char v9 = [MEMORY[0x1E4F28B00] currentHandler];
      char v10 = (objc_class *)objc_opt_class();
      id v11 = NSStringFromClass(v10);
      [v9 handleFailureInMethod:a2, self, @"SBTraitsSceneParticipantDelegate.m", 482, @"%@ participant is nil. Cannot propagate client settings changes", v11 object file lineNumber description];
    }
    if ([v5 contentState] == 2)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __63__SBTraitsSceneParticipantDelegate_sceneContentStateDidChange___block_invoke;
      block[3] = &unk_1E6AF5290;
      id v13 = v7;
      id v14 = self;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
  }
}

- (void)sceneHandle:(id)a3 didCreateScene:(id)a4
{
  id v10 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sceneHandle);

  if (WeakRetained != v10)
  {
    char v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"SBTraitsSceneParticipantDelegate.m", 461, @"Invalid parameter not satisfying: %@", @"handle == _sceneHandle" object file lineNumber description];
  }
  [(SBTraitsSceneParticipantDelegate *)self setScene:v7];
  if (v7) {
    [v10 removeObserver:self];
  }
}

- (void)setScene:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  if (WeakRetained != obj)
  {
    if (WeakRetained) {
      [(SBTraitsSceneParticipantDelegate *)self _resetToInitialState];
    }
    objc_storeWeak((id *)&self->_scene, obj);
    [obj addObserver:self];
  }
}

void __65__SBTraitsSceneParticipantDelegate_updatePreferencesWithUpdater___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(*(void *)(a1 + 32) + 96);
  id v9 = v3;
  if (v4)
  {
    [v4 floatValue];
    [v9 setPreferredZOrderLevel:v5];
  }
  else
  {
    double v6 = [*(id *)(a1 + 40) clientSettings];
    [v6 preferredLevel];
    if (v7 == 0.0)
    {
      BOOL v8 = [*(id *)(a1 + 40) settings];
      [v8 level];
      objc_msgSend(v9, "setPreferredZOrderLevel:");
    }
    else
    {
      objc_msgSend(v9, "setPreferredZOrderLevel:");
    }
  }
}

- (void)updatePreferencesForParticipant:(id)a3 updater:(id)a4
{
  id v13 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_participant);

  if (WeakRetained == v7)
  {
    if (v7) {
      goto LABEL_3;
    }
  }
  else
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"SBTraitsSceneParticipantDelegate.m", 580, @"Invalid parameter not satisfying: %@", @"participant == _participant" object file lineNumber description];

    if (v7) {
      goto LABEL_3;
    }
  }
  id v11 = [MEMORY[0x1E4F28B00] currentHandler];
  [v11 handleFailureInMethod:a2, self, @"SBTraitsSceneParticipantDelegate.m", 581, @"Invalid parameter not satisfying: %@", @"participant != nil" object file lineNumber description];

LABEL_3:
  id v9 = v13;
  if (!v13)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"SBTraitsSceneParticipantDelegate.m", 582, @"Invalid parameter not satisfying: %@", @"updater != nil" object file lineNumber description];

    id v9 = 0;
  }
  [(SBTraitsSceneParticipantDelegate *)self updatePreferencesWithUpdater:v9];
}

- (void)updatePreferencesWithUpdater:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    BOOL v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"SBTraitsSceneParticipantDelegate.m", 174, @"Invalid parameter not satisfying: %@", @"updater != nil" object file lineNumber description];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __65__SBTraitsSceneParticipantDelegate_updatePreferencesWithUpdater___block_invoke;
  v10[3] = &unk_1E6B06DC8;
  v10[4] = self;
  id v11 = WeakRetained;
  id v7 = WeakRetained;
  [v5 updateZOrderLevelPreferencesWithBlock:v10];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __65__SBTraitsSceneParticipantDelegate_updatePreferencesWithUpdater___block_invoke_2;
  v9[3] = &unk_1E6AFC568;
  v9[4] = self;
  [v5 updateOrientationPreferencesWithBlock:v9];
}

- (SBSceneHandle)sceneHandle
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sceneHandle);
  return (SBSceneHandle *)WeakRetained;
}

- (TRAParticipant)participant
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_participant);
  return (TRAParticipant *)WeakRetained;
}

- (void)setParticipant:(id)a3
{
  id obj = a3;
  if (obj)
  {
    id v5 = [obj role];
    char v6 = SBTraitsArbiterOrientationActuationEnabledForRole(v5);

    if ((v6 & 1) == 0)
    {
      id v7 = [MEMORY[0x1E4F28B00] currentHandler];
      BOOL v8 = (objc_class *)objc_opt_class();
      id v9 = NSStringFromClass(v8);
      id v10 = [obj role];
      [v7 handleFailureInMethod:a2, self, @"SBTraitsSceneParticipantDelegate.m", 167, @"%@ requires its participant{%@} to be active", v9, v10 object file lineNumber description];
    }
  }
  p_participant = &self->_participant;
  id WeakRetained = objc_loadWeakRetained((id *)p_participant);

  if (WeakRetained != obj) {
    objc_storeWeak((id *)p_participant, obj);
  }
}

- (void)setOrientationActuationEnabled:(BOOL)a3
{
  self->_orientationActuationEnabled = a3;
}

- (void)setArbiter:(id)a3
{
}

- (void)setActuateOrientationAlongsideBlock:(id)a3
{
}

void __65__SBTraitsSceneParticipantDelegate_updatePreferencesWithUpdater___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 56);
  id v4 = a2;
  [v4 setCanDetermineActiveOrientation:v3];
  objc_msgSend(v4, "setSupportedOrientations:", objc_msgSend(*(id *)(a1 + 32), "_supportedOrientations"));
  objc_msgSend(v4, "setPreferredOrientation:", objc_msgSend(*(id *)(a1 + 32), "_preferredOrientation"));
}

- (unint64_t)_supportedOrientations
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  if ([WeakRetained isActive])
  {
    id v4 = [WeakRetained clientSettings];
    uint64_t v5 = [v4 supportedInterfaceOrientations];
    if (!v5) {
      uint64_t v5 = [(SBTraitsSceneParticipantDelegate *)self _allLegalOrientations];
    }
    char v6 = [(SBTraitsSceneParticipantDelegate *)self _application];
    unint64_t v7 = [(SBTraitsSceneParticipantDelegate *)self _sanitizedMask:v5 forApplication:v6];
  }
  else
  {
    unint64_t v7 = [(SBTraitsSceneParticipantDelegate *)self _bestGuessSupportedInterfaceOrientations];
  }

  return v7;
}

- (int64_t)_preferredOrientation
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  if ([WeakRetained isActive])
  {
    uint64_t v3 = [WeakRetained clientSettings];
    int64_t v4 = [v3 preferredInterfaceOrientation];
    if (!v4)
    {
      uint64_t v5 = [WeakRetained settings];
      int64_t v4 = [v5 interfaceOrientation];
    }
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

- (unint64_t)_bestGuessSupportedInterfaceOrientations
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  uint64_t v5 = WeakRetained;
  if (WeakRetained && [WeakRetained isActive])
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"SBTraitsSceneParticipantDelegate.m" lineNumber:206 description:@"_bestGuessSupportedInterfaceOrientations should only be used if we still either lack a scene or the scene is not active yet."];
  }
  char v6 = [(SBTraitsSceneParticipantDelegate *)self _application];
  unint64_t v7 = v6;
  if (!v6) {
    goto LABEL_9;
  }
  if ([v6 isMedusaCapable])
  {
    uint64_t v8 = 30;
  }
  else
  {
    id v9 = [v7 info];
    uint64_t v8 = [v9 supportedInterfaceOrientations];
  }
  unint64_t v10 = [(SBTraitsSceneParticipantDelegate *)self _sanitizedMask:v8 forApplication:v7];
  if (!v10)
  {
LABEL_9:
    unint64_t v10 = [(SBTraitsSceneParticipantDelegate *)self initialSupportedOrientationsOverride];
    if (!v10) {
      unint64_t v10 = [(SBTraitsSceneParticipantDelegate *)self _allLegalOrientations];
    }
  }

  return v10;
}

- (unint64_t)_sanitizedMask:(unint64_t)a3 forApplication:(id)a4
{
  id v6 = a4;
  if (a3 == 4
    && ![(SBTraitsSceneParticipantDelegate *)self _isAllowedToHavePortraitUpsideDown])
  {
    unint64_t v7 = 2;
  }
  else
  {
    unint64_t v7 = [(SBTraitsSceneParticipantDelegate *)self _allLegalOrientations] & a3;
  }

  return v7;
}

- (unint64_t)_allLegalOrientations
{
  if ([(SBTraitsSceneParticipantDelegate *)self _isAllowedToHavePortraitUpsideDown])
  {
    return 30;
  }
  else
  {
    return 26;
  }
}

- (BOOL)_isAllowedToHavePortraitUpsideDown
{
  if (__sb__runningInSpringBoard())
  {
    BOOL v2 = SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1
      || SBFEffectiveHomeButtonType() != 2;
  }
  else
  {
    uint64_t v3 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v3 userInterfaceIdiom]) {
      BOOL v2 = 1;
    }
    else {
      BOOL v2 = SBFEffectiveHomeButtonType() != 2;
    }
  }
  int64_t v4 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v5 = [v4 userInterfaceIdiom];

  return (v5 & 0xFFFFFFFFFFFFFFFBLL) == 1 || v2;
}

- (unint64_t)initialSupportedOrientationsOverride
{
  return self->_initialSupportedOrientationsOverride;
}

- (id)_application
{
  uint64_t v3 = objc_opt_class();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sceneHandle);
  uint64_t v5 = SBSafeCast(v3, WeakRetained);

  id v6 = [v5 application];
  id v7 = objc_loadWeakRetained((id *)&self->_scene);
  uint64_t v8 = v7;
  if (!v6)
  {
    id v9 = [v7 clientHandle];
    unint64_t v10 = [v8 clientHandle];
    id v11 = [v10 processHandle];

    if (v11)
    {
      id v12 = +[SBApplicationController sharedInstance];
      id v13 = [v9 bundleIdentifier];
      id v6 = [v12 applicationWithBundleIdentifier:v13];
    }
    else
    {
      id v6 = 0;
    }
  }
  return v6;
}

- (SBTraitsSceneParticipantDelegate)initWithSceneHandle:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 sceneIfExists];
  id v6 = [(SBTraitsSceneParticipantDelegate *)self initWithScene:v5];

  if (v6)
  {
    objc_storeWeak((id *)&v6->_sceneHandle, v4);
    [v4 addObserver:v6];
  }

  return v6;
}

- (SBTraitsSceneParticipantDelegate)initWithScene:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SBTraitsSceneParticipantDelegate;
  uint64_t v5 = [(SBTraitsSceneParticipantDelegate *)&v8 init];
  id v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_scene, v4);
    [v4 addObserver:v6];
    *(_WORD *)&v6->_orientationActuationEnabled = 257;
  }

  return v6;
}

void __74__SBTraitsSceneParticipantDelegate__evaluateOrientationTransitionContext___block_invoke(uint64_t a1, void *a2)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setReason:v3];
  [v4 setOrientationActuationContext:*(void *)(a1 + 40)];
  uint64_t v5 = [*(id *)(a1 + 48) uniqueIdentifier];
  v7[0] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  [v4 setRequestingParticipantsUniqueIdentifiers:v6];
}

void __110__SBTraitsSceneParticipantDelegate_scene_didUpdateClientSettingsWithDiff_oldClientSettings_transitionContext___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _evaluateOrientationTransitionContext:a2];
}

- (void)_evaluateOrientationTransitionContext:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  BSDispatchQueueAssertMain();
  if (!self->_invalidated)
  {
    v28 = [(SBTraitsSceneParticipantDelegate *)self scene];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_arbiter);
    id v7 = objc_loadWeakRetained((id *)&self->_participant);
    objc_super v8 = [v5 animationFence];
    uint64_t v29 = [v5 animationSettings];
    uint64_t v9 = objc_opt_class();
    unint64_t v10 = SBSafeCast(v9, v5);
    id v11 = v10;
    if (v10) {
      uint64_t v12 = [v10 disableTouchCancellationOnRotation];
    }
    else {
      uint64_t v12 = 0;
    }
    id v13 = NSString;
    id v14 = [v7 role];
    uint64_t v27 = [v13 stringWithFormat:@"%@ scene settings update", v14];

    double v15 = (void *)v29;
    if (v29 || v8 || v12)
    {
      int v17 = WeakRetained;
      if (!WeakRetained)
      {
        unint64_t v18 = SBLogTraitsArbiter();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          v26 = [v7 role];
          *(_DWORD *)buf = 138543874;
          v35 = self;
          __int16 v36 = 2114;
          v37 = v28;
          __int16 v38 = 2114;
          v39 = v26;
          _os_log_error_impl(&dword_1D85BA000, v18, OS_LOG_TYPE_ERROR, "%{public}@ arbiter is nil for scene %{public}@. Cannot propagate animated client settings changes for delegate of participant with role %{public}@", buf, 0x20u);
        }
        uint64_t v19 = [MEMORY[0x1E4F28B00] currentHandler];
        uint64_t v20 = (objc_class *)objc_opt_class();
        v21 = NSStringFromClass(v20);
        [v19 handleFailureInMethod:a2, self, @"SBTraitsSceneParticipantDelegate.m", 549, @"%@ arbiter is nil. Cannot propagate animated client settings changes", v21 object file lineNumber description];

        int v17 = 0;
        double v15 = (void *)v29;
      }
      v22 = (void *)[objc_alloc(MEMORY[0x1E4FAFFC8]) initWithAnimationSettings:v15 drawingFence:v8 preventTouchCancellation:v12];
      [MEMORY[0x1E4F42D58] _synchronizeDrawingWithFence:v8];
      id v23 = objc_alloc(MEMORY[0x1E4FAFF78]);
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __74__SBTraitsSceneParticipantDelegate__evaluateOrientationTransitionContext___block_invoke;
      v30[3] = &unk_1E6B06E68;
      uint8x8_t v16 = v27;
      id v31 = v27;
      id v32 = v22;
      id v33 = v7;
      id v24 = v22;
      id v25 = (void *)[v23 initWithBuilder:v30];
      [v17 setNeedsUpdateArbitrationWithContext:v25];

      double v15 = (void *)v29;
    }
    else
    {
      uint8x8_t v16 = v27;
      [v7 setNeedsUpdatePreferencesWithReason:v27];
      int v17 = WeakRetained;
    }
  }
}

- (FBScene)scene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  return (FBScene *)WeakRetained;
}

- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (self->_invalidated) {
    goto LABEL_13;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);

  if (WeakRetained != v11)
  {
    id v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2, self, @"SBTraitsSceneParticipantDelegate.m", 505, @"Invalid parameter not satisfying: %@", @"scene == _scene" object file lineNumber description];
  }
  id v16 = objc_loadWeakRetained((id *)&self->_participant);

  if (v16)
  {
    if (v12)
    {
LABEL_6:
      sceneClientSettingsDiffInspector = self->_sceneClientSettingsDiffInspector;
      if (!sceneClientSettingsDiffInspector)
      {
        objc_initWeak(&location, self);
        v29[0] = MEMORY[0x1E4F143A8];
        v29[1] = 3221225472;
        v29[2] = __110__SBTraitsSceneParticipantDelegate_scene_didUpdateClientSettingsWithDiff_oldClientSettings_transitionContext___block_invoke;
        v29[3] = &unk_1E6AF85E0;
        objc_copyWeak(&v30, &location);
        unint64_t v18 = (void *)MEMORY[0x1D948C7A0](v29);
        uint64_t v19 = (UIApplicationSceneClientSettingsDiffInspector *)objc_alloc_init(MEMORY[0x1E4F42768]);
        uint64_t v20 = self->_sceneClientSettingsDiffInspector;
        self->_sceneClientSettingsDiffInspector = v19;

        [(UIApplicationSceneClientSettingsDiffInspector *)self->_sceneClientSettingsDiffInspector observeSupportedInterfaceOrientationsWithBlock:v18];
        [(UIApplicationSceneClientSettingsDiffInspector *)self->_sceneClientSettingsDiffInspector observePreferredInterfaceOrientationWithBlock:v18];

        objc_destroyWeak(&v30);
        objc_destroyWeak(&location);
        sceneClientSettingsDiffInspector = self->_sceneClientSettingsDiffInspector;
      }
      [v12 evaluateWithInspector:sceneClientSettingsDiffInspector context:v14];
    }
  }
  else
  {
    v26 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v27 = (objc_class *)objc_opt_class();
    v28 = NSStringFromClass(v27);
    [v26 handleFailureInMethod:a2, self, @"SBTraitsSceneParticipantDelegate.m", 506, @"%@ participant is nil. Cannot propagate client settings changes", v28 object file lineNumber description];

    if (v12) {
      goto LABEL_6;
    }
  }
  v21 = [v14 actions];

  if (v21)
  {
    orientationRequestActionAssistant = self->_orientationRequestActionAssistant;
    if (!orientationRequestActionAssistant)
    {
      id v23 = [[SBTraitsSceneOrientationRequestAssistant alloc] initWithTraitsSceneDelegate:self errorDomain:@"SBTraitsSceneParticipantDelegateErrorDomain"];
      id v24 = self->_orientationRequestActionAssistant;
      self->_orientationRequestActionAssistant = v23;

      orientationRequestActionAssistant = self->_orientationRequestActionAssistant;
    }
    [(SBTraitsSceneOrientationRequestAssistant *)orientationRequestActionAssistant setUpForTransitionContextIfNeeded:v14];
  }
LABEL_13:
}

uint64_t __63__SBTraitsSceneParticipantDelegate_sceneContentStateDidChange___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setNeedsUpdatePreferencesWithReason:@"scene became ready (foreground)" animate:0];
  BOOL v2 = *(unsigned char **)(a1 + 40);
  if (v2[57])
  {
    [v2 actuateOrientationSettingsWithContext:0];
    BOOL v2 = *(unsigned char **)(a1 + 40);
  }
  return [v2 actuateUserInterfaceStyleSettingsWithContext:0];
}

void __81__SBTraitsSceneParticipantDelegate_actuateUserInterfaceStyleSettingsWithContext___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = a3;
  [a2 setUserInterfaceStyle:v5];
  id v7 = [*(id *)(a1 + 32) drawingFence];
  [v6 setAnimationFence:v7];

  id v8 = [*(id *)(a1 + 32) animationSettings];
  [v6 setAnimationSettings:v8];
}

- (void)invalidate
{
  self->_invalidated = 1;
  p_scene = &self->_scene;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  [WeakRetained removeObserver:self];

  objc_storeWeak((id *)p_scene, 0);
  id v5 = objc_loadWeakRetained((id *)&self->_sceneHandle);
  [v5 removeObserver:self];

  objc_storeWeak((id *)&self->_sceneHandle, 0);
}

- (void)dealloc
{
  [(SBTraitsSceneParticipantDelegate *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SBTraitsSceneParticipantDelegate;
  [(SBTraitsSceneParticipantDelegate *)&v3 dealloc];
}

- (NSString)description
{
  objc_super v3 = (void *)MEMORY[0x1E4F28E78];
  v9.receiver = self;
  v9.super_class = (Class)SBTraitsSceneParticipantDelegate;
  id v4 = [(SBTraitsSceneParticipantDelegate *)&v9 description];
  id v5 = [v3 stringWithString:v4];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_participant);
  id v7 = [(SBTraitsSceneParticipantDelegate *)self participantAssociatedSceneIdentityTokens:WeakRetained];
  [v5 appendFormat:@" %@", v7];

  return (NSString *)v5;
}

- (void)setSceneHandle:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sceneHandle);
  if ((SBEqualObjects(WeakRetained, obj) & 1) == 0)
  {
    if (WeakRetained) {
      [(SBTraitsSceneParticipantDelegate *)self _resetToInitialState];
    }
    id v5 = [obj sceneIfExists];
    [(SBTraitsSceneParticipantDelegate *)self setScene:v5];

    objc_storeWeak((id *)&self->_sceneHandle, obj);
    id v6 = objc_loadWeakRetained((id *)&self->_scene);

    if (!v6) {
      [obj addObserver:self];
    }
  }
}

- (void)actuateOrientationSettingsWithContext:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_participant);
  id v6 = objc_loadWeakRetained((id *)&self->_scene);
  if (v6)
  {
    id v7 = [WeakRetained currentSettings];

    if (v7)
    {
      uint64_t v24 = 0;
      uint64_t v25 = 0;
      uint64_t v23 = 0;
      SBTraitsSceneParticipantDelegateOrientationChangeInspector(v6, WeakRetained, &v25, &v24, &v23);
      [(SBTraitsSceneOrientationRequestAssistant *)self->_orientationRequestActionAssistant checkValidityAgainstUpdateReasons:v23];
      char v8 = v23;
      if ((v23 & 0xE) != 0)
      {
        objc_super v9 = [v4 drawingFence];
        if ((v8 & 1) == 0 && self->_orientationActuationAnimatable && [v6 contentState] == 2)
        {
          uint64_t v10 = +[SBAnimationUtilities animationSettingsForRotationFromOrientation:v24 toOrientation:v25 withContext:v4];
        }
        else
        {
          uint64_t v10 = [MEMORY[0x1E4F4F680] settingsWithDuration:0.0];
        }
        id v11 = (void *)v10;
        int v12 = [v6 isActive];
        if ((v8 & 2) != 0)
        {
          if (v12)
          {
            id v13 = [v4 animationSettings];

            if (v13)
            {
              if (!v9)
              {
                [(BKSAnimationFenceHandle *)self->_fallbackFence_90210730 invalidate];
                id v14 = [(id)*MEMORY[0x1E4F43630] _systemAnimationFenceCreatingIfNecessary:1];
                fallbackFence_90210730 = self->_fallbackFence_90210730;
                self->_fallbackFence_90210730 = v14;

                objc_super v9 = self->_fallbackFence_90210730;
              }
            }
          }
        }
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __74__SBTraitsSceneParticipantDelegate_actuateOrientationSettingsWithContext___block_invoke;
        v20[3] = &unk_1E6B06E18;
        v20[4] = self;
        id v16 = v9;
        v21 = v16;
        id v17 = v11;
        id v22 = v17;
        +[SBSceneSettingsUpdater safeUpdateScene:v6 withBlock:v20];
        if ((v8 & 2) != 0 && self->_actuateOrientationAlongsideBlock)
        {
          [MEMORY[0x1E4F43058] _synchronizeDrawing];
          v19[0] = MEMORY[0x1E4F143A8];
          v19[1] = 3221225472;
          v19[2] = __74__SBTraitsSceneParticipantDelegate_actuateOrientationSettingsWithContext___block_invoke_2;
          v19[3] = &unk_1E6AF4A70;
          v19[4] = self;
          v19[5] = v23;
          [MEMORY[0x1E4F4F898] animateWithSettings:v17 actions:v19 completion:0];
        }
        [(BKSAnimationFenceHandle *)self->_fallbackFence_90210730 invalidate];
        unint64_t v18 = self->_fallbackFence_90210730;
        self->_fallbackFence_90210730 = 0;
      }
    }
  }
}

void __74__SBTraitsSceneParticipantDelegate_actuateOrientationSettingsWithContext___block_invoke(void *a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = (void *)a1[4];
  id v6 = a3;
  [v5 updateOrientationSceneSettingsForParticipant:v8];
  [v6 setAnimationFence:a1[5]];
  [v6 setAnimationSettings:a1[6]];

  uint64_t v7 = *(void *)(a1[4] + 136);
  if (v7) {
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v8);
  }
}

uint64_t __74__SBTraitsSceneParticipantDelegate_actuateOrientationSettingsWithContext___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 128) + 16))();
}

- (int64_t)sceneCurrentOrientation
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sceneHandle);
  objc_super v3 = [WeakRetained sceneIfExists];
  id v4 = [v3 settings];
  int64_t v5 = [v4 interfaceOrientation];

  return v5;
}

- (void)sceneHandle:(id)a3 didDestroyScene:(id)a4
{
  p_sceneHandle = &self->_sceneHandle;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_sceneHandle);

  if (WeakRetained != v7)
  {
    objc_super v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"SBTraitsSceneParticipantDelegate.m", 469, @"Invalid parameter not satisfying: %@", @"handle == _sceneHandle" object file lineNumber description];
  }
  [(SBTraitsSceneParticipantDelegate *)self setScene:0];
}

- (void)_resetToInitialState
{
  self->_unint64_t orientationMode = 0;
  [(SBTraitsSceneOrientationRequestAssistant *)self->_orientationRequestActionAssistant invalidate];
  orientationRequestActionAssistant = self->_orientationRequestActionAssistant;
  self->_orientationRequestActionAssistant = 0;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_sceneHandle);
  [WeakRetained removeObserver:self];

  id v5 = objc_loadWeakRetained((id *)&self->_scene);
  [v5 removeObserver:self];

  objc_storeWeak((id *)&self->_sceneHandle, 0);
  objc_storeWeak((id *)&self->_scene, 0);
}

- (void)participantWillInvalidate:(id)a3
{
  p_participant = &self->_participant;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_participant);

  if (WeakRetained != v6)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"SBTraitsSceneParticipantDelegate.m", 613, @"Invalid parameter not satisfying: %@", @"participant == _participant" object file lineNumber description];
  }
  [(SBTraitsSceneParticipantDelegate *)self invalidate];
}

- (void)appendDescriptionForParticipant:(id)a3 withBuilder:(id)a4 multilinePrefix:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [(SBTraitsSceneParticipantDelegate *)self participantAssociatedSceneIdentityTokens:a3];
  id v11 = v10;
  if (v10)
  {
    int v12 = objc_msgSend(v10, "bs_map:", &__block_literal_global_245);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __96__SBTraitsSceneParticipantDelegate_appendDescriptionForParticipant_withBuilder_multilinePrefix___block_invoke_2;
    v14[3] = &unk_1E6AF5290;
    id v15 = v8;
    id v16 = v12;
    id v13 = v12;
    [v15 appendBodySectionWithName:@"Associated Scenes" multilinePrefix:v9 block:v14];
  }
}

uint64_t __96__SBTraitsSceneParticipantDelegate_appendDescriptionForParticipant_withBuilder_multilinePrefix___block_invoke(uint64_t a1, void *a2)
{
  return [a2 stringRepresentation];
}

uint64_t __96__SBTraitsSceneParticipantDelegate_appendDescriptionForParticipant_withBuilder_multilinePrefix___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) appendArraySection:*(void *)(a1 + 40) withName:@"Associated Scene Tokens" skipIfEmpty:0];
}

- (id)participantAssociatedSceneIdentityTokens:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  if (WeakRetained
    || (id v5 = objc_loadWeakRetained((id *)&self->_sceneHandle),
        [v5 sceneIfExists],
        id WeakRetained = objc_claimAutoreleasedReturnValue(),
        v5,
        WeakRetained))
  {
    id v6 = [WeakRetained identityToken];
    v9[0] = v6;
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  }
  else
  {
    id v7 = 0;
  }
  return v7;
}

- (TRAArbiter)arbiter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_arbiter);
  return (TRAArbiter *)WeakRetained;
}

- (BOOL)canDetermineActiveOrientation
{
  return self->_canDetermineActiveOrientation;
}

- (void)setCanDetermineActiveOrientation:(BOOL)a3
{
  self->_canDetermineActiveOrientation = a3;
}

- (NSNumber)preferredSceneLevel
{
  return self->_preferredSceneLevel;
}

- (void)setPreferredSceneLevel:(id)a3
{
}

- (BOOL)isOrientationActuationAnimatable
{
  return self->_orientationActuationAnimatable;
}

- (void)setOrientationActuationAnimatable:(BOOL)a3
{
  self->_orientationActuationAnimatable = a3;
}

- (int64_t)orientationModeOverride
{
  return self->_orientationModeOverride;
}

- (void)setOrientationModeOverride:(int64_t)a3
{
  self->_orientationModeOverride = a3;
}

- (void)setInitialSupportedOrientationsOverride:(unint64_t)a3
{
  self->_initialSupportedOrientationsOverride = a3;
}

- (id)actuateZOrderAlongsideBlock
{
  return self->_actuateZOrderAlongsideBlock;
}

- (void)setActuateZOrderAlongsideBlock:(id)a3
{
}

- (id)actuateOrientationAlongsideBlock
{
  return self->_actuateOrientationAlongsideBlock;
}

- (id)actuateOrientationSettingsAlongsideBlock
{
  return self->_actuateOrientationSettingsAlongsideBlock;
}

- (void)setActuateOrientationSettingsAlongsideBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_actuateOrientationSettingsAlongsideBlock, 0);
  objc_storeStrong(&self->_actuateOrientationAlongsideBlock, 0);
  objc_storeStrong(&self->_actuateZOrderAlongsideBlock, 0);
  objc_storeStrong((id *)&self->_preferredSceneLevel, 0);
  objc_destroyWeak((id *)&self->_participant);
  objc_destroyWeak((id *)&self->_arbiter);
  objc_destroyWeak((id *)&self->_sceneHandle);
  objc_destroyWeak((id *)&self->_scene);
  objc_storeStrong((id *)&self->_fallbackFence_90210730, 0);
  objc_storeStrong((id *)&self->_bundleOrientationProperties, 0);
  objc_storeStrong((id *)&self->_sceneClientSettingsDiffInspector, 0);
  objc_storeStrong((id *)&self->_orientationRequestActionAssistant, 0);
}

@end