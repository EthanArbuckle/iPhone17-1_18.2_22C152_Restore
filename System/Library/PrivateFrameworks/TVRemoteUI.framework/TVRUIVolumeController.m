@interface TVRUIVolumeController
- (BOOL)supportsVolumeControl;
- (BSInvalidatable)volumeDecreaseSBSInvalidator;
- (BSInvalidatable)volumeIncreaseSBSInvalidator;
- (UIWindow)window;
- (id)eventHandler;
- (id)initForWindow:(id)a3 eventHandler:(id)a4;
- (void)consumeSinglePressDownForButtonKind:(int64_t)a3;
- (void)disableVolumeControl;
- (void)enableVolumeControl;
- (void)setEventHandler:(id)a3;
- (void)setSupportsVolumeControl:(BOOL)a3;
- (void)setVolumeDecreaseSBSInvalidator:(id)a3;
- (void)setVolumeIncreaseSBSInvalidator:(id)a3;
- (void)setWindow:(id)a3;
@end

@implementation TVRUIVolumeController

- (id)initForWindow:(id)a3 eventHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)TVRUIVolumeController;
  v9 = [(TVRUIVolumeController *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_window, a3);
    v11 = _Block_copy(v8);
    id eventHandler = v10->_eventHandler;
    v10->_id eventHandler = v11;
  }
  return v10;
}

- (void)enableVolumeControl
{
  BOOL v3 = [(TVRUIVolumeController *)self supportsVolumeControl];
  v4 = _TVRUIVolumeControllerLog();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_227326000, v4, OS_LOG_TYPE_DEFAULT, "Registering for volume button events", buf, 2u);
    }

    v6 = [(TVRUIVolumeController *)self window];

    if (v6)
    {
      id v7 = [(TVRUIVolumeController *)self window];
      id v8 = [v7 windowScene];
      [v8 _setSystemVolumeHUDEnabled:0];
    }
    v9 = [(TVRUIVolumeController *)self volumeIncreaseSBSInvalidator];
    if (v9)
    {
    }
    else
    {
      v12 = [(TVRUIVolumeController *)self volumeDecreaseSBSInvalidator];

      if (!v12)
      {
        v13 = _TVRUIVolumeControllerLog();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v17 = 0;
          _os_log_impl(&dword_227326000, v13, OS_LOG_TYPE_DEFAULT, "Begin consuming volume button presses", v17, 2u);
        }

        objc_super v14 = [MEMORY[0x263F79398] sharedInstance];
        v15 = [v14 beginConsumingPressesForButtonKind:4 eventConsumer:self priority:0];
        [(TVRUIVolumeController *)self setVolumeDecreaseSBSInvalidator:v15];

        v4 = [MEMORY[0x263F79398] sharedInstance];
        v16 = [v4 beginConsumingPressesForButtonKind:3 eventConsumer:self priority:0];
        [(TVRUIVolumeController *)self setVolumeIncreaseSBSInvalidator:v16];

        goto LABEL_14;
      }
    }
    v4 = _TVRUIVolumeControllerLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v18 = 0;
      v10 = "Already listening for volume button presses";
      v11 = v18;
      goto LABEL_13;
    }
  }
  else if (v5)
  {
    __int16 v20 = 0;
    v10 = "Volume control is NOT supported. Skipping listening for volume button events";
    v11 = (uint8_t *)&v20;
LABEL_13:
    _os_log_impl(&dword_227326000, v4, OS_LOG_TYPE_DEFAULT, v10, v11, 2u);
  }
LABEL_14:
}

- (void)disableVolumeControl
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  BOOL v3 = _TVRUIVolumeControllerLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109120;
    v9[1] = [(TVRUIVolumeController *)self supportsVolumeControl];
    _os_log_impl(&dword_227326000, v3, OS_LOG_TYPE_DEFAULT, "Unregistering from volume button events. supportsVolumeControl:%{BOOL}d", (uint8_t *)v9, 8u);
  }

  v4 = [(TVRUIVolumeController *)self window];

  if (v4)
  {
    BOOL v5 = [(TVRUIVolumeController *)self window];
    v6 = [v5 windowScene];
    [v6 _setSystemVolumeHUDEnabled:1];
  }
  id v7 = [(TVRUIVolumeController *)self volumeDecreaseSBSInvalidator];
  [v7 invalidate];

  id v8 = [(TVRUIVolumeController *)self volumeIncreaseSBSInvalidator];
  [v8 invalidate];

  [(TVRUIVolumeController *)self setVolumeDecreaseSBSInvalidator:0];
  [(TVRUIVolumeController *)self setVolumeIncreaseSBSInvalidator:0];
}

- (void)consumeSinglePressDownForButtonKind:(int64_t)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  BOOL v5 = _TVRUIVolumeControllerLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = NSStringFromSBSHardwareButtonKind();
    int v8 = 136315394;
    v9 = "-[TVRUIVolumeController consumeSinglePressDownForButtonKind:]";
    __int16 v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_227326000, v5, OS_LOG_TYPE_DEFAULT, "%s, buttonKind: %@", (uint8_t *)&v8, 0x16u);
  }
  if (a3 == 4 || a3 == 3)
  {
    uint64_t v7 = [(TVRUIVolumeController *)self eventHandler];
    (*(void (**)(void))(v7 + 16))();
  }
  else
  {
    uint64_t v7 = _TVRUIVolumeControllerLog();
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_ERROR)) {
      -[TVRUIVolumeController consumeSinglePressDownForButtonKind:](a3, v7);
    }
  }
}

- (BOOL)supportsVolumeControl
{
  return self->_supportsVolumeControl;
}

- (void)setSupportsVolumeControl:(BOOL)a3
{
  self->_supportsVolumeControl = a3;
}

- (id)eventHandler
{
  return self->_eventHandler;
}

- (void)setEventHandler:(id)a3
{
}

- (UIWindow)window
{
  return self->_window;
}

- (void)setWindow:(id)a3
{
}

- (BSInvalidatable)volumeDecreaseSBSInvalidator
{
  return self->_volumeDecreaseSBSInvalidator;
}

- (void)setVolumeDecreaseSBSInvalidator:(id)a3
{
}

- (BSInvalidatable)volumeIncreaseSBSInvalidator
{
  return self->_volumeIncreaseSBSInvalidator;
}

- (void)setVolumeIncreaseSBSInvalidator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_volumeIncreaseSBSInvalidator, 0);
  objc_storeStrong((id *)&self->_volumeDecreaseSBSInvalidator, 0);
  objc_storeStrong((id *)&self->_window, 0);
  objc_storeStrong(&self->_eventHandler, 0);
}

- (void)consumeSinglePressDownForButtonKind:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  BOOL v3 = NSStringFromSBSHardwareButtonKind();
  int v4 = 138412290;
  BOOL v5 = v3;
  _os_log_error_impl(&dword_227326000, a2, OS_LOG_TYPE_ERROR, "Unsupported button kind: %@", (uint8_t *)&v4, 0xCu);
}

@end