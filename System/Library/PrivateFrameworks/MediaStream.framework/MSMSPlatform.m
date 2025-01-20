@interface MSMSPlatform
+ (id)thePlatform;
- (ACAccountStore)accountStore;
- (BOOL)_mayPerformFileTransfer;
- (BOOL)isPerfLoggingEnabled;
- (BOOL)isPerformanceLoggingEnabled;
- (BOOL)personIDUsesProductionPushEnvironment:(id)a3;
- (BOOL)shouldEnableNewFeatures;
- (BOOL)shouldLogAtLevel:(int)a3;
- (Class)deletePluginClass;
- (Class)pluginClass;
- (Class)publisherPluginClass;
- (Class)subscriberPluginClass;
- (MSMSPlatform)init;
- (NSData)pushToken;
- (__CFString)_facilityStringForFacility:(int)a3;
- (id)OSString;
- (id)OSVersion;
- (id)UDID;
- (id)_accountForPersonID:(id)a3;
- (id)appBundleInfoString;
- (id)authTokenForPersonID:(id)a3;
- (id)baseURLForPersonID:(id)a3;
- (id)contentURLForPersonID:(id)a3;
- (id)fullNameFromFirstName:(id)a3 lastName:(id)a4;
- (id)hardwareString;
- (id)pathMediaStreamDir;
- (id)pushTokenForPersonID:(id)a3;
- (id)socketOptions;
- (id)stringForSysctlKey:(id)a3;
- (id)theDaemon;
- (void)_rereadDefaults;
- (void)didDetectUnrecoverableCondition;
- (void)logFacility:(int)a3 level:(int)a4 format:(id)a5 args:(char *)a6;
- (void)logFile:(const char *)a3 func:(const char *)a4 line:(int)a5 facility:(int)a6 level:(int)a7 format:(id)a8 args:(char *)a9;
- (void)setAccountStore:(id)a3;
- (void)setIsPerfLoggingEnabled:(BOOL)a3;
- (void)setPushToken:(id)a3;
@end

@implementation MSMSPlatform

- (void)_rereadDefaults
{
  Boolean keyExistsAndHasValidFormat = 0;
  CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue(@"MSPerfLogLevel", @"com.apple.mediastream", &keyExistsAndHasValidFormat);
  Boolean v9 = 0;
  CFIndex v4 = CFPreferencesGetAppIntegerValue(@"MSPerfOutputLevel", @"com.apple.mediastream", &v9);
  int isPerfLoggingEnabled = self->_isPerfLoggingEnabled;
  if (!keyExistsAndHasValidFormat || AppIntegerValue < 0)
  {
    if (v9) {
      BOOL v7 = v4 < 0;
    }
    else {
      BOOL v7 = 1;
    }
    int v6 = !v7;
  }
  else
  {
    int v6 = 1;
  }
  self->_int isPerfLoggingEnabled = v6;
  if (v6 != isPerfLoggingEnabled)
  {
    v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v8 postNotificationName:@"MSPlatformPerformanceLoggingSettingDidChange" object:self];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountStore, 0);

  objc_storeStrong((id *)&self->_pushToken, 0);
}

- (void)setAccountStore:(id)a3
{
}

- (ACAccountStore)accountStore
{
  return self->_accountStore;
}

- (void)setIsPerfLoggingEnabled:(BOOL)a3
{
  self->_int isPerfLoggingEnabled = a3;
}

- (BOOL)isPerfLoggingEnabled
{
  return self->_isPerfLoggingEnabled;
}

- (void)setPushToken:(id)a3
{
}

- (NSData)pushToken
{
  return self->_pushToken;
}

- (id)theDaemon
{
  return (id)_theDaemon;
}

- (id)fullNameFromFirstName:(id)a3 lastName:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 length] && objc_msgSend(v6, "length"))
  {
    BOOL v7 = [NSString stringWithFormat:@"%@ %@", v5, v6];
    v8 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
    Boolean v9 = [v7 stringByTrimmingCharactersInSet:v8];

    goto LABEL_9;
  }
  if ([v5 length])
  {
    id v10 = v5;
LABEL_8:
    Boolean v9 = v10;
    goto LABEL_9;
  }
  if ([v6 length])
  {
    id v10 = v6;
    goto LABEL_8;
  }
  Boolean v9 = 0;
LABEL_9:

  return v9;
}

- (BOOL)shouldEnableNewFeatures
{
  return CFPreferencesGetAppBooleanValue(@"shouldEnableNewFeatures", @"com.apple.mediastream.mstreamd", 0) != 0;
}

- (id)pushTokenForPersonID:(id)a3
{
  return self->_pushToken;
}

- (BOOL)personIDUsesProductionPushEnvironment:(id)a3
{
  v3 = [(MSMSPlatform *)self _accountForPersonID:a3];
  CFIndex v4 = [v3 propertiesForDataclass:*MEMORY[0x1E4F17AE0]];
  id v5 = [v4 objectForKey:@"apsEnv"];
  char v6 = [v5 isEqualToString:@"production"];

  return v6;
}

- (id)contentURLForPersonID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(MSMSPlatform *)self _accountForPersonID:v4];
    char v6 = v5;
    if (!v5) {
      goto LABEL_6;
    }
    BOOL v7 = (void *)MEMORY[0x1E4F1CB10];
    v8 = [v5 propertiesForDataclass:*MEMORY[0x1E4F17AA0]];
    Boolean v9 = [v8 objectForKey:@"url"];
    id v10 = [v7 URLWithString:v9];

    if (v10)
    {
      v11 = [v10 URLByAppendingPathComponent:v4];
    }
    else
    {
LABEL_6:
      v11 = 0;
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)baseURLForPersonID:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v6 = [v5 objectForKey:@"MSForcedBaseURL"];

  if (v6)
  {
    BOOL v7 = [MEMORY[0x1E4F1CB10] URLWithString:v6];
  }
  else
  {
    v8 = [(MSMSPlatform *)self _accountForPersonID:v4];
    Boolean v9 = (void *)MEMORY[0x1E4F1CB10];
    id v10 = [v8 propertiesForDataclass:*MEMORY[0x1E4F17AE0]];
    v11 = [v10 objectForKey:@"url"];
    BOOL v7 = [v9 URLWithString:v11];
  }

  return v7;
}

- (id)authTokenForPersonID:(id)a3
{
  id v4 = a3;
  id v5 = [(MSMSPlatform *)self _accountForPersonID:v4];
  char v6 = v5;
  if (v5)
  {
    BOOL v7 = objc_msgSend(v5, "aa_authToken");
    if (v7) {
      goto LABEL_7;
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v10 = 0;
      _os_log_error_impl(&dword_1DD956000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Missing authToken. Requesting", v10, 2u);
    }
    v8 = +[MSAuthenticationManager sharedManager];
    [v8 didEncounterAuthenticationFailureForPersonID:v4];
  }
  BOOL v7 = 0;
LABEL_7:

  return v7;
}

- (id)_accountForPersonID:(id)a3
{
  id v4 = a3;
  id v5 = [(MSMSPlatform *)self accountStore];
  char v6 = objc_msgSend(v5, "aa_appleAccountWithPersonID:", v4);

  return v6;
}

- (void)didDetectUnrecoverableCondition
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v2 = 0;
    _os_log_error_impl(&dword_1DD956000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Restarting mstreamd.", v2, 2u);
  }
  exit(-1);
}

- (id)socketOptions
{
  v2 = (void *)MEMORY[0x1E4F1C9E8];
  v3 = [NSNumber numberWithBool:1];
  id v4 = objc_msgSend(v2, "dictionaryWithObjectsAndKeys:", v3, *MEMORY[0x1E4F190F0], *MEMORY[0x1E4F19030], *MEMORY[0x1E4F19018], 0);

  return v4;
}

- (BOOL)_mayPerformFileTransfer
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = +[MSBatteryPowerMonitor defaultMonitor];
  if ([v2 isExternalPowerConnected])
  {
    char v3 = 1;
  }
  else
  {
    [v2 batteryPercentRemaining];
    double v5 = v4;
    char v3 = 1;
    if (v4 != -1.0 && v4 < 0.2)
    {
      char v3 = 0;
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 134217984;
        double v10 = v5 * 100.0;
        _os_log_impl(&dword_1DD956000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Battery level is too low to continue at %.1f%%.", (uint8_t *)&v9, 0xCu);
        char v3 = 0;
      }
    }
  }
  char v6 = +[MSPauseManager sharedManager];
  char v7 = [v6 isPaused];

  return v3 & (v7 ^ 1);
}

- (id)appBundleInfoString
{
  if (appBundleInfoString_once != -1) {
    dispatch_once(&appBundleInfoString_once, &__block_literal_global_81);
  }
  v2 = (void *)appBundleInfoString_string;

  return v2;
}

void __35__MSMSPlatform_appBundleInfoString__block_invoke()
{
  id v5 = [MEMORY[0x1E4F28B50] mainBundle];
  v0 = [v5 infoDictionary];
  v1 = [v0 objectForKey:*MEMORY[0x1E4F1CFF8]];
  v2 = [v0 objectForKey:@"CFBundleShortVersionString"];
  uint64_t v3 = [[NSString alloc] initWithFormat:@"%@/%@", v1, v2];
  double v4 = (void *)appBundleInfoString_string;
  appBundleInfoString_string = v3;
}

- (id)OSString
{
  if (OSString_once != -1) {
    dispatch_once(&OSString_once, &__block_literal_global_72);
  }
  v2 = (void *)OSString_string;

  return v2;
}

void __24__MSMSPlatform_OSString__block_invoke()
{
  id v5 = (id)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithContentsOfFile:@"/System/Library/CoreServices/SystemVersion.plist"];
  v0 = [v5 objectForKey:@"ProductName"];
  v1 = [v5 objectForKey:@"ProductVersion"];
  v2 = [v5 objectForKey:@"ProductBuildVersion"];
  uint64_t v3 = [[NSString alloc] initWithFormat:@"%@;%@;%@", v0, v1, v2];
  double v4 = (void *)OSString_string;
  OSString_string = v3;
}

- (id)hardwareString
{
  if (hardwareString_once != -1) {
    dispatch_once(&hardwareString_once, &__block_literal_global_58);
  }
  v2 = (void *)hardwareString_productType;

  return v2;
}

uint64_t __30__MSMSPlatform_hardwareString__block_invoke()
{
  hardwareString_productType = MGCopyAnswer();

  return MEMORY[0x1F41817F8]();
}

- (id)stringForSysctlKey:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  size_t v5 = 256;
  if (sysctlbyname((const char *)[a3 UTF8String], v6, &v5, 0, 0))
  {
    uint64_t v3 = @"UNKNOWN";
  }
  else
  {
    v6[v5 - 1] = 0;
    uint64_t v3 = [NSString stringWithUTF8String:v6];
  }

  return v3;
}

- (id)OSVersion
{
  v2 = [MEMORY[0x1E4F28F80] processInfo];
  uint64_t v3 = [v2 operatingSystemVersionString];

  return v3;
}

- (id)UDID
{
  if (UDID_once != -1) {
    dispatch_once(&UDID_once, &__block_literal_global_52);
  }
  v2 = (void *)UDID_UDID;

  return v2;
}

uint64_t __20__MSMSPlatform_UDID__block_invoke()
{
  UDID_UDID = MGCopyAnswer();

  return MEMORY[0x1F41817F8]();
}

- (Class)deletePluginClass
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = [(MSMSPlatform *)self pluginClass];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    int v4 = 138543362;
    size_t v5 = v2;
    _os_log_debug_impl(&dword_1DD956000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "deleterPluginClass principalClass %{public}@", (uint8_t *)&v4, 0xCu);
  }

  return v2;
}

- (Class)subscriberPluginClass
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = [(MSMSPlatform *)self pluginClass];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    int v4 = 138543362;
    size_t v5 = v2;
    _os_log_debug_impl(&dword_1DD956000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "subscriberPluginClass principalClass %{public}@", (uint8_t *)&v4, 0xCu);
  }

  return v2;
}

- (Class)publisherPluginClass
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = [(MSMSPlatform *)self pluginClass];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    int v4 = 138543362;
    size_t v5 = v2;
    _os_log_debug_impl(&dword_1DD956000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "publisherPluginClass principalClass %{public}@", (uint8_t *)&v4, 0xCu);
  }

  return v2;
}

- (Class)pluginClass
{
  if (pluginClass_onceToken != -1) {
    dispatch_once(&pluginClass_onceToken, &__block_literal_global_43);
  }
  v2 = [MEMORY[0x1E4F28B50] bundleWithPath:pluginClass_pluginPath];
  id v3 = (id)[v2 principalClass];

  return (Class)v3;
}

void __27__MSMSPlatform_pluginClass__block_invoke()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = [@"/System/Library/MediaStreamPlugins" stringByAppendingPathComponent:@"PhotoStreamsPlugin.mediastream"];
  v1 = (void *)pluginClass_pluginPath;
  pluginClass_pluginPath = v0;

  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    int v2 = 138543362;
    uint64_t v3 = pluginClass_pluginPath;
    _os_log_impl(&dword_1DD956000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Loading Photo Streams plugin from %{public}@", (uint8_t *)&v2, 0xCu);
  }
}

- (id)pathMediaStreamDir
{
  if (pathMediaStreamDir_once != -1) {
    dispatch_once(&pathMediaStreamDir_once, &__block_literal_global_34);
  }
  int v2 = (void *)pathMediaStreamDir_path;

  return v2;
}

void __34__MSMSPlatform_pathMediaStreamDir__block_invoke()
{
  id v3 = [NSString MSMSUserDirectory];
  uint64_t v0 = [v3 stringByAppendingPathComponent:@"Library"];
  uint64_t v1 = [v0 stringByAppendingPathComponent:@"MediaStream"];
  int v2 = (void *)pathMediaStreamDir_path;
  pathMediaStreamDir_path = v1;
}

- (void)logFile:(const char *)a3 func:(const char *)a4 line:(int)a5 facility:(int)a6 level:(int)a7 format:(id)a8 args:(char *)a9
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = a8;
    _os_log_impl(&dword_1DD956000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Unexpected call to legacy logging method, please switch to os_log(): %@", (uint8_t *)&v10, 0xCu);
  }
}

- (BOOL)isPerformanceLoggingEnabled
{
  return self->_isPerfLoggingEnabled;
}

- (void)logFacility:(int)a3 level:(int)a4 format:(id)a5 args:(char *)a6
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = a5;
    _os_log_impl(&dword_1DD956000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Unexpected call to legacy logging method, please switch to os_log(): %@", (uint8_t *)&v7, 0xCu);
  }
}

- (__CFString)_facilityStringForFacility:(int)a3
{
  if (a3 > 4) {
    return 0;
  }
  else {
    return off_1E6CFC990[a3];
  }
}

- (BOOL)shouldLogAtLevel:(int)a3
{
  return a3 != 7 || os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
}

- (MSMSPlatform)init
{
  v12.receiver = self;
  v12.super_class = (Class)MSMSPlatform;
  int v2 = [(MSMSPlatform *)&v12 init];
  if (v2)
  {
    id v3 = (ACAccountStore *)objc_alloc_init(MEMORY[0x1E4F179C8]);
    accountStore = v2->_accountStore;
    v2->_accountStore = v3;

    objc_initWeak(&location, v2);
    int out_token = 0;
    size_t v5 = MEMORY[0x1E4F14428];
    id v6 = MEMORY[0x1E4F14428];
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __20__MSMSPlatform_init__block_invoke;
    handler[3] = &unk_1E6CFC970;
    objc_copyWeak(&v9, &location);
    notify_register_dispatch("com.apple.managedconfiguration.defaultsdidchange", &out_token, v5, handler);

    [(MSMSPlatform *)v2 _rereadDefaults];
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __20__MSMSPlatform_init__block_invoke(uint64_t a1)
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v3 = 0;
    _os_log_error_impl(&dword_1DD956000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Re-reading defaults.", v3, 2u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _rereadDefaults];
}

+ (id)thePlatform
{
  if (thePlatform_once != -1) {
    dispatch_once(&thePlatform_once, &__block_literal_global_211);
  }
  int v2 = (void *)thePlatform_platform;

  return v2;
}

uint64_t __27__MSMSPlatform_thePlatform__block_invoke()
{
  thePlatform_platform = objc_alloc_init(MSMSPlatform);

  return MEMORY[0x1F41817F8]();
}

@end