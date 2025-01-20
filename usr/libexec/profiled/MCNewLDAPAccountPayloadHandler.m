@interface MCNewLDAPAccountPayloadHandler
- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6;
- (BOOL)isInstalled;
- (BOOL)preflightUserInputResponses:(id)a3 outError:(id *)a4;
- (id)_accountFromPayloadWithUserInputResponses:(id)a3;
- (id)_errorFromValidationError:(id)a3;
- (id)_reallyInstallInstaller:(id)a3 isInstalledByMDM:(BOOL)a4 personaID:(id)a5 rmAccountIdentifier:(id)a6;
- (id)accountTypeIdentifiers;
- (id)accountValidationCompletionHandler;
- (id)unhashedAccountIdentifier;
- (id)userInputFields;
- (void)_preflightWithAccount:(id)a3 completionHandler:(id)a4;
- (void)account:(id)a3 isValid:(BOOL)a4 validationError:(id)a5;
- (void)remove;
- (void)setAccountValidationCompletionHandler:(id)a3;
- (void)setAsideWithInstaller:(id)a3;
- (void)setUserInputResponses:(id)a3;
- (void)unsetAside;
@end

@implementation MCNewLDAPAccountPayloadHandler

- (id)userInputFields
{
  v21.receiver = self;
  v21.super_class = (Class)MCNewLDAPAccountPayloadHandler;
  v3 = [(MCNewPayloadHandler *)&v21 userInputFields];
  id v4 = [v3 mutableCopy];

  v5 = [(MCNewPayloadHandler *)self payload];
  v6 = [v5 accountDescription];
  v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = [v5 hostname];
  }
  v9 = v8;

  v10 = [v5 username];

  if (!v10)
  {
    v11 = MCLocalizedString();
    v12 = MCLocalizedFormat();
    v13 = MCLocalizedString();
    v14 = +[MCNewPayloadHandler promptDictionaryForKey:title:description:retypeDescription:finePrint:defaultValue:placeholderValue:minimumLength:fieldType:flags:](MCNewPayloadHandler, "promptDictionaryForKey:title:description:retypeDescription:finePrint:defaultValue:placeholderValue:minimumLength:fieldType:flags:", @"kLDAPUsernameKey", v11, v12, 0, 0, 0, v13, 0, &_mh_execute_header);
    [v4 addObject:v14];
  }
  v15 = [v5 password];

  if (!v15)
  {
    v16 = MCLocalizedString();
    v17 = MCLocalizedFormat();
    v18 = MCLocalizedString();
    v19 = +[MCNewPayloadHandler promptDictionaryForKey:title:description:retypeDescription:finePrint:defaultValue:placeholderValue:minimumLength:fieldType:flags:](MCNewPayloadHandler, "promptDictionaryForKey:title:description:retypeDescription:finePrint:defaultValue:placeholderValue:minimumLength:fieldType:flags:", @"kLDAPPasswordKey", v16, v17, 0, 0, 0, v18, 0, 0x100000003);
    [v4 addObject:v19];
  }

  return v4;
}

- (void)setUserInputResponses:(id)a3
{
  id v4 = a3;
  v27 = self;
  v5 = [(MCNewPayloadHandler *)self payload];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v7)
  {
    id v9 = v7;
    uint64_t v10 = *(void *)v32;
    uint64_t v11 = kMCIDUUIDKey;
    CFStringRef v12 = @"kLDAPUsernameKey";
    uint64_t v29 = kMCIDResponseKey;
    *(void *)&long long v8 = 138543618;
    long long v26 = v8;
    do
    {
      v13 = 0;
      id v28 = v9;
      do
      {
        if (*(void *)v32 != v10) {
          objc_enumerationMutation(v6);
        }
        v14 = *(void **)(*((void *)&v31 + 1) + 8 * (void)v13);
        v15 = [v14 objectForKey:v11, v26];
        v16 = [v14 objectForKey:v29];
        if ([v15 isEqualToString:v12])
        {
          [v5 setUsername:v16];
        }
        else if ([v15 isEqualToString:@"kLDAPPasswordKey"])
        {
          [v5 setPassword:v16];
        }
        else
        {
          os_log_t v17 = _MCLogObjects[0];
          if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
          {
            v18 = v17;
            v19 = objc_opt_class();
            *(_DWORD *)buf = v26;
            v36 = v19;
            __int16 v37 = 2114;
            v38 = v15;
            CFStringRef v20 = v12;
            uint64_t v21 = v11;
            uint64_t v22 = v10;
            v23 = v5;
            id v24 = v6;
            id v25 = v19;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ didn't ask for user input for key %{public}@", buf, 0x16u);

            id v6 = v24;
            v5 = v23;
            uint64_t v10 = v22;
            uint64_t v11 = v21;
            CFStringRef v12 = v20;
            id v9 = v28;
          }
        }

        v13 = (char *)v13 + 1;
      }
      while (v9 != v13);
      id v9 = [v6 countByEnumeratingWithState:&v31 objects:v39 count:16];
    }
    while (v9);
  }

  v30.receiver = v27;
  v30.super_class = (Class)MCNewLDAPAccountPayloadHandler;
  [(MCNewPayloadHandler *)&v30 setUserInputResponses:v6];
}

- (id)unhashedAccountIdentifier
{
  v2 = [(MCNewPayloadHandler *)self payload];
  v3 = [v2 hostname];
  if (v3)
  {
    id v4 = +[NSString stringWithFormat:@"ldap|%@", v3];
  }
  else
  {
    id v4 = 0;
  }
  uint64_t v5 = [v2 username];
  id v6 = (void *)v5;
  if (v4 && v5)
  {
    uint64_t v7 = [v4 stringByAppendingFormat:@"|%@", v5];

    id v4 = (void *)v7;
  }

  return v4;
}

- (id)_accountFromPayloadWithUserInputResponses:(id)a3
{
  id v4 = a3;
  v83 = self;
  uint64_t v5 = [(MCNewPayloadHandler *)self payload];
  id v6 = sharedDAAccountStore();
  uint64_t v7 = [v6 accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierLDAP];

  id v8 = [objc_alloc((Class)ACAccount) initWithAccountType:v7];
  [v8 setManagingOwnerIdentifier:kMCAccountManagingOwnerIdentifier];
  id v9 = [v5 friendlyName];
  [v8 setManagingSourceName:v9];

  uint64_t v10 = +[MDMCloudConfiguration sharedConfiguration];
  unsigned int v11 = [v10 userMode];

  if (v11 == 1)
  {
    CFStringRef v12 = [(MCACAccountPayloadHandler *)v83 MCACAccountIdentifier];
    if (v12)
    {
      v13 = [v8 identifier];
      [v8 setAccountProperty:v13 forKey:@"MCAccountIdentifer"];

      [v8 setIdentifier:v12];
    }
    v14 = sharedDAAccountStore();
    v15 = [v8 identifier];
    v16 = [v14 accountWithIdentifier:v15];

    if (v16)
    {
      os_log_t v17 = [v16 objectID];
      [v8 performSelector:"_setObjectID:" withObject:v17];
    }
  }
  v18 = [v7 supportedDataclasses];
  long long v98 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  long long v101 = 0u;
  id v19 = [v18 countByEnumeratingWithState:&v98 objects:v108 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v99;
    do
    {
      for (i = 0; i != v20; i = (char *)i + 1)
      {
        if (*(void *)v99 != v21) {
          objc_enumerationMutation(v18);
        }
        [v8 setProvisioned:1 forDataclass:*(void *)(*((void *)&v98 + 1) + 8 * i)];
      }
      id v20 = [v18 countByEnumeratingWithState:&v98 objects:v108 count:16];
    }
    while (v20);
  }
  v23 = +[DAAccount daAccountSubclassWithBackingAccountInfo:v8];
  id v24 = v23;
  if (v23)
  {
    [v23 setEnabled:1 forDADataclass:8];
    id v25 = [v5 accountDescription];
    id v81 = v4;
    if (v25)
    {
      [v24 setAccountDescription:v25];
    }
    else
    {
      long long v26 = [v5 hostname];
      [v24 setAccountDescription:v26];
    }
    v27 = [v5 hostname];
    [v24 setHost:v27];

    [v24 setUseSSL:[v5 useSSL]];
    id v28 = [v24 backingAccountInfo];
    uint64_t v29 = [(MCNewPayloadHandler *)v83 payload];
    objc_super v30 = [v29 UUID];
    [v28 setMcPayloadUUID:v30];

    long long v31 = [v24 backingAccountInfo];
    long long v32 = [(MCNewPayloadHandler *)v83 payload];
    long long v33 = [v32 profile];
    long long v34 = [v33 UUID];
    [v31 setMcProfileUUID:v34];

    v35 = [v24 backingAccountInfo];
    v36 = [v5 communicationServiceRules];
    [v35 setCommunicationServiceRules:v36];

    __int16 v37 = [(MCNewPayloadHandler *)v83 payload];
    v38 = [v37 profile];
    uint64_t v39 = [v38 identifier];

    id v78 = v8;
    if (v39)
    {
      v40 = [v24 backingAccountInfo];
      [v40 setMcConfigurationProfileIdentifier:v39];

      v41 = v4;
    }
    else
    {
      v42 = _MCLogObjects[0];
      v41 = v4;
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, "Failed to retrieve profile identifier. Not setting profile identifier account property on LDAP account.", buf, 2u);
      }
    }
    v77 = v18;
    v89 = v24;
    v79 = v7;
    uint64_t v43 = [v5 username:v39];
    v80 = v5;
    v44 = [v5 password];
    long long v94 = 0u;
    long long v95 = 0u;
    long long v96 = 0u;
    long long v97 = 0u;
    id obj = v41;
    id v45 = [obj countByEnumeratingWithState:&v94 objects:v107 count:16];
    if (v45)
    {
      id v46 = v45;
      id v87 = *(id *)v95;
      uint64_t v47 = kMCIDUUIDKey;
      uint64_t v48 = kMCIDResponseKey;
      v49 = (void *)v43;
      do
      {
        for (j = 0; j != v46; j = (char *)j + 1)
        {
          if (*(id *)v95 != v87) {
            objc_enumerationMutation(obj);
          }
          v51 = *(void **)(*((void *)&v94 + 1) + 8 * (void)j);
          v52 = [v51 objectForKey:v47];
          v53 = [v51 objectForKey:v48];
          if ([v52 isEqualToString:@"kLDAPUsernameKey"])
          {
            id v54 = v53;

            v49 = v54;
          }
          else if ([v52 isEqualToString:@"kLDAPPasswordKey"])
          {
            id v55 = v53;

            v44 = v55;
          }
          else
          {
            os_log_t v56 = _MCLogObjects[0];
            if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
            {
              v57 = v56;
              v58 = objc_opt_class();
              *(_DWORD *)buf = 138543618;
              v104 = v58;
              __int16 v105 = 2114;
              v106 = v52;
              v59 = v44;
              v60 = v49;
              id v61 = v58;
              _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEFAULT, "%{public}@ didn't ask for user input for key %{public}@", buf, 0x16u);

              v49 = v60;
              v44 = v59;
            }
          }
        }
        id v46 = [obj countByEnumeratingWithState:&v94 objects:v107 count:16];
      }
      while (v46);
    }
    else
    {
      v49 = (void *)v43;
    }

    v62 = &__kCFBooleanTrue;
    if (!v44) {
      v62 = &__kCFBooleanFalse;
    }
    id v63 = v62;
    v64 = [v89 backingAccountInfo];
    v82 = v63;
    [v64 setAccountProperty:v63 forKey:ACAccountPropertyShouldNeverUseSyncableCredential];

    id obja = v49;
    [v89 setUsername:v49];
    v84 = v44;
    [v89 setPassword:v44];
    long long v92 = 0u;
    long long v93 = 0u;
    long long v90 = 0u;
    long long v91 = 0u;
    id v88 = [v80 searchSettings];
    id v65 = [v88 countByEnumeratingWithState:&v90 objects:v102 count:16];
    if (v65)
    {
      id v66 = v65;
      uint64_t v67 = *(void *)v91;
      do
      {
        for (k = 0; k != v66; k = (char *)k + 1)
        {
          if (*(void *)v91 != v67) {
            objc_enumerationMutation(v88);
          }
          v69 = *(void **)(*((void *)&v90 + 1) + 8 * (void)k);
          v70 = [v69 objectForKey:@"LDAPSearchSettingDescription"];
          v71 = [v69 objectForKey:@"LDAPSearchSettingSearchBase"];
          v72 = [v69 objectForKey:@"LDAPSearchSettingScope"];
          if ([v72 isEqualToString:@"LDAPSearchSettingScopeBase"])
          {
            uint64_t v73 = 0;
          }
          else if ([v72 isEqualToString:@"LDAPSearchSettingScopeOneLevel"])
          {
            uint64_t v73 = 1;
          }
          else
          {
            uint64_t v73 = 2;
          }
          id v74 = objc_alloc_init((Class)MCLDAPSearchSettingsClass());
          [v74 setSearchDescription:v70];
          [v74 setSearchBase:v71];
          [v74 setScope:v73];
          [v89 addSearchSettings:v74];
        }
        id v66 = [v88 countByEnumeratingWithState:&v90 objects:v102 count:16];
      }
      while (v66);
    }

    uint64_t v5 = v80;
    id v4 = v81;
    id v8 = v78;
    uint64_t v7 = v79;
    v18 = v77;
    id v24 = v89;
  }

  return v24;
}

- (id)_errorFromValidationError:(id)a3
{
  id v3 = a3;
  id v4 = [v3 code];
  if (v4 == (id)102)
  {
    uint64_t v11 = MCDAErrorDomain;
    id v6 = MCErrorArray();
    uint64_t v7 = MCLocalizedErrorString();
    id v8 = MCUSEnglishErrorString();
    uint64_t v18 = MCErrorTypeRetryable;
    uint64_t v9 = v11;
    uint64_t v10 = 18002;
    goto LABEL_7;
  }
  if (v4 == (id)101)
  {
    uint64_t v12 = MCDAErrorDomain;
    id v6 = MCErrorArray();
    uint64_t v7 = MCLocalizedErrorString();
    id v8 = MCUSEnglishErrorString();
    uint64_t v18 = MCErrorTypeSkippable;
    uint64_t v9 = v12;
    uint64_t v10 = 18001;
    goto LABEL_7;
  }
  if (v4 == (id)100)
  {
    uint64_t v5 = MCDAErrorDomain;
    id v6 = MCErrorArray();
    uint64_t v7 = MCLocalizedErrorString();
    id v8 = MCUSEnglishErrorString();
    uint64_t v18 = MCErrorTypeSkippable;
    uint64_t v9 = v5;
    uint64_t v10 = 18000;
LABEL_7:
    +[NSError MCErrorWithDomain:v9 code:v10 descriptionArray:v6 suggestion:v7 USEnglishSuggestion:v8 underlyingError:v3 errorType:v18];
    v13 = LABEL_8:;

    goto LABEL_9;
  }
  v15 = [v3 localizedDescription];
  id v16 = [v15 length];

  uint64_t v17 = MCDAErrorDomain;
  id v6 = MCErrorArray();
  if (!v16)
  {
    uint64_t v7 = MCLocalizedErrorString();
    id v8 = MCUSEnglishErrorString();
    +[NSError MCErrorWithDomain:v17 code:18000 descriptionArray:v6 suggestion:v7 USEnglishSuggestion:v8 underlyingError:0 errorType:MCErrorTypeFatal];
    goto LABEL_8;
  }
  v13 = +[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v17, 18000, v6, v3, MCErrorTypeFatal, 0);
LABEL_9:

  return v13;
}

- (void)account:(id)a3 isValid:(BOOL)a4 validationError:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  os_log_t v10 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = v10;
    uint64_t v12 = [v9 MCVerboseDescription];
    int v15 = 138543874;
    id v16 = v8;
    __int16 v17 = 1024;
    BOOL v18 = v6;
    __int16 v19 = 2114;
    id v20 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "account %{public}@ is valid %d with error %{public}@", (uint8_t *)&v15, 0x1Cu);
  }
  if (!v9 && !v6)
  {
    id v9 = +[NSError errorWithDomain:DAAccountValidationDomain code:102 userInfo:0];
  }
  v13 = [(MCNewLDAPAccountPayloadHandler *)self accountValidationCompletionHandler];

  if (v13)
  {
    v14 = [(MCNewLDAPAccountPayloadHandler *)self accountValidationCompletionHandler];
    ((void (**)(void, id))v14)[2](v14, v9);

    [(MCNewLDAPAccountPayloadHandler *)self setAccountValidationCompletionHandler:0];
  }
}

- (void)_preflightWithAccount:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  [(MCNewLDAPAccountPayloadHandler *)self setAccountValidationCompletionHandler:a4];
  sharedDAAccountStore();
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = dataaccess_get_global_queue();
  [v6 checkValidityOnAccountStore:v8 withConsumer:self inQueue:v7];
}

- (BOOL)preflightUserInputResponses:(id)a3 outError:(id *)a4
{
  id v6 = a3;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x3032000000;
  uint64_t v29 = sub_10006A1C4;
  objc_super v30 = sub_10006A1D4;
  id v31 = 0;
  uint64_t v7 = [(MCNewLDAPAccountPayloadHandler *)self _accountFromPayloadWithUserInputResponses:v6];
  if (v7)
  {
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_10006A1DC;
    v23[3] = &unk_1000EB5F0;
    id v25 = &v26;
    id v8 = dispatch_semaphore_create(0);
    id v24 = v8;
    [(MCNewLDAPAccountPayloadHandler *)self _preflightWithAccount:v7 completionHandler:v23];
    dispatch_time_t v9 = dispatch_time(0, 30000000000);
    dispatch_semaphore_wait(v8, v9);
    os_log_t v10 = v24;
  }
  else
  {
    id v8 = MCErrorArray();
    uint64_t v11 = +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", MCLDAPErrorDomain, 19000, v8, MCErrorTypeFatal, 0);
    os_log_t v10 = v27[5];
    v27[5] = v11;
  }

  uint64_t v12 = [(id)v27[5] MCErrorType];
  uint64_t v13 = MCErrorTypeSkippable;
  unsigned int v14 = [v12 isEqualToString:MCErrorTypeSkippable];

  if (v14)
  {
    int v15 = _MCLogObjects[0];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      id v16 = [(id)v27[5] MCVerboseDescription];
      *(_DWORD *)buf = 138543362;
      long long v33 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Swallowing skippable error %{public}@", buf, 0xCu);
    }
    __int16 v17 = (void *)v27[5];
    v27[5] = 0;
  }
  BOOL v18 = (void *)v27[5];
  if (!v18) {
    goto LABEL_12;
  }
  if (a4)
  {
    *a4 = v18;
    BOOL v18 = (void *)v27[5];
  }
  __int16 v19 = [v18 MCErrorType];
  unsigned int v20 = [v19 isEqualToString:v13];

  if (!v20) {
    BOOL v21 = 0;
  }
  else {
LABEL_12:
  }
    BOOL v21 = 1;

  _Block_object_dispose(&v26, 8);
  return v21;
}

- (id)_reallyInstallInstaller:(id)a3 isInstalledByMDM:(BOOL)a4 personaID:(id)a5 rmAccountIdentifier:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = [(MCNewPayloadHandler *)self payload];
  unsigned int v14 = [v13 hostname];

  if (v14)
  {
    int v15 = [(MCNewLDAPAccountPayloadHandler *)self _accountFromPayloadWithUserInputResponses:0];
    id v16 = v15;
    uint64_t v55 = 0;
    os_log_t v56 = &v55;
    uint64_t v57 = 0x3032000000;
    v58 = sub_10006A1C4;
    v59 = sub_10006A1D4;
    id v60 = 0;
    if (v15)
    {
      if (v8)
      {
        [v15 setAccountBoolProperty:1 forKey:@"MCAccountIsManaged"];
        if ([v11 length]) {
          [v16 setAccountProperty:v11 forKey:ACAccountPropertyPersonaIdentifier];
        }
        if (v12) {
          [v16 setAccountProperty:v12 forKey:ACAccountPropertyRemoteManagingAccountIdentifier];
        }
      }
      __int16 v17 = [v16 backingAccountInfo];
      [(MCACAccountPayloadHandler *)self markIfUpdatingOverInstalledAccount:v17];

      uint64_t v49 = 0;
      v50 = &v49;
      uint64_t v51 = 0x3032000000;
      v52 = sub_10006A1C4;
      v53 = sub_10006A1D4;
      dispatch_semaphore_t v54 = dispatch_semaphore_create(0);
      uint64_t v45 = 0;
      id v46 = &v45;
      uint64_t v47 = 0x2020000000;
      char v48 = 1;
      BOOL v18 = [v10 setAsideAccountIdentifiersForPayloadClass:objc_opt_class()];
      if ([v18 count])
      {
        __int16 v19 = [v16 backingAccountInfo];
        unsigned int v20 = +[DASharedAccountProperties DAAccountIdentifiersToIgnoreForUniquenessCheck];
        [v19 setAccountProperty:v18 forKey:v20];
      }
      BOOL v21 = sharedDAAccountStore();
      uint64_t v22 = [v16 backingAccountInfo];
      v44[0] = _NSConcreteStackBlock;
      v44[1] = 3221225472;
      v44[2] = sub_10006A7D8;
      v44[3] = &unk_1000EBE98;
      v44[4] = &v45;
      v44[5] = &v49;
      [v21 canSaveAccount:v22 withCompletionHandler:v44];

      dispatch_semaphore_wait((dispatch_semaphore_t)v50[5], 0xFFFFFFFFFFFFFFFFLL);
      if (*((unsigned char *)v46 + 24))
      {
        v23 = [v16 backingAccountInfo];
        [v23 setAuthenticated:1];

        v40[0] = _NSConcreteStackBlock;
        v40[1] = 3221225472;
        v40[2] = sub_10006A7F4;
        v40[3] = &unk_1000EAF68;
        v42 = &v49;
        id v41 = v16;
        uint64_t v43 = &v55;
        id v24 = objc_retainBlock(v40);
        if ([v11 length]) {
          id v25 = +[DMCPersonaHelper performBlockUnderPersona:v11 block:v24];
        }
        else {
          ((void (*)(void *))v24[2])(v24);
        }

        long long v32 = v41;
      }
      else
      {
        long long v32 = MCErrorArray();
        long long v33 = +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", MCLDAPErrorDomain, 19002, v32, MCErrorTypeFatal, 0);
        id v34 = [v33 MCCopyAsPrimaryError];
        v35 = (void *)v56[5];
        v56[5] = (uint64_t)v34;
      }
      _Block_object_dispose(&v45, 8);
      _Block_object_dispose(&v49, 8);
    }
    else
    {
      uint64_t v29 = MCErrorArray();
      uint64_t v30 = +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", MCLDAPErrorDomain, 19000, v29, MCErrorTypeFatal, 0);
      id v31 = (void *)v56[5];
      v56[5] = v30;
    }
    v36 = [v16 backingAccountInfo];
    __int16 v37 = [v36 identifier];
    v38 = [(MCNewPayloadHandler *)self payload];
    [v38 setAcAccountIdentifier:v37];

    id v28 = (id)v56[5];
    _Block_object_dispose(&v55, 8);
  }
  else
  {
    uint64_t v26 = MCLDAPErrorDomain;
    v27 = MCErrorArray();
    +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v26, 19001, v27, MCErrorTypeFatal, 0);
    id v28 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v28;
}

- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = [v10 objectForKeyedSubscript:kMCInstallProfileOptionIsInstalledByMDM];
  id v12 = [v11 BOOLValue];

  if (v12)
  {
    uint64_t v13 = kMDMPersonaKey;
    unsigned int v14 = [v10 objectForKeyedSubscript:kMDMPersonaKey];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v15 = [v10 objectForKeyedSubscript:v13];
    }
    else
    {
      int v15 = 0;
    }

    uint64_t v17 = kMCInstallProfileOptionManagingProfileIdentifier;
    BOOL v18 = [v10 objectForKeyedSubscript:kMCInstallProfileOptionManagingProfileIdentifier];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v16 = 0;
      goto LABEL_11;
    }
    uint64_t v19 = [v10 objectForKeyedSubscript:v17];

    if (v19)
    {
      unsigned int v20 = +[ACAccountStore defaultStore];
      BOOL v21 = [v20 dmc_remoteManagementAccountForManagementProfileIdentifier:v19];

      id v16 = [v21 identifier];

      BOOL v18 = (void *)v19;
LABEL_11:

      goto LABEL_12;
    }
  }
  else
  {
    int v15 = 0;
  }
  id v16 = 0;
LABEL_12:
  uint64_t v22 = [(MCNewLDAPAccountPayloadHandler *)self _reallyInstallInstaller:v9 isInstalledByMDM:v12 personaID:v15 rmAccountIdentifier:v16];
  v23 = v22;
  if (a6 && v22) {
    *a6 = v22;
  }

  return v23 == 0;
}

- (id)accountTypeIdentifiers
{
  uint64_t v4 = ACAccountTypeIdentifierLDAP;
  v2 = +[NSArray arrayWithObjects:&v4 count:1];

  return v2;
}

- (BOOL)isInstalled
{
  v2 = [(MCACAccountPayloadHandler *)self _installedDAAccount];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)setAsideWithInstaller:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MCNewLDAPAccountPayloadHandler;
  [(MCNewPayloadHandler *)&v10 setAsideWithInstaller:v4];
  uint64_t v5 = [(MCACAccountPayloadHandler *)self _installedDAAccount];
  id v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 backingAccountInfo];
    [(MCACAccountPayloadHandler *)self setSetAsideAccount:v7];

    BOOL v8 = [v6 backingAccountInfo];
    id v9 = [v8 identifier];
    [v4 addSetAsideAccountIdentifier:v9 forPayloadClass:objc_opt_class()];
  }
}

- (void)unsetAside
{
  id v14 = +[MDMCloudConfiguration sharedConfiguration];
  if ([v14 userMode] == 1)
  {
    BOOL v3 = [(MCACAccountPayloadHandler *)self setAsideAccount];

    if (v3)
    {
      id v4 = [(MCACAccountPayloadHandler *)self _installedDAAccount];
      uint64_t v5 = [(MCACAccountPayloadHandler *)self setAsideAccount];
      id v6 = [v5 accountPropertyForKey:@"MCAccountIdentifer"];

      uint64_t v7 = [v4 backingAccountInfo];
      BOOL v8 = [v7 accountPropertyForKey:@"MCAccountIdentifer"];

      if (v6 && (!v8 || ([v6 isEqualToString:v8] & 1) == 0))
      {
        id v9 = [(MCACAccountPayloadHandler *)self setAsideAccount];
        [v9 markAllPropertiesDirty];
        dispatch_semaphore_t v10 = dispatch_semaphore_create(0);
        id v11 = sharedDAAccountStore();
        v15[0] = _NSConcreteStackBlock;
        v15[1] = 3221225472;
        v15[2] = sub_10006AF10;
        v15[3] = &unk_1000EBEC0;
        id v16 = v9;
        dispatch_semaphore_t v17 = v10;
        id v12 = v10;
        id v13 = v9;
        [v11 saveVerifiedAccount:v13 withCompletionHandler:v15];

        dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
      }
      [(MCACAccountPayloadHandler *)self setSetAsideAccount:0];
    }
  }
  else
  {
  }
}

- (void)remove
{
  BOOL v3 = [(MCNewPayloadHandler *)self profileHandler];
  unsigned int v4 = [v3 isSetAside];

  if (!v4)
  {
    if ([(MCACAccountPayloadHandler *)self updatedOverInstalledAccount])
    {
      uint64_t v7 = 0;
      goto LABEL_11;
    }
    BOOL v8 = [(MCACAccountPayloadHandler *)self _installedDAAccount];
    uint64_t v7 = [v8 backingAccountInfo];

    if (!v7) {
      goto LABEL_11;
    }
LABEL_10:
    +[MCFeatureOverrides accountRemovalTimeoutWithDefaultValue:600.0];
    -[MCACAccountPayloadHandler _synchronouslyDeleteAccountAndAssociatedData:timeout:completion:](self, "_synchronouslyDeleteAccountAndAssociatedData:timeout:completion:", v7, 0);
    goto LABEL_11;
  }
  uint64_t v5 = +[MDMCloudConfiguration sharedConfiguration];
  unsigned int v6 = [v5 userMode];

  if (v6 == 1) {
    [(MCACAccountPayloadHandler *)self _installedSetAsideACAccount];
  }
  else {
  uint64_t v7 = [(MCACAccountPayloadHandler *)self setAsideAccount];
  }
  [(MCACAccountPayloadHandler *)self setSetAsideAccount:0];
  if (v7) {
    goto LABEL_10;
  }
LABEL_11:
}

- (id)accountValidationCompletionHandler
{
  return self->_accountValidationCompletionHandler;
}

- (void)setAccountValidationCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end