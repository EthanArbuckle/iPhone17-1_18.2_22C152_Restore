@interface MBSettingsContext
+ (id)defaultSettingsContext;
- (BOOL)shouldPreserveSettings;
- (BOOL)shouldRestoreSystemFiles;
- (MBMobileInstallation)mobileInstallation;
- (MBSettingsContext)init;
- (NSArray)plugins;
- (double)safeHarborExpiration;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)backupPolicy;
- (void)setBackupPolicy:(int64_t)a3;
- (void)setMobileInstallation:(id)a3;
- (void)setPlugins:(id)a3;
- (void)setSafeHarborExpiration:(double)a3;
- (void)setShouldPreserveSettings:(BOOL)a3;
- (void)setShouldRestoreSystemFiles:(BOOL)a3;
@end

@implementation MBSettingsContext

+ (id)defaultSettingsContext
{
  v2 = objc_alloc_init(MBSettingsContext);

  return v2;
}

- (MBSettingsContext)init
{
  v11.receiver = self;
  v11.super_class = (Class)MBSettingsContext;
  v2 = [(MBSettingsContext *)&v11 init];
  if (v2)
  {
    v3 = [MBMobileInstallation alloc];
    v4 = [(MBMobileInstallation *)v3 initWithSafeHarborDir:kMBSafeHarborDir];
    mobileInstallation = v2->_mobileInstallation;
    v2->_mobileInstallation = v4;

    v6 = (void *)CFPreferencesCopyValue(@"SafeHarborExpirationPeriod", @"com.apple.MobileBackup", kMBMobileUserName, kCFPreferencesAnyHost);
    v7 = v6;
    if (v6)
    {
      [v6 doubleValue];
      uint64_t v9 = v8;
    }
    else
    {
      sub_100092304();
      uint64_t v9 = 0x4143C68000000000;
    }

    *(void *)&v2->_safeHarborExpiration = v9;
    v2->_backupPolicy = 0;
  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [[objc_opt_class() allocWithZone:a3] init];
  [v4 setMobileInstallation:self->_mobileInstallation];
  [v4 setSafeHarborExpiration:self->_safeHarborExpiration];
  [v4 setShouldPreserveSettings:self->_shouldPreserveSettings];
  [v4 setBackupPolicy:self->_backupPolicy];
  return v4;
}

- (MBMobileInstallation)mobileInstallation
{
  return self->_mobileInstallation;
}

- (void)setMobileInstallation:(id)a3
{
}

- (double)safeHarborExpiration
{
  return self->_safeHarborExpiration;
}

- (void)setSafeHarborExpiration:(double)a3
{
  self->_safeHarborExpiration = a3;
}

- (BOOL)shouldPreserveSettings
{
  return self->_shouldPreserveSettings;
}

- (void)setShouldPreserveSettings:(BOOL)a3
{
  self->_shouldPreserveSettings = a3;
}

- (BOOL)shouldRestoreSystemFiles
{
  return self->_shouldRestoreSystemFiles;
}

- (void)setShouldRestoreSystemFiles:(BOOL)a3
{
  self->_shouldRestoreSystemFiles = a3;
}

- (NSArray)plugins
{
  return self->_plugins;
}

- (void)setPlugins:(id)a3
{
}

- (int64_t)backupPolicy
{
  return self->_backupPolicy;
}

- (void)setBackupPolicy:(int64_t)a3
{
  self->_backupPolicy = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_plugins, 0);

  objc_storeStrong((id *)&self->_mobileInstallation, 0);
}

@end