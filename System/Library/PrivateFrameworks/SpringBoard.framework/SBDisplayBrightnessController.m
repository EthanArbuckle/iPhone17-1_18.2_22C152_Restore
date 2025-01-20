@interface SBDisplayBrightnessController
+ (BOOL)handlesKeyCommands;
- (BOOL)_isBrightnessPropertyRunning;
- (BOOL)setBrightnessLevel:(float)a3 animated:(BOOL)a4;
- (SBDisplayBrightnessController)initWithCoordinator:(id)a3;
- (float)_effectiveCurrentTargetBrightness;
- (int64_t)brightnessRouteType;
- (void)_beginBrightnessTransaction;
- (void)_completeBrightnessTransaction;
- (void)_setBrightnessLevel:(float)a3 animated:(BOOL)a4;
- (void)buttonSetArbiter:(id)a3 performActionForButtonPage:(unsigned __int16)a4 usage:(unsigned __int16)a5;
- (void)buttonSetArbiterDidReset:(id)a3;
- (void)cancelBrightnessKeyPressEvent;
- (void)dealloc;
- (void)handleBrightnessKeyPressEvent:(__IOHIDEvent *)a3;
- (void)noteValueUpdatesDidEnd;
- (void)noteValueUpdatesWillBegin;
@end

@implementation SBDisplayBrightnessController

- (SBDisplayBrightnessController)initWithCoordinator:(id)a3
{
  v18[4] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"SBDisplayBrightnessController.m", 38, @"Invalid parameter not satisfying: %@", @"coordinator" object file lineNumber description];
  }
  v17.receiver = self;
  v17.super_class = (Class)SBDisplayBrightnessController;
  v6 = [(SBDisplayBrightnessController *)&v17 init];
  v7 = v6;
  if (v6)
  {
    objc_storeWeak((id *)&v6->_coordinator, v5);
    v8 = [NSNumber numberWithUnsignedInt:786544];
    v18[0] = v8;
    v9 = [NSNumber numberWithUnsignedInt:4278255649];
    v18[1] = v9;
    v10 = [NSNumber numberWithUnsignedInt:786543];
    v18[2] = v10;
    v11 = [NSNumber numberWithUnsignedInt:4278255648];
    v18[3] = v11;
    v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:4];

    v13 = [[SBHIDValueModifyingButtonSetArbiter alloc] initWithHIDKeyPressEventUsages:v12 initialRepeatDelay:0.333000004 subsequentRepeatDelay:0.0416666679];
    buttonArbiter = v7->_buttonArbiter;
    v7->_buttonArbiter = v13;

    [(SBHIDValueModifyingButtonSetArbiter *)v7->_buttonArbiter setDelegate:v7];
  }

  return v7;
}

- (void)dealloc
{
  [(SBUIViewFloatSpringProperty *)self->_brightnessProperty invalidate];
  [(SBDisplayBrightnessController *)self _completeBrightnessTransaction];
  v3.receiver = self;
  v3.super_class = (Class)SBDisplayBrightnessController;
  [(SBDisplayBrightnessController *)&v3 dealloc];
}

+ (BOOL)handlesKeyCommands
{
  if (handlesKeyCommands_onceToken_0 != -1) {
    dispatch_once(&handlesKeyCommands_onceToken_0, &__block_literal_global_132);
  }
  v2 = (void *)handlesKeyCommands_settings_0;
  return [v2 displayBrightnessKeyCommandsEnabled];
}

void __51__SBDisplayBrightnessController_handlesKeyCommands__block_invoke()
{
  uint64_t v0 = +[SBElasticHUDDomain rootSettings];
  v1 = (void *)handlesKeyCommands_settings_0;
  handlesKeyCommands_settings_0 = v0;
}

- (int64_t)brightnessRouteType
{
  return 1;
}

- (void)handleBrightnessKeyPressEvent:(__IOHIDEvent *)a3
{
}

- (void)cancelBrightnessKeyPressEvent
{
}

- (BOOL)setBrightnessLevel:(float)a3 animated:(BOOL)a4
{
  return 1;
}

- (void)noteValueUpdatesWillBegin
{
  if ([(SBDisplayBrightnessController *)self _isBrightnessPropertyRunning]) {
    [(SBUIViewFloatSpringProperty *)self->_brightnessProperty invalidate];
  }
  [(SBDisplayBrightnessController *)self _beginBrightnessTransaction];
}

- (void)noteValueUpdatesDidEnd
{
  if ([(SBDisplayBrightnessController *)self _isBrightnessPropertyRunning]) {
    [(SBUIViewFloatSpringProperty *)self->_brightnessProperty invalidate];
  }
  [(SBDisplayBrightnessController *)self _completeBrightnessTransaction];
}

- (void)buttonSetArbiter:(id)a3 performActionForButtonPage:(unsigned __int16)a4 usage:(unsigned __int16)a5
{
  int v5 = a5;
  int v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_coordinator);
  int v9 = v5 | (v6 << 16);
  if (v9 > 786542)
  {
    if (v9 != 786543)
    {
      int v10 = 786544;
      goto LABEL_6;
    }
LABEL_8:
    id v14 = WeakRetained;
    v11 = self;
    uint64_t v12 = 1;
    uint64_t v13 = 0;
    goto LABEL_9;
  }
  if (v9 == -16711648) {
    goto LABEL_8;
  }
  int v10 = -16711647;
LABEL_6:
  if (v9 != v10) {
    goto LABEL_10;
  }
  id v14 = WeakRetained;
  v11 = self;
  uint64_t v12 = 0;
  uint64_t v13 = 1;
LABEL_9:
  [WeakRetained brightnessController:v11 performCoordinatedBrightnessChangeForIncrementKeyDown:v12 decrementKeyDown:v13];
  id WeakRetained = v14;
LABEL_10:
}

- (void)buttonSetArbiterDidReset:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_coordinator);
  [WeakRetained brightnessController:self performCoordinatedBrightnessChangeForIncrementKeyDown:0 decrementKeyDown:0];
}

- (void)_beginBrightnessTransaction
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (!self->_brightnessTransaction)
  {
    objc_super v3 = SBLogBacklight();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      int v4 = 138412290;
      int v5 = self;
      _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_INFO, "%@ beginning brightness transaction", (uint8_t *)&v4, 0xCu);
    }

    self->_brightnessTransaction = (BKSDisplayBrightnessTransaction *)BKSDisplayBrightnessTransactionCreate();
  }
}

- (void)_completeBrightnessTransaction
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (self->_brightnessTransaction)
  {
    objc_super v3 = SBLogBacklight();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      int v4 = 138412290;
      int v5 = self;
      _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_INFO, "%@ completing brightness transaction", (uint8_t *)&v4, 0xCu);
    }

    CFRelease(self->_brightnessTransaction);
    self->_brightnessTransaction = 0;
  }
}

- (float)_effectiveCurrentTargetBrightness
{
  if ([(SBDisplayBrightnessController *)self _isBrightnessPropertyRunning])
  {
    [(SBUIViewFloatSpringProperty *)self->_brightnessProperty input];
    return v3;
  }
  else
  {
    BKSDisplayBrightnessGetCurrent();
  }
  return result;
}

- (BOOL)_isBrightnessPropertyRunning
{
  brightnessProperty = self->_brightnessProperty;
  if (brightnessProperty) {
    LOBYTE(brightnessProperty) = [(SBUIViewFloatSpringProperty *)brightnessProperty isInvalidated] ^ 1;
  }
  return (char)brightnessProperty;
}

- (void)_setBrightnessLevel:(float)a3 animated:(BOOL)a4
{
  v39[1] = *MEMORY[0x1E4F143B8];
  if (a4)
  {
    if ([(SBDisplayBrightnessController *)self _isBrightnessPropertyRunning])
    {
      uint64_t v6 = self->_brightnessProperty;
      v7 = (void *)MEMORY[0x1E4F42FF0];
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __62__SBDisplayBrightnessController__setBrightnessLevel_animated___block_invoke;
      v36[3] = &unk_1E6AF7E00;
      v37 = v6;
      float v38 = a3;
      int v8 = *MEMORY[0x1E4F39AF0];
      int v9 = *(_DWORD *)(MEMORY[0x1E4F39AF0] + 4);
      int v10 = *(_DWORD *)(MEMORY[0x1E4F39AF0] + 8);
      v11 = v6;
      LODWORD(v12) = v8;
      LODWORD(v13) = v9;
      LODWORD(v14) = v10;
      objc_msgSend(v7, "sb_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 0, v36, v12, v13, v14);
    }
    else
    {
      BKSDisplayBrightnessGetCurrent();
      double v16 = v15;
      if ((BSFloatEqualToFloat() & 1) == 0)
      {
        id v17 = objc_alloc_init(MEMORY[0x1E4FA79D0]);
        v18 = (void *)MEMORY[0x1E4F42FF0];
        v33[0] = MEMORY[0x1E4F143A8];
        v33[1] = 3221225472;
        v33[2] = __62__SBDisplayBrightnessController__setBrightnessLevel_animated___block_invoke_2;
        v33[3] = &unk_1E6AF4A70;
        id v19 = v17;
        id v34 = v19;
        double v35 = v16;
        [v18 performWithoutAnimation:v33];
        [(SBDisplayBrightnessController *)self _beginBrightnessTransaction];
        objc_initWeak(&location, self);
        v20 = (void *)MEMORY[0x1E4F42FF0];
        v39[0] = v19;
        v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:1];
        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        v30[2] = __62__SBDisplayBrightnessController__setBrightnessLevel_animated___block_invoke_3;
        v30[3] = &unk_1E6AF4B10;
        objc_copyWeak(&v31, &location);
        [v20 _createTransformerWithInputAnimatableProperties:v21 presentationValueChangedCallback:v30];

        objc_storeStrong((id *)&self->_brightnessProperty, v17);
        v22 = (void *)MEMORY[0x1E4F42FF0];
        v27[0] = MEMORY[0x1E4F143A8];
        v27[1] = 3221225472;
        v27[2] = __62__SBDisplayBrightnessController__setBrightnessLevel_animated___block_invoke_4;
        v27[3] = &unk_1E6AF7E00;
        id v23 = v19;
        id v28 = v23;
        float v29 = a3;
        LODWORD(v24) = *MEMORY[0x1E4F39AF0];
        LODWORD(v25) = *(_DWORD *)(MEMORY[0x1E4F39AF0] + 4);
        LODWORD(v26) = *(_DWORD *)(MEMORY[0x1E4F39AF0] + 8);
        objc_msgSend(v22, "sb_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 0, v27, v24, v25, v26);

        objc_destroyWeak(&v31);
        objc_destroyWeak(&location);
      }
    }
  }
  else
  {
    BKSDisplayBrightnessSet();
  }
}

uint64_t __62__SBDisplayBrightnessController__setBrightnessLevel_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setInput:*(float *)(a1 + 40)];
}

uint64_t __62__SBDisplayBrightnessController__setBrightnessLevel_animated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setInput:*(double *)(a1 + 40)];
}

void __62__SBDisplayBrightnessController__setBrightnessLevel_animated___block_invoke_3(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v6 = WeakRetained;
    id v2 = WeakRetained[4];
    double v3 = v2;
    if (v2 && ![v2 isInvalidated])
    {
      [v3 input];
      [v3 output];
      BKSDisplayBrightnessSet();
      if (BSFloatEqualToFloat())
      {
        [v3 invalidate];
        id v5 = v6[4];
        v6[4] = 0;

        [v6 _completeBrightnessTransaction];
      }
    }
    else
    {
      id v4 = v6[4];
      v6[4] = 0;
    }
    id WeakRetained = v6;
  }
}

uint64_t __62__SBDisplayBrightnessController__setBrightnessLevel_animated___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) setInput:*(float *)(a1 + 40)];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_brightnessProperty, 0);
  objc_storeStrong((id *)&self->_buttonArbiter, 0);
  objc_destroyWeak((id *)&self->_coordinator);
}

@end