@interface PSUICloudBackupCellularSwitchSpecifier
- (BOOL)shouldShowCloudBackupCarrier;
- (PSUICloudBackupCellularSwitchSpecifier)initWithAppleAccountStore:(id)a3 backupManagerWrapper:(id)a4;
- (id)appleAccount;
- (id)cellularUsagePolicy;
- (id)cloudBackupGroupSpecifier;
- (id)getLogger;
- (void)setCellularUsagePolicy:(id)a3;
@end

@implementation PSUICloudBackupCellularSwitchSpecifier

- (PSUICloudBackupCellularSwitchSpecifier)initWithAppleAccountStore:(id)a3 backupManagerWrapper:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v10 = [v9 localizedStringForKey:@"CLOUD_BACKUP_CELLULAR" value:&stru_26D410CA0 table:@"Cellular"];
  v11 = [MEMORY[0x263F67EE0] sharedInstance];
  v14.receiver = self;
  v14.super_class = (Class)PSUICloudBackupCellularSwitchSpecifier;
  v12 = [(PSAppDataUsagePolicySwitchSpecifier *)&v14 initWithBundleID:@"com.apple.preferences.settings.cellular.per-app_usage.cache.cloudBackup" displayName:v10 statisticsCache:v11];

  if (v12)
  {
    objc_storeStrong((id *)&v12->_accountStore, a3);
    objc_storeStrong((id *)&v12->_backupManagerWrapper, a4);
  }

  return v12;
}

- (BOOL)shouldShowCloudBackupCarrier
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  backupManagerWrapper = self->_backupManagerWrapper;
  v4 = [(PSUICloudBackupCellularSwitchSpecifier *)self appleAccount];
  id v9 = 0;
  unint64_t v5 = [(PSUIMBManagerWrapper *)backupManagerWrapper backupOnCellularSupportWithAccount:v4 error:&v9];
  id v6 = v9;

  if (v6)
  {
    id v7 = [(PSUICloudBackupCellularSwitchSpecifier *)self getLogger];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v6;
      _os_log_error_impl(&dword_221B17000, v7, OS_LOG_TYPE_ERROR, "Failed to fetch BackupOnCellularSupport: %@", buf, 0xCu);
    }

    LOBYTE(v7) = 0;
  }
  else
  {
    id v7 = ((v5 >> 1) & 1);
  }

  return (char)v7;
}

- (id)cloudBackupGroupSpecifier
{
  v2 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"BackupOnCellular"];
  v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v4 = SFLocalizableWAPIStringKeyForKey();
  unint64_t v5 = [v3 localizedStringForKey:v4 value:&stru_26D410CA0 table:@"Cellular"];
  [v2 setProperty:v5 forKey:*MEMORY[0x263F600F8]];

  return v2;
}

- (id)appleAccount
{
  return (id)[(ACAccountStore *)self->_accountStore aa_primaryAppleAccount];
}

- (id)cellularUsagePolicy
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  backupManagerWrapper = self->_backupManagerWrapper;
  id v10 = 0;
  uint64_t v4 = [(PSUIMBManagerWrapper *)backupManagerWrapper isBackupOnCellularEnabledWithError:&v10];
  id v5 = v10;
  id v6 = [(PSUICloudBackupCellularSwitchSpecifier *)self getLogger];
  id v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v5;
      _os_log_error_impl(&dword_221B17000, v7, OS_LOG_TYPE_ERROR, "Failed to fetch BackupOnCellularEnabled: %@", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v12) = v4;
    _os_log_impl(&dword_221B17000, v7, OS_LOG_TYPE_DEFAULT, "Cellular usage for BackupOnCellularEnabled: %d", buf, 8u);
  }

  id v8 = [NSNumber numberWithBool:v4];

  return v8;
}

- (void)setCellularUsagePolicy:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(PSUICloudBackupCellularSwitchSpecifier *)self getLogger];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v15 = v4;
    _os_log_impl(&dword_221B17000, v5, OS_LOG_TYPE_DEFAULT, "Setting BackupOnCellularEnabled: %@", buf, 0xCu);
  }

  backupManagerWrapper = self->_backupManagerWrapper;
  id v13 = 0;
  BOOL v7 = -[PSUIMBManagerWrapper setBackupOnCellularEnabled:error:](backupManagerWrapper, "setBackupOnCellularEnabled:error:", [v4 BOOLValue], &v13);
  id v8 = v13;
  id v9 = [(PSUICloudBackupCellularSwitchSpecifier *)self getLogger];
  id v10 = v9;
  if (v7)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v4;
      _os_log_impl(&dword_221B17000, v10, OS_LOG_TYPE_DEFAULT, "setBackupOnCellularEnabled succeeded: %@", buf, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v15 = v4;
      __int16 v16 = 2112;
      id v17 = v8;
      _os_log_error_impl(&dword_221B17000, v10, OS_LOG_TYPE_ERROR, "setBackupOnCellularEnabled failed: %@: %@", buf, 0x16u);
    }

    id v11 = [(PSAppCellularUsageSpecifier *)self delegate];
    char v12 = objc_opt_respondsToSelector();

    if (v12)
    {
      id v10 = [(PSAppCellularUsageSpecifier *)self delegate];
      [v10 didFailToSetPolicyForSpecifier:self];
    }
    else
    {
      id v10 = [(PSUICloudBackupCellularSwitchSpecifier *)self getLogger];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_221B17000, v10, OS_LOG_TYPE_ERROR, "Delegate does respond to didFailToSetPolicyForSpecifier:", buf, 2u);
      }
    }
  }
}

- (id)getLogger
{
  return (id)[MEMORY[0x263F67EB0] loggerWithCategory:@"CloudBackupSwitch"];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backupManagerWrapper, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
}

@end