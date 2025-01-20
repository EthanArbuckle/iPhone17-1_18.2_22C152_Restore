@interface STDefaultsMigrator
- (BOOL)isMigrationNeeded;
- (id)oldToNewKeyNames;
- (id)remotemanagementdDefaults;
- (id)screenTimeDefaults;
- (void)migrateUserDefaults;
@end

@implementation STDefaultsMigrator

- (id)oldToNewKeyNames
{
  v4[0] = @"SCREENTIME_ENABLED";
  v4[1] = @"SCREENTIME_SYNC_ENABLED";
  v5[0] = @"ScreenTimeEnabled";
  v5[1] = @"SyncEnabled";
  v4[2] = @"SCREENTIME_LAST_TIME_ZONE_NAME";
  v4[3] = @"SCREENTIME_PIN_MIGRATED";
  v5[2] = @"LastTimeZoneName";
  v5[3] = @"PINMigrated";
  v4[4] = @"SCREENTIME_RESTRICTIONS_MIGRATION_HAS_RUN";
  v4[5] = @"SCREENTIME_USAGE_GENESIS_DATE";
  v5[4] = @"RestrictionsMigrationVersion";
  v5[5] = @"UsageGenesisDate";
  v4[6] = @"SCREENTIME_CLOUD_MIRROR_LAST_SYNC_ATTEMPT_DATE";
  v5[6] = @"LastSyncDate";
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:7];
  return v2;
}

- (id)remotemanagementdDefaults
{
  id v2 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.remotemanagementd"];
  return v2;
}

- (id)screenTimeDefaults
{
  return +[NSUserDefaults standardUserDefaults];
}

- (BOOL)isMigrationNeeded
{
  id v2 = [(STDefaultsMigrator *)self screenTimeDefaults];
  v3 = [v2 valueForKey:@"ScreenTimeEnabled"];
  BOOL v4 = v3 == 0;

  return v4;
}

- (void)migrateUserDefaults
{
  v3 = [(STDefaultsMigrator *)self screenTimeDefaults];
  BOOL v4 = [(STDefaultsMigrator *)self remotemanagementdDefaults];
  v5 = [(STDefaultsMigrator *)self oldToNewKeyNames];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v6)
  {
    id v7 = v6;
    int v8 = 0;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        v12 = [v5 objectForKeyedSubscript:v11];
        v13 = [v3 valueForKey:v12];

        if (!v13)
        {
          v14 = [v3 valueForKey:v11];
          if (v14
            || ([v4 valueForKey:v11], (v14 = objc_claimAutoreleasedReturnValue()) != 0))
          {
            [v3 setValue:v14 forKey:v12];
            [v3 setValue:0 forKey:v11];
            ++v8;
          }
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v16 objects:v22 count:16];
    }
    while (v7);
  }
  else
  {
    int v8 = 0;
  }
  v15 = +[STLog screenTimeOrganizationController];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v21 = v8;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Migrated %d defaults to new names", buf, 8u);
  }
}

@end