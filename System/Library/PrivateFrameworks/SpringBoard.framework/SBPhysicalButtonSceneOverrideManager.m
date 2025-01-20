@interface SBPhysicalButtonSceneOverrideManager
- (BOOL)_canSendCameraCaptureFullPressEventsToScene:(id)a3 withConfiguration:(id)a4;
- (BOOL)_canSendCameraShutterButtonEventsForRequestAuditToken:(id)a3;
- (BOOL)_canSendRingerButtonEventsToScene:(id)a3 withConfiguration:(id)a4;
- (BOOL)_canSendVolumeButtonEventsToScene:(id)a3 withConfiguration:(id)a4 activeVolumeCategoryName:(id)a5 isAudioSessionPlaying:(BOOL)a6;
- (BOOL)_sendsActionsForButtonType:(unint64_t)a3;
- (BOOL)isTargetingButton:(uint64_t)a3 withConfigurationIdentifier:;
- (char)sendVolumeButtonDownForIncrease:(unsigned char *)a3 shouldAlsoChangeVolume:;
- (id)_activeRequestForButton:(unint64_t)a3;
- (id)_applicationBundleIdentifierForClientBundleIdentifier:(id)a3;
- (id)_sceneForSceneTarget:(id)a3;
- (id)_sendButtonDownForButtonType:(unint64_t)a3 request:(id)a4 scene:(id)a5;
- (id)addObserver:(uint64_t)a3 forReason:;
- (id)auditTokenForRequestingProcessOfCameraBehaviorScene;
- (id)cameraBehaviorScene;
- (id)initWithSceneManager:(id *)a1;
- (id)reasonCameraBehaviorSceneIsNotEligibleForSupplementalUI;
- (id)sceneManager;
- (id)sendCameraCaptureButtonDown;
- (id)sendRingerButtonDown;
- (id)setSceneManager:(id *)result;
- (id)setWindowScene:(id *)result;
- (id)windowScene;
- (void)_addButtonActionCompletionHandler:(id)a3;
- (void)_notifyObserversSomethingDidChange;
- (void)_processZStackParticipantSettings:(id)a3;
- (void)_reevaluateOverrides;
- (void)_removeButtonActionCompletionHandler:(id)a3;
- (void)_sendActionForButtonType:(unint64_t)a3 buttonState:(unint64_t)a4 request:(id)a5;
- (void)cache:(id)a3 didUpdateActiveCategoryName:(id)a4;
- (void)cache:(id)a3 didUpdateAudioSessionPlaying:(BOOL)a4;
- (void)dealloc;
- (void)windowSceneDidConnect:(id *)a1;
- (void)zStackParticipantWithIdentifier:(int64_t)a3 settingsDidChange:(id)a4;
- (void)zStackParticipantWithIdentifier:(int64_t)a3 wasAcquiredWithSettings:(id)a4;
@end

@implementation SBPhysicalButtonSceneOverrideManager

- (void)zStackParticipantWithIdentifier:(int64_t)a3 settingsDidChange:(id)a4
{
}

- (id)cameraBehaviorScene
{
  p_cameraCaptureButtonRequest = &self->_cameraCaptureButtonRequest;
  cameraCaptureButtonRequest = self->_cameraCaptureButtonRequest;
  if (!cameraCaptureButtonRequest
    || [(SBPhysicalButtonBehaviorRequest *)cameraCaptureButtonRequest physicalButtonBehavior])
  {
    p_cameraCaptureButtonRequest = &self->_ringerButtonRequest;
    ringerButtonRequest = self->_ringerButtonRequest;
    if (!ringerButtonRequest
      || [(SBPhysicalButtonBehaviorRequest *)ringerButtonRequest physicalButtonBehavior])
    {
      p_cameraCaptureButtonRequest = &self->_volumeUpButtonRequest;
      volumeUpButtonRequest = self->_volumeUpButtonRequest;
      if (!volumeUpButtonRequest
        || [(SBPhysicalButtonBehaviorRequest *)volumeUpButtonRequest physicalButtonBehavior])
      {
        volumeDownButtonRequest = self->_volumeDownButtonRequest;
        p_volumeDownButtonRequest = &self->_volumeDownButtonRequest;
        v7 = volumeDownButtonRequest;
        if (!volumeDownButtonRequest) {
          goto LABEL_12;
        }
        if ([v7 physicalButtonBehavior])
        {
          v7 = 0;
          goto LABEL_12;
        }
        p_cameraCaptureButtonRequest = p_volumeDownButtonRequest;
      }
    }
  }
  v7 = [(SBPhysicalButtonBehaviorRequest *)*p_cameraCaptureButtonRequest scene];
LABEL_12:
  return v7;
}

- (void)_processZStackParticipantSettings:(id)a3
{
  id v7 = a3;
  v4 = [v7 physicalButtonSceneTargets];
  char v5 = BSEqualArrays();
  if ((v5 & 1) == 0) {
    objc_storeStrong((id *)&self->_lastPhysicalButtonSceneTargets, v4);
  }
  v6 = [v7 captureButtonFullFidelityEventRequestingScenes];
  if ((BSEqualArrays() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_lastScenesRequestingFullFidelityCaptureButtonEvents, v6);
    goto LABEL_7;
  }
  if ((v5 & 1) == 0) {
LABEL_7:
  }
    -[SBPhysicalButtonSceneOverrideManager _reevaluateOverrides]((id *)&self->super.isa);
}

- (void)cache:(id)a3 didUpdateAudioSessionPlaying:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v6 = SBLogButtonsInteraction();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = v4;
    _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "Re-evaluating overrides with audioSessionPlaying: %{BOOL}u", (uint8_t *)v7, 8u);
  }

  -[SBPhysicalButtonSceneOverrideManager _reevaluateOverrides]((id *)&self->super.isa);
}

- (void)_reevaluateOverrides
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_1D85BA000, log, OS_LOG_TYPE_ERROR, "You must override both volume buttons", buf, 2u);
}

- (BOOL)_canSendVolumeButtonEventsToScene:(id)a3 withConfiguration:(id)a4 activeVolumeCategoryName:(id)a5 isAudioSessionPlaying:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  BOOL v13 = 0;
  if (v10 && v11)
  {
    if (![v11 _behavior])
    {
      char v17 = [(SBPhysicalButtonSceneOverrideManager *)self _canSendCameraCaptureFullPressEventsToScene:v10 withConfiguration:v11];
LABEL_10:
      BOOL v13 = v17;
      goto LABEL_11;
    }
    if ([v11 _behavior] == 2)
    {
      v14 = [v10 definition];
      v15 = [v14 clientIdentity];
      int v16 = [v15 isLocal];

      if (v16) {
        char v17 = [(SBVolumeControl *)self->_volumeControl canChangeVolumeForActiveCategory:v12 isAudioSessionPlaying:v6];
      }
      else {
        char v17 = [v12 isEqualToString:@"Audio/Video"];
      }
      goto LABEL_10;
    }
    BOOL v13 = 1;
  }
LABEL_11:

  return v13;
}

- (BOOL)_canSendCameraCaptureFullPressEventsToScene:(id)a3 withConfiguration:(id)a4
{
  BOOL v4 = 0;
  if (a3 && a4)
  {
    id v7 = a3;
    uint64_t v8 = [a4 _auditToken];
    v9 = [v7 clientHandle];

    if ([(SBPhysicalButtonSceneOverrideManager *)self _canSendCameraShutterButtonEventsForRequestAuditToken:v8])
    {
      BOOL v4 = 1;
    }
    else
    {
      id v10 = [v9 processHandle];
      if (!v10) {
        goto LABEL_11;
      }
      if (v8) {
        objc_msgSend(v8, "realToken", (unsigned __int128)0, (unsigned __int128)0);
      }
      if ((BSAuditTokenTaskHasEntitlement() & 1) != 0 || BSAuditTokenTaskHasEntitlement()) {
        BOOL v4 = 1;
      }
      else {
LABEL_11:
      }
        BOOL v4 = 0;
    }
  }
  return v4;
}

- (BOOL)_canSendCameraShutterButtonEventsForRequestAuditToken:(id)a3
{
  if (self) {
    cameraViewfinderMonitorToken = self->_cameraViewfinderMonitorToken;
  }
  else {
    cameraViewfinderMonitorToken = 0;
  }
  id v4 = a3;
  char v5 = [(SBCameraViewfinderMonitoring *)cameraViewfinderMonitorToken auditTokenForProcessWithActiveOrImminentViewfinderSession];
  char v6 = [v4 hasSameProcessAsAuditToken:v5];

  return v6;
}

- (id)_sceneForSceneTarget:(id)a3
{
  id v4 = a3;
  char v5 = [v4 scene];
  char v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    if (self) {
      self = (SBPhysicalButtonSceneOverrideManager *)objc_loadWeakRetained((id *)&self->_sceneManager);
    }
    uint64_t v8 = [v4 sceneIdentity];
    v9 = [(SBPhysicalButtonSceneOverrideManager *)self allScenes];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __61__SBPhysicalButtonSceneOverrideManager__sceneForSceneTarget___block_invoke;
    v12[3] = &unk_1E6AF9B20;
    id v13 = v8;
    id v10 = v8;
    objc_msgSend(v9, "bs_firstObjectPassingTest:", v12);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

- (BOOL)_canSendRingerButtonEventsToScene:(id)a3 withConfiguration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  LOBYTE(v9) = 0;
  if (v6 && v7)
  {
    id v10 = [(id)SBApp systemActionControl];
    id v11 = [v6 clientHandle];
    id v12 = [v11 bundleIdentifier];
    id v13 = [(SBPhysicalButtonSceneOverrideManager *)self _applicationBundleIdentifierForClientBundleIdentifier:v12];

    if (-[SBSystemActionControl isSelectedActionHostedByApplicationWithBundleIdentifier:]((uint64_t)v10, v13)) {
      goto LABEL_6;
    }
    v14 = [v11 processHandle];
    v9 = v14;
    if (v14)
    {
      objc_msgSend(v14, "auditToken", 0, 0, 0, 0);
      int HasEntitlement = BSAuditTokenTaskHasEntitlement();

      if (HasEntitlement)
      {
LABEL_6:
        if ([v8 _behavior]) {
          LOBYTE(v9) = 1;
        }
        else {
          LOBYTE(v9) = [(SBPhysicalButtonSceneOverrideManager *)self _canSendCameraCaptureFullPressEventsToScene:v6 withConfiguration:v8];
        }
        goto LABEL_10;
      }
      LOBYTE(v9) = 0;
    }
LABEL_10:
  }
  return (char)v9;
}

- (id)_applicationBundleIdentifierForClientBundleIdentifier:(id)a3
{
  id v4 = a3;
  char v5 = [(SBFCaptureApplicationProviding *)self->_captureApplicationProvider captureApplicationForExtensionIdentifier:v4];
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 bundleIdentifier];
  }
  else
  {
    id v7 = v4;
  }
  uint64_t v8 = v7;

  return v8;
}

- (void)_notifyObserversSomethingDidChange
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v3 = [(BSCompoundAssertion *)self->_observers orderedContext];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
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
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) physicalButtonSceneOverridesDidChange:self];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (id)initWithSceneManager:(id *)a1
{
  id v3 = a2;
  if (a1)
  {
    v17.receiver = a1;
    v17.super_class = (Class)SBPhysicalButtonSceneOverrideManager;
    uint64_t v4 = (id *)objc_msgSendSuper2(&v17, sel_init);
    a1 = v4;
    if (v4)
    {
      objc_storeWeak(v4 + 2, v3);
      uint64_t v5 = [(id)SBApp volumeControl];
      id v6 = a1[4];
      a1[4] = (id)v5;

      uint64_t v7 = +[SBAVSystemControllerCache sharedInstance];
      id v8 = a1[5];
      a1[5] = (id)v7;

      [a1[5] addObserver:a1];
      uint64_t v9 = +[SBCaptureApplicationCenter sharedInstance];
      id v10 = a1[16];
      a1[16] = (id)v9;

      long long v11 = +[SBCameraViewfinderMonitor sharedInstance];
      uint64_t v12 = [v11 addObserver:a1];
      id v13 = a1[6];
      a1[6] = (id)v12;

      uint64_t v14 = [MEMORY[0x1E4F4F6E8] assertionWithIdentifier:@"SBPhysicalButtonSceneOverrideManager observers"];
      id v15 = a1[10];
      a1[10] = (id)v14;

      *((_WORD *)a1 + 4) = 257;
    }
  }

  return a1;
}

- (void)dealloc
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  uint64_t v4 = [WeakRetained zStackResolver];

  [v4 removeObserver:self ofParticipantWithIdentifier:30];
  v5.receiver = self;
  v5.super_class = (Class)SBPhysicalButtonSceneOverrideManager;
  [(SBPhysicalButtonSceneOverrideManager *)&v5 dealloc];
}

- (id)addObserver:(uint64_t)a3 forReason:
{
  if (a1)
  {
    a1 = [a1[10] acquireForReason:a3 withContext:a2];
    uint64_t v3 = vars8;
  }
  return a1;
}

- (void)windowSceneDidConnect:(id *)a1
{
  id obj = a2;
  if (!a1)
  {
LABEL_4:

    return;
  }
  id WeakRetained = objc_loadWeakRetained(a1 + 3);

  if (!WeakRetained)
  {
    objc_storeWeak(a1 + 3, obj);
    uint64_t v4 = [obj zStackResolver];
    objc_super v5 = [v4 addObserver:a1 ofParticipantWithIdentifier:30];
    [a1 _processZStackParticipantSettings:v5];

    goto LABEL_4;
  }
  id v6 = [NSString stringWithFormat:@"The window scene should only connect once"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    [(SBPhysicalButtonSceneOverrideManager *)sel_windowSceneDidConnect_ windowSceneDidConnect:(uint64_t)v6];
  }
  [v6 UTF8String];
  _bs_set_crash_log_message();
  __break(0);
}

- (BOOL)isTargetingButton:(uint64_t)a3 withConfigurationIdentifier:
{
  if (!a1) {
    return 0;
  }
  uint64_t v4 = [a1 _activeRequestForButton:a2];
  objc_super v5 = v4;
  if (v4) {
    BOOL v6 = [v4 identifier] == a3;
  }
  else {
    BOOL v6 = 0;
  }

  return v6;
}

- (char)sendVolumeButtonDownForIncrease:(unsigned char *)a3 shouldAlsoChangeVolume:
{
  uint64_t v3 = a1;
  if (a1)
  {
    if (a2) {
      uint64_t v6 = 1;
    }
    else {
      uint64_t v6 = 2;
    }
    if ([a1 _sendsActionsForButtonType:v6])
    {
      uint64_t v7 = 96;
      if (a2) {
        uint64_t v7 = 88;
      }
      id v8 = *(id *)&v3[v7];
      uint64_t v9 = [v8 scene];
      if (v9)
      {
        if (a3)
        {
          if ([v8 physicalButtonBehavior] == 2)
          {
            id v10 = [v9 definition];
            long long v11 = [v10 clientIdentity];
            *a3 = [v11 isLocal] ^ 1;
          }
          else
          {
            *a3 = 0;
          }
        }
        uint64_t v3 = [v3 _sendButtonDownForButtonType:v6 request:v8 scene:v9];
      }
      else
      {
        uint64_t v3 = 0;
      }
    }
    else
    {
      uint64_t v3 = 0;
    }
  }
  return v3;
}

- (id)sendRingerButtonDown
{
  v1 = a1;
  if (a1)
  {
    if ([a1 _sendsActionsForButtonType:3])
    {
      id v2 = v1[14];
      uint64_t v3 = [v2 scene];
      if (v3)
      {
        v1 = [v1 _sendButtonDownForButtonType:3 request:v2 scene:v3];
      }
      else
      {
        v1 = 0;
      }
    }
    else
    {
      v1 = 0;
    }
  }
  return v1;
}

- (id)sendCameraCaptureButtonDown
{
  v1 = a1;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if ([a1 _sendsActionsForButtonType:5])
    {
      id v2 = v1[15];
      uint64_t v3 = [v2 scene];
      if (v3)
      {
        if ([v1[8] containsObject:v3])
        {
          uint64_t v4 = NSString;
          objc_super v5 = (objc_class *)objc_opt_class();
          uint64_t v6 = NSStringFromClass(v5);
          uint64_t v7 = [v3 identifier];
          id v8 = [v4 stringWithFormat:@"%@ (%@)", v6, v7];

          v1 = (id *)-[SBPhysicalButtonCompletionHandler initWithIdentifier:button:block:]([SBPhysicalButtonCompletionHandler alloc], v8, 5, &__block_literal_global_274);
          uint64_t v9 = SBLogButtonsInteraction();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            id v10 = _NSStringFromUIPhysicalButton();
            *(_DWORD *)buf = 138543618;
            id v13 = v10;
            __int16 v14 = 2114;
            id v15 = v3;
            _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "NOT sending button %{public}@ BSAction to scene %{public}@ since it is already receiving full-fidelity events", buf, 0x16u);
          }
        }
        else
        {
          v1 = [v1 _sendButtonDownForButtonType:5 request:v2 scene:v3];
        }
      }
      else
      {
        v1 = 0;
      }
    }
    else
    {
      v1 = 0;
    }
  }
  return v1;
}

- (id)_sendButtonDownForButtonType:(unint64_t)a3 request:(id)a4 scene:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  [(SBPhysicalButtonSceneOverrideManager *)self _sendActionForButtonType:a3 buttonState:0 request:v8];
  id v10 = NSString;
  long long v11 = (objc_class *)objc_opt_class();
  uint64_t v12 = NSStringFromClass(v11);
  id v13 = [v9 identifier];
  __int16 v14 = [v10 stringWithFormat:@"%@ (%@)", v12, v13];

  id v15 = [SBPhysicalButtonCompletionHandler alloc];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __83__SBPhysicalButtonSceneOverrideManager__sendButtonDownForButtonType_request_scene___block_invoke;
  v20[3] = &unk_1E6B084E8;
  v20[4] = self;
  id v21 = v9;
  id v22 = v8;
  unint64_t v23 = a3;
  id v16 = v8;
  id v17 = v9;
  v18 = -[SBPhysicalButtonCompletionHandler initWithIdentifier:button:block:](v15, v14, a3, v20);
  -[SBCameraHardwareButton setDeferringRuleAssertion:]((uint64_t)v18, v16);
  [(SBPhysicalButtonSceneOverrideManager *)self _addButtonActionCompletionHandler:v18];

  return v18;
}

void __83__SBPhysicalButtonSceneOverrideManager__sendButtonDownForButtonType_request_scene___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  [*(id *)(a1 + 32) _removeButtonActionCompletionHandler:a2];
  id v5 = *(id *)(a1 + 40);
  [*(id *)(a1 + 32) _sendActionForButtonType:*(void *)(a1 + 56) buttonState:_UIPhysicalButtonStateFromSBPhysicalButtonResult(a3) request:*(void *)(a1 + 48)];
}

- (void)cache:(id)a3 didUpdateActiveCategoryName:(id)a4
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint64_t v6 = SBLogButtonsInteraction();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    id v8 = v5;
    _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "Re-evaluating overrides with new active volume category: %{public}@", (uint8_t *)&v7, 0xCu);
  }

  -[SBPhysicalButtonSceneOverrideManager _reevaluateOverrides]((id *)&self->super.isa);
}

- (void)zStackParticipantWithIdentifier:(int64_t)a3 wasAcquiredWithSettings:(id)a4
{
}

- (id)auditTokenForRequestingProcessOfCameraBehaviorScene
{
  if ([(SBPhysicalButtonBehaviorRequest *)self->_cameraCaptureButtonRequest physicalButtonBehavior])
  {
    uint64_t v3 = 0;
  }
  else
  {
    uint64_t v3 = [(SBPhysicalButtonBehaviorRequest *)self->_cameraCaptureButtonRequest requestingProcessAuditToken];
  }
  return v3;
}

- (id)reasonCameraBehaviorSceneIsNotEligibleForSupplementalUI
{
  if ([(SBPhysicalButtonBehaviorRequest *)self->_cameraCaptureButtonRequest physicalButtonBehavior])
  {
    uint64_t v3 = @"scene does not have camera behavior";
  }
  else
  {
    uint64_t v4 = [(SBPhysicalButtonBehaviorRequest *)self->_cameraCaptureButtonRequest scene];
    id v5 = [(SBPhysicalButtonSceneOverrideManager *)self cameraBehaviorScene];
    if (BSEqualObjects())
    {
      uint64_t v6 = [(SBPhysicalButtonBehaviorRequest *)self->_cameraCaptureButtonRequest requestingProcessAuditToken];
      BOOL v7 = [(SBPhysicalButtonSceneOverrideManager *)self _canSendCameraShutterButtonEventsForRequestAuditToken:v6];

      if (v7) {
        uint64_t v3 = 0;
      }
      else {
        uint64_t v3 = @"audit token does not match viewfinder session";
      }
    }
    else
    {
      uint64_t v3 = [NSString stringWithFormat:@"%@ does not match %@", v5, v4];
    }
  }
  return v3;
}

uint64_t __60__SBPhysicalButtonSceneOverrideManager__reevaluateOverrides__block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = [v2 scene];
  id v5 = [v4 identity];
  uint64_t v6 = [v3 sceneIdentity];

  uint64_t v7 = [v5 isEqual:v6];
  return v7;
}

- (id)sceneManager
{
  if (WeakRetained)
  {
    id WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 2);
    uint64_t v1 = vars8;
  }
  return WeakRetained;
}

uint64_t __61__SBPhysicalButtonSceneOverrideManager__sceneForSceneTarget___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 identity];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

- (id)_activeRequestForButton:(unint64_t)a3
{
  if (a3 - 1 > 4)
  {
    id v4 = 0;
  }
  else
  {
    id v4 = *(id *)((char *)&self->super.isa + qword_1D8FD27E0[a3 - 1]);
  }
  return v4;
}

- (BOOL)_sendsActionsForButtonType:(unint64_t)a3
{
  BOOL result = 1;
  switch(a3)
  {
    case 1uLL:
    case 2uLL:
      if (!self) {
        goto LABEL_4;
      }
      BOOL result = self->_sendsPhysicalVolumeButtonActions;
      break;
    case 3uLL:
    case 5uLL:
      return result;
    default:
LABEL_4:
      BOOL result = 0;
      break;
  }
  return result;
}

- (void)_addButtonActionCompletionHandler:(id)a3
{
  id v4 = a3;
  buttonActionCompletionHandlers = self->_buttonActionCompletionHandlers;
  id v8 = v4;
  if (!buttonActionCompletionHandlers)
  {
    uint64_t v6 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    uint64_t v7 = self->_buttonActionCompletionHandlers;
    self->_buttonActionCompletionHandlers = v6;

    id v4 = v8;
    buttonActionCompletionHandlers = self->_buttonActionCompletionHandlers;
  }
  [(NSHashTable *)buttonActionCompletionHandlers addObject:v4];
}

- (void)_removeButtonActionCompletionHandler:(id)a3
{
}

- (void)_sendActionForButtonType:(unint64_t)a3 buttonState:(unint64_t)a4 request:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  uint64_t v10 = [v9 physicalButtonBehavior];
  long long v11 = [v9 scene];
  uint64_t v12 = v11;
  if (a4)
  {
    if (([v11 isValid] & 1) == 0)
    {
      id v13 = SBLogButtonsInteraction();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v14 = _NSStringFromUIPhysicalButton();
        id v15 = _NSStringFromUIPhysicalButtonState();
        int v21 = 138543874;
        id v22 = v14;
        __int16 v23 = 2114;
        v24 = v15;
        __int16 v25 = 2114;
        v26 = v12;
        _os_log_impl(&dword_1D85BA000, v13, OS_LOG_TYPE_DEFAULT, "ignoring send button %{public}@-%{public}@ to invalidated scene %{public}@", (uint8_t *)&v21, 0x20u);
      }
      goto LABEL_9;
    }
  }
  else if (!v11)
  {
    v20 = [NSString stringWithFormat:@"can't begin a button-action sequence with a nil scene"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[SBPhysicalButtonSceneOverrideManager _sendActionForButtonType:buttonState:request:](a2, (uint64_t)self, (uint64_t)v20);
    }
    [v20 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D8C4058CLL);
  }
  id v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F43288]), "initWithPhysicalButton:behavior:state:generation:completion:", a3, v10, a4, objc_msgSend(v9, "generation"), 0);
  id v16 = SBLogButtonsInteraction();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    id v17 = _NSStringFromUIPhysicalButton();
    v18 = _NSStringFromUIPhysicalButtonState();
    int v21 = 138543874;
    id v22 = v17;
    __int16 v23 = 2114;
    v24 = v18;
    __int16 v25 = 2114;
    v26 = v12;
    _os_log_impl(&dword_1D85BA000, v16, OS_LOG_TYPE_DEFAULT, "send button %{public}@-%{public}@ to scene %{public}@", (uint8_t *)&v21, 0x20u);
  }
  v19 = [MEMORY[0x1E4F1CAD0] setWithObject:v13];
  [v12 sendActions:v19];

LABEL_9:
}

- (id)setSceneManager:(id *)result
{
  if (result) {
    return (id *)objc_storeWeak(result + 2, a2);
  }
  return result;
}

- (id)windowScene
{
  if (WeakRetained)
  {
    id WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 3);
    uint64_t v1 = vars8;
  }
  return WeakRetained;
}

- (id)setWindowScene:(id *)result
{
  if (result) {
    return (id *)objc_storeWeak(result + 3, a2);
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_captureApplicationProvider, 0);
  objc_storeStrong((id *)&self->_cameraCaptureButtonRequest, 0);
  objc_storeStrong((id *)&self->_ringerButtonRequest, 0);
  objc_storeStrong((id *)&self->_lockButtonRequest, 0);
  objc_storeStrong((id *)&self->_volumeDownButtonRequest, 0);
  objc_storeStrong((id *)&self->_volumeUpButtonRequest, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_buttonActionCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_lastScenesRequestingFullFidelityCaptureButtonEvents, 0);
  objc_storeStrong((id *)&self->_lastPhysicalButtonSceneTargets, 0);
  objc_storeStrong((id *)&self->_cameraViewfinderMonitorToken, 0);
  objc_storeStrong((id *)&self->_avCache, 0);
  objc_storeStrong((id *)&self->_volumeControl, 0);
  objc_destroyWeak((id *)&self->_windowScene);
  objc_destroyWeak((id *)&self->_sceneManager);
}

- (void)windowSceneDidConnect:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = NSStringFromSelector(a1);
  id v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  OUTLINED_FUNCTION_0();
  id v9 = @"SBPhysicalButtonSceneOverrideManager.m";
  __int16 v10 = 1024;
  int v11 = 169;
  __int16 v12 = v7;
  uint64_t v13 = a3;
  _os_log_error_impl(&dword_1D85BA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v8, 0x3Au);
}

- (void)_sendActionForButtonType:(const char *)a1 buttonState:(uint64_t)a2 request:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = NSStringFromSelector(a1);
  id v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  OUTLINED_FUNCTION_0();
  id v9 = @"SBPhysicalButtonSceneOverrideManager.m";
  __int16 v10 = 1024;
  int v11 = 744;
  __int16 v12 = v7;
  uint64_t v13 = a3;
  _os_log_error_impl(&dword_1D85BA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v8, 0x3Au);
}

@end