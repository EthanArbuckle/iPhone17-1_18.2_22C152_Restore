@interface PSUICloudDriveCellularSwitchSpecifier
- (BOOL)shouldShowCloudDrive;
- (PSUICloudDriveCellularSwitchSpecifier)initWithAppleAccountStore:(id)a3;
- (id)appleAccount;
- (id)cellularUsagePolicy;
- (id)cloudDriveGroupSpecifier;
- (id)getLogger;
- (void)setCellularUsagePolicy:(id)a3;
@end

@implementation PSUICloudDriveCellularSwitchSpecifier

- (PSUICloudDriveCellularSwitchSpecifier)initWithAppleAccountStore:(id)a3
{
  id v5 = a3;
  v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v7 = [v6 localizedStringForKey:@"CLOUD_DRIVE_CELLULAR" value:&stru_26D410CA0 table:@"Cellular"];
  v8 = [MEMORY[0x263F67EE0] sharedInstance];
  v11.receiver = self;
  v11.super_class = (Class)PSUICloudDriveCellularSwitchSpecifier;
  v9 = [(PSAppDataUsagePolicySwitchSpecifier *)&v11 initWithBundleID:@"com.apple.preferences.settings.cellular.per-app_usage.cache.clouddrive" displayName:v7 statisticsCache:v8];

  if (v9) {
    objc_storeStrong((id *)&v9->_accountStore, a3);
  }

  return v9;
}

- (BOOL)shouldShowCloudDrive
{
  v2 = [(PSUICloudDriveCellularSwitchSpecifier *)self appleAccount];
  char v3 = [v2 isEnabledForDataclass:*MEMORY[0x263EFB4C0]];

  return v3;
}

- (id)cloudDriveGroupSpecifier
{
  v2 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"CDSCellular"];
  char v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v4 = SFLocalizableWAPIStringKeyForKey();
  id v5 = [v3 localizedStringForKey:v4 value:&stru_26D410CA0 table:@"Cellular"];
  [v2 setProperty:v5 forKey:*MEMORY[0x263F600F8]];

  return v2;
}

- (id)appleAccount
{
  return (id)[(ACAccountStore *)self->_accountStore aa_primaryAppleAccount];
}

- (id)cellularUsagePolicy
{
  char v3 = NSNumber;
  v4 = [MEMORY[0x263F67ED0] sharedInstance];
  id v5 = objc_msgSend(v3, "numberWithInt:", objc_msgSend(v4, "isGlobalDataModificationRestricted") ^ 1);
  [(PSUICloudDriveCellularSwitchSpecifier *)self setProperty:v5 forKey:*MEMORY[0x263F600A8]];

  v6 = [(PSUICloudDriveCellularSwitchSpecifier *)self appleAccount];
  if (objc_msgSend(v6, "aa_useCellularForDataclass:", *MEMORY[0x263EFB4C0]))
  {
    v7 = [(PSUICloudDriveCellularSwitchSpecifier *)self appleAccount];
    uint64_t v8 = objc_msgSend(v7, "aa_useCellularForDataclass:", *MEMORY[0x263EFB428]);
  }
  else
  {
    uint64_t v8 = 0;
  }

  v9 = NSNumber;
  return (id)[v9 numberWithBool:v8];
}

- (void)setCellularUsagePolicy:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(PSUICloudDriveCellularSwitchSpecifier *)self getLogger];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v18 = "-[PSUICloudDriveCellularSwitchSpecifier setCellularUsagePolicy:]";
    __int16 v19 = 2112;
    id v20 = v4;
    _os_log_impl(&dword_221B17000, v5, OS_LOG_TYPE_DEFAULT, "%s setting: %@", buf, 0x16u);
  }

  v6 = [(PSUICloudDriveCellularSwitchSpecifier *)self appleAccount];
  uint64_t v7 = [v4 BOOLValue];
  objc_msgSend(v6, "aa_setUseCellular:forDataclass:", v7, *MEMORY[0x263EFB4C0]);
  uint64_t v8 = [v4 BOOLValue];
  objc_msgSend(v6, "aa_setUseCellular:forDataclass:", v8, *MEMORY[0x263EFB428]);
  accountStore = self->_accountStore;
  id v16 = 0;
  int v10 = [(ACAccountStore *)accountStore saveVerifiedAccount:v6 error:&v16];
  id v11 = v16;
  v12 = [(PSUICloudDriveCellularSwitchSpecifier *)self getLogger];
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (v13)
    {
      *(_DWORD *)buf = 136315394;
      v18 = "-[PSUICloudDriveCellularSwitchSpecifier setCellularUsagePolicy:]";
      __int16 v19 = 2112;
      id v20 = v4;
      _os_log_impl(&dword_221B17000, v12, OS_LOG_TYPE_DEFAULT, "%s set succeeded: %@", buf, 0x16u);
    }
  }
  else
  {
    if (v13)
    {
      *(_DWORD *)buf = 136315394;
      v18 = "-[PSUICloudDriveCellularSwitchSpecifier setCellularUsagePolicy:]";
      __int16 v19 = 2112;
      id v20 = v4;
      _os_log_impl(&dword_221B17000, v12, OS_LOG_TYPE_DEFAULT, "%s set failed: %@", buf, 0x16u);
    }

    [v6 reload];
    v14 = [(PSAppCellularUsageSpecifier *)self delegate];
    char v15 = objc_opt_respondsToSelector();

    if (v15)
    {
      v12 = [(PSAppCellularUsageSpecifier *)self delegate];
      [v12 didFailToSetPolicyForSpecifier:self];
    }
    else
    {
      v12 = [(PSUICloudDriveCellularSwitchSpecifier *)self getLogger];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_221B17000, v12, OS_LOG_TYPE_ERROR, "Delegate does respond to didFailToSetPolicyForSpecifier:", buf, 2u);
      }
    }
  }
}

- (id)getLogger
{
  return (id)[MEMORY[0x263F67EB0] loggerWithCategory:@"CloudDriveCellularSwitch"];
}

- (void).cxx_destruct
{
}

@end