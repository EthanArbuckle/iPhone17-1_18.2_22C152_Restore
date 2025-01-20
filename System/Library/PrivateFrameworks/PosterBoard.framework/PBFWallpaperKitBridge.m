@interface PBFWallpaperKitBridge
+ (id)defaultBridge;
- (BOOL)dataMigratorDeterminedLegacyWallpaperMigrationRequired;
- (BOOL)shouldDefaultWallpaperDisableModifyingLegibilityBlur;
- (BOOL)shouldInstallHeroPosterAsDefaultLockScreenWallpaper;
- (NSString)defaultWallpaperIdentifier;
- (void)clearLegacyWallpaperMigrationKeys;
- (void)shouldInstallHeroPosterAsDefaultLockScreenWallpaper;
@end

@implementation PBFWallpaperKitBridge

+ (id)defaultBridge
{
  if (defaultBridge_onceToken != -1) {
    dispatch_once(&defaultBridge_onceToken, &__block_literal_global_28);
  }
  v2 = (void *)defaultBridge_defaultBridge;
  return v2;
}

void __38__PBFWallpaperKitBridge_defaultBridge__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)defaultBridge_defaultBridge;
  defaultBridge_defaultBridge = v0;
}

- (NSString)defaultWallpaperIdentifier
{
  v2 = [getWKDefaultWallpaperManagerClass() defaultWallpaperManager];
  v3 = v2;
  if (v2)
  {
    v4 = [v2 defaultWallpaperBundle];
    uint64_t v5 = [v4 identifier];

    v6 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", v5);
  }
  else
  {
    v6 = 0;
  }

  return (NSString *)v6;
}

- (BOOL)shouldInstallHeroPosterAsDefaultLockScreenWallpaper
{
  v2 = [(PBFWallpaperKitBridge *)self defaultWallpaperIdentifier];
  uint64_t v3 = [v2 length];

  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E4F83BE0]);
    uint64_t v5 = [v4 lockScreenWallpaperConfigurationIncludingValuesForTypes:0];
    uint64_t v6 = [v5 wallpaperType];
    v7 = PBFLogMigration();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    BOOL v9 = v6 == 4;
    if (v9)
    {
      if (v8)
      {
        __int16 v14 = 0;
        v10 = "(shouldInstallCollectionsPosterAsDefaultLockScreenWallpaper) Color is set, we migrated, and there's no exi"
              "sting wallpaper - returning YES.";
        v11 = (uint8_t *)&v14;
LABEL_11:
        _os_log_impl(&dword_1D31CE000, v7, OS_LOG_TYPE_DEFAULT, v10, v11, 2u);
      }
    }
    else if (v8)
    {
      __int16 v13 = 0;
      v10 = "(shouldInstallCollectionsPosterAsDefaultLockScreenWallpaper) A preference has been set, going with legacy wa"
            "llpaper -- returning NO";
      v11 = (uint8_t *)&v13;
      goto LABEL_11;
    }

    goto LABEL_13;
  }
  v4 = PBFLogMigration();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    -[PBFWallpaperKitBridge shouldInstallHeroPosterAsDefaultLockScreenWallpaper](v4);
  }
  BOOL v9 = 0;
LABEL_13:

  return v9;
}

- (BOOL)dataMigratorDeterminedLegacyWallpaperMigrationRequired
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = PBFLogMigration();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v11) = 0;
    _os_log_impl(&dword_1D31CE000, v2, OS_LOG_TYPE_DEFAULT, "(dataMigratorDeterminedLegacyWallpaperMigrationRequired) Detecting if we need to do a data update", (uint8_t *)&v11, 2u);
  }

  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.springboard"];
  v4 = [v3 objectForKey:@"SBLegacyWallpaperMigrationNeeded"];
  uint64_t v5 = PBFLogMigration();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138543362;
    v12 = v4;
    _os_log_impl(&dword_1D31CE000, v5, OS_LOG_TYPE_DEFAULT, "(dataMigratorDeterminedLegacyWallpaperMigrationRequired) springBoardIndicatedDataStoreMigrationNeeded: (%{public}@)", (uint8_t *)&v11, 0xCu);
  }

  if (v4
    && (self,
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v6,
        (isKindOfClass & 1) != 0))
  {
    char v8 = [v4 BOOLValue];
  }
  else
  {
    BOOL v9 = PBFLogMigration();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138543362;
      v12 = v4;
      _os_log_impl(&dword_1D31CE000, v9, OS_LOG_TYPE_DEFAULT, "(dataMigratorDeterminedLegacyWallpaperMigrationRequired) springBoardIndicatedDataStoreMigrationNeeded was invalid (%{public}@); nothing to do.",
        (uint8_t *)&v11,
        0xCu);
    }

    char v8 = 0;
  }

  return v8;
}

- (void)clearLegacyWallpaperMigrationKeys
{
  id v2 = (id)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.springboard"];
  [v2 removeObjectForKey:@"SBLegacyWallpaperMigrationNeeded"];
}

- (BOOL)shouldDefaultWallpaperDisableModifyingLegibilityBlur
{
  id v2 = [getWKDefaultWallpaperManagerClass() defaultWallpaperManager];
  uint64_t v3 = v2;
  if (v2)
  {
    v4 = [v2 defaultWallpaperBundle];
    char v5 = [v4 disableModifyingLegibilityBlur];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (void)shouldInstallHeroPosterAsDefaultLockScreenWallpaper
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1D31CE000, log, OS_LOG_TYPE_FAULT, "(shouldInstallCollectionsPosterAsDefaultLockScreenWallpaper) unable to determine defaultWallpaperIdentifier... good luck with that legacy wallpaper (returning NO)", v1, 2u);
}

@end