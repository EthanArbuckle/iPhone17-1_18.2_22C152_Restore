@interface BYDaemonDataMigrator
- (BYCapabilities)capabilities;
- (BYDaemonDataMigrator)init;
- (void)migrateWithStoredMigratorVersion:(unsigned int)a3 userDataDisposition:(unsigned int)a4;
- (void)setCapabilities:(id)a3;
@end

@implementation BYDaemonDataMigrator

- (BYDaemonDataMigrator)init
{
  v5.receiver = self;
  v5.super_class = (Class)BYDaemonDataMigrator;
  v2 = [(BYDaemonDataMigrator *)&v5 init];
  if (v2)
  {
    id v3 = objc_alloc_init((Class)BYCapabilities);
    [(BYDaemonDataMigrator *)v2 setCapabilities:v3];
  }
  return v2;
}

- (void)migrateWithStoredMigratorVersion:(unsigned int)a3 userDataDisposition:(unsigned int)a4
{
  v7 = _BYLoggingFacility();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 67109376;
    LODWORD(v14[0]) = a3;
    WORD2(v14[0]) = 1024;
    *(_DWORD *)((char *)v14 + 6) = a4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "BYDaemonDataMigrator will migrate with storedMigratorVersion %d user data disposition %d", (uint8_t *)&v13, 0xEu);
  }

  if (a3 <= 0xC && (a4 & 2) != 0)
  {
    v8 = +[NSLocale currentLocale];
    v9 = [v8 regionCode];

    v10 = _BYLoggingFacility();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      v14[0] = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "BYDaemonDataMigrator: Setting eligibility device locale to %@", (uint8_t *)&v13, 0xCu);
    }

    v11 = [(BYDaemonDataMigrator *)self capabilities];
    [v11 eligibilitySetDeviceLocale:v9];
  }
  v12 = _BYLoggingFacility();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v13) = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "BYDaemonDataMigrator done", (uint8_t *)&v13, 2u);
  }
}

- (BYCapabilities)capabilities
{
  return self->_capabilities;
}

- (void)setCapabilities:(id)a3
{
}

- (void).cxx_destruct
{
}

@end