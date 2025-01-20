@interface AccountApplicator
+ (id)supportedConfigurationTypes;
- (AccountAdapter)adapter;
- (AccountApplicator)init;
- (AccountApplicator)initWithAdapter:(id)a3;
- (void)_createAccountIfNeededAndApplyProperties:(id)a3 configuration:(id)a4 properties:(id)a5 completionHandler:(id)a6;
- (void)_invalidateAllConfigurations:(id)a3 completionHandler:(id)a4;
- (void)applyConfigurations:(id)a3 storesByIdentifier:(id)a4 scope:(int64_t)a5 completionHandler:(id)a6;
- (void)configurationUIForConfiguration:(id)a3 scope:(int64_t)a4 completionHandler:(id)a5;
@end

@implementation AccountApplicator

- (AccountApplicator)init
{
  v3 = objc_opt_new();
  v4 = [(AccountApplicator *)self initWithAdapter:v3];

  return v4;
}

- (AccountApplicator)initWithAdapter:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AccountApplicator;
  v6 = [(AccountApplicator *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_adapter, a3);
  }

  return v7;
}

+ (id)supportedConfigurationTypes
{
  v2 = +[RMModelAccountCalDAVDeclaration registeredIdentifier];
  v3 = +[RMModelAccountCardDAVDeclaration registeredIdentifier];
  v4 = +[RMModelAccountExchangeDeclaration registeredIdentifier];
  id v5 = +[RMModelAccountGoogleDeclaration registeredIdentifier];
  v6 = +[RMModelAccountLDAPDeclaration registeredIdentifier];
  v7 = +[RMModelAccountMailDeclaration registeredIdentifier];
  v8 = +[RMModelAccountSubscribedCalendarDeclaration registeredIdentifier];
  objc_super v9 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v2, v3, v4, v5, v6, v7, v8, 0);

  return v9;
}

- (void)applyConfigurations:(id)a3 storesByIdentifier:(id)a4 scope:(int64_t)a5 completionHandler:(id)a6
{
  id v60 = a3;
  id v58 = a4;
  id v59 = a6;
  v8 = +[RMManagedDevice currentManagedDevice];
  LODWORD(a4) = [v8 isSharediPad];

  if ((a4 ^ 1) == a5)
  {
    objc_super v9 = [(AccountApplicator *)self adapter];
    v57 = [v9 getRemotelyManagedAccounts];

    v10 = [v57 objectForKeyedSubscript:@"Managed"];
    id v63 = [v10 mutableCopy];

    v11 = [v57 objectForKeyedSubscript:@"Orphaned"];
    v12 = [v11 allValues];
    id v56 = [v12 mutableCopy];

    group = dispatch_group_create();
    long long v91 = 0u;
    long long v92 = 0u;
    long long v93 = 0u;
    long long v94 = 0u;
    id obj = v60;
    id v64 = [obj countByEnumeratingWithState:&v91 objects:v104 count:16];
    if (v64)
    {
      uint64_t v62 = *(void *)v92;
      do
      {
        v13 = 0;
        do
        {
          if (*(void *)v92 != v62) {
            objc_enumerationMutation(obj);
          }
          v14 = *(void **)(*((void *)&v91 + 1) + 8 * (void)v13);
          dispatch_group_enter(group);
          v15 = [v14 store];
          id v16 = [v15 scope];
          v17 = +[RMManagedDevice currentManagedDevice];
          unsigned int v18 = [v17 isSharediPad];

          if (v16 == (id)(v18 ^ 1))
          {
            v19 = [(AccountApplicator *)self adapter];
            v20 = [v19 accountKeyFromConfiguration:v14];

            *(void *)v100 = 0;
            *(void *)&v100[8] = v100;
            *(void *)&v100[16] = 0x3032000000;
            v101 = sub_100004A84;
            v102 = sub_100004A94;
            id v103 = [v63 objectForKeyedSubscript:v20];
            uint64_t v21 = [*(id *)(*(void *)&v100[8] + 40) identifier];
            v22 = (void *)v21;
            v23 = &stru_10001CEA8;
            if (v21) {
              v23 = (__CFString *)v21;
            }
            v24 = v23;

            v25 = [*(id *)(*(void *)&v100[8] + 40) accountType];
            uint64_t v26 = [v25 accountTypeDescription];
            v27 = (void *)v26;
            v28 = &stru_10001CEA8;
            if (v26) {
              v28 = (__CFString *)v26;
            }
            v29 = v28;

            [v63 removeObjectForKey:v20];
            if (!*(void *)(*(void *)&v100[8] + 40)) {
              goto LABEL_20;
            }
            v30 = [(AccountApplicator *)self adapter];
            v31 = [v30 combinedServerTokensFromConfiguration:v14];
            v32 = [*(id *)(*(void *)&v100[8] + 40) objectForKeyedSubscript:@"RemoteManagementServerTokens"];
            unsigned int v33 = [v31 isEqualToString:v32];

            if (v33)
            {
              v34 = +[RMLog accountApplicator];
              if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138543618;
                v97 = v24;
                __int16 v98 = 2114;
                v99 = v29;
                _os_log_debug_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEBUG, "Skipping unchanged configuration for account %{public}@ of type %{public}@", buf, 0x16u);
              }

              dispatch_group_leave(group);
            }
            else
            {
LABEL_20:
              v37 = +[RMLog accountApplicator];
              if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
              {
                v40 = [v14 declaration];
                v41 = [v40 declarationIdentifier];
                *(_DWORD *)buf = 138543362;
                v97 = v41;
                _os_log_debug_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEBUG, "Processing configuration: %{public}@", buf, 0xCu);
              }
              v38 = [(AccountApplicator *)self adapter];
              uint64_t v39 = *(void *)(*(void *)&v100[8] + 40);
              v79[0] = _NSConcreteStackBlock;
              v79[1] = 3221225472;
              v79[2] = sub_100004A9C;
              v79[3] = &unk_10001C708;
              v79[4] = v14;
              id v80 = v15;
              v81 = group;
              v85 = v100;
              v82 = v24;
              v83 = v29;
              v84 = self;
              int64_t v86 = a5;
              [v38 accountPropertiesFromConfiguration:v14 account:v39 completionHandler:v79];
            }
            _Block_object_dispose(v100, 8);
          }
          else
          {
            v35 = +[RMLog accountApplicator];
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG)) {
              sub_1000146E8(&v89, v90, v35);
            }

            v36 = [v14 declaration];
            v87[0] = _NSConcreteStackBlock;
            v87[1] = 3221225472;
            v87[2] = sub_100004A7C;
            v87[3] = &unk_10001C690;
            v88 = group;
            [v15 configurationFailedToApply:v36 error:0 completionHandler:v87];

            v20 = v88;
          }

          v13 = (char *)v13 + 1;
        }
        while (v64 != v13);
        id v64 = [obj countByEnumeratingWithState:&v91 objects:v104 count:16];
      }
      while (v64);
    }

    v42 = [v63 allValues];
    [v56 addObjectsFromArray:v42];

    long long v77 = 0u;
    long long v78 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    id v65 = v56;
    id v43 = [v65 countByEnumeratingWithState:&v75 objects:v95 count:16];
    if (v43)
    {
      uint64_t v44 = *(void *)v76;
      do
      {
        v45 = 0;
        do
        {
          if (*(void *)v76 != v44) {
            objc_enumerationMutation(v65);
          }
          v46 = *(void **)(*((void *)&v75 + 1) + 8 * (void)v45);
          dispatch_group_enter(group);
          v47 = [v46 identifier];
          v48 = [v46 accountType];
          v49 = [v48 accountTypeDescription];

          v50 = +[RMLog accountApplicator];
          if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)v100 = 138543618;
            *(void *)&v100[4] = v47;
            *(_WORD *)&v100[12] = 2114;
            *(void *)&v100[14] = v49;
            _os_log_debug_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEBUG, "Removing account: %{public}@ of type %{public}@", v100, 0x16u);
          }

          v51 = [(AccountApplicator *)self adapter];
          v71[0] = _NSConcreteStackBlock;
          v71[1] = 3221225472;
          v71[2] = sub_100004F2C;
          v71[3] = &unk_10001C730;
          id v72 = v47;
          id v73 = v49;
          v74 = group;
          id v52 = v49;
          id v53 = v47;
          [v51 removeAccount:v46 scope:a5 completionHandler:v71];

          v45 = (char *)v45 + 1;
        }
        while (v43 != v45);
        id v43 = [v65 countByEnumeratingWithState:&v75 objects:v95 count:16];
      }
      while (v43);
    }

    v54 = dispatch_get_global_queue(21, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100004FC0;
    block[3] = &unk_10001C758;
    id v70 = v59;
    dispatch_group_notify(group, v54, block);

    v55 = v59;
  }
  else
  {
    v55 = v59;
    [(AccountApplicator *)self _invalidateAllConfigurations:v60 completionHandler:v59];
  }
}

- (void)configurationUIForConfiguration:(id)a3 scope:(int64_t)a4 completionHandler:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  id v9 = [(AccountApplicator *)self adapter];
  [v9 configurationUIForConfiguration:v8 completionHandler:v7];
}

- (void)_invalidateAllConfigurations:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v18 = a4;
  if ([v5 count])
  {
    v6 = +[RMLog accountApplicator];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100014A08(v6);
    }
  }
  id v7 = dispatch_group_create();
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v8 = v5;
  id v9 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v24;
    do
    {
      v12 = 0;
      do
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v23 + 1) + 8 * (void)v12);
        dispatch_group_enter(v7);
        v14 = [v13 store];
        v15 = [v13 declaration];
        v21[0] = _NSConcreteStackBlock;
        v21[1] = 3221225472;
        v21[2] = sub_1000052C8;
        v21[3] = &unk_10001C690;
        v22 = v7;
        [v14 configurationFailedToApply:v15 error:0 completionHandler:v21];

        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v10);
  }

  id v16 = dispatch_get_global_queue(21, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000052D0;
  block[3] = &unk_10001C758;
  id v20 = v18;
  id v17 = v18;
  dispatch_group_notify(v7, v16, block);
}

- (void)_createAccountIfNeededAndApplyProperties:(id)a3 configuration:(id)a4 properties:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!v10)
  {
    v14 = +[RMLog accountApplicator];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      sub_100014B10(v11, v14);
    }

    v15 = [(AccountApplicator *)self adapter];
    id v16 = [v12 objectForKeyedSubscript:@"RemoteManagementAccountType"];
    id v10 = [v15 createAccountWithTypeIdentifier:v16];
  }
  id v17 = [v10 identifier];
  id v18 = +[RMLog accountApplicator];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
    sub_100014A4C((uint64_t)v17, v11, v18);
  }

  v19 = [(AccountApplicator *)self adapter];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1000054CC;
  v23[3] = &unk_10001C7A8;
  id v24 = v11;
  id v25 = v17;
  id v26 = v13;
  id v20 = v13;
  id v21 = v17;
  id v22 = v11;
  [v19 applyProperties:v12 toAccount:v10 configuration:v22 completionHandler:v23];
}

- (AccountAdapter)adapter
{
  return self->_adapter;
}

- (void).cxx_destruct
{
}

@end