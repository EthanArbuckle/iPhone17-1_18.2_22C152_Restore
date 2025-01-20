@interface SBSiriHardwareButtonInteraction
+ (BOOL)dismissSiriTransientOverlayOnSinglePressUp:(int64_t)a3;
+ (id)hardwareButtonInteractionForHomeButton;
+ (id)hardwareButtonInteractionForLockButton;
+ (id)hardwareButtonInteractionForVoiceCommandButton;
- (BOOL)consumeInitialPressDown;
- (BOOL)consumeLongPress;
- (BOOL)consumeSinglePressUp;
- (SBSiriHardwareButtonInteraction)initWithSiriButton:(int64_t)a3;
- (SiriAssertion)siriButtonDownAssertion;
- (SiriAssertion)siriPreheatAssertion;
- (SiriLongPressButtonSource)siriActivationSource;
- (double)activationInterval;
- (double)initialPressDownTime;
- (id)hardwareButtonGestureParameters;
- (int64_t)siriButtonIdentifier;
- (void)_cancelAllSiriActions;
- (void)_cancelPreheating;
- (void)_preheatSiriForPresentationAfterInterval:(double)a3;
- (void)_siriHomeButtonPrefsDidChange:(id)a3;
- (void)configurationDidUpdateOnLongPressSource:(id)a3;
- (void)consumeInitialPressDown;
- (void)setActivationInterval:(double)a3;
- (void)setInitialPressDownTime:(double)a3;
- (void)setSiriActivationSource:(id)a3;
- (void)setSiriButtonDownAssertion:(id)a3;
- (void)setSiriButtonIdentifier:(int64_t)a3;
- (void)setSiriPreheatAssertion:(id)a3;
@end

@implementation SBSiriHardwareButtonInteraction

+ (id)hardwareButtonInteractionForHomeButton
{
  v2 = [[SBSiriHardwareButtonInteraction alloc] initWithSiriButton:1];
  return v2;
}

+ (id)hardwareButtonInteractionForLockButton
{
  v2 = [[SBSiriHardwareButtonInteraction alloc] initWithSiriButton:2];
  return v2;
}

+ (id)hardwareButtonInteractionForVoiceCommandButton
{
  v2 = [[SBSiriHardwareButtonInteraction alloc] initWithSiriButton:9];
  return v2;
}

- (SBSiriHardwareButtonInteraction)initWithSiriButton:(int64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SBSiriHardwareButtonInteraction;
  v4 = [(SBSiriHardwareButtonInteraction *)&v10 init];
  v5 = v4;
  if (v4)
  {
    v4->_siriButtonIdentifier = a3;
    uint64_t v6 = [MEMORY[0x1E4F9F960] longPressButtonForIdentifier:a3];
    siriActivationSource = v5->_siriActivationSource;
    v5->_siriActivationSource = (SiriLongPressButtonSource *)v6;

    [(SiriLongPressButtonSource *)v5->_siriActivationSource longPressInterval];
    v5->_activationInterval = v8;
    [(SiriLongPressButtonSource *)v5->_siriActivationSource setDelegate:v5];
    [(SiriLongPressButtonSource *)v5->_siriActivationSource requestConfigurationUpdatesBasedOnDeviceSettings];
  }
  return v5;
}

+ (BOOL)dismissSiriTransientOverlayOnSinglePressUp:(int64_t)a3
{
  if (+[SBAssistantController isVisible])
  {
    uint64_t v6 = +[SBWorkspace mainWorkspace];
    v7 = [v6 transientOverlayPresentationManager];

    double v8 = +[SBAssistantController sharedInstance];
    v9 = [v8 window];
    [v9 windowLevel];
    int v10 = objc_msgSend(v7, "hasPresentationAboveWindowLevel:");

    if (v10)
    {
      switch(a3)
      {
        case 1:
          if (([v7 handleHomeButtonPress] & 1) == 0) {
            break;
          }
          goto LABEL_12;
        case 9:
          if ([v7 handleVoiceCommandButtonPress]) {
            goto LABEL_12;
          }
          break;
        case 2:
          if (([v7 handleLockButtonPress] & 1) == 0) {
            break;
          }
LABEL_12:
          BOOL v11 = 1;
LABEL_15:

          return v11;
        default:
          v12 = [MEMORY[0x1E4F28B00] currentHandler];
          [v12 handleFailureInMethod:a2 object:a1 file:@"SBSiriHardwareButtonInteraction.m" lineNumber:88 description:@"We don't handle this activation event"];

          break;
      }
    }
    BOOL v11 = 0;
    goto LABEL_15;
  }
  return 0;
}

- (void)configurationDidUpdateOnLongPressSource:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  [a3 longPressInterval];
  self->_double activationInterval = v4;
  v5 = SBLogButtonsInteraction();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    double activationInterval = self->_activationInterval;
    int v8 = 134217984;
    double v9 = activationInterval;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "Siri: updating activation interval to %f", (uint8_t *)&v8, 0xCu);
  }

  v7 = [(SBSiriHardwareButtonInteraction *)self hardwareButtonGestureParameters];
  [(SBHardwareButtonGestureParametersProviderBase *)self publishUpdatedParameters:v7];
}

- (void)_siriHomeButtonPrefsDidChange:(id)a3
{
  id v4 = [(SBSiriHardwareButtonInteraction *)self hardwareButtonGestureParameters];
  [(SBHardwareButtonGestureParametersProviderBase *)self publishUpdatedParameters:v4];
}

- (void)_preheatSiriForPresentationAfterInterval:(double)a3
{
  siriPreheatAssertion = self->_siriPreheatAssertion;
  if (siriPreheatAssertion) {
    [(SiriAssertion *)siriPreheatAssertion invalidate];
  }
  v5 = SBLogButtonsInteraction();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[SBSiriHardwareButtonInteraction _preheatSiriForPresentationAfterInterval:]();
  }

  uint64_t v6 = +[SBSceneManagerCoordinator mainDisplaySceneManager];
  v7 = [v6 policyAggregator];
  int v8 = [v7 allowsCapability:5];

  if (v8)
  {
    double v9 = [(SiriLongPressButtonSource *)self->_siriActivationSource prepareForActivation];
    uint64_t v10 = self->_siriPreheatAssertion;
    self->_siriPreheatAssertion = v9;

    BOOL v11 = SBLogButtonsInteraction();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[SBSiriHardwareButtonInteraction _preheatSiriForPresentationAfterInterval:]();
    }
  }
  else
  {
    BOOL v11 = SBLogButtonsInteraction();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[SBSiriHardwareButtonInteraction _preheatSiriForPresentationAfterInterval:]();
    }
  }
}

- (void)_cancelPreheating
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1(&dword_1D85BA000, v0, v1, "Siri: Cancel preheat", v2, v3, v4, v5, v6);
}

- (void)_cancelAllSiriActions
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1(&dword_1D85BA000, v0, v1, "Siri: invalidate activation", v2, v3, v4, v5, v6);
}

- (BOOL)consumeInitialPressDown
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  double Current = CFAbsoluteTimeGetCurrent();
  -[SiriLongPressButtonSource speechInteractionActivityWithTimestamp:](self->_siriActivationSource, "speechInteractionActivityWithTimestamp:");
  uint64_t v5 = (SiriAssertion *)objc_claimAutoreleasedReturnValue();
  siriButtonDownAssertion = self->_siriButtonDownAssertion;
  self->_siriButtonDownAssertion = v5;

  v7 = SBLogButtonsInteraction();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[SBSiriHardwareButtonInteraction consumeInitialPressDown]();
  }

  int v8 = +[SBSyncController sharedInstance];
  if ([v8 isRestoring])
  {

LABEL_6:
    BOOL v11 = SBLogButtonsHome();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
LABEL_9:

      goto LABEL_10;
    }
    v12 = NSStringFromSelector(a2);
    int v21 = 138543362;
    v22 = v12;
    v13 = "%{public}@ result: not preheating Siri due to SBSyncController restoring/resetting";
LABEL_8:
    _os_log_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_INFO, v13, (uint8_t *)&v21, 0xCu);

    goto LABEL_9;
  }
  double v9 = +[SBSyncController sharedInstance];
  int v10 = [v9 isResetting];

  if (v10) {
    goto LABEL_6;
  }
  v15 = +[SBWorkspace mainWorkspace];
  int v16 = [v15 isPowerDownTransientOverlayTopmost];

  BOOL v11 = SBLogButtonsHome();
  BOOL v17 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
  if (v16)
  {
    if (!v17) {
      goto LABEL_9;
    }
    v12 = NSStringFromSelector(a2);
    int v21 = 138543362;
    v22 = v12;
    v13 = "%{public}@ result: not preheating Siri due to power down transient overlay";
    goto LABEL_8;
  }
  if (v17)
  {
    v18 = NSStringFromSelector(a2);
    int v21 = 138543362;
    v22 = v18;
    _os_log_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_INFO, "%{public}@ result: ignored; starting Siri preheat",
      (uint8_t *)&v21,
      0xCu);
  }
  double activationInterval = self->_activationInterval;
  double v20 = fmax(activationInterval - (Current - self->_initialPressDownTime), 0.0);
  if (activationInterval > v20) {
    double activationInterval = v20;
  }
  [(SBSiriHardwareButtonInteraction *)self _preheatSiriForPresentationAfterInterval:activationInterval];
LABEL_10:
  self->_initialPressDownTime = 0.0;
  return 0;
}

- (BOOL)consumeSinglePressUp
{
  if (![(SiriLongPressButtonSource *)self->_siriActivationSource isActive]) {
    return 0;
  }
  [(id)objc_opt_class() dismissSiriTransientOverlayOnSinglePressUp:self->_siriButtonIdentifier];
  [(SiriLongPressButtonSource *)self->_siriActivationSource didRecognizeButtonSinglePressUp];
  uint64_t v3 = [MEMORY[0x1E4F4F7D0] sharedInstance];
  uint64_t v4 = [v3 homeButtonType];

  uint64_t v5 = +[SBAssistantController sharedInstance];
  char v6 = [v5 contentObscuresEmbeddedDisplayScreen];
  if (v4 == 2) {
    BOOL v7 = 1;
  }
  else {
    BOOL v7 = v6;
  }

  return v7;
}

- (BOOL)consumeLongPress
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = +[SBSceneManagerCoordinator mainDisplaySceneManager];
  uint64_t v5 = [v4 policyAggregator];
  int v6 = [v5 allowsCapability:5];

  if (v6)
  {
    BOOL v7 = SBLogButtonsHome();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v8 = NSStringFromSelector(a2);
      int v15 = 138543362;
      int v16 = v8;
      _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_INFO, "%{public}@ result: Siri: Siri handled it", (uint8_t *)&v15, 0xCu);
    }
    [(SiriLongPressButtonSource *)self->_siriActivationSource didRecognizeLongPress];
LABEL_9:
    v13 = +[SBCommandTabController sharedInstance];
    [v13 dismiss];

    return 1;
  }
  double v9 = +[SBVoiceControlController sharedInstance];
  int v10 = [v9 handleHomeButtonHeld];

  if (v10)
  {
    BOOL v11 = SBLogButtonsHome();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = NSStringFromSelector(a2);
      int v15 = 138543362;
      int v16 = v12;
      _os_log_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_INFO, "%{public}@ result: Siri: voice control handled it", (uint8_t *)&v15, 0xCu);
    }
    goto LABEL_9;
  }
  return 0;
}

- (id)hardwareButtonGestureParameters
{
  uint64_t v3 = objc_alloc_init(SBMutableHardwareButtonGestureParameters);
  [(SBMutableHardwareButtonGestureParameters *)v3 setLongPressTimeInterval:self->_activationInterval];
  return v3;
}

- (double)initialPressDownTime
{
  return self->_initialPressDownTime;
}

- (void)setInitialPressDownTime:(double)a3
{
  self->_initialPressDownTime = a3;
}

- (int64_t)siriButtonIdentifier
{
  return self->_siriButtonIdentifier;
}

- (void)setSiriButtonIdentifier:(int64_t)a3
{
  self->_siriButtonIdentifier = a3;
}

- (SiriLongPressButtonSource)siriActivationSource
{
  return self->_siriActivationSource;
}

- (void)setSiriActivationSource:(id)a3
{
}

- (double)activationInterval
{
  return self->_activationInterval;
}

- (void)setActivationInterval:(double)a3
{
  self->_double activationInterval = a3;
}

- (SiriAssertion)siriPreheatAssertion
{
  return self->_siriPreheatAssertion;
}

- (void)setSiriPreheatAssertion:(id)a3
{
}

- (SiriAssertion)siriButtonDownAssertion
{
  return self->_siriButtonDownAssertion;
}

- (void)setSiriButtonDownAssertion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_siriButtonDownAssertion, 0);
  objc_storeStrong((id *)&self->_siriPreheatAssertion, 0);
  objc_storeStrong((id *)&self->_siriActivationSource, 0);
}

- (void)_preheatSiriForPresentationAfterInterval:.cold.1()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1(&dword_1D85BA000, v0, v1, "Siri: Successfully started preheat", v2, v3, v4, v5, v6);
}

- (void)_preheatSiriForPresentationAfterInterval:.cold.2()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1(&dword_1D85BA000, v0, v1, "Siri: shouldn't enter", v2, v3, v4, v5, v6);
}

- (void)_preheatSiriForPresentationAfterInterval:.cold.3()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1(&dword_1D85BA000, v0, v1, "Siri: preheat", v2, v3, v4, v5, v6);
}

- (void)consumeInitialPressDown
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1(&dword_1D85BA000, v0, v1, "Siri: speech interaction activity started", v2, v3, v4, v5, v6);
}

@end