@interface SBKeyboardBrightnessController
+ (BOOL)handlesKeyCommands;
- (BOOL)_setBrightnessLevel:(float)a3 animated:(BOOL)a4;
- (SBKeyboardBrightnessController)initWithCoordinator:(id)a3;
- (float)_currentBrightness;
- (int64_t)brightnessRouteType;
- (void)buttonSetArbiter:(id)a3 performActionForButtonPage:(unsigned __int16)a4 usage:(unsigned __int16)a5;
- (void)buttonSetArbiterDidReset:(id)a3;
- (void)cancelBrightnessKeyPressEvent;
- (void)handleBrightnessKeyPressEvent:(__IOHIDEvent *)a3;
@end

@implementation SBKeyboardBrightnessController

- (SBKeyboardBrightnessController)initWithCoordinator:(id)a3
{
  v19[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"SBKeyboardBrightnessController.m", 35, @"Invalid parameter not satisfying: %@", @"coordinator" object file lineNumber description];
  }
  v18.receiver = self;
  v18.super_class = (Class)SBKeyboardBrightnessController;
  v6 = [(SBKeyboardBrightnessController *)&v18 init];
  v7 = v6;
  if (v6)
  {
    objc_storeWeak((id *)&v6->_coordinator, v5);
    v8 = (KeyboardBrightnessClient *)objc_alloc_init(MEMORY[0x1E4F5B2B0]);
    keyboardBrightnessClient = v7->_keyboardBrightnessClient;
    v7->_keyboardBrightnessClient = v8;

    v10 = [SBHIDValueModifyingButtonSetArbiter alloc];
    v11 = [NSNumber numberWithUnsignedInt:786553];
    v19[0] = v11;
    v12 = [NSNumber numberWithUnsignedInt:786554];
    v19[1] = v12;
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
    uint64_t v14 = [(SBHIDValueModifyingButtonSetArbiter *)v10 initWithHIDKeyPressEventUsages:v13 initialRepeatDelay:0.333000004 subsequentRepeatDelay:0.0416666679];
    buttonArbiter = v7->_buttonArbiter;
    v7->_buttonArbiter = (SBHIDValueModifyingButtonSetArbiter *)v14;

    [(SBHIDValueModifyingButtonSetArbiter *)v7->_buttonArbiter setDelegate:v7];
  }

  return v7;
}

+ (BOOL)handlesKeyCommands
{
  if (handlesKeyCommands_onceToken != -1) {
    dispatch_once(&handlesKeyCommands_onceToken, &__block_literal_global_74);
  }
  v2 = (void *)handlesKeyCommands_settings;
  return [v2 keyboardBrightnessKeyCommandsEnabled];
}

void __52__SBKeyboardBrightnessController_handlesKeyCommands__block_invoke()
{
  uint64_t v0 = +[SBElasticHUDDomain rootSettings];
  v1 = (void *)handlesKeyCommands_settings;
  handlesKeyCommands_settings = v0;
}

- (int64_t)brightnessRouteType
{
  return 2;
}

- (void)handleBrightnessKeyPressEvent:(__IOHIDEvent *)a3
{
}

- (void)cancelBrightnessKeyPressEvent
{
}

- (void)buttonSetArbiter:(id)a3 performActionForButtonPage:(unsigned __int16)a4 usage:(unsigned __int16)a5
{
  int v5 = a5;
  int v6 = a4;
  id v15 = a3;
  if (v6 != 12)
  {
    uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"SBKeyboardBrightnessController.m", 97, @"Invalid parameter not satisfying: %@", @"page == kHIDPage_Consumer" object file lineNumber description];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_coordinator);
  v10 = WeakRetained;
  if (v5 == 122)
  {
    v11 = self;
    uint64_t v12 = 0;
    uint64_t v13 = 1;
  }
  else
  {
    if (v5 != 121) {
      goto LABEL_8;
    }
    v11 = self;
    uint64_t v12 = 1;
    uint64_t v13 = 0;
  }
  [WeakRetained brightnessController:v11 performCoordinatedBrightnessChangeForIncrementKeyDown:v12 decrementKeyDown:v13];
LABEL_8:
}

- (void)buttonSetArbiterDidReset:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_coordinator);
  [WeakRetained brightnessController:self performCoordinatedBrightnessChangeForIncrementKeyDown:0 decrementKeyDown:0];
}

- (float)_currentBrightness
{
  [(KeyboardBrightnessClient *)self->_keyboardBrightnessClient brightnessForKeyboard:*MEMORY[0x1E4F5B2C0]];
  return result;
}

- (BOOL)_setBrightnessLevel:(float)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v7 = *MEMORY[0x1E4F5B2C0];
  if (![(KeyboardBrightnessClient *)self->_keyboardBrightnessClient isAmbientFeatureAvailableOnKeyboard:*MEMORY[0x1E4F5B2C0]]|| ([(KeyboardBrightnessClient *)self->_keyboardBrightnessClient isBacklightSaturatedOnKeyboard:v7] & 1) != 0)
  {
    return 0;
  }
  keyboardBrightnessClient = self->_keyboardBrightnessClient;
  if (v4) {
    uint64_t v11 = 150;
  }
  else {
    uint64_t v11 = 0;
  }
  *(float *)&double v8 = a3;
  return [(KeyboardBrightnessClient *)keyboardBrightnessClient setBrightness:v11 fadeSpeed:1 commit:v7 forKeyboard:v8];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonArbiter, 0);
  objc_storeStrong((id *)&self->_keyboardBrightnessClient, 0);
  objc_destroyWeak((id *)&self->_coordinator);
}

@end