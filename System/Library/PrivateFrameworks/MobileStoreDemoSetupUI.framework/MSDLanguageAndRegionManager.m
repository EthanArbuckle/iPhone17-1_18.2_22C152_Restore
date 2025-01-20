@interface MSDLanguageAndRegionManager
+ (id)sharedInstance;
- (BOOL)saveCurrentDeviceLanguageIdentifier;
- (BOOL)saveCuurentDeviceRegionCode;
- (BOOL)saveDeviceLanguageIdentifier:(id)a3;
- (BOOL)saveDeviceRegionCode:(id)a3;
- (BOOL)setDeviceLanguage:(id)a3 andRegion:(id)a4 sbRestartNeeded:(BOOL *)a5 sbRestartHandler:(id)a6;
- (MSDLanguageAndRegionManager)init;
- (OS_dispatch_queue)queue;
- (id)deviceLanguageIdentifier;
- (id)deviceRegionCode;
- (id)getCurrentDeviceLanguage;
- (id)getCurrentDeviceLocaleCode;
- (id)getCurrentDevicePreferredLanguage;
- (id)getCurrentDeviceRegion;
- (void)cancelNotifyToken:(int)a3;
- (void)restoreDeviceLanguageAndRegionIfNeeded;
- (void)setQueue:(id)a3;
@end

@implementation MSDLanguageAndRegionManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_0);
  }
  v2 = (void *)sharedInstance_shared;
  return v2;
}

uint64_t __45__MSDLanguageAndRegionManager_sharedInstance__block_invoke()
{
  sharedInstance_shared = objc_alloc_init(MSDLanguageAndRegionManager);
  return MEMORY[0x270F9A758]();
}

- (MSDLanguageAndRegionManager)init
{
  v5.receiver = self;
  v5.super_class = (Class)MSDLanguageAndRegionManager;
  v2 = [(MSDLanguageAndRegionManager *)&v5 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.msd_language_and_region", 0);
    [(MSDLanguageAndRegionManager *)v2 setQueue:v3];
  }
  return v2;
}

- (BOOL)setDeviceLanguage:(id)a3 andRegion:(id)a4 sbRestartNeeded:(BOOL *)a5 sbRestartHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  uint64_t v43 = 0;
  v44 = (int *)&v43;
  uint64_t v45 = 0x2020000000;
  int v46 = -1;
  v13 = +[MSDLanguageAndRegionHelper sharedInstance];
  int v14 = [v13 setDeviceLanguage:v10 andRegion:v11];

  if (v14 != 2)
  {
    dispatch_time_t v15 = dispatch_time(0, 60000000000);
    v16 = [(MSDLanguageAndRegionManager *)self queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __92__MSDLanguageAndRegionManager_setDeviceLanguage_andRegion_sbRestartNeeded_sbRestartHandler___block_invoke;
    block[3] = &unk_264D881B0;
    v42 = &v43;
    block[4] = self;
    id v17 = v12;
    id v41 = v17;
    dispatch_after(v15, v16, block);

    v18 = v44;
    v19 = [(MSDLanguageAndRegionManager *)self queue];
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __92__MSDLanguageAndRegionManager_setDeviceLanguage_andRegion_sbRestartNeeded_sbRestartHandler___block_invoke_4;
    handler[3] = &unk_264D881D8;
    handler[4] = self;
    v39 = &v43;
    id v38 = v17;
    notify_register_dispatch("com.apple.springboard.finishedstartup", v18 + 6, v19, handler);
  }
  if (![(MSDLanguageAndRegionManager *)self saveDeviceLanguageIdentifier:v10])
  {
    v22 = defaultLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[MSDLanguageAndRegionManager setDeviceLanguage:andRegion:sbRestartNeeded:sbRestartHandler:](v22, v23, v24, v25, v26, v27, v28, v29);
    }
LABEL_12:

    [(MSDLanguageAndRegionManager *)self cancelNotifyToken:v44[6]];
    BOOL v20 = 0;
    if (!a5) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (![(MSDLanguageAndRegionManager *)self saveDeviceRegionCode:v11])
  {
    v22 = defaultLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[MSDLanguageAndRegionManager setDeviceLanguage:andRegion:sbRestartNeeded:sbRestartHandler:](v22, v30, v31, v32, v33, v34, v35, v36);
    }
    goto LABEL_12;
  }
  BOOL v20 = 1;
  if (a5) {
LABEL_6:
  }
    *a5 = v14 != 2;
LABEL_7:
  _Block_object_dispose(&v43, 8);

  return v20;
}

uint64_t __92__MSDLanguageAndRegionManager_setDeviceLanguage_andRegion_sbRestartNeeded_sbRestartHandler___block_invoke(uint64_t result)
{
  if (*(_DWORD *)(*(void *)(*(void *)(result + 48) + 8) + 24) != -1)
  {
    uint64_t v1 = result;
    v2 = defaultLogHandle();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)dispatch_queue_t v3 = 0;
      _os_log_impl(&dword_23911B000, v2, OS_LOG_TYPE_DEFAULT, "Deadline for Springboard restart passed.", v3, 2u);
    }

    [*(id *)(v1 + 32) cancelNotifyToken:*(unsigned int *)(*(void *)(*(void *)(v1 + 48) + 8) + 24)];
    result = *(void *)(v1 + 40);
    if (result) {
      return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
    }
  }
  return result;
}

uint64_t __92__MSDLanguageAndRegionManager_setDeviceLanguage_andRegion_sbRestartNeeded_sbRestartHandler___block_invoke_4(uint64_t a1)
{
  int out_token = 0;
  notify_register_check("com.apple.springboard.finishedstartup", &out_token);
  uint64_t result = out_token;
  if (out_token != -1)
  {
    uint64_t state64 = 0;
    uint64_t result = notify_get_state(out_token, &state64);
    if (state64)
    {
      dispatch_queue_t v3 = defaultLogHandle();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v4 = 0;
        _os_log_impl(&dword_23911B000, v3, OS_LOG_TYPE_DEFAULT, "Springboard restarted.", v4, 2u);
      }

      [*(id *)(a1 + 32) cancelNotifyToken:*(unsigned int *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
      uint64_t result = *(void *)(a1 + 40);
      if (result) {
        return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
      }
    }
  }
  return result;
}

- (void)restoreDeviceLanguageAndRegionIfNeeded
{
}

- (id)getCurrentDeviceLanguage
{
  v2 = +[MSDLanguageAndRegionHelper sharedInstance];
  dispatch_queue_t v3 = [v2 getCurrentDeviceLanguage];

  return v3;
}

- (id)getCurrentDevicePreferredLanguage
{
  v2 = +[MSDLanguageAndRegionHelper sharedInstance];
  dispatch_queue_t v3 = [v2 getCurrentDevicePreferredLanguage];

  return v3;
}

- (id)getCurrentDeviceRegion
{
  v2 = +[MSDLanguageAndRegionHelper sharedInstance];
  dispatch_queue_t v3 = [v2 getCurrentDeviceRegion];

  return v3;
}

- (id)getCurrentDeviceLocaleCode
{
  v2 = +[MSDLanguageAndRegionHelper sharedInstance];
  dispatch_queue_t v3 = [v2 getCurrentLocaleCode];

  return v3;
}

- (BOOL)saveCurrentDeviceLanguageIdentifier
{
  v2 = self;
  dispatch_queue_t v3 = [(MSDLanguageAndRegionManager *)self getCurrentDeviceLanguage];
  LOBYTE(v2) = [(MSDLanguageAndRegionManager *)v2 saveDeviceLanguageIdentifier:v3];

  return (char)v2;
}

- (BOOL)saveCuurentDeviceRegionCode
{
  v2 = self;
  dispatch_queue_t v3 = [(MSDLanguageAndRegionManager *)self getCurrentDeviceRegion];
  LOBYTE(v2) = [(MSDLanguageAndRegionManager *)v2 saveDeviceRegionCode:v3];

  return (char)v2;
}

- (BOOL)saveDeviceLanguageIdentifier:(id)a3
{
  id v3 = a3;
  v4 = +[MSDPreferencesFile sharedInstance];
  char v5 = [v4 setObject:v3 forKey:@"DeviceLanguageIdentifier"];

  return v5;
}

- (id)deviceLanguageIdentifier
{
  v2 = +[MSDPreferencesFile sharedInstance];
  id v3 = [v2 objectForKey:@"DeviceLanguageIdentifier"];

  return v3;
}

- (BOOL)saveDeviceRegionCode:(id)a3
{
  id v3 = a3;
  v4 = +[MSDPreferencesFile sharedInstance];
  char v5 = [v4 setObject:v3 forKey:@"DeviceRegionCode"];

  return v5;
}

- (id)deviceRegionCode
{
  v2 = +[MSDPreferencesFile sharedInstance];
  id v3 = [v2 objectForKey:@"DeviceRegionCode"];

  return v3;
}

- (void)cancelNotifyToken:(int)a3
{
  if (a3 != -1) {
    notify_cancel(a3);
  }
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)setDeviceLanguage:(uint64_t)a3 andRegion:(uint64_t)a4 sbRestartNeeded:(uint64_t)a5 sbRestartHandler:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setDeviceLanguage:(uint64_t)a3 andRegion:(uint64_t)a4 sbRestartNeeded:(uint64_t)a5 sbRestartHandler:(uint64_t)a6 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end