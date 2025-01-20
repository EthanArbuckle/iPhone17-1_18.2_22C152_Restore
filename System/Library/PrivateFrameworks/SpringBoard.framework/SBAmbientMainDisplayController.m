@interface SBAmbientMainDisplayController
- (BOOL)_shouldEnableCoreBrightnessAmbientMode;
- (SBAmbientMainDisplayController)init;
- (SBAmbientMainDisplayController)initWithAmbientPresentationController:(id)a3;
- (void)_updateCoreBrightnessAmbientMode;
- (void)_updateCoreBrightnessAmbientModeForce:(BOOL)a3;
- (void)ambientPresentationController:(id)a3 didUpdatePresented:(BOOL)a4;
- (void)backlightController:(id)a3 didTransitionToBacklightState:(int64_t)a4 source:(int64_t)a5;
- (void)dealloc;
@end

@implementation SBAmbientMainDisplayController

- (SBAmbientMainDisplayController)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  v5 = NSStringFromSelector(sel_initWithAmbientPresentationController_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SBAmbientMainDisplayController.m", 34, @"%s is unavailable; use %@ instead",
    "-[SBAmbientMainDisplayController init]",
    v5);

  return 0;
}

- (SBAmbientMainDisplayController)initWithAmbientPresentationController:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SBAmbientMainDisplayController;
  v5 = [(SBAmbientMainDisplayController *)&v16 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_ambientPresentationController, v4);
    [v4 addObserver:v6];
    v7 = (BrightnessSystemClient *)objc_alloc_init(MEMORY[0x1E4F5B290]);
    brightnessSystemClient = v6->_brightnessSystemClient;
    v6->_brightnessSystemClient = v7;

    v9 = [MEMORY[0x1E4F4F730] serial];
    v10 = [v9 serviceClass:25];
    uint64_t v11 = BSDispatchQueueCreate();
    brightnessSystemQueue = v6->_brightnessSystemQueue;
    v6->_brightnessSystemQueue = (OS_dispatch_queue *)v11;

    uint64_t v13 = +[SBBacklightController sharedInstance];
    backlightController = v6->_backlightController;
    v6->_backlightController = (SBBacklightController *)v13;

    [(SBBacklightController *)v6->_backlightController addObserver:v6];
    v6->_ambientPresented = [v4 isPresented];
    v6->_backlightState = [(SBBacklightController *)v6->_backlightController backlightState];
    [(SBAmbientMainDisplayController *)v6 _updateCoreBrightnessAmbientModeForce:1];
  }

  return v6;
}

- (void)dealloc
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_ambientPresentationController);
  [WeakRetained removeObserver:self];

  [(SBBacklightController *)self->_backlightController removeObserver:self];
  v4.receiver = self;
  v4.super_class = (Class)SBAmbientMainDisplayController;
  [(SBAmbientMainDisplayController *)&v4 dealloc];
}

- (void)ambientPresentationController:(id)a3 didUpdatePresented:(BOOL)a4
{
  if (self->_ambientPresented != a4)
  {
    self->_ambientPresented = a4;
    [(SBAmbientMainDisplayController *)self _updateCoreBrightnessAmbientMode];
  }
}

- (void)backlightController:(id)a3 didTransitionToBacklightState:(int64_t)a4 source:(int64_t)a5
{
  if (self->_backlightState != a4)
  {
    self->_backlightState = a4;
    [(SBAmbientMainDisplayController *)self _updateCoreBrightnessAmbientMode];
  }
}

- (BOOL)_shouldEnableCoreBrightnessAmbientMode
{
  if (!self->_ambientPresented) {
    return 0;
  }
  if (self->_isCoreBrightnessAmbientModeEnabled) {
    return 1;
  }
  return SBBacklightStateIsActive(self->_backlightState);
}

- (void)_updateCoreBrightnessAmbientMode
{
}

- (void)_updateCoreBrightnessAmbientModeForce:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(SBAmbientMainDisplayController *)self _shouldEnableCoreBrightnessAmbientMode];
  if (self->_isCoreBrightnessAmbientModeEnabled != v5 || v3)
  {
    self->_isCoreBrightnessAmbientModeEnabled = v5;
    brightnessSystemQueue = self->_brightnessSystemQueue;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __72__SBAmbientMainDisplayController__updateCoreBrightnessAmbientModeForce___block_invoke;
    v8[3] = &unk_1E6AF5D38;
    BOOL v9 = v5;
    v8[4] = self;
    dispatch_async(brightnessSystemQueue, v8);
  }
}

void __72__SBAmbientMainDisplayController__updateCoreBrightnessAmbientModeForce___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = SBLogAmbientPresentation();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = *(unsigned __int8 *)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 32);
    int v5 = *(unsigned __int8 *)(v4 + 40);
    v6 = SBBacklightStateDescription(*(void *)(v4 + 48));
    v9[0] = 67109634;
    v9[1] = v3;
    __int16 v10 = 1024;
    int v11 = v5;
    __int16 v12 = 2114;
    uint64_t v13 = v6;
    _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_DEFAULT, "Setting CoreBrightness Ambient mode to %{BOOL}u [ presented : %{BOOL}d ; backlight : '%{public}@' ]",
      (uint8_t *)v9,
      0x18u);
  }
  v7 = *(void **)(*(void *)(a1 + 32) + 24);
  v8 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];
  [v7 setProperty:v8 forKey:@"DominoStateUpdate"];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_brightnessSystemQueue, 0);
  objc_storeStrong((id *)&self->_brightnessSystemClient, 0);
  objc_storeStrong((id *)&self->_backlightController, 0);
  objc_destroyWeak((id *)&self->_ambientPresentationController);
}

@end