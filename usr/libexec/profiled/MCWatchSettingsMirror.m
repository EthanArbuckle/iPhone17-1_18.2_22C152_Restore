@interface MCWatchSettingsMirror
+ (id)sharedMirror;
- (MCWatchSettingsMirror)init;
- (NSDictionary)syncableSettings;
- (id)effectiveIntersectionValuesForSetting:(id)a3 pairingID:(id)a4 pairingDataStore:(id)a5;
- (id)effectiveUnionValuesForSetting:(id)a3 pairingID:(id)a4 pairingDataStore:(id)a5;
- (id)effectiveValueForSetting:(id)a3 pairingID:(id)a4 pairingDataStore:(id)a5;
- (int)effectiveBoolValueForSetting:(id)a3 pairingID:(id)a4 pairingDataStore:(id)a5;
@end

@implementation MCWatchSettingsMirror

+ (id)sharedMirror
{
  if (qword_1001059D8 != -1) {
    dispatch_once(&qword_1001059D8, &stru_1000EBFC8);
  }
  v2 = (void *)qword_1001059D0;

  return v2;
}

- (MCWatchSettingsMirror)init
{
  v7.receiver = self;
  v7.super_class = (Class)MCWatchSettingsMirror;
  v2 = [(MCWatchSettingsMirror *)&v7 init];
  v9[0] = MCRestrictedBoolKey;
  v8[0] = MCFeatureAppInstallationAllowed;
  v8[1] = MCFeatureAutomaticAppDownloadsAllowed;
  v3 = +[NSArray arrayWithObjects:v8 count:2];
  v10[0] = v3;
  v10[1] = &__NSArray0__struct;
  v9[1] = MCRestrictedValueKey;
  v9[2] = MCIntersectionKey;
  v9[3] = MCUnionKey;
  v10[2] = &__NSArray0__struct;
  v10[3] = &__NSArray0__struct;
  uint64_t v4 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:4];
  syncableSettings = v2->_syncableSettings;
  v2->_syncableSettings = (NSDictionary *)v4;

  return v2;
}

- (int)effectiveBoolValueForSetting:(id)a3 pairingID:(id)a4 pairingDataStore:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(MCWatchSettingsMirror *)self syncableSettings];
  uint64_t v12 = MCRestrictedBoolKey;
  v13 = [v11 objectForKeyedSubscript:MCRestrictedBoolKey];

  if ([v13 containsObject:v8])
  {
    id v14 = [objc_alloc((Class)NPSDomainAccessor) initWithDomain:@"com.apple.ManagedConfiguration.WatchEffectiveSettingsMirror" pairingID:v9 pairingDataStore:v10];
    v15 = [v14 synchronize];
    if (v15)
    {
      os_log_t v16 = _MCLogObjects[2];
      int v17 = 0;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v18 = v16;
        v19 = [v15 localizedDescription];
        int v25 = 138543362;
        v26 = v19;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Unable to synchronize accessor. Error: %{public}@", (uint8_t *)&v25, 0xCu);

        int v17 = 0;
      }
    }
    else
    {
      v20 = [v14 objectForKey:v12];
      v21 = v20;
      if (v20)
      {
        v22 = [v20 objectForKeyedSubscript:v8];
        v23 = [v22 objectForKeyedSubscript:MCRestrictedBoolValueKey];

        if (v23)
        {
          if ([v23 BOOLValue]) {
            int v17 = 1;
          }
          else {
            int v17 = 2;
          }
        }
        else
        {
          int v17 = 0;
        }
      }
      else
      {
        int v17 = 0;
      }
    }
  }
  else
  {
    int v17 = 0;
  }

  return v17;
}

- (id)effectiveValueForSetting:(id)a3 pairingID:(id)a4 pairingDataStore:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(MCWatchSettingsMirror *)self syncableSettings];
  uint64_t v12 = MCRestrictedValueKey;
  v13 = [v11 objectForKeyedSubscript:MCRestrictedValueKey];

  if ([v13 containsObject:v8])
  {
    id v14 = [objc_alloc((Class)NPSDomainAccessor) initWithDomain:@"com.apple.ManagedConfiguration.WatchEffectiveSettingsMirror" pairingID:v9 pairingDataStore:v10];
    v15 = [v14 synchronize];
    if (v15)
    {
      os_log_t v16 = _MCLogObjects[2];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = v16;
        v18 = [v15 localizedDescription];
        int v25 = 138543362;
        v26 = v18;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Unable to synchronize accessor. Error: %{public}@", (uint8_t *)&v25, 0xCu);
      }
      id v19 = 0;
    }
    else
    {
      v20 = [v14 objectForKey:v12];
      v21 = v20;
      if (v20)
      {
        v22 = [v20 objectForKeyedSubscript:v8];
        v23 = [v22 objectForKeyedSubscript:MCRestrictedValueValueKey];
      }
      else
      {
        v23 = 0;
      }
      id v19 = v23;
    }
  }
  else
  {
    id v19 = 0;
  }

  return v19;
}

- (id)effectiveIntersectionValuesForSetting:(id)a3 pairingID:(id)a4 pairingDataStore:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(MCWatchSettingsMirror *)self syncableSettings];
  uint64_t v12 = MCIntersectionKey;
  v13 = [v11 objectForKeyedSubscript:MCIntersectionKey];

  if ([v13 containsObject:v8])
  {
    id v14 = [objc_alloc((Class)NPSDomainAccessor) initWithDomain:@"com.apple.ManagedConfiguration.WatchEffectiveSettingsMirror" pairingID:v9 pairingDataStore:v10];
    v15 = [v14 synchronize];
    if (v15)
    {
      os_log_t v16 = _MCLogObjects[2];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = v16;
        v18 = [v15 localizedDescription];
        int v25 = 138543362;
        v26 = v18;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Unable to synchronize accessor. Error: %{public}@", (uint8_t *)&v25, 0xCu);
      }
      id v19 = 0;
    }
    else
    {
      v20 = [v14 objectForKey:v12];
      v21 = v20;
      if (v20)
      {
        v22 = [v20 objectForKeyedSubscript:v8];
        v23 = [v22 objectForKeyedSubscript:MCIntersectionValuesKey];
      }
      else
      {
        v23 = 0;
      }
      id v19 = v23;
    }
  }
  else
  {
    id v19 = 0;
  }

  return v19;
}

- (id)effectiveUnionValuesForSetting:(id)a3 pairingID:(id)a4 pairingDataStore:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(MCWatchSettingsMirror *)self syncableSettings];
  uint64_t v12 = MCUnionKey;
  v13 = [v11 objectForKeyedSubscript:MCUnionKey];

  if ([v13 containsObject:v8])
  {
    id v14 = [objc_alloc((Class)NPSDomainAccessor) initWithDomain:@"com.apple.ManagedConfiguration.WatchEffectiveSettingsMirror" pairingID:v9 pairingDataStore:v10];
    v15 = [v14 synchronize];
    if (v15)
    {
      os_log_t v16 = _MCLogObjects[2];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = v16;
        v18 = [v15 localizedDescription];
        int v25 = 138543362;
        v26 = v18;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Unable to synchronize accessor. Error: %{public}@", (uint8_t *)&v25, 0xCu);
      }
      id v19 = 0;
    }
    else
    {
      v20 = [v14 objectForKey:v12];
      v21 = v20;
      if (v20)
      {
        v22 = [v20 objectForKeyedSubscript:v8];
        v23 = [v22 objectForKeyedSubscript:MCUnionValuesKey];
      }
      else
      {
        v23 = 0;
      }
      id v19 = v23;
    }
  }
  else
  {
    id v19 = 0;
  }

  return v19;
}

- (NSDictionary)syncableSettings
{
  return self->_syncableSettings;
}

- (void).cxx_destruct
{
}

@end