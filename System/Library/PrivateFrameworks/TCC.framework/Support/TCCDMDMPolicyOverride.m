@interface TCCDMDMPolicyOverride
+ (id)MDMOverridesFilePath;
- (TCCDMDMPolicyOverride)init;
- (void)addOrUpdateRecordsForCurrentPolicy;
- (void)parsePlist;
- (void)resetDatabaseFlagsForRecordsRemovedFromPreviousPolicy;
- (void)updateDatabase;
- (void)updateDatabaseForPolicyAuthorizationRecord:(id)a3 service:(id)a4;
@end

@implementation TCCDMDMPolicyOverride

+ (id)MDMOverridesFilePath
{
  return @"/Library/Application Support/com.apple.TCC/MDMOverrides.plist";
}

- (TCCDMDMPolicyOverride)init
{
  v11.receiver = self;
  v11.super_class = (Class)TCCDMDMPolicyOverride;
  v2 = [(TCCDPolicyOverride *)&v11 init];
  if (v2)
  {
    v3 = [(id)objc_opt_class() MDMOverridesFilePath];
    v4 = +[TCCDPolicyOverride useString:v3 orReadFromDefaults:@"sitePolicyOverridePath"];
    [(TCCDPolicyOverride *)v2 setPlistFilePath:v4];

    v5 = dispatch_get_global_queue(0, 0);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100053A98;
    handler[3] = &unk_100095478;
    v6 = v2;
    v10 = v6;
    notify_register_dispatch("com.apple.TCC.configuration-profile-changed", (int *)&unk_1000AC790, v5, handler);
    v7 = v6;
  }
  return v2;
}

- (void)updateDatabaseForPolicyAuthorizationRecord:(id)a3 service:(id)a4
{
  id v5 = a3;
  id v29 = a4;
  v6 = [v5 objectForKeyedSubscript:@"Authorization"];
  v7 = [v5 objectForKeyedSubscript:@"Identifier"];
  v8 = [v5 objectForKeyedSubscript:@"IdentifierType"];
  v9 = [v5 objectForKeyedSubscript:@"CodeRequirementData"];
  if ([v8 isEqualToString:@"bundleID"])
  {
    v10 = v6;
    objc_super v11 = v9;
    uint64_t v12 = 0;
    goto LABEL_5;
  }
  if ([v8 isEqualToString:@"path"])
  {
    v10 = v6;
    objc_super v11 = v9;
    uint64_t v12 = 1;
LABEL_5:
    uint64_t v50 = 0;
    v51 = &v50;
    uint64_t v52 = 0x2020000000;
    char v53 = 0;
    uint64_t v46 = 0;
    v47 = &v46;
    uint64_t v48 = 0x2020000000;
    int v49 = 0;
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472;
    v42[2] = sub_100054118;
    v42[3] = &unk_1000968B0;
    id v13 = v29;
    id v43 = v13;
    id v14 = v7;
    id v44 = v14;
    uint64_t v45 = v12;
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_1000541E8;
    v41[3] = &unk_100095810;
    v41[4] = &v50;
    v41[5] = &v46;
    v9 = v11;
    v6 = v10;
    if (db_eval((uint64_t)"SELECT flags FROM access WHERE service = ? AND client = ? AND client_type = ?", v42, v41))
    {
      v15 = +[TCCDPolicyOverride logHandle];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v26 = [v13 name];
        *(_DWORD *)buf = 138543874;
        v55 = v26;
        __int16 v56 = 2114;
        id v57 = v14;
        __int16 v58 = 2048;
        uint64_t v59 = v12;
        _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Database query for MDM policy authorization record failed: serviceName=%{public}@, identifier=%{public}@, identifier_type=%lld", buf, 0x20u);
      }
      goto LABEL_8;
    }
    if (!*((unsigned char *)v51 + 24))
    {
      if (!v10 || ![v10 isEqualToString:@"AllowStandardUserToSetSystemService"]) {
        goto LABEL_9;
      }
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_100054314;
      v30[3] = &unk_100096900;
      v20 = v13;
      v31 = v20;
      id v21 = v14;
      id v32 = v21;
      uint64_t v34 = v12;
      id v33 = v9;
      int v35 = 12;
      if (db_eval((uint64_t)"INSERT OR REPLACE INTO access   (service, client, client_type, auth_value, auth_reason, auth_version, csreq, policy_id, indirect_object_identifier, flags) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", v30, 0))
      {
        v22 = +[TCCDPolicyOverride logHandle];
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          v28 = [v20 name];
          *(_DWORD *)buf = 138543874;
          v55 = v28;
          __int16 v56 = 2114;
          id v57 = v21;
          __int16 v58 = 2048;
          uint64_t v59 = v12;
          _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Failed to add new database record for MDM policy authorization record: serviceName=%{public}@, identifier=%{public}@, identifier_type=%lld", buf, 0x20u);
        }
      }

      v15 = v31;
      goto LABEL_8;
    }
    unsigned int v16 = *((_DWORD *)v47 + 6);
    if (v10)
    {
      if ([v10 isEqualToString:@"AllowStandardUserToSetSystemService"])
      {
        unsigned int v17 = v16 | 4;
        int v18 = *((_DWORD *)v47 + 6);
LABEL_29:
        if (v17 == v18) {
          goto LABEL_9;
        }
        v36[0] = _NSConcreteStackBlock;
        v36[1] = 3221225472;
        v36[2] = sub_100054230;
        v36[3] = &unk_1000968D8;
        unsigned int v40 = v17;
        v23 = v13;
        v37 = v23;
        id v24 = v14;
        id v38 = v24;
        uint64_t v39 = v12;
        if (db_eval((uint64_t)"UPDATE access SET flags = ? WHERE service = ? AND client = ? AND client_type = ?", v36, 0))
        {
          v25 = +[TCCDPolicyOverride logHandle];
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            v27 = [v23 name];
            *(_DWORD *)buf = 138543874;
            v55 = v27;
            __int16 v56 = 2114;
            id v57 = v24;
            __int16 v58 = 2048;
            uint64_t v59 = v12;
            _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "Failed to update flags on existing database record: serviceName=%{public}@, identifier=%{public}@, identifier_type=%lld", buf, 0x20u);
          }
        }

        v15 = v37;
LABEL_8:

LABEL_9:
        _Block_object_dispose(&v46, 8);
        _Block_object_dispose(&v50, 8);
        goto LABEL_17;
      }
      int v18 = *((_DWORD *)v47 + 6);
    }
    else
    {
      int v18 = *((_DWORD *)v47 + 6);
    }
    unsigned int v17 = v16 & 0xFFFFFFF3;
    if ((v18 & 4) == 0) {
      unsigned int v17 = v16;
    }
    goto LABEL_29;
  }
  v19 = +[TCCDPolicyOverride logHandle];
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
    sub_100054CF4((uint64_t)v8, v19);
  }

LABEL_17:
}

- (void)addOrUpdateRecordsForCurrentPolicy
{
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = [(TCCDPolicyOverride *)self policyAccessByIdentifier];
  id v18 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v18)
  {
    uint64_t v17 = *(void *)v24;
    do
    {
      v3 = 0;
      do
      {
        if (*(void *)v24 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v4 = *(void *)(*((void *)&v23 + 1) + 8 * (void)v3);
        id v5 = [(TCCDPolicyOverride *)self policyAccessByIdentifier];
        v6 = [v5 objectForKeyedSubscript:v4];

        long long v21 = 0u;
        long long v22 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        id v7 = v6;
        id v8 = [v7 countByEnumeratingWithState:&v19 objects:v27 count:16];
        if (v8)
        {
          id v9 = v8;
          uint64_t v10 = *(void *)v20;
          do
          {
            objc_super v11 = 0;
            do
            {
              if (*(void *)v20 != v10) {
                objc_enumerationMutation(v7);
              }
              uint64_t v12 = *(void *)(*((void *)&v19 + 1) + 8 * (void)v11);
              id v13 = +[TCCDPlatform currentPlatform];
              id v14 = [v13 serviceByName:v12];

              v15 = [v7 objectForKeyedSubscript:v12];
              [(TCCDMDMPolicyOverride *)self updateDatabaseForPolicyAuthorizationRecord:v15 service:v14];

              objc_super v11 = (char *)v11 + 1;
            }
            while (v9 != v11);
            id v9 = [v7 countByEnumeratingWithState:&v19 objects:v27 count:16];
          }
          while (v9);
        }

        v3 = (char *)v3 + 1;
      }
      while (v3 != v18);
      id v18 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v18);
  }
}

- (void)resetDatabaseFlagsForRecordsRemovedFromPreviousPolicy
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100054764;
  v4[3] = &unk_1000953C8;
  int v5 = 12;
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1000547AC;
  v2[3] = &unk_100095978;
  v2[4] = self;
  int v3 = 12;
  db_eval((uint64_t)"SELECT service, client, client_type, flags FROM access WHERE flags & ?", v4, v2);
}

- (void)updateDatabase
{
  [(TCCDMDMPolicyOverride *)self resetDatabaseFlagsForRecordsRemovedFromPreviousPolicy];
  [(TCCDMDMPolicyOverride *)self addOrUpdateRecordsForCurrentPolicy];
}

- (void)parsePlist
{
  uint64_t v4 = +[TCCDPolicyOverride logHandle];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = [(TCCDPolicyOverride *)self plistDictionary];
    if (v5)
    {
      v2 = [(TCCDPolicyOverride *)self plistDictionary];
      uint64_t v6 = (uint64_t)[v2 count];
    }
    else
    {
      uint64_t v6 = -1;
    }
    int v14 = 138412546;
    v15 = self;
    __int16 v16 = 2048;
    uint64_t v17 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Override: %@ MDM Plist with %ld entries.", (uint8_t *)&v14, 0x16u);
    if (v5) {
  }
    }
  id v7 = [(TCCDPolicyOverride *)self policyAccessByIdentifier];
  [v7 removeAllObjects];

  id v8 = [(TCCDPolicyOverride *)self plistDictionary];

  if (v8)
  {
    id v9 = [(TCCDPolicyOverride *)self policyAccessByIdentifier];
    uint64_t v10 = [(TCCDPolicyOverride *)self plistDictionary];
    [v9 addEntriesFromDictionary:v10];
  }
  objc_super v11 = +[TCCDPlatform currentPlatform];
  uint64_t v12 = [v11 server];
  unsigned int v13 = objc_msgSend(v12, "macos_isSystemServer");

  if (v13) {
    [(TCCDMDMPolicyOverride *)self updateDatabase];
  }
}

@end