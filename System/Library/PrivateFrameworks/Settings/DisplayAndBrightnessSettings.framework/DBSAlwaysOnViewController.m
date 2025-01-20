@interface DBSAlwaysOnViewController
+ (id)alwaysOnSpecifierNamed:(id)a3;
+ (id)isAlwaysOnEnabled:(id)a3;
- (id)_alwaysOnDisplaySpecifier;
- (id)_showNotificationsSpecifier;
- (id)_showWallpaperSpecifier;
- (id)_updatesForSpecifiers:(id)a3 isAlwaysOnEnabled:(BOOL)a4 animated:(BOOL)a5;
- (id)specifiers;
- (void)setAlwaysOnDisplayEnabled:(id)a3 specifier:(id)a4;
@end

@implementation DBSAlwaysOnViewController

+ (id)alwaysOnSpecifierNamed:(id)a3
{
  v13[2] = *MEMORY[0x263EF8340];
  v4 = (void *)MEMORY[0x263F5FC40];
  id v5 = a3;
  v6 = [v4 preferenceSpecifierNamed:v5 target:a1 set:0 get:sel_isAlwaysOnEnabled_ detail:objc_opt_class() cell:2 edit:0];

  [v6 setProperty:@"j8/Omm6s1lsmTDFsXjsBfA" forKey:*MEMORY[0x263F60210]];
  id v7 = objc_alloc(MEMORY[0x263EFF980]);
  v8 = DBS_LocalizedStringForDisplays(@"ALWAYS_ON_DISABLED");
  v13[0] = v8;
  v9 = DBS_LocalizedStringForDisplays(@"ALWAYS_ON_ENABLED");
  v13[1] = v9;
  v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:2];
  v11 = (void *)[v7 initWithArray:v10];

  [v6 setValues:&unk_26E939128 titles:v11];
  return v6;
}

+ (id)isAlwaysOnEnabled:(id)a3
{
  Boolean keyExistsAndHasValidFormat = 1;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"SBEnableAlwaysOn", @"com.apple.springboard", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    BOOL v4 = AppBooleanValue == 0;
  }
  else {
    BOOL v4 = 0;
  }
  uint64_t v5 = !v4;
  v6 = [NSNumber numberWithInt:v5];
  return v6;
}

- (id)specifiers
{
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  BOOL v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
    v6 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"ALWAYS_ON_DESCRIPTION_GROUP"];
    id v7 = DBS_LocalizedStringForDisplays(@"ALWAYS_ON_DESCRIPTION");
    uint64_t v8 = *MEMORY[0x263F600F8];
    [v6 setProperty:v7 forKey:*MEMORY[0x263F600F8]];

    [v5 addObject:v6];
    v9 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"ALWAYS_ON_SECONDARY_DESCRIPTION_GROUP"];
    v10 = DBS_LocalizedStringForDisplays(@"ALWAYS_ON_SECONDARY_DESCRIPTION");
    [v9 setProperty:v10 forKey:v8];

    [v5 addObject:v9];
    v11 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"ALWAYS_ON_DISPLAY_GROUP"];
    [v5 addObject:v11];
    v12 = [(DBSAlwaysOnViewController *)self _alwaysOnDisplaySpecifier];
    [v5 addObject:v12];
    v13 = [v12 performGetter];
    uint64_t v14 = [v13 BOOLValue];

    v15 = [(DBSAlwaysOnViewController *)self _updatesForSpecifiers:v5 isAlwaysOnEnabled:v14 animated:0];
    v16 = [v15 currentSpecifiers];
    [v5 setArray:v16];

    v17 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)v5;

    BOOL v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (id)_alwaysOnDisplaySpecifier
{
  uint64_t v3 = (void *)MEMORY[0x263F5FC40];
  BOOL v4 = DBS_LocalizedStringForDisplays(@"ALWAYS_ON_DISPLAY");
  id v5 = [v3 preferenceSpecifierNamed:v4 target:self set:sel_setAlwaysOnDisplayEnabled_specifier_ get:sel_readPreferenceValue_ detail:0 cell:6 edit:0];

  [v5 setProperty:@"ALWAYS_ON_DISPLAY" forKey:*MEMORY[0x263F60138]];
  [v5 setProperty:@"com.apple.springboard" forKey:*MEMORY[0x263F60070]];
  [v5 setProperty:@"SBEnableAlwaysOn" forKey:*MEMORY[0x263F60170]];
  [v5 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F60068]];
  return v5;
}

- (id)_showWallpaperSpecifier
{
  uint64_t v3 = (void *)MEMORY[0x263F5FC40];
  BOOL v4 = DBS_LocalizedStringForDisplays(@"ALWAYS_ON_SHOW_WALLPAPER");
  id v5 = [v3 preferenceSpecifierNamed:v4 target:self set:sel_setPreferenceValue_specifier_ get:sel_readPreferenceValue_ detail:0 cell:6 edit:0];

  [v5 setProperty:@"ALWAYS_ON_SHOW_WALLPAPER" forKey:*MEMORY[0x263F60138]];
  [v5 setProperty:@"com.apple.springboard" forKey:*MEMORY[0x263F60070]];
  [v5 setProperty:@"SBShowWallpaperInAlwaysOn" forKey:*MEMORY[0x263F60170]];
  [v5 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F60068]];
  return v5;
}

- (id)_showNotificationsSpecifier
{
  uint64_t v3 = (void *)MEMORY[0x263F5FC40];
  BOOL v4 = DBS_LocalizedStringForDisplays(@"ALWAYS_ON_SHOW_NOTIFICATIONS");
  id v5 = [v3 preferenceSpecifierNamed:v4 target:self set:sel_setPreferenceValue_specifier_ get:sel_readPreferenceValue_ detail:0 cell:6 edit:0];

  [v5 setProperty:@"ALWAYS_ON_SHOW_NOTIFICATIONS" forKey:*MEMORY[0x263F60138]];
  [v5 setProperty:@"j8/Omm6s1lsmTDFsXjsBfA" forKey:*MEMORY[0x263F60210]];
  [v5 setProperty:@"com.apple.springboard" forKey:*MEMORY[0x263F60070]];
  [v5 setProperty:@"SBShowNotificationsInAlwaysOn" forKey:*MEMORY[0x263F60170]];
  [v5 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F60068]];
  return v5;
}

- (id)_updatesForSpecifiers:(id)a3 isAlwaysOnEnabled:(BOOL)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  v9 = [MEMORY[0x263F5FC50] updatesWithSpecifiers:v8];
  v10 = [v8 specifierForID:@"ALWAYS_ON_DISPLAY_GROUP"];
  if (v6)
  {
    id v11 = objc_alloc_init(MEMORY[0x263EFF980]);
    v12 = (void *)MEMORY[0x263F5FC40];
    v13 = DBS_LocalizedStringForDisplays(@"CUSTOMIZE_HEADER");
    uint64_t v14 = [v12 groupSpecifierWithID:@"ALWAYS_ON_CONFIGURATION_GROUP" name:v13];

    [v11 addObject:v14];
    v15 = [(DBSAlwaysOnViewController *)self _showWallpaperSpecifier];
    [v11 addObject:v15];

    v16 = [(DBSAlwaysOnViewController *)self _showNotificationsSpecifier];
    [v11 addObject:v16];

    v17 = DBS_LocalizedStringForDisplays(@"ALWAYS_ON_FOOTER");
    [v10 setProperty:v17 forKey:*MEMORY[0x263F600F8]];

    [v9 insertContiguousSpecifiers:v11 atIndex:2];
  }
  else
  {
    uint64_t v18 = [v8 indexOfSpecifierWithID:@"ALWAYS_ON_CONFIGURATION_GROUP"];
    if (v18 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v19 = v18;
      [v10 removePropertyForKey:*MEMORY[0x263F600F8]];
      objc_msgSend(v9, "removeSpecifiersInRange:", v19, v19 + 1);
    }
  }
  v20 = [v9 context];
  [v20 setAnimated:v5];

  return v9;
}

- (void)setAlwaysOnDisplayEnabled:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  CFPreferencesSetAppValue(@"SBEnableAlwaysOn", v5, @"com.apple.springboard");
  uint64_t v6 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]);
  uint64_t v7 = [v5 BOOLValue];

  id v8 = [(DBSAlwaysOnViewController *)self _updatesForSpecifiers:v6 isAlwaysOnEnabled:v7 animated:1];
  [(DBSAlwaysOnViewController *)self reloadSpecifierID:@"ALWAYS_ON_DISPLAY_GROUP"];
  [(DBSAlwaysOnViewController *)self performSpecifierUpdates:v8];
}

@end