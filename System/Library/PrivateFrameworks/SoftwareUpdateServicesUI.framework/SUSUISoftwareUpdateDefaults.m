@interface SUSUISoftwareUpdateDefaults
- (SUSUISoftwareUpdateDefaults)init;
- (id)_initWithLegacyDefaults:(id)a3;
- (void)_bindAndRegisterDefaults;
- (void)_clearLegacySpringBoardPreferences;
- (void)_migrateLegacySpringBoardPreferences;
- (void)migrateAndClearLegacyPreferences;
@end

@implementation SUSUISoftwareUpdateDefaults

- (SUSUISoftwareUpdateDefaults)init
{
  id location = self;
  id v6 = (id)[MEMORY[0x263F086E0] mainBundle];
  id v7 = (id)[v6 bundleIdentifier];
  char v10 = 0;
  char v8 = 0;
  if ([v7 isEqualToString:init_springBoardBundleIdentifier])
  {
    id v11 = (id)[MEMORY[0x263EFFA40] standardUserDefaults];
    char v10 = 1;
    id v4 = v11;
  }
  else
  {
    id v2 = objc_alloc(MEMORY[0x263EFFA40]);
    id v9 = (id)[v2 initWithSuiteName:init_springBoardBundleIdentifier];
    char v8 = 1;
    id v4 = v9;
  }
  id location = -[SUSUISoftwareUpdateDefaults _initWithLegacyDefaults:](self, "_initWithLegacyDefaults:", v4, v4);
  v13 = (SUSUISoftwareUpdateDefaults *)location;
  if (v8) {

  }
  if (v10) {
  objc_storeStrong(&location, 0);
  }
  return v13;
}

- (id)_initWithLegacyDefaults:(id)a3
{
  char v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v8;
  char v8 = 0;
  id v6 = [(BSAbstractDefaultDomain *)v3 _initWithDomain:@"com.apple.softwareupdateservices.ui.ios"];
  char v8 = v6;
  objc_storeStrong((id *)&v8, v6);
  if (v6) {
    objc_storeStrong((id *)&v8->_sbLegacyDefaults, location[0]);
  }
  v5 = v8;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v8, 0);
  return v5;
}

- (void)_bindAndRegisterDefaults
{
  id v3 = (id)[NSString stringWithUTF8String:"lastOSVersion"];
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:");

  id v4 = (id)[NSString stringWithUTF8String:"softwareUpdateState"];
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:");

  id v5 = (id)[NSString stringWithUTF8String:"needsAlertPresentationAfterOTAUpdate"];
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:");
}

- (void)migrateAndClearLegacyPreferences
{
  [(SUSUISoftwareUpdateDefaults *)self _migrateLegacySpringBoardPreferences];
  [(SUSUISoftwareUpdateDefaults *)self _clearLegacySpringBoardPreferences];
  [(SUSUISoftwareUpdateDefaults *)self setNeedsAlertPresentationAfterOTAUpdate:0];
  id v2 = [(BSAbstractDefaultDomain *)self _store];
  [v2 synchronize];
}

- (void)_migrateLegacySpringBoardPreferences
{
  v14 = self;
  v13[1] = (id)a2;
  v13[0] = [(NSUserDefaults *)self->_sbLegacyDefaults dictionaryForKey:@"SBBootTransitionContext"];
  id v5 = (id)[v13[0] valueForKey:@"__fromOTASoftwareUpdate"];
  char v6 = [v5 BOOLValue];

  char v12 = v6 & 1;
  char v11 = 0;
  char v11 = [(NSUserDefaults *)v14->_sbLegacyDefaults BOOLForKey:@"SBFromOTASoftwareUpdate"];
  char v10 = [(SUSUISoftwareUpdateDefaults *)v14 needsAlertPresentationAfterOTAUpdate] & 1;
  if (v11 & 1) != 0 || (v12 & 1) != 0 || (v10)
  {
    id location = SUSUILog();
    os_log_type_t v8 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEFAULT))
    {
      log = location;
      os_log_type_t type = v8;
      __os_log_helper_16_0_0(v7);
      _os_log_impl(&dword_224ECB000, log, type, "Found legacy needOTAAlert preference", v7, 2u);
    }
    objc_storeStrong(&location, 0);
    id v2 = +[SUSUIPreferences sharedInstance];
    [(SUSUIPreferences *)v2 setNeedsAlertPresentationAfterOTAUpdate:1];
  }
  objc_storeStrong(v13, 0);
}

- (void)_clearLegacySpringBoardPreferences
{
}

- (void).cxx_destruct
{
}

@end