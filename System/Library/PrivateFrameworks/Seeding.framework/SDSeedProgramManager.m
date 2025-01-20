@interface SDSeedProgramManager
+ (BOOL)_canEnrollInBetaSoftware;
+ (BOOL)_currentAudienceIsSeed;
+ (BOOL)_currentCatalogIsSeed;
+ (BOOL)_removeSeedEnrollmentCookie;
+ (BOOL)_setAudienceForSeedProgram:(int64_t)a3;
+ (BOOL)_setCatalogForSeedProgram:(int64_t)a3;
+ (BOOL)canFileFeedback;
+ (BOOL)enrollInSeedProgram:(int64_t)a3;
+ (BOOL)enrollInSeedProgram:(int64_t)a3 deletingSystemURL:(BOOL)a4;
+ (BOOL)fixUpAssetAudience;
+ (BOOL)isEnrolledInSeedProgram;
+ (BOOL)unenrollFromSeedProgram;
+ (NSDictionary)currentEnrollmentMetadata;
+ (id)_loadSeedAudiencesFromPlist;
+ (id)_loadSeedCatalogsFromPlist;
+ (id)stringForSeedProgram:(int64_t)a3;
+ (int64_t)_currentSeedProgramFromDisk;
+ (int64_t)_legacyCurrentSeedProgram;
+ (int64_t)_seedProgramForString:(id)a3;
+ (int64_t)currentSeedProgram;
+ (int64_t)currentSeedProgramForDiskAtPath:(id)a3;
+ (void)_clearAudience;
+ (void)_clearSeedCatalog;
+ (void)_createFeedbackAssistantSymlink;
+ (void)_currentSeedProgramFromDisk;
+ (void)_setHelpFeedbackMenuEnabled:(BOOL)a3;
+ (void)_setSeedOptOutUIDisabled:(BOOL)a3;
+ (void)_setSeedProgramPref:(int64_t)a3;
+ (void)enrollInSeedProgramNamed:(id)a3 withAssetAudience:(id)a4 completion:(id)a5;
@end

@implementation SDSeedProgramManager

+ (int64_t)currentSeedProgram
{
  v2 = +[SDBetaManager _currentBetaProgram];
  int64_t v3 = [v2 program];

  return v3;
}

+ (int64_t)_legacyCurrentSeedProgram
{
  CFPropertyListRef v2 = CFPreferencesCopyAppValue(@"SeedProgram", @"com.apple.seeding");
  int64_t v3 = +[SDSeedProgramManager _seedProgramForString:v2];
  if (v2) {
    CFRelease(v2);
  }
  if ((unint64_t)(v3 - 1) >= 4) {
    return 0;
  }
  else {
    return v3;
  }
}

+ (void)_setSeedProgramPref:(int64_t)a3
{
  if (a3) {
    id v3 = +[SDSeedProgramManager stringForSeedProgram:](SDSeedProgramManager, "stringForSeedProgram:");
  }
  else {
    id v3 = 0;
  }
  CFPreferencesSetValue(@"SeedProgram", v3, @"com.apple.seeding", (CFStringRef)*MEMORY[0x1E4F1D3D0], (CFStringRef)*MEMORY[0x1E4F1D3E0]);
  CFPreferencesAppSynchronize(@"com.apple.seeding");
}

+ (int64_t)currentSeedProgramForDiskAtPath:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    if ([v4 isEqualToString:@"/"])
    {
      v6 = +[SDSeedingLogging fwHandle];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        int v39 = 136315138;
        v40 = "+[SDSeedProgramManager currentSeedProgramForDiskAtPath:]";
        _os_log_impl(&dword_1DD702000, v6, OS_LOG_TYPE_DEFAULT, "%s called on local disk, using preferences instead.", (uint8_t *)&v39, 0xCu);
      }

      int64_t v7 = [a1 currentSeedProgram];
      goto LABEL_21;
    }
    v16 = [v5 stringByAppendingPathComponent:@"Library"];
    uint64_t v17 = [v16 stringByAppendingPathComponent:@"Preferences"];
    v18 = [(id)v17 stringByAppendingPathComponent:@"com.apple.seeding.plist"];

    v19 = [MEMORY[0x1E4F28CB8] defaultManager];
    LOBYTE(v17) = [v19 fileExistsAtPath:v18];

    if (v17)
    {
      v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfFile:v18];
      v21 = v20;
      if (v20)
      {
        v22 = [v20 valueForKey:@"SeedProgram"];
        int64_t v7 = (int)[v22 intValue];

        if ((unint64_t)(v7 - 1) < 4)
        {
LABEL_20:

          goto LABEL_21;
        }
        v23 = +[SDSeedingLogging fwHandle];
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
          +[SDSeedProgramManager currentSeedProgramForDiskAtPath:](v23, v24, v25, v26, v27, v28, v29, v30);
        }
      }
      else
      {
        v23 = +[SDSeedingLogging fwHandle];
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
          +[SDSeedProgramManager currentSeedProgramForDiskAtPath:](v23, v31, v32, v33, v34, v35, v36, v37);
        }
      }
    }
    else
    {
      v21 = +[SDSeedingLogging fwHandle];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        +[SDSeedProgramManager currentSeedProgramForDiskAtPath:].cold.4();
      }
    }
    int64_t v7 = 0;
    goto LABEL_20;
  }
  v8 = +[SDSeedingLogging fwHandle];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    +[SDSeedProgramManager currentSeedProgramForDiskAtPath:](v8, v9, v10, v11, v12, v13, v14, v15);
  }

  int64_t v7 = 0;
LABEL_21:

  return v7;
}

+ (BOOL)isEnrolledInSeedProgram
{
  uint64_t v2 = [(id)objc_opt_class() currentSeedProgram];
  if (!getuid())
  {
    id v3 = +[SDSeedingLogging fwHandle];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1DD702000, v3, OS_LOG_TYPE_DEFAULT, "Seeding: isEnrolledInSeedProgram called as root", v5, 2u);
    }

    uint64_t v2 = [(id)objc_opt_class() _currentSeedProgramFromDisk];
  }
  return v2 != 0;
}

+ (BOOL)enrollInSeedProgram:(int64_t)a3 deletingSystemURL:(BOOL)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if ((objc_msgSend(a1, "_canEnrollInBetaSoftware", a3, a4) & 1) == 0)
  {
    uint64_t v9 = +[SDSeedingLogging fwHandle];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11) = 0;
      _os_log_impl(&dword_1DD702000, v9, OS_LOG_TYPE_DEFAULT, "Prerelease software installation is not allowed. Will not enroll in seeding.", (uint8_t *)&v11, 2u);
    }

    return 0;
  }
  v5 = +[SDSeedingLogging fwHandle];
  v6 = v5;
  if ((unint64_t)(a3 - 1) >= 4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      +[SDSeedProgramManager enrollInSeedProgram:deletingSystemURL:]();
    }

    return 0;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [(id)objc_opt_class() stringForSeedProgram:a3];
    int v11 = 136315138;
    uint64_t v12 = [v7 UTF8String];
    _os_log_impl(&dword_1DD702000, v6, OS_LOG_TYPE_DEFAULT, "Seeding: Enrolling in seed program: %s", (uint8_t *)&v11, 0xCu);
  }
  [(id)objc_opt_class() _setSeedProgramPref:a3];
  if (![(id)objc_opt_class() _setCatalogForSeedProgram:a3]
    || ![(id)objc_opt_class() _setAudienceForSeedProgram:a3])
  {
    return 0;
  }
  BOOL v8 = 1;
  [(id)objc_opt_class() _setHelpFeedbackMenuEnabled:1];
  [(id)objc_opt_class() _setSeedOptOutUIDisabled:0];
  [(id)objc_opt_class() _createFeedbackAssistantSymlink];
  return v8;
}

+ (BOOL)enrollInSeedProgram:(int64_t)a3
{
  return [a1 enrollInSeedProgram:a3 deletingSystemURL:1];
}

+ (BOOL)unenrollFromSeedProgram
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = +[SDSeedingLogging fwHandle];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v12) = 0;
    _os_log_impl(&dword_1DD702000, v2, OS_LOG_TYPE_DEFAULT, "Seeding: Un-enrolling", (uint8_t *)&v12, 2u);
  }

  id v3 = +[SDSeedingLogging fwHandle];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = objc_opt_class();
    objc_msgSend(v4, "stringForSeedProgram:", objc_msgSend((id)objc_opt_class(), "currentSeedProgram"));
    id v5 = objc_claimAutoreleasedReturnValue();
    uint64_t v6 = [v5 UTF8String];
    int v12 = 136315138;
    uint64_t v13 = v6;
    _os_log_impl(&dword_1DD702000, v3, OS_LOG_TYPE_DEFAULT, "Seeding: Un-enrolling from seed program: %s", (uint8_t *)&v12, 0xCu);
  }
  [(id)objc_opt_class() _setSeedProgramPref:0];
  if ([(id)objc_opt_class() _currentCatalogIsSeed])
  {
    id v7 = +[SDSeedingLogging fwHandle];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v8 = +[SDCatalogUtilities _currentCatalog];
      int v12 = 138412290;
      uint64_t v13 = (uint64_t)v8;
      _os_log_impl(&dword_1DD702000, v7, OS_LOG_TYPE_DEFAULT, "Seeding: Clearing catalog: %@", (uint8_t *)&v12, 0xCu);
    }
    [(id)objc_opt_class() _clearSeedCatalog];
  }
  if ([(id)objc_opt_class() _currentAudienceIsSeed])
  {
    uint64_t v9 = +[SDSeedingLogging fwHandle];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = +[SDCatalogUtilities _currentAssetAudience];
      int v12 = 138412290;
      uint64_t v13 = (uint64_t)v10;
      _os_log_impl(&dword_1DD702000, v9, OS_LOG_TYPE_DEFAULT, "Seeding: Clearing audience: %@", (uint8_t *)&v12, 0xCu);
    }
    [(id)objc_opt_class() _clearAudience];
  }
  return +[SDProfileUtilities removeSeedingProfile];
}

+ (BOOL)_removeSeedEnrollmentCookie
{
  return 0;
}

+ (int64_t)_currentSeedProgramFromDisk
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v4 = [v3 fileExistsAtPath:@"/var/Managed Preferences/mobile/com.apple.seeding.plist"];

  if (v4)
  {
    id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfFile:@"/var/Managed Preferences/mobile/com.apple.seeding.plist"];
    uint64_t v6 = +[SDSeedingLogging fwHandle];
    id v7 = v6;
    if (v5)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
        +[SDSeedProgramManager _currentSeedProgramFromDisk]();
      }

      id v7 = [v5 objectForKey:@"SeedProgram"];
      int64_t v8 = [a1 _seedProgramForString:v7];
    }
    else
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        +[SDSeedProgramManager _currentSeedProgramFromDisk];
      }
      int64_t v8 = 0;
    }
  }
  else
  {
    id v5 = +[SDSeedingLogging fwHandle];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v12 = 138543362;
      uint64_t v13 = @"/var/Managed Preferences/mobile/com.apple.seeding.plist";
      _os_log_impl(&dword_1DD702000, v5, OS_LOG_TYPE_INFO, "Seeding plist does not exist at path [%{public}@]", (uint8_t *)&v12, 0xCu);
    }
    int64_t v8 = 0;
  }

  return v8;
}

+ (id)_loadSeedCatalogsFromPlist
{
  id v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  char v4 = [v3 pathForResource:@"SeedCatalogs" ofType:@"plist"];

  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfFile:v4];
  uint64_t v6 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __50__SDSeedProgramManager__loadSeedCatalogsFromPlist__block_invoke;
  v9[3] = &unk_1E6CD80B0;
  id v7 = v6;
  id v10 = v7;
  id v11 = a1;
  [v5 enumerateKeysAndObjectsUsingBlock:v9];

  return v7;
}

void __50__SDSeedProgramManager__loadSeedCatalogsFromPlist__block_invoke(uint64_t a1, void *a2, void *a3)
{
  char v4 = NSNumber;
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  uint64_t v8 = [(id)objc_opt_class() _seedProgramForString:v7];

  id v9 = [v4 numberWithInteger:v8];
  [v5 setObject:v6 forKey:v9];
}

+ (id)_loadSeedAudiencesFromPlist
{
  id v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  char v4 = [v3 pathForResource:@"SeedAudiences" ofType:@"plist"];

  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfFile:v4];
  id v6 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __51__SDSeedProgramManager__loadSeedAudiencesFromPlist__block_invoke;
  v9[3] = &unk_1E6CD80B0;
  id v7 = v6;
  id v10 = v7;
  id v11 = a1;
  [v5 enumerateKeysAndObjectsUsingBlock:v9];

  return v7;
}

void __51__SDSeedProgramManager__loadSeedAudiencesFromPlist__block_invoke(uint64_t a1, void *a2, void *a3)
{
  char v4 = NSNumber;
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  uint64_t v8 = [(id)objc_opt_class() _seedProgramForString:v7];

  id v9 = [v4 numberWithInteger:v8];
  [v5 setObject:v6 forKey:v9];
}

+ (BOOL)_currentCatalogIsSeed
{
  uint64_t v2 = [(id)objc_opt_class() _loadSeedCatalogsFromPlist];
  id v3 = +[SDCatalogUtilities _currentCatalog];
  char v4 = [v2 allValues];
  char v5 = [v4 containsObject:v3];

  return v5;
}

+ (BOOL)_currentAudienceIsSeed
{
  uint64_t v2 = [(id)objc_opt_class() _loadSeedAudiencesFromPlist];
  id v3 = +[SDCatalogUtilities _currentAssetAudience];
  char v4 = [v2 allValues];
  char v5 = [v4 containsObject:v3];

  return v5;
}

+ (BOOL)_setCatalogForSeedProgram:(int64_t)a3
{
  char v5 = [(id)objc_opt_class() _loadSeedCatalogsFromPlist];
  id v6 = [NSNumber numberWithInteger:a3];
  id v7 = [v5 objectForKey:v6];

  if (v7)
  {
    +[SDCatalogUtilities _setCatalog:v7];
  }
  else
  {
    uint64_t v8 = +[SDSeedingLogging fwHandle];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[SDSeedProgramManager _setCatalogForSeedProgram:]((uint64_t)a1, a3);
    }
  }
  return v7 != 0;
}

+ (BOOL)fixUpAssetAudience
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = +[SDSeedingLogging fwHandle];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v10) = 0;
    _os_log_impl(&dword_1DD702000, v3, OS_LOG_TYPE_DEFAULT, "Fixing Asset Audience.", (uint8_t *)&v10, 2u);
  }

  uint64_t v4 = [a1 currentSeedProgram];
  if ((unint64_t)(v4 - 1) >= 4)
  {
    id v6 = +[SDSeedingLogging fwHandle];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_1DD702000, v6, OS_LOG_TYPE_DEFAULT, "Current Program is not valid. Will not fix up Asset Audience", (uint8_t *)&v10, 2u);
    }
    char v8 = 0;
  }
  else
  {
    uint64_t v5 = v4;
    id v6 = +[SDCatalogUtilities _currentAssetAudience];
    id v7 = +[SDSeedingLogging fwHandle];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138543362;
      id v11 = v6;
      _os_log_impl(&dword_1DD702000, v7, OS_LOG_TYPE_DEFAULT, "Current Asset Audience [%{public}@]", (uint8_t *)&v10, 0xCu);
    }

    char v8 = [a1 _setAudienceForSeedProgram:v5];
  }

  return v8;
}

+ (BOOL)_setAudienceForSeedProgram:(int64_t)a3
{
  uint64_t v5 = [(id)objc_opt_class() _loadSeedAudiencesFromPlist];
  id v6 = [NSNumber numberWithInteger:a3];
  id v7 = [v5 objectForKey:v6];

  if (v7)
  {
    +[SDCatalogUtilities _setAudience:v7];
  }
  else
  {
    char v8 = +[SDSeedingLogging fwHandle];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[SDSeedProgramManager _setAudienceForSeedProgram:]((uint64_t)a1, a3);
    }
  }
  return v7 != 0;
}

+ (void)_clearSeedCatalog
{
  id v0 = +[SDCatalogUtilities _currentCatalog];
  [v0 UTF8String];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1DD702000, v1, v2, "Seeding: We're not pointed to a seed catalog: %s", v3, v4, v5, v6, v7);
}

+ (void)_clearAudience
{
}

+ (void)_setHelpFeedbackMenuEnabled:(BOOL)a3
{
  if (a3) {
    uint64_t v3 = (const void *)*MEMORY[0x1E4F1CFD0];
  }
  else {
    uint64_t v3 = 0;
  }
  CFStringRef v4 = (const __CFString *)*MEMORY[0x1E4F1D3B8];
  CFStringRef v5 = (const __CFString *)*MEMORY[0x1E4F1D3D0];
  CFStringRef v6 = (const __CFString *)*MEMORY[0x1E4F1D3E0];
  CFPreferencesSetValue(@"NSShowFeedbackMenu", v3, (CFStringRef)*MEMORY[0x1E4F1D3B8], (CFStringRef)*MEMORY[0x1E4F1D3D0], (CFStringRef)*MEMORY[0x1E4F1D3E0]);
  CFPreferencesSynchronize(v4, v5, v6);
}

+ (void)_setSeedOptOutUIDisabled:(BOOL)a3
{
  if (a3) {
    uint64_t v3 = (const void *)*MEMORY[0x1E4F1CFD0];
  }
  else {
    uint64_t v3 = 0;
  }
  CFStringRef v4 = (const __CFString *)*MEMORY[0x1E4F1D3D0];
  CFStringRef v5 = (const __CFString *)*MEMORY[0x1E4F1D3E0];
  CFPreferencesSetValue(@"DisableSeedOptOut", v3, @"com.apple.SoftwareUpdate", (CFStringRef)*MEMORY[0x1E4F1D3D0], (CFStringRef)*MEMORY[0x1E4F1D3E0]);
  CFPreferencesSynchronize(@"com.apple.SoftwareUpdate", v4, v5);
}

+ (void)_createFeedbackAssistantSymlink
{
  [@"/System/Library/CoreServices/Applications/Feedback Assistant.app" UTF8String];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1DD702000, v0, v1, "Seeding: FBA didn't exist at %s, skipping symlink creation", v2, v3, v4, v5, v6);
}

+ (BOOL)_canEnrollInBetaSoftware
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  CFPreferencesSynchronize(@"com.apple.SoftwareUpdate", (CFStringRef)*MEMORY[0x1E4F1D3D0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  CFPropertyListRef v2 = CFPreferencesCopyAppValue(@"AllowPreReleaseInstallation", @"com.apple.SoftwareUpdate");
  if (v2)
  {
    CFPropertyListRef v3 = v2;
    CFPropertyListRef v4 = (CFPropertyListRef)*MEMORY[0x1E4F1CFD0];
    BOOL v5 = v2 == (CFPropertyListRef)*MEMORY[0x1E4F1CFD0];
    CFRelease(v2);
    uint8_t v6 = +[SDSeedingLogging fwHandle];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint8_t v7 = @"NO";
      if (v3 == v4) {
        uint8_t v7 = @"YES";
      }
      int v9 = 138543362;
      int v10 = v7;
      _os_log_impl(&dword_1DD702000, v6, OS_LOG_TYPE_DEFAULT, "AllowPreReleaseInstallation: %{public}@", (uint8_t *)&v9, 0xCu);
    }
  }
  else
  {
    uint8_t v6 = +[SDSeedingLogging fwHandle];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_1DD702000, v6, OS_LOG_TYPE_DEFAULT, "Prerelease configuration not set, assuming YES.", (uint8_t *)&v9, 2u);
    }
    BOOL v5 = 1;
  }

  return v5;
}

+ (NSDictionary)currentEnrollmentMetadata
{
  CFPropertyListRef v3 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:2];
  uint64_t v4 = [a1 currentSeedProgram];
  if (v4)
  {
    BOOL v5 = [a1 stringForSeedProgram:v4];
    [v3 setObject:v5 forKey:@"SeedProgram"];
  }
  uint8_t v6 = +[SDCatalogUtilities _currentAssetAudience];
  uint8_t v7 = v6;
  if (v6 && [v6 length]) {
    [v3 setObject:v7 forKey:@"AssetAudience"];
  }
  char v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v3];

  return (NSDictionary *)v8;
}

+ (void)enrollInSeedProgramNamed:(id)a3 withAssetAudience:(id)a4 completion:(id)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [a1 _seedProgramForString:v8];
  if (v11)
  {
    uint64_t v12 = [a1 stringForSeedProgram:v11];
    uint64_t v13 = +[SDHTTPClient sharedInstance];
    uint64_t v14 = [v13 baseURL];

    uint64_t v27 = v14;
    uint64_t v15 = [v14 URLByAppendingPathComponent:@"migration"];
    v16 = [v15 URLByAppendingPathComponent:@"v1"];

    id v28 = v9;
    uint64_t v17 = [v9 stringByAppendingPathExtension:@"mobileconfig"];
    v18 = [v16 URLByAppendingPathComponent:v12];
    v19 = [v18 URLByAppendingPathComponent:v17];

    v20 = [MEMORY[0x1E4F290D0] requestWithURL:v19 cachePolicy:1 timeoutInterval:120.0];
    v21 = +[SDHTTPClient sharedInstance];
    v22 = [v21 urlSession];

    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __78__SDSeedProgramManager_enrollInSeedProgramNamed_withAssetAudience_completion___block_invoke;
    v29[3] = &unk_1E6CD80D8;
    id v31 = v10;
    id v23 = v12;
    id v30 = v23;
    uint64_t v24 = [v22 dataTaskWithRequest:v20 completionHandler:v29];
    uint64_t v25 = +[SDSeedingLogging fwHandle];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v33 = v23;
      _os_log_impl(&dword_1DD702000, v25, OS_LOG_TYPE_DEFAULT, "Requesting profile from profile service for %{public}@.", buf, 0xCu);
    }

    [v24 resume];
    id v9 = v28;
  }
  else
  {
    uint64_t v26 = +[SDSeedingLogging fwHandle];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      +[SDSeedProgramManager enrollInSeedProgramNamed:withAssetAudience:completion:]();
    }

    if (v10) {
      (*((void (**)(id, void))v10 + 2))(v10, 0);
    }
  }
}

void __78__SDSeedProgramManager_enrollInSeedProgramNamed_withAssetAudience_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = +[SDSeedingLogging fwHandle];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DD702000, v10, OS_LOG_TYPE_DEFAULT, "Received response from profile service.", buf, 2u);
  }

  if (v8)
  {
    if (v7)
    {
      if (!v9)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v11 = v8;
          if ([v11 statusCode] != 200)
          {
            v19 = +[SDSeedingLogging fwHandle];
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
              __78__SDSeedProgramManager_enrollInSeedProgramNamed_withAssetAudience_completion___block_invoke_cold_3(v11);
            }

            (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
            goto LABEL_26;
          }
          id v22 = 0;
          +[SDProfileUtilities installProfileWithData:v7 error:&v22];
          id v12 = v22;
          uint64_t v13 = +[SDSeedingLogging fwHandle];
          uint64_t v14 = v13;
          if (v12)
          {
            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
              __78__SDSeedProgramManager_enrollInSeedProgramNamed_withAssetAudience_completion___block_invoke_cold_2(v12);
            }

            uint64_t v15 = *(void *)(a1 + 40);
            if (!v15) {
              goto LABEL_25;
            }
            v16 = *(void (**)(void))(v15 + 16);
          }
          else
          {
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v20 = *(void *)(a1 + 32);
              *(_DWORD *)buf = 138543362;
              uint64_t v24 = v20;
              _os_log_impl(&dword_1DD702000, v14, OS_LOG_TYPE_DEFAULT, "Enrolled device in beta program: [%{public}@]", buf, 0xCu);
            }

            uint64_t v21 = *(void *)(a1 + 40);
            if (!v21) {
              goto LABEL_25;
            }
            v16 = *(void (**)(void))(v21 + 16);
          }
          v16();
LABEL_25:

LABEL_26:
          goto LABEL_27;
        }
      }
    }
  }
  uint64_t v17 = +[SDSeedingLogging fwHandle];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
    __78__SDSeedProgramManager_enrollInSeedProgramNamed_withAssetAudience_completion___block_invoke_cold_1(v9);
  }

  uint64_t v18 = *(void *)(a1 + 40);
  if (v18) {
    (*(void (**)(uint64_t, void))(v18 + 16))(v18, 0);
  }
LABEL_27:
}

+ (int64_t)_seedProgramForString:(id)a3
{
  id v3 = a3;
  uint64_t v4 = v3;
  if (v3)
  {
    if ([v3 isEqualToString:@"CustomerSeed"])
    {
      int64_t v5 = 1;
    }
    else if ([v4 isEqualToString:@"DeveloperSeed"])
    {
      int64_t v5 = 2;
    }
    else if ([v4 isEqualToString:@"PublicSeed"])
    {
      int64_t v5 = 3;
    }
    else if ([v4 isEqualToString:@"OtherSeed"])
    {
      int64_t v5 = 4;
    }
    else
    {
      int64_t v5 = 0;
    }
  }
  else
  {
    int64_t v5 = 0;
  }

  return v5;
}

+ (id)stringForSeedProgram:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 3)
  {
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v4 = *off_1E6CD80F8[a3 - 1];
  }
  return v4;
}

+ (BOOL)canFileFeedback
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  BOOL v2 = +[SDSeedProgramManager isEnrolledInSeedProgram];
  BOOL v3 = +[SDBuildInfo currentBuildIsSeed];
  BOOL v4 = +[SDBuildInfo isFeedbackAssistantAvailable];
  int64_t v5 = +[SDSeedingLogging fwHandle];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109888;
    v7[1] = v2;
    __int16 v8 = 1024;
    BOOL v9 = v3;
    __int16 v10 = 1024;
    BOOL v11 = v4;
    __int16 v12 = 1024;
    int v13 = (v2 || v3) && v4;
    _os_log_impl(&dword_1DD702000, v5, OS_LOG_TYPE_DEFAULT, "canFileFeedback: enrolledInSeed: %d, onSeedBuild: %d, isFBAAvailable %d, -> result: %d", (uint8_t *)v7, 0x1Au);
  }

  return (v2 || v3) && v4;
}

+ (void)currentSeedProgramForDiskAtPath:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1DD702000, a1, a3, "Path is nil, returning no program.", a5, a6, a7, a8, 0);
}

+ (void)currentSeedProgramForDiskAtPath:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)currentSeedProgramForDiskAtPath:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)currentSeedProgramForDiskAtPath:.cold.4()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_1DD702000, v0, v1, "Seeding program preference does not exist on disk at path [%{public}@]", v2);
}

+ (void)enrollInSeedProgram:deletingSystemURL:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_1DD702000, v0, v1, "Seeding: Got invalid seed program: %ld", v2);
}

+ (void)_currentSeedProgramFromDisk
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_1DD702000, v0, OS_LOG_TYPE_DEBUG, "Loaded enrollment plist [%@]", v1, 0xCu);
}

+ (void)_setCatalogForSeedProgram:(uint64_t)a1 .cold.1(uint64_t a1, uint64_t a2)
{
  id v2 = [(id)objc_opt_class() stringForSeedProgram:a2];
  [v2 UTF8String];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1DD702000, v3, v4, "Seeding: Couldn't find seed catalog in plist for program: %s", v5, v6, v7, v8, v9);
}

+ (void)_setAudienceForSeedProgram:(uint64_t)a1 .cold.1(uint64_t a1, uint64_t a2)
{
  id v2 = [(id)objc_opt_class() stringForSeedProgram:a2];
  [v2 UTF8String];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1DD702000, v3, v4, "Seeding: Couldn't find audience in plist for program: %s", v5, v6, v7, v8, v9);
}

+ (void)enrollInSeedProgramNamed:withAssetAudience:completion:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_1DD702000, v0, v1, "No seed program exists for name %{public}@", v2);
}

void __78__SDSeedProgramManager_enrollInSeedProgramNamed_withAssetAudience_completion___block_invoke_cold_1(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1DD702000, v2, v3, "Error from profile service: [%{public}@]", v4, v5, v6, v7, v8);
}

void __78__SDSeedProgramManager_enrollInSeedProgramNamed_withAssetAudience_completion___block_invoke_cold_2(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1DD702000, v2, v3, "Failed to enroll with profile: %{public}@", v4, v5, v6, v7, v8);
}

void __78__SDSeedProgramManager_enrollInSeedProgramNamed_withAssetAudience_completion___block_invoke_cold_3(void *a1)
{
  [a1 statusCode];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1DD702000, v1, v2, "Received non-200 status: [%li]", v3, v4, v5, v6, v7);
}

@end