@interface DBSExternalDisplayManager
+ (id)defaultManager;
- (BOOL)autoBrightnessEnabled;
- (BOOL)deviceSupportsChamoisExternalDisplay;
- (BOOL)externalDisplayAutoBrightnessAvailable;
- (BOOL)externalDisplayAvailable;
- (BOOL)externalDisplayBrightnessAvailable;
- (BOOL)matchContent;
- (BrightnessSystemClient)brightnessSystemClient;
- (CGSize)externalDisplaySize;
- (CGSize)nativeDisplaySize;
- (DBSExternalDisplayManager)init;
- (NSNumber)externalDisplayBrightness;
- (NSString)currentHDRMode;
- (SBSExternalDisplayService)displayService;
- (id)externalDisplayName;
- (id)mainDisplayImageWithWidth:(double)a3;
- (id)mainDisplayName;
- (id)preferredHDRModes;
- (id)supportedHDRModes;
- (void)dealloc;
- (void)externalDisplayDidConnect:(id)a3;
- (void)externalDisplayWillDisconnect:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setAutoBrightnessEnabled:(BOOL)a3;
- (void)setBrightnessSystemClient:(id)a3;
- (void)setCurrentHDRMode:(id)a3;
- (void)setDisplayService:(id)a3;
- (void)setExternalDisplayBrightness:(id)a3 shouldCommit:(BOOL)a4;
- (void)setMatchContent:(BOOL)a3;
- (void)setMirroringEnabled:(BOOL)a3;
- (void)updateNativeDisplaySize:(CGSize)a3;
@end

@implementation DBSExternalDisplayManager

+ (id)defaultManager
{
  if (defaultManager_onceToken_0 != -1) {
    dispatch_once(&defaultManager_onceToken_0, &__block_literal_global_3);
  }
  v2 = (void *)defaultManager_defaultManager_0;
  return v2;
}

uint64_t __43__DBSExternalDisplayManager_defaultManager__block_invoke()
{
  defaultManager_defaultManager_0 = objc_alloc_init(DBSExternalDisplayManager);
  return MEMORY[0x270F9A758]();
}

- (DBSExternalDisplayManager)init
{
  v20.receiver = self;
  v20.super_class = (Class)DBSExternalDisplayManager;
  v2 = [(DBSExternalDisplayManager *)&v20 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F15778] TVOutDisplay];
    if (v3)
    {
      v4 = NSStringFromSelector(sel_preferences);
      [v3 addObserver:v2 forKeyPath:v4 options:1 context:PKDisplayPreferencesContext];

      if (![(DBSExternalDisplayManager *)v2 deviceSupportsChamoisExternalDisplay])
      {
        v5 = NSStringFromSelector(sel_currentMode);
        [v3 addObserver:v2 forKeyPath:v5 options:1 context:PKDisplayCurrentModeContext];
      }
    }
    v6 = (BrightnessSystemClient *)objc_alloc_init(MEMORY[0x263F34238]);
    brightnessSystemClient = v2->_brightnessSystemClient;
    v2->_brightnessSystemClient = v6;

    [(BrightnessSystemClient *)v2->_brightnessSystemClient registerNotificationBlock:&__block_literal_global_25 forProperties:&unk_26E939140];
    if ([(DBSExternalDisplayManager *)v2 deviceSupportsChamoisExternalDisplay])
    {
      uint64_t v8 = objc_opt_new();
      displayService = v2->_displayService;
      v2->_displayService = (SBSExternalDisplayService *)v8;

      [(SBSExternalDisplayService *)v2->_displayService addObserver:v2];
    }
    v10 = [MEMORY[0x263F3F738] configurationForDefaultMainDisplayMonitor];
    objc_initWeak(&location, v2);
    uint64_t v14 = MEMORY[0x263EF8330];
    uint64_t v15 = 3221225472;
    v16 = __33__DBSExternalDisplayManager_init__block_invoke_2;
    v17 = &unk_264C7A7F8;
    objc_copyWeak(&v18, &location);
    [v10 setTransitionHandler:&v14];
    uint64_t v11 = objc_msgSend(MEMORY[0x263F3F728], "monitorWithConfiguration:", v10, v14, v15, v16, v17);
    layoutMonitor = v2->_layoutMonitor;
    v2->_layoutMonitor = (FBSDisplayLayoutMonitor *)v11;

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __33__DBSExternalDisplayManager_init__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if ([v4 isEqualToString:@"DisplayBrightness2Available"])
  {
    v2 = DBSExternalDisplayManagerExternalBrightnessAvailablityDidChange;
  }
  else if ([v4 isEqualToString:@"DisplayBrightness2"])
  {
    v2 = DBSExternalDisplayManagerExternalBrightnessValueDidChange;
  }
  else if ([v4 isEqualToString:@"DisplayBrightnessAuto2Available"])
  {
    v2 = DBSExternalDisplayManagerExternalAutoBrightnessAvailablityDidChange;
  }
  else
  {
    if (![v4 isEqualToString:@"DisplayBrightnessAuto2"]) {
      goto LABEL_10;
    }
    v2 = DBSExternalDisplayManagerExternalAutoBrightnessValueDidChange;
  }
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 postNotificationName:*v2 object:0];

LABEL_10:
}

void __33__DBSExternalDisplayManager_init__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __33__DBSExternalDisplayManager_init__block_invoke_3;
  v6[3] = &unk_264C7A778;
  objc_copyWeak(&v8, (id *)(a1 + 32));
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);

  objc_destroyWeak(&v8);
}

void __33__DBSExternalDisplayManager_init__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v2 = [MEMORY[0x263F08A00] defaultCenter];
    [v2 postNotificationName:DBSExternalDisplayManagerDisplayLayoutMonitorDidChange object:*(void *)(a1 + 32)];

    [*(id *)(a1 + 32) bounds];
    objc_msgSend(WeakRetained, "updateNativeDisplaySize:", v3, v4);
  }
}

- (void)dealloc
{
  double v3 = [MEMORY[0x263F15778] TVOutDisplay];
  if (v3)
  {
    double v4 = NSStringFromSelector(sel_preferences);
    [v3 removeObserver:self forKeyPath:v4 context:PKDisplayPreferencesContext];

    if (![(DBSExternalDisplayManager *)self deviceSupportsChamoisExternalDisplay])
    {
      id v5 = NSStringFromSelector(sel_currentMode);
      [v3 removeObserver:self forKeyPath:v5 context:PKDisplayCurrentModeContext];
    }
  }

  v6 = [(DBSExternalDisplayManager *)self brightnessSystemClient];
  [v6 unregisterNotificationForKeys:&unk_26E939158];

  if ([(DBSExternalDisplayManager *)self deviceSupportsChamoisExternalDisplay]) {
    [(SBSExternalDisplayService *)self->_displayService removeObserver:self];
  }
  [(FBSDisplayLayoutMonitor *)self->_layoutMonitor invalidate];
  v7.receiver = self;
  v7.super_class = (Class)DBSExternalDisplayManager;
  [(DBSExternalDisplayManager *)&v7 dealloc];
}

- (id)externalDisplayName
{
  if ([(DBSExternalDisplayManager *)self externalDisplayAvailable])
  {
    v2 = [MEMORY[0x263F15778] TVOutDisplay];
    uint64_t v3 = [v2 productName];
    if (v3
      && (double v4 = (void *)v3,
          [v2 productName],
          id v5 = objc_claimAutoreleasedReturnValue(),
          uint64_t v6 = [v5 length],
          v5,
          v4,
          v6))
    {
      uint64_t v7 = [v2 productName];
    }
    else
    {
      uint64_t v7 = DBS_LocalizedStringForConnectedDisplays(@"EXTERNAL_DISPLAY");
    }
    id v8 = (void *)v7;
  }
  else
  {
    id v8 = 0;
  }
  return v8;
}

- (CGSize)externalDisplaySize
{
  if ([(DBSExternalDisplayManager *)self externalDisplayAvailable])
  {
    v2 = [MEMORY[0x263F15778] TVOutDisplay];
    uint64_t v3 = v2;
    if (v2)
    {
      [v2 frame];
      double v5 = v4;
      double v7 = v6;
    }
    else
    {
      double v5 = *MEMORY[0x263F001B0];
      double v7 = *(double *)(MEMORY[0x263F001B0] + 8);
    }
  }
  else
  {
    double v5 = *MEMORY[0x263F001B0];
    double v7 = *(double *)(MEMORY[0x263F001B0] + 8);
  }
  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)updateNativeDisplaySize:(CGSize)a3
{
  if (self->_nativeDisplaySize.width != a3.width || self->_nativeDisplaySize.height != a3.height) {
    self->_nativeDisplaySize = a3;
  }
}

- (id)mainDisplayName
{
  v2 = [MEMORY[0x263F15778] mainDisplay];
  uint64_t v3 = [v2 productName];
  if (v3
    && (double v4 = (void *)v3,
        [v2 productName],
        double v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v5 length],
        v5,
        v4,
        v6))
  {
    uint64_t v7 = [v2 productName];
  }
  else
  {
    uint64_t v7 = DBS_LocalizedStringForConnectedDisplays(@"MAIN_DISPLAY");
  }
  double v8 = (void *)v7;

  return v8;
}

- (id)mainDisplayImageWithWidth:(double)a3
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = __Block_byref_object_copy_;
  uint64_t v14 = __Block_byref_object_dispose_;
  id v15 = 0;
  uint64_t v3 = [MEMORY[0x263F82438] sharedApplication];
  double v4 = [v3 connectedScenes];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __55__DBSExternalDisplayManager_mainDisplayImageWithWidth___block_invoke;
  v9[3] = &unk_264C7A820;
  v9[4] = &v10;
  [v4 enumerateObjectsUsingBlock:v9];

  [(id)v11[5] interfaceOrientation];
  double v5 = [MEMORY[0x263F82B60] mainScreen];
  [v5 scale];
  uint64_t v6 = [MEMORY[0x263F82B60] mainScreen];
  [v6 scale];

  uint64_t v7 = SBSUIWallpaperGetPreview();
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __55__DBSExternalDisplayManager_mainDisplayImageWithWidth___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v8 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && ![v8 activationState])
  {
    uint64_t v6 = [v8 _sceneIdentifier];
    int v7 = [v6 isEqualToString:@"sceneID:com.apple.Preferences-default"];

    if (v7)
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
      *a3 = 1;
    }
  }
}

- (id)supportedHDRModes
{
  if ([(DBSExternalDisplayManager *)self externalDisplayAvailable])
  {
    v2 = [MEMORY[0x263F15778] TVOutDisplay];
    uint64_t v3 = [v2 supportedHDRModes];
  }
  else
  {
    uint64_t v3 = (void *)MEMORY[0x263EFFA68];
  }
  return v3;
}

- (id)preferredHDRModes
{
  if ([(DBSExternalDisplayManager *)self externalDisplayAvailable])
  {
    v2 = [MEMORY[0x263F15778] TVOutDisplay];
    uint64_t v3 = [v2 preferredHDRModes];
  }
  else
  {
    uint64_t v3 = (void *)MEMORY[0x263EFFA68];
  }
  return v3;
}

- (BOOL)externalDisplayAvailable
{
  v2 = [MEMORY[0x263F15778] TVOutDisplay];
  uint64_t v3 = v2;
  if (v2)
  {
    double v4 = [v2 currentMode];
    if ([v4 height]) {
      BOOL v5 = [v4 width] != 0;
    }
    else {
      BOOL v5 = 0;
    }
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)externalDisplayBrightnessAvailable
{
  v2 = [(DBSExternalDisplayManager *)self brightnessSystemClient];
  uint64_t v3 = (void *)[v2 copyPropertyForKey:@"DisplayBrightness2Available"];

  LOBYTE(v2) = [v3 BOOLValue];
  return (char)v2;
}

- (BOOL)externalDisplayAutoBrightnessAvailable
{
  v2 = [(DBSExternalDisplayManager *)self brightnessSystemClient];
  uint64_t v3 = (void *)[v2 copyPropertyForKey:@"DisplayBrightnessAuto2Available"];

  LOBYTE(v2) = [v3 BOOLValue];
  return (char)v2;
}

- (NSString)currentHDRMode
{
  v2 = [MEMORY[0x263F15778] TVOutDisplay];
  uint64_t v3 = v2;
  if (v2)
  {
    double v4 = [v2 preferences];
    BOOL v5 = [v4 preferredHdrMode];

    if (v5)
    {
      uint64_t v6 = [v3 preferences];
      [v6 preferredHdrMode];
    }
    else
    {
      uint64_t v6 = [v3 currentMode];
      [v6 hdrMode];
    }
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v7 = (id)*MEMORY[0x263F15A40];
  }

  return (NSString *)v7;
}

- (void)setCurrentHDRMode:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a3;
  double v4 = [MEMORY[0x263F15778] TVOutDisplay];
  if (v4)
  {
    BOOL v5 = DBSLogForCategory(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      id v9 = v3;
      _os_log_impl(&dword_235D7B000, v5, OS_LOG_TYPE_DEFAULT, "External Display: Setting current HDR mode preference to value: %@", (uint8_t *)&v8, 0xCu);
    }

    uint64_t v6 = [v4 preferences];
    id v7 = (void *)[v6 mutableCopy];

    [v7 setPreferredHdrMode:v3];
    [v4 setPreferences:v7];
  }
}

- (BOOL)matchContent
{
  v2 = [MEMORY[0x263F15778] TVOutDisplay];
  id v3 = v2;
  if (v2)
  {
    double v4 = [v2 preferences];
    char v5 = [v4 matchContent];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (void)setMatchContent:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v11 = *MEMORY[0x263EF8340];
  double v4 = [MEMORY[0x263F15778] TVOutDisplay];
  if (v4)
  {
    char v5 = DBSLogForCategory(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = @"NO";
      if (v3) {
        uint64_t v6 = @"YES";
      }
      int v9 = 138412290;
      uint64_t v10 = v6;
      _os_log_impl(&dword_235D7B000, v5, OS_LOG_TYPE_DEFAULT, "External Display: Setting match content preference to value: %@", (uint8_t *)&v9, 0xCu);
    }

    id v7 = [v4 preferences];
    int v8 = (void *)[v7 mutableCopy];

    [v8 setMatchContent:v3];
    [v4 setPreferences:v8];
  }
}

- (NSNumber)externalDisplayBrightness
{
  v2 = [(DBSExternalDisplayManager *)self brightnessSystemClient];
  BOOL v3 = (void *)[v2 copyPropertyForKey:@"DisplayBrightness2"];

  return (NSNumber *)v3;
}

- (BOOL)autoBrightnessEnabled
{
  v2 = [(DBSExternalDisplayManager *)self brightnessSystemClient];
  BOOL v3 = (void *)[v2 copyPropertyForKey:@"DisplayBrightnessAuto2"];

  LOBYTE(v2) = [v3 BOOLValue];
  return (char)v2;
}

- (void)setAutoBrightnessEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v15 = *MEMORY[0x263EF8340];
  char v5 = DBSLogForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [NSNumber numberWithBool:v3];
    int v13 = 138412290;
    uint64_t v14 = v6;
    _os_log_impl(&dword_235D7B000, v5, OS_LOG_TYPE_DEFAULT, "External Display: Setting external display auto brightness setting to to %@.", (uint8_t *)&v13, 0xCu);
  }
  id v7 = [(DBSExternalDisplayManager *)self brightnessSystemClient];
  int v8 = [NSNumber numberWithBool:v3];
  int v9 = [v7 setProperty:v8 forKey:@"DisplayBrightnessAuto2"];

  uint64_t v10 = DBSLogForCategory(0);
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v11)
    {
      LOWORD(v13) = 0;
      uint64_t v12 = "External Display: Set external display auto brightness setting successfully.";
LABEL_8:
      _os_log_impl(&dword_235D7B000, v10, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v13, 2u);
    }
  }
  else if (v11)
  {
    LOWORD(v13) = 0;
    uint64_t v12 = "External Display: Failed to set external display auto brightness setting.";
    goto LABEL_8;
  }
}

- (void)setExternalDisplayBrightness:(id)a3 shouldCommit:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = DBSLogForCategory(0);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = [NSNumber numberWithBool:v4];
    *(_DWORD *)buf = 138412546;
    id v18 = v6;
    __int16 v19 = 2112;
    objc_super v20 = v8;
    _os_log_impl(&dword_235D7B000, v7, OS_LOG_TYPE_DEFAULT, "External Display: Setting external display brightness to %@ with hint %@.", buf, 0x16u);
  }
  int v9 = objc_msgSend(NSNumber, "numberWithBool:", v4, @"Brightness", @"Commit", v6);
  v16[1] = v9;
  uint64_t v10 = [NSDictionary dictionaryWithObjects:v16 forKeys:&v15 count:2];

  BOOL v11 = [(DBSExternalDisplayManager *)self brightnessSystemClient];
  LODWORD(v9) = [v11 setProperty:v10 forKey:@"DisplayBrightness2"];

  uint64_t v12 = DBSLogForCategory(0);
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v13)
    {
      *(_WORD *)buf = 0;
      uint64_t v14 = "External Display: Set external display brightness successfully.";
LABEL_8:
      _os_log_impl(&dword_235D7B000, v12, OS_LOG_TYPE_DEFAULT, v14, buf, 2u);
    }
  }
  else if (v13)
  {
    *(_WORD *)buf = 0;
    uint64_t v14 = "External Display: Failed to set external display brightness.";
    goto LABEL_8;
  }
}

- (void)setMirroringEnabled:(BOOL)a3
{
  char v5 = [(DBSExternalDisplayManager *)self displayService];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __49__DBSExternalDisplayManager_setMirroringEnabled___block_invoke;
  v6[3] = &unk_264C7A848;
  void v6[4] = self;
  BOOL v7 = a3;
  [v5 getConnectedDisplayInfoWithCompletionHandler:v6];
}

void __49__DBSExternalDisplayManager_setMirroringEnabled___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  if ([v7 count])
  {
    BOOL v3 = [v7 firstObject];
    BOOL v4 = [*(id *)(a1 + 32) displayService];
    uint64_t v5 = *(unsigned __int8 *)(a1 + 40);
    id v6 = [v3 identifier];
    [v4 setMirroringEnabled:v5 forDisplay:v6];
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  BOOL v13 = [MEMORY[0x263F15778] TVOutDisplay];
  uint64_t v14 = v13;
  if ((void *)PKDisplayPreferencesContext == a6 && [v13 isEqual:v11])
  {
    uint64_t v15 = DBSLogForCategory(0);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = [v14 preferences];
      v17 = [v16 description];
      *(_DWORD *)buf = 138412290;
      v23 = v17;
      _os_log_impl(&dword_235D7B000, v15, OS_LOG_TYPE_DEFAULT, "External Display: Display preference did change: %@", buf, 0xCu);
    }
  }
  else
  {
    if ((void *)PKDisplayCurrentModeContext != a6 || ![v14 isEqual:v11])
    {
      v21.receiver = self;
      v21.super_class = (Class)DBSExternalDisplayManager;
      [(DBSExternalDisplayManager *)&v21 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
      goto LABEL_12;
    }
    id v18 = DBSLogForCategory(0);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v19 = [v14 currentMode];
      objc_super v20 = [v19 description];
      *(_DWORD *)buf = 138412290;
      v23 = v20;
      _os_log_impl(&dword_235D7B000, v18, OS_LOG_TYPE_DEFAULT, "External Display: Display current mode did change %@", buf, 0xCu);
    }
    uint64_t v15 = [MEMORY[0x263F08A00] defaultCenter];
    [v15 postNotificationName:DBSExternalDisplayManagerCurrentModeDidChange[0] object:0];
  }

LABEL_12:
}

- (void)externalDisplayDidConnect:(id)a3
{
  objc_msgSend(MEMORY[0x263F08A00], "defaultCenter", a3);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v3 postNotificationName:DBSExternalDisplayManagerCurrentModeDidChange[0] object:0];
}

- (void)externalDisplayWillDisconnect:(id)a3
{
  objc_msgSend(MEMORY[0x263F08A00], "defaultCenter", a3);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v3 postNotificationName:DBSExternalDisplayManagerCurrentModeDidChange[0] object:0];
}

- (BOOL)deviceSupportsChamoisExternalDisplay
{
  int v2 = MGGetBoolAnswer();
  if (v2)
  {
    if (_os_feature_enabled_impl())
    {
      LOBYTE(v2) = 1;
    }
    else
    {
      LOBYTE(v2) = _os_feature_enabled_impl();
    }
  }
  return v2;
}

- (CGSize)nativeDisplaySize
{
  double width = self->_nativeDisplaySize.width;
  double height = self->_nativeDisplaySize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (BrightnessSystemClient)brightnessSystemClient
{
  return self->_brightnessSystemClient;
}

- (void)setBrightnessSystemClient:(id)a3
{
}

- (SBSExternalDisplayService)displayService
{
  return self->_displayService;
}

- (void)setDisplayService:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayService, 0);
  objc_storeStrong((id *)&self->_brightnessSystemClient, 0);
  objc_storeStrong((id *)&self->_layoutMonitor, 0);
}

@end