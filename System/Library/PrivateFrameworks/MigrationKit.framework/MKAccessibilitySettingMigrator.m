@interface MKAccessibilitySettingMigrator
- (MKAccessibilitySettingMigrator)init;
- (void)import:(id)a3;
- (void)importDataEncodedInJSON:(id)a3;
@end

@implementation MKAccessibilitySettingMigrator

- (MKAccessibilitySettingMigrator)init
{
  v5.receiver = self;
  v5.super_class = (Class)MKAccessibilitySettingMigrator;
  v2 = [(MKMigrator *)&v5 init];
  v3 = v2;
  if (v2) {
    [(MKMigrator *)v2 setType:0];
  }
  return v3;
}

- (void)importDataEncodedInJSON:(id)a3
{
  id v7 = a3;
  v4 = self;
  uint64_t v5 = objc_sync_enter(v4);
  v6 = (void *)MEMORY[0x230F5C060](v5);
  [(MKAccessibilitySettingMigrator *)v4 import:v7];
  objc_sync_exit(v4);
}

- (void)import:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x263EFF910] date];
  v6 = +[MKLog log];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = (MKAccessibility *)[[NSString alloc] initWithData:v4 encoding:4];
    int v25 = 138412546;
    v26 = self;
    __int16 v27 = 2112;
    v28 = v7;
    _os_log_impl(&dword_22BFAC000, v6, OS_LOG_TYPE_INFO, "%@ will import. data=%@", (uint8_t *)&v25, 0x16u);
  }
  v8 = [[MKAccessibility alloc] initWithData:v4];
  v9 = +[MKLog log];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v25 = 138412546;
    v26 = self;
    __int16 v27 = 2112;
    v28 = v8;
    _os_log_impl(&dword_22BFAC000, v9, OS_LOG_TYPE_INFO, "%@ did have ax. ax=%@", (uint8_t *)&v25, 0x16u);
  }

  if ([(MKAccessibility *)v8 enableDisplayInversion])
  {
    v10 = +[MKLog log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v25 = 138412290;
      v26 = self;
      _os_log_impl(&dword_22BFAC000, v10, OS_LOG_TYPE_INFO, "%@ will set invert colors.", (uint8_t *)&v25, 0xCu);
    }

    _AXSInvertColorsSetEnabled();
    v11 = +[MKLog log];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v25 = 138412290;
      v26 = self;
      _os_log_impl(&dword_22BFAC000, v11, OS_LOG_TYPE_INFO, "%@ did set invert colors.", (uint8_t *)&v25, 0xCu);
    }
  }
  [(MKAccessibility *)v8 fontScale];
  if (v12 > 0.0 && v12 != 1.0)
  {
    v13 = +[MKLog log];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      int v25 = 138412290;
      v26 = self;
      _os_log_impl(&dword_22BFAC000, v13, OS_LOG_TYPE_INFO, "%@ will set font scale.", (uint8_t *)&v25, 0xCu);
    }

    _AXSSetPreferredContentSizeCategoryName();
    v14 = +[MKLog log];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      int v25 = 138412290;
      v26 = self;
      _os_log_impl(&dword_22BFAC000, v14, OS_LOG_TYPE_INFO, "%@ did set font scale.", (uint8_t *)&v25, 0xCu);
    }
  }
  v15 = +[MKLog log];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    int v25 = 138412290;
    v26 = self;
    _os_log_impl(&dword_22BFAC000, v15, OS_LOG_TYPE_INFO, "%@ did import.", (uint8_t *)&v25, 0xCu);
  }

  [(MKMigrator *)self migratorDidImport];
  id v16 = +[MKAnalytics sharedInstance];
  objc_sync_enter(v16);
  v17 = [v16 payload];
  v18 = [v17 accessibilitySettings];

  v19 = [MEMORY[0x263EFF910] date];
  [v19 timeIntervalSinceDate:v5];
  double v21 = v20;

  v22 = (void *)[objc_alloc(MEMORY[0x263F087B0]) initWithDouble:v21];
  v23 = [v18 importElapsedTime];
  v24 = [v23 decimalNumberByAdding:v22];
  [v18 setImportElapsedTime:v24];

  objc_sync_exit(v16);
}

@end