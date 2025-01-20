@interface MXUtilities
+ (BOOL)isAppAnalyticsEnabled;
+ (BOOL)isAppInstalledForBundleID:(id)a3;
+ (BOOL)verifySDKVersionForClient:(id)a3;
+ (id)containerPath;
+ (id)getServicesAllowlist;
+ (id)modelIdentifier;
+ (id)osVersion;
+ (id)platformArchitecture;
+ (id)regionFormat;
+ (void)regionFormat;
@end

@implementation MXUtilities

+ (id)containerPath
{
  if (containerPath_onceToken != -1) {
    dispatch_once(&containerPath_onceToken, &__block_literal_global);
  }
  v2 = (void *)containerPath_systemContainerUrl;
  return (id)[v2 path];
}

void __28__MXUtilities_containerPath__block_invoke()
{
  uint64_t v0 = container_system_path_for_identifier();
  if (v0)
  {
    v1 = (void *)v0;
    NSLog(&cfstr_SystemContaine.isa, v0);
    uint64_t v2 = [NSURL fileURLWithFileSystemRepresentation:v1 isDirectory:1 relativeToURL:0];
    v3 = (void *)containerPath_systemContainerUrl;
    containerPath_systemContainerUrl = v2;

    free(v1);
  }
  else
  {
    NSLog(&cfstr_ErrorGettingSy.isa, 1);
  }
}

+ (id)getServicesAllowlist
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __35__MXUtilities_getServicesAllowlist__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (getServicesAllowlist_once_token != -1) {
    dispatch_once(&getServicesAllowlist_once_token, block);
  }
  uint64_t v2 = (void *)getServicesAllowlist_d;
  return v2;
}

void __35__MXUtilities_getServicesAllowlist__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v3 = [v0 pathForResource:@"services-privacy-allowdeny" ofType:@"plist"];

  uint64_t v1 = [NSDictionary dictionaryWithContentsOfFile:v3];
  uint64_t v2 = (void *)getServicesAllowlist_d;
  getServicesAllowlist_d = v1;
}

+ (BOOL)verifySDKVersionForClient:(id)a3
{
  return 1;
}

+ (BOOL)isAppAnalyticsEnabled
{
  if (isAppAnalyticsEnabled_onceToken != -1) {
    dispatch_once(&isAppAnalyticsEnabled_onceToken, &__block_literal_global_14);
  }
  return isAppAnalyticsEnabled_appAnalyticsEnabled;
}

uint64_t __36__MXUtilities_isAppAnalyticsEnabled__block_invoke()
{
  uint64_t result = AppAnalyticsEnabled();
  isAppAnalyticsEnabled_appAnalyticsEnabled = result;
  return result;
}

+ (BOOL)isAppInstalledForBundleID:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x263F01878];
  id v4 = a3;
  uint64_t v9 = 0;
  v5 = (void *)[[v3 alloc] initWithBundleIdentifier:v4 allowPlaceholder:0 error:&v9];

  char v6 = 0;
  if (!v9)
  {
    v7 = [v5 applicationState];
    char v6 = [v7 isInstalled];
  }
  return v6;
}

+ (id)osVersion
{
  uint64_t v2 = (void *)_CFCopySupplementalVersionDictionary();
  if (v2)
  {
    id v3 = [NSString alloc];
    id v4 = [v2 objectForKeyedSubscript:@"ProductName"];
    v5 = [v2 objectForKeyedSubscript:@"ProductVersion"];
    char v6 = [v2 objectForKeyedSubscript:@"ProductBuildVersion"];
    v7 = (void *)[v3 initWithFormat:@"%@ %@ (%@)", v4, v5, v6];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)regionFormat
{
  uint64_t v2 = [MEMORY[0x263EFF960] currentLocale];
  id v3 = v2;
  if (v2)
  {
    id v4 = [v2 objectForKey:*MEMORY[0x263EFF4D0]];
    v5 = v4;
    if (v4)
    {
      char v6 = v4;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
        +[MXUtilities regionFormat]();
      }
      char v6 = @"N/A";
    }
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
      +[MXUtilities regionFormat]();
    }
    char v6 = @"N/A";
  }

  return v6;
}

+ (id)modelIdentifier
{
  if (modelIdentifier_onceToken != -1) {
    dispatch_once(&modelIdentifier_onceToken, &__block_literal_global_34);
  }
  uint64_t v2 = (void *)modelIdentifier_modelIdentifier;
  return v2;
}

void __30__MXUtilities_modelIdentifier__block_invoke()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  *(void *)id v4 = 0x100000006;
  memset(v3, 0, sizeof(v3));
  size_t v2 = 64;
  sysctl(v4, 2u, v3, &v2, 0, 0);
  uint64_t v0 = [[NSString alloc] initWithCString:v3 encoding:1];
  uint64_t v1 = (void *)modelIdentifier_modelIdentifier;
  modelIdentifier_modelIdentifier = v0;
}

+ (id)platformArchitecture
{
  if (platformArchitecture_onceToken != -1) {
    dispatch_once(&platformArchitecture_onceToken, &__block_literal_global_36);
  }
  size_t v2 = (void *)platformArchitecture_architecture;
  return v2;
}

void __35__MXUtilities_platformArchitecture__block_invoke()
{
  if (!platformArchitecture_architecture)
  {
    MEMORY[0x23EC937E0]();
    uint64_t FamilyName = CSArchitectureGetFamilyName();
    if (FamilyName)
    {
      platformArchitecture_architecture = [[NSString alloc] initWithUTF8String:FamilyName];
      MEMORY[0x270F9A758]();
    }
  }
}

+ (void)regionFormat
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_debug_impl(&dword_23886F000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "Invalid Country Code", v0, 2u);
}

@end