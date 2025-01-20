@interface MCExtensibleSingleSignOnPayloadHandler
+ (BOOL)_writeConfiguration:(id)a3 withError:(id *)a4;
+ (BOOL)rebuildConfigurationIncludingPayloads:(id)a3 excludingPayloads:(id)a4 error:(id *)a5;
+ (id)_configurationForPayloads:(id)a3 includingPayloads:(id)a4 excludingPayloads:(id)a5 error:(id *)a6;
- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6;
- (void)remove;
- (void)setAside;
- (void)unsetAside;
@end

@implementation MCExtensibleSingleSignOnPayloadHandler

- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6
{
  v7 = [(MCNewPayloadHandler *)self payload];
  v8 = +[MCProfileHandler payloadsOfClass:objc_opt_class() installedBeforePayload:v7];
  id v9 = [v8 mutableCopy];

  [v9 addObject:v7];
  id v15 = 0;
  [(id)objc_opt_class() rebuildConfigurationIncludingPayloads:v9 excludingPayloads:qword_100105A98 error:&v15];
  id v10 = v15;

  if (v10)
  {
    if (a6) {
      *a6 = v10;
    }
  }
  else
  {
    os_log_t v11 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
    {
      v12 = v11;
      v13 = [v7 esso_extensionIdentifier];
      *(_DWORD *)buf = 138543362;
      v17 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Installed Extensible SSO extension for %{public}@", buf, 0xCu);
    }
  }

  return v10 == 0;
}

- (void)remove
{
  v3 = [(MCNewPayloadHandler *)self payload];
  v4 = [(MCNewPayloadHandler *)self profileHandler];
  unsigned int v5 = [v4 isSetAside];

  if (!v5)
  {
    v6 = +[MCProfileHandler payloadsOfClass:objc_opt_class() removedBeforePayload:v3];
    id v7 = [v6 mutableCopy];

    [v7 addObject:v3];
    id v17 = 0;
    LODWORD(v6) = [(id)objc_opt_class() rebuildConfigurationIncludingPayloads:0 excludingPayloads:v7 error:&v17];
    id v8 = v17;
    if (v6)
    {
      os_log_t v9 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
      {
        id v10 = v9;
        os_log_t v11 = [v3 esso_extensionIdentifier];
        *(_DWORD *)buf = 138543362;
        v19 = v11;
        v12 = "Removed Extensible SSO payload for extension ID %{public}@";
LABEL_11:
        v14 = v10;
        os_log_type_t v15 = OS_LOG_TYPE_DEFAULT;
        uint32_t v16 = 12;
        goto LABEL_12;
      }
    }
    else
    {
      os_log_t v13 = _MCLogObjects[0];
      if (v8)
      {
        if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
        {
          id v10 = v13;
          os_log_t v11 = [v3 esso_extensionIdentifier];
          *(_DWORD *)buf = 138543618;
          v19 = v11;
          __int16 v20 = 2114;
          id v21 = v8;
          v12 = "Failed to remove Extensible SSO payload with extension ID %{public}@. Ignoring. Error: %{public}@";
          v14 = v10;
          os_log_type_t v15 = OS_LOG_TYPE_ERROR;
          uint32_t v16 = 22;
LABEL_12:
          _os_log_impl((void *)&_mh_execute_header, v14, v15, v12, buf, v16);
        }
      }
      else if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
      {
        id v10 = v13;
        os_log_t v11 = [v3 esso_extensionIdentifier];
        *(_DWORD *)buf = 138543362;
        v19 = v11;
        v12 = "Remove Extensible SSO payload: no extension found with extension ID %{public}@";
        goto LABEL_11;
      }
    }

    goto LABEL_14;
  }
  [(id)qword_100105A98 removeObject:v3];
LABEL_14:
}

- (void)setAside
{
  v2 = [(MCNewPayloadHandler *)self payload];
  v3 = (void *)qword_100105A98;
  if (!qword_100105A98)
  {
    uint64_t v4 = +[NSMutableArray array];
    unsigned int v5 = (void *)qword_100105A98;
    qword_100105A98 = v4;

    v3 = (void *)qword_100105A98;
  }
  [v3 addObject:v2];
  id v11 = 0;
  unsigned __int8 v6 = [(id)objc_opt_class() rebuildConfigurationIncludingPayloads:0 excludingPayloads:qword_100105A98 error:&v11];
  id v7 = v11;
  if ((v6 & 1) == 0)
  {
    os_log_t v8 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      os_log_t v9 = v8;
      id v10 = [v2 esso_extensionIdentifier];
      *(_DWORD *)buf = 138543618;
      os_log_t v13 = v10;
      __int16 v14 = 2114;
      id v15 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Failed to set aside Extensible SSO payload with extension ID %{public}@. Ignoring. Error: %{public}@", buf, 0x16u);
    }
  }
}

- (void)unsetAside
{
  v2 = [(MCNewPayloadHandler *)self payload];
  [(id)qword_100105A98 removeObject:v2];
  id v8 = 0;
  unsigned __int8 v3 = [(id)objc_opt_class() rebuildConfigurationIncludingPayloads:0 excludingPayloads:qword_100105A98 error:&v8];
  id v4 = v8;
  if ((v3 & 1) == 0)
  {
    os_log_t v5 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      unsigned __int8 v6 = v5;
      id v7 = [v2 esso_extensionIdentifier];
      *(_DWORD *)buf = 138543618;
      id v10 = v7;
      __int16 v11 = 2114;
      id v12 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Failed to restore Extensible SSO payload with extension ID %{public}@. Ignoring. Error: %{public}@", buf, 0x16u);
    }
  }
}

+ (BOOL)rebuildConfigurationIncludingPayloads:(id)a3 excludingPayloads:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = +[MCManifest sharedManifest];
  __int16 v11 = [v10 allInstalledPayloadsOfClass:objc_opt_class()];
  id v12 = [v11 mutableCopy];

  id v19 = 0;
  os_log_t v13 = [a1 _configurationForPayloads:v12 includingPayloads:v9 excludingPayloads:v8 error:&v19];

  id v14 = v19;
  if (v14)
  {
    id v15 = v14;
    unsigned __int8 v16 = 0;
    if (!a5) {
      goto LABEL_7;
    }
  }
  else
  {
    id v18 = 0;
    unsigned __int8 v16 = [a1 _writeConfiguration:v13 withError:&v18];
    id v15 = v18;
    if (!a5) {
      goto LABEL_7;
    }
  }
  if (v15) {
    *a5 = v15;
  }
LABEL_7:

  return v16;
}

+ (id)_configurationForPayloads:(id)a3 includingPayloads:(id)a4 excludingPayloads:(id)a5 error:(id *)a6
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v9 count] || objc_msgSend(v10, "count"))
  {
    v104[0] = _NSConcreteStackBlock;
    v104[1] = 3221225472;
    v104[2] = sub_100097D5C;
    v104[3] = &unk_1000EC590;
    id v105 = v9;
    id v106 = v10;
    __int16 v11 = [v8 indexesOfObjectsPassingTest:v104];
    [v8 removeObjectsAtIndexes:v11];
  }
  v71 = v10;
  if ([v9 count]) {
    [v8 addObjectsFromArray:v9];
  }
  id v12 = +[NSMutableSet set];
  os_log_t v13 = +[NSMutableSet set];
  long long v100 = 0u;
  long long v101 = 0u;
  long long v102 = 0u;
  long long v103 = 0u;
  id obj = v8;
  v82 = v12;
  v83 = v13;
  id v77 = [obj countByEnumeratingWithState:&v100 objects:v121 count:16];
  if (v77)
  {
    uint64_t v75 = *(void *)v101;
    uint64_t v73 = MCExtensibleSingleSignOnErrorDomain;
    uint64_t v72 = MCErrorTypeFatal;
LABEL_8:
    uint64_t v14 = 0;
    while (1)
    {
      if (*(void *)v101 != v75) {
        objc_enumerationMutation(obj);
      }
      id v15 = *(void **)(*((void *)&v100 + 1) + 8 * v14);
      unsigned __int8 v16 = [v15 esso_type];
      unsigned int v17 = [v16 isEqualToString:@"Credential"];

      if (v17)
      {
        long long v98 = 0uLL;
        long long v99 = 0uLL;
        long long v96 = 0uLL;
        long long v97 = 0uLL;
        id v18 = [v15 esso_hosts];
        id v19 = [v18 countByEnumeratingWithState:&v96 objects:v120 count:16];
        if (v19)
        {
          id v20 = v19;
          uint64_t v79 = v14;
          uint64_t v21 = *(void *)v97;
          while (2)
          {
            for (i = 0; i != v20; i = (char *)i + 1)
            {
              if (*(void *)v97 != v21) {
                objc_enumerationMutation(v18);
              }
              v23 = *(void **)(*((void *)&v96 + 1) + 8 * i);
              v24 = [v23 lowercaseString];
              if ([v12 containsObject:v24])
              {
                if ([v9 containsObject:v15])
                {
                  v69 = v23;
                  v38 = MCErrorArray();
                  +[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v73, 54007, v38, 0, v72, v69, 0);
                  id v37 = (id)objc_claimAutoreleasedReturnValue();
                  goto LABEL_41;
                }
                os_log_t v25 = _MCLogObjects[0];
                if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
                {
                  v26 = v25;
                  v27 = [v15 esso_extensionIdentifier];
                  *(_DWORD *)buf = 138543618;
                  v117 = v27;
                  __int16 v118 = 2114;
                  v119 = v23;
                  _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "Found pre-existing conflicting hosts while rebuilding configuration for Extensible SSO payload with extension ID %{public}@: %{public}@", buf, 0x16u);

                  id v12 = v82;
                }
              }
              else
              {
                [v12 addObject:v24];
              }
            }
            id v20 = [v18 countByEnumeratingWithState:&v96 objects:v120 count:16];
            if (v20) {
              continue;
            }
            break;
          }
LABEL_37:
          id v37 = 0;
LABEL_42:
          os_log_t v13 = v83;
          uint64_t v14 = v79;
          goto LABEL_43;
        }
      }
      else
      {
        long long v94 = 0uLL;
        long long v95 = 0uLL;
        long long v92 = 0uLL;
        long long v93 = 0uLL;
        id v18 = [v15 esso_URLs];
        id v28 = [v18 countByEnumeratingWithState:&v92 objects:v115 count:16];
        if (v28)
        {
          id v29 = v28;
          uint64_t v79 = v14;
          uint64_t v30 = *(void *)v93;
          while (2)
          {
            for (j = 0; j != v29; j = (char *)j + 1)
            {
              if (*(void *)v93 != v30) {
                objc_enumerationMutation(v18);
              }
              v32 = *(void **)(*((void *)&v92 + 1) + 8 * (void)j);
              v24 = [v32 normalizedURL];
              if ([v83 containsObject:v24])
              {
                if ([v9 containsObject:v15])
                {
                  v38 = [v32 absoluteString];
                  v39 = MCErrorArray();
                  +[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v73, 54005, v39, 0, v72, v38, 0);
                  id v37 = (id)objc_claimAutoreleasedReturnValue();

                  id v12 = v82;
LABEL_41:

                  goto LABEL_42;
                }
                os_log_t v33 = _MCLogObjects[0];
                if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
                {
                  v34 = v33;
                  v35 = [v15 esso_extensionIdentifier];
                  v36 = [v32 absoluteString];
                  *(_DWORD *)buf = 138543618;
                  v117 = v35;
                  __int16 v118 = 2114;
                  v119 = v36;
                  _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "Found pre-existing conflicting URLs while rebuilding configuration for Extensible SSO payload with extension ID %{public}@: %{public}@", buf, 0x16u);

                  id v12 = v82;
                }
              }
              else
              {
                [v83 addObject:v24];
              }
            }
            id v29 = [v18 countByEnumeratingWithState:&v92 objects:v115 count:16];
            if (v29) {
              continue;
            }
            goto LABEL_37;
          }
        }
      }
      id v37 = 0;
LABEL_43:

      if (v37)
      {

        if (a6)
        {
          id v37 = v37;
          v67 = 0;
          *a6 = v37;
        }
        else
        {
          v67 = 0;
        }
        goto LABEL_78;
      }
      if ((id)++v14 == v77)
      {
        id v77 = [obj countByEnumeratingWithState:&v100 objects:v121 count:16];
        if (v77) {
          goto LABEL_8;
        }
        break;
      }
    }
  }

  v40 = +[NSMutableArray array];
  long long v88 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  id v78 = obj;
  id v81 = [v78 countByEnumeratingWithState:&v88 objects:v114 count:16];
  if (v81)
  {
    uint64_t v80 = *(void *)v89;
    v76 = v40;
    do
    {
      for (k = 0; k != v81; k = (char *)k + 1)
      {
        if (*(void *)v89 != v80) {
          objc_enumerationMutation(v78);
        }
        v42 = *(void **)(*((void *)&v88 + 1) + 8 * (void)k);
        v43 = +[NSMutableDictionary dictionary];
        v44 = [v42 esso_type];
        [v43 setObject:v44 forKeyedSubscript:@"Type"];

        v45 = [v42 esso_realm];

        if (v45)
        {
          v46 = [v42 esso_realm];
          [v43 setObject:v46 forKeyedSubscript:@"Realm"];
        }
        v47 = [v42 esso_teamIdentifier];
        if (v47)
        {
          v112[0] = @"BundleIdentifier";
          v48 = [v42 esso_extensionIdentifier];
          v113[0] = v48;
          v112[1] = @"TeamIdentifier";
          v49 = [v42 esso_teamIdentifier];
          v113[1] = v49;
          v50 = +[NSDictionary dictionaryWithObjects:v113 forKeys:v112 count:2];
          [v43 setObject:v50 forKeyedSubscript:@"Extension"];
        }
        else
        {
          CFStringRef v110 = @"BundleIdentifier";
          v48 = [v42 esso_extensionIdentifier];
          v111 = v48;
          v49 = +[NSDictionary dictionaryWithObjects:&v111 forKeys:&v110 count:1];
          [v43 setObject:v49 forKeyedSubscript:@"Extension"];
        }

        v51 = [v42 esso_extensionData];

        if (v51)
        {
          v52 = [v42 esso_extensionData];
          [v43 setObject:v52 forKeyedSubscript:@"ExtensionData"];
        }
        v53 = [v42 esso_type];
        unsigned int v54 = [v53 isEqualToString:@"Credential"];

        if (v54)
        {
          v55 = [v42 esso_hosts];
          [v43 setObject:v55 forKeyedSubscript:@"Hosts"];
        }
        else
        {
          id v56 = v9;
          v55 = +[NSMutableArray array];
          long long v84 = 0u;
          long long v85 = 0u;
          long long v86 = 0u;
          long long v87 = 0u;
          v57 = [v42 esso_URLs];
          id v58 = [v57 countByEnumeratingWithState:&v84 objects:v109 count:16];
          if (v58)
          {
            id v59 = v58;
            uint64_t v60 = *(void *)v85;
            do
            {
              for (m = 0; m != v59; m = (char *)m + 1)
              {
                if (*(void *)v85 != v60) {
                  objc_enumerationMutation(v57);
                }
                v62 = [*(id *)(*((void *)&v84 + 1) + 8 * (void)m) absoluteString];
                [v55 addObject:v62];
              }
              id v59 = [v57 countByEnumeratingWithState:&v84 objects:v109 count:16];
            }
            while (v59);
          }

          [v43 setObject:v55 forKeyedSubscript:@"URLPrefix"];
          id v9 = v56;
          id v12 = v82;
          v40 = v76;
        }

        v63 = [v42 esso_screenLockedBehavior];

        if (v63)
        {
          v64 = [v42 esso_screenLockedBehavior];
          [v43 setObject:v64 forKeyedSubscript:@"ScreenLockedBehavior"];
        }
        v65 = [v42 esso_deniedBundleIdentifiers];

        if (v65)
        {
          v66 = [v42 esso_deniedBundleIdentifiers];
          [v43 setObject:v66 forKeyedSubscript:@"DeniedBundleIdentifiers"];
        }
        [v40 addObject:v43];
      }
      id v81 = [v78 countByEnumeratingWithState:&v88 objects:v114 count:16];
    }
    while (v81);
  }

  CFStringRef v107 = @"Profiles";
  v108 = v40;
  v67 = +[NSDictionary dictionaryWithObjects:&v108 forKeys:&v107 count:1];

  id v37 = 0;
  os_log_t v13 = v83;
LABEL_78:

  return v67;
}

+ (BOOL)_writeConfiguration:(id)a3 withError:(id *)a4
{
  id v5 = a3;
  dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 0;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = sub_1000981A4;
  os_log_t v25 = sub_1000981B4;
  id v26 = 0;
  id v7 = +[SOConfigurationManager defaultManager];
  uint64_t v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  unsigned __int8 v16 = sub_1000981BC;
  unsigned int v17 = &unk_1000EB618;
  id v19 = &v27;
  id v20 = &v21;
  id v8 = v6;
  id v18 = v8;
  [v7 saveConfigurationData:v5 completion:&v14];

  dispatch_time_t v9 = dispatch_time(0, 30000000000);
  if (!dispatch_semaphore_wait(v8, v9))
  {
    BOOL v12 = *((unsigned char *)v28 + 24) != 0;
    id v11 = (id)v22[5];
    if (!a4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  id v10 = MCErrorArray();
  +[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", MCExtensibleSingleSignOnErrorDomain, 54002, v10, 0, MCErrorTypeFatal, 0, v14, v15, v16, v17);
  id v11 = (id)objc_claimAutoreleasedReturnValue();

  BOOL v12 = 0;
  if (a4) {
LABEL_3:
  }
    *a4 = v11;
LABEL_4:

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return v12;
}

@end