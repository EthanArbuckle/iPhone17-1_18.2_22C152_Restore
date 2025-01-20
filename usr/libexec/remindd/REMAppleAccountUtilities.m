@interface REMAppleAccountUtilities
- (id)_applicationDocumentsURLForPersonaIdentifier:(id)a3 accountIdentifier:(id)a4;
- (id)applicationDocumentsURLForAccountIdentifier:(id)a3;
- (id)reminderDataContainerURLForAccountIdentifier:(id)a3;
- (id)status;
- (id)unsafeUntilSystemReady_allICloudAccountsWithCloudKitEnabled;
- (void)_unsetMigrationFlagsWithACAccount:(id)a3 inStore:(id)a4 completionHandler:(id)a5;
@end

@implementation REMAppleAccountUtilities

- (id)applicationDocumentsURLForAccountIdentifier:(id)a3
{
  id v4 = a3;
  if (+[RDPaths isDataSeparationEnabled])
  {
    v5 = (__CFString *)v4;
    v6 = v5;
    if (v5) {
      v7 = v5;
    }
    else {
      v7 = @"___REMAccountIdentifier_NIL___";
    }
    uint64_t v24 = 0;
    v25 = &v24;
    uint64_t v26 = 0x3032000000;
    v27 = sub_1000045EC;
    v28 = sub_1000045FC;
    id v29 = 0;
    if (qword_100922850 != -1) {
      dispatch_once(&qword_100922850, &stru_1008ADAA0);
    }
    id v8 = (id)qword_100922848;
    objc_sync_enter(v8);
    uint64_t v9 = [(id)qword_100922848 objectForKeyedSubscript:v7];
    v10 = (void *)v25[5];
    v25[5] = v9;

    if (v25[5])
    {
      int v11 = 1;
    }
    else
    {
      v16 = _NSConcreteStackBlock;
      uint64_t v17 = 3221225472;
      v18 = sub_100004640;
      v19 = &unk_1008ADAC8;
      v23 = &v24;
      v20 = self;
      v21 = v6;
      v22 = v7;
      [(REMAppleAccountUtilities *)self performBlockInPersonaContextForAccountIdentifier:v21 block:&v16];

      int v11 = 0;
    }
    v13 = +[REMLog utility];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      uint64_t v14 = v25[5];
      *(_DWORD *)buf = 67109634;
      int v31 = v11;
      __int16 v32 = 2114;
      v33 = v6;
      __int16 v34 = 2114;
      uint64_t v35 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "applicationDocumentsURLForAccountIdentifier: Look up result {cacheHit: %d, accountIdentifier: %{public}@, applicationDocumentsURL: %{public}@}", buf, 0x1Cu);
    }

    objc_sync_exit(v8);
    id v12 = (id)v25[5];
    _Block_object_dispose(&v24, 8);
  }
  else
  {
    id v12 = +[REMPaths legacy_applicationDocumentsURL];
  }

  return v12;
}

- (id)reminderDataContainerURLForAccountIdentifier:(id)a3
{
  v3 = [(REMAppleAccountUtilities *)self applicationDocumentsURLForAccountIdentifier:a3];
  id v4 = +[RDPaths reminderDataContainerURLWithAppDocumentsURL:v3];

  return v4;
}

- (id)_applicationDocumentsURLForPersonaIdentifier:(id)a3 accountIdentifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = +[REMPaths URLForGroupContainerWithIdentifier:REMAppGroupBundleIdentifier];
  if (!v7)
  {
    id v8 = +[REMLog utility];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100748F84((uint64_t)v5, (uint64_t)v6, v8);
    }

    v7 = +[REMPaths legacy_applicationDocumentsURL];
  }

  return v7;
}

- (id)unsafeUntilSystemReady_allICloudAccountsWithCloudKitEnabled
{
  v3 = +[NSMutableArray array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = [(REMAppleAccountUtilities *)self accountStore];
  id v5 = [(REMAppleAccountUtilities *)self accountStore];
  id v6 = [v5 accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierCloudKit];
  v7 = [v4 accountsWithAccountType:v6];

  id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = [*(id *)(*((void *)&v14 + 1) + 8 * i) displayAccount];
        [v3 addObject:v12];
      }
      id v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  return v3;
}

- (id)status
{
  v3 = +[NSMutableDictionary dictionary];
  v47 = self;
  [(REMAppleAccountUtilities *)self unsafeUntilSystemReady_allICloudACAccounts];
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v49 = [obj countByEnumeratingWithState:&v53 objects:v57 count:16];
  if (v49)
  {
    uint64_t v48 = *(void *)v54;
    uint64_t v46 = REMACAccountPropertyDidChooseToMigrate;
    uint64_t v45 = REMACAccountPropertyDidFinishMigration;
    uint64_t v43 = ACAccountPropertyPersonaIdentifier;
    uint64_t v44 = kAccountDataclassReminders;
    uint64_t v42 = AAAccountClassBasic;
    do
    {
      for (i = 0; i != v49; i = (char *)i + 1)
      {
        if (*(void *)v54 != v48) {
          objc_enumerationMutation(obj);
        }
        id v5 = *(void **)(*((void *)&v53 + 1) + 8 * i);
        id v6 = [v5 identifier];
        if (v6)
        {
          uint64_t v7 = [v5 objectForKeyedSubscript:v46];
          uint64_t v8 = [v5 objectForKeyedSubscript:v45];
          unsigned int v9 = [v5 rem_isManagedAppleID];
          unsigned int v50 = [v5 isEnabledForDataclass:v44];
          uint64_t v10 = [v5 shortDebugName];
          int v11 = +[NSString stringWithFormat:@"%@.description", v6];
          [v3 setObject:v10 forKeyedSubscript:v11];

          id v12 = [v5 aa_accountClass];
          v13 = +[NSString stringWithFormat:@"%@.aa_accountClass", v6];
          [v3 setObject:v12 forKeyedSubscript:v13];

          long long v14 = [v5 aa_personID];
          long long v15 = +[NSString stringWithFormat:@"%@.aa_personID", v6];
          [v3 setObject:v14 forKeyedSubscript:v15];

          long long v16 = [v5 aa_altDSID];
          long long v17 = +[NSString stringWithFormat:@"%@.aa_altDSID", v6];
          [v3 setObject:v16 forKeyedSubscript:v17];

          v52 = (void *)v7;
          v18 = +[NSString stringWithFormat:@"%@", v7];
          v19 = +[NSString stringWithFormat:@"%@.didChooseToMigrate", v6];
          [v3 setObject:v18 forKeyedSubscript:v19];

          v51 = (void *)v8;
          v20 = +[NSString stringWithFormat:@"%@", v8];
          v21 = +[NSString stringWithFormat:@"%@.didFinishMigration", v6];
          [v3 setObject:v20 forKeyedSubscript:v21];

          v22 = +[NSString stringWithFormat:@"%d", v9];
          v23 = +[NSString stringWithFormat:@"%@.isManagedAppleID", v6];
          [v3 setObject:v22 forKeyedSubscript:v23];

          uint64_t v24 = +[NSString stringWithFormat:@"%d", v50];
          v25 = +[NSString stringWithFormat:@"%@.isEnabledForDataclass", v6];
          [v3 setObject:v24 forKeyedSubscript:v25];

          uint64_t v26 = [v5 accountPropertyForKey:v43];
          v27 = [v5 identifier];
          v28 = [(REMAppleAccountUtilities *)v47 applicationDocumentsURLForAccountIdentifier:v27];

          if (v26) {
            CFStringRef v29 = v26;
          }
          else {
            CFStringRef v29 = @"NIL";
          }
          v30 = +[NSString stringWithFormat:@"%@.personaIdentifier", v6];
          [v3 setObject:v29 forKeyedSubscript:v30];

          int v31 = [v28 absoluteString];
          __int16 v32 = +[NSString stringWithFormat:@"%@", v31];
          v33 = +[NSString stringWithFormat:@"%@.applicationDocumentsURL", v6];
          [v3 setObject:v32 forKeyedSubscript:v33];

          if ((objc_msgSend(v5, "aa_isAccountClass:", v42) & 1) == 0)
          {
            unsigned int v34 = [v5 rem_eligibleForAutoCloudKitMigration];
            unsigned int v35 = [v5 rem_isEligibleForCloudKitReminders];
            v36 = +[NSString stringWithFormat:@"%d", v34];
            v37 = +[NSString stringWithFormat:@"%@.eligibleForAutoCloudKitMigration", v6];
            [v3 setObject:v36 forKeyedSubscript:v37];

            v38 = +[NSString stringWithFormat:@"%d", v35];
            v39 = +[NSString stringWithFormat:@"%@.isEligibleForCloudKitReminders", v6];
            [v3 setObject:v38 forKeyedSubscript:v39];
          }
        }
      }
      id v49 = [obj countByEnumeratingWithState:&v53 objects:v57 count:16];
    }
    while (v49);
  }

  return v3;
}

- (void)_unsetMigrationFlagsWithACAccount:(id)a3 inStore:(id)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  uint64_t v10 = +[REMLog utility];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_100754924(v7, v10);
  }

  [v7 setObject:0 forKeyedSubscript:REMACAccountPropertyDidChooseToMigrate];
  [v7 setObject:0 forKeyedSubscript:REMACAccountPropertyDidFinishMigration];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10006A144;
  v13[3] = &unk_1008B0578;
  id v14 = v7;
  id v15 = v8;
  id v11 = v8;
  id v12 = v7;
  [v9 saveAccount:v12 withCompletionHandler:v13];
}

@end