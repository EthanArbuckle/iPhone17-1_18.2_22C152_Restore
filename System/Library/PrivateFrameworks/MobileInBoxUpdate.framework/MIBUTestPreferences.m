@interface MIBUTestPreferences
+ (id)sharedInstance;
- (BOOL)factorySUCertExist;
- (BOOL)inBoxUpdateMode;
- (BOOL)skipCertDeletion;
- (BOOL)skipDaemonDisable;
- (BOOL)skipWiFiAssociation;
- (BOOL)useAppleConnect;
- (BOOL)useLiveTatsu;
- (id)factorySUCertPath;
- (id)factorySUKeyIsSEP;
- (id)factorySUKeyPath;
- (id)fakeTatsuPayloadPath;
- (id)getValueFromTestPreferencesForKey:(id)a3;
- (id)initialBuddySetupComplete;
- (id)isActivated;
- (id)isOnLockScreen;
- (id)iseTrustCertName;
- (id)iseTrustCertPaths;
- (id)nfcIdleTime;
- (id)wifiSSID;
@end

@implementation MIBUTestPreferences

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_14);
  }
  v2 = (void *)sharedInstance_instance;

  return v2;
}

uint64_t __37__MIBUTestPreferences_sharedInstance__block_invoke()
{
  sharedInstance_instance = objc_alloc_init(MIBUTestPreferences);

  return MEMORY[0x270F9A758]();
}

- (BOOL)useLiveTatsu
{
  v2 = [(MIBUTestPreferences *)self getValueFromTestPreferencesForKey:@"UseLiveTatsu"];
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    char v3 = [v2 BOOLValue];
  }
  else {
    char v3 = 1;
  }

  return v3;
}

- (id)fakeTatsuPayloadPath
{
  v2 = [(MIBUTestPreferences *)self getValueFromTestPreferencesForKey:@"FakeTatsuPayloadPath"];
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (BOOL)useAppleConnect
{
  v2 = [(MIBUTestPreferences *)self getValueFromTestPreferencesForKey:@"UseAppleConnect"];
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    char v3 = [v2 BOOLValue];
  }
  else {
    char v3 = 0;
  }

  return v3;
}

- (id)nfcIdleTime
{
  v2 = [(MIBUTestPreferences *)self getValueFromTestPreferencesForKey:@"NFCIdleTime"];
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (id)isActivated
{
  v2 = [(MIBUTestPreferences *)self getValueFromTestPreferencesForKey:@"IsActivated"];
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (BOOL)factorySUCertExist
{
  v2 = [(MIBUTestPreferences *)self getValueFromTestPreferencesForKey:@"FactorySUCertExist"];
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    char v3 = [v2 BOOLValue];
  }
  else {
    char v3 = 0;
  }

  return v3;
}

- (BOOL)inBoxUpdateMode
{
  v2 = [(MIBUTestPreferences *)self getValueFromTestPreferencesForKey:@"InBoxUpdateMode"];
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    char v3 = [v2 BOOLValue];
  }
  else {
    char v3 = 0;
  }

  return v3;
}

- (id)initialBuddySetupComplete
{
  v2 = [(MIBUTestPreferences *)self getValueFromTestPreferencesForKey:@"InitialBuddySetupComplete"];
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (id)isOnLockScreen
{
  v2 = [(MIBUTestPreferences *)self getValueFromTestPreferencesForKey:@"IsOnLockScreen"];
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (id)factorySUCertPath
{
  v2 = [(MIBUTestPreferences *)self getValueFromTestPreferencesForKey:@"FactorySUCertPath"];
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (id)factorySUKeyPath
{
  v2 = [(MIBUTestPreferences *)self getValueFromTestPreferencesForKey:@"FactorySUKeyPath"];
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (id)factorySUKeyIsSEP
{
  v2 = [(MIBUTestPreferences *)self getValueFromTestPreferencesForKey:@"FactorySUKeyIsSEP"];
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (id)iseTrustCertPaths
{
  v2 = [(MIBUTestPreferences *)self getValueFromTestPreferencesForKey:@"ISETrustCertPaths"];
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (id)iseTrustCertName
{
  v2 = [(MIBUTestPreferences *)self getValueFromTestPreferencesForKey:@"ISETrustCertName"];
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (id)wifiSSID
{
  v2 = [(MIBUTestPreferences *)self getValueFromTestPreferencesForKey:@"WiFiSSID"];
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (BOOL)skipWiFiAssociation
{
  v2 = [(MIBUTestPreferences *)self getValueFromTestPreferencesForKey:@"SkipWiFiAssociation"];
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    char v3 = [v2 BOOLValue];
  }
  else {
    char v3 = 0;
  }

  return v3;
}

- (BOOL)skipDaemonDisable
{
  v2 = [(MIBUTestPreferences *)self getValueFromTestPreferencesForKey:@"SkipDaemonDisable"];
  BOOL v3 = 0;
  if (v2)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      BOOL v3 = 1;
    }
  }

  return v3;
}

- (BOOL)skipCertDeletion
{
  v2 = [(MIBUTestPreferences *)self getValueFromTestPreferencesForKey:@"SkipCertDeletion"];
  BOOL v3 = 0;
  if (v2)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      BOOL v3 = 1;
    }
  }

  return v3;
}

- (id)getValueFromTestPreferencesForKey:(id)a3
{
  BOOL v3 = (__CFString *)a3;
  CFStringRef v4 = (const __CFString *)*MEMORY[0x263EFFE58];
  CFStringRef v5 = (const __CFString *)*MEMORY[0x263EFFE68];
  if (!CFPreferencesSynchronize(@"com.apple.MobileInBoxUpdater.test", (CFStringRef)*MEMORY[0x263EFFE58], (CFStringRef)*MEMORY[0x263EFFE68]))
  {
    if (MIBUOnceToken != -1) {
      dispatch_once(&MIBUOnceToken, &__block_literal_global_60_0);
    }
    v6 = (void *)MIBUConnObj;
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR)) {
      -[MIBUTestPreferences getValueFromTestPreferencesForKey:](v6);
    }
  }
  v7 = (void *)CFPreferencesCopyValue(v3, @"com.apple.MobileInBoxUpdater.test", v4, v5);

  return v7;
}

void __57__MIBUTestPreferences_getValueFromTestPreferencesForKey___block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __43__MIBUDefaultPreferences_setObject_forKey___block_invoke_cold_1();
  }
}

- (void)getValueFromTestPreferencesForKey:(void *)a1 .cold.1(void *a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  v1 = a1;
  int v3 = 138543362;
  id v4 = (id)objc_opt_class();
  id v2 = v4;
  _os_log_error_impl(&dword_2309BC000, v1, OS_LOG_TYPE_ERROR, "%{public}@ - Failed to synchronize with CFPreferences.", (uint8_t *)&v3, 0xCu);
}

@end