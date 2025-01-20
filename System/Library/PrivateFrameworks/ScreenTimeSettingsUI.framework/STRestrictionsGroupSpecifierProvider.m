@interface STRestrictionsGroupSpecifierProvider
- (PSSpecifier)contentPrivacySpecifier;
- (PSSpecifier)informativeTextGroupSpecifier;
- (STRestrictionsGroupSpecifierProvider)init;
- (id)contentPrivacyDetailText;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4;
- (void)setContentPrivacySpecifier:(id)a3;
- (void)setCoordinator:(id)a3;
- (void)setInformativeTextGroupSpecifier:(id)a3;
@end

@implementation STRestrictionsGroupSpecifierProvider

- (STRestrictionsGroupSpecifierProvider)init
{
  v15.receiver = self;
  v15.super_class = (Class)STRestrictionsGroupSpecifierProvider;
  v2 = [(STGroupSpecifierProvider *)&v15 init];
  if (v2)
  {
    v3 = +[STScreenTimeSettingsUIBundle bundle];
    v4 = [(STGroupSpecifierProvider *)v2 mutableSpecifiers];
    v5 = (void *)MEMORY[0x263F5FC40];
    v6 = [v3 localizedStringForKey:@"RestrictionsGroupSpecifierName" value:&stru_26D9391A8 table:0];
    v7 = [v5 groupSpecifierWithName:v6];
    [(STGroupSpecifierProvider *)v2 setGroupSpecifier:v7];

    v8 = [v3 localizedStringForKey:@"ContentPrivacySpecifierName" value:&stru_26D9391A8 table:0];
    v9 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v8 target:v2 set:0 get:0 detail:objc_opt_class() cell:2 edit:0];
    [v9 setIdentifier:@"CONTENT_PRIVACY"];
    [v9 setObject:v8 forKeyedSubscript:*MEMORY[0x263F602D0]];
    [v9 setObject:@"CONTENT_PRIVACY" forKeyedSubscript:*MEMORY[0x263F60138]];
    v10 = [(STRestrictionsGroupSpecifierProvider *)v2 contentPrivacyDetailText];
    [v9 setObject:v10 forKeyedSubscript:*MEMORY[0x263F602C8]];

    [v9 setObject:objc_opt_class() forKeyedSubscript:*MEMORY[0x263F5FFE0]];
    v11 = [MEMORY[0x263F827E8] imageNamed:@"ContentPrivacy" inBundle:v3];
    v12 = [v11 _applicationIconImageForFormat:0 precomposed:1];
    [v9 setObject:v12 forKeyedSubscript:*MEMORY[0x263F60140]];

    if ([MEMORY[0x263F82438] isRunningInStoreDemoMode]) {
      [v9 setButtonAction:sel_showStoreDemoAlert];
    }
    [(STRestrictionsGroupSpecifierProvider *)v2 setContentPrivacySpecifier:v9];
    [v4 addObject:v9];
    v13 = [MEMORY[0x263F53C50] sharedConnection];
    [v13 registerObserver:v2];
  }
  return v2;
}

- (void)dealloc
{
  v5.receiver = self;
  v5.super_class = (Class)STRestrictionsGroupSpecifierProvider;
  [(STRootGroupSpecifierProvider *)&v5 invalidate];
  v3 = [MEMORY[0x263F53C50] sharedConnection];
  [v3 unregisterObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)STRestrictionsGroupSpecifierProvider;
  [(STGroupSpecifierProvider *)&v4 dealloc];
}

- (void)setCoordinator:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(STRootGroupSpecifierProvider *)self coordinator];
  if (_os_feature_enabled_impl()) {
    v6 = @"viewModel.isLocalOrRemotelyManagedUser";
  }
  else {
    v6 = @"viewModel.screenTimeEnabled";
  }
  [v5 removeObserver:self forKeyPath:v6 context:"STRestrictionsGroupSpecifierProviderObservationContext"];
  v10.receiver = self;
  v10.super_class = (Class)STRestrictionsGroupSpecifierProvider;
  [(STRootGroupSpecifierProvider *)&v10 setCoordinator:v4];
  v7 = [(STRootGroupSpecifierProvider *)self coordinator];
  v8 = [(STRestrictionsGroupSpecifierProvider *)self contentPrivacySpecifier];
  [v8 setObject:v7 forKeyedSubscript:0x26D940528];

  if (_os_feature_enabled_impl()) {
    v9 = @"viewModel.isLocalOrRemotelyManagedUser";
  }
  else {
    v9 = @"viewModel.screenTimeEnabled";
  }
  [v4 addObserver:self forKeyPath:v9 options:4 context:"STRestrictionsGroupSpecifierProviderObservationContext"];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  if (a6 == "STRestrictionsGroupSpecifierProviderObservationContext")
  {
    v11 = [(STRootGroupSpecifierProvider *)self coordinator];
    if (_os_feature_enabled_impl()
      && ([(STRootGroupSpecifierProvider *)self coordinator],
          (id)objc_claimAutoreleasedReturnValue(),
          [v10 isEqualToString:@"viewModel.isLocalOrRemotelyManagedUser"]))
    {
      v12 = [MEMORY[0x263F53C50] sharedConnection];
      int v13 = [v12 effectiveBoolValueForSetting:*MEMORY[0x263F53890]];

      v14 = [(STRootGroupSpecifierProvider *)self coordinator];
      objc_super v15 = [v14 viewModel];
      unsigned int v16 = [v15 isLocalOrRemotelyManagedUser] ^ 1;
      if (v13 == 2) {
        uint64_t v17 = 1;
      }
      else {
        uint64_t v17 = v16;
      }
      [(STGroupSpecifierProvider *)self setIsHidden:v17];
    }
    else if ((_os_feature_enabled_impl() & 1) == 0 {
           && [v10 isEqualToString:@"viewModel.screenTimeEnabled"])
    }
    {
      v18 = [v11 viewModel];
      int v19 = [v18 isScreenTimeEnabled];

      [(STGroupSpecifierProvider *)self setIsHidden:v19 ^ 1u];
    }
  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)STRestrictionsGroupSpecifierProvider;
    [(STRestrictionsGroupSpecifierProvider *)&v20 observeValueForKeyPath:v10 ofObject:a4 change:a5 context:a6];
  }
}

- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4
{
  if (_os_feature_enabled_impl())
  {
    objc_super v5 = [MEMORY[0x263F53C50] sharedConnection];
    int v6 = [v5 effectiveBoolValueForSetting:*MEMORY[0x263F53890]];

    id v10 = [(STRootGroupSpecifierProvider *)self coordinator];
    v7 = [v10 viewModel];
    unsigned int v8 = [v7 isLocalOrRemotelyManagedUser] ^ 1;
    if (v6 == 2) {
      uint64_t v9 = 1;
    }
    else {
      uint64_t v9 = v8;
    }
    [(STGroupSpecifierProvider *)self setIsHidden:v9];
  }
}

- (id)contentPrivacyDetailText
{
  v2 = +[STScreenTimeSettingsUIBundle bundle];
  v3 = [v2 localizedStringForKey:@"AADC_ContentPrivacyDetailText" value:&stru_26D9391A8 table:0];

  return v3;
}

- (PSSpecifier)contentPrivacySpecifier
{
  return self->_contentPrivacySpecifier;
}

- (void)setContentPrivacySpecifier:(id)a3
{
}

- (PSSpecifier)informativeTextGroupSpecifier
{
  return self->_informativeTextGroupSpecifier;
}

- (void)setInformativeTextGroupSpecifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_informativeTextGroupSpecifier, 0);

  objc_storeStrong((id *)&self->_contentPrivacySpecifier, 0);
}

@end