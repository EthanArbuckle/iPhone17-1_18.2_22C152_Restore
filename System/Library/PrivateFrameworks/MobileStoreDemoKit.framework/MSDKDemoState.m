@interface MSDKDemoState
+ (id)sharedInstance;
- (BOOL)_isDeviceEnrolledWithDeKOTA:(id *)a3;
- (BOOL)_isMuseBuddyDemoModeEnabled;
- (BOOL)_isPressDemoModeEnabled;
- (BOOL)_isPressDemoModeEnabled:(id *)a3;
- (BOOL)_isStoreDemoModeEnabled:(id *)a3;
- (BOOL)isDeviceEnrolledWithDeKOTA;
- (BOOL)isStoreDemoModeEnabled;
- (MSDKDemoState)init;
- (NSMutableDictionary)cache;
- (int)_activationConfigurationFlags:(id *)a3;
- (void)setCache:(id)a3;
@end

@implementation MSDKDemoState

- (BOOL)_isStoreDemoModeEnabled:(id *)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v4 = NSStringFromSelector(sel__isStoreDemoModeEnabled_);
  v5 = [(MSDKDemoState *)self cache];
  objc_sync_enter(v5);
  if (v4)
  {
    v6 = [(MSDKDemoState *)self cache];
    v7 = [v6 objectForKey:v4];

    if (v7)
    {
      v8 = [(MSDKDemoState *)self cache];
      v9 = [v8 objectForKey:v4];
      LOBYTE(v10) = [v9 BOOLValue];

      objc_sync_exit(v5);
      goto LABEL_12;
    }
  }
  objc_sync_exit(v5);

  if (geteuid())
  {
    LODWORD(v10) = CFPreferencesGetAppBooleanValue(@"StoreDemoMode", @"com.apple.demo-settings", 0) != 0;
    if (!v4) {
      goto LABEL_12;
    }
    goto LABEL_10;
  }
  v11 = defaultLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 136315138;
    v16 = "-[MSDKDemoState _isStoreDemoModeEnabled:]";
    _os_log_impl(&dword_21EF08000, v11, OS_LOG_TYPE_DEFAULT, "%s - Caller is in root user session, making call to MobileGestalt", (uint8_t *)&v15, 0xCu);
  }

  LODWORD(v10) = MGGetBoolAnswer();
  if (v4)
  {
LABEL_10:
    if (v10)
    {
      v12 = [(MSDKDemoState *)self cache];
      objc_sync_enter(v12);
      v13 = [(MSDKDemoState *)self cache];
      v10 = [NSNumber numberWithBool:1];
      [v13 setObject:v10 forKey:v4];

      objc_sync_exit(v12);
      LOBYTE(v10) = 1;
    }
  }
LABEL_12:

  return (char)v10;
}

- (NSMutableDictionary)cache
{
  return self->_cache;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_5 != -1) {
    dispatch_once(&sharedInstance_onceToken_5, &__block_literal_global_6);
  }
  v2 = (void *)sharedInstance_sharedInstance_1;
  return v2;
}

uint64_t __31__MSDKDemoState_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance_1 = objc_alloc_init(MSDKDemoState);
  return MEMORY[0x270F9A758]();
}

- (MSDKDemoState)init
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v10.receiver = self;
  v10.super_class = (Class)MSDKDemoState;
  v2 = [(MSDKDemoState *)&v10 init];
  if (v2)
  {
    v3 = defaultLogHandle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21EF08000, v3, OS_LOG_TYPE_DEFAULT, (const char *)&unk_21EF3DE4E, buf, 2u);
    }

    v4 = defaultLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = [MEMORY[0x263F08AB0] processInfo];
      v6 = [v5 processName];
      *(_DWORD *)buf = 138543362;
      v12 = v6;
      _os_log_impl(&dword_21EF08000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ started to use MobileStoreDemoKit/MSDKDemoState.", buf, 0xCu);
    }
    id v7 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    [(MSDKDemoState *)v2 setCache:v7];

    v8 = v2;
  }

  return v2;
}

- (void)setCache:(id)a3
{
}

- (BOOL)isStoreDemoModeEnabled
{
  return [(MSDKDemoState *)self _isStoreDemoModeEnabled:0];
}

- (BOOL)isDeviceEnrolledWithDeKOTA
{
  return [(MSDKDemoState *)self _isDeviceEnrolledWithDeKOTA:0];
}

- (BOOL)_isPressDemoModeEnabled:(id *)a3
{
  v4 = NSStringFromSelector(sel__isPressDemoModeEnabled);
  v5 = [(MSDKDemoState *)self cache];
  objc_sync_enter(v5);
  if (v4
    && ([(MSDKDemoState *)self cache],
        v6 = objc_claimAutoreleasedReturnValue(),
        [v6 objectForKey:v4],
        id v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        v7))
  {
    v8 = [(MSDKDemoState *)self cache];
    v9 = [v8 objectForKey:v4];
    char v10 = [v9 BOOLValue];

    objc_sync_exit(v5);
  }
  else
  {
    objc_sync_exit(v5);

    if (geteuid())
    {
      int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"PressDemoMode", @"com.apple.demo-settings", 0);
      char v10 = AppBooleanValue != 0;
      if (v4 && AppBooleanValue)
      {
        v12 = [(MSDKDemoState *)self cache];
        objc_sync_enter(v12);
        uint64_t v13 = [(MSDKDemoState *)self cache];
        v14 = [NSNumber numberWithBool:1];
        [v13 setObject:v14 forKey:v4];

        objc_sync_exit(v12);
        char v10 = 1;
      }
    }
    else
    {
      int v15 = defaultLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[MSDKDemoState _isPressDemoModeEnabled:](v15);
      }

      char v10 = 0;
    }
  }

  return v10;
}

- (BOOL)_isPressDemoModeEnabled
{
  v2 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.demo-settings"];
  char v3 = [v2 BOOLForKey:@"PressDemoMode"];

  return v3;
}

- (BOOL)_isMuseBuddyDemoModeEnabled
{
  v2 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.musebuddy"];
  char v3 = [v2 BOOLForKey:@"DemoMode"];

  return v3;
}

- (BOOL)_isDeviceEnrolledWithDeKOTA:(id *)a3
{
  v5 = NSStringFromSelector(sel_isDeviceEnrolledWithDeKOTA);
  v6 = [(MSDKDemoState *)self cache];
  objc_sync_enter(v6);
  if (v5)
  {
    id v7 = [(MSDKDemoState *)self cache];
    v8 = [v7 objectForKey:v5];

    if (v8)
    {
      v9 = [(MSDKDemoState *)self cache];
      char v10 = [v9 objectForKey:v5];
      LOBYTE(v11) = [v10 BOOLValue];
LABEL_11:

      objc_sync_exit(v6);
      goto LABEL_12;
    }
  }
  objc_sync_exit(v6);

  if (os_variant_has_internal_content()
    && (+[MSDTestPreferences sharedInstance],
        v12 = objc_claimAutoreleasedReturnValue(),
        char v13 = [v12 fakeActivationDemoBit],
        v12,
        (v13 & 1) != 0))
  {
    unsigned int v11 = 1;
    if (!v5) {
      goto LABEL_12;
    }
  }
  else
  {
    unsigned int v11 = ([(MSDKDemoState *)self _activationConfigurationFlags:a3] >> 1) & 1;
    if (!v5) {
      goto LABEL_12;
    }
  }
  if (v11)
  {
    v6 = [(MSDKDemoState *)self cache];
    objc_sync_enter(v6);
    v9 = [(MSDKDemoState *)self cache];
    char v10 = [NSNumber numberWithBool:1];
    [v9 setObject:v10 forKey:v5];
    LOBYTE(v11) = 1;
    goto LABEL_11;
  }
LABEL_12:

  return v11;
}

- (int)_activationConfigurationFlags:(id *)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if (os_variant_has_internal_content())
  {
    v4 = +[MSDTestPreferences sharedInstance];
    uint64_t v5 = [v4 deviceActivationFlag];

    if ((v5 & 0x8000000000000000) == 0)
    {
      v6 = defaultLogHandle();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v18 = "-[MSDKDemoState _activationConfigurationFlags:]";
        __int16 v19 = 2048;
        uint64_t v20 = v5;
        _os_log_impl(&dword_21EF08000, v6, OS_LOG_TYPE_DEFAULT, "%s - Using device activation flag: %ld for internal testing", buf, 0x16u);
      }

      return v5;
    }
  }
  id v16 = 0;
  id v7 = MEMORY[0x223C3E1B0](&v16);
  id v8 = v16;
  if (v8)
  {
    v12 = v8;
    char v13 = defaultLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[MSDKDemoState _activationConfigurationFlags:](v12, v13);
    }

    v14 = (void *)MEMORY[0x263F087E8];
    v9 = [v12 localizedDescription];
    id v10 = [v14 errorDomainMSDWithCode:3727741187 message:@"Failed to retrieve activation record." reason:v9];

    goto LABEL_18;
  }
  if (!v7)
  {
    id v15 = 0;
    safeAssignError(&v15, 3727741187, @"Failed to retrieve activation record.");
    id v10 = v15;
    v9 = defaultLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[MSDKDemoState _activationConfigurationFlags:](v9);
    }
LABEL_18:
    LODWORD(v5) = 0;
    goto LABEL_9;
  }
  v9 = [v7 objectForKeyedSubscript:@"DeviceConfigurationFlags"];
  LODWORD(v5) = [v9 intValue];
  id v10 = 0;
LABEL_9:

  if (a3) {
    *a3 = v10;
  }

  return v5;
}

- (void).cxx_destruct
{
}

- (void)_isPressDemoModeEnabled:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  v2 = "-[MSDKDemoState _isPressDemoModeEnabled:]";
  _os_log_error_impl(&dword_21EF08000, log, OS_LOG_TYPE_ERROR, "%s - Caller is in root user session, erroring out!", (uint8_t *)&v1, 0xCu);
}

- (void)_activationConfigurationFlags:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  v2 = "-[MSDKDemoState _activationConfigurationFlags:]";
  _os_log_error_impl(&dword_21EF08000, log, OS_LOG_TYPE_ERROR, "%s - Activation record is NULL", (uint8_t *)&v1, 0xCu);
}

- (void)_activationConfigurationFlags:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 localizedDescription];
  int v4 = 136315394;
  uint64_t v5 = "-[MSDKDemoState _activationConfigurationFlags:]";
  __int16 v6 = 2114;
  id v7 = v3;
  _os_log_error_impl(&dword_21EF08000, a2, OS_LOG_TYPE_ERROR, "%s - Could not get activation record with error - %{public}@", (uint8_t *)&v4, 0x16u);
}

@end