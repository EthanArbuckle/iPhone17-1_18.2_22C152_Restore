@interface SBVoiceControlController
+ (id)sharedInstance;
- (BOOL)_shouldEnterVoiceControl;
- (BOOL)handleHeadsetButtonUp;
- (BOOL)handleHeadsetButtonUpNotInCall;
- (BOOL)handleHomeButtonHeld;
- (BOOL)isVisible;
- (SBVoiceControlController)init;
- (id)_newVoiceControlTransientOverlayViewControllerWithSource:(id)a3;
- (id)siriBluetoothDeviceSource:(id)a3;
- (void)_assistantActivationSettingsDidChange:(id)a3;
- (void)_cancelDelayedHeadsetAction;
- (void)_performDelayedHeadsetActionForAssistant;
- (void)_performDelayedHeadsetActionForVoiceControl;
- (void)_prepareDelayedHeadsetAction;
- (void)_shouldEnterVoiceControl;
- (void)_spokenLanguageDidChange:(id)a3;
- (void)_updateNextRecognitionAudioInputPaths:(id)a3;
- (void)bluetoothDeviceEndedVoiceControl:(id)a3;
- (void)bluetoothDeviceInitiatedVoiceControl:(id)a3;
- (void)configureVoiceControl;
- (void)dismissTransientOverlay;
- (void)handleHeadsetButtonDownWithClickCount:(unint64_t)a3;
- (void)voiceControlTransientOverlayViewControllerDidDisappear:(id)a3;
- (void)voiceControlTransientOverlayViewControllerRequestsDismissal:(id)a3;
@end

@implementation SBVoiceControlController

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_34 != -1) {
    dispatch_once(&sharedInstance_onceToken_34, &__block_literal_global_252);
  }
  v2 = (void *)sharedInstance___SharedInstance;
  return v2;
}

uint64_t __42__SBVoiceControlController_sharedInstance__block_invoke()
{
  kdebug_trace();
  v0 = objc_alloc_init(SBVoiceControlController);
  v1 = (void *)sharedInstance___SharedInstance;
  sharedInstance___SharedInstance = (uint64_t)v0;

  return kdebug_trace();
}

- (SBVoiceControlController)init
{
  v7.receiver = self;
  v7.super_class = (Class)SBVoiceControlController;
  v2 = [(SBVoiceControlController *)&v7 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F9F960] longPressButtonForIdentifier:4];
    siriHeadsetDeviceSource = v2->_siriHeadsetDeviceSource;
    v2->_siriHeadsetDeviceSource = (SiriLongPressButtonSource *)v3;

    v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 addObserver:v2 selector:sel__spokenLanguageDidChange_ name:*MEMORY[0x1E4FB4278] object:0];
    [v5 addObserver:v2 selector:sel__updateNextRecognitionAudioInputPaths_ name:*MEMORY[0x1E4FA7AB8] object:0];
  }
  return v2;
}

- (id)siriBluetoothDeviceSource:(id)a3
{
  id v3 = a3;
  v4 = objc_msgSend(v3, "sb_siriBluetoothDeviceSource");
  if (!v4)
  {
    v4 = [MEMORY[0x1E4F9F938] bluetoothDeviceForIdentifier:3 bluetoothDevice:v3];
    objc_msgSend(v3, "sb_setSiriBluetoothDeviceSource:", v4);
  }

  return v4;
}

- (void)configureVoiceControl
{
}

- (void)dismissTransientOverlay
{
  transientOverlayViewController = self->_transientOverlayViewController;
  self->_transientOverlayViewController = 0;
  id v3 = transientOverlayViewController;

  id v4 = +[SBWorkspace mainWorkspace];
  [v4 dismissTransientOverlayViewController:v3 animated:1 completion:0];
}

- (BOOL)isVisible
{
  id v3 = +[SBWorkspace mainWorkspace];
  id v4 = [v3 transientOverlayPresentationManager];
  LOBYTE(self) = [v4 isTopmostPresentedViewController:self->_transientOverlayViewController];

  return (char)self;
}

- (void)voiceControlTransientOverlayViewControllerRequestsDismissal:(id)a3
{
  v5 = (SBVoiceControlTransientOverlayViewController *)a3;
  if (self->_transientOverlayViewController == v5)
  {
    self->_transientOverlayViewController = 0;
  }
  id v4 = +[SBWorkspace mainWorkspace];
  [v4 dismissTransientOverlayViewController:v5 animated:1 completion:0];
}

- (void)voiceControlTransientOverlayViewControllerDidDisappear:(id)a3
{
  id v4 = (SBVoiceControlTransientOverlayViewController *)a3;
  if (self->_transientOverlayViewController == v4)
  {
    self->_transientOverlayViewController = 0;
    v5 = v4;

    id v4 = v5;
  }
}

- (BOOL)handleHomeButtonHeld
{
  if ([(SBVoiceControlController *)self _shouldEnterVoiceControl]
    && _AXSHomeButtonAssistant() == 1)
  {
    if (!self->_transientOverlayViewController)
    {
      id v3 = +[SBVoiceControlPresentationSource sourceFromHomeButton];
      id v4 = [(SBVoiceControlController *)self _newVoiceControlTransientOverlayViewControllerWithSource:v3];
      transientOverlayViewController = self->_transientOverlayViewController;
      self->_transientOverlayViewController = v4;

      v6 = +[SBWorkspace mainWorkspace];
      [v6 presentTransientOverlayViewController:self->_transientOverlayViewController animated:1 completion:0];
LABEL_7:

      return 1;
    }
  }
  else
  {
    objc_super v7 = self->_transientOverlayViewController;
    if (v7)
    {
      v6 = +[SBVoiceControlPresentationSource sourceFromHomeButton];
      [(SBVoiceControlTransientOverlayViewController *)v7 resetSessionWithSource:v6];
      goto LABEL_7;
    }
  }
  return 0;
}

- (void)_performDelayedHeadsetActionForAssistant
{
  self->_delayedAssistantActivationPending = 0;
  id v4 = +[SBTelephonyManager sharedTelephonyManager];
  id v3 = +[SBConferenceManager sharedInstance];
  if (([v4 inCall] & 1) == 0
    && ([v4 incomingCallExists] & 1) == 0
    && ([v3 inFaceTime] & 1) == 0
    && ([v3 faceTimeInvitationExists] & 1) == 0)
  {
    [(SiriLongPressButtonSource *)self->_siriHeadsetDeviceSource didRecognizeLongPress];
    self->_headsetDownDelayedActionPerformed = 1;
  }
}

- (void)_performDelayedHeadsetActionForVoiceControl
{
  id v3 = +[SBSceneManagerCoordinator mainDisplaySceneManager];
  id v4 = [v3 policyAggregator];
  char v5 = [v4 allowsCapability:4];

  if ((v5 & 1) == 0)
  {
    if ([(SBVoiceControlController *)self _shouldEnterVoiceControl]
      && ([MEMORY[0x1E4F74F68] sharedAVSystemController],
          v6 = objc_claimAutoreleasedReturnValue(),
          [v6 attributeForKey:*MEMORY[0x1E4F74BE0]],
          objc_super v7 = objc_claimAutoreleasedReturnValue(),
          int v8 = [v7 BOOLValue],
          v7,
          v6,
          v8))
    {
      if (!self->_transientOverlayViewController)
      {
        self->_headsetDownDelayedActionPerformed = 1;
        v9 = +[SBVoiceControlPresentationSource sourceFromHeadsetButton];
        v10 = [(SBVoiceControlController *)self _newVoiceControlTransientOverlayViewControllerWithSource:v9];
        transientOverlayViewController = self->_transientOverlayViewController;
        self->_transientOverlayViewController = v10;

        id v14 = +[SBWorkspace mainWorkspace];
        [v14 presentTransientOverlayViewController:self->_transientOverlayViewController animated:1 completion:0];
      }
    }
    else
    {
      v12 = self->_transientOverlayViewController;
      if (v12)
      {
        v13 = +[SBVoiceControlPresentationSource sourceFromHeadsetButton];
        [(SBVoiceControlTransientOverlayViewController *)v12 resetSessionWithSource:v13];

        self->_headsetDownDelayedActionPerformed = 1;
      }
    }
  }
}

- (void)_prepareDelayedHeadsetAction
{
  self->_headsetDownDelayedActionPerformed = 0;
  id v3 = +[SBSceneManagerCoordinator mainDisplaySceneManager];
  id v4 = [v3 policyAggregator];
  int v5 = [v4 allowsCapability:5];

  if (v5)
  {
    self->_delayedAssistantActivationPending = 1;
    [(SiriLongPressButtonSource *)self->_siriHeadsetDeviceSource longPressInterval];
    double v7 = v6;
    -[SBVoiceControlController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__performDelayedHeadsetActionForAssistant, 0);
    if (v7 > 0.0)
    {
      [(SiriAssertion *)self->_siriPreheatAssertion invalidate];
      int v8 = [(SiriLongPressButtonSource *)self->_siriHeadsetDeviceSource prepareForActivation];
      siriPreheatAssertion = self->_siriPreheatAssertion;
      self->_siriPreheatAssertion = v8;
    }
  }
  else if ([(SBVoiceControlController *)self _shouldEnterVoiceControl] {
         || self->_transientOverlayViewController)
  }
  {
    [(SBVoiceControlController *)self performSelector:sel__performDelayedHeadsetActionForVoiceControl withObject:0 afterDelay:1.3];
  }
}

- (void)_cancelDelayedHeadsetAction
{
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel__performDelayedHeadsetActionForVoiceControl object:0];
  if (self->_delayedAssistantActivationPending)
  {
    self->_delayedAssistantActivationPending = 0;
    [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel__performDelayedHeadsetActionForAssistant object:0];
    [(SiriAssertion *)self->_siriPreheatAssertion invalidate];
    siriPreheatAssertion = self->_siriPreheatAssertion;
    self->_siriPreheatAssertion = 0;
  }
}

- (void)handleHeadsetButtonDownWithClickCount:(unint64_t)a3
{
  self->_headsetDownDelayedActionPerformed = 0;
  if (a3) {
    [(SBVoiceControlController *)self _cancelDelayedHeadsetAction];
  }
  else {
    [(SBVoiceControlController *)self _prepareDelayedHeadsetAction];
  }
}

- (BOOL)handleHeadsetButtonUp
{
  [(SBVoiceControlController *)self _cancelDelayedHeadsetAction];
  id v3 = +[SBSceneManagerCoordinator mainDisplaySceneManager];
  id v4 = [v3 policyAggregator];
  char v5 = [v4 allowsCapability:4];

  if (v5) {
    return 0;
  }
  transientOverlayViewController = self->_transientOverlayViewController;
  if (transientOverlayViewController)
  {
    [(SBVoiceControlTransientOverlayViewController *)transientOverlayViewController handleHeadsetButtonUpFromButtonDownSource:self->_headsetDownDelayedActionPerformed];
  }
  else if (!self->_headsetDownDelayedActionPerformed)
  {
    return 0;
  }
  self->_headsetDownDelayedActionPerformed = 0;
  return 1;
}

- (BOOL)handleHeadsetButtonUpNotInCall
{
  if (self->_headsetDownDelayedActionPerformed) {
    goto LABEL_4;
  }
  int v3 = [(SiriLongPressButtonSource *)self->_siriHeadsetDeviceSource isActive];
  if (v3)
  {
    [(SiriLongPressButtonSource *)self->_siriHeadsetDeviceSource didRecognizeButtonSinglePressUp];
LABEL_4:
    LOBYTE(v3) = 1;
  }
  return v3;
}

- (void)_assistantActivationSettingsDidChange:(id)a3
{
  int v3 = +[SBSceneManagerCoordinator mainDisplaySceneManager];
  id v4 = [v3 policyAggregator];
  if ([v4 allowsCapability:4])
  {
    Class v5 = NSClassFromString(&cfstr_Vscacheupdatel.isa);

    if (v5)
    {
      double v6 = [MEMORY[0x1E4FB4258] sharedListener];
      [v6 stopListening];

      double v7 = SBLogCommon();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        __int16 v12 = 0;
        int v8 = "Unregistering voice control controller for voice services cache update";
        v9 = (uint8_t *)&v12;
LABEL_8:
        _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_INFO, v8, v9, 2u);
        goto LABEL_9;
      }
      goto LABEL_9;
    }
  }
  else
  {
  }
  v10 = [MEMORY[0x1E4FB4258] sharedListener];
  [v10 startListening];

  double v7 = SBLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    __int16 v11 = 0;
    int v8 = "Registering voice control controller for voice services cache update";
    v9 = (uint8_t *)&v11;
    goto LABEL_8;
  }
LABEL_9:
}

- (void)_spokenLanguageDidChange:(id)a3
{
}

- (void)bluetoothDeviceInitiatedVoiceControl:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    Class v5 = +[SBSceneManagerCoordinator mainDisplaySceneManager];
    double v6 = [v5 policyAggregator];
    int v7 = [v6 allowsCapability:5];

    if (v7)
    {
      int v8 = [(SBVoiceControlController *)self siriBluetoothDeviceSource:v4];
      v9 = SBLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v21 = 138543618;
        v22 = v8;
        __int16 v23 = 2114;
        id v24 = v4;
        _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "Telling siri to activate for BTHeadset (source:%{public}@ device:%{public}@)", (uint8_t *)&v21, 0x16u);
      }

      [v8 activate];
      goto LABEL_15;
    }
    BOOL v10 = [(SBVoiceControlController *)self _shouldEnterVoiceControl];
    __int16 v11 = +[SBDefaults localDefaults];
    __int16 v12 = [v11 voiceControlDefaults];
    int v13 = [v12 disableVoiceControlForBluetoothRequests];

    id v14 = SBLogCommon();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_INFO);
    if (!v10 || v13)
    {
      if (v15)
      {
        v19 = NSStringFromBOOL();
        v20 = NSStringFromBOOL();
        int v21 = 138543618;
        v22 = v19;
        __int16 v23 = 2114;
        id v24 = v20;
        _os_log_impl(&dword_1D85BA000, v14, OS_LOG_TYPE_INFO, "Not starting VC because shouldNoEnter: %{public}@ disabledByPref: %{public}@", (uint8_t *)&v21, 0x16u);
      }
      int v8 = [MEMORY[0x1E4F50B70] sharedInstance];
      [v8 endVoiceCommand:v4];
      goto LABEL_15;
    }
    if (v15)
    {
      LOWORD(v21) = 0;
      _os_log_impl(&dword_1D85BA000, v14, OS_LOG_TYPE_INFO, "Activing VC for BT headset", (uint8_t *)&v21, 2u);
    }

    if (!self->_transientOverlayViewController)
    {
      v16 = +[SBVoiceControlPresentationSource sourceFromBluetoothDevice:v4];
      v17 = [(SBVoiceControlController *)self _newVoiceControlTransientOverlayViewControllerWithSource:v16];
      transientOverlayViewController = self->_transientOverlayViewController;
      self->_transientOverlayViewController = v17;

      int v8 = +[SBWorkspace mainWorkspace];
      [v8 presentTransientOverlayViewController:self->_transientOverlayViewController animated:1 completion:0];
LABEL_15:
    }
  }
}

- (void)bluetoothDeviceEndedVoiceControl:(id)a3
{
  id v4 = a3;
  Class v5 = +[SBSceneManagerCoordinator mainDisplaySceneManager];
  double v6 = [v5 policyAggregator];
  int v7 = [v6 allowsCapability:4];

  int v8 = SBLogCommon();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "Telling siri to deactivate for BTHeadset", buf, 2u);
    }

    BOOL v10 = [(SBVoiceControlController *)self siriBluetoothDeviceSource:v4];
    [v10 deactivate];
  }
  else
  {
    if (v9)
    {
      *(_WORD *)__int16 v11 = 0;
      _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "Telling VC to dismiss for BTHeadset", v11, 2u);
    }

    [(SBVoiceControlController *)self dismissTransientOverlay];
  }
}

- (BOOL)_shouldEnterVoiceControl
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  int v3 = +[SBSceneManagerCoordinator mainDisplaySceneManager];
  id v4 = [v3 policyAggregator];
  id v22 = 0;
  char v5 = [v4 allowsCapability:8 explanation:&v22];
  double v6 = (__CFString *)v22;

  if (v5)
  {
    if (NSClassFromString(&cfstr_Vsrecognitions.isa))
    {
      if (self->_transientOverlayViewController)
      {
        int v7 = SBLogCommon();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          int v8 = "Not entering VC because we're already in VC";
LABEL_16:
          BOOL v10 = v7;
          uint32_t v11 = 2;
LABEL_17:
          _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_INFO, v8, buf, v11);
        }
      }
      else
      {
        __int16 v12 = [MEMORY[0x1E4F74F68] sharedAVSystemController];
        int v13 = [v12 attributeForKey:*MEMORY[0x1E4F74EB8]];
        char v14 = [v13 BOOLValue];

        if (v14)
        {
          BOOL v15 = 1;
          goto LABEL_19;
        }
        int v7 = SBLogCommon();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          int v8 = "Not entering VC because we don't have an audio input device";
          goto LABEL_16;
        }
      }
    }
    else
    {
      int v7 = SBLogCommon();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        int v8 = "Not entering VC because VSRecognitionSession class is missing";
        goto LABEL_16;
      }
    }
  }
  else
  {
    int v7 = SBLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      BOOL v9 = CFSTR("(unknown reason");
      if (v6) {
        BOOL v9 = v6;
      }
      *(_DWORD *)buf = 138412290;
      id v24 = v9;
      int v8 = "Not entering VC because: %@";
      BOOL v10 = v7;
      uint32_t v11 = 12;
      goto LABEL_17;
    }
  }

  BOOL v15 = 0;
LABEL_19:
  uint64_t v16 = VSPreferencesCopyAvailableLanguageIdentifiers();
  if (v16)
  {
    CFSetRef v17 = (const __CFSet *)v16;
    v18 = (const void *)VSPreferencesCopySpokenLanguageIdentifier();
    if (!CFSetContainsValue(v17, v18))
    {
      v19 = SBLogCommon();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        [(SBVoiceControlController *)(uint64_t)v18 _shouldEnterVoiceControl];
      }

      BOOL v15 = 0;
    }
    if (v18) {
      CFRelease(v18);
    }
    CFRelease(v17);
  }
  else
  {
    v20 = SBLogCommon();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      -[SBVoiceControlController _shouldEnterVoiceControl](v20);
    }

    BOOL v15 = 0;
  }

  return v15;
}

- (void)_updateNextRecognitionAudioInputPaths:(id)a3
{
  id v4 = [a3 object];
  char v5 = (NSArray *)[v4 copy];
  nextRecognitionAudioInputPaths = self->_nextRecognitionAudioInputPaths;
  self->_nextRecognitionAudioInputPaths = v5;

  transientOverlayViewController = self->_transientOverlayViewController;
  if (transientOverlayViewController)
  {
    int v8 = self->_nextRecognitionAudioInputPaths;
    [(SBVoiceControlTransientOverlayViewController *)transientOverlayViewController setNextRecognitionAudioInputPaths:v8];
  }
}

- (id)_newVoiceControlTransientOverlayViewControllerWithSource:(id)a3
{
  id v4 = a3;
  char v5 = [[SBVoiceControlTransientOverlayViewController alloc] initWithSource:v4];

  [(SBVoiceControlTransientOverlayViewController *)v5 setVoiceControlDelegate:self];
  double v6 = [(id)SBApp authenticationController];
  int v7 = +[SBLockScreenManager sharedInstance];
  if (([v7 isUILocked] & 1) != 0 || (objc_msgSend(v6, "isAuthenticated") & 1) == 0)
  {
    BOOL v9 = [MEMORY[0x1E4F74230] sharedConnection];
    if ([v9 effectiveBoolValueForSetting:*MEMORY[0x1E4F73EE0]] == 2) {
      uint64_t v8 = [v6 hasPasscodeSet] ^ 1;
    }
    else {
      uint64_t v8 = 1;
    }
  }
  else
  {
    uint64_t v8 = 1;
  }
  BOOL v10 = +[SBDefaults localDefaults];
  uint32_t v11 = [v10 voiceControlDefaults];

  if ([v11 isVoiceControlLoggingEnabled])
  {
    [(SBVoiceControlTransientOverlayViewController *)v5 setVoiceControlLoggingEnabled:1];
  }
  else
  {
    __int16 v12 = +[SBPlatformController sharedInstance];
    -[SBVoiceControlTransientOverlayViewController setVoiceControlLoggingEnabled:](v5, "setVoiceControlLoggingEnabled:", [v12 isInternalInstall]);
  }
  -[SBVoiceControlTransientOverlayViewController setShouldDisableHandlerActions:](v5, "setShouldDisableHandlerActions:", [v11 disableHandlerActions]);
  -[SBVoiceControlTransientOverlayViewController setShouldDisableVoiceControlForBluetoothRequests:](v5, "setShouldDisableVoiceControlForBluetoothRequests:", [v11 disableVoiceControlForBluetoothRequests]);
  [(SBVoiceControlTransientOverlayViewController *)v5 setShouldAllowSensitiveActions:v8];
  [(SBVoiceControlTransientOverlayViewController *)v5 setNextRecognitionAudioInputPaths:self->_nextRecognitionAudioInputPaths];

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_siriPreheatAssertion, 0);
  objc_storeStrong((id *)&self->_siriHeadsetDeviceSource, 0);
  objc_storeStrong((id *)&self->_transientOverlayViewController, 0);
  objc_storeStrong((id *)&self->_nextRecognitionAudioInputPaths, 0);
}

- (void)_shouldEnterVoiceControl
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_ERROR, "Language %{public}@ is not valid for VoiceControl", (uint8_t *)&v2, 0xCu);
}

@end