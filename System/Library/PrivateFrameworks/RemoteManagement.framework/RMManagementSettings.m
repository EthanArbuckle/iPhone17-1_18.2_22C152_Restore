@interface RMManagementSettings
+ (RMManagementSettings)sharedSettings;
+ (void)reset;
- (NSMutableDictionary)cachedSettings;
- (NSURL)settingsURL;
- (RMManagementSettings)initWithURL:(id)a3;
- (id)valueForKey:(id)a3;
- (void)_readCachedSettings;
- (void)_writeCachedSettings;
- (void)removeValueForKey:(id)a3;
- (void)setCachedSettings:(id)a3;
- (void)setSettingsURL:(id)a3;
- (void)setValue:(id)a3 forKey:(id)a4;
@end

@implementation RMManagementSettings

+ (RMManagementSettings)sharedSettings
{
  if (qword_1000253D0 != -1) {
    dispatch_once(&qword_1000253D0, &stru_10001C6E0);
  }
  v2 = (void *)qword_1000253C8;

  return (RMManagementSettings *)v2;
}

+ (void)reset
{
  id v5 = [a1 sharedSettings];
  v2 = +[RMLocations dataVaultDirectoryURLCreateIfNeeded:1];
  v3 = [v2 URLByAppendingPathComponent:@"ManagementSettings.plist"];
  [v5 setSettingsURL:v3];

  [v5 _readCachedSettings];
  v4 = [v5 cachedSettings];
  [v4 removeAllObjects];

  [v5 _writeCachedSettings];
}

- (RMManagementSettings)initWithURL:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RMManagementSettings;
  v6 = [(RMManagementSettings *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_settingsURL, a3);
    uint64_t v8 = objc_opt_new();
    settingsLock = v7->_settingsLock;
    v7->_settingsLock = v8;
  }
  return v7;
}

- (id)valueForKey:(id)a3
{
  id v4 = a3;
  id v5 = self->_settingsLock;
  objc_sync_enter(v5);
  [(RMManagementSettings *)self _readCachedSettings];
  v6 = [(RMManagementSettings *)self cachedSettings];
  v7 = [v6 valueForKey:v4];

  objc_sync_exit(v5);

  return v7;
}

- (void)removeValueForKey:(id)a3
{
  id v6 = a3;
  id v4 = self->_settingsLock;
  objc_sync_enter(v4);
  [(RMManagementSettings *)self _readCachedSettings];
  id v5 = [(RMManagementSettings *)self cachedSettings];
  [v5 setObject:0 forKeyedSubscript:v6];

  [(RMManagementSettings *)self _writeCachedSettings];
  objc_sync_exit(v4);
}

- (void)setValue:(id)a3 forKey:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  v7 = self->_settingsLock;
  objc_sync_enter(v7);
  [(RMManagementSettings *)self _readCachedSettings];
  uint64_t v8 = [(RMManagementSettings *)self cachedSettings];
  [v8 setObject:v9 forKeyedSubscript:v6];

  [(RMManagementSettings *)self _writeCachedSettings];
  objc_sync_exit(v7);
}

- (void)_readCachedSettings
{
  v3 = [(RMManagementSettings *)self cachedSettings];

  if (!v3)
  {
    id v4 = [(RMManagementSettings *)self settingsURL];
    id v5 = +[NSInputStream inputStreamWithURL:v4];

    [v5 open];
    id v17 = 0;
    id v6 = +[NSPropertyListSerialization propertyListWithStream:v5 options:2 format:0 error:&v17];
    id v7 = v17;
    [v5 close];
    if (v6)
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      id v9 = +[RMLog managementSettings];
      v10 = v9;
      if (isKindOfClass)
      {
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
          sub_1000121F0(self);
        }

        [(RMManagementSettings *)self setCachedSettings:v6];
        goto LABEL_20;
      }
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_100012274();
      }

      v12 = objc_opt_new();
      [(RMManagementSettings *)self setCachedSettings:v12];
LABEL_19:

LABEL_20:
      return;
    }
    objc_super v11 = [v7 userInfo];
    v12 = [v11 objectForKeyedSubscript:NSUnderlyingErrorKey];

    if (v12)
    {
      v13 = [v12 domain];
      if ([v13 isEqualToString:NSPOSIXErrorDomain])
      {
        id v14 = [v12 code];

        if (v14 == (id)2)
        {
          v15 = +[RMLog managementSettings];
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
            sub_1000121AC(v15);
          }
LABEL_18:

          v16 = objc_opt_new();
          [(RMManagementSettings *)self setCachedSettings:v16];

          goto LABEL_19;
        }
      }
      else
      {
      }
    }
    v15 = +[RMLog managementSettings];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_100012144();
    }
    goto LABEL_18;
  }
}

- (void)_writeCachedSettings
{
  v3 = [(RMManagementSettings *)self settingsURL];
  id v4 = +[NSOutputStream outputStreamWithURL:v3 append:0];

  [v4 open];
  id v5 = [(RMManagementSettings *)self cachedSettings];
  id v10 = 0;
  NSInteger v6 = +[NSPropertyListSerialization writePropertyList:v5 toStream:v4 format:100 options:0 error:&v10];
  id v7 = v10;

  [v4 close];
  uint64_t v8 = +[RMLog managementSettings];
  id v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_100012344(self);
    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    sub_1000122DC();
  }
}

- (NSURL)settingsURL
{
  return self->_settingsURL;
}

- (void)setSettingsURL:(id)a3
{
}

- (NSMutableDictionary)cachedSettings
{
  return self->_cachedSettings;
}

- (void)setCachedSettings:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedSettings, 0);
  objc_storeStrong((id *)&self->_settingsURL, 0);

  objc_storeStrong((id *)&self->_settingsLock, 0);
}

@end