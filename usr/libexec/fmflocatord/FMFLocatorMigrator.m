@interface FMFLocatorMigrator
- (BOOL)performMigration;
- (id)_currentVersionIdentifiersDict;
- (id)_oldVersionIdentifiersDict;
- (void)_saveVersionIdentifiersDict:(id)a3;
- (void)migrateFromVersion:(id)a3 toVersion:(id)a4;
@end

@implementation FMFLocatorMigrator

- (BOOL)performMigration
{
  v3 = sub_10001B6D4();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "FMFLocatorMigrator is migrating", v9, 2u);
  }

  v4 = [(FMFLocatorMigrator *)self _oldVersionIdentifiersDict];
  v5 = [(FMFLocatorMigrator *)self _currentVersionIdentifiersDict];
  [(FMFLocatorMigrator *)self _saveVersionIdentifiersDict:v5];
  v6 = [v4 objectForKeyedSubscript:@"buildVersion"];
  v7 = [v5 objectForKeyedSubscript:@"buildVersion"];
  [(FMFLocatorMigrator *)self migrateFromVersion:v6 toVersion:v7];

  return 1;
}

- (void)migrateFromVersion:(id)a3 toVersion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 compare:v6];
  if (v7 == (id)1)
  {
    v8 = sub_10001B6D4();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412546;
      id v11 = v5;
      __int16 v12 = 2112;
      id v13 = v6;
      v9 = "Back-migration from %@ to %@";
      goto LABEL_7;
    }
LABEL_8:

    goto LABEL_9;
  }
  if (v7 == (id)-1)
  {
    v8 = sub_10001B6D4();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412546;
      id v11 = v5;
      __int16 v12 = 2112;
      id v13 = v6;
      v9 = "Migrating from %@ to %@";
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v10, 0x16u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
LABEL_9:
}

- (id)_oldVersionIdentifiersDict
{
  v2 = +[NSMutableDictionary dictionary];
  [v2 setObject:&stru_10005BAE8 forKeyedSubscript:@"buildVersion"];
  [v2 setObject:&stru_10005BAE8 forKeyedSubscript:@"productVersion"];
  [v2 setObject:&stru_10005BAE8 forKeyedSubscript:@"fmflocatorVersion"];
  v3 = +[FMPreferencesUtil stringForKey:@"LastLaunchVersion" inDomain:@"com.apple.icloud.fmflocatord"];
  v4 = [v3 componentsSeparatedByString:@","];
  if ((unint64_t)[v4 count] >= 3)
  {
    id v5 = [v4 objectAtIndex:0];
    [v2 setObject:v5 forKeyedSubscript:@"buildVersion"];

    id v6 = [v4 objectAtIndex:1];
    [v2 setObject:v6 forKeyedSubscript:@"productVersion"];

    id v7 = [v4 objectAtIndex:2];
    [v2 setObject:v7 forKeyedSubscript:@"fmflocatorVersion"];
  }

  return v2;
}

- (id)_currentVersionIdentifiersDict
{
  v2 = +[NSMutableDictionary dictionary];
  uint64_t v3 = MGCopyAnswerWithError();
  v4 = (void *)v3;
  if (v3) {
    CFStringRef v5 = (const __CFString *)v3;
  }
  else {
    CFStringRef v5 = &stru_10005BAE8;
  }
  [v2 setObject:v5 forKeyedSubscript:@"buildVersion"];
  uint64_t v6 = MGCopyAnswerWithError();
  id v7 = (void *)v6;
  if (v6) {
    CFStringRef v8 = (const __CFString *)v6;
  }
  else {
    CFStringRef v8 = &stru_10005BAE8;
  }
  [v2 setObject:v8 forKeyedSubscript:@"productVersion"];
  v9 = +[NSBundle bundleForClass:objc_opt_class()];
  int v10 = [v9 infoDictionary];
  id v11 = [v10 objectForKeyedSubscript:kCFBundleVersionKey];

  if (v11) {
    CFStringRef v12 = v11;
  }
  else {
    CFStringRef v12 = &stru_10005BAE8;
  }
  [v2 setObject:v12 forKeyedSubscript:@"fmflocatorVersion"];

  return v2;
}

- (void)_saveVersionIdentifiersDict:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 objectForKeyedSubscript:@"buildVersion"];
  CFStringRef v5 = (void *)v4;
  if (v4) {
    CFStringRef v6 = (const __CFString *)v4;
  }
  else {
    CFStringRef v6 = &stru_10005BAE8;
  }
  uint64_t v7 = [v3 objectForKeyedSubscript:@"productVersion"];
  CFStringRef v8 = (void *)v7;
  if (v7) {
    CFStringRef v9 = (const __CFString *)v7;
  }
  else {
    CFStringRef v9 = &stru_10005BAE8;
  }
  int v10 = [v3 objectForKeyedSubscript:@"fmflocatorVersion"];

  if (v10) {
    CFStringRef v11 = v10;
  }
  else {
    CFStringRef v11 = &stru_10005BAE8;
  }
  id v12 = +[NSString stringWithFormat:@"%@,%@,%@", v6, v9, v11];

  +[FMPreferencesUtil setString:v12 forKey:@"LastLaunchVersion" inDomain:@"com.apple.icloud.fmflocatord"];
}

@end