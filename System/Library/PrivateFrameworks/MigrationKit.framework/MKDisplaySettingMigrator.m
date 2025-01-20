@interface MKDisplaySettingMigrator
- (MKDisplaySettingMigrator)init;
- (void)import:(id)a3;
- (void)importDataEncodedInJSON:(id)a3;
- (void)setBool:(BOOL)a3 forKey:(id)a4;
@end

@implementation MKDisplaySettingMigrator

- (MKDisplaySettingMigrator)init
{
  v5.receiver = self;
  v5.super_class = (Class)MKDisplaySettingMigrator;
  v2 = [(MKMigrator *)&v5 init];
  v3 = v2;
  if (v2) {
    [(MKMigrator *)v2 setType:8];
  }
  return v3;
}

- (void)importDataEncodedInJSON:(id)a3
{
  id v7 = a3;
  v4 = self;
  uint64_t v5 = objc_sync_enter(v4);
  v6 = (void *)MEMORY[0x230F5C060](v5);
  [(MKDisplaySettingMigrator *)v4 import:v7];
  objc_sync_exit(v4);
}

- (void)import:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x263EFF910] date];
  v6 = +[MKLog log];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = (void *)[[NSString alloc] initWithData:v4 encoding:4];
    int v24 = 138412546;
    v25 = self;
    __int16 v26 = 2112;
    v27 = v7;
    _os_log_impl(&dword_22BFAC000, v6, OS_LOG_TYPE_INFO, "%@ will import. data=%@", (uint8_t *)&v24, 0x16u);
  }
  v8 = [[MKDisplay alloc] initWithData:v4];
  if ([(MKDisplay *)v8 enableDisplayDarkMode])
  {
    v9 = +[MKLog log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v24 = 138412290;
      v25 = self;
      _os_log_impl(&dword_22BFAC000, v9, OS_LOG_TYPE_INFO, "%@ will set dark mode", (uint8_t *)&v24, 0xCu);
    }

    v10 = (void *)[objc_alloc(MEMORY[0x263F83E90]) initWithDelegate:0];
    [v10 setModeValue:2];

    v11 = +[MKLog log];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v24 = 138412290;
      v25 = self;
      _os_log_impl(&dword_22BFAC000, v11, OS_LOG_TYPE_INFO, "%@ did set dark mode", (uint8_t *)&v24, 0xCu);
    }
  }
  v12 = +[MKLog log];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    int v24 = 138412290;
    v25 = self;
    _os_log_impl(&dword_22BFAC000, v12, OS_LOG_TYPE_INFO, "%@ will differ display zoom to buddy.", (uint8_t *)&v24, 0xCu);
  }

  [(MKDisplaySettingMigrator *)self setBool:[(MKDisplay *)v8 enableDisplayZoom] forKey:@"enable_display_zoom"];
  v13 = +[MKLog log];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    int v24 = 138412290;
    v25 = self;
    _os_log_impl(&dword_22BFAC000, v13, OS_LOG_TYPE_INFO, "%@ did differ display zoom to buddy.", (uint8_t *)&v24, 0xCu);
  }

  v14 = +[MKLog log];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    int v24 = 138412290;
    v25 = self;
    _os_log_impl(&dword_22BFAC000, v14, OS_LOG_TYPE_INFO, "%@ did import.", (uint8_t *)&v24, 0xCu);
  }

  [(MKMigrator *)self migratorDidImport];
  id v15 = +[MKAnalytics sharedInstance];
  objc_sync_enter(v15);
  v16 = [v15 payload];
  v17 = [v16 displaySettings];

  v18 = [MEMORY[0x263EFF910] date];
  [v18 timeIntervalSinceDate:v5];
  double v20 = v19;

  v21 = (void *)[objc_alloc(MEMORY[0x263F087B0]) initWithDouble:v20];
  v22 = [v17 importElapsedTime];
  v23 = [v22 decimalNumberByAdding:v21];
  [v17 setImportElapsedTime:v23];

  objc_sync_exit(v15);
}

- (void)setBool:(BOOL)a3 forKey:(id)a4
{
  id v4 = (CFPropertyListRef *)MEMORY[0x263EFFB40];
  if (!a3) {
    id v4 = (CFPropertyListRef *)MEMORY[0x263EFFB38];
  }
  CFPreferencesSetValue((CFStringRef)a4, *v4, @"com.apple.welcomekit", (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE50]);
}

@end