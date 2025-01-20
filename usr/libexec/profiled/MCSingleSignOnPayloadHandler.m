@interface MCSingleSignOnPayloadHandler
- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6;
- (BOOL)preflightUserInputResponses:(id)a3 outError:(id *)a4;
- (id)userInputFields;
- (void)remove;
@end

@implementation MCSingleSignOnPayloadHandler

- (id)userInputFields
{
  v2 = [(MCNewPayloadHandler *)self payload];
  v3 = [v2 kerberosInfo];
  v4 = +[NSMutableArray array];
  v5 = [v3 principalName];
  id v6 = [v5 length];

  if (!v6)
  {
    v7 = MCLocalizedFormat();
    v8 = [v3 realm];
    v9 = MCLocalizedFormat();
    v10 = [v2 humanReadableName:v8];
    v11 = +[MCNewPayloadHandler promptDictionaryForKey:title:description:retypeDescription:finePrint:defaultValue:placeholderValue:minimumLength:fieldType:flags:](MCNewPayloadHandler, "promptDictionaryForKey:title:description:retypeDescription:finePrint:defaultValue:placeholderValue:minimumLength:fieldType:flags:", @"KPrincipalName", v7, v9, 0, v10, 0, 0, 1, 0);
    [v4 addObject:v11];
  }

  return v4;
}

- (BOOL)preflightUserInputResponses:(id)a3 outError:(id *)a4
{
  v5 = +[MCNewPayloadHandler prioritizeUserInput:a3 key:@"KPrincipalName" overField:0];
  id v6 = v5;
  if (v5 && [v5 rangeOfString:@"@"] != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v11 = MCSSOErrorDomain;
    v12 = MCErrorArray();
    +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v11, 34003, v12, MCErrorTypeNeedsRetry, 0);
    id v8 = (id)objc_claimAutoreleasedReturnValue();

    BOOL v7 = v8 != 0;
    if (a4 && v8)
    {
      id v8 = v8;
      *a4 = v8;
      BOOL v7 = 1;
    }
  }
  else
  {
    BOOL v7 = 0;
    id v8 = 0;
  }
  BOOL v9 = !v7;

  return v9;
}

- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6
{
  id v73 = a3;
  id v8 = a4;
  id v74 = a5;
  uint64_t v103 = 0;
  v104 = &v103;
  uint64_t v105 = 0x3032000000;
  v106 = sub_10009BC58;
  v107 = sub_10009BC68;
  id v108 = 0;
  v76 = v8;
  BOOL v9 = [v8 objectForKeyedSubscript:kMCInstallProfileOptionIsInstalledByMDM];
  LODWORD(a5) = [v9 BOOLValue];

  if (a5)
  {
    uint64_t v11 = kMDMPersonaKey;
    v12 = [v76 objectForKeyedSubscript:kMDMPersonaKey];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v75 = [v76 objectForKeyedSubscript:v11];
    }
    else
    {
      v75 = 0;
    }
  }
  else
  {
    v75 = 0;
  }
  v13 = [(MCNewPayloadHandler *)self payload];
  v14 = [v13 kerberosInfo];
  v15 = +[ACAccountStore defaultStore];
  v16 = [(MCNewPayloadHandler *)self userInputResponses];
  v17 = [v14 principalName];
  v77 = +[MCNewPayloadHandler prioritizeUserInput:v16 key:@"KPrincipalName" overField:v17];

  if (!v14)
  {
LABEL_44:
    v53 = (void *)v104[5];
    if (v53)
    {
      if (a6) {
        *a6 = v53;
      }
      v54 = [v14 accountGUID];

      if (v54)
      {
        v55 = [v14 accountGUID];
        v56 = [v15 accountWithIdentifier:v55];

        if (v56)
        {
          dispatch_semaphore_t v57 = dispatch_semaphore_create(0);
          v58 = dispatch_get_global_queue(0, 0);
          v82[0] = _NSConcreteStackBlock;
          v82[1] = 3221225472;
          v82[2] = sub_10009C01C;
          v82[3] = &unk_1000EC220;
          id v83 = v15;
          id v84 = v56;
          dispatch_semaphore_t v85 = v57;
          v59 = v57;
          dispatch_async(v58, v82);

          dispatch_semaphore_wait(v59, 0xFFFFFFFFFFFFFFFFLL);
        }
      }
      a5 = [v14 accountTypeGUID];

      if (a5)
      {
        v60 = [v14 accountTypeGUID];
        a5 = [v15 accountTypeWithAccountTypeIdentifier:v60];

        if (a5)
        {
          dispatch_semaphore_t v61 = dispatch_semaphore_create(0);
          v62 = dispatch_get_global_queue(0, 0);
          v78[0] = _NSConcreteStackBlock;
          v78[1] = 3221225472;
          v78[2] = sub_10009C1A8;
          v78[3] = &unk_1000EC220;
          id v79 = v15;
          id v80 = a5;
          dispatch_semaphore_t v81 = v61;
          v63 = v61;
          dispatch_async(v62, v78);

          dispatch_semaphore_wait(v63, 0xFFFFFFFFFFFFFFFFLL);
        }

        LOBYTE(a5) = 0;
      }
    }
    else
    {
      LOBYTE(a5) = 1;
    }
    goto LABEL_56;
  }
  if (![v77 length])
  {
    v21 = [v13 humanReadableName];
    v23 = MCErrorArray();
    uint64_t v24 = +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", MCSSOErrorDomain, 34002, v23, MCErrorTypeFatal, v21, 0);
    v25 = (void *)v104[5];
    v104[5] = v24;

    goto LABEL_13;
  }
  v18 = [v14 certificateUUID];

  if (v18)
  {
    v19 = [(MCNewPayloadHandler *)self profileHandler];
    v20 = [v14 certificateUUID];
    v71 = [v19 persistentIDForCertificateUUID:v20];

    if (!v71)
    {
      v21 = MCErrorArray();
      uint64_t v22 = +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", MCSSOErrorDomain, 34004, v21, MCErrorTypeFatal, 0);
      v23 = (void *)v104[5];
      v104[5] = v22;
LABEL_13:

      goto LABEL_44;
    }
  }
  else
  {
    v71 = 0;
  }
  v26 = [v14 realm];
  v69 = +[NSString stringWithFormat:@"%@@%@", v77, v26];

  v27 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v111 = v69;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "Creating Kerberos SSO account for %{public}@", buf, 0xCu);
  }
  v28 = +[NSString MCMakeUUID];
  v29 = +[NSString stringWithFormat:@"com.apple.account.kerberos.sso.%@", v28];

  id v30 = objc_alloc((Class)ACAccountType);
  v31 = [v13 humanReadableName];
  id v32 = [v30 initWithIdentifier:v29 description:v31];

  uint64_t v33 = ACCredentialTypeKerberos;
  [v32 setCredentialType:ACCredentialTypeKerberos];
  dispatch_semaphore_t v34 = dispatch_semaphore_create(0);
  v35 = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10009BC70;
  block[3] = &unk_1000EC6A8;
  id v65 = v15;
  id v97 = v65;
  id v36 = v32;
  id v98 = v36;
  id v37 = v14;
  id v99 = v37;
  id v68 = v29;
  id v100 = v68;
  v102 = &v103;
  dispatch_semaphore_t dsema = v34;
  dispatch_semaphore_t v101 = dsema;
  dispatch_async(v35, block);

  dispatch_semaphore_wait(dsema, 0xFFFFFFFFFFFFFFFFLL);
  if (v104[5])
  {
    int v38 = 2;
  }
  else
  {
    id v39 = [objc_alloc((Class)ACAccount) initWithAccountType:v36];
    [v39 setManagingOwnerIdentifier:kMCAccountManagingOwnerIdentifier];
    v40 = [v13 friendlyName];
    [v39 setManagingSourceName:v40];

    id v67 = [objc_alloc((Class)ACAccountCredential) initWithPassword:0];
    [v67 setCredentialType:v33];
    [v39 setAuthenticationType:kAccountAuthenticationTypeKerberos];
    [v39 setCredential:v67];
    [v39 setUsername:v69];
    if (v71) {
      [v39 setAccountProperty:v71 forKey:@"kGSSICCertificate"];
    }
    v41 = [v37 URLPrefixMatches];

    if (v41)
    {
      v42 = [v37 URLPrefixMatches];
      [v39 setAccountProperty:v42 forKey:@"domains"];
    }
    else
    {
      [v39 setAccountProperty:&off_1000F5348 forKey:@"domains"];
    }
    if (a5)
    {
      [v39 setAccountProperty:&__kCFBooleanTrue forKey:@"MCAccountIsManaged"];
      if ([v75 length]) {
        [v39 setAccountProperty:v75 forKey:ACAccountPropertyPersonaIdentifier];
      }
    }
    v90[0] = _NSConcreteStackBlock;
    v90[1] = 3221225472;
    v90[2] = sub_10009BDC0;
    v90[3] = &unk_1000EC6D0;
    id v43 = v65;
    id v91 = v43;
    a5 = v39;
    id v92 = a5;
    id v44 = v37;
    id v93 = v44;
    v95 = &v103;
    v94 = dsema;
    v45 = objc_retainBlock(v90);
    if ([v75 length]) {
      id v46 = +[DMCPersonaHelper performBlockUnderPersona:v75 block:v45];
    }
    else {
      ((void (*)(void *))v45[2])(v45);
    }
    if (v104[5])
    {
      int v38 = 2;
    }
    else
    {
      [v43 clearAllPermissionsGrantedForAccountType:v36];
      id v66 = a5;
      long long v88 = 0u;
      long long v89 = 0u;
      long long v86 = 0u;
      long long v87 = 0u;
      v47 = [v44 appIdentifierMatches];
      id v48 = [v47 countByEnumeratingWithState:&v86 objects:v109 count:16];
      if (v48)
      {
        uint64_t v49 = *(void *)v87;
        do
        {
          for (i = 0; i != v48; i = (char *)i + 1)
          {
            if (*(void *)v87 != v49) {
              objc_enumerationMutation(v47);
            }
            [v43 setPermissionGranted:1 forBundleID:*(void *)(*((void *)&v86 + 1) + 8 * i) onAccountType:v36];
          }
          id v48 = [v47 countByEnumeratingWithState:&v86 objects:v109 count:16];
        }
        while (v48);
      }

      a5 = v66;
      v51 = _MCLogObjects[0];
      if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
      {
        v52 = [v13 humanReadableName];
        *(_DWORD *)buf = 138543362;
        v111 = v52;
        _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_INFO, "Installed Kerberos account for %{public}@", buf, 0xCu);
      }
      int v38 = 0;
    }
  }
  if ((v38 | 2) == 2) {
    goto LABEL_44;
  }
LABEL_56:

  _Block_object_dispose(&v103, 8);
  return a5 & 1;
}

- (void)remove
{
  v3 = [(MCNewPayloadHandler *)self payload];
  v4 = [v3 kerberosInfo];
  os_log_t v5 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v5;
    BOOL v7 = [(MCNewPayloadHandler *)self payload];
    id v8 = [v7 UUID];
    BOOL v9 = [(MCNewPayloadHandler *)self payload];
    v10 = [v9 profile];
    [v10 identifier];
    uint64_t v11 = v41 = v3;
    v12 = [(MCNewPayloadHandler *)self payload];
    v13 = [v12 profile];
    v14 = [v13 UUID];
    *(_DWORD *)buf = 138543874;
    v53 = v8;
    __int16 v54 = 2114;
    v55 = v11;
    __int16 v56 = 2114;
    dispatch_semaphore_t v57 = v14;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Remove SSO payload with UUID %{public}@ in profile %{public}@ (%{public}@)", buf, 0x20u);

    v3 = v41;
  }
  os_log_t v15 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
  {
    v16 = v15;
    v17 = [v4 principalName];
    v18 = [v4 realm];
    *(_DWORD *)buf = 138543618;
    v53 = v17;
    __int16 v54 = 2114;
    v55 = v18;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "Remove SSO payload: principal name = %{public}@, realm = %{public}@", buf, 0x16u);
  }
  os_log_t v19 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    v20 = v19;
    v21 = [v4 accountGUID];
    *(_DWORD *)buf = 138543362;
    v53 = v21;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Remove SSO payload: looking for account with accountGUID = %{public}@", buf, 0xCu);
  }
  uint64_t v22 = [v4 accountGUID];

  if (v22)
  {
    v23 = +[ACAccountStore defaultStore];
    uint64_t v24 = [v4 accountGUID];
    v25 = [v23 accountWithIdentifier:v24];

    v26 = _MCLogObjects[0];
    BOOL v27 = os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT);
    if (v25)
    {
      if (v27)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Remove SSO payload: found account to remove", buf, 2u);
      }
      dispatch_semaphore_t v28 = dispatch_semaphore_create(0);
      v29 = dispatch_get_global_queue(0, 0);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10009C904;
      block[3] = &unk_1000EC160;
      id v48 = v23;
      id v49 = v25;
      id v50 = v3;
      dispatch_semaphore_t v51 = v28;
      id v30 = v28;
      dispatch_async(v29, block);
    }
    else if (v27)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Remove SSO payload: no account found to remove", buf, 2u);
    }
    os_log_t v31 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      id v32 = v31;
      uint64_t v33 = [v4 accountTypeGUID];
      *(_DWORD *)buf = 138543362;
      v53 = v33;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Remove SSO payload: looking for account type with accountTypeGUID = %{public}@", buf, 0xCu);
    }
    dispatch_semaphore_t v34 = [v4 accountTypeGUID];
    v35 = [v23 accountTypeWithAccountTypeIdentifier:v34];

    id v36 = _MCLogObjects[0];
    BOOL v37 = os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT);
    if (v35)
    {
      if (v37)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Remove SSO payload: found account type to remove", buf, 2u);
      }
      dispatch_semaphore_t v38 = dispatch_semaphore_create(0);
      id v39 = dispatch_get_global_queue(0, 0);
      v42[0] = _NSConcreteStackBlock;
      v42[1] = 3221225472;
      v42[2] = sub_10009CAE4;
      v42[3] = &unk_1000EC160;
      id v43 = v23;
      id v44 = v35;
      id v45 = v3;
      dispatch_semaphore_t v46 = v38;
      v40 = v38;
      dispatch_async(v39, v42);
    }
    else if (v37)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Remove SSO payload: no account type found to remove", buf, 2u);
    }
  }
}

@end