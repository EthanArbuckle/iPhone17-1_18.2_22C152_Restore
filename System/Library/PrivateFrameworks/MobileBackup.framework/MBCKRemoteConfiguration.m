@interface MBCKRemoteConfiguration
+ (id)sharedInstance;
- (BOOL)allowSnapshotFormatSelectionOnGMForAccount:(id)a3;
- (BOOL)backupVerificationEnabledForAccount:(id)a3;
- (BOOL)restoreVerificationEnabledForAccount:(id)a3;
- (BOOL)shouldReloadConfigurationWithAccount:(id)a3;
- (MBCKCodeOperator)operator;
- (MBCKRemoteConfiguration)init;
- (NSDictionary)configuration;
- (id)_allValuesForKey:(id)a3 account:(id)a4;
- (id)dryRestoreConfigurationForAccount:(id)a3;
- (id)persistedValueForKey:(id)a3 account:(id)a4;
- (id)shouldRestoreUsingFileListsForAccount:(id)a3;
- (id)valueForKey:(id)a3 account:(id)a4;
- (int64_t)snapshotFormatForBackupWithAccount:(id)a3;
- (void)loadConfigurationWithContainer:(id)a3 databaseManager:(id)a4 policy:(id)a5 operationGroup:(id)a6 completion:(id)a7;
- (void)mergeRemoteConfigurationForAccount:(id)a3 response:(id)a4;
- (void)persistValueForKey:(id)a3 value:(id)a4 account:(id)a5;
- (void)persistValueIfNeeded:(id)a3 forKey:(id)a4 account:(id)a5;
- (void)persistValuesIfNeeded:(id)a3 forKey:(id)a4 account:(id)a5;
- (void)resetCachedConfigurationForAccount:(id)a3;
@end

@implementation MBCKRemoteConfiguration

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001AB480;
  block[3] = &unk_100411038;
  block[4] = a1;
  if (qword_100482608 != -1) {
    dispatch_once(&qword_100482608, block);
  }
  v2 = (void *)qword_100482600;
  return v2;
}

- (MBCKRemoteConfiguration)init
{
  v6.receiver = self;
  v6.super_class = (Class)MBCKRemoteConfiguration;
  v2 = [(MBCKRemoteConfiguration *)&v6 init];
  if (v2)
  {
    v3 = [[MBCKCodeOperator alloc] initWithService:@"BackupClientConfigurationService" function:@"getCurrentConfiguration" responseType:objc_opt_class()];
    operator = v2->_operator;
    v2->_operator = v3;
  }
  return v2;
}

- (BOOL)shouldReloadConfigurationWithAccount:(id)a3
{
  v3 = [a3 persona];
  id v4 = [v3 copyPreferencesValueForKey:@"RemoteConfigurationBuildVersion" class:objc_opt_class()];
  v5 = MBBuildVersion();
  unsigned int v6 = [v5 isEqualToString:v4];

  if (v6)
  {
    id v7 = [v3 copyPreferencesValueForKey:@"RemoteConfigurationExpiration" class:objc_opt_class()];
    if (v7)
    {
      v8 = +[NSDate date];
      BOOL v9 = [v7 compare:v8] == (id)-1;
    }
    else
    {
      BOOL v9 = 1;
    }
  }
  else
  {
    BOOL v9 = 1;
  }

  return v9;
}

- (void)loadConfigurationWithContainer:(id)a3 databaseManager:(id)a4 policy:(id)a5 operationGroup:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (!v14) {
    __assert_rtn("-[MBCKRemoteConfiguration loadConfigurationWithContainer:databaseManager:policy:operationGroup:completion:]", "MBCKRemoteConfiguration.m", 85, "policy");
  }
  v17 = (void (**)(void, void))v16;
  if (!v16) {
    __assert_rtn("-[MBCKRemoteConfiguration loadConfigurationWithContainer:databaseManager:policy:operationGroup:completion:]", "MBCKRemoteConfiguration.m", 86, "completion");
  }
  if (!v13) {
    __assert_rtn("-[MBCKRemoteConfiguration loadConfigurationWithContainer:databaseManager:policy:operationGroup:completion:]", "MBCKRemoteConfiguration.m", 91, "databaseManager");
  }
  if (atomic_exchange(&self->_operationInProgress._Value, 1u))
  {
    v25 = MBGetDefaultLog();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "Not fetching remote configuration because a request is already in progress", buf, 2u);
      _MBLog();
    }

    v17[2](v17, 0);
  }
  else
  {
    v18 = [v12 account];
    unsigned __int8 v19 = [(MBCKRemoteConfiguration *)self shouldReloadConfigurationWithAccount:v18];
    v20 = MBGetDefaultLog();
    BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_INFO);
    if (v19)
    {
      if (v21)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Fetching remote configuration", buf, 2u);
        _MBLog();
      }

      v22 = objc_opt_new();
      v23 = [(MBCKRemoteConfiguration *)self operator];
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_1001AB95C;
      v26[3] = &unk_1004157E0;
      id v27 = v18;
      v28 = self;
      v29 = v17;
      v24 = [v23 operationForRequest:v22 callback:v26];

      [v13 addDatabaseOperation:v24 container:v12 policy:v14 operationGroup:v15];
    }
    else
    {
      if (v21)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Not fetching remote configuration because it hasn't expired yet", buf, 2u);
        _MBLog();
      }

      atomic_store(0, (unsigned __int8 *)&self->_operationInProgress);
      v17[2](v17, 0);
    }
  }
}

- (void)mergeRemoteConfigurationForAccount:(id)a3 response:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v7 settings];
  BOOL v9 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v8 count]);

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v27 = v7;
  v10 = [v7 settings];
  id v11 = [v10 countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v29;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v29 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        id v16 = [v15 value];

        if (v16)
        {
          v17 = [v15 key];
          v18 = [v9 objectForKeyedSubscript:v17];

          if (!v18)
          {
            v18 = +[NSMutableArray array];
            unsigned __int8 v19 = [v15 key];
            [v9 setObject:v18 forKeyedSubscript:v19];
          }
          v20 = [v15 value];
          [v18 addObject:v20];

          BOOL v21 = [v15 key];
          [(MBCKRemoteConfiguration *)self persistValuesIfNeeded:v18 forKey:v21 account:v6];
        }
      }
      id v12 = [v10 countByEnumeratingWithState:&v28 objects:v34 count:16];
    }
    while (v12);
  }

  v22 = MBGetDefaultLog();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v33 = v9;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Merged remote configuration: %@", buf, 0xCu);
    _MBLog();
  }

  objc_storeStrong((id *)&self->_configuration, v9);
  if ([(NSDictionary *)self->_configuration count])
  {
    v23 = [v6 persona];
    [v23 setPreferencesValue:v9 forKey:@"RemoteConfiguration"];
    v24 = +[NSDate now];
    v25 = [v24 dateByAddingTimeInterval:86400.0];
    [v23 setPreferencesValue:v25 forKey:@"RemoteConfigurationExpiration"];

    v26 = MBBuildVersion();
    [v23 setPreferencesValue:v26 forKey:@"RemoteConfigurationBuildVersion"];
  }
}

- (void)resetCachedConfigurationForAccount:(id)a3
{
  id v4 = a3;
  v5 = MBGetDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Resetting remote configuration", v8, 2u);
    _MBLog();
  }

  configuration = self->_configuration;
  self->_configuration = 0;

  if (v4) {
    [v4 persona];
  }
  else {
  id v7 = +[MBPersona personalPersonaWithError:0];
  }
  [v7 setPreferencesValue:0 forKey:@"RemoteConfiguration"];
  [v7 setPreferencesValue:0 forKey:@"RemoteConfigurationExpiration"];
  [v7 setPreferencesValue:0 forKey:@"RemoteConfigurationBuildVersion"];
}

- (void)persistValuesIfNeeded:(id)a3 forKey:(id)a4 account:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 count])
  {
    if ((unint64_t)[v8 count] >= 2)
    {
      id v11 = MBGetDefaultLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v15 = v9;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Duplicate value for persisted remote configuration setting '%{public}@' -- arbitrarily picking one of the values", buf, 0xCu);
        id v13 = v9;
        _MBLog();
      }
    }
    id v12 = objc_msgSend(v8, "firstObject", v13);
    [(MBCKRemoteConfiguration *)self persistValueIfNeeded:v12 forKey:v9 account:v10];
  }
}

- (void)persistValueIfNeeded:(id)a3 forKey:(id)a4 account:(id)a5
{
  id v10 = a3;
  id v8 = a4;
  id v9 = a5;
  if (sub_1001AC19C(v8)) {
    [(MBCKRemoteConfiguration *)self persistValueForKey:v8 value:v10 account:v9];
  }
}

- (void)persistValueForKey:(id)a3 value:(id)a4 account:(id)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = [a5 persona];
  [v9 setPreferencesValue:v7 forKey:v8];
}

- (id)persistedValueForKey:(id)a3 account:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (sub_1001AC19C(v5))
  {
    id v7 = [v6 persona];
    id v8 = [v7 copyPreferencesValueForKey:v5 class:objc_opt_class()];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)valueForKey:(id)a3 account:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MBCKRemoteConfiguration *)self persistedValueForKey:v6 account:v7];
  id v9 = v8;
  if (v8)
  {
    id v10 = v8;
    goto LABEL_25;
  }
  id v11 = [(MBCKRemoteConfiguration *)self _allValuesForKey:v6 account:v7];
  if (!v11) {
    goto LABEL_23;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ((unint64_t)[v11 count] >= 2)
    {
      id v12 = MBGetDefaultLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v17 = v6;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Duplicate value for remote configuration setting '%{public}@' -- arbitrarily picking one of the values", buf, 0xCu);
        id v15 = v6;
        _MBLog();
      }
    }
    id v10 = [v11 firstObject];
    if (!v10) {
      goto LABEL_24;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_24;
    }
    if (MBIsInternalInstall()
      && !dword_1004825F4
      && !atomic_fetch_add_explicit(&dword_1004825F4, 1u, memory_order_relaxed))
    {
      id v13 = MBGetDefaultLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138543618;
        id v17 = v6;
        __int16 v18 = 2114;
        unsigned __int8 v19 = v10;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_FAULT, "Unexpected first value for %{public}@: %{public}@ (remote configuration)", buf, 0x16u);
        _MBLog();
      }
    }
  }
  else
  {
    if (!MBIsInternalInstall()
      || dword_1004825F0
      || atomic_fetch_add_explicit(&dword_1004825F0, 1u, memory_order_relaxed))
    {
      goto LABEL_23;
    }
    id v10 = MBGetDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v17 = v6;
      __int16 v18 = 2114;
      unsigned __int8 v19 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_FAULT, "Unexpected value for %{public}@: %{public}@ (remote configuration)", buf, 0x16u);
      _MBLog();
    }
  }

LABEL_23:
  id v10 = 0;
LABEL_24:

LABEL_25:
  return v10;
}

- (id)_allValuesForKey:(id)a3 account:(id)a4
{
  id v6 = a3;
  id v7 = [a4 persona];
  id v8 = (NSDictionary *)[v7 copyPreferencesValueForKey:@"RemoteConfiguration" class:objc_opt_class()];
  configuration = self->_configuration;
  self->_configuration = v8;

  id v10 = [(MBCKRemoteConfiguration *)self configuration];

  if (!v10)
  {
    id v11 = MBGetDefaultLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)id v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Remote configuration hasn't been loaded -- using default", v15, 2u);
      _MBLog();
    }
  }
  id v12 = [(MBCKRemoteConfiguration *)self configuration];
  id v13 = [v12 objectForKeyedSubscript:v6];

  return v13;
}

- (BOOL)allowSnapshotFormatSelectionOnGMForAccount:(id)a3
{
  v3 = [(MBCKRemoteConfiguration *)self valueForKey:@"AllowRecordModelSelectionOnGM" account:a3];
  unsigned __int8 v4 = [v3 BOOLValue];

  return v4;
}

- (int64_t)snapshotFormatForBackupWithAccount:(id)a3
{
  v3 = [(MBCKRemoteConfiguration *)self valueForKey:@"BackupRecordModelSelection" account:a3];
  if ([v3 isEqualToString:@"Lightrail"])
  {
    int64_t v4 = 3;
  }
  else if ([v3 isEqualToString:@"DualWriteDirectoryAndFile"])
  {
    int64_t v4 = 2;
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

- (id)shouldRestoreUsingFileListsForAccount:(id)a3
{
  v3 = [(MBCKRemoteConfiguration *)self valueForKey:@"RestoreRecordModelSelection" account:a3];
  int64_t v4 = v3;
  if (v3)
  {
    id v5 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 isEqualToString:@"Lightrail"]);
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (BOOL)backupVerificationEnabledForAccount:(id)a3
{
  v3 = [(MBCKRemoteConfiguration *)self valueForKey:@"BackupVerificationEnabled" account:a3];
  unsigned __int8 v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)restoreVerificationEnabledForAccount:(id)a3
{
  v3 = [(MBCKRemoteConfiguration *)self valueForKey:@"RestoreVerificationEnabled" account:a3];
  unsigned __int8 v4 = [v3 BOOLValue];

  return v4;
}

- (id)dryRestoreConfigurationForAccount:(id)a3
{
  return [(MBCKRemoteConfiguration *)self valueForKey:@"DryRestoreConfiguration" account:a3];
}

- (NSDictionary)configuration
{
  return self->_configuration;
}

- (MBCKCodeOperator)operator
{
  return self->_operator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operator, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end