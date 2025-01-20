@interface DBSAutoLockViewController
- (id)_specifierWithName:(id)a3;
- (id)_staticTextMessageForAutoLockTime:(id)a3 autoLockTimeString:(id)a4;
- (void)loadView;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation DBSAutoLockViewController

- (void)loadView
{
  v9.receiver = self;
  v9.super_class = (Class)DBSAutoLockViewController;
  [(DBSAutoLockViewController *)&v9 loadView];
  v3 = [MEMORY[0x263F53C50] sharedConnection];
  v4 = [v3 effectiveValueForSetting:*MEMORY[0x263F53798]];

  uint64_t v5 = (int)*MEMORY[0x263F5FE98];
  v6 = [*(id *)((char *)&self->super.super.super.super.super.super.isa + v5) titleDictionary];
  v7 = [v6 objectForKey:v4];

  v8 = [(DBSAutoLockViewController *)self _staticTextMessageForAutoLockTime:v4 autoLockTimeString:v7];
  [*(id *)((char *)&self->super.super.super.super.super.super.isa + v5) setProperty:v8 forKey:*MEMORY[0x263F60280]];
}

- (void)viewDidAppear:(BOOL)a3
{
  v17[1] = *MEMORY[0x263EF8340];
  v16.receiver = self;
  v16.super_class = (Class)DBSAutoLockViewController;
  [(DBSAutoLockViewController *)&v16 viewDidAppear:a3];
  v4 = [NSURL URLWithString:@"settings-navigation://com.apple.Settings.Display/AUTOLOCK"];
  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x263F08DB0]);
    v6 = [MEMORY[0x263EFF960] currentLocale];
    v7 = DBS_BundleForDisplayAndBrightnessSettingsFramework();
    v8 = [v7 bundleURL];
    objc_super v9 = (void *)[v5 initWithKey:@"DISPLAY_AND_BRIGHTNESS" defaultValue:0 table:@"Display" locale:v6 bundleURL:v8];

    id v10 = objc_alloc(MEMORY[0x263F08DB0]);
    v11 = [MEMORY[0x263EFF960] currentLocale];
    v12 = DBS_BundleForDisplayAndBrightnessSettingsFramework();
    v13 = [v12 bundleURL];
    v14 = (void *)[v10 initWithKey:@"AUTOLOCK" defaultValue:0 table:@"Display" locale:v11 bundleURL:v13];

    v17[0] = v9;
    v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:1];
    [(DBSAutoLockViewController *)self pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:@"com.apple.graphic-icon.display" title:v14 localizedNavigationComponents:v15 deepLink:v4];
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v16.receiver = self;
  v16.super_class = (Class)DBSAutoLockViewController;
  id v6 = a4;
  [(PSListItemsController *)&v16 tableView:a3 didSelectRowAtIndexPath:v6];
  v7 = objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDD0]), "cellForRowAtIndexPath:", v6, v16.receiver, v16.super_class);

  v8 = [v7 title];
  objc_super v9 = [(DBSAutoLockViewController *)self _specifierWithName:v8];

  id v10 = NSNumber;
  v11 = [v9 identifier];
  v12 = objc_msgSend(v10, "numberWithInteger:", objc_msgSend(v11, "integerValue"));

  v13 = [v9 name];
  v14 = [(DBSAutoLockViewController *)self _staticTextMessageForAutoLockTime:v12 autoLockTimeString:v13];

  v15 = [*(id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]) specifierForID:@"LIST_ITEMS_GROUP_SPECIFIER"];
  [v15 setProperty:v14 forKey:*MEMORY[0x263F600F8]];
  [(DBSAutoLockViewController *)self reloadSpecifier:v15];
}

- (id)_specifierWithName:(id)a3
{
  id v4 = a3;
  id v5 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __48__DBSAutoLockViewController__specifierWithName___block_invoke;
  v9[3] = &unk_264C7A668;
  id v10 = v4;
  id v6 = v4;
  v7 = objc_msgSend(v5, "bs_firstObjectPassingTest:", v9);

  return v7;
}

uint64_t __48__DBSAutoLockViewController__specifierWithName___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 name];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (id)_staticTextMessageForAutoLockTime:(id)a3 autoLockTimeString:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 intValue] == 0x7FFFFFFF || objc_msgSend(v5, "intValue") == -1)
  {
    DBS_LocalizedStringForDisplays(@"DNB_AUTOLOCK_NEVER_WARNING_DESCRIPTION");
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    int v8 = 0;
  }
  else
  {
    v7 = &stru_26E931C58;
    int v8 = 1;
  }
  if ((MGGetBoolAnswer() & 1) == 0)
  {
    v15 = v7;
LABEL_12:
    v14 = v15;
    goto LABEL_13;
  }
  int v9 = _AXSAttentionAwarenessFeaturesEnabled();
  char v10 = v8 ^ 1;
  if (((v8 ^ 1) & 1) == 0 && v9)
  {
    v11 = NSString;
    v12 = @"DNB_AUTOLOCK_ENABLED_ATTENTION_AWARENESS_ENABLED";
LABEL_9:
    v13 = DBS_LocalizedStringForDisplays(v12);
    objc_msgSend(v11, "stringWithFormat:", v13, v6, v18);
LABEL_10:
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

    goto LABEL_13;
  }
  if (v9) {
    char v17 = v8;
  }
  else {
    char v17 = 1;
  }
  if ((v17 & 1) == 0)
  {
    DBS_LocalizedStringForDisplays(@"DNB_AUTOLOCK_DISABLED_ATTENTION_AWARENESS_ENABLED");
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  if (v9) {
    char v10 = 1;
  }
  if ((v10 & 1) == 0)
  {
    v11 = NSString;
    v12 = @"DNB_AUTOLOCK_ENABLED_ATTENTION_AWARENESS_DISABLED";
    goto LABEL_9;
  }
  if (!(v8 & 1 | (v9 != 0)))
  {
    v13 = DBS_LocalizedStringForDisplays(@"DNB_AUTOLOCK_DISABLED_ATTENTION_AWARENESS_DISABLED");
    [NSString stringWithFormat:@"%@\n\n%@", v7, v13];
    goto LABEL_10;
  }
  v14 = &stru_26E931C58;
LABEL_13:

  return v14;
}

@end