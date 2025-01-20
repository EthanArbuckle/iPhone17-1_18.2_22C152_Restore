@interface MCNetworkUsageRulesPayloadHandler
+ (BOOL)_rebuildWiFiAssistConfigurationIncludingPayloads:(id)a3 excludingPayloads:(id)a4 error:(id *)a5;
+ (BOOL)_writeWiFiAssistConfiguration:(id)a3 withError:(id *)a4;
+ (id)_WiFiAssistConfigurationForPayloads:(id)a3 includingPayloads:(id)a4 excludingPayloads:(id)a5 error:(id *)a6;
+ (id)internalErrorWithCode:(int)a3;
+ (id)internalErrorWithCode:(int)a3 underlyingError:(id)a4;
- (BOOL)_installApplicationRulesFromPayload:(id)a3 outError:(id *)a4;
- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6;
- (void)remove;
- (void)setAside;
- (void)unsetAside;
@end

@implementation MCNetworkUsageRulesPayloadHandler

+ (id)internalErrorWithCode:(int)a3
{
  return [a1 internalErrorWithCode:*(void *)&a3 underlyingError:0];
}

+ (id)internalErrorWithCode:(int)a3 underlyingError:(id)a4
{
  uint64_t v4 = MCNetworkUsageRulesErrorDomain;
  uint64_t v5 = a3;
  id v6 = a4;
  v7 = MCErrorArray();
  v8 = +[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v4, v5, v7, v6, MCErrorTypeFatal, 0);

  return v8;
}

- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6
{
  v8 = [(MCNewPayloadHandler *)self payload];
  id v9 = [v8 applicationRules];

  if (!v9
    || (id v28 = 0,
        v10 = [(MCNetworkUsageRulesPayloadHandler *)self _installApplicationRulesFromPayload:v8 outError:&v28], id v9 = v28, v10))
  {
    v11 = [v8 SIMRules];

    if (v11)
    {
      v22 = a6;
      v12 = +[NSMutableArray array];
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      v13 = +[MCProfileHandler payloadsOfClass:objc_opt_class() installedBeforePayload:v8];
      id v14 = [v13 countByEnumeratingWithState:&v24 objects:v29 count:16];
      if (v14)
      {
        id v15 = v14;
        uint64_t v16 = *(void *)v25;
        do
        {
          for (i = 0; i != v15; i = (char *)i + 1)
          {
            if (*(void *)v25 != v16) {
              objc_enumerationMutation(v13);
            }
            v18 = *(void **)(*((void *)&v24 + 1) + 8 * i);
            v19 = [v18 SIMRules];

            if (v19) {
              [v12 addObject:v18];
            }
          }
          id v15 = [v13 countByEnumeratingWithState:&v24 objects:v29 count:16];
        }
        while (v15);
      }

      [v12 addObject:v8];
      id v23 = v9;
      [(id)objc_opt_class() _rebuildWiFiAssistConfigurationIncludingPayloads:v12 excludingPayloads:qword_1001058A8 error:&v23];
      id v20 = v23;

      id v9 = v20;
      a6 = v22;
    }
  }
  if (a6 && v9) {
    *a6 = v9;
  }

  return v9 == 0;
}

- (void)setAside
{
  v2 = [(MCNewPayloadHandler *)self payload];
  v3 = [v2 applicationRules];

  if (v3)
  {
    uint64_t v4 = +[MCNetworkUsageRulesPayload typeStrings];
    uint64_t v5 = [v4 firstObject];
    id v6 = MCNEProfileIngestionHandlerClassForPayload();

    if ([v6 lockConfigurations])
    {
      [v6 loadConfigurationsForceReloadFromDisk];
      v7 = [v2 persistentResourceID];
      id v8 = [v6 setAsideConfigurationName:v7 unsetAside:0];

      [v6 unlockConfigurations];
    }
    else
    {
      id v9 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Could not get NetworkExtension store lock.", buf, 2u);
      }
    }
  }
  unsigned int v10 = [v2 SIMRules];

  if (v10)
  {
    v11 = (void *)qword_1001058A8;
    if (!qword_1001058A8)
    {
      uint64_t v12 = +[NSMutableArray array];
      v13 = (void *)qword_1001058A8;
      qword_1001058A8 = v12;

      v11 = (void *)qword_1001058A8;
    }
    [v11 addObject:v2];
    id v19 = 0;
    unsigned __int8 v14 = [(id)objc_opt_class() _rebuildWiFiAssistConfigurationIncludingPayloads:0 excludingPayloads:qword_1001058A8 error:&v19];
    id v15 = v19;
    if ((v14 & 1) == 0)
    {
      uint64_t v16 = _MCLogObjects[0];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v17 = [v2 displayName];
        v18 = v17;
        if (!v17)
        {
          v18 = [v2 UUID];
        }
        *(_DWORD *)buf = 138543618;
        v21 = v18;
        __int16 v22 = 2114;
        id v23 = v15;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Failed to rebuild Wi-Fi Assist configuration excluding payload %{public}@: %{public}@", buf, 0x16u);
        if (!v17) {
      }
        }
    }
  }
}

- (void)unsetAside
{
  v2 = [(MCNewPayloadHandler *)self payload];
  v3 = [v2 applicationRules];

  if (v3)
  {
    uint64_t v4 = +[MCNetworkUsageRulesPayload typeStrings];
    uint64_t v5 = [v4 firstObject];
    id v6 = MCNEProfileIngestionHandlerClassForPayload();

    if ([v6 lockConfigurations])
    {
      [v6 loadConfigurationsForceReloadFromDisk];
      v7 = [v2 persistentResourceID];
      id v8 = [v6 setAsideConfigurationName:v7 unsetAside:1];

      [v6 unlockConfigurations];
    }
    else
    {
      id v9 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Could not get NetworkExtension store lock.", buf, 2u);
      }
    }
  }
  unsigned int v10 = [v2 SIMRules];

  if (v10)
  {
    [(id)qword_1001058A8 removeObject:v2];
    id v16 = 0;
    unsigned __int8 v11 = [(id)objc_opt_class() _rebuildWiFiAssistConfigurationIncludingPayloads:0 excludingPayloads:qword_1001058A8 error:&v16];
    id v12 = v16;
    if ((v11 & 1) == 0)
    {
      v13 = _MCLogObjects[0];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        unsigned __int8 v14 = [v2 displayName];
        id v15 = v14;
        if (!v14)
        {
          id v15 = [v2 UUID];
        }
        *(_DWORD *)buf = 138543618;
        v18 = v15;
        __int16 v19 = 2114;
        id v20 = v12;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Failed to rebuild Wi-Fi Assist configuration including payload %{public}@: %{public}@", buf, 0x16u);
        if (!v14) {
      }
        }
    }
  }
}

- (void)remove
{
  v3 = [(MCNewPayloadHandler *)self payload];
  uint64_t v4 = [v3 applicationRules];

  if (v4)
  {
    uint64_t v5 = +[MCNetworkUsageRulesPayload typeStrings];
    id v6 = [v5 firstObject];
    v7 = MCNEProfileIngestionHandlerClassForPayload();

    if ([v7 lockConfigurations])
    {
      [v7 loadConfigurationsForceReloadFromDisk];
      id v8 = [v3 persistentResourceID];

      if (v8)
      {
        id v9 = [v3 persistentResourceID];
        [v7 removeConfigurationWithIdentifier:v9];
      }
      else
      {
        unsigned __int8 v11 = _MCLogObjects[0];
        if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "NetworkUsageRules remove failed: empty configuration id", buf, 2u);
        }
      }
      [v7 updateDefaultAfterDeletingConfiguration];
      [v7 unlockConfigurations];
    }
    else
    {
      unsigned int v10 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Could not get NetworkExtension store lock. Skipping removal.", buf, 2u);
      }
    }
  }
  id v12 = [v3 SIMRules];

  if (v12)
  {
    v13 = [(MCNewPayloadHandler *)self profileHandler];
    unsigned int v14 = [v13 isSetAside];

    if (v14)
    {
      [(id)qword_1001058A8 removeObject:v3];
    }
    else
    {
      id v15 = +[NSMutableArray array];
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      id v16 = +[MCProfileHandler payloadsOfClass:objc_opt_class() removedBeforePayload:v3];
      id v17 = [v16 countByEnumeratingWithState:&v29 objects:v37 count:16];
      if (v17)
      {
        id v18 = v17;
        uint64_t v19 = *(void *)v30;
        do
        {
          for (i = 0; i != v18; i = (char *)i + 1)
          {
            if (*(void *)v30 != v19) {
              objc_enumerationMutation(v16);
            }
            v21 = *(void **)(*((void *)&v29 + 1) + 8 * i);
            __int16 v22 = [v21 SIMRules];

            if (v22) {
              [v15 addObject:v21];
            }
          }
          id v18 = [v16 countByEnumeratingWithState:&v29 objects:v37 count:16];
        }
        while (v18);
      }

      [v15 addObject:v3];
      id v28 = 0;
      unsigned __int8 v23 = [(id)objc_opt_class() _rebuildWiFiAssistConfigurationIncludingPayloads:0 excludingPayloads:v15 error:&v28];
      id v24 = v28;
      if ((v23 & 1) == 0)
      {
        long long v25 = _MCLogObjects[0];
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          long long v26 = [v3 displayName];
          long long v27 = v26;
          if (!v26)
          {
            long long v27 = [v3 UUID];
          }
          *(_DWORD *)buf = 138543618;
          v34 = v27;
          __int16 v35 = 2114;
          id v36 = v24;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "Failed to rebuild Wi-Fi Assist configuration excluding payload %{public}@: %{public}@", buf, 0x16u);
          if (!v26) {
        }
          }
      }
    }
  }
}

- (BOOL)_installApplicationRulesFromPayload:(id)a3 outError:(id *)a4
{
  id v6 = a3;
  v7 = +[MCNetworkUsageRulesPayload typeStrings];
  id v8 = [v7 firstObject];
  id v9 = MCNEProfileIngestionHandlerClassForPayload();

  if ([v9 lockConfigurations])
  {
    unsigned int v10 = [v6 displayName];
    if (!v10)
    {
      unsigned int v10 = [v6 UUID];
    }
    [v9 loadConfigurationsForceReloadFromDisk];
    v34[0] = @"ApplicationRules";
    unsigned __int8 v11 = [v6 applicationRules];
    v34[1] = @"PayloadDisplayName";
    v35[0] = v11;
    v35[1] = v10;
    id v12 = +[NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:2];
    v13 = +[MCVPNPayloadBase NEVPNPayloadBaseDelegateWithConfigurationDict:v12];

    unsigned int v14 = +[MCNetworkUsageRulesPayload typeStrings];
    id v15 = [v14 firstObject];
    [v9 createConfigurationFromPayload:v13 payloadType:v15];

    id v16 = [v9 ingestedConfiguration];
    if (v16)
    {
      id v17 = [v6 UUID];
      id v18 = [v6 organization];
      [v16 setPayloadInfoCommon:v17 payloadOrganization:v18];

      uint64_t v19 = [(MCNewPayloadHandler *)self profileHandler];
      id v20 = [v19 profile];

      v32[0] = kMCPayloadUUIDKey;
      v21 = [v20 UUID];
      v33[0] = v21;
      v32[1] = kMCPayloadIdentifierKey;
      uint64_t v22 = [v20 identifier];
      v33[1] = v22;
      unsigned __int8 v23 = +[NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:2];

      [v16 setProfileInfo:v23];
      [v9 updateDefaultAfterAddingConfiguration];
      id v24 = [v16 getConfigurationIdentifier];
      [v6 setPersistentResourceID:v24];

      id v30 = 0;
      LOBYTE(v22) = [v9 saveIngestedConfiguration:&v30];
      id v25 = v30;
      if ((v22 & 1) == 0)
      {
        uint64_t v26 = +[MCNetworkUsageRulesPayloadHandler internalErrorWithCode:41002 underlyingError:v25];

        id v25 = (id)v26;
      }
    }
    else
    {
      id v25 = +[MCNetworkUsageRulesPayloadHandler internalErrorWithCode:41001];
    }
    [v9 unlockConfigurations];
    BOOL v28 = v25 == 0;
    if (a4 && v25) {
      *a4 = v25;
    }
  }
  else
  {
    long long v27 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "Could not get NetworkExtension store lock.", buf, 2u);
    }
    if (a4)
    {
      +[MCNetworkUsageRulesPayloadHandler internalErrorWithCode:41000];
      BOOL v28 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v28 = 0;
    }
  }

  return v28;
}

+ (BOOL)_rebuildWiFiAssistConfigurationIncludingPayloads:(id)a3 excludingPayloads:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = +[NSMutableArray array];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  unsigned int v10 = +[MCManifest sharedManifest];
  unsigned __int8 v11 = [v10 allInstalledPayloadsOfClass:objc_opt_class()];

  id v12 = [v11 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v27;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v27 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        id v17 = [v16 SIMRules];

        if (v17) {
          [v9 addObject:v16];
        }
      }
      id v13 = [v11 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v13);
  }

  id v25 = 0;
  id v18 = [a1 _WiFiAssistConfigurationForPayloads:v9 includingPayloads:v7 excludingPayloads:v8 error:&v25];
  id v19 = v25;
  if (v19)
  {
    id v20 = v19;
    unsigned __int8 v21 = 0;
  }
  else
  {
    id v24 = 0;
    unsigned __int8 v21 = [a1 _writeWiFiAssistConfiguration:v18 withError:&v24];
    id v20 = v24;
  }
  if (a5 && v20) {
    *a5 = v20;
  }

  return v21;
}

+ (id)_WiFiAssistConfigurationForPayloads:(id)a3 includingPayloads:(id)a4 excludingPayloads:(id)a5 error:(id *)a6
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v9 count] || objc_msgSend(v10, "count"))
  {
    v89[0] = _NSConcreteStackBlock;
    v89[1] = 3221225472;
    v89[2] = sub_1000261F4;
    v89[3] = &unk_1000EB8A8;
    id v90 = v9;
    id v91 = v10;
    unsigned __int8 v11 = [v8 indexesOfObjectsPassingTest:v89];
    [v8 removeObjectsAtIndexes:v11];
  }
  if ([v9 count]) {
    [v8 addObjectsFromArray:v9];
  }
  id v66 = v9;
  id v12 = +[NSMutableSet set];
  long long v85 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  id v13 = v8;
  id v54 = v10;
  v55 = v13;
  v68 = v12;
  id v51 = [v13 countByEnumeratingWithState:&v85 objects:v102 count:16];
  if (!v51) {
    goto LABEL_39;
  }
  uint64_t v14 = *(void *)v86;
  uint64_t v59 = kMCNetworkUsageRulesPayloadSIMRulesICCIDsKey;
  uint64_t v58 = MCNetworkUsageRulesErrorDomain;
  uint64_t v57 = MCErrorTypeFatal;
  uint64_t v50 = *(void *)v86;
LABEL_8:
  uint64_t v15 = 0;
  id v16 = v66;
  while (1)
  {
    if (*(void *)v86 != v14) {
      objc_enumerationMutation(v13);
    }
    uint64_t v52 = v15;
    id v17 = *(void **)(*((void *)&v85 + 1) + 8 * v15);
    long long v81 = 0u;
    long long v82 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    id obj = [v17 SIMRules];
    id v62 = [obj countByEnumeratingWithState:&v81 objects:v101 count:16];
    if (v62) {
      break;
    }
LABEL_37:

    uint64_t v15 = v52 + 1;
    id v13 = v55;
    uint64_t v14 = v50;
    if ((id)(v52 + 1) == v51)
    {
      id v51 = [v55 countByEnumeratingWithState:&v85 objects:v102 count:16];
      if (!v51)
      {
LABEL_39:

        long long v32 = +[NSMutableArray array];
        long long v73 = 0u;
        long long v74 = 0u;
        long long v75 = 0u;
        long long v76 = 0u;
        id v61 = v13;
        id v65 = [v61 countByEnumeratingWithState:&v73 objects:v95 count:16];
        if (v65)
        {
          uint64_t v63 = *(void *)v74;
          uint64_t v33 = kMCNetworkUsageRulesPayloadSIMRulesICCIDsKey;
          uint64_t v34 = kMCNetworkUsageRulesPayloadSIMRulesWiFiAssistPolicyKey;
          do
          {
            uint64_t v35 = 0;
            do
            {
              if (*(void *)v74 != v63) {
                objc_enumerationMutation(v61);
              }
              uint64_t v67 = v35;
              id v36 = *(void **)(*((void *)&v73 + 1) + 8 * v35);
              long long v69 = 0u;
              long long v70 = 0u;
              long long v71 = 0u;
              long long v72 = 0u;
              v37 = [v36 SIMRules];
              id v38 = [v37 countByEnumeratingWithState:&v69 objects:v94 count:16];
              if (v38)
              {
                id v39 = v38;
                uint64_t v40 = *(void *)v70;
                do
                {
                  for (i = 0; i != v39; i = (char *)i + 1)
                  {
                    if (*(void *)v70 != v40) {
                      objc_enumerationMutation(v37);
                    }
                    v42 = *(void **)(*((void *)&v69 + 1) + 8 * i);
                    v43 = +[NSMutableDictionary dictionary];
                    v44 = [v42 objectForKeyedSubscript:v33];
                    [v43 setObject:v44 forKeyedSubscript:@"ICCIDs"];

                    v45 = [v42 objectForKeyedSubscript:v34];
                    [v43 setObject:v45 forKeyedSubscript:@"Wi-Fi Assist Policy"];

                    [v32 addObject:v43];
                  }
                  id v39 = [v37 countByEnumeratingWithState:&v69 objects:v94 count:16];
                }
                while (v39);
              }

              uint64_t v35 = v67 + 1;
            }
            while ((id)(v67 + 1) != v65);
            id v65 = [v61 countByEnumeratingWithState:&v73 objects:v95 count:16];
          }
          while (v65);
        }

        v92[0] = @"Version";
        v92[1] = @"Profiles";
        v93[0] = &off_1000F5158;
        v93[1] = v32;
        v46 = +[NSDictionary dictionaryWithObjects:v93 forKeys:v92 count:2];

        id v31 = 0;
        id v16 = v66;
        v47 = v54;
        v48 = v55;
        goto LABEL_58;
      }
      goto LABEL_8;
    }
  }
  id v60 = *(id *)v82;
LABEL_13:
  uint64_t v18 = 0;
  while (1)
  {
    if (*(id *)v82 != v60) {
      objc_enumerationMutation(obj);
    }
    id v19 = [*(id *)(*((void *)&v81 + 1) + 8 * v18) objectForKeyedSubscript:v59];
    long long v77 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    id v20 = v19;
    id v21 = [v20 countByEnumeratingWithState:&v77 objects:v100 count:16];
    if (v21) {
      break;
    }
LABEL_33:

LABEL_35:
    if ((id)++v18 == v62)
    {
      id v62 = [obj countByEnumeratingWithState:&v81 objects:v101 count:16];
      if (!v62) {
        goto LABEL_37;
      }
      goto LABEL_13;
    }
  }
  id v22 = v21;
  uint64_t v23 = *(void *)v78;
LABEL_18:
  uint64_t v24 = 0;
  while (1)
  {
    if (*(void *)v78 != v23) {
      objc_enumerationMutation(v20);
    }
    id v25 = *(void **)(*((void *)&v77 + 1) + 8 * v24);
    long long v26 = [v25 uppercaseString];
    if ([v12 containsObject:v26]) {
      break;
    }
    [v12 addObject:v26];
LABEL_31:

    if (v22 == (id)++v24)
    {
      id v22 = [v20 countByEnumeratingWithState:&v77 objects:v100 count:16];
      if (v22) {
        goto LABEL_18;
      }
      goto LABEL_33;
    }
  }
  if (([v16 containsObject:v17] & 1) == 0)
  {
    long long v27 = _MCLogObjects[0];
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      long long v28 = [v17 displayName];
      long long v29 = v28;
      if (!v28)
      {
        v64 = [v17 UUID];
        long long v29 = v64;
      }
      *(_DWORD *)buf = 138543618;
      v97 = v29;
      __int16 v98 = 2114;
      v99 = v25;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "Found pre-existing conflicting ICCIDs while rebuilding configuration for Network Usage Rules payload %{public}@: %{public}@", buf, 0x16u);
      if (!v28) {

      }
      id v16 = v66;
    }

    id v12 = v68;
    goto LABEL_31;
  }
  id v30 = MCErrorArray();
  id v16 = v66;
  +[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v58, 41003, v30, 0, v57, v25, 0);
  id v31 = (id)objc_claimAutoreleasedReturnValue();

  id v12 = v68;
  if (!v31) {
    goto LABEL_35;
  }

  v48 = v55;
  if (a6)
  {
    id v31 = v31;
    v46 = 0;
    *a6 = v31;
  }
  else
  {
    v46 = 0;
  }
  v47 = v54;
LABEL_58:

  return v46;
}

+ (BOOL)_writeWiFiAssistConfiguration:(id)a3 withError:(id *)a4
{
  id v5 = a3;
  id v6 = MCSystemGroupContainerPathWithGroupIdentifier();
  id v7 = v6;
  if (!v6)
  {
    id v12 = 0;
    goto LABEL_17;
  }
  id v8 = [v6 stringByAppendingFormat:@"/%@", @"Library/Preferences"];
  char v31 = 0;
  id v9 = +[NSFileManager defaultManager];
  unsigned int v10 = [v9 fileExistsAtPath:v8 isDirectory:&v31];

  if (v10) {
    BOOL v11 = v31 == 0;
  }
  else {
    BOOL v11 = 0;
  }
  if (v11)
  {
    id v13 = +[NSFileManager defaultManager];
    id v30 = 0;
    unsigned int v14 = [v13 removeItemAtPath:v8 error:&v30];
    id v12 = v30;

    if (v14)
    {

      id v12 = 0;
LABEL_11:
      uint64_t v15 = +[NSFileManager defaultManager];
      id v29 = v12;
      [v15 createDirectoryAtPath:v8 withIntermediateDirectories:1 attributes:0 error:&v29];
      id v16 = v29;

      id v12 = v16;
      goto LABEL_12;
    }
  }
  else
  {
    id v12 = 0;
  }
  if ((v10 & 1) == 0) {
    goto LABEL_11;
  }
LABEL_12:
  if (!v12)
  {
    id v17 = [v8 stringByAppendingFormat:@"/%@", @"com.apple.WiFiAssist.configuration.plist"];
    id v28 = 0;
    uint64_t v18 = +[NSPropertyListSerialization dataWithPropertyList:v5 format:200 options:0 error:&v28];
    id v19 = v28;
    id v12 = v19;
    if (v18)
    {
      id v27 = v19;
      [v18 writeToFile:v17 options:1 error:&v27];
      id v20 = v27;

      id v12 = v20;
    }
  }
LABEL_17:
  if (v7) {
    BOOL v21 = v12 == 0;
  }
  else {
    BOOL v21 = 0;
  }
  BOOL v22 = v21;
  if (a4 && !v22)
  {
    uint64_t v23 = MCNetworkUsageRulesErrorDomain;
    uint64_t v24 = [@"ERROR_NETWORK_USAGE_CANNOT_WRITE_WIFI_ASSIST_CONFIGURATION" MCAppendGreenteaSuffix];
    id v25 = MCErrorArray();
    +[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v23, 41004, v25, v12, MCErrorTypeFatal, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v22;
}

@end