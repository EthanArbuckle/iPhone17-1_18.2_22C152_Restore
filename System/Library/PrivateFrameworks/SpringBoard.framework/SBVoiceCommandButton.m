@interface SBVoiceCommandButton
- (BOOL)_isPermittedToBegin;
- (BOOL)isLongPressRecognized;
- (SBHIDButtonStateArbiter)buttonArbiter;
- (SBHardwareButtonCoordinator)hardwareButtonCoordinator;
- (SBSiriHardwareButtonInteraction)siriHardwareButtonInteraction;
- (SBVoiceCommandButton)init;
- (id)hardwareButtonIdentifier;
- (void)cancelHardwareButtonPress;
- (void)handleButtonEvent:(__IOHIDEvent *)a3;
- (void)performActionsForButtonDown:(id)a3;
- (void)performActionsForButtonLongPress:(id)a3;
- (void)performActionsForButtonUp:(id)a3;
- (void)setButtonArbiter:(id)a3;
- (void)setHardwareButtonCoordinator:(id)a3;
- (void)setIsLongPressRecognized:(BOOL)a3;
- (void)setSiriHardwareButtonInteraction:(id)a3;
@end

@implementation SBVoiceCommandButton

- (SBVoiceCommandButton)init
{
  v10.receiver = self;
  v10.super_class = (Class)SBVoiceCommandButton;
  v2 = [(SBVoiceCommandButton *)&v10 init];
  if (v2)
  {
    uint64_t v3 = +[SBSiriHardwareButtonInteraction hardwareButtonInteractionForVoiceCommandButton];
    siriHardwareButtonInteraction = v2->_siriHardwareButtonInteraction;
    v2->_siriHardwareButtonInteraction = (SBSiriHardwareButtonInteraction *)v3;

    v5 = objc_alloc_init(SBHIDButtonStateArbiter);
    buttonArbiter = v2->_buttonArbiter;
    v2->_buttonArbiter = v5;

    [(SBHIDButtonStateArbiter *)v2->_buttonArbiter setDelegate:v2];
    v7 = v2->_buttonArbiter;
    v8 = [(SBSiriHardwareButtonInteraction *)v2->_siriHardwareButtonInteraction hardwareButtonGestureParameters];
    [v8 longPressTimeInterval];
    [(SBHIDButtonStateArbiter *)v7 setLongPressTimeout:"setLongPressTimeout:"];
  }
  return v2;
}

- (BOOL)_isPermittedToBegin
{
  uint64_t v3 = [(SBVoiceCommandButton *)self hardwareButtonCoordinator];
  v4 = [(SBVoiceCommandButton *)self hardwareButtonIdentifier];
  char v5 = [v3 buttonShouldStart:v4];

  return v5;
}

- (void)handleButtonEvent:(__IOHIDEvent *)a3
{
}

- (void)performActionsForButtonDown:(id)a3
{
  if ([(SBVoiceCommandButton *)self _isPermittedToBegin])
  {
    self->_isLongPressRecognized = 0;
    siriHardwareButtonInteraction = self->_siriHardwareButtonInteraction;
    [(SBSiriHardwareButtonInteraction *)siriHardwareButtonInteraction consumeInitialPressDown];
  }
  else
  {
    char v5 = SBLogButtonsCombo();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "Siri VoiceCommand down ignored because coordinateor says no", v6, 2u);
    }
  }
}

- (void)performActionsForButtonLongPress:(id)a3
{
  if ([(SBVoiceCommandButton *)self _isPermittedToBegin])
  {
    self->_isLongPressRecognized = 1;
    siriHardwareButtonInteraction = self->_siriHardwareButtonInteraction;
    [(SBSiriHardwareButtonInteraction *)siriHardwareButtonInteraction consumeLongPress];
  }
  else
  {
    char v5 = SBLogButtonsCombo();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "Siri VoiceCommand long press ignored because coordinateor says no", v6, 2u);
    }
  }
}

- (void)performActionsForButtonUp:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  BOOL v4 = [(SBVoiceCommandButton *)self _isPermittedToBegin];
  char v5 = SBLogButtonsCombo();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      BOOL isLongPressRecognized = self->_isLongPressRecognized;
      v8[0] = 67109120;
      v8[1] = isLongPressRecognized;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "Siri VoiceCommand button up, (long press recognized:%{BOOL}u)", (uint8_t *)v8, 8u);
    }

    if (!self->_isLongPressRecognized) {
      [(SBSiriHardwareButtonInteraction *)self->_siriHardwareButtonInteraction consumeSinglePressUp];
    }
    [(SBSiriHardwareButtonInteraction *)self->_siriHardwareButtonInteraction observeFinalPressUp];
  }
  else
  {
    if (v6)
    {
      LOWORD(v8[0]) = 0;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "Siri VoiceCommand up ignored because coordinateor says no", (uint8_t *)v8, 2u);
    }
  }
}

- (void)cancelHardwareButtonPress
{
}

- (id)hardwareButtonIdentifier
{
  return @"VoiceCommand";
}

- (SBHardwareButtonCoordinator)hardwareButtonCoordinator
{
  return self->_hardwareButtonCoordinator;
}

- (void)setHardwareButtonCoordinator:(id)a3
{
}

- (SBHIDButtonStateArbiter)buttonArbiter
{
  return self->_buttonArbiter;
}

- (void)setButtonArbiter:(id)a3
{
}

- (SBSiriHardwareButtonInteraction)siriHardwareButtonInteraction
{
  return self->_siriHardwareButtonInteraction;
}

- (void)setSiriHardwareButtonInteraction:(id)a3
{
}

- (BOOL)isLongPressRecognized
{
  return self->_isLongPressRecognized;
}

- (void)setIsLongPressRecognized:(BOOL)a3
{
  self->_BOOL isLongPressRecognized = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_siriHardwareButtonInteraction, 0);
  objc_storeStrong((id *)&self->_buttonArbiter, 0);
  objc_storeStrong((id *)&self->_hardwareButtonCoordinator, 0);
}

@end