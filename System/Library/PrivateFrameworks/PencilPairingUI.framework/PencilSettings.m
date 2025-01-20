@interface PencilSettings
+ (id)pencilUserDefaults;
+ (id)sharedPencilSettings;
- (PencilSettings)init;
- (id)daemonQueue;
- (int64_t)preferredSqueezeAction;
- (int64_t)preferredTapAction;
- (void)_dispatchWithErrorHandler:(id)a3 successHandler:(id)a4;
- (void)_postPencilSettingsDidChangeRemoteNotification;
- (void)loadSettings;
- (void)migrateObsoletedAXOpaqueTouchSetting;
- (void)setAutoRefineEnabled:(BOOL)a3;
- (void)setPreferredSqueezeAction:(int64_t)a3;
- (void)setPreferredTapAction:(int64_t)a3;
- (void)syncSettingsToBackboard;
@end

@implementation PencilSettings

+ (id)sharedPencilSettings
{
  if (sharedPencilSettings_onceToken != -1) {
    dispatch_once(&sharedPencilSettings_onceToken, &__block_literal_global_2);
  }
  v2 = (void *)sharedPencilSettings___sharedPencilSettings;
  return v2;
}

uint64_t __38__PencilSettings_sharedPencilSettings__block_invoke()
{
  sharedPencilSettings___sharedPencilSettings = objc_alloc_init(PencilSettings);
  return MEMORY[0x270F9A758]();
}

+ (id)pencilUserDefaults
{
  if (pencilUserDefaults_onceToken != -1) {
    dispatch_once(&pencilUserDefaults_onceToken, &__block_literal_global_11);
  }
  v2 = (void *)pencilUserDefaults___pencilUserDefaults;
  return v2;
}

uint64_t __36__PencilSettings_pencilUserDefaults__block_invoke()
{
  pencilUserDefaults___pencilUserDefaults = [objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.UIKit"];
  return MEMORY[0x270F9A758]();
}

- (PencilSettings)init
{
  v4.receiver = self;
  v4.super_class = (Class)PencilSettings;
  v2 = [(PencilSettings *)&v4 init];
  [(PencilSettings *)v2 loadSettings];
  return v2;
}

- (void)syncSettingsToBackboard
{
  v3 = os_log_create("com.apple.pencilpairingui", "");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_2397CD000, v3, OS_LOG_TYPE_DEFAULT, "Syncing settings to backboard", v8, 2u);
  }

  objc_super v4 = +[BundleControllerHelper sharedInstance];
  v5 = [NSNumber numberWithBool:self->_preferredTapAction == 0];
  [v4 setOpaqueTouchProperty:@"DoubleTapGestureDisabled" value:v5];

  v6 = +[BundleControllerHelper sharedInstance];
  v7 = [NSNumber numberWithBool:self->_preferredSqueezeAction == 0];
  [v6 setOpaqueTouchProperty:@"SqueezeGestureDisabled" value:v7];
}

- (void)migrateObsoletedAXOpaqueTouchSetting
{
  if (!_AXSAllowOpaqueTouchGestures())
  {
    v2 = os_log_create("com.apple.pencilpairingui", "");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2397CD000, v2, OS_LOG_TYPE_DEFAULT, "Migrating _AXSAllowOpaqueTouchGestures setting.", buf, 2u);
    }

    _AXSSetAllowOpaqueTouchGestures();
    if (_AXSAllowOpaqueTouchGestures())
    {
      v3 = +[PencilSettings pencilUserDefaults];
      [v3 setInteger:0 forKey:*MEMORY[0x263F1D510]];
    }
    else
    {
      v3 = os_log_create("com.apple.pencilpairingui", "");
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)objc_super v4 = 0;
        _os_log_impl(&dword_2397CD000, v3, OS_LOG_TYPE_DEFAULT, "Unable to migrate _AXSAllowOpaqueTouchGestures setting.", v4, 2u);
      }
    }
  }
}

- (void)loadSettings
{
  self->_preferredTapAction = [MEMORY[0x263F1C848] preferredTapAction];
  objc_opt_class();
  if (objc_opt_respondsToSelector()) {
    int64_t v3 = [MEMORY[0x263F1C848] preferredSqueezeAction];
  }
  else {
    int64_t v3 = 0;
  }
  self->_preferredSqueezeAction = v3;
}

- (void)setPreferredTapAction:(int64_t)a3
{
  if (self->_preferredTapAction != a3)
  {
    self->_preferredTapAction = a3;
    objc_super v4 = +[PencilSettings pencilUserDefaults];
    [v4 setInteger:self->_preferredTapAction forKey:*MEMORY[0x263F1D510]];

    v5 = +[PencilSettings pencilUserDefaults];
    [v5 synchronize];

    v6 = +[PencilSettingsStatisticsManager sharedInstance];
    [v6 recordSetPencilPerferredAction:self->_preferredTapAction];

    [(PencilSettings *)self syncSettingsToBackboard];
  }
}

- (void)setPreferredSqueezeAction:(int64_t)a3
{
  if (self->_preferredSqueezeAction != a3)
  {
    self->_preferredSqueezeAction = a3;
    objc_super v4 = +[PencilSettings pencilUserDefaults];
    [v4 setInteger:self->_preferredSqueezeAction forKey:*MEMORY[0x263F1D508]];

    v5 = +[PencilSettings pencilUserDefaults];
    [v5 synchronize];

    [(PencilSettings *)self _postPencilSettingsDidChangeRemoteNotification];
    [(PencilSettings *)self syncSettingsToBackboard];
  }
}

- (void)_postPencilSettingsDidChangeRemoteNotification
{
  if (objc_opt_respondsToSelector())
  {
    v2 = (void *)MEMORY[0x263F14B98];
    [v2 _postPencilSettingsDidChangeRemoteNotification];
  }
}

- (void)setAutoRefineEnabled:(BOOL)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __39__PencilSettings_setAutoRefineEnabled___block_invoke_36;
  v3[3] = &__block_descriptor_33_e38_v16__0___CHPKRemoteSettingsProtocol__8l;
  BOOL v4 = a3;
  [(PencilSettings *)self _dispatchWithErrorHandler:&__block_literal_global_35 successHandler:v3];
}

void __39__PencilSettings_setAutoRefineEnabled___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  int64_t v3 = os_log_create("com.apple.pencilpairingui", "");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __39__PencilSettings_setAutoRefineEnabled___block_invoke_cold_1((uint64_t)v2, v3);
  }
}

void __39__PencilSettings_setAutoRefineEnabled___block_invoke_36(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  BOOL v4 = os_log_create("com.apple.pencilpairingui", "");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = @"YES";
    if (!*(unsigned char *)(a1 + 32)) {
      v5 = @"NO";
    }
    int v6 = 138412546;
    v7 = @"UIAutoRefineEnabledKey";
    __int16 v8 = 2112;
    v9 = v5;
    _os_log_impl(&dword_2397CD000, v4, OS_LOG_TYPE_INFO, "Setting %@ : %@", (uint8_t *)&v6, 0x16u);
  }

  if (objc_opt_respondsToSelector()) {
    [v3 setGlobalAutoRefineEnabled:*(unsigned __int8 *)(a1 + 32) withCompletion:&__block_literal_global_47];
  }
}

void __39__PencilSettings_setAutoRefineEnabled___block_invoke_45()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"PKRemoteAutoRefineSettingsDidChange", 0, 0, 1u);
}

- (void)_dispatchWithErrorHandler:(id)a3 successHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  __int16 v8 = [(PencilSettings *)self daemonQueue];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __59__PencilSettings__dispatchWithErrorHandler_successHandler___block_invoke;
  v11[3] = &unk_264DA5918;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, v11);
}

void __59__PencilSettings__dispatchWithErrorHandler_successHandler___block_invoke(uint64_t a1)
{
  id v2 = (void *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.handwritingd.pksettings" options:0];
  id v3 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26ED1A518];
  [v2 setRemoteObjectInterface:v3];
  [v2 resume];
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  uint64_t v6 = MEMORY[0x263EF8330];
  uint64_t v7 = 3221225472;
  __int16 v8 = __59__PencilSettings__dispatchWithErrorHandler_successHandler___block_invoke_2;
  id v9 = &unk_264DA58F0;
  id v10 = *(id *)(a1 + 32);
  v11 = &v12;
  BOOL v4 = [v2 synchronousRemoteObjectProxyWithErrorHandler:&v6];
  if (!*((unsigned char *)v13 + 24))
  {
    uint64_t v5 = *(void *)(a1 + 40);
    if (v5) {
      (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v4);
    }
  }
  objc_msgSend(v2, "invalidate", v6, v7, v8, v9);

  _Block_object_dispose(&v12, 8);
}

uint64_t __59__PencilSettings__dispatchWithErrorHandler_successHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    uint64_t result = (*(uint64_t (**)(void))(result + 16))();
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  return result;
}

- (id)daemonQueue
{
  if (daemonQueue_onceToken != -1) {
    dispatch_once(&daemonQueue_onceToken, &__block_literal_global_114);
  }
  id v2 = (void *)daemonQueue_sQueue;
  return v2;
}

uint64_t __29__PencilSettings_daemonQueue__block_invoke()
{
  daemonQueue_sQueue = (uint64_t)dispatch_queue_create("com.apple.PencilKit.settingsDaemon", 0);
  return MEMORY[0x270F9A758]();
}

- (int64_t)preferredTapAction
{
  return self->_preferredTapAction;
}

- (int64_t)preferredSqueezeAction
{
  return self->_preferredSqueezeAction;
}

void __39__PencilSettings_setAutoRefineEnabled___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 138412546;
  id v3 = @"UIAutoRefineEnabledKey";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_2397CD000, a2, OS_LOG_TYPE_ERROR, "Error creating xpc connection to set %@: %@", (uint8_t *)&v2, 0x16u);
}

@end