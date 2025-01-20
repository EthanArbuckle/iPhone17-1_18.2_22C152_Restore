@interface TVRCPreferredDeviceManager
+ (id)sharedInstance;
- (double)preferredDeviceSearchTimeout;
- (id)preferredDeviceIdentifier;
- (void)setPreferredDevice:(id)a3;
@end

@implementation TVRCPreferredDeviceManager

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__TVRCPreferredDeviceManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_3 != -1) {
    dispatch_once(&sharedInstance_onceToken_3, block);
  }
  v2 = (void *)sharedInstance_sharedInstance_2;

  return v2;
}

uint64_t __44__TVRCPreferredDeviceManager_sharedInstance__block_invoke(uint64_t a1)
{
  sharedInstance_sharedInstance_2 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return MEMORY[0x270F9A758]();
}

- (id)preferredDeviceIdentifier
{
  v2 = (void *)CFPreferencesCopyAppValue(@"TVRCDeviceIdentifierKey", @"com.apple.TVRemoteCore");
  v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    v5 = _TVRCPreferredDeviceLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_2266D3000, v5, OS_LOG_TYPE_DEFAULT, "Could not find a preferred device. Returning a nil identifier.", v7, 2u);
    }
  }

  return v3;
}

- (double)preferredDeviceSearchTimeout
{
  v2 = (void *)CFPreferencesCopyAppValue(@"TVRCDeviceTimeoutKey", @"com.apple.TVRemoteCore");
  v3 = v2;
  if (v2)
  {
    [v2 floatValue];
    double v5 = v4;
  }
  else
  {
    v6 = _TVRCPreferredDeviceLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_2266D3000, v6, OS_LOG_TYPE_DEFAULT, "Could not find a preferred device timeout. Returning default value for timeout.", v8, 2u);
    }

    double v5 = 1.6;
  }

  return v5;
}

- (void)setPreferredDevice:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a3;
  float v4 = _TVRCPreferredDeviceLog();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      int v9 = 138543362;
      id v10 = v3;
      _os_log_impl(&dword_2266D3000, v4, OS_LOG_TYPE_DEFAULT, "Setting preferred device %{public}@", (uint8_t *)&v9, 0xCu);
    }

    CFPreferencesSetAppValue(@"TVRCDeviceIdentifierKey", (CFPropertyListRef)[v3 identifier], @"com.apple.TVRemoteCore");
    uint64_t v6 = [v3 connectionType];
    double v7 = 1.6;
    if (v6 == 3) {
      double v7 = 5.0;
    }
    v8 = (const void *)[NSNumber numberWithDouble:v7];
  }
  else
  {
    if (v5)
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_2266D3000, v4, OS_LOG_TYPE_DEFAULT, "Removing preferred device", (uint8_t *)&v9, 2u);
    }

    CFPreferencesSetAppValue(@"TVRCDeviceIdentifierKey", 0, @"com.apple.TVRemoteCore");
    v8 = 0;
  }
  CFPreferencesSetAppValue(@"TVRCDeviceTimeoutKey", v8, @"com.apple.TVRemoteCore");
}

@end