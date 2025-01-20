@interface MBPrebuddyDisabledCategoriesManager
- (BOOL)_isSupportedBackupDomain:(id)a3;
- (BOOL)_isSupportedDataclassForDevice:(id)a3;
- (id)_disabledSyncDataclassesForAccount:(id)a3;
- (id)disabledBackupDomains:(BOOL)a3;
- (id)disabledSyncDataclasses:(id *)a3;
- (void)_enableKeychainSync:(id)a3 completion:(id)a4;
- (void)_saveEnabledSyncDataclasses:(id)a3;
- (void)enableDisabledBackupDomains:(BOOL)a3;
- (void)enableDisabledSyncCategories:(id)a3 completion:(id)a4;
@end

@implementation MBPrebuddyDisabledCategoriesManager

- (void)enableDisabledSyncCategories:(id)a3 completion:(id)a4
{
  v6 = a3;
  id v7 = a4;
  v8 = +[ACAccountStore defaultStore];
  v9 = objc_msgSend(v8, "aa_primaryAppleAccount");
  if (v9)
  {
    v10 = [(MBPrebuddyDisabledCategoriesManager *)self _disabledSyncDataclassesForAccount:v9];
    v11 = v10;
    if (v10)
    {
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id v12 = [v10 countByEnumeratingWithState:&v28 objects:v37 count:16];
      if (v12)
      {
        id v13 = v12;
        uint64_t v14 = *(void *)v29;
        do
        {
          for (i = 0; i != v13; i = (char *)i + 1)
          {
            if (*(void *)v29 != v14) {
              objc_enumerationMutation(v11);
            }
            [v9 setEnabled:1 forDataclass:*(void *)(*((void *)&v28 + 1) + 8 * i)];
          }
          id v13 = [v11 countByEnumeratingWithState:&v28 objects:v37 count:16];
        }
        while (v13);
      }
      id v27 = 0;
      v16 = [v8 dataclassActionsForAccountSave:v9 error:&v27];
      id v17 = v27;
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_10016B088;
      v25[3] = &unk_100414BC0;
      id v26 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v16, "count"));
      id v18 = v26;
      [v16 enumerateKeysAndObjectsUsingBlock:v25];
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_10016B11C;
      v20[3] = &unk_100414C10;
      id v24 = v7;
      id v21 = v11;
      v22 = self;
      v23 = v6;
      [v8 saveAccount:v9 withDataclassActions:v18 completion:v20];
    }
    else
    {
      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472;
      v32[2] = sub_10016B070;
      v32[3] = &unk_100411B88;
      id v33 = v7;
      dispatch_async(v6, v32);
      v16 = v33;
    }
  }
  else
  {
    v19 = MBGetDefaultLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "enableDisabledSyncCategories: couldn't get primary Apple Account", buf, 2u);
      _MBLog();
    }

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10016AFF4;
    block[3] = &unk_100411B88;
    id v35 = v7;
    dispatch_async(v6, block);
    v11 = v35;
  }
}

- (void)_saveEnabledSyncDataclasses:(id)a3
{
  id v3 = a3;
  v4 = MBGetDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v8 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Saving enabled sync data classes: %@", buf, 0xCu);
    _MBLog();
  }

  id v5 = objc_alloc_init((Class)MBManager);
  v6 = [v3 allObjects];
  [v5 saveSyncSettingsEnabledForMegaBackup:v6];
}

- (void)_enableKeychainSync:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = MBGetDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Enabling Keychain Sync.", buf, 2u);
    _MBLog();
  }

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10016B60C;
  v10[3] = &unk_100414C60;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  +[CDPKeychainSync setUserVisibleKeychainSyncEnabled:1 withCompletion:v10];
}

- (void)enableDisabledBackupDomains:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = objc_alloc_init((Class)MBManager);
  id v6 = [(MBPrebuddyDisabledCategoriesManager *)self disabledBackupDomains:v3];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = [*(id *)(*((void *)&v13 + 1) + 8 * (void)v10) domainName];
        [v5 setBackupEnabled:1 forDomainName:v11];

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v13 objects:v19 count:16];
    }
    while (v8);
  }
  id v12 = MBGetDefaultLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v18 = v6;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Saving enabled backup domains: %@", buf, 0xCu);
    _MBLog();
  }

  [v5 saveBackupDomainsEnabledForMegaBackup:v6];
}

- (id)disabledBackupDomains:(BOOL)a3
{
  id v5 = +[ACAccountStore defaultStore];
  id v6 = objc_msgSend(v5, "aa_primaryAppleAccount");

  LOBYTE(v5) = [v6 isEnabledForDataclass:ACAccountDataclassCloudPhotos];
  id v7 = objc_alloc_init((Class)MBManager);
  id v8 = [v7 disabledDomainInfos];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10016BA94;
  v12[3] = &unk_100414C88;
  char v13 = (char)v5;
  BOOL v14 = a3;
  v12[4] = self;
  uint64_t v9 = +[NSPredicate predicateWithBlock:v12];
  v10 = [v8 filteredArrayUsingPredicate:v9];

  return v10;
}

- (BOOL)_isSupportedBackupDomain:(id)a3
{
  BOOL v3 = [a3 domainName];
  unsigned __int8 v4 = [&off_10043B448 containsObject:v3];

  return v4 ^ 1;
}

- (id)disabledSyncDataclasses:(id *)a3
{
  id v5 = +[ACAccountStore defaultStore];
  id v6 = objc_msgSend(v5, "aa_primaryAppleAccount");
  if (v6)
  {
    id v7 = [(MBPrebuddyDisabledCategoriesManager *)self _disabledSyncDataclassesForAccount:v6];
  }
  else
  {
    id v8 = MBGetDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "enableDisabledSyncCategories: couldn't get primary Apple Account", v10, 2u);
      _MBLog();
    }

    if (a3)
    {
      +[NSError errorWithDomain:@"MBMegaBackupEligibilityErrorDomain" code:1 userInfo:0];
      id v7 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v7 = 0;
    }
  }

  return v7;
}

- (id)_disabledSyncDataclassesForAccount:(id)a3
{
  id v4 = a3;
  v17[0] = ACAccountDataclassBookmarks;
  v17[1] = ACAccountDataclassNews;
  v17[2] = ACAccountDataclassStocks;
  v17[3] = ACAccountDataclassHome;
  v17[4] = ACAccountDataclassHealth;
  v17[5] = ACAccountDataclassSiri;
  v17[6] = ACAccountDataclassShoebox;
  v17[7] = ACAccountDataclassKeychainSync;
  v17[8] = ACAccountDataclassMoments;
  id v5 = +[NSArray arrayWithObjects:v17 count:9];
  id v6 = +[NSSet setWithArray:v5];

  id v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472;
  char v13 = sub_10016BEC4;
  BOOL v14 = &unk_100414CB0;
  long long v15 = self;
  id v16 = v4;
  id v7 = v4;
  id v8 = +[NSPredicate predicateWithBlock:&v11];
  uint64_t v9 = objc_msgSend(v6, "filteredSetUsingPredicate:", v8, v11, v12, v13, v14, v15);

  return v9;
}

- (BOOL)_isSupportedDataclassForDevice:(id)a3
{
  id v3 = a3;
  BOOL v6 = 1;
  if (MGGetBoolAnswer())
  {
    v8[0] = ACAccountDataclassHealth;
    v8[1] = ACAccountDataclassShoebox;
    id v4 = +[NSArray arrayWithObjects:v8 count:2];
    unsigned __int8 v5 = [v4 containsObject:v3];

    if (v5) {
      BOOL v6 = 0;
    }
  }

  return v6;
}

@end