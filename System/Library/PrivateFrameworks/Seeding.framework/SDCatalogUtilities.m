@interface SDCatalogUtilities
+ (id)_currentAssetAudience;
+ (id)_currentCatalog;
+ (void)_resetAssetAudience;
+ (void)_setAudience:(id)a3;
+ (void)_setCatalog:(id)a3;
@end

@implementation SDCatalogUtilities

+ (void)_setCatalog:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = +[SDSeedingLogging fwHandle];
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (!v5) {
      goto LABEL_7;
    }
    int v11 = 136315138;
    uint64_t v12 = [v3 UTF8String];
    v6 = "Seeding: Setting catalog URL: %s";
    v7 = v4;
    uint32_t v8 = 12;
  }
  else
  {
    if (!v5) {
      goto LABEL_7;
    }
    LOWORD(v11) = 0;
    v6 = "Seeding: Clearing catalog URL";
    v7 = v4;
    uint32_t v8 = 2;
  }
  _os_log_impl(&dword_1DD702000, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v11, v8);
LABEL_7:

  v9 = [(id)objc_opt_class() _currentCatalog];
  if ([v9 isEqualToString:v3])
  {
    v10 = +[SDSeedingLogging fwHandle];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      +[SDCatalogUtilities _setCatalog:](v10);
    }
  }
  else
  {
    CFPreferencesSetValue(@"CatalogURL", v3, @"com.apple.SoftwareUpdate", (CFStringRef)*MEMORY[0x1E4F1D3D0], (CFStringRef)*MEMORY[0x1E4F1D3E0]);
    CFPreferencesAppSynchronize(@"com.apple.SoftwareUpdate");
    notify_post("com.apple.SoftwareUpdate.CheckForCatalogChange");
  }
}

+ (void)_setAudience:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = +[SDSeedingLogging fwHandle];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v9 = (uint64_t)v3;
    _os_log_impl(&dword_1DD702000, v4, OS_LOG_TYPE_DEFAULT, "will set mobile asset audience [%{public}@]", buf, 0xCu);
  }

  if ([v3 length])
  {
    uint64_t v5 = MASetPallasAudience();
    v6 = +[SDSeedingLogging fwHandle];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v9 = v5;
      _os_log_impl(&dword_1DD702000, v6, OS_LOG_TYPE_DEFAULT, "did set mobile asset audience with result [%lld]", buf, 0xCu);
    }

    NSLog(&cfstr_AudiencesResul.isa, v5);
  }
  else
  {
    v7 = +[SDSeedingLogging fwHandle];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DD702000, v7, OS_LOG_TYPE_INFO, "Failed to set audience: given value is nil", buf, 2u);
    }
  }
}

+ (void)_resetAssetAudience
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = +[SDSeedingLogging fwHandle];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v5) = 0;
    _os_log_impl(&dword_1DD702000, v2, OS_LOG_TYPE_DEFAULT, "will reset mobile asset audience", (uint8_t *)&v5, 2u);
  }

  uint64_t v3 = MASetPallasAudience();
  v4 = +[SDSeedingLogging fwHandle];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 134217984;
    uint64_t v6 = v3;
    _os_log_impl(&dword_1DD702000, v4, OS_LOG_TYPE_DEFAULT, "did reset mobile asset audience with result [%lld]", (uint8_t *)&v5, 0xCu);
  }
}

+ (id)_currentCatalog
{
  CFPreferencesAppSynchronize(@"com.apple.SoftwareUpdate");
  v2 = (void *)CFPreferencesCopyValue(@"CatalogURL", @"com.apple.SoftwareUpdate", (CFStringRef)*MEMORY[0x1E4F1D3D0], (CFStringRef)*MEMORY[0x1E4F1D3E0]);
  return v2;
}

+ (id)_currentAssetAudience
{
}

+ (void)_setCatalog:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DD702000, log, OS_LOG_TYPE_ERROR, "Seeding: Skipped changing catalog URL because it's already set", v1, 2u);
}

@end