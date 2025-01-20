@interface ICDAccountManagerState
+ (id)restoredStatedWithFallbackAccounts:(id)a3;
+ (id)stateForAccounts:(id)a3 baseConfiguration:(id)a4;
- (BOOL)isEqual:(id)a3;
- (ICConnectionConfiguration)activeConfiguration;
- (NSSet)supportedConfigurations;
- (NSSet)supportedConfigurationsDSIDs;
- (NSString)activeConfigurationDSID;
- (id)_configurationForAccount:(id)a3 baseConfiguration:(id)a4;
- (id)_initWithAccounts:(id)a3 activeAccount:(id)a4 baseConfiguration:(id)a5;
- (id)_userIdentityForAccount:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)_updateSupportedConfigurationsDSIDs;
- (void)_updateSupportedConfigurationsWithAccounts:(id)a3 activeConfiguration:(id)a4;
- (void)save;
- (void)setActiveConfiguration:(id)a3;
- (void)setActiveConfigurationDSID:(id)a3;
- (void)setSupportedConfigurations:(id)a3;
- (void)setSupportedConfigurationsDSIDs:(id)a3;
@end

@implementation ICDAccountManagerState

- (NSSet)supportedConfigurations
{
  return self->_supportedConfigurations;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeConfigurationDSID, 0);
  objc_storeStrong((id *)&self->_activeConfiguration, 0);
  objc_storeStrong((id *)&self->_supportedConfigurationsDSIDs, 0);

  objc_storeStrong((id *)&self->_supportedConfigurations, 0);
}

- (void)setActiveConfigurationDSID:(id)a3
{
}

- (NSString)activeConfigurationDSID
{
  return self->_activeConfigurationDSID;
}

- (void)setActiveConfiguration:(id)a3
{
}

- (ICConnectionConfiguration)activeConfiguration
{
  return self->_activeConfiguration;
}

- (void)setSupportedConfigurationsDSIDs:(id)a3
{
}

- (NSSet)supportedConfigurationsDSIDs
{
  return self->_supportedConfigurationsDSIDs;
}

- (void)setSupportedConfigurations:(id)a3
{
}

- (id)_configurationForAccount:(id)a3 baseConfiguration:(id)a4
{
  id v6 = a4;
  if (a3)
  {
    v7 = [(ICDAccountManagerState *)self _userIdentityForAccount:a3];
    if (v6) {
      id v8 = v6;
    }
    else {
      id v8 = (id)objc_opt_new();
    }
    v10 = v8;
    v9 = +[ICConnectionConfiguration configurationFromSourceConfiguration:v8 userIdentity:v7];
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_userIdentityForAccount:(id)a3
{
  if (a3)
  {
    v3 = [a3 accountDSID];
    v4 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v3 longLongValue]);
    v5 = +[ICUserIdentity specificAccountWithDSID:v4];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_updateSupportedConfigurationsDSIDs
{
  id v3 = objc_alloc((Class)NSMutableSet);
  v4 = [(ICDAccountManagerState *)self supportedConfigurations];
  id v5 = objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v4, "count"));

  id v6 = [(ICDAccountManagerState *)self supportedConfigurations];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10007D490;
  v9[3] = &unk_1001BBAD8;
  id v10 = v5;
  id v7 = v5;
  [v6 enumerateObjectsUsingBlock:v9];

  id v8 = [v7 copy];
  [(ICDAccountManagerState *)self setSupportedConfigurationsDSIDs:v8];
}

- (void)_updateSupportedConfigurationsWithAccounts:(id)a3 activeConfiguration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (MSVDeviceSupportsMultipleLibraries())
  {
    id v8 = objc_alloc_init((Class)NSMutableSet);
    id v9 = [v7 copy];
    id v10 = v9;
    if (v9) {
      id v11 = v9;
    }
    else {
      id v11 = (id)objc_opt_new();
    }
    v15 = v11;

    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10007D77C;
    v20[3] = &unk_1001BBAB0;
    v20[4] = self;
    id v21 = v15;
    id v16 = v8;
    id v22 = v16;
    id v17 = v15;
    [v6 enumerateObjectsUsingBlock:v20];
    v18 = os_log_create("com.apple.amp.itunescloudd", "Accounts");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      id v19 = [v16 count];
      *(_DWORD *)buf = 134218240;
      v24 = self;
      __int16 v25 = 2048;
      id v26 = v19;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "ICDAccountManagerState %p - Supported configurations contains %lu configurations", buf, 0x16u);
    }

    [(ICDAccountManagerState *)self setSupportedConfigurations:v16];
  }
  else
  {
    v12 = os_log_create("com.apple.amp.itunescloudd", "Accounts");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = [v7 userIdentity];
      v14 = [v13 accountDSID];
      *(_DWORD *)buf = 134218242;
      v24 = self;
      __int16 v25 = 2112;
      id v26 = v14;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "ICDAccountManagerState %p - Supported configurations is active configuration - dsid=%@", buf, 0x16u);
    }
    if (v7) {
      +[NSSet setWithObject:v7];
    }
    else {
    id v16 = +[NSSet set];
    }
    [(ICDAccountManagerState *)self setSupportedConfigurations:v16];
  }
}

- (id)_initWithAccounts:(id)a3 activeAccount:(id)a4 baseConfiguration:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)ICDAccountManagerState;
  id v11 = [(ICDAccountManagerState *)&v20 init];
  v12 = v11;
  if (v11)
  {
    uint64_t v13 = [(ICDAccountManagerState *)v11 _configurationForAccount:v9 baseConfiguration:v10];
    activeConfiguration = v12->_activeConfiguration;
    v12->_activeConfiguration = (ICConnectionConfiguration *)v13;

    v15 = [(ICConnectionConfiguration *)v12->_activeConfiguration userIdentity];
    id v16 = [v15 accountDSID];
    id v17 = (NSString *)[v16 copy];
    activeConfigurationDSID = v12->_activeConfigurationDSID;
    v12->_activeConfigurationDSID = v17;

    [(ICDAccountManagerState *)v12 _updateSupportedConfigurationsWithAccounts:v8 activeConfiguration:v12->_activeConfiguration];
    [(ICDAccountManagerState *)v12 _updateSupportedConfigurationsDSIDs];
  }

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v5)
  {
    id v6 = [(ICDAccountManagerState *)self activeConfiguration];
    id v7 = [v6 copyWithZone:a3];
    id v8 = (void *)v5[3];
    v5[3] = v7;

    id v9 = [(ICDAccountManagerState *)self activeConfigurationDSID];
    id v10 = [v9 copyWithZone:a3];
    id v11 = (void *)v5[4];
    v5[4] = v10;

    v12 = [(ICDAccountManagerState *)self supportedConfigurations];
    id v13 = [v12 copyWithZone:a3];
    v14 = (void *)v5[1];
    v5[1] = v13;

    v15 = [(ICDAccountManagerState *)self supportedConfigurationsDSIDs];
    id v16 = [v15 copyWithZone:a3];
    id v17 = (void *)v5[2];
    v5[2] = v16;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (ICDAccountManagerState *)a3;
  if (self == v4)
  {
    unsigned __int8 v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      id v6 = [(ICDAccountManagerState *)v5 supportedConfigurationsDSIDs];
      id v7 = [(ICDAccountManagerState *)self supportedConfigurationsDSIDs];
      if ([v6 isEqualToSet:v7])
      {
        id v8 = [(ICDAccountManagerState *)v5 activeConfigurationDSID];
        id v9 = [(ICDAccountManagerState *)self activeConfigurationDSID];
        if (v8 == v9) {
          unsigned __int8 v10 = 1;
        }
        else {
          unsigned __int8 v10 = [v8 isEqual:v9];
        }
      }
      else
      {
        unsigned __int8 v10 = 0;
      }
    }
    else
    {
      unsigned __int8 v10 = 0;
    }
  }

  return v10;
}

- (id)description
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  v4 = +[NSString stringWithFormat:@"ICDAccountManagerState %p:", self];
  [v3 addObject:v4];

  id v5 = [(ICDAccountManagerState *)self activeConfigurationDSID];

  if (v5)
  {
    id v6 = [(ICDAccountManagerState *)self activeConfigurationDSID];
    id v7 = +[NSString stringWithFormat:@"[active dsid=%@]", v6];
    [v3 addObject:v7];
  }
  else
  {
    [v3 addObject:@"[no active dsid]"];
  }
  id v8 = [(ICDAccountManagerState *)self supportedConfigurationsDSIDs];
  id v9 = [v8 count];

  if (v9)
  {
    unsigned __int8 v10 = [(ICDAccountManagerState *)self supportedConfigurationsDSIDs];
    id v11 = [v10 allObjects];
    v12 = [v11 componentsJoinedByString:@","];
    id v13 = +[NSString stringWithFormat:@"[supported dsids=%@]", v12];
    [v3 addObject:v13];
  }
  else
  {
    [v3 addObject:@"[no supported dsids]"];
  }
  v14 = [v3 componentsJoinedByString:@" "];

  return v14;
}

- (void)save
{
  id v3 = os_log_create("com.apple.amp.itunescloudd", "Accounts");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 134218242;
    unsigned __int8 v10 = self;
    __int16 v11 = 2112;
    v12 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "ICDAccountManagerState %p - Saving - %@", (uint8_t *)&v9, 0x16u);
  }

  v4 = [(ICDAccountManagerState *)self activeConfigurationDSID];
  id v5 = +[ICDDefaults daemonDefaults];
  [v5 setKnownActiveAccountDSID:v4];

  id v6 = [(ICDAccountManagerState *)self supportedConfigurationsDSIDs];
  id v7 = [v6 allObjects];
  id v8 = +[ICDDefaults daemonDefaults];
  [v8 setKnownAccountDSIDs:v7];
}

+ (id)stateForAccounts:(id)a3 baseConfiguration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = sub_10007E014;
  id v22 = sub_10007E024;
  id v23 = 0;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10007E02C;
  v14[3] = &unk_1001BBA88;
  id v17 = a1;
  id v8 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v6, "count"));
  id v15 = v8;
  id v16 = &v18;
  [v6 enumerateObjectsUsingBlock:v14];
  int v9 = os_log_create("com.apple.amp.itunescloudd", "Accounts");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = v19[5];
    *(_DWORD *)buf = 134218498;
    id v25 = a1;
    __int16 v26 = 2112;
    uint64_t v27 = v10;
    __int16 v28 = 2112;
    id v29 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "ICDAccountManagerState %p - stateForAccounts:baseConfiguration: - activeAccount=%@ - supportedAccounts=%@", buf, 0x20u);
  }

  id v11 = objc_alloc((Class)a1);
  id v12 = [v11 _initWithAccounts:v8 activeAccount:v19[5] baseConfiguration:v7];

  _Block_object_dispose(&v18, 8);

  return v12;
}

+ (id)restoredStatedWithFallbackAccounts:(id)a3
{
  id v4 = a3;
  id v5 = +[ICDDefaults daemonDefaults];
  id v6 = [v5 knownActiveAccountDSID];

  id v7 = +[ICDDefaults daemonDefaults];
  id v8 = [v7 knownAccountDSIDs];
  int v9 = +[NSSet setWithArray:v8];

  id v10 = [v9 count];
  id v11 = os_log_create("com.apple.amp.itunescloudd", "Accounts");
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (v12)
    {
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = a1;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "ICDAccountManagerState %p - restoredStatedWithAccountStore: - Restoring from known accounts", (uint8_t *)&buf, 0xCu);
    }

    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v27 = 0x3032000000;
    __int16 v28 = sub_10007E014;
    id v29 = sub_10007E024;
    id v30 = 0;
    id v13 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v9, "count"));
    uint64_t v18 = _NSConcreteStackBlock;
    uint64_t v19 = 3221225472;
    uint64_t v20 = sub_10007E440;
    id v21 = &unk_1001BBA60;
    id v22 = v9;
    id v14 = v13;
    id v23 = v14;
    id v24 = v6;
    p_long long buf = &buf;
    [v4 enumerateObjectsUsingBlock:&v18];
    id v15 = objc_alloc((Class)a1);
    id v16 = objc_msgSend(v15, "_initWithAccounts:activeAccount:baseConfiguration:", v14, *(void *)(*((void *)&buf + 1) + 40), 0, v18, v19, v20, v21);

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    if (v12)
    {
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = a1;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "ICDAccountManagerState %p - restoredStatedWithAccountStore: - Restoring from all accounts [no known accounts]", (uint8_t *)&buf, 0xCu);
    }

    id v16 = [(id)objc_opt_class() stateForAccounts:v4 baseConfiguration:0];
  }

  return v16;
}

@end