@interface STAboutScreenTimeGroupSpecifierProvider
- (BOOL)isHidden;
- (PSSpecifier)aboutScreenTimeSpecifier;
- (STAboutScreenTimeGroupSpecifierProvider)init;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4;
- (void)setAboutScreenTimeSpecifier:(id)a3;
- (void)setCoordinator:(id)a3;
@end

@implementation STAboutScreenTimeGroupSpecifierProvider

- (STAboutScreenTimeGroupSpecifierProvider)init
{
  v26[1] = *MEMORY[0x263EF8340];
  v24.receiver = self;
  v24.super_class = (Class)STAboutScreenTimeGroupSpecifierProvider;
  v2 = [(STGroupSpecifierProvider *)&v24 init];
  if (v2)
  {
    v3 = +[STScreenTimeSettingsUIBundle bundle];
    v4 = [(STGroupSpecifierProvider *)v2 mutableSpecifiers];
    uint64_t v5 = [v3 localizedStringForKey:@"AboutScreenTimeTitle" value:&stru_26D9391A8 table:0];
    v6 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v5 target:v2 set:0 get:0 detail:0 cell:-1 edit:0];
    [v6 setIdentifier:@"ABOUT_SCREEN_TIME"];
    v23 = (void *)v5;
    [v6 setObject:v5 forKeyedSubscript:*MEMORY[0x263F602D0]];
    [v6 setObject:@"ABOUT_SCREEN_TIME" forKeyedSubscript:*MEMORY[0x263F60138]];
    v7 = [v3 localizedStringForKey:@"AboutScreenTimeDetailText" value:&stru_26D9391A8 table:0];
    [v6 setObject:v7 forKeyedSubscript:*MEMORY[0x263F602C8]];

    [v6 setObject:objc_opt_class() forKeyedSubscript:*MEMORY[0x263F5FFE0]];
    v8 = (void *)[objc_alloc(MEMORY[0x263F4B508]) initWithSymbolName:@"hourglass" bundleURL:0];
    v9 = objc_opt_new();
    v10 = (void *)[objc_alloc(MEMORY[0x263F4B4F0]) initWithSystemColor:11];
    v26[0] = v10;
    v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:1];
    [v9 setSymbolColors:v11];

    v12 = (void *)[objc_alloc(MEMORY[0x263F4B4F0]) initWithSystemColor:8];
    v25 = v12;
    v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v25 count:1];
    [v9 setEnclosureColors:v13];

    [v9 setRenderingMode:3];
    v14 = [v8 imageForGraphicSymbolDescriptor:v9];
    v15 = objc_msgSend(MEMORY[0x263F827E8], "imageWithCGImage:", objc_msgSend(v14, "CGImage"));
    [v6 setObject:v15 forKeyedSubscript:*MEMORY[0x263F60140]];
    [(STAboutScreenTimeGroupSpecifierProvider *)v2 setAboutScreenTimeSpecifier:v6];
    v16 = v4;
    [v4 addObject:v6];
    v17 = [MEMORY[0x263F53C50] sharedConnection];
    LODWORD(v5) = [v17 effectiveBoolValueForSetting:*MEMORY[0x263F53890]];

    if (v5 == 2)
    {
      v18 = +[STScreenTimeSettingsUIBundle bundle];
      v19 = [v18 localizedStringForKey:@"ScreenTimeRestrictedFooterText" value:&stru_26D9391A8 table:0];

      if (v19)
      {
        v20 = [(STGroupSpecifierProvider *)v2 groupSpecifier];
        [v20 setObject:v19 forKeyedSubscript:*MEMORY[0x263F600F8]];
      }
    }
    v21 = [MEMORY[0x263F53C50] sharedConnection];
    [v21 registerObserver:v2];
  }
  return v2;
}

- (void)dealloc
{
  v5.receiver = self;
  v5.super_class = (Class)STAboutScreenTimeGroupSpecifierProvider;
  [(STRootGroupSpecifierProvider *)&v5 invalidate];
  v3 = [MEMORY[0x263F53C50] sharedConnection];
  [v3 unregisterObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)STAboutScreenTimeGroupSpecifierProvider;
  [(STGroupSpecifierProvider *)&v4 dealloc];
}

- (void)setCoordinator:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(STRootGroupSpecifierProvider *)self coordinator];
  [v5 removeObserver:self forKeyPath:@"viewModel.isLocalOrRemotelyManagedUserWithScreenTimeDisabled" context:"STAboutScreenTimeGroupSpecifierObservationContext"];
  v6.receiver = self;
  v6.super_class = (Class)STAboutScreenTimeGroupSpecifierProvider;
  [(STRootGroupSpecifierProvider *)&v6 setCoordinator:v4];
  [v4 addObserver:self forKeyPath:@"viewModel.isLocalOrRemotelyManagedUserWithScreenTimeDisabled" options:4 context:"STAboutScreenTimeGroupSpecifierObservationContext"];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a6 == "STAboutScreenTimeGroupSpecifierObservationContext")
  {
    v11 = (void *)MEMORY[0x263F53C50];
    id v12 = a3;
    v13 = [v11 sharedConnection];
    int v14 = [v13 effectiveBoolValueForSetting:*MEMORY[0x263F53890]];

    id v16 = [(STRootGroupSpecifierProvider *)self coordinator];
    LODWORD(v13) = [v12 isEqualToString:@"viewModel.isLocalOrRemotelyManagedUserWithScreenTimeDisabled"];

    if (v13)
    {
      if (v14 == 2)
      {
        [(STGroupSpecifierProvider *)self setIsHidden:0];
      }
      else
      {
        v15 = [v16 viewModel];
        -[STGroupSpecifierProvider setIsHidden:](self, "setIsHidden:", [v15 isLocalOrRemotelyManagedUserWithScreenTimeDisabled] ^ 1);
      }
    }
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)STAboutScreenTimeGroupSpecifierProvider;
    id v10 = a3;
    [(STAboutScreenTimeGroupSpecifierProvider *)&v17 observeValueForKeyPath:v10 ofObject:a4 change:a5 context:a6];
  }
}

- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4
{
  objc_super v5 = objc_msgSend(MEMORY[0x263F53C50], "sharedConnection", a3, a4);
  int v6 = [v5 effectiveBoolValueForSetting:*MEMORY[0x263F53890]];

  if (v6 == 2)
  {
    v7 = +[STScreenTimeSettingsUIBundle bundle];
    id v13 = [v7 localizedStringForKey:@"ScreenTimeRestrictedFooterText" value:&stru_26D9391A8 table:0];
  }
  else
  {
    id v13 = 0;
  }
  v8 = [(STGroupSpecifierProvider *)self groupSpecifier];
  uint64_t v9 = *MEMORY[0x263F600F8];
  id v10 = [v8 objectForKeyedSubscript:*MEMORY[0x263F600F8]];
  if (v10) {
    BOOL v11 = 1;
  }
  else {
    BOOL v11 = v13 == 0;
  }
  if (!v11 || (v10 ? (BOOL v12 = v13 == 0) : (BOOL v12 = 0), v12))
  {
    [v8 setObject:v13 forKeyedSubscript:v9];
    [(STGroupSpecifierProvider *)self reloadSpecifier:v8 animated:1];
  }
}

- (BOOL)isHidden
{
  if (!_os_feature_enabled_impl()) {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)STAboutScreenTimeGroupSpecifierProvider;
  return [(STGroupSpecifierProvider *)&v4 isHidden];
}

- (PSSpecifier)aboutScreenTimeSpecifier
{
  return self->_aboutScreenTimeSpecifier;
}

- (void)setAboutScreenTimeSpecifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end